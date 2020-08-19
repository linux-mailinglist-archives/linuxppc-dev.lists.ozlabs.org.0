Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEAF249999
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 11:48:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWjfF0dkQzDqSF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 19:48:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MmfPRXz1; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWjcM2ljyzDql9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 19:47:13 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d22so11401518pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 02:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dbbuGmHkN3fDbvlJC/JONNuVfJKGxwsfeHOXT1K/WYk=;
 b=MmfPRXz12+zk4uA9PEH/i9E2Nk0oIrv6P4zY3yaF55xbP+dHGcux/FfNrcWEjiMQCJ
 Ov1KX1IjYB8BkG3/wbl95Z33VtOcAE2dh40aup+2eRhuQZ6xOkj+dLjH2ej+iu9AZ1Pi
 PnANXk8QhiFawWC+zFC8sF1UqySTp/KOgXfR4kI4ZOydzZOCoHVC21dYIG+RN92YFU+w
 f1wsMRrDoiLdj/8XEMwNrcnWbKE/fxfUPrvSTplHGeB8W90/9s9al1fEfw2toU8QBi1N
 KBgu1Q5hBZO3ZU3yTBQ8iG9UJwi9vyVO00Z5vEkH3mjx4LejuNinVlukiMqkQ274SAUg
 1hYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dbbuGmHkN3fDbvlJC/JONNuVfJKGxwsfeHOXT1K/WYk=;
 b=WyUEEtxFlDBMdKwDDGd1buPl4RiU6vVaM0NQjAvNvNWMIbr1pzX7mI14Fl6tPMGoJx
 jHcYGmjrQwp4U2I/LtY4RienA3cmJgbmpRaix3xQDdRVXU/0LAfA8sYGLPcFH+cf0ukE
 t7xfQo8uiToDYNDQtQwtv3q0fKPnM2XpsfRMpvDPuhN4kifbiew7NWtkQrJu0/xCbGWB
 Ej1P01aApMzl8PtnI70z2tXKjtG1/FHS//FJ9tn0BjHEPyuwPGChxffLZboC1wO4BthY
 f0rUhXnv5/duuSf0iC2vEGF73sdhZ5S6l0QBnWIkNQ80jBLb9DGrv3543lCjoBVwniUl
 l4Ug==
X-Gm-Message-State: AOAM533YfvGqQoKhF4uktRau7WqCRpRSKzTiOtbUK6dVv7tiqCXhv+ld
 e6EJRyj3BNP3dx7Ga21XdM1Eu8QVyRs=
X-Google-Smtp-Source: ABdhPJyP/cPDScW3BxfNEqvL9L6sDcBKQuw4E/SgF2+nmQeGU2u0MKpZMSAtvGuaPJFS7JY7m3xYAw==
X-Received: by 2002:a63:cb0e:: with SMTP id p14mr15978581pgg.351.1597830430693; 
 Wed, 19 Aug 2020 02:47:10 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-193-175.tpgi.com.au.
 [193.116.193.175])
 by smtp.gmail.com with ESMTPSA id u14sm27988119pfm.103.2020.08.19.02.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 02:47:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv/idle: add a basic stop 0-3 driver for POWER10
Date: Wed, 19 Aug 2020 19:47:00 +1000
Message-Id: <20200819094700.493399-1-npiggin@gmail.com>
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>, Ryan P Grimm <rgrimm@us.ibm.com>,
 Pratik Rajesh Sampat <psampat@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This driver does not restore stop > 3 state, so it limits itself
to states which do not lose full state or TB.

The POWER10 SPRs are sufficiently different from P9 that it seems
easier to split out the P10 code. The POWER10 deep sleep code
(e.g., the BHRB restore) has been taken out, but it can be re-added
when stop > 3 support is added.

