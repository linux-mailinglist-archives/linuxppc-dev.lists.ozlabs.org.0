Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02D1723810
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 08:48:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb1K83hYNz30CT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 16:48:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EwyBc+yO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EwyBc+yO;
	dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb1HN31Jbz3bhY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 16:47:10 +1000 (AEST)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-38dec65ab50so4959099b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 23:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686034028; x=1688626028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+2hnibm51Z4eFyIfbE8qClOlpPWVMFeBYurMpTccNA=;
        b=EwyBc+yOi7YcUxqOQo8JQrqI4v8ZyizmnbJVxtGnEYG+waQ3pz1BetXixpOzWwiSzV
         86SPWV1UktTu45LqZDrsHhhEOCd/b8gM7Atwm/MsAKanLlZhMdy1tLU42WkCJAKscbQR
         MY1/pB77fWp0na172bt5rbmZzterjy+C/4Kgp3pOi1YhfoNM4weJ/RMoCMJhycOGyviy
         TeU5JDTrsW6iDn4cvIOkkfeZqOamExkC3Ko459hreg854gnNkFmN2P3S/s8jLf9IaMvb
         jv9RWkkEuY7G/6cGD317bHAHordI+SsXJJ7tzchwWN/HTRQiODlHQIbT+GUusHdq8c+p
         +log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686034028; x=1688626028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+2hnibm51Z4eFyIfbE8qClOlpPWVMFeBYurMpTccNA=;
        b=US0FhN9KrJqizsY837d03GeJt3LtSVGa5Iok4XtxGGLc5zvPQiZUoBFKxrDXzGZbvR
         b91Nuvt9LwRR+M17GddnLbXJ+v6UypFWrcNr4ufDv53q29PRJ/fwcaH69XfYG60+ZHmx
         nRWuQgCzGaDY2P+cgMMhedAWVvYjZr8irw/aFRb7khcMz86s2ga5OinvccNkZ/ocqFCV
         jxwiwxCY6elIFJN7T4R9o74KdS4iAoeswj53S7NBCXJGoqmwg/W3ke9xJxc9MeO+JqKU
         9NclKZhKmXj4ObGy4XwhCJlsvKBJ1NaEZnt0MF7vkz5vEQptYqvbkwhmrdQoVhNu+3pa
         oDvA==
X-Gm-Message-State: AC+VfDxINxs34JYKcuRP1Lr6dFVfkCohXHEDtZ/mCdqLV152B5YG0iQO
	IPcLLLyLxRqQoKUYODj3QQwjyE7JZpc=
X-Google-Smtp-Source: ACHHUZ4SLzW1rHU4+fCkkBL2aPJ2Q3IP9TTci0SQHDiTvm4lyioEIM3vGxcZDq/IFm/Ql0DAE4TELQ==
X-Received: by 2002:aca:2419:0:b0:39a:c202:b2e with SMTP id n25-20020aca2419000000b0039ac2020b2emr1189620oic.28.1686034027908;
        Mon, 05 Jun 2023 23:47:07 -0700 (PDT)
Received: from wheely.local0.net ([1.146.61.5])
        by smtp.gmail.com with ESMTPSA id c14-20020aa78e0e000000b0063d24fcc2besm6130449pfr.125.2023.06.05.23.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 23:47:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/4] powerpc/boot: Separate target flags from BOOTCFLAGS
Date: Tue,  6 Jun 2023 16:46:54 +1000
Message-Id: <20230606064657.183969-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606064657.183969-1-npiggin@gmail.com>
References: <20230606064657.183969-1-npiggin@gmail.com>
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
 arch/powerpc/boot/Makefile | 41 ++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 771b79423bbc..ae80f7f1774e 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -39,33 +39,44 @@ BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		 $(LINUXINCLUDE)
 
 ifdef CONFIG_PPC64_BOOT_WRAPPER
-BOOTCFLAGS	+= -m64
+BOOTTARGETFLAGS	+= -m64
+BOOTTARGETFLAGS	+= -mabi=elfv2
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
 
@@ -73,6 +84,8 @@ BOOTCFLAGS	+= $(call cc-option,-mno-prefixed) \
 		   $(call cc-option,-mno-pcrel) \
 		   $(call cc-option,-mno-mma)
 
+BOOTCFLAGS	+= $(BOOTTARGETFLAGS)
+
 ifdef CONFIG_CC_IS_CLANG
 BOOTCFLAGS += $(CLANG_FLAGS)
 BOOTAFLAGS += $(CLANG_FLAGS)
@@ -91,16 +104,6 @@ BOOTCFLAGS	+= -I$(objtree)/$(obj) -I$(srctree)/$(obj)
 
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
2.40.1

