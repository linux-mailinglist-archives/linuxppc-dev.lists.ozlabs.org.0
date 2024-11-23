Return-Path: <linuxppc-dev+bounces-3507-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5A59D66B5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2024 01:19:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XwCJX6Z6Wz2yVj;
	Sat, 23 Nov 2024 11:19:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732321164;
	cv=none; b=Hty9d/z0x88LgsrxzXHTR7BdZUEHe+SBnVKJuuFyjwF3fqIA8zag7OvS3kX3wg1WocsUucT6tHTaCmsPVx5SrkfLwzNozFyrRf0Bd/ZuSd8uHJclp/vMkh8fgr9FVtfRhMN8edlrmiUNvFIK6T9EKZ4Mc48m9jE6TYMjg6epKkoKOSC8/DKXxalA+BnX3fj1tv8p08aHGjtcZ8obL/uAUQpnA2rjVJc7T7VBW/oFy43KwSgVC9diwz4MTiL/Wl+x6UpOXjFIFMHwlc5UYk99vz2F0bbx7NgIQjDgp38SMkrHpx55uXHiTgOn5A1QLLG6D6EVrsdUvohCvanSyN+uAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732321164; c=relaxed/relaxed;
	bh=PzyWd1Ozzz3SQNuZyfgRru/W6uNkQPbCi35gmVjFow4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EZvgU8Sa2E/PrpeGHXeBWjhE0v8a/oVS2iGp43urIgzO5rplAgos/g76P2bXK/HrwhasdRa1AClckqN+j8TUoci+zjq6w2aAccg3o4T3DJ54lDNcqcz3pR0DtKwqZlWgq2P+0ejtnhElXYibQIM//6uqjWG1Y8LKC/2f32357SakKO381tuWZpNx4hEoknUdr3z8xCfHpeVgOIEUj8xJRCpC8j0GZPlZcj/dzwuWJQCX1CCX46J+8Ftiz1LgYW67vKExaTtI6aQUyATbM2HsSdwlzyUuq/aERzOXTM01NWzZ2qffGlE5deNG7mqs2JX4YEKDSfBTXEnbxBgBo0DA4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tOIST6lR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3hr9bzwckdaowwk41o1qyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tOIST6lR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3hr9bzwckdaowwk41o1qyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XwCJV2137z2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 11:19:20 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ee57ae1133so38283177b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 16:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732321157; x=1732925957; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PzyWd1Ozzz3SQNuZyfgRru/W6uNkQPbCi35gmVjFow4=;
        b=tOIST6lR2dsZggDXMGIj4OVOirvhOWo4BeIDfK7fuDcrl9Sv8VpIat/ZgAGE2uwUja
         vrLVmgF6nayjg/HvftItw51tlSBP/NU99BBDcA9uFxzsAoLk9QFRo5RU+zNM6JdPDXxz
         g+KBhI18lncfGoYkTQFVgSZuHM2vK99XWetCjUT5GwRGeKr5NZH2eFD860WncQDUoFlh
         /XUkYiP0w24K9HQDBE7W4fSccYN6AoKY4ZH2lUllwH+8mB7cJ42tlMV0b46Kqnz/IN2c
         ajqlz/dmnGJ3+YTi7ak+8Y33AcI0CFG7jdjKmGpYTgGoGOtyoINiwllgeWBcTYPqMVtp
         e+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732321157; x=1732925957;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PzyWd1Ozzz3SQNuZyfgRru/W6uNkQPbCi35gmVjFow4=;
        b=S+eIURGmxMuqJzhwjADwWg3WXFkoI5e8p3AZQYC9jOP6fsKeAonjxBWTsYr+mJ7qjr
         7mng3CHl2yZ/64Pkn0uyqRF+psknQm0Ty2fwV9qSLp+zndJ5W+JWbpgVRI1hWWmzseoQ
         067E4aMC525q7xwa2WIPMBNcoxDI5i836TWnMwvpz7sKT3fAEq2a2Yh9Pm11rIm2lD/R
         YVEenD+T80pMqQTpyACxJ5fkO9iFr/A1NGmx7Km8hKVI1SM9veONIceZtmBn0Vgd3QAg
         0OuQceBbShYHkP6Fnak9HqDYaEcjZ/5uB6lovXlQuZzADggG4RUk0L+BSZMrEr/BC66m
         cvRA==
