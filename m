Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E8F5837A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 05:36:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ltbt66Nxvz3dxr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 13:36:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O9JqYvVS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O9JqYvVS;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtbqR5qVWz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 13:34:26 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id p1so669919plr.11
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 20:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=JhMvbIL/TwREFiBbhotzA3SEMID5qPiHSEntbLaD1W0=;
        b=O9JqYvVSKOe0Yn6Nzu7KhVKqcpVLsZ98oKGiSGSTOgVnaEeGIVcBfDog8iPOe2/jV6
         Do9q2C3g4H6zu1nr6zR8QyhneNtjq36NfIKjoUKVKMJMLhxtrD10+NvcgGzqO9jRTqdI
         yLbEYOg3zeLceiDD0JX99bVps8WGiGW4qrwAzGLBMNxEkECd2tgicvP04XymNp/TfWOW
         PwRjVU6E7YZVZO6YaWmxf8CNVYeQ4qOPTlgEyILjQbhj52JD2w5Bl1Wydp7nQTHcTm3L
         daHd9hS2wGpaf/X0OjIm/l6OzzEtl23gNoOlbp20Mb2IWWz4E7JCaVIOm8ryiAPwm0qv
         Vj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=JhMvbIL/TwREFiBbhotzA3SEMID5qPiHSEntbLaD1W0=;
        b=SU0aORMcGPN9jAQcVeqSdoPQ6QJ3PVtJWq/EJHaUC7sRR5YYqpmGXNriAB7HzlM4NQ
         yawfwC/d8LUXBT66kgQfZg1VLXpT9FdRR3b2yj4UFQACYXmuvzqfLKjKA5VW1LZrTZsT
         0u5TIR/bNqwB1MvPgKnWaB//g+m+aI4BEVtMZIhz3apC+Yf9GU/7o49GpdwoSmvblTVU
         ihkp0BZftiaQgF1ZwMwjlvSG71VfwKu0zqWd5V5VuorZ1lcbXFzoJQhYaM3XrG1Mvi2X
         4dXIWAEcyxk4aBOll/BiYbRx/RcQeGXTzs7K7j0hqszIfLtR2cgSkr/vd3kvq5M3ugBv
         DDVQ==
X-Gm-Message-State: AJIora8js0RTOJEAew806YrFtpF/rnkRaJlfsw8FpW9jWRKHB3xhpDi/
	4eEbD478wUDUcVCN5+o4Q7g=
X-Google-Smtp-Source: AGRyM1v5oWSU07CfUHQBcDsJS2AJzY+++qTWksKGLH2SCBONeBvdzlc3GtYmLMhOu8HbK5mXjsXOYA==
X-Received: by 2002:a17:903:2351:b0:16d:9468:bb02 with SMTP id c17-20020a170903235100b0016d9468bb02mr11898940plh.82.1658979262115;
        Wed, 27 Jul 2022 20:34:22 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-54.three.co.id. [116.206.12.54])
        by smtp.gmail.com with ESMTPSA id h6-20020a056a00000600b00528c22fbb45sm15008851pfk.141.2022.07.27.20.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 20:34:21 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 3E949104A8A; Thu, 28 Jul 2022 10:34:16 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-next@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc-tw-discuss@lists.sourceforge.net
Subject: [PATCH 1/3] Documentation: powerpc: fix indentation warnings
Date: Thu, 28 Jul 2022 10:33:31 +0700
Message-Id: <20220728033332.27836-2-bagasdotme@gmail.com>
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

Sphinx reported unexpected indentation warnings:

Documentation/powerpc/elf_hwcaps.rst:82: WARNING: Unexpected indentation.
Documentation/powerpc/elf_hwcaps.rst:100: WARNING: Unexpected indentation.
Documentation/powerpc/elf_hwcaps.rst:117: WARNING: Unexpected indentation.
Documentation/powerpc/elf_hwcaps.rst:122: WARNING: Unexpected indentation.
Documentation/powerpc/elf_hwcaps.rst:144: WARNING: Unexpected indentation.

Fix these warnings by unindenting commit references and using literal code
block for instructions list for PPC_FEATURE_ICACHE_SNOOP.

Link: https://lore.kernel.org/linuxppc-dev/20220727220050.549db613@canb.auug.org.au/
Fixes: 3df1ff42e69e91 ("powerpc: add documentation for HWCAPs")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/powerpc/elf_hwcaps.rst | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/Documentation/powerpc/elf_hwcaps.rst b/Documentation/powerpc/elf_hwcaps.rst
index 96d4fc4a3f91fe..bb7438cebf36e8 100644
--- a/Documentation/powerpc/elf_hwcaps.rst
+++ b/Documentation/powerpc/elf_hwcaps.rst
@@ -78,8 +78,7 @@ PPC_FEATURE_64
 
 PPC_FEATURE_601_INSTR
     The processor is PowerPC 601.
-    Unused in the kernel since:
-      f0ed73f3fa2c ("powerpc: Remove PowerPC 601")
+    Unused in the kernel since f0ed73f3fa2c ("powerpc: Remove PowerPC 601")
 
 PPC_FEATURE_HAS_ALTIVEC
     Vector (aka Altivec, VMX) facility is available.
@@ -96,8 +95,7 @@ PPC_FEATURE_HAS_4xxMAC
 PPC_FEATURE_UNIFIED_CACHE
     The processor has a unified L1 cache for instructions and data, as
     found in NXP e200.
-    Unused in the kernel since:
-      39c8bf2b3cc1 ("powerpc: Retire e200 core (mpc555x processor)")
+    Unused in the kernel since 39c8bf2b3cc1 ("powerpc: Retire e200 core (mpc555x processor)")
 
 PPC_FEATURE_HAS_SPE
     Signal Processing Engine facility is available.
@@ -113,13 +111,11 @@ PPC_FEATURE_NO_TB
     This is a 601 specific HWCAP, so if it is known that the processor
     running is not a 601, via other HWCAPs or other means, it is not
     required to test this bit before using the timebase.
-    Unused in the kernel since:
-      f0ed73f3fa2c ("powerpc: Remove PowerPC 601")
+    Unused in the kernel since f0ed73f3fa2c ("powerpc: Remove PowerPC 601")
 
 PPC_FEATURE_POWER4
     The processor is POWER4 or PPC970/FX/MP.
-    POWER4 support dropped from the kernel since:
-      471d7ff8b51b ("powerpc/64s: Remove POWER4 support")
+    POWER4 support dropped from the kernel since 471d7ff8b51b ("powerpc/64s: Remove POWER4 support")
 
 PPC_FEATURE_POWER5
     The processor is POWER5.
@@ -140,7 +136,8 @@ PPC_FEATURE_ICACHE_SNOOP
     The processor icache is coherent with the dcache, and instruction storage
     can be made consistent with data storage for the purpose of executing
     instructions with the sequence (as described in, e.g., POWER9 Processor
-    User's Manual, 4.6.2.2 Instruction Cache Block Invalidate (icbi)):
+    User's Manual, 4.6.2.2 Instruction Cache Block Invalidate (icbi))::
+
         sync
         icbi (to any address)
         isync
-- 
An old man doll... just what I always wanted! - Clara

