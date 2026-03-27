// Copyright Ryan Francesconi. All Rights Reserved. Revision History at https://github.com/ryanfrancesconi/spfk-metadata

import Foundation

/// Logical grouping of ``TagKey`` values for organizing tag display in UI (e.g., common, music, loudness).
public enum TagGroup: CaseIterable, Hashable, Sendable {
    case common
    case music
    case ucs
    case loudness
    case replayGain
    case utility
    case other

    /// Human-readable section title for UI display.
    public var title: String {
        switch self {
        case .common: "Common Tags"
        case .music: "Music Tags"
        case .ucs: "UCS"
        case .loudness: "Loudness"
        case .replayGain: "Replay Gain"
        case .utility: "Utility"
        case .other: "Other Tags"
        }
    }

    /// The ``TagKey`` values belonging to this set.
    public var keys: [TagKey] {
        switch self {
        case .other:
            TagGroup.otherTags

        case .common:
            TagGroup.commonTags

        case .music:
            TagGroup.musicTags

        case .ucs:
            TagGroup.ucsTags

        case .loudness:
            TagGroup.loudnessTags

        case .replayGain:
            TagGroup.replayGainTags

        case .utility:
            TagGroup.utilityTags
        }
    }

    public init?(title: String) {
        for item in Self.allCases where item.title == title {
            self = item
            return
        }

        return nil
    }
}

extension TagGroup {
    private static let otherTags: [TagKey] = {
        let known = Set(commonTags + musicTags + ucsTags + loudnessTags + replayGainTags + utilityTags)
        return TagKey.allCases.filter { !known.contains($0) }
    }()

    static let commonTags: [TagKey] = [
        .album,
        .artist,
        .comment,
        .date,
        .genre,
        .keywords,
        .mood,
        .title,
        .trackNumber,
    ]

    static let musicTags: [TagKey] = [
        .arranger,
        .bpm,
        .composer,
        .conductor,
        .initialKey,
        .instrumentation,
        .label,
        .lyrics,
        .movementName,
        .movementNumber,
        .remixer,
        .work,
    ]

    static let ucsTags: [TagKey] = [
        .ucsCategory,
        .ucsSubcategory,
        .ucsCatID
    ]

    static let loudnessTags: [TagKey] = [
        .loudnessRange,
        .loudnessIntegrated,
        .loudnessMaxMomentary,
        .loudnessMaxShortTerm,
        .loudnessTruePeak,
    ]

    static let replayGainTags: [TagKey] = [
        .replayGainAlbumGain,
        .replayGainAlbumPeak,
        .replayGainAlbumRange,
        .replayGainReferenceLoudness,
        .replayGainTrackGain,
        .replayGainTrackPeak,
        .replayGainTrackRange,
    ]

    static let utilityTags: [TagKey] = [
        .artistWebpage,
        .audioSourceWebpage,
        .fileWebpage,
        .isrc,
        .paymentWebpage,
        .publisherWebpage,
        .radioStationWebpage,
        .releaseDate,
        .taggingDate,
    ]
}
