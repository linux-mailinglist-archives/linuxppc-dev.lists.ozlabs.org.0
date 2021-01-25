Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EE930239B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 11:24:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPQvY5qbLzDqpH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 21:24:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=cy.fan@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1011 seconds by postgrey-1.36 at bilbo;
 Mon, 25 Jan 2021 20:43:44 AEDT
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPQ0w3x8HzDqlK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 20:43:35 +1100 (AEDT)
Received: from dggeme770-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DPPc01tqqzR7GD;
 Mon, 25 Jan 2021 17:25:36 +0800 (CST)
Received: from huawei.com (10.175.113.32) by dggeme770-chm.china.huawei.com
 (10.3.19.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Mon, 25
 Jan 2021 17:26:39 +0800
From: Chengyang Fan <cy.fan@huawei.com>
To: <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: remove unneeded semicolons
Date: Mon, 25 Jan 2021 17:53:38 +0800
Message-ID: <20210125095338.1719405-1-cy.fan@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggeme770-chm.china.huawei.com (10.3.19.116)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 25 Jan 2021 21:22:33 +1100
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
Cc: joe@perches.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove superfluous semicolons after function definitions.

Signed-off-by: Chengyang Fan <cy.fan@huawei.com>
---
 arch/powerpc/include/asm/book3s/32/mmu-hash.h       |  2 +-
 arch/powerpc/include/asm/book3s/64/mmu.h            |  2 +-
 arch/powerpc/include/asm/book3s/64/tlbflush-radix.h |  2 +-
 arch/powerpc/include/asm/book3s/64/tlbflush.h       |  2 +-
 arch/powerpc/include/asm/firmware.h                 |  2 +-
 arch/powerpc/include/asm/kvm_ppc.h                  |  6 +++---
 arch/powerpc/include/asm/paca.h                     |  6 +++---
 arch/powerpc/include/asm/rtas.h                     |  2 +-
 arch/powerpc/include/asm/setup.h                    |  6 +++---
 arch/powerpc/include/asm/simple_spinlock.h          |  4 ++--
 arch/powerpc/include/asm/smp.h                      |  2 +-
 arch/powerpc/include/asm/xmon.h                     |  4 ++--
 arch/powerpc/kernel/prom.c                          |  2 +-
 arch/powerpc/kernel/setup.h                         | 12 ++++++------
 arch/powerpc/platforms/powernv/subcore.h            |  2 +-
 arch/powerpc/platforms/pseries/pseries.h            |  2 +-
 16 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/mmu-hash.h b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
index 685c589e723f..b85f8e114a9c 100644
--- a/arch/powerpc/include/asm/book3s/32/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
@@ -94,7 +94,7 @@ typedef struct {
 } mm_context_t;
 
 void update_bats(void);
-static inline void cleanup_cpu_mmu_context(void) { };
+static inline void cleanup_cpu_mmu_context(void) { }
 
 /* patch sites */
 extern s32 patch__hash_page_A0, patch__hash_page_A1, patch__hash_page_A2;
diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 995bbcdd0ef8..eace8c3f7b0a 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -239,7 +239,7 @@ static inline void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 #ifdef CONFIG_PPC_PSERIES
 extern void radix_init_pseries(void);
 #else
-static inline void radix_init_pseries(void) { };
+static inline void radix_init_pseries(void) { }
 #endif
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
index 94439e0cefc9..8b33601cdb9d 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
@@ -35,7 +35,7 @@ extern void radix__flush_pwc_lpid(unsigned int lpid);
 extern void radix__flush_all_lpid(unsigned int lpid);
 extern void radix__flush_all_lpid_guest(unsigned int lpid);
 #else
-static inline void radix__tlbiel_all(unsigned int action) { WARN_ON(1); };
+static inline void radix__tlbiel_all(unsigned int action) { WARN_ON(1); }
 static inline void radix__flush_tlb_lpid_page(unsigned int lpid,
 					unsigned long addr,
 					unsigned long page_size)
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index dcb5c3839d2f..215973b4cb26 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -31,7 +31,7 @@ static inline void tlbiel_all(void)
 		hash__tlbiel_all(TLB_INVAL_SCOPE_GLOBAL);
 }
 #else
-static inline void tlbiel_all(void) { BUG(); };
+static inline void tlbiel_all(void) { BUG(); }
 #endif
 
 static inline void tlbiel_all_lpid(bool radix)
diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index aa6a5ef5d483..7604673787d6 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -137,7 +137,7 @@ extern unsigned int __start___fw_ftr_fixup, __stop___fw_ftr_fixup;
 #ifdef CONFIG_PPC_PSERIES
 void pseries_probe_fw_features(void);
 #else
