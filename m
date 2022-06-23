Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E545570AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 03:55:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LT3HJ2N5jz3fRB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 11:55:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LT3CF1tktz3bsT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 11:51:53 +1000 (AEST)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LT38j50Drz1K9S2;
	Thu, 23 Jun 2022 09:49:41 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 23 Jun 2022 09:51:49 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 23 Jun 2022 09:51:49 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kbuild@vger.kernel.org>, <live-patching@vger.kernel.org>
Subject: [PATCH v6 18/33] arm64: Change symbol type annotations
Date: Thu, 23 Jun 2022 09:49:02 +0800
Message-ID: <20220623014917.199563-19-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220623014917.199563-1-chenzhongjin@huawei.com>
References: <20220623014917.199563-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
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
Cc: mark.rutland@arm.com, madvenka@linux.microsoft.com, daniel.thompson@linaro.org, michal.lkml@markovi.net, pasha.tatashin@soleen.com, peterz@infradead.org, catalin.marinas@arm.com, masahiroy@kernel.org, ndesaulniers@google.com, chenzhongjin@huawei.com, rmk+kernel@armlinux.org.uk, broonie@kernel.org, will@kernel.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Code symbols not following the aarch64 procedure call convention should
be annotated with SYM_CODE_* instead of SYM_FUNC_*

Mark relevant symbols as generic code symbols.

Also replace SYM_INNER_LABEL for __swpan_entry_el0 becasuse
SYM_INNER_LABEL generates zero-size-label which can't be correctly loaded
in objtool.

Signed-off-by: Julien Thierry <jthierry@redhat.com>
Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 arch/arm64/kernel/entry.S  | 10 +++++--
 arch/arm64/kernel/head.S   | 56 +++++++++++++++++++-------------------
 arch/arm64/kernel/sleep.S  |  4 +--
 arch/arm64/kvm/hyp/entry.S |  4 +--
 4 files changed, 39 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index ede028dee81b..c460ba2d009d 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -460,11 +460,15 @@ SYM_CODE_START_LOCAL(__swpan_entry_el1)
 	orr	x23, x23, #PSR_PAN_BIT		// Set the emulated PAN in the saved SPSR
 	b.eq	1f				// TTBR0 access already disabled
 	and	x23, x23, #~PSR_PAN_BIT		// Clear the emulated PAN in the saved SPSR
-SYM_INNER_LABEL(__swpan_entry_el0, SYM_L_LOCAL)
 	__uaccess_ttbr0_disable x21
 1:	ret
 SYM_CODE_END(__swpan_entry_el1)
 
+SYM_CODE_START_LOCAL(__swpan_entry_el0)
+	__uaccess_ttbr0_disable x21
+1:	ret
+SYM_CODE_END(__swpan_entry_el0)
+
 	/*
 	 * Restore access to TTBR0_EL1. If returning to EL0, no need for SPSR
 	 * PAN bit checking.
@@ -757,11 +761,11 @@ SYM_CODE_START_NOALIGN(tramp_vectors)
 	generate_tramp_vector	kpti=1, bhb=BHB_MITIGATION_NONE
 SYM_CODE_END(tramp_vectors)
 
-SYM_CODE_START(tramp_exit_native)
+SYM_CODE_START_LOCAL(tramp_exit_native)
 	tramp_exit
 SYM_CODE_END(tramp_exit_native)
 
-SYM_CODE_START(tramp_exit_compat)
+SYM_CODE_START_LOCAL(tramp_exit_compat)
 	tramp_exit	32
 SYM_CODE_END(tramp_exit_compat)
 
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 6a98f1a38c29..6db9c3603bd8 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -259,7 +259,7 @@ SYM_CODE_END(preserve_boot_args)
  *   - first few MB of the kernel linear mapping to jump to once the MMU has
  *     been enabled
  */
-SYM_FUNC_START_LOCAL(__create_page_tables)
+SYM_CODE_START_LOCAL(__create_page_tables)
 	mov	x28, lr
 
 	/*
@@ -389,7 +389,7 @@ SYM_FUNC_START_LOCAL(__create_page_tables)
 	bl	dcache_inval_poc
 
 	ret	x28
-SYM_FUNC_END(__create_page_tables)
+SYM_CODE_END(__create_page_tables)
 
 	/*
 	 * Initialize CPU registers with task-specific and cpu-specific context.
@@ -422,7 +422,7 @@ SYM_FUNC_END(__create_page_tables)
  *
  *   x0 = __PHYS_OFFSET
  */
-SYM_FUNC_START_LOCAL(__primary_switched)
+SYM_CODE_START_LOCAL(__primary_switched)
 	adr_l	x4, init_task
 	init_cpu_task x4, x5, x6
 
