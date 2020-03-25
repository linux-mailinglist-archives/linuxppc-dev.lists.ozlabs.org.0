Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 775F5192430
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 10:34:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nNHr3bJbzDqkL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 20:34:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RhKlCZmY; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nNCK2RNRzDqRh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 20:30:50 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id d37so378255pgl.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LKekQCsu3DJG++ydeijKnSaG/w4KaX7b6s1q7GFe/hw=;
 b=RhKlCZmYpHGxZTE29eK+OOOvhFgvTBRyvUAmgf71d/YEWz6ZFerOEfpu/H7aXpSXJE
 n+t8YJSHo5Jg2G5kw6sIWGJykqn4CS2i9sraNk1vtnP69r82ILXRVlX1QOJEFa74C20R
 Pc2GcwVWqQxJjki8XSkZYojM4MRLfxRTfDzL5OKZkgZD1vhG9K6Bl1tqliN3cssbBaxq
 HjVa73KAWZbU4l3DfIIz5MgvG9bZMzW8RyRgkWqgKO1oSlCCKftjsentXZ+/SroFK2ON
 HO+t4FEKMeVOTt7MyNrc3oYlW7Bxt9Vd6x7iu/3xhYK8dQPqFe4yKvR494pDmyfjrw47
 sIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LKekQCsu3DJG++ydeijKnSaG/w4KaX7b6s1q7GFe/hw=;
 b=sorU6TsBLNlrij6n+yZm+G2x8gU7IQ/Uw86dPf1Ad6ME8tub/iH507lc2degSh4hH4
 wJj28ilt2CWBm6Rc4uL8HJInnP632sOq81S/EArEI3s4B5miIQZtRjNSpjD7yAVnxyQB
 Ekg07WNBl1Rj02LZ0BZc9PeZ60FwM3SVrAR+fF4L8iWsF012+WHOEBIc2vxlAaI1kAHQ
 Zonc+48gM53JuNFYFcRN7+RVgTgSDnKhwDCYSce/V7rn/sHyX/8ah6rL5W3ZhRnwf+MW
 kkcdmY12gSUGaLV0B6VOV1BE/JDSJi9SWpqh3LDQA6gUiAxyeJN6B4p+6HsAIVq8O0tk
 OPtw==
X-Gm-Message-State: ANhLgQ1EyGnc+7eWA5q0CR51cM2dsBOPqtxiZLSxCX1BBLXNd6L6b2gx
 jp9id6G+utRKziJAWAzGba5KdFuF
X-Google-Smtp-Source: ADFU+vu/GLlvpFUEQV5H/Icti8tAA/syhUxWo+ERw1qrEz//X5SOKP1t2eCt+wCOjc050rAB1yIuGg==
X-Received: by 2002:a63:4282:: with SMTP id p124mr2343160pga.59.1585128647934; 
 Wed, 25 Mar 2020 02:30:47 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id b124sm831904pfa.34.2020.03.25.02.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 02:30:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] Fix 2 "[v3,
 25/32] powerpc/64: system call implement entry/exit logic in C"
Date: Wed, 25 Mar 2020 19:30:13 +1000
Message-Id: <20200325093014.149962-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes 4 issues caught by TM selftests. First was a tm-syscall bug
that hit due to tabort_syscall being called after interrupts were reconciled
(in a subsequent patch), which led to interrupts being enabled before
tabort_syscall was called. Rather than going through an un-reconciling
interrupts for the return, I just go back to putting the test early in
asm, the C-ification of that wasn't a big win anyway.

Second is the syscall return _TIF_USER_WORK_MASK check would go into an
infinite loop if _TIF_RESTORE_TM became set. The asm code uses
_TIF_USER_WORK_MASK to brach to slowpath which includes restore_tm_state.

