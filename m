Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C72C63197F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 02:22:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcG2B5D9dzDwhZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 12:22:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bqFIiwOI; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcG0N50llzDsmV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 12:20:51 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id m2so5205070pgq.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 17:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=54O96x+hir6UndkmBG1tqcNZSUw2mvpQMhbQiW7lDvc=;
 b=bqFIiwOIkTHtf6iBe6OKqnNLzm89ExegQ63G17Da04WVJuif2d62694rmY4roDJ4/R
 A6OjClLMsCn8uP0cnhdFmVdLqZOawWCq+TKmCtZJaV3cvOgD9pEromXRqGaTsGLPKt2H
 HYLbHgl2iv+9x8+sHxAese7UhihjzXlXkUzym7DwDSmnEqQmeLJ/lJIdhdpRe5Vpstgb
 udqmZJOUIOUT6UYG/hI9LL+cT3s9NSJeaueUTKXR2vctfDWphtKuPl3uOS+jOiLOoglR
 0fGHtKp9MeiciKEBClXOtw5G+ngPVFncZcIbTo5PBdVewHn+ogRvibXUYH12BRoCVkyl
 lYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=54O96x+hir6UndkmBG1tqcNZSUw2mvpQMhbQiW7lDvc=;
 b=tdV2PXtyQqG1vsbCJEgTHwwnqVozfKZNBXPJpO1ZsPuEyqlEW/qGAu4V2LlhLrjv2I
 yi/JLaysQef2s5v2CDKgiyduRv4n6crBVyZCG/NWT4+mJBHyDG6X/OwnPNhWLruKthUz
 r0NlMdsJyp46/6IMOgMfty5KNX8vkf11CN3Yk4rF/U3sLfVKr5X5Mr8LlCNJYXjVpm7i
 Y3TkP4NvfJtMAhN/DuwL4xr++2AOHD0dOrzoPRqM9N1d6rr1treaLurBA3/kVzqgj5JV
 vtUbfWtzCSe1T37QvBtHWwXj5yAbIPFAM9lqlZjbm5ZgBEyZTAJkOfjL3WdWr1aCX1J0
 ioBA==
X-Gm-Message-State: AOAM531L0uzr1qQ2dwjNPEmo2ISjzImnihz9gVWRVGtMeH5E+ZdpH+6U
 TPZL7uMeWpxFKVPOHbJLvpCc+ugwIGw=
X-Google-Smtp-Source: ABdhPJzVDeJVp88jMoiX61q213qEzjhJU96z1uCrBH6GVqffAEV8xYGQInwXjymdX13ecR1Hoxi5mA==
X-Received: by 2002:a05:6a00:854:b029:1b7:6233:c5f with SMTP id
 q20-20020a056a000854b02901b762330c5fmr800046pfk.73.1613092847059; 
 Thu, 11 Feb 2021 17:20:47 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id fv11sm6623107pjb.18.2021.02.11.17.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 17:20:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] powerpc/64s: introduce call_realmode to run C code in
 real-mode
Date: Fri, 12 Feb 2021 11:20:40 +1000
Message-Id: <20210212012041.392566-1-npiggin@gmail.com>
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

The regular kernel stack can not be accessed in real mode in hash
guest kernels, which prevents the MMU from being disabled in general
C code. Provide a helper that can call a function pointer in real
mode using the emergency stack (accessable in real mode).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |  1 +
 arch/powerpc/include/asm/book3s/64/mmu.h  |  2 +
 arch/powerpc/include/asm/thread_info.h    | 16 ++++++++
 arch/powerpc/kernel/irq.c                 | 16 --------
 arch/powerpc/kernel/misc_64.S             | 22 +++++++++++
 arch/powerpc/mm/book3s64/pgtable.c        | 48 +++++++++++++++++++++++
 6 files changed, 89 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index d0b832cbbec8..a973023c390a 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -126,6 +126,7 @@ extern s64 __ashldi3(s64, int);
 extern s64 __ashrdi3(s64, int);
 extern int __cmpdi2(s64, s64);
 extern int __ucmpdi2(u64, u64);
+int __call_realmode(int (*fn)(void *arg), void *arg, void *sp);
 
 /* tracing */
 void _mcount(void);
diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 995bbcdd0ef8..80b0d24415ac 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -274,5 +274,7 @@ static inline unsigned long get_user_vsid(mm_context_t *ctx,
 	return get_vsid(context, ea, ssize);
 }
 