@@ -467,7 +467,7 @@ SYM_FUNC_START_LOCAL(__primary_switched)
 	ldp	x29, x30, [sp], #16
 	bl	start_kernel
 	ASM_BUG()
-SYM_FUNC_END(__primary_switched)
+SYM_CODE_END(__primary_switched)
 
 	.pushsection ".rodata", "a"
 SYM_DATA_START(kimage_vaddr)
@@ -493,7 +493,7 @@ EXPORT_SYMBOL(kimage_vaddr)
  * Returns either BOOT_CPU_MODE_EL1 or BOOT_CPU_MODE_EL2 in w0 if
  * booted in EL1 or EL2 respectively.
  */
-SYM_FUNC_START(init_kernel_el)
+SYM_CODE_START(init_kernel_el)
 	mrs	x0, CurrentEL
 	cmp	x0, #CurrentEL_EL2
 	b.eq	init_el2
@@ -557,13 +557,13 @@ __cpu_stick_to_vhe:
 	hvc	#0
 	mov	x0, #BOOT_CPU_MODE_EL2
 	ret
-SYM_FUNC_END(init_kernel_el)
+SYM_CODE_END(init_kernel_el)
 
 /*
  * Sets the __boot_cpu_mode flag depending on the CPU boot mode passed
  * in w0. See arch/arm64/include/asm/virt.h for more info.
  */
-SYM_FUNC_START_LOCAL(set_cpu_boot_mode_flag)
+SYM_CODE_START_LOCAL(set_cpu_boot_mode_flag)
 	adr_l	x1, __boot_cpu_mode
 	cmp	w0, #BOOT_CPU_MODE_EL2
 	b.ne	1f
@@ -572,7 +572,7 @@ SYM_FUNC_START_LOCAL(set_cpu_boot_mode_flag)
 	dmb	sy
 	dc	ivac, x1			// Invalidate potentially stale cache line
 	ret
-SYM_FUNC_END(set_cpu_boot_mode_flag)
+SYM_CODE_END(set_cpu_boot_mode_flag)
 
 /*
  * These values are written with the MMU off, but read with the MMU on.
@@ -606,7 +606,7 @@ SYM_DATA_END(__early_cpu_boot_status)
 	 * This provides a "holding pen" for platforms to hold all secondary
 	 * cores are held until we're ready for them to initialise.
 	 */
-SYM_FUNC_START(secondary_holding_pen)
+SYM_CODE_START(secondary_holding_pen)
 	bl	init_kernel_el			// w0=cpu_boot_mode
 	bl	set_cpu_boot_mode_flag
 	mrs	x0, mpidr_el1
@@ -618,19 +618,19 @@ pen:	ldr	x4, [x3]
 	b.eq	secondary_startup
 	wfe
 	b	pen
-SYM_FUNC_END(secondary_holding_pen)
+SYM_CODE_END(secondary_holding_pen)
 
 	/*
 	 * Secondary entry point that jumps straight into the kernel. Only to
 	 * be used where CPUs are brought online dynamically by the kernel.
 	 */
-SYM_FUNC_START(secondary_entry)
+SYM_CODE_START(secondary_entry)
 	bl	init_kernel_el			// w0=cpu_boot_mode
 	bl	set_cpu_boot_mode_flag
 	b	secondary_startup
-SYM_FUNC_END(secondary_entry)
+SYM_CODE_END(secondary_entry)
 
-SYM_FUNC_START_LOCAL(secondary_startup)
+SYM_CODE_START_LOCAL(secondary_startup)
 	/*
 	 * Common entry point for secondary CPUs.
 	 */
@@ -641,9 +641,9 @@ SYM_FUNC_START_LOCAL(secondary_startup)
 	bl	__enable_mmu
 	ldr	x8, =__secondary_switched
 	br	x8
-SYM_FUNC_END(secondary_startup)
+SYM_CODE_END(secondary_startup)
 
-SYM_FUNC_START_LOCAL(__secondary_switched)
+SYM_CODE_START_LOCAL(__secondary_switched)
 	adr_l	x5, vectors
 	msr	vbar_el1, x5
 	isb
@@ -660,13 +660,13 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
 
 	bl	secondary_start_kernel
 	ASM_BUG()
-SYM_FUNC_END(__secondary_switched)
+SYM_CODE_END(__secondary_switched)
 
-SYM_FUNC_START_LOCAL(__secondary_too_slow)
+SYM_CODE_START_LOCAL(__secondary_too_slow)
 	wfe
 	wfi
 	b	__secondary_too_slow
-SYM_FUNC_END(__secondary_too_slow)
+SYM_CODE_END(__secondary_too_slow)
 
 /*
  * The booting CPU updates the failed status @__early_cpu_boot_status,
@@ -698,7 +698,7 @@ SYM_FUNC_END(__secondary_too_slow)
  * Checks if the selected granule size is supported by the CPU.
  * If it isn't, park the CPU
  */
