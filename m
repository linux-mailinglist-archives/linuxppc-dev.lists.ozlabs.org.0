Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4BBD80A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 22:05:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t5xs3fnzzDr40
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 07:05:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t5w93Wf4zDqyJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 07:03:37 +1100 (AEDT)
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by Galois.linutronix.de with esmtp (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1iKSL2-00067i-Qs; Tue, 15 Oct 2019 21:18:32 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 03/34] powerpc: Use CONFIG_PREEMPTION
Date: Tue, 15 Oct 2019 21:17:50 +0200
Message-Id: <20191015191821.11479-4-bigeasy@linutronix.de>
In-Reply-To: <20191015191821.11479-1-bigeasy@linutronix.de>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Paul Mackerras <paulus@samba.org>, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thomas Gleixner <tglx@linutronix.de>

CONFIG_PREEMPTION is selected by CONFIG_PREEMPT and by CONFIG_PREEMPT_RT.
Both PREEMPT and PREEMPT_RT require the same functionality which today
depends on CONFIG_PREEMPT.

Switch the entry code over to use CONFIG_PREEMPTION. Add PREEMPT_RT
output in __die().

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
[bigeasy: +traps.c, Kconfig]
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/powerpc/Kconfig           | 2 +-
 arch/powerpc/kernel/entry_32.S | 4 ++--
 arch/powerpc/kernel/entry_64.S | 4 ++--
 arch/powerpc/kernel/traps.c    | 7 ++++++-
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 3e56c9c2f16ee..8ead8d6e1cbc8 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -106,7 +106,7 @@ config LOCKDEP_SUPPORT
 config GENERIC_LOCKBREAK
 	bool
 	default y
-	depends on SMP && PREEMPT
+	depends on SMP && PREEMPTION
=20
 config GENERIC_HWEIGHT
 	bool
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index d60908ea37fb9..e1a4c39b83b86 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -897,7 +897,7 @@ user_exc_return:		/* r10 contains MSR_KERNEL here */
 	bne-	0b
 1:
=20
-#ifdef CONFIG_PREEMPT
+#ifdef CONFIG_PREEMPTION
 	/* check current_thread_info->preempt_count */
 	lwz	r0,TI_PREEMPT(r2)
 	cmpwi	0,r0,0		/* if non-zero, just restore regs and return */
@@ -921,7 +921,7 @@ user_exc_return:		/* r10 contains MSR_KERNEL here */
 	 */
 	bl	trace_hardirqs_on
 #endif
-#endif /* CONFIG_PREEMPT */
+#endif /* CONFIG_PREEMPTION */
 restore_kuap:
 	kuap_restore r1, r2, r9, r10, r0
=20
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 6467bdab8d405..83733376533e8 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -840,7 +840,7 @@ _GLOBAL(ret_from_except_lite)
 	bne-	0b
 1:
=20
-#ifdef CONFIG_PREEMPT
+#ifdef CONFIG_PREEMPTION
 	/* Check if we need to preempt */
 	andi.	r0,r4,_TIF_NEED_RESCHED
 	beq+	restore
@@ -871,7 +871,7 @@ _GLOBAL(ret_from_except_lite)
 	li	r10,MSR_RI
 	mtmsrd	r10,1		  /* Update machine state */
 #endif /* CONFIG_PPC_BOOK3E */
-#endif /* CONFIG_PREEMPT */
+#endif /* CONFIG_PREEMPTION */
=20
 	.globl	fast_exc_return_irq
 fast_exc_return_irq:
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 82f43535e6867..23d2f20be4f2e 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -252,14 +252,19 @@ NOKPROBE_SYMBOL(oops_end);
=20
 static int __die(const char *str, struct pt_regs *regs, long err)
 {
+	const char *pr =3D "";
+
 	printk("Oops: %s, sig: %ld [#%d]\n", str, err, ++die_counter);
=20
+	if (IS_ENABLED(CONFIG_PREEMPTION))
+		pr =3D IS_ENABLED(CONFIG_PREEMPT_RT) ? " PREEMPT_RT" : " PREEMPT";
+
 	printk("%s PAGE_SIZE=3D%luK%s%s%s%s%s%s%s %s\n",
 	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
 	       PAGE_SIZE / 1024,
 	       early_radix_enabled() ? " MMU=3DRadix" : "",
 	       early_mmu_has_feature(MMU_FTR_HPTE_TABLE) ? " MMU=3DHash" : "",
-	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
+	       pr,
 	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
 	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=3D" __stringify(NR_CPUS)) : "",
 	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
--=20
2.23.0

