Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 605E53FFA01
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 07:24:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H15nF2YXyz2yWR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 15:24:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4H15mq18Tvz2xfw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 15:23:37 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 07ECBAE80212;
 Fri,  3 Sep 2021 01:22:59 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] KVM: PPC: Book3S: Merge powerpc's debugfs entry
 content into generic entry
Date: Fri,  3 Sep 2021 15:22:57 +1000
Message-Id: <20210903052257.2348036-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
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
Cc: kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the moment the generic KVM code creates an "%pid-%fd" entry per a KVM
instance; and the PPC HV KVM creates its own at "vm%pid".

The rproblems with the PPC entries are:
1. they do not allow multiple VMs in the same process (which is extremely
rare case mostly used by syzkaller fuzzer);
2. prone to race bugs like the generic KVM code had fixed in
commit 85cd39af14f4 ("KVM: Do not leak memory for duplicate debugfs
directories").

This defines kvm_arch_create_kvm_debugfs() similar to one for vcpus.

This defines 2 hooks in kvmppc_ops for allowing specific KVM
implementations to add necessary entries.

This makes use of already existing kvm_arch_create_vcpu_debugfs.

This removes no more used debugfs_dir pointers from PPC kvm_arch structs.

Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/include/asm/kvm_host.h    |  6 +++---
 arch/powerpc/include/asm/kvm_ppc.h     |  2 ++
 include/linux/kvm_host.h               |  3 +++
 arch/powerpc/kvm/book3s_64_mmu_hv.c    |  2 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  2 +-
 arch/powerpc/kvm/book3s_hv.c           | 30 +++++++++-----------------
 arch/powerpc/kvm/powerpc.c             | 12 +++++++++++
 virt/kvm/kvm_main.c                    |  3 +++
 8 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 2bcac6da0a4b..e4f2feb67b53 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -296,7 +296,6 @@ struct kvm_arch {
 	bool dawr1_enabled;
 	pgd_t *pgtable;
 	u64 process_table;
-	struct dentry *debugfs_dir;
 	struct kvm_resize_hpt *resize_hpt; /* protected by kvm->lock */
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
@@ -828,8 +827,6 @@ struct kvm_vcpu_arch {
 	struct kvmhv_tb_accumulator rm_exit;	/* real-mode exit code */
 	struct kvmhv_tb_accumulator guest_time;	/* guest execution */
 	struct kvmhv_tb_accumulator cede_time;	/* time napping inside guest */
-
-	struct dentry *debugfs_dir;
 #endif /* CONFIG_KVM_BOOK3S_HV_EXIT_TIMING */
 };
 
@@ -868,4 +865,7 @@ static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
 
+#define __KVM_HAVE_ARCH_VCPU_DEBUGFS
+#define __KVM_HAVE_ARCH_KVM_DEBUGFS
+
 #endif /* __POWERPC_KVM_HOST_H__ */
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 6355a6980ccf..8b3f7f6e3f12 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -316,6 +316,8 @@ struct kvmppc_ops {
 	int (*svm_off)(struct kvm *kvm);
 	int (*enable_dawr1)(struct kvm *kvm);
 	bool (*hash_v3_possible)(void);
+	void (*create_kvm_debugfs)(struct kvm *kvm);
+	void (*create_vcpu_debugfs)(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry);
 };
 
 extern struct kvmppc_ops *kvmppc_hv_ops;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ae7735b490b4..74d2c1c3df1b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1021,6 +1021,9 @@ int kvm_arch_pm_notifier(struct kvm *kvm, unsigned long state);
 #ifdef __KVM_HAVE_ARCH_VCPU_DEBUGFS
 void kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry);
 #endif
+#ifdef __KVM_HAVE_ARCH_KVM_DEBUGFS
+void kvm_arch_create_kvm_debugfs(struct kvm *kvm);
+#endif
 
 int kvm_arch_hardware_enable(void);
 void kvm_arch_hardware_disable(void);
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index c63e263312a4..33dae253a0ac 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -2112,7 +2112,7 @@ static const struct file_operations debugfs_htab_fops = {
 
 void kvmppc_mmu_debugfs_init(struct kvm *kvm)
 {
-	debugfs_create_file("htab", 0400, kvm->arch.debugfs_dir, kvm,
+	debugfs_create_file("htab", 0400, kvm->debugfs_dentry, kvm,
 			    &debugfs_htab_fops);
 }
 
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index c5508744e14c..f4e083c20872 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -1452,7 +1452,7 @@ static const struct file_operations debugfs_radix_fops = {
 
 void kvmhv_radix_debugfs_init(struct kvm *kvm)
 {
-	debugfs_create_file("radix", 0400, kvm->arch.debugfs_dir, kvm,
+	debugfs_create_file("radix", 0400, kvm->debugfs_dentry, kvm,
 			    &debugfs_radix_fops);
 }
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c8f12b056968..325b388c725a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2771,19 +2771,14 @@ static const struct file_operations debugfs_timings_ops = {
 };
 
 /* Create a debugfs directory for the vcpu */
-static void debugfs_vcpu_init(struct kvm_vcpu *vcpu, unsigned int id)
+static void kvmppc_arch_create_vcpu_debugfs_hv(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
 {
-	char buf[16];
-	struct kvm *kvm = vcpu->kvm;
-
-	snprintf(buf, sizeof(buf), "vcpu%u", id);
-	vcpu->arch.debugfs_dir = debugfs_create_dir(buf, kvm->arch.debugfs_dir);
-	debugfs_create_file("timings", 0444, vcpu->arch.debugfs_dir, vcpu,
+	debugfs_create_file("timings", 0444, debugfs_dentry, vcpu,
 			    &debugfs_timings_ops);
 }
 
 #else /* CONFIG_KVM_BOOK3S_HV_EXIT_TIMING */
-static void debugfs_vcpu_init(struct kvm_vcpu *vcpu, unsigned int id)
+static void kvmppc_arch_create_vcpu_debugfs_hv(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
 {
 }
 #endif /* CONFIG_KVM_BOOK3S_HV_EXIT_TIMING */
@@ -2907,8 +2902,6 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.cpu_type = KVM_CPU_3S_64;
 	kvmppc_sanity_check(vcpu);
 
-	debugfs_vcpu_init(vcpu, id);
-
 	return 0;
 }
 
@@ -5186,7 +5179,6 @@ void kvmppc_free_host_rm_ops(void)
 static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 {
 	unsigned long lpcr, lpid;
-	char buf[32];
 	int ret;
 
 	mutex_init(&kvm->arch.uvmem_lock);
@@ -5319,16 +5311,14 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 		kvm->arch.smt_mode = 1;
 	kvm->arch.emul_smt_mode = 1;
 
-	/*
-	 * Create a debugfs directory for the VM
-	 */
-	snprintf(buf, sizeof(buf), "vm%d", current->pid);
-	kvm->arch.debugfs_dir = debugfs_create_dir(buf, kvm_debugfs_dir);
+	return 0;
+}
+
+static void kvmppc_arch_create_kvm_debugfs_hv(struct kvm *kvm)
+{
 	kvmppc_mmu_debugfs_init(kvm);
 	if (radix_enabled())
 		kvmhv_radix_debugfs_init(kvm);
-
-	return 0;
 }
 
 static void kvmppc_free_vcores(struct kvm *kvm)
@@ -5342,8 +5332,6 @@ static void kvmppc_free_vcores(struct kvm *kvm)
 
 static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
 {
-	debugfs_remove_recursive(kvm->arch.debugfs_dir);
-
 	if (!cpu_has_feature(CPU_FTR_ARCH_300))
 		kvm_hv_vm_deactivated();
 
@@ -5996,6 +5984,8 @@ static struct kvmppc_ops kvm_ops_hv = {
 	.svm_off = kvmhv_svm_off,
 	.enable_dawr1 = kvmhv_enable_dawr1,
 	.hash_v3_possible = kvmppc_hash_v3_possible,
+	.create_vcpu_debugfs = kvmppc_arch_create_vcpu_debugfs_hv,
+	.create_kvm_debugfs = kvmppc_arch_create_kvm_debugfs_hv,
 };
 
 static int kvm_init_subcore_bitmap(void)
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index b4e6f70b97b9..9c18d599171b 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -2505,3 +2505,15 @@ int kvm_arch_init(void *opaque)
 }
 
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_ppc_instr);
+
+void kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
+{
+	if (vcpu->kvm->arch.kvm_ops->create_vcpu_debugfs)
+		vcpu->kvm->arch.kvm_ops->create_vcpu_debugfs(vcpu, debugfs_dentry);
+}
+
+void kvm_arch_create_kvm_debugfs(struct kvm *kvm)
+{
+	if (kvm->arch.kvm_ops->create_kvm_debugfs)
+		kvm->arch.kvm_ops->create_kvm_debugfs(kvm);
+}
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b50dbe269f4b..f9d423535f00 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -954,6 +954,9 @@ static int kvm_create_vm_debugfs(struct kvm *kvm, int fd)
 				    kvm->debugfs_dentry, stat_data,
 				    &stat_fops_per_vm);
 	}
+#ifdef __KVM_HAVE_ARCH_KVM_DEBUGFS
+	kvm_arch_create_kvm_debugfs(kvm);
+#endif
 	return 0;
 }
 
-- 
2.30.2