-SYM_FUNC_START(__enable_mmu)
+SYM_CODE_START(__enable_mmu)
 	mrs	x2, ID_AA64MMFR0_EL1
 	ubfx	x2, x2, #ID_AA64MMFR0_TGRAN_SHIFT, 4
 	cmp     x2, #ID_AA64MMFR0_TGRAN_SUPPORTED_MIN
@@ -717,9 +717,9 @@ SYM_FUNC_START(__enable_mmu)
 	set_sctlr_el1	x0
 
 	ret
-SYM_FUNC_END(__enable_mmu)
+SYM_CODE_END(__enable_mmu)
 
-SYM_FUNC_START(__cpu_secondary_check52bitva)
+SYM_CODE_START_LOCAL(__cpu_secondary_check52bitva)
 #ifdef CONFIG_ARM64_VA_BITS_52
 	ldr_l	x0, vabits_actual
 	cmp	x0, #52
@@ -737,9 +737,9 @@ SYM_FUNC_START(__cpu_secondary_check52bitva)
 
 #endif
 2:	ret
-SYM_FUNC_END(__cpu_secondary_check52bitva)
+SYM_CODE_END(__cpu_secondary_check52bitva)
 
-SYM_FUNC_START_LOCAL(__no_granule_support)
+SYM_CODE_START_LOCAL(__no_granule_support)
 	/* Indicate that this CPU can't boot and is stuck in the kernel */
 	update_early_cpu_boot_status \
 		CPU_STUCK_IN_KERNEL | CPU_STUCK_REASON_NO_GRAN, x1, x2
@@ -747,10 +747,10 @@ SYM_FUNC_START_LOCAL(__no_granule_support)
 	wfe
 	wfi
 	b	1b
-SYM_FUNC_END(__no_granule_support)
+SYM_CODE_END(__no_granule_support)
 
 #ifdef CONFIG_RELOCATABLE
-SYM_FUNC_START_LOCAL(__relocate_kernel)
+SYM_CODE_START_LOCAL(__relocate_kernel)
 	/*
 	 * Iterate over each entry in the relocation table, and apply the
 	 * relocations in place.
@@ -852,10 +852,10 @@ SYM_FUNC_START_LOCAL(__relocate_kernel)
 #endif
 	ret
 
-SYM_FUNC_END(__relocate_kernel)
+SYM_CODE_END(__relocate_kernel)
 #endif
 
-SYM_FUNC_START_LOCAL(__primary_switch)
+SYM_CODE_START_LOCAL(__primary_switch)
 #ifdef CONFIG_RANDOMIZE_BASE
 	mov	x19, x0				// preserve new SCTLR_EL1 value
 	mrs	x20, sctlr_el1			// preserve old SCTLR_EL1 value
@@ -895,4 +895,4 @@ SYM_FUNC_START_LOCAL(__primary_switch)
 	ldr	x8, =__primary_switched
 	adrp	x0, __PHYS_OFFSET
 	br	x8
-SYM_FUNC_END(__primary_switch)
+SYM_CODE_END(__primary_switch)
diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
index 4ea9392f86e0..f0087e8bcd28 100644
--- a/arch/arm64/kernel/sleep.S
+++ b/arch/arm64/kernel/sleep.S
@@ -111,7 +111,7 @@ SYM_CODE_END(cpu_resume)
 	.ltorg
 	.popsection
 
-SYM_FUNC_START(_cpu_resume)
+SYM_CODE_START(_cpu_resume)
 	mrs	x1, mpidr_el1
 	adr_l	x8, mpidr_hash		// x8 = struct mpidr_hash virt address
 
@@ -147,4 +147,4 @@ SYM_FUNC_START(_cpu_resume)
 	ldp	x29, lr, [x29]
 	mov	x0, #0
 	ret
-SYM_FUNC_END(_cpu_resume)
+SYM_CODE_END(_cpu_resume)
diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
index 435346ea1504..045d4481c820 100644
--- a/arch/arm64/kvm/hyp/entry.S
+++ b/arch/arm64/kvm/hyp/entry.S
@@ -21,7 +21,7 @@
 /*
  * u64 __guest_enter(struct kvm_vcpu *vcpu);
  */
-SYM_FUNC_START(__guest_enter)
+SYM_CODE_START(__guest_enter)
 	// x0: vcpu
 	// x1-x17: clobbered by macros
 	// x29: guest context
@@ -212,4 +212,4 @@ abort_guest_exit_end:
 	msr	spsr_el2, x4
 	orr	x0, x0, x5
 1:	ret
-SYM_FUNC_END(__guest_enter)
+SYM_CODE_END(__guest_enter)
-- 
2.17.1

