Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EF16EEDEF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 08:02:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5pDV3XgLz3fQm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 16:02:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bswwayG2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bswwayG2;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5p8n0Ysyz3cMT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 15:59:04 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-63f273b219eso3204114b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 22:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682488743; x=1685080743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zo1/yjNOfcKqwxbQM0yUPB1HZeUxs37U5d31WFHyGc=;
        b=bswwayG2Y/c38JHEuBRJx/I60bLI6llQuyH1paR0NYWW5qhPBw1JOND166Zqoi8jd/
         e4Zzne3DCNZqzbd+tYE/xweokcPYBGXNier52TOsBoADKi2GpeBdJzfRMsylFJSRhF9f
         g3wAD3VMofN3f1onqeLkNmi9XP9zBwO5BTfPYj+ud90tlTto8sqvfX77fC7KbSxW1kAE
         g/TIYVL9R87SHUAwHiMYiuy/m45bciAM8njYFhSCuUQd6mhX2UVjSNauOf1PbhQ4T9le
         1ZLPKcQUoVtpnicnRkFABr7aGM73TMoV1iJCfXZ0j2zzkkWZgojeHzpweXvA65UkM5wy
         q/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682488743; x=1685080743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zo1/yjNOfcKqwxbQM0yUPB1HZeUxs37U5d31WFHyGc=;
        b=aX4q/E4fiTDO+jRdJw9/DkiwVPATqquh4osOrwkVe+31zcAYwWautG8x85Q/Wbz6AI
         sI43SlyK+bdPn3TBklnLKnlVgFXuVwAQDomabg4cyQKYvyHWWJ4HYCrTv349FgGDlG3u
         UBjxKUe4vA3cBHwQoIhxg5zS4JKBHc+NYNkQ0HwpizwOedFyWZmYajxG6NWUycqyLITL
         5SbwyxBgDorCAhJzO5aIOfsDIqRGire+lAK4PqGOMtvmPtC3OcQAvG/C9daTZV6/hX8O
         oUHWjW/VrtR1p7yds4/dn7pPAyqR0pvZz8R4QUpLurVIHJ0fQ4fV8NsAZxPZQFuJBzrp
         O7bA==
X-Gm-Message-State: AAQBX9c+wqJe5Q+K6hDW30sTnRvemlDUfhu25K0I+bypEQOHm1UDoFnr
	4dH6HHnF2hA+vOgATLWJ0QLCTtj0XKzSDw==
X-Google-Smtp-Source: AKy350YZrmWYhqyX3AY5HJBwwTNVekoApqk/ULJZ83OR4dQU1x8v9Gc8cloFDKCtRBwEmC5XmhH3Zw==
X-Received: by 2002:a05:6a00:1408:b0:63d:3339:e967 with SMTP id l8-20020a056a00140800b0063d3339e967mr24343671pfu.19.1682488742704;
        Tue, 25 Apr 2023 22:59:02 -0700 (PDT)
Received: from wheely.local0.net ([203.221.203.54])
        by smtp.gmail.com with ESMTPSA id f25-20020aa782d9000000b0063a1e7d7439sm10300479pfn.69.2023.04.25.22.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 22:59:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/9] powerpc/boot: Seperate target flags from BOOTCFLAGS
Date: Wed, 26 Apr 2023 15:58:40 +1000
Message-Id: <20230426055848.402993-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426055848.402993-1-npiggin@gmail.com>
References: <20230426055848.402993-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add BOOTTARGETFLAGS variable with target / ABI options common to
CFLAGS and AFLAGS.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/boot/Makefile | 40 ++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 85cde5bf04b7..84a5b630c739 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -41,36 +41,48 @@ BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		 $(LINUXINCLUDE)
 
 ifdef CONFIG_PPC64_BOOT_WRAPPER
-BOOTCFLAGS	+= -m64
+BOOTTARGETFLAGS	:= -m64
 ifdef CONFIG_PPC64_ELF_ABI_V2