+int call_realmode(int (*fn)(void *arg), void *arg);
+
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_MMU_H_ */
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 3d8a47af7a25..9279e472d51e 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -172,6 +172,22 @@ static inline bool test_thread_local_flags(unsigned int flags)
 #define is_elf2_task() (0)
 #endif
 
+static inline void check_stack_overflow(void)
+{
+	long sp;
+
+	if (!IS_ENABLED(CONFIG_DEBUG_STACKOVERFLOW))
+		return;
+
+	sp = current_stack_pointer & (THREAD_SIZE - 1);
+
+	/* check for stack overflow: is there less than 2KB free? */
+	if (unlikely(sp < 2048)) {
+		pr_err("do_IRQ: stack overflow: %ld\n", sp);
+		dump_stack();
+	}
+}
+
 #endif	/* !__ASSEMBLY__ */
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 6b1eca53e36c..193b47b5b6a5 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -620,22 +620,6 @@ u64 arch_irq_stat_cpu(unsigned int cpu)
 	return sum;
 }
 
-static inline void check_stack_overflow(void)
-{
-	long sp;
-
-	if (!IS_ENABLED(CONFIG_DEBUG_STACKOVERFLOW))
-		return;
-
-	sp = current_stack_pointer & (THREAD_SIZE - 1);
-
-	/* check for stack overflow: is there less than 2KB free? */
-	if (unlikely(sp < 2048)) {
-		pr_err("do_IRQ: stack overflow: %ld\n", sp);
-		dump_stack();
-	}
-}
-
 void __do_irq(struct pt_regs *regs)
 {
 	unsigned int irq;
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index 070465825c21..5e911d0b0b16 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -27,6 +27,28 @@
 
 	.text
 
+#ifdef CONFIG_PPC_BOOK3S_64
+_GLOBAL(__call_realmode)
+	mflr	r0
+	std	r0,16(r1)
+	stdu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r5)
+	mr	r1,r5
+	mtctr	r3
+	mr	r3,r4
+	mfmsr	r4
+	xori	r4,r4,(MSR_IR|MSR_DR)
+	mtmsrd	r4
+	bctrl
+	mfmsr	r4
+	xori	r4,r4,(MSR_IR|MSR_DR)
+	mtmsrd	r4
+	ld	r1,0(r1)
+	ld	r0,16(r1)
+	mtlr	r0
+	blr
+
+#endif
+
 _GLOBAL(call_do_softirq)
 	mflr	r0
 	std	r0,16(r1)
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 5b3a3bae21aa..aad0e2059305 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -474,6 +474,54 @@ int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
 	return true;
 }
 
+/*
+ * Executing C code in real-mode in general Book3S-64 code can only be done
+ * via this function that switches the stack to one inside the real-mode-area,
+ * which may cover only a small first part of real memory on hash guest LPARs.
+ * fn must be NOKPROBES, must not access vmalloc or anything outside the RMA,
+ * probably shouldn't enable the MMU or interrupts, etc, and be very careful
+ * about calling other generic kernel or powerpc functions.
+ */
+int call_realmode(int (*fn)(void *arg), void *arg)
+{
+	unsigned long flags;
+	void *cursp, *emsp;
+	int ret;
+
+	if (WARN_ON_ONCE(!(mfmsr() & MSR_DR)))
+		return -EINVAL;
+	if (WARN_ON_ONCE(!(mfmsr() & MSR_IR)))
+		return -EINVAL;
+
+	/*
+	 * The switch to emergency stack is only really required for HPT LPAR,
+	 * but do it for all to help test coverage of tricky code.
+	 */
+	cursp = (void *)(current_stack_pointer & ~(THREAD_SIZE - 1));
+	emsp = (void *)(local_paca->emergency_sp - THREAD_SIZE);
+
+	/*
+	 * It's probably okay to go to real-mode and call directly in case we
+	 * are already on the emergency stack, so allow it. But we may want to
+	 * prevent callers from doing this in future though, so warn.
+	 */
+	WARN_ON_ONCE(cursp == emsp);
+
+	check_stack_overflow();
+
+	local_irq_save(flags);
+	hard_irq_disable();
+
+	if (cursp == emsp)
+		ret = fn(arg);
+	else
+		ret = __call_realmode(fn, arg, emsp);
+
+	local_irq_restore(flags);
+
+	return ret;
+}
+
 /*
  * Does the CPU support tlbie?
  */
-- 
2.23.0

