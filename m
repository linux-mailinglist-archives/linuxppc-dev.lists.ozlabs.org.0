Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DC02F0CD9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 07:26:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDkHY2pjpzDqS2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 17:26:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kGyviZIq; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDkFK22gZzDqRw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 17:24:18 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id x12so8954466plr.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jan 2021 22:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iNCLdD13MpzsIszgLUujVsCE8Zw3c4zQgzdHY1u3TBA=;
 b=kGyviZIqjOBc+LYrg3jul1Sc+jJeMdt03Wp1clpUFSEZp0D6tm1xtm9AbCnqrU1L7X
 lxv0ySwbQqVK3deXIUsQV19uJDJ1Q+0jL42xymTM8dSriwKllgQhebVA59x4TMEYQd4k
 pVHS9bda35EMTajdweK+tAUMqxASG/skNVLgjL2q13mgVqt17NLGemQUUh4MqK7pEH8C
 MZi5u0wW1otqScrBcQOCOTb17df8T4yC7NZksBXz0wYkPHuXAcQ1lCqh6rZ9I/sQ9Hsf
 9GKZLI+blgg3hG5jGdKep2YJBPFWNgE7ZKqSAGslbJMD2AYVS07okxV+lzl+zQE8Easz
 FbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iNCLdD13MpzsIszgLUujVsCE8Zw3c4zQgzdHY1u3TBA=;
 b=BDLJn5a+dSVkVDV4CM2p8WfCH7kFlRYuysq5oddC/XLE7WMuHz2aMmPs56jn1P+Dwy
 DtRI195lLbUv5OYryTNPhJMr5HOudN6zGuhncShxHwV0nV03j9NwFOad6lm2N3pC0gU0
 MBdJYxJLgaMhKRHq3JKrMZx2R0KfkAyafD+HXQDXkU3LN49qJ0hkmkJVLCcxwVV8NcG2
 +DZx7AdWjhCkBoGZv2TycruoXQhH4Wp/uRXD4NdUYwfOEKkhYKSyQe6a/AZz4KdChROx
 SVH7PFSzXIRxnPbcLAf4g5fFaEJGaSyglz+9A3Lol3r9awBZJ9g3dhurxzWj6ZHiFWwZ
 D8sg==
X-Gm-Message-State: AOAM532f5Zaex+Y3b7pyv40uyW1CVEmrmseeeme90b9MQ7IsnFnw2DvO
 Fwnd2vZcV9eGxsKi8nx0Bu85u+85nethDw==
X-Google-Smtp-Source: ABdhPJzbi8476ACK1VkPcWXZEArovPPygxzdUJCqnJz2gy7rtMTIaZLOCzJ4EpwPTczQEqb9aVILWQ==
X-Received: by 2002:a17:90a:3d4e:: with SMTP id
 o14mr16135855pjf.44.1610346254622; 
 Sun, 10 Jan 2021 22:24:14 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id t25sm18460785pgv.30.2021.01.10.22.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 22:24:14 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: fix scv entry fallback flush vs interrupt
Date: Mon, 11 Jan 2021 16:24:08 +1000
Message-Id: <20210111062408.287092-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The L1D flush fallback functions are not recoverable vs interrupts,
yet the scv entry flush runs with MSR[EE]=1. This can result in a
timer (soft-NMI) or MCE or SRESET interrupt hitting here and overwriting
the EXRFI save area, which ends up corrupting userspace registers for
scv return.

Fix this by disabling RI and EE for the scv entry fallback flush.