-static inline void pseries_probe_fw_features(void) { };
+static inline void pseries_probe_fw_features(void) { }
 #endif
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 0a056c64c317..259ba4ce9ad3 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -627,9 +627,9 @@ extern int h_ipi_redirect;
 static inline struct kvmppc_passthru_irqmap *kvmppc_get_passthru_irqmap(
 				struct kvm *kvm)
 	{ return NULL; }
-static inline void kvmppc_alloc_host_rm_ops(void) {};
-static inline void kvmppc_free_host_rm_ops(void) {};
-static inline void kvmppc_free_pimap(struct kvm *kvm) {};
+static inline void kvmppc_alloc_host_rm_ops(void) {}
+static inline void kvmppc_free_host_rm_ops(void) {}
+static inline void kvmppc_free_pimap(struct kvm *kvm) {}
 static inline int kvmppc_xics_rm_complete(struct kvm_vcpu *vcpu, u32 hcall)
 	{ return 0; }
 static inline int kvmppc_xics_enabled(struct kvm_vcpu *vcpu)
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 9454d29ff4b4..1a4f6da3be5f 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -285,9 +285,9 @@ extern void free_unused_pacas(void);
 
 #else /* CONFIG_PPC64 */
 
-static inline void allocate_paca_ptrs(void) { };
-static inline void allocate_paca(int cpu) { };
-static inline void free_unused_pacas(void) { };
+static inline void allocate_paca_ptrs(void) { }
+static inline void allocate_paca(int cpu) { }
+static inline void free_unused_pacas(void) { }
 
 #endif /* CONFIG_PPC64 */
 
diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 332e1000ca0f..658448ca5b8a 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -369,7 +369,7 @@ void rtas_initialize(void);
 #else
 static inline int page_is_rtas_user_buf(unsigned long pfn) { return 0;}
 static inline void pSeries_coalesce_init(void) { }
-static inline void rtas_initialize(void) { };
+static inline void rtas_initialize(void) { }
 #endif
 
 extern int call_rtas(const char *, int, int, unsigned long *, ...);
diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index a466749703f1..e89bfebd4e00 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -58,7 +58,7 @@ void do_rfi_flush_fixups(enum l1d_flush_type types);
 #ifdef CONFIG_PPC_BARRIER_NOSPEC
 void setup_barrier_nospec(void);
 #else
-static inline void setup_barrier_nospec(void) { };
+static inline void setup_barrier_nospec(void) { }
 #endif
 void do_uaccess_flush_fixups(enum l1d_flush_type types);
 void do_entry_flush_fixups(enum l1d_flush_type types);
@@ -68,13 +68,13 @@ extern bool barrier_nospec_enabled;
 #ifdef CONFIG_PPC_BARRIER_NOSPEC
 void do_barrier_nospec_fixups_range(bool enable, void *start, void *end);
 #else
-static inline void do_barrier_nospec_fixups_range(bool enable, void *start, void *end) { };
+static inline void do_barrier_nospec_fixups_range(bool enable, void *start, void *end) { }
 #endif
 
 #ifdef CONFIG_PPC_FSL_BOOK3E
 void setup_spectre_v2(void);
 #else
-static inline void setup_spectre_v2(void) {};
+static inline void setup_spectre_v2(void) {}
 #endif
 void do_btb_flush_fixups(void);
 
diff --git a/arch/powerpc/include/asm/simple_spinlock.h b/arch/powerpc/include/asm/simple_spinlock.h
index 9c3c30534333..5b862de29dff 100644
--- a/arch/powerpc/include/asm/simple_spinlock.h
+++ b/arch/powerpc/include/asm/simple_spinlock.h
@@ -90,8 +90,8 @@ static inline int arch_spin_trylock(arch_spinlock_t *lock)
 void splpar_spin_yield(arch_spinlock_t *lock);
 void splpar_rw_yield(arch_rwlock_t *lock);
 #else /* SPLPAR */
-static inline void splpar_spin_yield(arch_spinlock_t *lock) {};
-static inline void splpar_rw_yield(arch_rwlock_t *lock) {};
+static inline void splpar_spin_yield(arch_spinlock_t *lock) {}
+static inline void splpar_rw_yield(arch_rwlock_t *lock) {}
 #endif
 
 static inline void spin_yield(arch_spinlock_t *lock)
diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index c4e2d53acd2b..7a13bc20f0a0 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -236,7 +236,7 @@ static inline void set_hard_smp_processor_id(int cpu, int phys)
 #if defined(CONFIG_PPC64) && (defined(CONFIG_SMP) || defined(CONFIG_KEXEC_CORE))
 extern void smp_release_cpus(void);
 #else
-static inline void smp_release_cpus(void) { };
+static inline void smp_release_cpus(void) { }
 #endif
 
 extern int smt_enabled_at_boot;
diff --git a/arch/powerpc/include/asm/xmon.h b/arch/powerpc/include/asm/xmon.h
index 454a7fc6113b..68bfb2361f03 100644
--- a/arch/powerpc/include/asm/xmon.h
+++ b/arch/powerpc/include/asm/xmon.h
@@ -17,8 +17,8 @@ struct pt_regs;
 extern int xmon(struct pt_regs *excp);
 extern irqreturn_t xmon_irq(int, void *);
 #else
-static inline void xmon_setup(void) { };
-static inline void xmon_register_spus(struct list_head *list) { };
+static inline void xmon_setup(void) { }
+static inline void xmon_register_spus(struct list_head *list) { }
 #endif
 
 #if defined(CONFIG_XMON) && defined(CONFIG_SMP)
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index ae3c41730367..9a4797d1d40d 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -707,7 +707,7 @@ static void __init save_fscr_to_task(void)
 		init_task.thread.fscr = mfspr(SPRN_FSCR);
 }
 #else
-static inline void save_fscr_to_task(void) {};
+static inline void save_fscr_to_task(void) {}
 #endif
 
 
diff --git a/arch/powerpc/kernel/setup.h b/arch/powerpc/kernel/setup.h
index 2dd0d9cb5a20..84058bbc8fe9 100644
--- a/arch/powerpc/kernel/setup.h
+++ b/arch/powerpc/kernel/setup.h
@@ -14,31 +14,31 @@ void irqstack_early_init(void);
 #ifdef CONFIG_PPC32
 void setup_power_save(void);
 #else
-static inline void setup_power_save(void) { };
+static inline void setup_power_save(void) { }
 #endif
 
 #if defined(CONFIG_PPC64) && defined(CONFIG_SMP)
 void check_smt_enabled(void);
 #else
-static inline void check_smt_enabled(void) { };
+static inline void check_smt_enabled(void) { }
 #endif
 
 #if defined(CONFIG_PPC_BOOK3E) && defined(CONFIG_SMP)
 void setup_tlb_core_data(void);
 #else
-static inline void setup_tlb_core_data(void) { };
+static inline void setup_tlb_core_data(void) { }
 #endif
 
 #if defined(CONFIG_PPC_BOOK3E) || defined(CONFIG_BOOKE) || defined(CONFIG_40x)
 void exc_lvl_early_init(void);
 #else
-static inline void exc_lvl_early_init(void) { };
+static inline void exc_lvl_early_init(void) { }
 #endif
 
 #if defined(CONFIG_PPC64) || defined(CONFIG_VMAP_STACK)
 void emergency_stack_init(void);
 #else
-static inline void emergency_stack_init(void) { };
+static inline void emergency_stack_init(void) { }
 #endif
 
 #ifdef CONFIG_PPC64
@@ -55,7 +55,7 @@ extern unsigned long spr_default_dscr;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 void kvm_cma_reserve(void);
 #else
-static inline void kvm_cma_reserve(void) { };
+static inline void kvm_cma_reserve(void) { }
 #endif
 
 #ifdef CONFIG_TAU
diff --git a/arch/powerpc/platforms/powernv/subcore.h b/arch/powerpc/platforms/powernv/subcore.h
index c8f574d1c04a..77feee8436d4 100644
--- a/arch/powerpc/platforms/powernv/subcore.h
+++ b/arch/powerpc/platforms/powernv/subcore.h
@@ -15,7 +15,7 @@
 void split_core_secondary_loop(u8 *state);
 extern void update_subcore_sibling_mask(void);
 #else
-static inline void update_subcore_sibling_mask(void) { };
+static inline void update_subcore_sibling_mask(void) { }
 #endif /* CONFIG_SMP */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 593840847cd3..4fe48c04c6c2 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -33,7 +33,7 @@ int smp_query_cpu_stopped(unsigned int pcpu);
 #define QCSS_HARDWARE_ERROR -1
 #define QCSS_HARDWARE_BUSY -2
 #else
-static inline void smp_init_pseries(void) { };
+static inline void smp_init_pseries(void) { }
 #endif
 
 extern void pseries_kexec_cpu_down(int crash_shutdown, int secondary);
-- 
2.25.1