Third is system call return was not calling restore_tm_state, I missed
this completely (alhtough it's in the return from interrupt C conversion
because when the asm syscall code encountered problems it would branch
to the interrupt return code.

Fourth is MSR_VEC missing from restore_math, which was caught by
tm-unavailable selftest taking an unexpected facility unavailable
interrupt when testing VSX unavailble exception with MSR.FP=1 MSR.VEC=1.
Fourth case also has a fixup in a subsequent patch.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S   | 12 +++++++++---
 arch/powerpc/kernel/syscall_64.c | 25 +++++++++++++------------
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index dc7fd3196d20..403224acdaa8 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -64,6 +64,12 @@ exception_marker:
 
 	.globl system_call_common
 system_call_common:
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+BEGIN_FTR_SECTION
+	extrdi.	r10, r12, 1, (63-MSR_TS_T_LG) /* transaction active? */
+	bne	.Ltabort_syscall
+END_FTR_SECTION_IFSET(CPU_FTR_TM)
+#endif
 _ASM_NOKPROBE_SYMBOL(system_call_common)
 	mr	r10,r1
 	ld	r1,PACAKSAVE(r13)
@@ -179,7 +185,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	b	.Lsyscall_restore_regs_cont
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-_GLOBAL(tabort_syscall) /* (unsigned long nip, unsigned long msr) */
+.Ltabort_syscall:
 	/* Firstly we need to enable TM in the kernel */
 	mfmsr	r10
 	li	r9, 1
@@ -199,8 +205,8 @@ _GLOBAL(tabort_syscall) /* (unsigned long nip, unsigned long msr) */
 	li	r9, MSR_RI
 	andc	r10, r10, r9
 	mtmsrd	r10, 1
-	mtspr	SPRN_SRR0, r3
-	mtspr	SPRN_SRR1, r4
+	mtspr	SPRN_SRR0, r11
+	mtspr	SPRN_SRR1, r12
 	RFI_TO_USER
 	b	.	/* prevent speculative execution */
 #endif
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index ffd601d87065..56533a26f3b7 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -15,8 +15,6 @@
 #include <asm/time.h>
 #include <asm/unistd.h>
 
-extern void __noreturn tabort_syscall(unsigned long nip, unsigned long msr);
-
 typedef long (*syscall_fn)(long, long, long, long, long, long);
 
 /* Has to run notrace because it is entered "unreconciled" */
@@ -32,10 +30,6 @@ notrace long system_call_exception(long r3, long r4, long r5, long r6, long r7,
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(regs->softe != IRQS_ENABLED);
 
-	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
-	    unlikely(regs->msr & MSR_TS_T))
-		tabort_syscall(regs->nip, regs->msr);
-
 	account_cpu_user_entry();
 
 #ifdef CONFIG_PPC_SPLPAR
@@ -161,7 +155,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 again:
 	local_irq_disable();
 	ti_flags = READ_ONCE(*ti_flagsp);
-	while (unlikely(ti_flags & _TIF_USER_WORK_MASK)) {
+	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
 		local_irq_enable();
 		if (ti_flags & _TIF_NEED_RESCHED) {
 			schedule();
@@ -180,13 +174,20 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	}
 
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && IS_ENABLED(CONFIG_PPC_FPU)) {
-		unsigned long mathflags = MSR_FP;
+		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
+				unlikely((ti_flags & _TIF_RESTORE_TM))) {
+			restore_tm_state(regs);
+		} else {
+			unsigned long mathflags = MSR_FP;
 
-		if (IS_ENABLED(CONFIG_ALTIVEC))
-			mathflags |= MSR_VEC;
+			if (cpu_has_feature(CPU_FTR_VSX))
+				mathflags |= MSR_VEC | MSR_VSX;
+			else if (cpu_has_feature(CPU_FTR_ALTIVEC))
+				mathflags |= MSR_VEC;
 
-		if ((regs->msr & mathflags) != mathflags)
-			restore_math(regs);
+			if ((regs->msr & mathflags) != mathflags)
+				restore_math(regs);
+		}
 	}
 
 	/* This must be done with RI=1 because tracing may touch vmaps */
-- 
2.23.0

