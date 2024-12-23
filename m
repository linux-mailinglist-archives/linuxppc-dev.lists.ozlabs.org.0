Return-Path: <linuxppc-dev+bounces-4459-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C4D9FB4EA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 21:13:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YH8Nj5M7fz2xy0;
	Tue, 24 Dec 2024 07:13:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734984821;
	cv=none; b=iENqPw7sxNLiGq+pIdQ3ArM7ChNr18TDl/3jwT2/N0s5ONLkPqsBJuOXV2jhu1rIz6vAohHEsSpctjdb/iTLkYYdX2gNwpEu+X4ULUtp5O2KSsyhvQTDeGDevtG/VPc+RkYkqV4C4fMeb3eVS4zVfVwTrM2aFAkQL+s4Lju1iCzWFRrJ5g7ZttCmYkYb855Nnm8A/9Sgl4v8TAu0C6csA7OBJiBPX28efIwsbqnW2NJzjoSxDHE74E3hu/aLqqMOKQwELxEOY187B3bHc6p+qN954YzSFRpq8ARJzXBl4BMa+y/SelXAD934RLqfO9XAbHS2TfUJ26ge2GoagPm8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734984821; c=relaxed/relaxed;
	bh=NdmPC/Cg+VRgcBcF/g9ZlGzIAQfrdNiF/rJDE7UZdnU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Ik7pSfnakoc79ROQiXIXmy8rFVOm+592Pu0REbFQbVslUPGhnxbCgxjEMuJFNFWQNonDJevxtwXHXfJ2/gqKaaZV8J9udromQ8eghgLZQmA9sanKgIAeQYgmBochqrluU2pTK5zc1XriYtZjAWpKm8eaHss4hhps7E+UubETgEIluU0pjZVI+ZH/XNvfXK/LbWFAPCkeujENTGulyAl+20nBnTSEpfvDnv0s09/La0ASGBoS6VguzU9YC0AlvgVFGtD6ldu5UuDsnfLazZ+jjW+YRoJx8am3vmuarFz/NEvPf3bUzciuUFxArfuLXk0gOvf3rSXA/Qex9Ph8SIRVAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=usDF7SsZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3bsrpzwckdn8nnbvsfshpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=usDF7SsZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3bsrpzwckdn8nnbvsfshpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YH8Nh0BKcz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 07:13:38 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-216717543b7so62542685ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 12:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734984814; x=1735589614; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NdmPC/Cg+VRgcBcF/g9ZlGzIAQfrdNiF/rJDE7UZdnU=;
        b=usDF7SsZlacE9GZIN4XSTZqvX+H+AOKDKDFm8zWhG+6ugKcNyMh0u2rsvBz+WST+Q3
         F+8Ke17BHNrVQdGjjqjg6GarGu5Mh93pW1LmzBG1zUCboCrMZmaxNVcY5Hh1F2vgWlRu
         rkaTrlTWJh6J5TM7GmPklNvN0TpAIowjT8nXN8Kvf8rqjRCc4X3UwmpRZQdJ6h51wJiO
         4KKtsBoQq8PqNR+bKpLwtTtgsmljv5c8Tf0heE5LMR8BK/dVWlFOlo9LSOmdopdNP140
         jba0Zi1KdbfTdD/cwR6IYbcO8qz/1z0w1FYg61h8lxJgxmiER+XwXpg6Qr+Yuz8kQLEt
         TMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734984814; x=1735589614;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NdmPC/Cg+VRgcBcF/g9ZlGzIAQfrdNiF/rJDE7UZdnU=;
        b=Lw/yUYKnyJsma9b1qqzlrJ1hjxo3O0I2rmVZvmqeSMdMeeeHsLQ/r7cVi2U/+d4iBa
         C51WGJupZFnS5Y2lhMJlk2dQCsINKQ0XkuDcakJ9w7fqcVV0dqDaTLldRpj1lzcDQ93r
         NS5bG6Hhh95s4h0vfgnvZbnQU4LaNwjSZMlaU1KF2Eo90wDzv0BU19/+lEH/PSeOVZgl
         RJHkuHhIs1cn9LHgnpbLA09rARGBgDdIjCfSkoyCygnjLOZfHh0CIn9QOLnXXX0ApDKa
         nltsnUvNVTscBSC21v5WoU3z0qKpK/IhEcFOZ48O259owPz3yCcNc2Mg0LQ3KhJJvJD+
         gsOQ==
X-Gm-Message-State: AOJu0Yx98bssvdzlkV2cUQwgD3vhA85TCoFFcgUaSXhLrY9kcRDr597j
	sFRZBWBB39RizYMzPBaub6BI/MicQJpjKoSYY+UOR8Qk9c3og89dCP83LSLH5tiBbgxdaS6i8ST
	n2YurSg==
