Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3E119F161
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 10:15:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wjys0S1JzDqxD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 18:15:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kpSd6RHz; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wjrX1HwTzDqsy
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 18:10:04 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id q16so2814737pje.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 01:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=idOvpcmegmFW5OtPRB7i9Zm3j4ribdW2QlE7pxwj4z0=;
 b=kpSd6RHz12AjzXiEvi57wIj4wD4ntTXyMds8DjR2JTYHPPvxV/Lz3AFxA+A6OqYmuH
 Ke17hWYccGeev3OOH0nm1QZ4oRGv9/8LDRAih7NH3Yq0uYh2StbpUre/PZboYazpbZZs
 3YnwU58fh05pHpheZrASKUZu6moHnHfVgliElJ5kJqllwoEF+sTdUPXkTRnAWqXu1cLD
 HMoayg55ImQ0GUL7zjntXZ8VmS/8+8lwzaCkIMu3m0LJZ1wBKFvCvg1G7StGnKrpNPlT
 bgdrbKlOlYOVQAcdnJjJoemVL2N8L+ZslZ6mluLzPnBJohZmnT47iGovgHoNibiTjTM3
 lGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=idOvpcmegmFW5OtPRB7i9Zm3j4ribdW2QlE7pxwj4z0=;
 b=UNtXVPzl+OM4B6VbMf3oTbRstJLtZyWV1GOZ16JnsdTn6lPenGKyZ3LK7fmuYkZEAM
 LR/qo5L88gsNO6UQD0POtbDIQZt4RcloyQU47PbQIC7uTxA8ymJP0uIfJ1XP3GiEZ7Zr
 62612AusHmhDCq/qsSpE74kWcyHg48j04Xhy/SCUlkRcRXKqsAsKo/C129NLsLDH85VQ
 JILuJgFof3LLQafclw4rV74AousG7K6Pe4MIrRCd7tGPrM5/pMSa8mjAm299fzGqabDd
 8ZGaimFVMtc+2Dw7chxRFKmXAsDE3kvukecIHdjuuqqOnF4jTihnMih+qwxeh84K+DpT
 iUIg==
X-Gm-Message-State: AGi0PuaigntchJFzc5lHXFD9aAtEfcWxi2CNL1/v+w8X8FK2+Jkn2dnj
 kcpe4Af1hl23gnSHuVt1lrw5qH+mcVk=
X-Google-Smtp-Source: APiQypLeSLvWjsZSZiUkadPfv0hAXL+CehX5lOfwhc8LIBhOEAyCl8thGkYrNV+mxpKvjJM+JJjFxw==
X-Received: by 2002:a17:90a:364d:: with SMTP id
 s71mr23895244pjb.185.1586160601105; 
 Mon, 06 Apr 2020 01:10:01 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id m2sm11460406pjk.4.2020.04.06.01.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 01:10:00 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 02/21] powerpc/xmon: Move out-of-line instructions to text
 section
Date: Mon,  6 Apr 2020 18:09:17 +1000
Message-Id: <20200406080936.7180-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406080936.7180-1-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
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

To execute an instruction out of line after a breakpoint, the NIP is set
to the address of struct bpt::instr. Here a copy of the instruction that
was replaced with a breakpoint is kept, along with a trap so normal flow
can be resumed after XOLing. The struct bpt's are located within the
data section. This is problematic as the data section may be marked as
no execute.

Instead of each struct bpt holding the instructions to be XOL'd, make a
new array, bpt_table[], with enough space to hold instructions for the
number of supported breakpoints. Place this array in the text section.
Make struct bpt::instr a pointer to the instructions in bpt_table[]
associated with that breakpoint. This association is a simple mapping:
bpts[n] -> bpt_table[n * words per breakpoint]. Currently we only need
the copied instruction followed by a trap, so 2 words per breakpoint.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
v5: - Do not use __section(), use a .space directive in .S file
    - Simplify in_breakpoint_table() calculation
    - Define BPT_SIZE
