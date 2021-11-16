Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4974536E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 17:07:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtrY304Y8z3c6R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 03:07:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtrTs14mPz2yQC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 03:04:17 +1100 (AEDT)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EC89619E1;
 Tue, 16 Nov 2021 16:04:15 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mn0wP-005sTB-G8; Tue, 16 Nov 2021 16:04:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu, linuxppc-dev@lists.ozlabs.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 6/7] KVM: Use 'unsigned long' as kvm_for_each_vcpu()'s index
Date: Tue, 16 Nov 2021 16:04:02 +0000
Message-Id: <20211116160403.4074052-7-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211116160403.4074052-1-maz@kernel.org>
References: <20211116160403.4074052-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu, linuxppc-dev@lists.ozlabs.org,
 pbonzini@redhat.com, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com,
 anup.patel@wdc.com, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 david@redhat.com, imbrenda@linux.ibm.com, jgross@suse.com, npiggin@gmail.com,
 seanjc@google.com, paulus@samba.org, mpe@ellerman.id.au, f4bug@amsat.org,
 james.morse@arm.com, suzuki.poulose@arm.com, alexandru.elisei@arm.com,
 kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Juergen Gross <jgross@suse.com>, Huacai Chen <chenhuacai@kernel.org>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Anup Patel <anup.patel@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@samba.org>, James Morse <james.morse@arm.com>,
 kernel-team@android.com, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Everywhere we use kvm_for_each_vpcu(), we use an int as the vcpu
index. Unfortunately, we're about to move rework the iterator,
which requires this to be upgrade to an unsigned long.