X-Google-Smtp-Source: AGHT+IHDdiQ8BcHRE1C+R/Gh/AVZ73dfmTeKtGuVX3u4tRShWf7DEBJfeyF3UjMT6m/kMUX66xFU/0X+ljnD
X-Received: from pfxa2.prod.google.com ([2002:a05:6a00:1d02:b0:725:eb13:8be8])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:998b:b0:1e0:b5ae:8fc1
 with SMTP id adf61e73a8af0-1e5e0484570mr22771345637.13.1734984814435; Mon, 23
 Dec 2024 12:13:34 -0800 (PST)
Date: Mon, 23 Dec 2024 20:13:29 +0000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGrEaWcC/43Q32rDIBQG8FcJXs/iv9QYxth7jF2YeGyFGjdNQ
 0fpu+8kLSyjHezyiP78vnMmBXKAQtrqTDJMoYQ04MD5U0X6vR12QIPDAyKYUJwJQeE0wuDA0Zj
 cBHl+UKjVnVLOd957TvDpRwYfTov79o6zzynScZ/BrjBeC8mNqDeyqZWQjHIaoz1myK+7lHYH2
 PQp3rQMn0cMN15JEqEUu2Rrq+dFEyhxpuV2I4xhjWyoYLTYGMZ0mOwAw8p8mdHOFqA44I22GrA
 VvTqCkTnxPpQx5a9lMZNePr2tQD5ewaQpo1Ia3eAupNRyXWIWp2alYNvHSoOKkbZ34Leih+ZOM T8K/zOLQaXrmWLSs1p1/k7h7D8MZ+gwb3WtvHcAvztdLpdvuKtXlEACAAA=
X-Change-Id: 20241022-extended-modversions-a7b44dfbfff1
X-Mailer: b4 0.15-dev
Message-ID: <20241223-extended-modversions-v11-0-221d184ee9a7@google.com>
Subject: [PATCH v11 0/5] Extended MODVERSIONS Support
From: Matthew Maurer <mmaurer@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This patch series is intended for use alongside the Implement DWARF
modversions series [1] to enable RUST and MODVERSIONS at the same
time.

Elsewhere, we've seen a desire for long symbol name support for LTO
symbol names [2], and the previous series came up [3] as a possible
solution rather than hashing, which some have objected [4] to.

This series adds a MODVERSIONS format which uses a section per column.
This avoids userspace tools breaking if we need to make a similar change
to the format in the future - we would do so by adding a new section,
rather than editing the struct definition. In the new format, the name
section is formatted as a concatenated sequence of NUL-terminated
strings, which allows for arbitrary length names.

Emitting the extended format is guarded by CONFIG_EXTENDED_MODVERSIONS,
but the kernel always knows how to validate both the original and
extended formats.

Emitting the existing format is now guarded by CONFIG_BASIC_MODVERSIONS,
but it is enabled by default when MODVERSIONS is enabled and must be
explicitly disabled by the user.

Disabling CONFIG_BASIC_MODVERSIONS may cause some userspace tools to be
unable to retrieve CRCs until they are patched to understand the new
location. Even with CONFIG_BASIC_MODVERSIONS enabled, those tools will
be unable to read the CRCs for long symbols until they are updated to
read the new format. This is not expected to interfere with normal
operation, as the primary use for CRCs embedded in the module is
load-time verification by the kernel. Recording and monitoring of CRCs
is typically done through Module.symvers.

Selecting RUST and MODVERSIONS is now possible if GENDWARFKSYMS is
selected, and will implicitly select EXTENDED_MODVERSIONS.

This series depends upon DWARF-based versions [1].

[1] https://lore.kernel.org/lkml/20241219210736.2990838-20-samitolvanen@google.com/	
[2] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org/
[3] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
[4] https://lore.kernel.org/lkml/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com/

Changes in v11:
- Fixed documentation about where strings are stored per Petr's
  suggestion.
- Rebased on to the latest version of Sami's series on linux-next

v10: https://lore.kernel.org/r/20241123-extended-modversions-v10-0-0fa754ffdee3@google.com
- Fixed accidental selects / default confusion in previous patch
- Re-ran tests (check for section presence in Y/Y, Y/N, N/Y, N/N, check
  all module kinds load)

v9: https://lore.kernel.org/r/20241123-extended-modversions-v9-0-bc0403f054bf@google.com
- Rebased onto the latest version of Sami's series, on top of linux-next
- Added BASIC_MODVERSIONS to allow using *only* EXTENDED_MODVERSIONS
- Documented where symbol data is stored and format limitations

v8: https://lore.kernel.org/r/20241030-extended-modversions-v8-0-93acdef62ce8@google.com
- Rebased onto latest version of Sami's series, on top of v6.12-rc5
- Pass --stable when KBUILD_GENDWARFKSYMS_STABLE is set.
- Flipped MODVERSIONS/GENDWARFKSYMS order in deps for CONFIG_RUST
- Picked up trailers

