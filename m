Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B07481BB3B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:07:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B4lZ4dkqzDq9n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:07:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TKZQMJ1e; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4Zh06fFzDqLq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 11:59:24 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id c21so6899777plz.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 18:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dSikgkyQRRqnXyHeHXdseMqryXrsv9BKD2B3PVxHMOo=;
 b=TKZQMJ1edNzwec8e+o0kCioJFMZb7YAGEsYOrnEbEqb+Q6O+tp790g/t8NVQYTXPVz
 o0bZZLMI5xIG6J5zhxWrjIHBW2zEKUXfOX2wF8wk5T+wvut6yiJ4zPGoMDlGgS/CojHz
 B++Kdqv7GhYgTNkIO2kgylCzcx+xu/pCnH2K9LphkhmgcdAmXLh0AkWA75QxmsUT+s6n
 mc0+tHnN0g2hotWL2uwdOEGvGgeLNZ78SduuHWrMSDhzm/etqIDjlMaDp7/ywdngjAxo
 W37WdCzF0Z8pHGX6FtB2HcxcjU83Z5wHPiJYIdHpHd+zKkpjv8iE4rwCR90o/4H/upNA
 ckkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dSikgkyQRRqnXyHeHXdseMqryXrsv9BKD2B3PVxHMOo=;
 b=XNr6UcwOp518lnkaI3El6tHZ2mmFvRsfpZ3ryBw9v+M0MJGa0wRw9Kxl7XBJnqF9UT
 b/CXRwCzBY3c7h+rjDroZhInTIG3kSG16zeKmRFpotxDnQ5dpldKRsRxsphWTCq8Cfi5
 VGY8lN7B96A547b+DCrRQ+6doGOA6NJCc6CzJObp92ay7KdZXXISzaaS+fZZnC0+sYQw
 gBU4XGf7GjfM7wCmdrQbdXVdSELc4iUagd2/b1+nYxeaNhp5cliE27TYcIhq5SviWtnZ
 1+PcQwEwtVgPV4L91i/cQCy8+Xz8pixOwfcedLPteeXGZnXklGR/y0Ur6CJw2JrVRxr9
 QcVA==
X-Gm-Message-State: AGi0PuZPhLhEuktroCN6Zy84bQnTiICxTrGd2CpWEIdnb5OOBq8S8vEU
 p2xlqO4cwUhMu19JGIlfFyeJyx0I1Bk=
X-Google-Smtp-Source: APiQypLuT8lotlgKEezTtYMncRnatPtMSOfY8+tx5FPJM3LWaFU2v1cOI5i9jgctzTpx4K6zPBgu3g==
X-Received: by 2002:a17:902:8509:: with SMTP id
 bj9mr27016060plb.64.1588039161942; 
 Mon, 27 Apr 2020 18:59:21 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.18.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 18:59:21 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 03/28] powerpc/xmon: Move breakpoints to text section
Date: Tue, 28 Apr 2020 11:57:49 +1000
Message-Id: <20200428015814.15380-4-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428015814.15380-1-jniethe5@gmail.com>
References: <20200428015814.15380-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The instructions for xmon's breakpoint are stored bpt_table[] which is in
the data section. This is problematic as the data section may be marked
as no execute. Move bpt_table[] to the text section.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v6: - New to series. Was part of the previous patch.
    - Make BPT_SIZE available in assembly
---
 arch/powerpc/kernel/asm-offsets.c |  8 ++++++++
 arch/powerpc/xmon/Makefile        |  2 +-
 arch/powerpc/xmon/xmon.c          |  6 +-----
 arch/powerpc/xmon/xmon_bpts.S     |  9 +++++++++
 arch/powerpc/xmon/xmon_bpts.h     | 14 ++++++++++++++
 5 files changed, 33 insertions(+), 6 deletions(-)
 create mode 100644 arch/powerpc/xmon/xmon_bpts.S
 create mode 100644 arch/powerpc/xmon/xmon_bpts.h

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index c25e562f1cd9..2401f415f423 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -70,6 +70,10 @@
 #include <asm/fixmap.h>
 #endif
 
+#ifdef CONFIG_XMON
+#include "../xmon/xmon_bpts.h"
+#endif
+
 #define STACK_PT_REGS_OFFSET(sym, val)	\
 	DEFINE(sym, STACK_FRAME_OVERHEAD + offsetof(struct pt_regs, val))
 
@@ -783,5 +787,9 @@ int main(void)
 	DEFINE(VIRT_IMMR_BASE, (u64)__fix_to_virt(FIX_IMMR_BASE));
 #endif
 
+#ifdef CONFIG_XMON
+	DEFINE(BPT_SIZE, BPT_SIZE);
+#endif
+
 	return 0;
 }
diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index c3842dbeb1b7..515a13ea6f28 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -21,7 +21,7 @@ endif
 
 ccflags-$(CONFIG_PPC64) := $(NO_MINIMAL_TOC)
 
-obj-y			+= xmon.o nonstdio.o spr_access.o
+obj-y			+= xmon.o nonstdio.o spr_access.o xmon_bpts.o
 
 ifdef CONFIG_XMON_DISASSEMBLY
 obj-y			+= ppc-dis.o ppc-opc.o
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index a064392df1b8..f7ce3ea8694c 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -62,6 +62,7 @@
 
 #include "nonstdio.h"
 #include "dis-asm.h"
+#include "xmon_bpts.h"
 
 #ifdef CONFIG_SMP
 static cpumask_t cpus_in_xmon = CPU_MASK_NONE;
@@ -108,7 +109,6 @@ struct bpt {
 #define BP_TRAP		2
 #define BP_DABR		4
 
-#define NBPTS	256
 static struct bpt bpts[NBPTS];
 static struct bpt dabr;
 static struct bpt *iabr;
@@ -116,10 +116,6 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
 
 #define BP_NUM(bp)	((bp) - bpts + 1)
 
-#define BPT_SIZE       (sizeof(unsigned int) * 2)
-#define BPT_WORDS      (BPT_SIZE / sizeof(unsigned int))
-static unsigned int bpt_table[NBPTS * BPT_WORDS];
-
 /* Prototypes */
 static int cmds(struct pt_regs *);
 static int mread(unsigned long, void *, int);
diff --git a/arch/powerpc/xmon/xmon_bpts.S b/arch/powerpc/xmon/xmon_bpts.S
new file mode 100644
index 000000000000..f3ad0ab50854
--- /dev/null
+++ b/arch/powerpc/xmon/xmon_bpts.S
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/ppc_asm.h>
+#include <asm/asm-compat.h>
+#include <asm/asm-offsets.h>
+#include "xmon_bpts.h"
+
+.global bpt_table
+bpt_table:
+	.space NBPTS * BPT_SIZE
diff --git a/arch/powerpc/xmon/xmon_bpts.h b/arch/powerpc/xmon/xmon_bpts.h
new file mode 100644
index 000000000000..b7e94375db86
--- /dev/null
+++ b/arch/powerpc/xmon/xmon_bpts.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef XMON_BPTS_H
+#define XMON_BPTS_H
+
+#define NBPTS	256
+#ifndef __ASSEMBLY__
+#define BPT_SIZE	(sizeof(unsigned int) * 2)
+#define BPT_WORDS	(BPT_SIZE / sizeof(unsigned int))
+
+extern unsigned int bpt_table[NBPTS * BPT_WORDS];
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* XMON_BPTS_H */
-- 
2.17.1

