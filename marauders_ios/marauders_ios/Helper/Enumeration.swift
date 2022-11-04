//
//  Enumeration.swift
//  marauders_ios
//
//  Created by somsakKaeworasan on 16/2/2565 BE.
//

enum SceneEnum {
    case LoginScene
    case MapScene
    case HomeScreen
    case SettingScreen
}

func SceneStoryboardEnum(storyboard: SceneEnum) -> String {
    switch storyboard {
    case .LoginScene:
        return "LoginScene"
    case .MapScene:
        return "MapScene"
    case .HomeScreen:
        return "HomeScreen"
    case .SettingScreen:
        return "SettingScreen"
    }
}