Cc: Ryan P Grimm <rgrimm@us.ibm.com>
Cc: Michael Neuling <mikey@neuling.org>
Cc: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Cc: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
re-sending with linuxppc-dev list actually cc'ed

 arch/powerpc/include/asm/machdep.h    |   2 -
 arch/powerpc/include/asm/processor.h  |   2 +-
 arch/powerpc/include/asm/reg.h        |   1 +
 arch/powerpc/platforms/powernv/idle.c | 304 ++++++++++++++++++--------
 drivers/cpuidle/cpuidle-powernv.c     |   2 +-
 5 files changed, 213 insertions(+), 98 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index a90b892f0bfe..5082cd496190 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -222,8 +222,6 @@ struct machdep_calls {
 
 extern void e500_idle(void);
 extern void power4_idle(void);
-extern void power7_idle(void);
-extern void power9_idle(void);
 extern void ppc6xx_idle(void);
 extern void book3e_idle(void);
 
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index ed0d633ab5aa..6865147209de 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -432,7 +432,7 @@ enum idle_boot_override {IDLE_NO_OVERRIDE = 0, IDLE_POWERSAVE_OFF};
 extern int powersave_nap;	/* set if nap mode can be used in idle loop */
 
 extern void power7_idle_type(unsigned long type);
-extern void power9_idle_type(unsigned long stop_psscr_val,
+extern void arch300_idle_type(unsigned long stop_psscr_val,
 			      unsigned long stop_psscr_mask);
 
 extern void flush_instruction_cache(void);
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 88fb88491fe9..d3a0aed321d0 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1353,6 +1353,7 @@
 #define PVR_POWER8NVL	0x004C
 #define PVR_POWER8	0x004D
 #define PVR_POWER9	0x004E
+#define PVR_POWER10	0x0080
 #define PVR_BE		0x0070
 #define PVR_PA6T	0x0090
 
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 77513a80cef9..1ed7c5286487 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -565,7 +565,7 @@ void power7_idle_type(unsigned long type)
 	irq_set_pending_from_srr1(srr1);
 }
 
-void power7_idle(void)
+static void power7_idle(void)
 {
 	if (!powersave_nap)
 		return;
@@ -659,20 +659,6 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		mmcr0		= mfspr(SPRN_MMCR0);
 	}
 
-	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-		/*
-		 * POWER10 uses MMCRA (BHRBRD) as BHRB disable bit.
-		 * If the user hasn't asked for the BHRB to be
-		 * written, the value of MMCRA[BHRBRD] is 1.
-		 * On wakeup from stop, MMCRA[BHRBD] will be 0,
-		 * since it is previleged resource and will be lost.
-		 * Thus, if we do not save and restore the MMCRA[BHRBD],
-		 * hardware will be needlessly writing to the BHRB
-		 * in problem mode.
-		 */
-		mmcra		= mfspr(SPRN_MMCRA);
-	}
-
 	if ((psscr & PSSCR_RL_MASK) >= deep_spr_loss_state) {
 		sprs.lpcr	= mfspr(SPRN_LPCR);
 		sprs.hfscr	= mfspr(SPRN_HFSCR);
@@ -735,10 +721,6 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 			mtspr(SPRN_MMCR0, mmcr0);
 		}
 