---
 arch/powerpc/xmon/Makefile    |  2 +-
 arch/powerpc/xmon/xmon.c      | 23 +++++++++++++----------
 arch/powerpc/xmon/xmon_bpts.S |  8 ++++++++
 arch/powerpc/xmon/xmon_bpts.h |  8 ++++++++
 4 files changed, 30 insertions(+), 11 deletions(-)
 create mode 100644 arch/powerpc/xmon/xmon_bpts.S
 create mode 100644 arch/powerpc/xmon/xmon_bpts.h

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
index 02e3bd62cab4..049375206510 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -62,6 +62,7 @@
 
 #include "nonstdio.h"
 #include "dis-asm.h"
+#include "xmon_bpts.h"
 
 #ifdef CONFIG_SMP
 static cpumask_t cpus_in_xmon = CPU_MASK_NONE;
@@ -97,7 +98,7 @@ static long *xmon_fault_jmp[NR_CPUS];
 /* Breakpoint stuff */
 struct bpt {
 	unsigned long	address;
-	unsigned int	instr[2];
+	unsigned int	*instr;
 	atomic_t	ref_count;
 	int		enabled;
 	unsigned long	pad;
@@ -108,7 +109,6 @@ struct bpt {
 #define BP_TRAP		2
 #define BP_DABR		4
 
-#define NBPTS	256
 static struct bpt bpts[NBPTS];
 static struct bpt dabr;
 static struct bpt *iabr;
@@ -116,6 +116,10 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
 
 #define BP_NUM(bp)	((bp) - bpts + 1)
 
+#define BPT_SIZE	(sizeof(unsigned int) * 2)
+#define BPT_WORDS	(BPT_SIZE / sizeof(unsigned int))
+extern unsigned int bpt_table[NBPTS * BPT_WORDS];
+
 /* Prototypes */
 static int cmds(struct pt_regs *);
 static int mread(unsigned long, void *, int);
@@ -853,15 +857,13 @@ static struct bpt *in_breakpoint_table(unsigned long nip, unsigned long *offp)
 {
 	unsigned long off;
 
-	off = nip - (unsigned long) bpts;
-	if (off >= sizeof(bpts))
+	off = nip - (unsigned long) bpt_table;
+	if (off >= sizeof(bpt_table))
 		return NULL;
-	off %= sizeof(struct bpt);
-	if (off != offsetof(struct bpt, instr[0])
-	    && off != offsetof(struct bpt, instr[1]))
+	*offp = off % BPT_SIZE;
+	if (*offp != 0 && *offp != 4)
 		return NULL;
-	*offp = off - offsetof(struct bpt, instr[0]);
-	return (struct bpt *) (nip - off);
+	return bpts + (off / BPT_SIZE);
 }
 
 static struct bpt *new_breakpoint(unsigned long a)
@@ -876,7 +878,8 @@ static struct bpt *new_breakpoint(unsigned long a)
 	for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
 		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
 			bp->address = a;
-			patch_instruction(&bp->instr[1], bpinstr);
+			bp->instr = bpt_table + ((bp - bpts) * BPT_WORDS);
+			patch_instruction(bp->instr + 1, bpinstr);
 			return bp;
 		}
 	}
diff --git a/arch/powerpc/xmon/xmon_bpts.S b/arch/powerpc/xmon/xmon_bpts.S
new file mode 100644
index 000000000000..ebb2dbc70ca8
--- /dev/null
+++ b/arch/powerpc/xmon/xmon_bpts.S
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/ppc_asm.h>
+#include <asm/asm-compat.h>
+#include "xmon_bpts.h"
+
+.global bpt_table
+bpt_table:
+	.space NBPTS * 8
diff --git a/arch/powerpc/xmon/xmon_bpts.h b/arch/powerpc/xmon/xmon_bpts.h
new file mode 100644
index 000000000000..840e70be7945
--- /dev/null
+++ b/arch/powerpc/xmon/xmon_bpts.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef XMON_BPTS_H
+#define XMON_BPTS_H
+
+#define NBPTS	256
+
+#endif /* XMON_BPTS_H */
+
-- 
2.17.1

