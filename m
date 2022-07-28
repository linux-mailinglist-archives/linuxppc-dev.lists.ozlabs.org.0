Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C30558379B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 05:35:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ltbr63kbSz2xKm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 13:35:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZCpCWijz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZCpCWijz;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtbqR5Mkcz2xHS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 13:34:26 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id e1so821563pjl.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 20:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=j10ToGanO3cd/vYuHa5Kn8foeTs8uMlyZtELPg2UY1U=;
        b=ZCpCWijzlJKFs64G+1k7Jl5GKh6G4zOE6ybwGhhR/exQ9bGqHu5jiznO5HvWlqa/rJ
         6blTRDDSiBqKmbeZa1uCPh2Nyo9/0lSgoBae4muND+4qWPGNamj5AmdAYBJUEm7SGqbw
         HXf6QFOrlDBQfF0eLDtdaVtzxe79XUj6OMXvc70gPfydf9HkHcRXdr6fvkFRltTf5//h
         6Fy6RAqzfsW2N7ZbZKzdwib5zi2mCAOr5ScVrstEYPdirvZgJ8zOFm9HKdRn/Y5LPWwJ
         ZY60cdEvLCP8iXWLUhJQo99JJiatYHysQCuaGzKDYXD6AMFLvjVx1VTyMSLscmEAgq2B
         xtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=j10ToGanO3cd/vYuHa5Kn8foeTs8uMlyZtELPg2UY1U=;
        b=sI7yBLwrAO35yaxoRK24vZfW8WKW+fT2ME78lNthSyYdzHrzdM72tPXM8/49YtLJLc
         X8peG+0q3V8be84+vqnHWBdccMeg5khK5Gpwgq3jj/EwM8lHbuLSf+nrVOsPaD85w9Hu
         4zi70zWzmlbH0on9S5yojbUTO0Ez2ZYUTFLplpq6HCJN00E3OaZa2zWIqg1Db4AbeiWd
         IFyudHvZaN94svFZPb4vI2RB6sl9it3oVKYlKafiyd/AWGqE6WdRffkfhpYtsvzMPH6M
         N8CFn0z53/fkxLexdiRp0D+a9lFdAoKSWcUoW9N/VeU5LqW4MkDvusHmsA41ATeIhhwu
         XyxQ==
X-Gm-Message-State: AJIora/LcWupyeAn3t/JqmGv/J1MMLuKuXa44BrjF6WCe4YtSYn9pHgq
	XbsopMB+RyyvIed5px+C/SU=
X-Google-Smtp-Source: AGRyM1stnTgNjHqQvTX8yokSMFJC+fEv40VFSklSquPlJzshMGe0L5wVcYIHWCUudBsD3zBQBgCCow==
X-Received: by 2002:a17:902:d54f:b0:16d:3bce:c40e with SMTP id z15-20020a170902d54f00b0016d3bcec40emr24861840plf.87.1658979262545;
        Wed, 27 Jul 2022 20:34:22 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-54.three.co.id. [116.206.12.54])
        by smtp.gmail.com with ESMTPSA id m17-20020a170902db1100b0016d33b8a231sm8418629plx.270.2022.07.27.20.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 20:34:21 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 5F5C7104A8C; Thu, 28 Jul 2022 10:34:16 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-next@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc-tw-discuss@lists.sourceforge.net
Subject: [PATCH 2/3] Documentation: use different label names for each arch's elf_hwcaps.rst
Date: Thu, 28 Jul 2022 10:33:32 +0700
Message-Id: <20220728033332.27836-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727220050.549db613@canb.auug.org.au>
References: <20220727220050.549db613@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Alex Shi <alexs@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sphinx reported duplicate label warning:

WARNING: duplicate label elf_hwcaps_index, other instance in Documentation/arm64/elf_hwcaps.rst

The warning is caused by elf_hwcaps_index label name is already used for
arm64 documentation, whileas powerpc use the same name.

Disambiguate the label name for each architecture's documentation. While
at it, also adjust original reference in translated documentation.

Link: https://lore.kernel.org/linuxppc-dev/20220727220050.549db613@canb.auug.org.au/
Fixes: 3df1ff42e69e91 ("powerpc: add documentation for HWCAPs")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/arm64/elf_hwcaps.rst                    | 2 +-
 Documentation/powerpc/elf_hwcaps.rst                  | 2 +-
 Documentation/translations/zh_CN/arm64/elf_hwcaps.rst | 2 +-
 Documentation/translations/zh_TW/arm64/elf_hwcaps.rst | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/arm64/elf_hwcaps.rst b/Documentation/arm64/elf_hwcaps.rst
index 3d116fb536c538..63b75080ec4544 100644
--- a/Documentation/arm64/elf_hwcaps.rst
+++ b/Documentation/arm64/elf_hwcaps.rst
@@ -1,4 +1,4 @@
-.. _elf_hwcaps_index:
+.. _elf_hwcaps_arm64:
 
 ================
 ARM64 ELF hwcaps
diff --git a/Documentation/powerpc/elf_hwcaps.rst b/Documentation/powerpc/elf_hwcaps.rst
index bb7438cebf36e8..3366e5b18e6759 100644
--- a/Documentation/powerpc/elf_hwcaps.rst
+++ b/Documentation/powerpc/elf_hwcaps.rst
@@ -1,4 +1,4 @@
-.. _elf_hwcaps_index:
+.. _elf_hwcaps_powerpc:
 
 ==================
 POWERPC ELF HWCAPs
diff --git a/Documentation/translations/zh_CN/arm64/elf_hwcaps.rst b/Documentation/translations/zh_CN/arm64/elf_hwcaps.rst
index 9aa4637eac979c..39a94ff5383c01 100644
--- a/Documentation/translations/zh_CN/arm64/elf_hwcaps.rst
+++ b/Documentation/translations/zh_CN/arm64/elf_hwcaps.rst
@@ -1,6 +1,6 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :ref:`Documentation/arm64/elf_hwcaps.rst <elf_hwcaps_index>`
+:Original: :ref:`Documentation/arm64/elf_hwcaps.rst <elf_hwcaps_arm64>`
 
 Translator: Bailu Lin <bailu.lin@vivo.com>
 
diff --git a/Documentation/translations/zh_TW/arm64/elf_hwcaps.rst b/Documentation/translations/zh_TW/arm64/elf_hwcaps.rst
index 3eb1c623ce31b0..76164d851d0b5e 100644
--- a/Documentation/translations/zh_TW/arm64/elf_hwcaps.rst
+++ b/Documentation/translations/zh_TW/arm64/elf_hwcaps.rst
@@ -2,7 +2,7 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/arm64/elf_hwcaps.rst <elf_hwcaps_index>`
+:Original: :ref:`Documentation/arm64/elf_hwcaps.rst <elf_hwcaps_arm64>`
 
 Translator: Bailu Lin <bailu.lin@vivo.com>
             Hu Haowen <src.res@email.cn>
-- 
An old man doll... just what I always wanted! - Clara

