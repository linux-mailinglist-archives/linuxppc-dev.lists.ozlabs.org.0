Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE650702310
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 06:51:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKRmD4gHvz3f0R
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 14:51:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JqGxmEw8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JqGxmEw8;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKRdx6HYLz3drn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 14:46:13 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1aaf2ede38fso118625205ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 21:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684125971; x=1686717971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=539a8Q6ECQEkUK6uK2+g3h67pMcWc4KSAEB1NWhwDtg=;
        b=JqGxmEw89mg1DwRBrWyydOLH75E/tjmvnUYh287yNbpDzWKoV6FDU+c7Rm4t3JD5cn
         +X/jPsqdVE0iRzkmqSUOyYyKUtxzJwL73V7FqmnVO5f1NjqMXuA6sLzMpYb/RV6EoqAt
         LOPQIcDFjObppr0vihxzpAtN4EewsV223nVirWjs9Q8kQGWicpsec/975EN8RzxWirof
         bGQv7Ynf10jMCqTUEFzykFSK207GVY6vMnv9/f6of3iC3xM6u7PtRIMswXCEXhagacmZ
         2Bwc8Xen4Q20T0dpNWB6hzh3PONXAKth/CSmjRwPVkoAbdD8LmyXWqGEfgPg1B/21VcC
         t3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684125971; x=1686717971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=539a8Q6ECQEkUK6uK2+g3h67pMcWc4KSAEB1NWhwDtg=;
        b=L5BOqIrKChtzGGZojdkc85Acai75fs5SqLlfe6zh7kEPwRLXuR53XY2o8rPO3ilQSm
         MZZg5hP0gBfQQVy955659tsoVzu+BQfk00wtO3gBMViN89kLFFvn3Nam3/Qfpj27Mx7U
         icb1Zzl+c8CMGzXgXXUBC65YtUIHl0Sq5PpgAjwnevHFRruf9ZTpeqbnfTmPHQU+I+ZP
         JNj8Hl7OigGhSd011ISznMubpf7wJoWxYAoOOnu5uUskBtNdCcIzX+lsJrGxsS8cFeAZ
         /0M0M07LXjQWpNruwFwEDtgNoyN8E4c3CMDMp1x5kooc+AybvWnmHC+GW/NAqQ/8zf01
         j7Ng==
X-Gm-Message-State: AC+VfDxPPZM6Iw1geIFbOqoIr/HPV/cbBtMm4JGwwlP7K+0QM5vCRsXJ
	oF4FxQ6TlGzbz28xVn7F3OkZq22g5SwNqg==
X-Google-Smtp-Source: ACHHUZ40Cq/1MPxjy8VWRavRQhLRE4ZW5odqXIslZGDG/8zEsMNHdlZzJgg1KZsrk7nv7OCHqddGBQ==
X-Received: by 2002:a17:903:280b:b0:1ab:197d:2de1 with SMTP id kp11-20020a170903280b00b001ab197d2de1mr29040934plb.2.1684125971066;
        Sun, 14 May 2023 21:46:11 -0700 (PDT)
Received: from wheely.local0.net ([1.146.102.8])
        by smtp.gmail.com with ESMTPSA id u17-20020a170903125100b001a64851087bsm2514018plh.272.2023.05.14.21.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 21:46:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 6/6] powerpc/64: Rename entry_64.S to prom_entry_64.S
Date: Mon, 15 May 2023 14:45:43 +1000
Message-Id: <20230515044543.78903-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515044543.78903-1-npiggin@gmail.com>
References: <20230515044543.78903-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/Makefile                  |  8 +++--
 .../kernel/{entry_64.S => prom_entry_64.S}    | 30 ++-----------------
 scripts/head-object-list.txt                  |  2 +-
 3 files changed, 9 insertions(+), 31 deletions(-)
 rename arch/powerpc/kernel/{entry_64.S => prom_entry_64.S} (73%)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index ec70a1748506..f94c893e014d 100644
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
+obj64-y				+= prom_entry_64.o
+extra-y				+= prom_init_check
+endif
 
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

