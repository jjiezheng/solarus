/*
 * Copyright (C) 2009 Christopho, Zelda Solarus - http://www.zelda-solarus.com
 * 
 * Zelda: Mystery of Solarus DX is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * Zelda: Mystery of Solarus DX is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */
package org.solarus.editor.entities;

import java.awt.*;
import org.solarus.editor.*;

/**
 * A teletransporter is an entity that moves the hero to a destination point
 * on another map or the same map.
 */
public class Teletransporter extends MapEntity {

    /**
     * Unitary size of a teletransporter.
     */
    private static final Dimension unitarySize = new Dimension(16, 16);

    /**
     * Description of the default image representing this kind of entity.
     */
    public static final EntityImageDescription[] generalImageDescriptions = {
	new EntityImageDescription("teletransporter.png", 0, 0, 32, 32)
    };

    /**
     * Resizable image of a teletransporter.
     */
    private static Image resizableTeletransporterImage;

    /**
     * The sprite representing this teletransporter.
     */
    private Sprite sprite;

    /**
     * Creates a new teletransporter.
     * @param map the map
     */
    public Teletransporter(Map map) throws MapException {
	super(map, 16, 16);
    }

    /**
     * Returns whether the entity has an identifier.
     * @return true
     */
    public boolean hasName() {
	return true;
    }

    /**
     * Returns whether or not the entity is currently resizable.
     * @return true if the entity is resizable
     */
    public boolean isResizable() {
	return true;
    }

    /**
     * Returns whether two entities of this type can have different
     * sizes, even if they are not resizable.
     * @return true
     */
    public boolean isSizeVariable() {
	return true;
    }

    /**
     * Returns the minimum size of the entity (for a resizable entity).
     * When the entity is resized, its new size must be a multiple of this minimum size.
     * @return (16,16)
     */
    public Dimension getUnitarySize() {
	return unitarySize;
    }

    /**
     * Sets the default values of all properties specific to the current entity type.
     */
    public void setPropertiesDefaultValues() throws MapException {
        setProperty("sprite", "");
        setProperty("sound", "");
	setProperty("transition", Transition.FADE.getId());
	setProperty("destinationMapId", map.getId());
	setProperty("destinationName", "");
    }

    /**
     * Sets a property specific to this kind of entity.
     * @param name name of the property
     * @param value value of the property
     */
    public void setProperty(String name, String value) throws MapException {

        super.setProperty(name, value);

        if (name.equals("sprite")) {

            if (value.length() > 0 && !value.equals("_none")) {
                sprite = new Sprite(value, map);
            }
            else {
                sprite = null;
            }
        }
    }

    /**
     * Checks the specific properties.
     * @throws MapException if a property is not valid
     */
    public void checkProperties() throws MapException {

        String spriteName = getProperty("sprite");
        String soundId = getProperty("sound");
	String destinationMapId = getProperty("destinationMapId");
	String destinationName = getProperty("destinationName");

        if (!isSpriteOrSoundNameValid(spriteName)) {
            throw new MapException("Invalid sprite name: '" + spriteName + "'");
        }

        if (!isSpriteOrSoundNameValid(soundId)) {
            throw new MapException("Invalid sound id: '" + soundId + "'");
        }

	if (destinationMapId.length() == 0) {
	    throw new MapException("You must choose a destination map");
	}

	if (destinationName.length() == 0) {
	    throw new MapException("You must choose a destination point on the destination map");
	}

	if (destinationMapId.equals(map.getId()) &&
	    destinationName.equals("_same")) {
	    throw new MapException("Cannot teleport to the same point on the same map");
	}
    }

    /**
     * Returns whether the specified teletransporter sprite or sound name is valid.
     * @param name a sprite or sound name
     * @return true if it is valid
     */
    private boolean isSpriteOrSoundNameValid(String name) {
	return name != null
	  && name.length() != 0
	  && (name.charAt(0) != '_' || name.equals("_none"));
    }

    /**
     * Draws the teletransporter on the map editor.
     * @param g graphic context
     * @param zoom zoom of the image (for example, 1: unchanged, 2: zoom of 200%)
     * @param showTransparency true to make transparent pixels,
     * false to replace them by a background color
     */
    public void paint(Graphics g, double zoom, boolean showTransparency) {

	if (sprite != null) {
            // display the appropriate sprite
            sprite.paint(g, zoom, showTransparency,
                getX(), getY(), null, 0, 0);
        }
        else {
            // no sprite: display a teletransporter icon
	    if (resizableTeletransporterImage == null) {
		resizableTeletransporterImage = Project.getEditorImage("resizable_teletransporter.png");
	    }

	    int x = (int) (positionInMap.x * zoom);
	    int y = (int) (positionInMap.y * zoom);
	    int w = (int) (positionInMap.width * zoom);
	    int h = (int) (positionInMap.height * zoom);

	    g.setColor(new Color(240, 200, 80));
	    g.fillRect(x, y, w, h);

	    int dx1 = (int) ((positionInMap.x + positionInMap.width / 2 - 8) * zoom);
	    int dy1 = (int) ((positionInMap.y + positionInMap.height / 2 - 8) * zoom);
	    int dx2 = (int) (dx1 + 16 * zoom);
	    int dy2 = (int) (dy1 + 16 * zoom);

	    g.drawImage(resizableTeletransporterImage, dx1, dy1, dx2, dy2, 0, 0, 32, 32, null);

	    drawEntityOutline(g, zoom, new Color(240, 215, 142));
	}
    }
}

