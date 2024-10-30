Return-Path: <linuxppc-dev+bounces-2734-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAA09B7040
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 00:05:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xf2lZ59Bmz2y71;
	Thu, 31 Oct 2024 10:05:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730329514;
	cv=none; b=T+2BZCIrcf7amoJFthTTZ/Vtw6/FOn6go5TLM0l/7+ltqx3uWXpd0Q4De8jqJUSJdAT74U5/zq5Q700ZBhhuWGXs1nXCHCAUd+9IT7G69s+7NYIrTX+GkVNxeZGBb1Tt506Sl9PPEt1VGn6B/LU9o51l+PQZsjrdUDoA1XZybBmIGDoUmHAbosRwRLxmf1LEgDTANdaHtYIiqQJkqaqrZbZENWtDuc80YVsXRju+3/s3j68D6JK+LcG5VpymVk7PxR+zsE3u0vR7RUNA4rHJC9J5rZsUNFNbSzVts4CXvkbSU713kYXuFaxecCz4Ll40+qUO0O10YWfg2QEiTK/HPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730329514; c=relaxed/relaxed;
	bh=mwCfAovhpPAvFtkBAaRUtvlrChVtTdt/SXipMI6/liY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fKEao6NQVMnwvx0MC72vvoGTXcniDtJALz2Vr+Mrw1G+jMjUhaN+s3QFckC2M1Uh8pZDThYGHkqlWwwA5FXm1ACRz68/4CJcmKnMCXz4pMDi0GPAfGhdsemFo2Fm7an0Zys0hPNGNgdvyssd1ILIAeJWhbfUhokwku1z22E8xzg7WOHzb1uWyAyC3YSPC3ay73AQeEcKSj1+GX71dT5JRr2m6H2QH9Q8tGcMpI+R/E7uERrx8zz8jHyyXQKTc4wxI1oTEwed/+1/qhjiUZQSwecxnttUMQHjT5pnjaHepbQBUghvCkFsaTYrnoOhwjSwqhWlsbmJgiNJeM2Ld+EDag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rFnpMdSN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3orsizwckdomrrfzwjwlttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rFnpMdSN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3orsizwckdomrrfzwjwlttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xf2lY1gPNz2xxw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 10:05:11 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e2946a143efso574427276.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 16:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730329506; x=1730934306; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mwCfAovhpPAvFtkBAaRUtvlrChVtTdt/SXipMI6/liY=;
        b=rFnpMdSNJmiLCuv3R43O1LDgO/EMf2vHfB6Nffn6MA/Dj87kjiHOHwyLsXNDhQOZ3W
         hbYpfzVQ3P7BrPwoiWp0YBkeAiKcwSBFlKPExBNakv5F2Ibsi5B39S4BtyTQYdX9ULx6
         hCSde6ZudEiiCcb2sBl+SxdmZY+9q1y3wv0kIQBwnb2lr9/R7mHUxqJxGG7F6d2WuwFT
         0QM5JHnHJNlVIR9DlAD4y28Lt+OzfDqpdFYep0k0rv44UVIxJdZHABUsIBjSy0ljqDOP
         6gl2cNfOSEWEQH5fmIfGY3jX1Avf2S7Zn3RCzm0wfS/OcurzJKlRGeo5EFn+yQ2xGqoq
         Y8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730329506; x=1730934306;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mwCfAovhpPAvFtkBAaRUtvlrChVtTdt/SXipMI6/liY=;
        b=giUvvop5TMSiYC+cXDXj5v8c7zqeCGdWXBCnF4OdcPcYKOHeECcaONQ03lwGiwMMH1
         6t87PjwTolKZN9N1s826EyX8InEttFnzmyO1+vctmXdVpcYKT+hJ1PUXxsRg6JsF+9FL
         4M93QSdKIMOqphydIZ2Zx0SCcDmoxAifJaKgd/sT5iwr20ZtjUMGrZUROmMSz9kGnOm6
         vhLWJOXUEfvwyGHrVEc6Mwf3fCxkMmCBV8JfSxuTKpeAGTRyHE1zCcGhTuWw7FUg1yoz
         UieTQlLrKOILu9ZEJ+p2Q5KbkFL0x0d2knMDoNw5wU3vE+JXHjsPsMuCphXUz3FGIMlv
         oB9w==
X-Gm-Message-State: AOJu0YwHyckoajNFNI0TWmxgr7WNjhJiINUjY4HcjCFJPI/GGv1mURP1
	iVRbwDl67m7VRh2x3bgGdF1z8MPIZbZLZxJ6Ues1r+EosOOHH8mNEvO1CR7qIJno9LbZmbIOU0N
	ZjQY6LA==
X-Google-Smtp-Source: AGHT+IEVxCPJ8KY+daO6sXzeep+OX1tLKz9cP/KzhVx9mKCU3r73WaJnmvG2rqaP9yNNj71dEIj2Eigx8el+
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:ad54:0:b0:e2b:db24:905e with SMTP id
 3f1490d57ef6-e30e8da06f9mr779276.5.1730329506200; Wed, 30 Oct 2024 16:05:06
 -0700 (PDT)