Fixes: f79643787e0a0 ("powerpc/64s: flush L1D on kernel entry")
Cc: stable@vger.kernel.org # 5.9+ which also have flush L1D patch backport
Cc: Daniel Axtens <dja@axtens.net>
Reported-by: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
This applies to stable kernels 5.9+ (with scv support), which have
backported commit f79643787e0a0 ("powerpc/64s: flush L1D on kernel entry")
which was upstreamed in 5.10 but was backported. Maybe only 5.10 if
there will be no more 5.9 kernels.

 arch/powerpc/include/asm/exception-64s.h  | 13 ++++++++++++
 arch/powerpc/include/asm/feature-fixups.h | 10 ++++++++++
 arch/powerpc/kernel/entry_64.S            |  2 +-
 arch/powerpc/kernel/exceptions-64s.S      | 19 ++++++++++++++++++
 arch/powerpc/kernel/vmlinux.lds.S         |  7 +++++++
 arch/powerpc/lib/feature-fixups.c         | 24 ++++++++++++++++++++---
 6 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 1d32b174ab6a..c1a8aac01cf9 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -63,6 +63,12 @@
 	nop;								\
 	nop;
 
+#define SCV_ENTRY_FLUSH_SLOT						\
+	SCV_ENTRY_FLUSH_FIXUP_SECTION;					\
+	nop;								\
+	nop;								\
+	nop;
+
 /*
  * r10 must be free to use, r13 must be paca
  */
@@ -70,6 +76,13 @@
 	STF_ENTRY_BARRIER_SLOT;						\
 	ENTRY_FLUSH_SLOT
 
+/*
+ * r10, ctr must be free to use, r13 must be paca
+ */
+#define SCV_INTERRUPT_TO_KERNEL						\
+	STF_ENTRY_BARRIER_SLOT;						\
+	SCV_ENTRY_FLUSH_SLOT
+
 /*
  * Macros for annotating the expected destination of (h)rfid
  *
diff --git a/arch/powerpc/include/asm/feature-fixups.h b/arch/powerpc/include/asm/feature-fixups.h
index f6d2acb57425..ac605fc369c4 100644
--- a/arch/powerpc/include/asm/feature-fixups.h
+++ b/arch/powerpc/include/asm/feature-fixups.h
@@ -240,6 +240,14 @@ label##3:					       	\
 	FTR_ENTRY_OFFSET 957b-958b;			\
 	.popsection;
 
+#define SCV_ENTRY_FLUSH_FIXUP_SECTION			\
+957:							\
+	.pushsection __scv_entry_flush_fixup,"a";	\
+	.align 2;					\
+958:							\
+	FTR_ENTRY_OFFSET 957b-958b;			\
+	.popsection;
+
 #define RFI_FLUSH_FIXUP_SECTION				\
 951:							\
 	.pushsection __rfi_flush_fixup,"a";		\
@@ -273,10 +281,12 @@ label##3:					       	\
 
 extern long stf_barrier_fallback;
 extern long entry_flush_fallback;
+extern long scv_entry_flush_fallback;
 extern long __start___stf_entry_barrier_fixup, __stop___stf_entry_barrier_fixup;
 extern long __start___stf_exit_barrier_fixup, __stop___stf_exit_barrier_fixup;
 extern long __start___uaccess_flush_fixup, __stop___uaccess_flush_fixup;
 extern long __start___entry_flush_fixup, __stop___entry_flush_fixup;
+extern long __start___scv_entry_flush_fixup, __stop___scv_entry_flush_fixup;
 extern long __start___rfi_flush_fixup, __stop___rfi_flush_fixup;
 extern long __start___barrier_nospec_fixup, __stop___barrier_nospec_fixup;
 extern long __start__btb_flush_fixup, __stop__btb_flush_fixup;
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index aa1af139d947..33ddfeef4fe9 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -75,7 +75,7 @@ BEGIN_FTR_SECTION
 	bne	.Ltabort_syscall
 END_FTR_SECTION_IFSET(CPU_FTR_TM)
 #endif
-	INTERRUPT_TO_KERNEL
+	SCV_INTERRUPT_TO_KERNEL
 	mr	r10,r1
 	ld	r1,PACAKSAVE(r13)
 	std	r10,0(r1)
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e02ad6fefa46..6e53f7638737 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2993,6 +2993,25 @@ TRAMP_REAL_BEGIN(entry_flush_fallback)
 	ld	r11,PACA_EXRFI+EX_R11(r13)
 	blr
 
+/*
+ * The SCV entry flush happens with interrupts enabled, so it must disable
+ * to prevent EXRFI being clobbered by NMIs (e.g., soft_nmi_common). r10
+ * (containing LR) does not need to be preserved here because scv entry
+ * puts 0 in the pt_regs, CTR can be clobbered for the same reason.
+ */
+TRAMP_REAL_BEGIN(scv_entry_flush_fallback)
+	li	r10,0
+	mtmsrd	r10,1
+	lbz	r10,PACAIRQHAPPENED(r13)
+	ori	r10,r10,PACA_IRQ_HARD_DIS
+	stb	r10,PACAIRQHAPPENED(r13)
+	std	r11,PACA_EXRFI+EX_R11(r13)
+	L1D_DISPLACEMENT_FLUSH
+	ld	r11,PACA_EXRFI+EX_R11(r13)
+	li	r10,MSR_RI
+	mtmsrd	r10,1
+	blr
+
 TRAMP_REAL_BEGIN(rfi_flush_fallback)
 	SET_SCRATCH0(r13);
 	GET_PACA(r13);
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 0318ba436f34..377f5f8b1514 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -145,6 +145,13 @@ SECTIONS
 		__stop___entry_flush_fixup = .;
 	}
 