-		/* Reload MMCRA to restore BHRB disable bit for POWER10 */
-		if (cpu_has_feature(CPU_FTR_ARCH_31))
-			mtspr(SPRN_MMCRA, mmcra);
-
 		/*
 		 * DD2.2 and earlier need to set then clear bit 60 in MMCRA
 		 * to ensure the PMU starts running.
@@ -823,73 +805,6 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 	return srr1;
 }
 
-#ifdef CONFIG_HOTPLUG_CPU
-static unsigned long power9_offline_stop(unsigned long psscr)
-{
-	unsigned long srr1;
-
-#ifndef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-	__ppc64_runlatch_off();
-	srr1 = power9_idle_stop(psscr, true);
-	__ppc64_runlatch_on();
-#else
-	/*
-	 * Tell KVM we're entering idle.
-	 * This does not have to be done in real mode because the P9 MMU
-	 * is independent per-thread. Some steppings share radix/hash mode
-	 * between threads, but in that case KVM has a barrier sync in real
-	 * mode before and after switching between radix and hash.
-	 *
-	 * kvm_start_guest must still be called in real mode though, hence
-	 * the false argument.
-	 */
-	local_paca->kvm_hstate.hwthread_state = KVM_HWTHREAD_IN_IDLE;
-
-	__ppc64_runlatch_off();
-	srr1 = power9_idle_stop(psscr, false);
-	__ppc64_runlatch_on();
-
-	local_paca->kvm_hstate.hwthread_state = KVM_HWTHREAD_IN_KERNEL;
-	/* Order setting hwthread_state vs. testing hwthread_req */
-	smp_mb();
-	if (local_paca->kvm_hstate.hwthread_req)
-		srr1 = idle_kvm_start_guest(srr1);
-	mtmsr(MSR_KERNEL);
-#endif
-
-	return srr1;
-}
-#endif
-
-void power9_idle_type(unsigned long stop_psscr_val,
-				      unsigned long stop_psscr_mask)
-{
-	unsigned long psscr;
-	unsigned long srr1;
-
-	if (!prep_irq_for_idle_irqsoff())
-		return;
-
-	psscr = mfspr(SPRN_PSSCR);
-	psscr = (psscr & ~stop_psscr_mask) | stop_psscr_val;
-
-	__ppc64_runlatch_off();
-	srr1 = power9_idle_stop(psscr, true);
-	__ppc64_runlatch_on();
-
-	fini_irq_for_idle_irqsoff();
-
-	irq_set_pending_from_srr1(srr1);
-}
-
-/*
- * Used for ppc_md.power_save which needs a function with no parameters
- */
-void power9_idle(void)
-{
-	power9_idle_type(pnv_default_stop_val, pnv_default_stop_mask);
-}
-
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 /*
  * This is used in working around bugs in thread reconfiguration
@@ -962,6 +877,198 @@ void pnv_power9_force_smt4_release(void)
 EXPORT_SYMBOL_GPL(pnv_power9_force_smt4_release);
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
 
+struct p10_sprs {
+	/*
+	 * SPRs that get lost in shallow states:
+	 *
+	 * P10 loses CR, LR, CTR, FPSCR, VSCR, XER, TAR, SPRG2, and HSPRG1
+	 * isa300 idle routines restore CR, LR.
+	 * CTR is volatile
+	 * idle thread doesn't use FP or VEC
+	 * kernel doesn't use TAR
+	 * HSPRG1 is only live in HV interrupt entry
+	 * SPRG2 is only live in KVM guests, KVM handles it.
+	 */
+};
+
+static unsigned long power10_idle_stop(unsigned long psscr, bool mmu_on)
+{
+	int cpu = raw_smp_processor_id();
+	int first = cpu_first_thread_sibling(cpu);
+	unsigned long *state = &paca_ptrs[first]->idle_state;
+	unsigned long core_thread_mask = (1UL << threads_per_core) - 1;
+	unsigned long srr1;
+	unsigned long pls;
+//	struct p10_sprs sprs = {}; /* avoid false used-uninitialised */
+	bool sprs_saved = false;
+
+	if (!(psscr & (PSSCR_EC|PSSCR_ESL))) {
+		/* EC=ESL=0 case */
+
+		BUG_ON(!mmu_on);
+
+		/*
+		 * Wake synchronously. SRESET via xscom may still cause
+		 * a 0x100 powersave wakeup with SRR1 reason!
+		 */
+		srr1 = isa300_idle_stop_noloss(psscr);		/* go idle */
+		if (likely(!srr1))
+			return 0;
+
+		/*
+		 * Registers not saved, can't recover!
+		 * This would be a hardware bug
+		 */
+		BUG_ON((srr1 & SRR1_WAKESTATE) != SRR1_WS_NOLOSS);
+
+		goto out;
+	}
+
+	/* EC=ESL=1 case */
+	if ((psscr & PSSCR_RL_MASK) >= deep_spr_loss_state) {
+		/* XXX: save SPRs for deep state loss here. */
+
+		sprs_saved = true;
+
+		atomic_start_thread_idle();
+	}
+
+	srr1 = isa300_idle_stop_mayloss(psscr);		/* go idle */
+
+	psscr = mfspr(SPRN_PSSCR);
+
+	WARN_ON_ONCE(!srr1);
+	WARN_ON_ONCE(mfmsr() & (MSR_IR|MSR_DR));
+
+	if (unlikely((srr1 & SRR1_WAKEMASK_P8) == SRR1_WAKEHMI))
+		hmi_exception_realmode(NULL);
+
+	/*
+	 * On POWER10, SRR1 bits do not match exactly as expected.
+	 * SRR1_WS_GPRLOSS (10b) can also result in SPR loss, so
+	 * just always test PSSCR for SPR/TB state loss.
+	 */
+	pls = (psscr & PSSCR_PLS) >> PSSCR_PLS_SHIFT;
+	if (likely(pls < deep_spr_loss_state)) {
+		if (sprs_saved)
+			atomic_stop_thread_idle();
+		goto out;
+	}
+
+	/* HV state loss */
+	BUG_ON(!sprs_saved);
+
+	atomic_lock_thread_idle();
+
+	if ((*state & core_thread_mask) != 0)
+		goto core_woken;
+
+	/* XXX: restore per-core SPRs here */
+
+	if (pls >= pnv_first_tb_loss_level) {
+		/* TB loss */
+		if (opal_resync_timebase() != OPAL_SUCCESS)
+			BUG();
+	}
+
+	/*
+	 * isync after restoring shared SPRs and before unlocking. Unlock
+	 * only contains hwsync which does not necessarily do the right
+	 * thing for SPRs.
+	 */
+	isync();
+
+core_woken:
+	atomic_unlock_and_stop_thread_idle();
+
+	/* XXX: restore per-thread SPRs here */
+
+	if (!radix_enabled())
+		__slb_restore_bolted_realmode();
+
+out:
+	if (mmu_on)
+		mtmsr(MSR_KERNEL);
+
+	return srr1;
+}
+
+#ifdef CONFIG_HOTPLUG_CPU
+static unsigned long arch300_offline_stop(unsigned long psscr)
+{
+	unsigned long srr1;
+
+#ifndef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	__ppc64_runlatch_off();
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		srr1 = power10_idle_stop(psscr, true);
+	else
+		srr1 = power9_idle_stop(psscr, true);
+	__ppc64_runlatch_on();
+#else
+	/*
+	 * Tell KVM we're entering idle.
+	 * This does not have to be done in real mode because the P9 MMU
+	 * is independent per-thread. Some steppings share radix/hash mode
+	 * between threads, but in that case KVM has a barrier sync in real
+	 * mode before and after switching between radix and hash.
+	 *
+	 * kvm_start_guest must still be called in real mode though, hence
+	 * the false argument.
+	 */
+	local_paca->kvm_hstate.hwthread_state = KVM_HWTHREAD_IN_IDLE;
+
+	__ppc64_runlatch_off();
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		srr1 = power10_idle_stop(psscr, false);
+	else
+		srr1 = power9_idle_stop(psscr, false);
+	__ppc64_runlatch_on();
+
+	local_paca->kvm_hstate.hwthread_state = KVM_HWTHREAD_IN_KERNEL;
+	/* Order setting hwthread_state vs. testing hwthread_req */
+	smp_mb();
+	if (local_paca->kvm_hstate.hwthread_req)
+		srr1 = idle_kvm_start_guest(srr1);
+	mtmsr(MSR_KERNEL);
+#endif
+
+	return srr1;
+}
+#endif
+
+void arch300_idle_type(unsigned long stop_psscr_val,
+				      unsigned long stop_psscr_mask)
+{
+	unsigned long psscr;
+	unsigned long srr1;
+
+	if (!prep_irq_for_idle_irqsoff())
+		return;
+
+	psscr = mfspr(SPRN_PSSCR);
+	psscr = (psscr & ~stop_psscr_mask) | stop_psscr_val;
+
+	__ppc64_runlatch_off();
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		srr1 = power10_idle_stop(psscr, true);
+	else
+		srr1 = power9_idle_stop(psscr, true);
+	__ppc64_runlatch_on();
+
+	fini_irq_for_idle_irqsoff();
+
+	irq_set_pending_from_srr1(srr1);
+}
+
+/*
+ * Used for ppc_md.power_save which needs a function with no parameters
+ */
+static void arch300_idle(void)
+{
+	arch300_idle_type(pnv_default_stop_val, pnv_default_stop_mask);
+}
+
 #ifdef CONFIG_HOTPLUG_CPU
 
 void pnv_program_cpu_hotplug_lpcr(unsigned int cpu, u64 lpcr_val)