-BOOTCFLAGS	+= $(call cc-option,-mabi=elfv2)
+BOOTTARGETFLAGS	+= $(call cc-option,-mabi=elfv2)
 endif
 else
-BOOTCFLAGS	+= -m32
+BOOTTARGETFLAGS	:= -m32
 endif
 
 ifdef CONFIG_TARGET_CPU_BOOL
-BOOTCFLAGS	+= -mcpu=$(CONFIG_TARGET_CPU)
+BOOTTARGETFLAGS	+= -mcpu=$(CONFIG_TARGET_CPU)
 else ifdef CONFIG_PPC64_BOOT_WRAPPER
 ifdef CONFIG_CPU_LITTLE_ENDIAN
-BOOTCFLAGS	+= -mcpu=powerpc64le
+BOOTTARGETFLAGS	+= -mcpu=powerpc64le
 else
-BOOTCFLAGS	+= -mcpu=powerpc64
+BOOTTARGETFLAGS	+= -mcpu=powerpc64
 endif
 endif
 
+$(obj)/4xx.o: BOOTTARGETFLAGS += -mcpu=405
+$(obj)/ebony.o: BOOTTARGETFLAGS += -mcpu=440
+$(obj)/cuboot-hotfoot.o: BOOTTARGETFLAGS += -mcpu=405
+$(obj)/cuboot-taishan.o: BOOTTARGETFLAGS += -mcpu=440
+$(obj)/cuboot-katmai.o: BOOTTARGETFLAGS += -mcpu=440
+$(obj)/cuboot-acadia.o: BOOTTARGETFLAGS += -mcpu=405
+$(obj)/treeboot-iss4xx.o: BOOTTARGETFLAGS += -mcpu=405
+$(obj)/treeboot-currituck.o: BOOTTARGETFLAGS += -mcpu=405
+$(obj)/treeboot-akebono.o: BOOTTARGETFLAGS += -mcpu=405
+
 BOOTCFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
 
 ifdef CONFIG_CPU_BIG_ENDIAN
-BOOTCFLAGS	+= -mbig-endian
+BOOTTARGETFLAGS	+= -mbig-endian
 else
-BOOTCFLAGS	+= -mlittle-endian
+BOOTTARGETFLAGS	+= -mlittle-endian
 endif
 
-BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTCFLAGS) -nostdinc
+BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTTARGETFLAGS) $(BOOTCFLAGS) -nostdinc
 
 BOOTARFLAGS	:= -crD
 
+BOOTCFLAGS	+= $(BOOTTARGETFLAGS)
+
 ifdef CONFIG_CC_IS_CLANG
 BOOTCFLAGS += $(CLANG_FLAGS)
 BOOTAFLAGS += $(CLANG_FLAGS)
@@ -89,16 +101,6 @@ BOOTCFLAGS	+= -I$(objtree)/$(obj) -I$(srctree)/$(obj)
 
 DTC_FLAGS	?= -p 1024
 
-$(obj)/4xx.o: BOOTCFLAGS += -mcpu=405
-$(obj)/ebony.o: BOOTCFLAGS += -mcpu=440
-$(obj)/cuboot-hotfoot.o: BOOTCFLAGS += -mcpu=405
-$(obj)/cuboot-taishan.o: BOOTCFLAGS += -mcpu=440
-$(obj)/cuboot-katmai.o: BOOTCFLAGS += -mcpu=440
-$(obj)/cuboot-acadia.o: BOOTCFLAGS += -mcpu=405
-$(obj)/treeboot-iss4xx.o: BOOTCFLAGS += -mcpu=405
-$(obj)/treeboot-currituck.o: BOOTCFLAGS += -mcpu=405
-$(obj)/treeboot-akebono.o: BOOTCFLAGS += -mcpu=405
-
 # The pre-boot decompressors pull in a lot of kernel headers and other source
 # files. This creates a bit of a dependency headache since we need to copy
 # these files into the build dir, fix up any includes and ensure that dependent
-- 
2.40.0