X-Gm-Message-State: AOJu0YzPe4igeZcuCQ+Vp7wLehA5Pp6WFqep8W3gtB5AIwDGH3G9pmWc
	1K6u276o+v7G37KSzYMW65vmSwIXmxw52J01Px8NiwCv3asM6eV2WCpatflJ97z76EAOFhl+LEc
	wxJB/Mw==
X-Google-Smtp-Source: AGHT+IGaHsvNgSBBFeb1KNK1VHScVmnycGaGvWkQd+Oy8DpEaKXryKh9jKUOlebIrijGejNroleRwAK5Bosy
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:8d0a:0:b0:6ec:aa45:a975 with SMTP id
 00721157ae682-6eee08a975fmr29537b3.1.1732321157317; Fri, 22 Nov 2024 16:19:17
 -0800 (PST)
Date: Sat, 23 Nov 2024 00:18:57 +0000
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
X-B4-Tracking: v=1; b=H4sIAHEfQWcC/23QwW6EIBAG4FcxnDsGBq1omqbv0fSAOijJIltwz
 TYb371oPdhkj38yfMz8DxYpWIqsyR4s0GKj9VMK9UvGulFPA4HtU2bIsRAcEeg+09RTD873C4V
 tPoKu2qLoTWuMESw9vQYy9r6zn18pm+AdzGMgfcJEiVLUWOZSlQVKDgKc07dA4WPwfrhQ3nl3a
 IG+b2m3+Y9kjmLU+25N9rZrAgXyApHnKCsllADkELWzs78seqLpZL5vaKsjQQpposmmdBUcDrJ
 t49HG2YefvZel2j89KpDPK1gq4CBlXanUhZSVPB+xiYs6Kena54pKSi1115N5xY7UP2Vd11/W8 irAsQEAAA==
X-Change-Id: 20241022-extended-modversions-a7b44dfbfff1
X-Mailer: b4 0.15-dev
Message-ID: <20241123-extended-modversions-v9-0-bc0403f054bf@google.com>
Subject: [PATCH v9 0/5] Extended MODVERSIONS Support
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

This series depends upon the module verification refactor patches [5]
that were split off of v5 (now in modules-next)
and DWARF-based versions [1].

[1] https://lore.kernel.org/all/20241121204220.2378181-20-samitolvanen@google.com/	
[2] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org/
[3] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
[4] https://lore.kernel.org/lkml/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com/
[5] https://lore.kernel.org/linux-modules/20241015231651.3851138-1-mmaurer@google.com/T/#t

Changes in v9:
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
base-commit: 96ba0247d78ef4078e1de58b7e73715b93ee2c0b
change-id: 20241022-extended-modversions-a7b44dfbfff1
prerequisite-message-id: <20241121204220.2378181-20-samitolvanen@google.com>
prerequisite-patch-id: 43f1286f3e4b991fda2aa093539631a01fadf5fb
prerequisite-patch-id: 32a05b89083cfed15e5b877664b0c8138c40d09b
prerequisite-patch-id: e192e2a692c40d96cba919e3baae68c441ab25e4
prerequisite-patch-id: 50e884d28c720e90f201aae7801590d19736541b
prerequisite-patch-id: 4d6a826429c519b581d01215e1d9c7373fdfd8c6
prerequisite-patch-id: 0dcd84187b222adf52696dbcab303d683d087dd2
prerequisite-patch-id: 0abe8634eb844a85e8dc51c1cd3970cf96cc494a
prerequisite-patch-id: 5fabb630792f9304f200b5996314f3c2ae4c83ae
prerequisite-patch-id: ff82b9794147dc28504e46a0170cd269623e73bf
prerequisite-patch-id: a5cf20d27871bf63be64ac79cc81e5eb9d117b89
prerequisite-patch-id: 2a317596a3288f9b8e06d73df53737bbfafb1d16
prerequisite-patch-id: cac33b6e6672cf3f9f7f798a928ce7b147db271d
prerequisite-patch-id: 62664c468be8afff72a3edaf2c1bcd2f4936a1b2
prerequisite-patch-id: 5157d0421200858de3cc449bf39b3513efba3b24
prerequisite-patch-id: 5a190c60e140cdf33caf4f4da03186a2bd75a531
prerequisite-patch-id: 57d2fe708769154a6494fb1fece56911dea00687
prerequisite-patch-id: 25255d6bc70d3ba38e45fb6a2c13038df293bd9e
prerequisite-patch-id: 91c6131ab67a6f0fd8cf8bc95fa45144a868f095

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>


