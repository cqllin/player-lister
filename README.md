# 📌 PlayerLister - FiveM Player API

A lightweight HTTP API for retrieving online player information in a FiveM server.  
This resource is built using **[fivem-webbed](https://github.com/Cyntaax/fivem-webbed)** for handling HTTP requests.

---

## 🚀 Features
- 📡 Exposes an HTTP API to list online players.
- 🔍 Supports fetching a specific player's details.
- ⚡️ Lightweight and optimized for FiveM.
- 📑 Uses **fivem-webbed** as the HTTP routing system.

---

## 📥 Requirements
This resource **requires** [fivem-webbed](https://github.com/Cyntaax/fivem-webbed) to work.  
Ensure that you have installed **fivem-webbed** before using **PlayerLister**.

### 🔹 Installation Steps for fivem-webbed:
1. Download the latest release from the [GitHub repository](https://github.com/Cyntaax/fivem-webbed).
2. Extract and place it in your FiveM server's `resources` folder.
3. Add the following line to your **server.cfg**:
`start fivem-webbed`
4. Restart your FiveM server.

### 🔹 Installation Steps for PlayerLister:
1. Download the latest release from the [GitHub repository](https://github.com/cqllin/player-lister).
2. Extract and place it in your FiveM server's `resources` folder.
3. Ensuring you start PlayerLister **AFTER** starting fivem-webbed, add the following line to your **server.cfg**:
`start player-lister`. So with both starting correctly, your CFG should read:
```ini
start fivem-webbed
start player-lister
```

## API Endpoints
### How the URL works:
The beginning of the URL will be a combination of your server's IP & port, along with the resource name & it's routes.

For simplicity, let's say your IP is 0.0.0.0:30120. Your URL would be:
`http://0.0.0.0:30120/player-lister/ROUTE_NAME_HERE`.
### - /players:
**Request:**
`http://0.0.0.0:30120/player-lister/players`


**Responsee:**
```json
{
    "players": [
        {
            "name": "John Doe",
            "id": "1",
            "ping": 24,
            "identifiers": {
                "ip": "1.1.1.1",
                "license": "1234",
                "discord": "1234",
                "steam": "1234",
                "live": "1234",
                "xbl": "1234",
                "license2": "1234"
            }
        },
                {
            "name": "Frankie",
            "id": "2",
            "ping": 32,
            "identifiers": {
                "ip": "2.1.1.1",
                "license": "2234",
                "discord": "2234",
                "steam": "2234",
                "live": "2234",
                "xbl": "2234",
                "license2": "2234"
            }
        }
    ]
}
```

### - /players/{playerId}
**Request:**
`http://0.0.0.0:30120/player-lister/players/{playerId}`

**Response:**
```json
{
    "player": [
        {
            "name": "John Doe",
            "id": "1",
            "ping": 24,
            "identifiers": {
                "ip": "1.1.1.1",
                "license": "1234",
                "discord": "1234",
                "steam": "1234",
                "live": "1234",
                "xbl": "1234",
                "license2": "1234"
            }
        }
    ]
}
```