+	. = ALIGN(8);
+	__scv_entry_flush_fixup : AT(ADDR(__scv_entry_flush_fixup) - LOAD_OFFSET) {
+		__start___scv_entry_flush_fixup = .;
+		*(__scv_entry_flush_fixup)
+		__stop___scv_entry_flush_fixup = .;
+	}
+
 	. = ALIGN(8);
 	__stf_exit_barrier_fixup : AT(ADDR(__stf_exit_barrier_fixup) - LOAD_OFFSET) {
 		__start___stf_exit_barrier_fixup = .;
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 47821055b94c..1fd31b4b0e13 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -290,9 +290,6 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
 	long *start, *end;
 	int i;
 
-	start = PTRRELOC(&__start___entry_flush_fixup);
-	end = PTRRELOC(&__stop___entry_flush_fixup);
-
 	instrs[0] = 0x60000000; /* nop */
 	instrs[1] = 0x60000000; /* nop */
 	instrs[2] = 0x60000000; /* nop */
@@ -312,6 +309,8 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
 	if (types & L1D_FLUSH_MTTRIG)
 		instrs[i++] = 0x7c12dba6; /* mtspr TRIG2,r0 (SPR #882) */
 
+	start = PTRRELOC(&__start___entry_flush_fixup);
+	end = PTRRELOC(&__stop___entry_flush_fixup);
 	for (i = 0; start < end; start++, i++) {
 		dest = (void *)start + *start;
 
@@ -328,6 +327,25 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
 		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
 	}
 
+	start = PTRRELOC(&__start___scv_entry_flush_fixup);
+	end = PTRRELOC(&__stop___scv_entry_flush_fixup);
+	for (; start < end; start++, i++) {
+		dest = (void *)start + *start;
+
+		pr_devel("patching dest %lx\n", (unsigned long)dest);
+
+		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+
+		if (types == L1D_FLUSH_FALLBACK)
+			patch_branch((struct ppc_inst *)(dest + 1), (unsigned long)&scv_entry_flush_fallback,
+				     BRANCH_SET_LINK);
+		else
+			patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
+
+		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+	}
+
+
 	printk(KERN_DEBUG "entry-flush: patched %d locations (%s flush)\n", i,
 		(types == L1D_FLUSH_NONE)       ? "no" :
 		(types == L1D_FLUSH_FALLBACK)   ? "fallback displacement" :
-- 
2.23.0

