Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EAA6C8E60
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 14:08:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkKCG33Gdz3fXV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 00:08:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jaYD4AjV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jaYD4AjV;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkK9M1TGrz3cFT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 00:07:02 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id kc4so4213262plb.10
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 06:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679749621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGJFKriA0t+tGM3muqUebf9E7T9zJf4TI22p3H1XmlU=;
        b=jaYD4AjVANoZ9HDSmzYbrTrPOt2KP8VQuFG6S72PQIzTGjiblNrGd4l6yimDs8ymbx
         m4Wi99w6QjyjKWDYOhtPPU4LLVwNlwwSJNBA3tMN7rUmgpQKmNppOnkCCAlwwRI2f2Cp
         P59UIPbwTxo2Bqt+jTrcjS2maa4amG7yL+iPUOden3+oTGNf1/hI0ifdeL/51I+0OXJe
         my6ekZJvZ9hjqrzzMSTbuU4xMdZswdDUL5pSkc0HiFnvk4IQPrp2VcMCfydMVy+YG5rU
         LBFJj1lwgZxljIVuBCPpc5HVe6MFT07j1rhmxZfV58ycfTicZMXL2Es6WmDCPv9iqQI9
         P+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679749621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGJFKriA0t+tGM3muqUebf9E7T9zJf4TI22p3H1XmlU=;
        b=aM6vwmk3gdE6uQxPJANynF1Ho8wlclIR0BdM0SjJD4YuhbOn1uWfmI7irc2e2KoiHd
         HNHMAc8XRTj+LEq21mQi9btoqqKUbtGRcIHDM8z6O8k/zi4wgJbN9L+aIWl3xUQyP3aM
         JJtc6X8iwgtRjHsDcVgAovGX/i20t6N6GVoo/hqw6ZqDFv5AjV/ddWk47qFcfPe7gTv4
         NUxturNL41M+YEEsIjUza3o704NFaWcA4fE50Bo9MgR1nLqfoRBEQI6B/32Yu/6Bl451
         q1Iomz05X+SKFQ4LMgU5htypCX9S7DjBisYLXlH+XvKoxfQrvkrd/eqPbvjnmQWTZnwW
         //oQ==
X-Gm-Message-State: AAQBX9cM9vLpoHHy+I28hWFYhM6F0pTum8UkK2mfiSkeibZ4NNkIfdL2
	s6Mco2DOomh5Ebr/kbX/4Ptp1Wyd9/I=
X-Google-Smtp-Source: AKy350ZOs0j8cUaJGae9IK5J1iLbEmoB5SY1jfv2WfTwsQtwyZr9F0h7+qPcHDme/QwtgbAoB1Dj6A==
X-Received: by 2002:a17:90b:350f:b0:23d:4a40:e794 with SMTP id ls15-20020a17090b350f00b0023d4a40e794mr5879002pjb.10.1679749621042;
        Sat, 25 Mar 2023 06:07:01 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.191])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090aa79600b002311dbb2bc5sm1470130pjq.45.2023.03.25.06.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 06:07:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 2/2] powerpc/64: Rename entry_64.S to prom_entry.S
Date: Sat, 25 Mar 2023 23:06:51 +1000
Message-Id: <20230325130651.2457266-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230325130651.2457266-1-npiggin@gmail.com>
References: <20230325130651.2457266-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This file contains only the enter_prom implementation now.
Trim includes and update header comment while we're here.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/Makefile                  |  8 +++--
 .../kernel/{entry_64.S => prom_entry.S}       | 30 ++-----------------
 scripts/head-object-list.txt                  |  2 +-
 3 files changed, 9 insertions(+), 31 deletions(-)
 rename arch/powerpc/kernel/{entry_64.S => prom_entry.S} (73%)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index ec70a1748506..ebba0896998a 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -209,10 +209,12 @@ CFLAGS_paca.o			+= -fno-stack-protector
 
 obj-$(CONFIG_PPC_FPU)		+= fpu.o
 obj-$(CONFIG_ALTIVEC)		+= vector.o
-obj-$(CONFIG_PPC64)		+= entry_64.o
-obj-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE)	+= prom_init.o
 
-extra-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE)	+= prom_init_check
+ifdef CONFIG_PPC_OF_BOOT_TRAMPOLINE
+obj-y				+= prom_init.o
+obj-$(CONFIG_PPC64)		+= prom_entry.o
+extra-y				+= prom_init_check
+endif
 
 quiet_cmd_prom_init_check = PROMCHK $@
       cmd_prom_init_check = $(CONFIG_SHELL) $< "$(NM)" $(obj)/prom_init.o; touch $@
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/prom_entry.S
similarity index 73%
rename from arch/powerpc/kernel/entry_64.S
rename to arch/powerpc/kernel/prom_entry.S
index f3d3885ee9fd..0b65b2150e37 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/prom_entry.S
@@ -10,41 +10,17 @@
  *    Copyright (C) 1996 Paul Mackerras.
  *  MPC8xx modifications Copyright (C) 1997 Dan Malek (dmalek@jlc.net).
  *
- *  This file contains the system call entry code, context switch
- *  code, and exception/interrupt return code for PowerPC.
+ *  This file contains the prom entry code.
  */
-
-#include <linux/errno.h>
-#include <linux/err.h>
-#include <asm/cache.h>
-#include <asm/unistd.h>
-#include <asm/processor.h>
-#include <asm/page.h>
-#include <asm/mmu.h>
-#include <asm/thread_info.h>
-#include <asm/code-patching-asm.h>
-#include <asm/ppc_asm.h>
 #include <asm/asm-offsets.h>
-#include <asm/cputable.h>
-#include <asm/firmware.h>
-#include <asm/bug.h>
-#include <asm/ptrace.h>
-#include <asm/irqflags.h>
-#include <asm/hw_irq.h>
-#include <asm/context_tracking.h>
-#include <asm/ppc-opcode.h>
-#include <asm/barrier.h>
-#include <asm/export.h>
-#include <asm/asm-compat.h>
 #ifdef CONFIG_PPC_BOOK3S
 #include <asm/exception-64s.h>
 #else
 #include <asm/exception-64e.h>
 #endif
-#include <asm/feature-fixups.h>
-#include <asm/kup.h>
+#include <asm/ppc_asm.h>
 
-	.section	".text"
+.section ".text","ax",@progbits
 
 _GLOBAL(enter_prom)
 	mflr	r0
diff --git a/scripts/head-object-list.txt b/scripts/head-object-list.txt
index b2a0e21ea8d7..f0ee936872fc 100644
--- a/scripts/head-object-list.txt
+++ b/scripts/head-object-list.txt
@@ -34,7 +34,7 @@ arch/powerpc/kernel/head_64.o
 arch/powerpc/kernel/head_8xx.o
 arch/powerpc/kernel/head_85xx.o
 arch/powerpc/kernel/head_book3s_32.o
-arch/powerpc/kernel/entry_64.o
+arch/powerpc/kernel/prom_entry.o
 arch/powerpc/kernel/fpu.o
 arch/powerpc/kernel/vector.o
 arch/powerpc/kernel/prom_init.o
-- 
2.37.2