@@ -995,7 +1102,7 @@ unsigned long pnv_cpu_offline(unsigned int cpu)
 		psscr = mfspr(SPRN_PSSCR);
 		psscr = (psscr & ~pnv_deepest_stop_psscr_mask) |
 						pnv_deepest_stop_psscr_val;
-		srr1 = power9_offline_stop(psscr);
+		srr1 = arch300_offline_stop(psscr);
 	} else if (cpu_has_feature(CPU_FTR_ARCH_206) && power7_offline_type) {
 		srr1 = power7_offline();
 	} else {
@@ -1093,11 +1200,15 @@ int validate_psscr_val_mask(u64 *psscr_val, u64 *psscr_mask, u32 flags)
  * @dt_idle_states: Number of idle state entries
  * Returns 0 on success
  */
-static void __init pnv_power9_idle_init(void)
+static void __init pnv_arch300_idle_init(void)
 {
 	u64 max_residency_ns = 0;
 	int i;
 
+	/* stop is not really architected, we only have p9,p10 drivers */
+	if (!pvr_version_is(PVR_POWER10) && !pvr_version_is(PVR_POWER9))
+		return;
+
 	/*
 	 * pnv_deepest_stop_{val,mask} should be set to values corresponding to
 	 * the deepest stop state.
@@ -1112,6 +1223,11 @@ static void __init pnv_power9_idle_init(void)
 		struct pnv_idle_states_t *state = &pnv_idle_states[i];
 		u64 psscr_rl = state->psscr_val & PSSCR_RL_MASK;
 
+		/* No deep loss driver implemented for POWER10 yet */
+		if (pvr_version_is(PVR_POWER10) &&
+				state->flags & (OPAL_PM_TIMEBASE_STOP|OPAL_PM_LOSE_FULL_CONTEXT))
+			continue;
+
 		if ((state->flags & OPAL_PM_TIMEBASE_STOP) &&
 		     (pnv_first_tb_loss_level > psscr_rl))
 			pnv_first_tb_loss_level = psscr_rl;
@@ -1162,7 +1278,7 @@ static void __init pnv_power9_idle_init(void)
 	if (unlikely(!default_stop_found)) {
 		pr_warn("cpuidle-powernv: No suitable default stop state found. Disabling platform idle.\n");
 	} else {
-		ppc_md.power_save = power9_idle;
+		ppc_md.power_save = arch300_idle;
 		pr_info("cpuidle-powernv: Default stop: psscr = 0x%016llx,mask=0x%016llx\n",
 			pnv_default_stop_val, pnv_default_stop_mask);
 	}
@@ -1223,8 +1339,8 @@ static void __init pnv_probe_idle_states(void)
 		return;
 	}
 
-	if (pvr_version_is(PVR_POWER9))
-		pnv_power9_idle_init();
+	if (cpu_has_feature(CPU_FTR_ARCH_300))
+		pnv_arch300_idle_init();
 
 	for (i = 0; i < nr_pnv_idle_states; i++)
 		supported_cpuidle_states |= pnv_idle_states[i].flags;
@@ -1295,7 +1411,7 @@ static int pnv_parse_cpuidle_dt(void)
 	for (i = 0; i < nr_idle_states; i++)
 		pnv_idle_states[i].residency_ns = temp_u32[i];
 
-	/* For power9 */
+	/* For power9 and later */
 	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
 		/* Read pm_crtl_val */
 		if (of_property_read_u64_array(np, "ibm,cpu-idle-state-psscr",
@@ -1358,8 +1474,8 @@ static int __init pnv_init_idle_states(void)
 		if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
 			/* P7/P8 nap */
 			p->thread_idle_state = PNV_THREAD_RUNNING;
-		} else {
-			/* P9 stop */
+		} else if (pvr_version_is(PVR_POWER9)) {
+			/* P9 stop workarounds */
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 			p->requested_psscr = 0;
 			atomic_set(&p->dont_stop, 0);
diff --git a/drivers/cpuidle/cpuidle-powernv.c b/drivers/cpuidle/cpuidle-powernv.c
index addaa6e6718b..c32c600b3cf8 100644
--- a/drivers/cpuidle/cpuidle-powernv.c
+++ b/drivers/cpuidle/cpuidle-powernv.c
@@ -141,7 +141,7 @@ static int stop_loop(struct cpuidle_device *dev,
 		     struct cpuidle_driver *drv,
 		     int index)
 {
-	power9_idle_type(stop_psscr_table[index].val,
+	arch300_idle_type(stop_psscr_table[index].val,
 			 stop_psscr_table[index].mask);
 	return index;
 }
-- 
2.23.0

