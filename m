Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B233F7EFE44
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 08:32:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=H3Y7B1PB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXQT40Gnpz3dT2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 18:32:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=H3Y7B1PB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3pihyzqckdcejj7robodlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXJP33dDgz3c8c
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 13:58:14 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-daee86e2d70so3209870276.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 18:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700276286; x=1700881086; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QcqINJQ5diQHGOPsun01LVrGFl32Nw5/hV5eaRRLRg8=;
        b=H3Y7B1PBdS6uEq0szgubBlDB9UEGvNABEMh/jvMrdea3sYSKbdrSDJU5j/qYwJDb2H
         aELa0+li8a9mGQgVDzWtOv6/u0M2im0STe9l0xF05B3cBr0BnYMm3sil085R+9OUn6Qc
         ME56j2YGwRHlq8TgVNIM3EpdyqnP8QoLg0/ywZ+2tdCVs6XBAcOQDF/bef3jwvxij4Hu
         8VPVvOwfn1ziSqcNuvAZwzh7TAI0hcUsz6dbErX+SjWzIKgRR2WEkbXxpPyCmlsJrng5
         IV3rGRTRLWWTqrUl/41Ve6K6MTTaTtPOHZhBhhuivmCmRBygt5o7X7RDph+Y3/BXRz+3
         pabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700276286; x=1700881086;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcqINJQ5diQHGOPsun01LVrGFl32Nw5/hV5eaRRLRg8=;
        b=TwQDKt7lDAnZa16yyvibgd/65tVqdzRlCOiYPvkmqmUome6UTUrbJAd6GEkKHTJWk2
         8NL9pMc+DxzBH4NkKJgQX8Clfl1B1J52Q7wPRTHYx1jDUTw6041P4L4RNpe2CGuoY3Q8
         dTm4evu8EV2W27YvTOjCveqKkjsrmRhbRpSX141fDj1dh3/QAQz2HhHtoGd5VQtnS+c7
         CQSuLhEmmgDtvtVNZjPQ+LYGrBUspmUMXWslybhv95V6AmvFP9oRm8tFSXFpvlNN23Io
         8MK/yPYRnUf0CU4uDkZGpV5kINLLZGt6Dc6NKBbISpde5MK9PWkDdM9KXESktO81yTd8
         5Tug==
X-Gm-Message-State: AOJu0Yw7vDSr/eNIEzGJAenZjazzg30Lp4qCSB/72HzIAhtSMsNoQUGP
	wOWMKXApO11SESn5/hnzDfoM1mETeMo1
X-Google-Smtp-Source: AGHT+IEipLfYfNhkIRCz9BLTKi/Q07W5+qhbxpM56Qf4WuGm87G6Dh+mgTSQvuA9zn4iAz2ODTBXSWhTbmQj
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:abe3:0:b0:d9c:c9a8:8c27 with SMTP id
 v90-20020a25abe3000000b00d9cc9a88c27mr27045ybi.13.1700276286411; Fri, 17 Nov
 2023 18:58:06 -0800 (PST)
Date: Sat, 18 Nov 2023 02:54:41 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231118025748.2778044-1-mmaurer@google.com>
Subject: [PATCH v2 0/5] MODVERSIONS + RUST Redux
From: Matthew Maurer <mmaurer@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 18 Nov 2023 18:31:25 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, Nathan Chancellor <nathan@kernel.org>, Laura Abbott <laura@labbott.name>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The goal of this patch series is to allow MODVERSIONS and RUST to be
enabled simultaneously. The primary issue with doing this at the moment
is that Rust uses some extremely long symbol names - for those
unfamiliar with Rust, it may be helpful to think of some of the mangled
C++ names you may have seen in binaries in the past.

Previously, Gary Guo attempted to accomplish this by modifying the
existing modversion format [1] to support variable-length symbol names.
This was unfortunately considered to be a potential userspace break
because kmod tools inspect this kernel module metadata. Masahiro Yamada
suggested [2] that this could instead be done with a section per-field.
This gives us the ability to be more flexible with this format in the
future, as a new field or additional information will be in a new
section which userspace tools will not yet attempt to read.

In the previous version of this patchset, Luis Chamberlain suggested [3]
I move validation out of the version checking and into the elf validity
checker, and also add kernel-docs over there. I found
elf_validity_cached_copy to be fairly dense and difficult to directly
describe, so I refactored it into easier to explain pieces. In the
process, I found a few missing checks and added those as well. See
[PATCH 2/5] for more details. If this is too much, I'm more than happy
to drop this patch from the series in favor of just adding the
kernel-doc to the original code, but figured I'd offer it up in case the
added clarity and checks were valuable.

[1] https://lore.kernel.org/lkml/20230111161155.1349375-1-gary@garyguo.net/
[2] https://lore.kernel.org/lkml/CAK7LNATsuszFR7JB5ZkqVS1W=hWr9=E7bTf+MvgJ+NXT3aZNwg@mail.gmail.com/
[3] https://lore.kernel.org/lkml/ZVZNh%2FPA5HiVRkeb@bombadil.infradead.org/

Matthew Maurer (5):
  export_report: Rehabilitate script
  modules: Refactor + kdoc elf_validity_cached_copy
  modpost: Extended modversion support
  rust: Allow MODVERSIONS
  export_report: Use new version info format

 arch/powerpc/kernel/module_64.c |  25 +-
 init/Kconfig                    |   1 -
 kernel/module/internal.h        |  18 +-
 kernel/module/main.c            | 663 +++++++++++++++++++++++++-------
 kernel/module/version.c         |  43 +++
 scripts/export_report.pl        |  17 +-
 scripts/mod/modpost.c           |  37 +-
 7 files changed, 642 insertions(+), 162 deletions(-)

-- 
2.43.0.rc0.421.g78406f8d94-goog