v7: https://lore.kernel.org/r/20241023-extended-modversions-v7-0-339787b43373@google.com
- Fix modpost to detect EXTENDED_MODVERSIONS based on a flag
- Drop patches to fix export_report.pl
- Switch from conditional compilation in .mod.c to conditional emission
  in modpost
- Factored extended modversion emission into its own function
- Allow RUST + MODVERSIONS if GENDWARFKSYMS is enabled by selecting
  EXTENDED_MODVERSIONS

v6: https://lore.kernel.org/lkml/20241015231925.3854230-1-mmaurer@google.com/
- Splits verification refactor Luis requested out to a separate change
- Clarifies commits around export_report.pl repairs
- Add CONFIG_EXTENDED_MODVERSIONS to control whether extended
  information is included in the module, per Luis's request.

v5: https://lore.kernel.org/all/20240925233854.90072-1-mmaurer@google.com/
- Addresses Sami's comments from v3 that I missed in v4 (missing early
  return, extra parens)

v4: https://lore.kernel.org/asahi/20240924212024.540574-1-mmaurer@google.com/
- Fix incorrect dot munging in PPC

v3: https://lore.kernel.org/lkml/87le0w2hop.fsf@mail.lhotse/T/
- Split up the module verification refactor into smaller patches, per
  Greg K-H's suggestion.

v2: https://lore.kernel.org/all/20231118025748.2778044-1-mmaurer@google.com/
- Add loading/verification refactor before modifying, per Luis's request

v1: https://lore.kernel.org/rust-for-linux/20231115185858.2110875-1-mmaurer@google.com/

--
2.47.0.rc1.288.g06298d1525-goog

---
Matthew Maurer (4):
      modules: Support extended MODVERSIONS info
      modpost: Produce extended MODVERSIONS information
      modules: Allow extended modversions without basic MODVERSIONS
      Documentation/kbuild: Document storage of symbol information

Sami Tolvanen (1):
      rust: Use gendwarfksyms + extended modversions for CONFIG_MODVERSIONS

 Documentation/kbuild/modules.rst | 20 +++++++++
 arch/powerpc/kernel/module_64.c  | 24 ++++++++++-
 init/Kconfig                     |  3 +-
 kernel/module/Kconfig            | 25 +++++++++++
 kernel/module/internal.h         | 11 +++++
 kernel/module/main.c             | 92 ++++++++++++++++++++++++++++++++++++----
 kernel/module/version.c          | 45 ++++++++++++++++++++
 rust/Makefile                    | 34 ++++++++++++++-
 scripts/Makefile.modpost         |  2 +
 scripts/mod/modpost.c            | 70 +++++++++++++++++++++++++++---
 10 files changed, 308 insertions(+), 18 deletions(-)
---
base-commit: b2c5bc987160cbc8478b982991f34f53189af909
change-id: 20241022-extended-modversions-a7b44dfbfff1
prerequisite-message-id: <20241219210736.2990838-20-samitolvanen@google.com>
prerequisite-patch-id: 8a6a82b2f1858ee1483f41a1aa72c8cb030559ac
prerequisite-patch-id: 5b22bc2e7f592e464d5d1dd4341efa2fb2afb9d0
prerequisite-patch-id: 220585cf1a8d66ec722cf1d6ec474af6dc3b6a02
prerequisite-patch-id: 8ae7cb66d809f902968f81354706edeb99a3d3fa
prerequisite-patch-id: 4d6a826429c519b581d01215e1d9c7373fdfd8c6
prerequisite-patch-id: 0dcd84187b222adf52696dbcab303d683d087dd2
prerequisite-patch-id: 0abe8634eb844a85e8dc51c1cd3970cf96cc494a
prerequisite-patch-id: 5fabb630792f9304f200b5996314f3c2ae4c83ae
prerequisite-patch-id: 2772364d4b2132c9ede451f320162fc40c6f3d09
prerequisite-patch-id: a5cf20d27871bf63be64ac79cc81e5eb9d117b89
prerequisite-patch-id: 930230702709fe769b171a8ae94955e5d1de13ea
prerequisite-patch-id: b43c0bc886a312e3b14be04a8fdad25badf4d834
prerequisite-patch-id: 839b0c4859bdc8447d67bfe4b09f762140e747e7
prerequisite-patch-id: 3c55d1e58a1d7aebfc3ea85ef5497a7262022040
prerequisite-patch-id: 5a190c60e140cdf33caf4f4da03186a2bd75a531
prerequisite-patch-id: 57d2fe708769154a6494fb1fece56911dea00687
prerequisite-patch-id: 7e046331b05c61a87e1adc923b763b68a580cd03
prerequisite-patch-id: 91c6131ab67a6f0fd8cf8bc95fa45144a868f095

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>


