Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C474245C37
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 08:05:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVNnS5NDqzDqQh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 16:05:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVNPH1RdzzDqNH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 15:48:03 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BVNP51ZDlz9tytp;
 Mon, 17 Aug 2020 07:47:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QRHWJm_0Kott; Mon, 17 Aug 2020 07:47:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BVNP50bKHz9tytl;
 Mon, 17 Aug 2020 07:47:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DACB58B772;
 Mon, 17 Aug 2020 07:47:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6QK3ZqyPopiP; Mon, 17 Aug 2020 07:47:57 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A4F488B75B;
 Mon, 17 Aug 2020 07:47:57 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 68B3465CDD; Mon, 17 Aug 2020 05:47:57 +0000 (UTC)
Message-Id: <698df8387555765b70ea42e4a7fa48141c309c1f.1597643221.git.christophe.leroy@csgroup.eu>
In-Reply-To: <0eb61cf0dc66d781d47deb2228498cd61d03a754.1597643221.git.christophe.leroy@csgroup.eu>
References: <0eb61cf0dc66d781d47deb2228498cd61d03a754.1597643221.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 3/4] powerpc/process: Remove useless #ifdef CONFIG_SPE
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 17 Aug 2020 05:47:57 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cpu_has_feature(CPU_FTR_SPE) returns false when CONFIG_SPE is
not set.

There is no need to enclose the test in an #ifdef CONFIG_SPE.
Remove it.

CPU_FTR_SPE only exists on 32 bits. Define it as 0 on 64 bits.

We have a couple of places like:

 #ifdef CONFIG_SPE
	if (cpu_has_feature(CPU_FTR_SPE)) {
		do_something_that_requires_CONFIG_SPE
	} else {
		return -EINVAL;
	}
 #else
	return -EINVAL;
 #endif

Replace them by a cleaner version:

	if (cpu_has_feature(CPU_FTR_SPE)) {
 #ifdef CONFIG_SPE
		do_something_that_requires_CONFIG_SPE
 #endif
	} else {
		return -EINVAL;
	}

When CONFIG_SPE is not set, this resolves to an unconditional
return of -EINVAL

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/cputable.h |  1 +
 arch/powerpc/kernel/process.c       | 21 +++++++--------------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index fdddb822d564..cc21dbcc6794 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -165,6 +165,7 @@ static inline void cpu_feature_keys_init(void) { }
 #else	/* CONFIG_PPC32 */
 /* Define these to 0 for the sake of tests in common code */
 #define CPU_FTR_PPC_LE			(0)
+#define CPU_FTR_SPE			(0)
 #endif
 
 /*
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 360415689f8a..7090c99a60d9 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -413,10 +413,8 @@ static int __init init_msr_all_available(void)
 		msr_all_available |= MSR_VEC;
 	if (cpu_has_feature(CPU_FTR_VSX))
 		msr_all_available |= MSR_VSX;
-#ifdef CONFIG_SPE
 	if (cpu_has_feature(CPU_FTR_SPE))
 		msr_all_available |= MSR_SPE;
-#endif
 
 	return 0;
 }
@@ -446,10 +444,8 @@ void giveup_all(struct task_struct *tsk)
 #endif
 	if (usermsr & MSR_VEC)
 		__giveup_altivec(tsk);
-#ifdef CONFIG_SPE
 	if (usermsr & MSR_SPE)
 		__giveup_spe(tsk);
-#endif
 
 	msr_check_and_clear(msr_all_available);
 }
@@ -1843,7 +1839,6 @@ int set_fpexc_mode(struct task_struct *tsk, unsigned int val)
 	 * fpexc_mode.  fpexc_mode is also used for setting FP exception
 	 * mode (asyn, precise, disabled) for 'Classic' FP. */
 	if (val & PR_FP_EXC_SW_ENABLE) {
-#ifdef CONFIG_SPE
 		if (cpu_has_feature(CPU_FTR_SPE)) {
 			/*
 			 * When the sticky exception bits are set
@@ -1857,16 +1852,15 @@ int set_fpexc_mode(struct task_struct *tsk, unsigned int val)
 			 * anyway to restore the prctl settings from
 			 * the saved environment.
 			 */
+#ifdef CONFIG_SPE
 			tsk->thread.spefscr_last = mfspr(SPRN_SPEFSCR);
 			tsk->thread.fpexc_mode = val &
 				(PR_FP_EXC_SW_ENABLE | PR_FP_ALL_EXCEPT);
+#endif
 			return 0;
 		} else {
 			return -EINVAL;
 		}
-#else
-		return -EINVAL;
-#endif
 	}
 
 	/* on a CONFIG_SPE this does not hurt us.  The bits that
@@ -1887,8 +1881,7 @@ int get_fpexc_mode(struct task_struct *tsk, unsigned long adr)
 {
 	unsigned int val;
 
-	if (tsk->thread.fpexc_mode & PR_FP_EXC_SW_ENABLE)
-#ifdef CONFIG_SPE
+	if (tsk->thread.fpexc_mode & PR_FP_EXC_SW_ENABLE) {
 		if (cpu_has_feature(CPU_FTR_SPE)) {
 			/*
 			 * When the sticky exception bits are set
@@ -1902,15 +1895,15 @@ int get_fpexc_mode(struct task_struct *tsk, unsigned long adr)
 			 * anyway to restore the prctl settings from
 			 * the saved environment.
 			 */
+#ifdef CONFIG_SPE
 			tsk->thread.spefscr_last = mfspr(SPRN_SPEFSCR);
 			val = tsk->thread.fpexc_mode;
+#endif
 		} else
 			return -EINVAL;
-#else
-		return -EINVAL;
-#endif
-	else
+	} else {
 		val = __unpack_fe01(tsk->thread.fpexc_mode);
+	}
 	return put_user(val, (unsigned int __user *) adr);
 }
 
-- 
2.25.0