Date: Wed, 30 Oct 2024 23:05:01 +0000
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
X-B4-Tracking: v=1; b=H4sIAJ67ImcC/22QzW6DMBCEXwX53EX+wZigqup7VDkYWBNLMU5tY
 qWKePcamgOquO1IO59m5kkiBouRtMWTBEw2Wj9l0bwVpL/oaUSwQ9aEU14xyjngY8ZpwAGcHxK
 G9T+CVl1VDaYzxjCSrbeAxj427Nc5axO8g/kSUO9gTHLBTlyWopEVFxQYOKfvAcPn6P14xbL37
 kUL+H3P2eY/JHEYo96ytcX7jlZLttIYE80h7WPFHZgFZYoyWpdM5qsWwBlE7ezsr0lPOP1HdDo iZJE/2iJlG4fQS7JWvdg4+/CzDZrUlva1nTjeLimgIMRJNXlEIZTYtz8vy/ILqBzHl6QBAAA=
X-Change-Id: 20241022-extended-modversions-a7b44dfbfff1
X-Mailer: b4 0.15-dev
Message-ID: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
Subject: [PATCH v8 0/3] Extended MODVERSIONS Support
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
	Trevor Gross <tmgross@umich.edu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
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

Selecting RUST and MODVERSIONS is now possible if GENDWARFKSYMS is
selected, and will implicitly select EXTENDED_MODVERSIONS.

This series depends upon the module verification refactor patches [5]
that were split off of v5, and DWARF-based versions [1].

[1] https://lore.kernel.org/lkml/20241030170106.1501763-21-samitolvanen@google.com/
[2] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org/
[3] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
[4] https://lore.kernel.org/lkml/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com/
[5] https://lore.kernel.org/linux-modules/20241015231651.3851138-1-mmaurer@google.com/T/#t

Changes in v8:
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
Matthew Maurer (2):
      modules: Support extended MODVERSIONS info
      modpost: Produce extended MODVERSIONS information

Sami Tolvanen (1):
      rust: Use gendwarfksyms + extended modversions for CONFIG_MODVERSIONS

 arch/powerpc/kernel/module_64.c | 24 ++++++++++-
 init/Kconfig                    |  3 +-
 kernel/module/Kconfig           | 10 +++++
 kernel/module/internal.h        | 11 +++++
 kernel/module/main.c            | 92 +++++++++++++++++++++++++++++++++++++----
 kernel/module/version.c         | 45 ++++++++++++++++++++
 rust/Makefile                   | 33 ++++++++++++++-
 scripts/Makefile.modpost        |  1 +
 scripts/mod/modpost.c           | 65 +++++++++++++++++++++++++++--
 9 files changed, 267 insertions(+), 17 deletions(-)
---
base-commit: ac746e6156c4d6d7b46ba2102acf644ea2aa4aac
change-id: 20241022-extended-modversions-a7b44dfbfff1
prerequisite-message-id: <20241015231651.3851138-1-mmaurer@google.com>
prerequisite-patch-id: 7b7bf0c0c0f484703e29a452dc99dc99711c051b
prerequisite-patch-id: 8cc51bc35ddd4c268b5ccba4c3a74af3dbee8bee
prerequisite-patch-id: 0c4fded10660440fc59e256d6456ac865b70f04b
prerequisite-patch-id: 121f9313b4bde4e374ba37132fbf36e435f7ada5
prerequisite-patch-id: bbd158ee717130fd5d5fc4b7c0613d89c2adcc45
prerequisite-patch-id: af83141b7e527e3d1936326e3c9996bddfa45642
prerequisite-patch-id: 61a51b5c2ab3dc55031fcb2a2b56b4b44b9fabd3
prerequisite-patch-id: 63b4bdc24ff078bd48b8dcec28a334042450796e
prerequisite-patch-id: 429739b875bf7400ece44ec2529f43051b43dd45
prerequisite-patch-id: 55a19e6365f3d60ac5dbea13e320ece71538de25
prerequisite-patch-id: d5ab8e10e837e8193c265dc8548b97655a56db27
prerequisite-patch-id: e2f5364a0c5f3c9341aaa183f97fb7544b1c9dba
prerequisite-message-id: <20241030170106.1501763-21-samitolvanen@google.com>
prerequisite-patch-id: 08b46e0d1e37c262c08da6db4a87728d7b3047cc
prerequisite-patch-id: 0a1e1ac99f325f4df27bd35f00bd4914f5386cb9
prerequisite-patch-id: 32a05b89083cfed15e5b877664b0c8138c40d09b
prerequisite-patch-id: e192e2a692c40d96cba919e3baae68c441ab25e4
prerequisite-patch-id: 50e884d28c720e90f201aae7801590d19736541b
prerequisite-patch-id: 4d6a826429c519b581d01215e1d9c7373fdfd8c6
prerequisite-patch-id: 0dcd84187b222adf52696dbcab303d683d087dd2
prerequisite-patch-id: 0abe8634eb844a85e8dc51c1cd3970cf96cc494a
prerequisite-patch-id: 5fabb630792f9304f200b5996314f3c2ae4c83ae
prerequisite-patch-id: 4859bef5bb0f6b2142bd7a0e89973f7a79009624
prerequisite-patch-id: a5cf20d27871bf63be64ac79cc81e5eb9d117b89
prerequisite-patch-id: f9cacaf82d1f2a93ade313c44269fb871e7b9ce2
prerequisite-patch-id: 9fcea62d87a577d69ec262fe76b81c889c1bdf92
prerequisite-patch-id: 310f411df60af62002a3898eafe60c1687c0e9b8
prerequisite-patch-id: c21f85ffe5c7684c1ffc87af716e2e50498d5c92
prerequisite-patch-id: a372f88626c3dda51eab6c6af132a76141ff20cc
prerequisite-patch-id: 57d2fe708769154a6494fb1fece56911dea00687
prerequisite-patch-id: e5fb35555f6a95bc9953bddebba0612f422146c4
prerequisite-patch-id: 624e6794e5003cff734873894c2343595b45244b

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>


