Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D04724471
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 15:30:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbBDn5LJJz3fdS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 23:30:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=auhkzrR1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=auhkzrR1;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbB6d32Xrz3bxt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 23:25:13 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b010338d82so28456855ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 06:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686057912; x=1688649912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XE/vjYsszVu5Z8dEAjUAUnjGvdwozskr+4tITz+A+Y=;
        b=auhkzrR1bxrG7CvNNn4kOFzFG7OFCnwIG+mXQsoUgrAJF5DBUXwc0W3sOdGNb2pAt3
         xDE65JKIeYHaPLAw20+XmWvm1ophn9ux7OfU4/ej2mIBXD/18WqrB+1bcRJdmTHr99ht
         8+LamIv7l+UO5FyQ8In99Zn3mSrBqS58MTKHWM8EBWkep3FYdEYycSKjR+yGTaUwD2CN
         Y3cdXEKXVHpuj3YKBagYHis18OqxRh1uAqQrEu4yFM44dic24YE5myCLRnUDp9S01THs
         S1yA1h2b//0aIlnabVIKenpb0TA00ZKaY8LxRWy5CZ8ViZa/VekCsivfYT9wmVM8tEWp
         LM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057912; x=1688649912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XE/vjYsszVu5Z8dEAjUAUnjGvdwozskr+4tITz+A+Y=;
        b=iZOa2lXRiTpFNFpM+kOeVtEVo4ea5RWEA2sVHS9QMFZjfan0YC86karScXDVNQrxRp
         99G++Yunmp6aNcDWAONsRPw5gi+/OAJZyRMA9UZsFZmIC/N8YPy38JgRHYVaSLOO2ZpV
         7jB5uT/ZmVL1O9bapBDkdw03l21O3HpQogjmBKbCDx2u1aSMnw5s5FmYgxvpJSMJFjGp
         AfVqZFIgd118apn5b5Tu4YqEX7IqpGFkueVCw0oq9Cu1A29Axf18427KVtKHdmdW+6PH
         tkxmdQ7R546eHimWbB5xhxpz2GP6lJ7A7hRJA/xieN8ciDIeQSCq8uAwKdl7fURhnSho
         Gt5g==
X-Gm-Message-State: AC+VfDxr2efhu2xQlkS0BSUJFnyhR/EIiKztQ6x1af/Ohr4hpVIFC6qX
	APbwCxXTOYRst0VdQDyqKQ7wZRAjJn8=
X-Google-Smtp-Source: ACHHUZ6qafQLI0HeQWrSDWPnMPdrilbFV+sNhMG5QpoVcWwqgauBwm4qHglKn8BBhk06uODetVkY8g==
X-Received: by 2002:a17:902:e74f:b0:1ac:b363:83a6 with SMTP id p15-20020a170902e74f00b001acb36383a6mr618941plf.17.1686057912491;
        Tue, 06 Jun 2023 06:25:12 -0700 (PDT)
Received: from wheely.local0.net (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id jd18-20020a170903261200b001ac2c3e54adsm8522132plb.118.2023.06.06.06.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:25:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 6/6] powerpc/64: Rename entry_64.S to prom_entry_64.S
Date: Tue,  6 Jun 2023 23:24:47 +1000
Message-Id: <20230606132447.315714-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606132447.315714-1-npiggin@gmail.com>
References: <20230606132447.315714-1-npiggin@gmail.com>
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

This file contains only the enter_prom implementation now.
Trim includes and update header comment while we're here.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/Makefile                  | 12 ++++----
 .../kernel/{entry_64.S => prom_entry_64.S}    | 30 ++-----------------
 scripts/head-object-list.txt                  |  2 +-
 3 files changed, 10 insertions(+), 34 deletions(-)
 rename arch/powerpc/kernel/{entry_64.S => prom_entry_64.S} (73%)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index ec70a1748506..2919433be355 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -165,9 +165,6 @@ endif
 
 obj64-$(CONFIG_PPC_TRANSACTIONAL_MEM)	+= tm.o
 
-obj-$(CONFIG_PPC64)		+= $(obj64-y)
-obj-$(CONFIG_PPC32)		+= $(obj32-y)
-
 ifneq ($(CONFIG_XMON)$(CONFIG_KEXEC_CORE)(CONFIG_PPC_BOOK3S),)
 obj-y				+= ppc_save_regs.o
 endif
@@ -209,10 +206,13 @@ CFLAGS_paca.o			+= -fno-stack-protector
 
 obj-$(CONFIG_PPC_FPU)		+= fpu.o
 obj-$(CONFIG_ALTIVEC)		+= vector.o
-obj-$(CONFIG_PPC64)		+= entry_64.o
-obj-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE)	+= prom_init.o
 
-extra-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE)	+= prom_init_check
+obj-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_init.o
+obj64-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_entry_64.o
+extra-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) += prom_init_check
+
+obj-$(CONFIG_PPC64)		+= $(obj64-y)
+obj-$(CONFIG_PPC32)		+= $(obj32-y)
 
 quiet_cmd_prom_init_check = PROMCHK $@
       cmd_prom_init_check = $(CONFIG_SHELL) $< "$(NM)" $(obj)/prom_init.o; touch $@
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/prom_entry_64.S
similarity index 73%
rename from arch/powerpc/kernel/entry_64.S
rename to arch/powerpc/kernel/prom_entry_64.S
index f3d3885ee9fd..f1b8793d28c6 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/prom_entry_64.S
@@ -10,41 +10,17 @@
  *    Copyright (C) 1996 Paul Mackerras.
  *  MPC8xx modifications Copyright (C) 1997 Dan Malek (dmalek@jlc.net).
  *
- *  This file contains the system call entry code, context switch
- *  code, and exception/interrupt return code for PowerPC.
+ *  This file contains the 64-bit prom entry code.
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
index b2a0e21ea8d7..26359968744e 100644
--- a/scripts/head-object-list.txt
+++ b/scripts/head-object-list.txt
@@ -34,7 +34,7 @@ arch/powerpc/kernel/head_64.o
 arch/powerpc/kernel/head_8xx.o
 arch/powerpc/kernel/head_85xx.o
 arch/powerpc/kernel/head_book3s_32.o
-arch/powerpc/kernel/entry_64.o
+arch/powerpc/kernel/prom_entry_64.o
 arch/powerpc/kernel/fpu.o
 arch/powerpc/kernel/vector.o
 arch/powerpc/kernel/prom_init.o
-- 
2.40.1

