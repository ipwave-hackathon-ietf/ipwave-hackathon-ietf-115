//
// Copyright (C) 2006 Andras Varga
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program; if not, see <http://www.gnu.org/licenses/>.
//

#ifndef __INET_STATIONARYNODEMOB_H
#define __INET_STATIONARYNODEMOB_H

#include "inet/mobility/base/StationaryMobilityBase.h"

namespace inet {

/**
 * This mobility module does not move at all; it can be used for standalone stationary nodes.
 *
 * @ingroup mobility
 * @author Andras Varga
 */
class INET_API StatNodeMob : public StationaryMobilityBase
{
  protected:
    bool updateFromDisplayString;

  protected:
    virtual void initialize(int stage) override;
    virtual void refreshDisplay() const override;
    virtual void updateMobilityStateFromDisplayString();

  public:
    std::map<std::string, Coord> returnDestinations();
    std::map <std::string, Coord> returnBStations();
};

} // namespace inet

#endif // ifndef __INET_STATIONARYNODEMOB_H