Let's bite the bullet and repaint all of it in one go.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c           |  8 ++++----
 arch/arm64/kvm/arm.c                  |  6 +++---
 arch/arm64/kvm/pmu-emul.c             |  2 +-
 arch/arm64/kvm/psci.c                 |  6 +++---
 arch/arm64/kvm/reset.c                |  2 +-
 arch/arm64/kvm/vgic/vgic-init.c       | 10 ++++++----
 arch/arm64/kvm/vgic/vgic-kvm-device.c |  2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v2.c    |  3 +--
 arch/arm64/kvm/vgic/vgic-mmio-v3.c    |  7 ++++---
 arch/arm64/kvm/vgic/vgic-v3.c         |  4 ++--
 arch/arm64/kvm/vgic/vgic-v4.c         |  5 +++--
 arch/arm64/kvm/vgic/vgic.c            |  2 +-
 arch/powerpc/kvm/book3s_32_mmu.c      |  2 +-
 arch/powerpc/kvm/book3s_64_mmu.c      |  2 +-
 arch/powerpc/kvm/book3s_hv.c          |  8 ++++----
 arch/powerpc/kvm/book3s_pr.c          |  2 +-
 arch/powerpc/kvm/book3s_xics.c        |  6 +++---
 arch/powerpc/kvm/book3s_xics.h        |  2 +-
 arch/powerpc/kvm/book3s_xive.c        | 15 +++++++++------
 arch/powerpc/kvm/book3s_xive.h        |  4 ++--
 arch/powerpc/kvm/book3s_xive_native.c |  8 ++++----
 arch/powerpc/kvm/e500_emulate.c       |  2 +-
 arch/riscv/kvm/vcpu_sbi.c             |  2 +-
 arch/riscv/kvm/vmid.c                 |  2 +-
 arch/s390/kvm/interrupt.c             |  2 +-
 arch/s390/kvm/kvm-s390.c              | 21 +++++++++++----------
 arch/s390/kvm/kvm-s390.h              |  4 ++--
 arch/x86/kvm/hyperv.c                 |  7 ++++---
 arch/x86/kvm/i8254.c                  |  2 +-
 arch/x86/kvm/i8259.c                  |  5 +++--
 arch/x86/kvm/ioapic.c                 |  4 ++--
 arch/x86/kvm/irq_comm.c               |  7 ++++---
 arch/x86/kvm/kvm_onhyperv.c           |  3 ++-
 arch/x86/kvm/lapic.c                  |  6 +++---
 arch/x86/kvm/svm/avic.c               |  2 +-
 arch/x86/kvm/svm/sev.c                |  3 ++-
 arch/x86/kvm/x86.c                    | 21 +++++++++++----------
 include/linux/kvm_host.h              |  2 +-
 virt/kvm/kvm_main.c                   | 13 +++++++------
 39 files changed, 114 insertions(+), 100 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 3df67c127489..d6f4114f1d11 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -750,7 +750,7 @@ int kvm_timer_vcpu_reset(struct kvm_vcpu *vcpu)
 /* Make the updates of cntvoff for all vtimer contexts atomic */
 static void update_vtimer_cntvoff(struct kvm_vcpu *vcpu, u64 cntvoff)
 {
-	int i;
+	unsigned long i;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_vcpu *tmp;
 
@@ -1189,8 +1189,8 @@ void kvm_timer_vcpu_terminate(struct kvm_vcpu *vcpu)
 
 static bool timer_irqs_are_valid(struct kvm_vcpu *vcpu)
 {
-	int vtimer_irq, ptimer_irq;
-	int i, ret;
+	int vtimer_irq, ptimer_irq, ret;
+	unsigned long i;
 
 	vtimer_irq = vcpu_vtimer(vcpu)->irq.irq;
 	ret = kvm_vgic_set_owner(vcpu, vtimer_irq, vcpu_vtimer(vcpu));
@@ -1297,7 +1297,7 @@ void kvm_timer_init_vhe(void)
 static void set_timer_irqs(struct kvm *kvm, int vtimer_irq, int ptimer_irq)
 {
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		vcpu_vtimer(vcpu)->irq.irq = vtimer_irq;
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 29942d8c357c..6177b0c882ea 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -624,7 +624,7 @@ bool kvm_arch_intc_initialized(struct kvm *kvm)
 
 void kvm_arm_halt_guest(struct kvm *kvm)
 {
-	int i;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
 	kvm_for_each_vcpu(i, vcpu, kvm)
@@ -634,7 +634,7 @@ void kvm_arm_halt_guest(struct kvm *kvm)
 
 void kvm_arm_resume_guest(struct kvm *kvm)
 {
-	int i;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
@@ -2020,7 +2020,7 @@ static int finalize_hyp_mode(void)
 struct kvm_vcpu *kvm_mpidr_to_vcpu(struct kvm *kvm, unsigned long mpidr)
 {
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 
 	mpidr &= MPIDR_HWID_BITMASK;
 	kvm_for_each_vcpu(i, vcpu, kvm) {
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index a5e4bbf5e68f..0404357705a8 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -900,7 +900,7 @@ static int kvm_arm_pmu_v3_init(struct kvm_vcpu *vcpu)
  */
 static bool pmu_irq_is_valid(struct kvm *kvm, int irq)
 {
-	int i;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
index 74c47d420253..ed675fce8fb7 100644
--- a/arch/arm64/kvm/psci.c
+++ b/arch/arm64/kvm/psci.c
@@ -121,8 +121,8 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
 
 static unsigned long kvm_psci_vcpu_affinity_info(struct kvm_vcpu *vcpu)
 {
-	int i, matching_cpus = 0;
-	unsigned long mpidr;
+	int matching_cpus = 0;
+	unsigned long i, mpidr;
 	unsigned long target_affinity;
 	unsigned long target_affinity_mask;
 	unsigned long lowest_affinity_level;
@@ -164,7 +164,7 @@ static unsigned long kvm_psci_vcpu_affinity_info(struct kvm_vcpu *vcpu)
 
 static void kvm_prepare_system_event(struct kvm_vcpu *vcpu, u32 type)
 {
-	int i;
+	unsigned long i;
 	struct kvm_vcpu *tmp;
 
 	/*
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 426bd7fbc3fd..97de30a79770 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -170,7 +170,7 @@ static bool vcpu_allowed_register_width(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu *tmp;
 	bool is32bit;
-	int i;
+	unsigned long i;
 
 	is32bit = vcpu_has_feature(vcpu, KVM_ARM_VCPU_EL1_32BIT);
 	if (!cpus_have_const_cap(ARM64_HAS_32BIT_EL1) && is32bit)
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 0a06d0648970..a7382bda9676 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -70,8 +70,9 @@ void kvm_vgic_early_init(struct kvm *kvm)
  */
 int kvm_vgic_create(struct kvm *kvm, u32 type)
 {
-	int i, ret;
 	struct kvm_vcpu *vcpu;
+	unsigned long i;
+	int ret;
 
 	if (irqchip_in_kernel(kvm))
 		return -EEXIST;
@@ -255,7 +256,8 @@ int vgic_init(struct kvm *kvm)
 {
 	struct vgic_dist *dist = &kvm->arch.vgic;
 	struct kvm_vcpu *vcpu;
-	int ret = 0, i, idx;
+	int ret = 0, i;
+	unsigned long idx;
 
 	if (vgic_initialized(kvm))
 		return 0;
@@ -308,7 +310,7 @@ int vgic_init(struct kvm *kvm)
 			goto out;
 	}
 
-	kvm_for_each_vcpu(i, vcpu, kvm)
+	kvm_for_each_vcpu(idx, vcpu, kvm)
 		kvm_vgic_vcpu_enable(vcpu);
 
 	ret = kvm_vgic_setup_default_irq_routing(kvm);
@@ -370,7 +372,7 @@ void kvm_vgic_vcpu_destroy(struct kvm_vcpu *vcpu)
 static void __kvm_vgic_destroy(struct kvm *kvm)
 {
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 
 	vgic_debug_destroy(kvm);
 
diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
index 0d000d2fe8d2..c6d52a1fd9c8 100644
--- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
+++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
@@ -325,7 +325,7 @@ void unlock_all_vcpus(struct kvm *kvm)
 bool lock_all_vcpus(struct kvm *kvm)
 {
 	struct kvm_vcpu *tmp_vcpu;
-	int c;
+	unsigned long c;
 
 	/*
 	 * Any time a vcpu is run, vcpu_load is called which tries to grab the
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v2.c b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
index 5f9014ae595b..12e4c223e6b8 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
@@ -113,9 +113,8 @@ static void vgic_mmio_write_sgir(struct kvm_vcpu *source_vcpu,
 	int intid = val & 0xf;
 	int targets = (val >> 16) & 0xff;
 	int mode = (val >> 24) & 0x03;
-	int c;
 	struct kvm_vcpu *vcpu;
-	unsigned long flags;
+	unsigned long flags, c;
 
 	switch (mode) {
 	case 0x0:		/* as specified by targets */
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index bf7ec4a78497..82906cb3f713 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -754,7 +754,8 @@ static void vgic_unregister_redist_iodev(struct kvm_vcpu *vcpu)
 static int vgic_register_all_redist_iodevs(struct kvm *kvm)
 {
 	struct kvm_vcpu *vcpu;
-	int c, ret = 0;
+	unsigned long c;
+	int ret = 0;
 
 	kvm_for_each_vcpu(c, vcpu, kvm) {
 		ret = vgic_register_redist_iodev(vcpu);
@@ -995,10 +996,10 @@ void vgic_v3_dispatch_sgi(struct kvm_vcpu *vcpu, u64 reg, bool allow_group1)
 	struct kvm_vcpu *c_vcpu;
 	u16 target_cpus;
 	u64 mpidr;
-	int sgi, c;
+	int sgi;
 	int vcpu_id = vcpu->vcpu_id;
 	bool broadcast;
-	unsigned long flags;
+	unsigned long c, flags;
 
 	sgi = (reg & ICC_SGI1R_SGI_ID_MASK) >> ICC_SGI1R_SGI_ID_SHIFT;
 	broadcast = reg & BIT_ULL(ICC_SGI1R_IRQ_ROUTING_MODE_BIT);
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 04f62c4b07fb..5fedaee15e72 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -542,13 +542,13 @@ int vgic_v3_map_resources(struct kvm *kvm)
 	struct vgic_dist *dist = &kvm->arch.vgic;
 	struct kvm_vcpu *vcpu;
 	int ret = 0;
-	int c;
+	unsigned long c;
 
 	kvm_for_each_vcpu(c, vcpu, kvm) {
 		struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
 
 		if (IS_VGIC_ADDR_UNDEF(vgic_cpu->rd_iodev.base_addr)) {
-			kvm_debug("vcpu %d redistributor base not set\n", c);
+			kvm_debug("vcpu %ld redistributor base not set\n", c);
 			return -ENXIO;
 		}
 	}
diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index 772dd15a22c7..ad06ba6c9b00 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -189,7 +189,7 @@ void vgic_v4_configure_vsgis(struct kvm *kvm)
 {
 	struct vgic_dist *dist = &kvm->arch.vgic;
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 
 	kvm_arm_halt_guest(kvm);
 
@@ -235,7 +235,8 @@ int vgic_v4_init(struct kvm *kvm)
 {
 	struct vgic_dist *dist = &kvm->arch.vgic;
 	struct kvm_vcpu *vcpu;
-	int i, nr_vcpus, ret;
+	int nr_vcpus, ret;
+	unsigned long i;
 
 	if (!kvm_vgic_global_state.has_gicv4)
 		return 0; /* Nothing to see here... move along. */
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 5dad4996cfb2..9b98876a8a93 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -990,7 +990,7 @@ int kvm_vgic_vcpu_pending_irq(struct kvm_vcpu *vcpu)
 void vgic_kick_vcpus(struct kvm *kvm)
 {
 	struct kvm_vcpu *vcpu;
-	int c;
+	unsigned long c;
 
 	/*
 	 * We've injected an interrupt, time to find out who deserves
diff --git a/arch/powerpc/kvm/book3s_32_mmu.c b/arch/powerpc/kvm/book3s_32_mmu.c
index 3fbd570f9c1e..0215f32932a9 100644
--- a/arch/powerpc/kvm/book3s_32_mmu.c
+++ b/arch/powerpc/kvm/book3s_32_mmu.c
@@ -337,7 +337,7 @@ static void kvmppc_mmu_book3s_32_mtsrin(struct kvm_vcpu *vcpu, u32 srnum,
 
 static void kvmppc_mmu_book3s_32_tlbie(struct kvm_vcpu *vcpu, ulong ea, bool large)
 {
-	int i;
+	unsigned long i;
 	struct kvm_vcpu *v;
 
 	/* flush this VA on all cpus */
diff --git a/arch/powerpc/kvm/book3s_64_mmu.c b/arch/powerpc/kvm/book3s_64_mmu.c
index feee40cb2ba1..61290282fd9e 100644
--- a/arch/powerpc/kvm/book3s_64_mmu.c
+++ b/arch/powerpc/kvm/book3s_64_mmu.c
@@ -530,7 +530,7 @@ static void kvmppc_mmu_book3s_64_tlbie(struct kvm_vcpu *vcpu, ulong va,
 				       bool large)
 {
 	u64 mask = 0xFFFFFFFFFULL;
-	long i;
+	unsigned long i;
 	struct kvm_vcpu *v;
 
 	dprintk("KVM MMU: tlbie(0x%lx)\n", va);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7b74fc0a986b..32873c6985f9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1993,7 +1993,7 @@ static void kvmppc_set_lpcr(struct kvm_vcpu *vcpu, u64 new_lpcr,
 	 */
 	if ((new_lpcr & LPCR_ILE) != (vc->lpcr & LPCR_ILE)) {
 		struct kvm_vcpu *vcpu;
-		int i;
+		unsigned long i;
 
 		kvm_for_each_vcpu(i, vcpu, kvm) {
 			if (vcpu->arch.vcore != vc)
@@ -4786,8 +4786,8 @@ static int kvm_vm_ioctl_get_dirty_log_hv(struct kvm *kvm,
 {
 	struct kvm_memslots *slots;
 	struct kvm_memory_slot *memslot;
-	int i, r;
-	unsigned long n;
+	int r;
+	unsigned long n, i;
 	unsigned long *buf, *p;
 	struct kvm_vcpu *vcpu;
 
@@ -5861,7 +5861,7 @@ static int kvmhv_svm_off(struct kvm *kvm)
 	int mmu_was_ready;
 	int srcu_idx;
 	int ret = 0;
-	int i;
+	unsigned long i;
 
 	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
 		return ret;
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 6bc9425acb32..bb0612c49b92 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -428,7 +428,7 @@ static int kvmppc_core_check_requests_pr(struct kvm_vcpu *vcpu)
 /************* MMU Notifiers *************/
 static bool do_kvm_unmap_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	long i;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
 	kvm_for_each_vcpu(i, vcpu, kvm)
diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
index ebd5d920de8c..9cc466006e8b 100644
--- a/arch/powerpc/kvm/book3s_xics.c
+++ b/arch/powerpc/kvm/book3s_xics.c
@@ -942,8 +942,8 @@ static int xics_debug_show(struct seq_file *m, void *private)
 	struct kvmppc_xics *xics = m->private;
 	struct kvm *kvm = xics->kvm;
 	struct kvm_vcpu *vcpu;
-	int icsid, i;
-	unsigned long flags;
+	int icsid;
+	unsigned long flags, i;
 	unsigned long t_rm_kick_vcpu, t_rm_check_resend;
 	unsigned long t_rm_notify_eoi;
 	unsigned long t_reject, t_check_resend;
@@ -1340,7 +1340,7 @@ static int xics_has_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 static void kvmppc_xics_release(struct kvm_device *dev)
 {
 	struct kvmppc_xics *xics = dev->private;
-	int i;
+	unsigned long i;
 	struct kvm *kvm = xics->kvm;
 	struct kvm_vcpu *vcpu;
 
diff --git a/arch/powerpc/kvm/book3s_xics.h b/arch/powerpc/kvm/book3s_xics.h
index 6231f76bdd66..8e4c79e2fcd8 100644
--- a/arch/powerpc/kvm/book3s_xics.h
+++ b/arch/powerpc/kvm/book3s_xics.h
@@ -116,7 +116,7 @@ static inline struct kvmppc_icp *kvmppc_xics_find_server(struct kvm *kvm,
 							 u32 nr)
 {
 	struct kvm_vcpu *vcpu = NULL;
-	int i;
+	unsigned long i;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		if (vcpu->arch.icp && nr == vcpu->arch.icp->server_num)
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 225008882958..e216c068075d 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -368,7 +368,8 @@ static int xive_check_provisioning(struct kvm *kvm, u8 prio)
 {
 	struct kvmppc_xive *xive = kvm->arch.xive;
 	struct kvm_vcpu *vcpu;
-	int i, rc;
+	unsigned long i;
+	int rc;
 
 	lockdep_assert_held(&xive->lock);
 
@@ -439,7 +440,8 @@ static int xive_try_pick_queue(struct kvm_vcpu *vcpu, u8 prio)
 int kvmppc_xive_select_target(struct kvm *kvm, u32 *server, u8 prio)
 {
 	struct kvm_vcpu *vcpu;
-	int i, rc;
+	unsigned long i;
+	int rc;
 
 	/* Locate target server */
 	vcpu = kvmppc_xive_find_server(kvm, *server);
@@ -1519,7 +1521,8 @@ static void xive_pre_save_queue(struct kvmppc_xive *xive, struct xive_q *q)
 static void xive_pre_save_scan(struct kvmppc_xive *xive)
 {
 	struct kvm_vcpu *vcpu = NULL;
-	int i, j;
+	unsigned long i;
+	int j;
 
 	/*
 	 * See comment in xive_get_source() about how this
@@ -1700,7 +1703,7 @@ static bool xive_check_delayed_irq(struct kvmppc_xive *xive, u32 irq)
 {
 	struct kvm *kvm = xive->kvm;
 	struct kvm_vcpu *vcpu = NULL;
-	int i;
+	unsigned long i;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
@@ -2037,7 +2040,7 @@ static void kvmppc_xive_release(struct kvm_device *dev)
 	struct kvmppc_xive *xive = dev->private;
 	struct kvm *kvm = xive->kvm;
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 
 	pr_devel("Releasing xive device\n");
 
@@ -2291,7 +2294,7 @@ static int xive_debug_show(struct seq_file *m, void *private)
 	u64 t_vm_h_cppr = 0;
 	u64 t_vm_h_eoi = 0;
 	u64 t_vm_h_ipi = 0;
-	unsigned int i;
+	unsigned long i;
 
 	if (!kvm)
 		return 0;
diff --git a/arch/powerpc/kvm/book3s_xive.h b/arch/powerpc/kvm/book3s_xive.h
index e6a9651c6f1e..09d0657596c3 100644
--- a/arch/powerpc/kvm/book3s_xive.h
+++ b/arch/powerpc/kvm/book3s_xive.h
@@ -199,7 +199,7 @@ struct kvmppc_xive_vcpu {
 static inline struct kvm_vcpu *kvmppc_xive_find_server(struct kvm *kvm, u32 nr)
 {
 	struct kvm_vcpu *vcpu = NULL;
-	int i;
+	unsigned long i;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		if (vcpu->arch.xive_vcpu && nr == vcpu->arch.xive_vcpu->server_num)
@@ -240,7 +240,7 @@ static inline u32 kvmppc_xive_vp(struct kvmppc_xive *xive, u32 server)
 static inline bool kvmppc_xive_vp_in_use(struct kvm *kvm, u32 vp_id)
 {
 	struct kvm_vcpu *vcpu = NULL;
-	int i;
+	unsigned long i;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		if (vcpu->arch.xive_vcpu && vp_id == vcpu->arch.xive_vcpu->vp_id)
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index 99db9ac49901..561a5bfe0468 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -807,7 +807,7 @@ static int kvmppc_xive_reset(struct kvmppc_xive *xive)
 {
 	struct kvm *kvm = xive->kvm;
 	struct kvm_vcpu *vcpu;
-	unsigned int i;
+	unsigned long i;
 
 	pr_devel("%s\n", __func__);
 
@@ -916,7 +916,7 @@ static int kvmppc_xive_native_eq_sync(struct kvmppc_xive *xive)
 {
 	struct kvm *kvm = xive->kvm;
 	struct kvm_vcpu *vcpu;
-	unsigned int i;
+	unsigned long i;
 
 	pr_devel("%s\n", __func__);
 
@@ -1017,7 +1017,7 @@ static void kvmppc_xive_native_release(struct kvm_device *dev)
 	struct kvmppc_xive *xive = dev->private;
 	struct kvm *kvm = xive->kvm;
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 
 	pr_devel("Releasing xive native device\n");
 
@@ -1214,7 +1214,7 @@ static int xive_native_debug_show(struct seq_file *m, void *private)
 	struct kvmppc_xive *xive = m->private;
 	struct kvm *kvm = xive->kvm;
 	struct kvm_vcpu *vcpu;
-	unsigned int i;
+	unsigned long i;
 
 	if (!kvm)
 		return 0;
diff --git a/arch/powerpc/kvm/e500_emulate.c b/arch/powerpc/kvm/e500_emulate.c
index 64eb833e9f02..051102d50c31 100644
--- a/arch/powerpc/kvm/e500_emulate.c
+++ b/arch/powerpc/kvm/e500_emulate.c
@@ -65,7 +65,7 @@ static int kvmppc_e500_emul_msgsnd(struct kvm_vcpu *vcpu, int rb)
 	ulong param = vcpu->arch.regs.gpr[rb];
 	int prio = dbell2prio(rb);
 	int pir = param & PPC_DBELL_PIR_MASK;
-	int i;
+	unsigned long i;
 	struct kvm_vcpu *cvcpu;
 
 	if (prio < 0)
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index eb3c045edf11..fe65bef4eb90 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -60,7 +60,7 @@ int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
 				    struct kvm_run *run, u32 type)
 {
-	int i;
+	unsigned long i;
 	struct kvm_vcpu *tmp;
 
 	kvm_for_each_vcpu(i, tmp, vcpu->kvm)
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 2c6253b293bc..807228f8f409 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -65,7 +65,7 @@ bool kvm_riscv_stage2_vmid_ver_changed(struct kvm_vmid *vmid)
 
 void kvm_riscv_stage2_vmid_update(struct kvm_vcpu *vcpu)
 {
-	int i;
+	unsigned long i;
 	struct kvm_vcpu *v;
 	struct cpumask hmask;
 	struct kvm_vmid *vmid = &vcpu->kvm->arch.vmid;
diff --git a/arch/s390/kvm/interrupt.c b/arch/s390/kvm/interrupt.c
index c3bd993fdd0c..1aa094810f6d 100644
--- a/arch/s390/kvm/interrupt.c
+++ b/arch/s390/kvm/interrupt.c
@@ -2659,7 +2659,7 @@ static int flic_ais_mode_set_all(struct kvm *kvm, struct kvm_device_attr *attr)
 static int flic_set_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
 {
 	int r = 0;
-	unsigned int i;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
 	switch (attr->group) {
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 4a0f62b03964..b36a886c0421 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -295,7 +295,7 @@ static int kvm_clock_sync(struct notifier_block *notifier, unsigned long val,
 {
 	struct kvm *kvm;
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 	unsigned long long *delta = v;
 
 	list_for_each_entry(kvm, &vm_list, vm_list) {
@@ -680,7 +680,7 @@ int kvm_vm_ioctl_get_dirty_log(struct kvm *kvm,
 
 static void icpt_operexc_on_all_vcpus(struct kvm *kvm)
 {
-	unsigned int i;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
@@ -934,7 +934,7 @@ static void kvm_s390_vcpu_crypto_setup(struct kvm_vcpu *vcpu);
 void kvm_s390_vcpu_crypto_reset_all(struct kvm *kvm)
 {
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 
 	kvm_s390_vcpu_block_all(kvm);
 
@@ -1019,7 +1019,7 @@ static int kvm_s390_vm_set_crypto(struct kvm *kvm, struct kvm_device_attr *attr)
 
 static void kvm_s390_sync_request_broadcast(struct kvm *kvm, int req)
 {
-	int cx;
+	unsigned long cx;
 	struct kvm_vcpu *vcpu;
 
 	kvm_for_each_vcpu(cx, vcpu, kvm)
@@ -2204,7 +2204,7 @@ static int kvm_s390_cpus_from_pv(struct kvm *kvm, u16 *rcp, u16 *rrcp)
 	struct kvm_vcpu *vcpu;
 	u16 rc, rrc;
 	int ret = 0;
-	int i;
+	unsigned long i;
 
 	/*
 	 * We ignore failures and try to destroy as many CPUs as possible.
@@ -2228,7 +2228,8 @@ static int kvm_s390_cpus_from_pv(struct kvm *kvm, u16 *rcp, u16 *rrcp)
 
 static int kvm_s390_cpus_to_pv(struct kvm *kvm, u16 *rc, u16 *rrc)
 {
-	int i, r = 0;
+	unsigned long i;
+	int r = 0;
 	u16 dummy;
 
 	struct kvm_vcpu *vcpu;
@@ -2927,7 +2928,7 @@ static int sca_switch_to_extended(struct kvm *kvm)
 	struct bsca_block *old_sca = kvm->arch.sca;
 	struct esca_block *new_sca;
 	struct kvm_vcpu *vcpu;
-	unsigned int vcpu_idx;
+	unsigned long vcpu_idx;
 	u32 scaol, scaoh;
 
 	if (kvm->arch.use_esca)
@@ -3409,7 +3410,7 @@ static void kvm_gmap_notifier(struct gmap *gmap, unsigned long start,
 	struct kvm *kvm = gmap->private;
 	struct kvm_vcpu *vcpu;
 	unsigned long prefix;
-	int i;
+	unsigned long i;
 
 	if (gmap_is_shadow(gmap))
 		return;
@@ -3902,7 +3903,7 @@ void kvm_s390_set_tod_clock(struct kvm *kvm,
 {
 	struct kvm_vcpu *vcpu;
 	union tod_clock clk;
-	int i;
+	unsigned long i;
 
 	mutex_lock(&kvm->lock);
 	preempt_disable();
@@ -4534,7 +4535,7 @@ static void __disable_ibs_on_vcpu(struct kvm_vcpu *vcpu)
 
 static void __disable_ibs_on_all_vcpus(struct kvm *kvm)
 {
-	unsigned int i;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
diff --git a/arch/s390/kvm/kvm-s390.h b/arch/s390/kvm/kvm-s390.h
index c07a050d757d..b887fe7a7064 100644
--- a/arch/s390/kvm/kvm-s390.h
+++ b/arch/s390/kvm/kvm-s390.h
@@ -357,7 +357,7 @@ int kvm_s390_handle_diag(struct kvm_vcpu *vcpu);
 
 static inline void kvm_s390_vcpu_block_all(struct kvm *kvm)
 {
-	int i;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
 	WARN_ON(!mutex_is_locked(&kvm->lock));
@@ -367,7 +367,7 @@ static inline void kvm_s390_vcpu_block_all(struct kvm *kvm)
 
 static inline void kvm_s390_vcpu_unblock_all(struct kvm *kvm)
 {
-	int i;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
 	kvm_for_each_vcpu(i, vcpu, kvm)
diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index 4a555f32885a..e8c18f25814a 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -164,7 +164,7 @@ static int synic_set_sint(struct kvm_vcpu_hv_synic *synic, int sint,
 static struct kvm_vcpu *get_vcpu_by_vpidx(struct kvm *kvm, u32 vpidx)
 {
 	struct kvm_vcpu *vcpu = NULL;
-	int i;
+	unsigned long i;
 
 	if (vpidx >= KVM_MAX_VCPUS)
 		return NULL;
@@ -1716,7 +1716,8 @@ static __always_inline unsigned long *sparse_set_to_vcpu_mask(
 {
 	struct kvm_hv *hv = to_kvm_hv(kvm);
 	struct kvm_vcpu *vcpu;
-	int i, bank, sbank = 0;
+	int bank, sbank = 0;
+	unsigned long i;
 
 	memset(vp_bitmap, 0,
 	       KVM_HV_MAX_SPARSE_VCPU_SET_BITS * sizeof(*vp_bitmap));
@@ -1863,7 +1864,7 @@ static void kvm_send_ipi_to_many(struct kvm *kvm, u32 vector,
 		.vector = vector
 	};
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		if (vcpu_bitmap && !test_bit(i, vcpu_bitmap))
diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
index 5a69cce4d72d..0b65a764ed3a 100644
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@ -242,7 +242,7 @@ static void pit_do_work(struct kthread_work *work)
 	struct kvm_pit *pit = container_of(work, struct kvm_pit, expired);
 	struct kvm *kvm = pit->kvm;
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 	struct kvm_kpit_state *ps = &pit->pit_state;
 
 	if (atomic_read(&ps->reinject) && !atomic_xchg(&ps->irq_ack, 0))
diff --git a/arch/x86/kvm/i8259.c b/arch/x86/kvm/i8259.c
index 0b80263d46d8..814064d06016 100644
--- a/arch/x86/kvm/i8259.c
+++ b/arch/x86/kvm/i8259.c
@@ -50,7 +50,7 @@ static void pic_unlock(struct kvm_pic *s)
 {
 	bool wakeup = s->wakeup_needed;
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 
 	s->wakeup_needed = false;
 
@@ -270,7 +270,8 @@ int kvm_pic_read_irq(struct kvm *kvm)
 
 static void kvm_pic_reset(struct kvm_kpic_state *s)
 {
-	int irq, i;
+	int irq;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 	u8 edge_irr = s->irr & ~s->elcr;
 	bool found = false;
diff --git a/arch/x86/kvm/ioapic.c b/arch/x86/kvm/ioapic.c
index 816a82515dcd..decfa36b7891 100644
--- a/arch/x86/kvm/ioapic.c
+++ b/arch/x86/kvm/ioapic.c
@@ -149,7 +149,7 @@ void kvm_rtc_eoi_tracking_restore_one(struct kvm_vcpu *vcpu)
 static void kvm_rtc_eoi_tracking_restore_all(struct kvm_ioapic *ioapic)
 {
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 
 	if (RTC_GSI >= IOAPIC_NUM_PINS)
 		return;
@@ -184,7 +184,7 @@ static bool rtc_irq_check_coalesced(struct kvm_ioapic *ioapic)
 
 static void ioapic_lazy_update_eoi(struct kvm_ioapic *ioapic, int irq)
 {
-	int i;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 	union kvm_ioapic_redirect_entry *entry = &ioapic->redirtbl[irq];
 
diff --git a/arch/x86/kvm/irq_comm.c b/arch/x86/kvm/irq_comm.c
index d5b72a08e566..39ad02d6dc63 100644
--- a/arch/x86/kvm/irq_comm.c
+++ b/arch/x86/kvm/irq_comm.c
@@ -45,9 +45,9 @@ static int kvm_set_ioapic_irq(struct kvm_kernel_irq_routing_entry *e,
 int kvm_irq_delivery_to_apic(struct kvm *kvm, struct kvm_lapic *src,
 		struct kvm_lapic_irq *irq, struct dest_map *dest_map)
 {
-	int i, r = -1;
+	int r = -1;
 	struct kvm_vcpu *vcpu, *lowest = NULL;
-	unsigned long dest_vcpu_bitmap[BITS_TO_LONGS(KVM_MAX_VCPUS)];
+	unsigned long i, dest_vcpu_bitmap[BITS_TO_LONGS(KVM_MAX_VCPUS)];
 	unsigned int dest_vcpus = 0;
 
 	if (kvm_irq_delivery_to_apic_fast(kvm, src, irq, &r, dest_map))
@@ -320,7 +320,8 @@ int kvm_set_routing_entry(struct kvm *kvm,
 bool kvm_intr_is_single_vcpu(struct kvm *kvm, struct kvm_lapic_irq *irq,
 			     struct kvm_vcpu **dest_vcpu)
 {
-	int i, r = 0;
+	int r = 0;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
 	if (kvm_intr_is_single_vcpu_fast(kvm, irq, dest_vcpu))
diff --git a/arch/x86/kvm/kvm_onhyperv.c b/arch/x86/kvm/kvm_onhyperv.c
index c7db2df50a7a..b469f45e3fe4 100644
--- a/arch/x86/kvm/kvm_onhyperv.c
+++ b/arch/x86/kvm/kvm_onhyperv.c
@@ -33,7 +33,8 @@ int hv_remote_flush_tlb_with_range(struct kvm *kvm,
 {
 	struct kvm_arch *kvm_arch = &kvm->arch;
 	struct kvm_vcpu *vcpu;
-	int ret = 0, i, nr_unique_valid_roots;
+	int ret = 0, nr_unique_valid_roots;
+	unsigned long i;
 	hpa_t root;
 
 	spin_lock(&kvm_arch->hv_root_tdp_lock);
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 759952dd1222..31fa9b6760ea 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -185,7 +185,7 @@ void kvm_recalculate_apic_map(struct kvm *kvm)
 {
 	struct kvm_apic_map *new, *old = NULL;
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 	u32 max_id = 255; /* enough space for any xAPIC ID */
 
 	/* Read kvm->arch.apic_map_dirty before kvm->arch.apic_map.  */
@@ -1172,8 +1172,8 @@ void kvm_bitmap_or_dest_vcpus(struct kvm *kvm, struct kvm_lapic_irq *irq,
 	struct kvm_lapic *src = NULL;
 	struct kvm_apic_map *map;
 	struct kvm_vcpu *vcpu;
-	unsigned long bitmap;
-	int i, vcpu_idx;
+	unsigned long bitmap, i;
+	int vcpu_idx;
 	bool ret;
 
 	rcu_read_lock();
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index affc0ea98d30..c6e1f07cca28 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -293,7 +293,7 @@ static void avic_kick_target_vcpus(struct kvm *kvm, struct kvm_lapic *source,
 				   u32 icrl, u32 icrh)
 {
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		bool m = kvm_apic_match_dest(vcpu, source,
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 902c52a8dd0c..dfa8cdafe708 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -637,7 +637,8 @@ static int __sev_launch_update_vmsa(struct kvm *kvm, struct kvm_vcpu *vcpu,
 static int sev_launch_update_vmsa(struct kvm *kvm, struct kvm_sev_cmd *argp)
 {
 	struct kvm_vcpu *vcpu;
-	int i, ret;
+	unsigned long i;
+	int ret;
 
 	if (!sev_es_guest(kvm))
 		return -ENOTTY;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 259f719014c9..abda63a0e381 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2816,7 +2816,7 @@ static void kvm_end_pvclock_update(struct kvm *kvm)
 {
 	struct kvm_arch *ka = &kvm->arch;
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 
 	write_seqcount_end(&ka->pvclock_sc);
 	raw_spin_unlock_irq(&ka->tsc_write_lock);
@@ -3065,7 +3065,7 @@ static int kvm_guest_time_update(struct kvm_vcpu *v)
 
 static void kvmclock_update_fn(struct work_struct *work)
 {
-	int i;
+	unsigned long i;
 	struct delayed_work *dwork = to_delayed_work(work);
 	struct kvm_arch *ka = container_of(dwork, struct kvm_arch,
 					   kvmclock_update_work);
@@ -5650,7 +5650,7 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
 	 * VM-Exit.
 	 */
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 
 	kvm_for_each_vcpu(i, vcpu, kvm)
 		kvm_vcpu_kick(vcpu);
@@ -5918,7 +5918,8 @@ static int kvm_vm_ioctl_set_msr_filter(struct kvm *kvm, void __user *argp)
 static int kvm_arch_suspend_notifier(struct kvm *kvm)
 {
 	struct kvm_vcpu *vcpu;
-	int i, ret = 0;
+	unsigned long i;
+	int ret = 0;
 
 	mutex_lock(&kvm->lock);
 	kvm_for_each_vcpu(i, vcpu, kvm) {
@@ -8344,7 +8345,8 @@ static void __kvmclock_cpufreq_notifier(struct cpufreq_freqs *freq, int cpu)
 {
 	struct kvm *kvm;
 	struct kvm_vcpu *vcpu;
-	int i, send_ipi = 0;
+	int send_ipi = 0;
+	unsigned long i;
 
 	/*
 	 * We allow guests to temporarily run on slowing clocks,
@@ -8517,9 +8519,8 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
 static void pvclock_gtod_update_fn(struct work_struct *work)
 {
 	struct kvm *kvm;
-
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 
 	mutex_lock(&kvm_lock);
 	list_for_each_entry(kvm, &vm_list, vm_list)
@@ -11115,7 +11116,7 @@ int kvm_arch_hardware_enable(void)
 {
 	struct kvm *kvm;
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 	int ret;
 	u64 local_tsc;
 	u64 max_tsc = 0;
@@ -11368,7 +11369,7 @@ static void kvm_unload_vcpu_mmu(struct kvm_vcpu *vcpu)
 
 static void kvm_free_vcpus(struct kvm *kvm)
 {
-	unsigned int i;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
 	/*
@@ -11614,7 +11615,7 @@ static int kvm_alloc_memslot_metadata(struct kvm *kvm,
 void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen)
 {
 	struct kvm_vcpu *vcpu;
-	int i;
+	unsigned long i;
 
 	/*
 	 * memslots->generation has been incremented.
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index df1b2b183d94..dc635fbfd901 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -714,7 +714,7 @@ static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
 static inline struct kvm_vcpu *kvm_get_vcpu_by_id(struct kvm *kvm, int id)
 {
 	struct kvm_vcpu *vcpu = NULL;
-	int i;
+	unsigned long i;
 
 	if (id < 0)
 		return NULL;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9a7bce944427..b85cd9c916d4 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -305,8 +305,9 @@ bool kvm_make_all_cpus_request_except(struct kvm *kvm, unsigned int req,
 {
 	struct kvm_vcpu *vcpu;
 	struct cpumask *cpus;
+	unsigned long i;
 	bool called;
-	int i, me;
+	int me;
 
 	me = get_cpu();
 
@@ -453,7 +454,7 @@ static void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
 
 void kvm_destroy_vcpus(struct kvm *kvm)
 {
-	unsigned int i;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
@@ -3449,10 +3450,10 @@ void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
 	struct kvm *kvm = me->kvm;
 	struct kvm_vcpu *vcpu;
 	int last_boosted_vcpu = me->kvm->last_boosted_vcpu;
+	unsigned long i;
 	int yielded = 0;
 	int try = 3;
 	int pass;
-	int i;
 
 	kvm_vcpu_set_in_spin_loop(me, true);
 	/*
@@ -4261,7 +4262,7 @@ static int kvm_vm_ioctl_enable_dirty_log_ring(struct kvm *kvm, u32 size)
 
 static int kvm_vm_ioctl_reset_dirty_pages(struct kvm *kvm)
 {
-	int i;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 	int cleared = 0;
 
@@ -5180,7 +5181,7 @@ static int kvm_clear_stat_per_vm(struct kvm *kvm, size_t offset)
 
 static int kvm_get_stat_per_vcpu(struct kvm *kvm, size_t offset, u64 *val)
 {
-	int i;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
 	*val = 0;
@@ -5193,7 +5194,7 @@ static int kvm_get_stat_per_vcpu(struct kvm *kvm, size_t offset, u64 *val)
 
 static int kvm_clear_stat_per_vcpu(struct kvm *kvm, size_t offset)
 {
-	int i;
+	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
 	kvm_for_each_vcpu(i, vcpu, kvm)
-- 
2.30.2

