Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 925DD7E1509
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Nov 2023 17:37:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZtOhttNw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZtOhttNw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SNgBX3XWrz3vh5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 03:37:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZtOhttNw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZtOhttNw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SNg3p63zkz3cP3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 03:31:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699201908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TcnDDpNmQ9oeR1dM0nw5ludDtEhXmMwIuH6hc6zAWiQ=;
	b=ZtOhttNwxol+EPeu5sDULiX+jUPzyXOM1XDut9HiOM7ndbvUMIM0ka5lB8o91X1G0SbNDv
	7vrQLqMWU9+dhdYhU3rZSrse1PE6J3vL1AuPa+yhiml9hUZoqILNUJghdUrbRlbgxSFf3V
	5SFMzlRimhH5qVjbTiHI1o7RpsGS55I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699201908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TcnDDpNmQ9oeR1dM0nw5ludDtEhXmMwIuH6hc6zAWiQ=;
	b=ZtOhttNwxol+EPeu5sDULiX+jUPzyXOM1XDut9HiOM7ndbvUMIM0ka5lB8o91X1G0SbNDv
	7vrQLqMWU9+dhdYhU3rZSrse1PE6J3vL1AuPa+yhiml9hUZoqILNUJghdUrbRlbgxSFf3V
	5SFMzlRimhH5qVjbTiHI1o7RpsGS55I=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-108-hhmXQfSCN0K_7XIrjQ7J8A-1; Sun,
 05 Nov 2023 11:31:44 -0500
X-MC-Unique: hhmXQfSCN0K_7XIrjQ7J8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCE3A29ABA19;
	Sun,  5 Nov 2023 16:31:40 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A30752166B26;
	Sun,  5 Nov 2023 16:31:33 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sean Christopherson <seanjc@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 07/34] KVM: Convert KVM_ARCH_WANT_MMU_NOTIFIER to CONFIG_KVM_GENERIC_MMU_NOTIFIER
Date: Sun,  5 Nov 2023 17:30:10 +0100
Message-ID: <20231105163040.14904-8-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-1-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, Vlastimil Babka <vbabka@suse.cz>, =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve 
 <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Sean Christopherson <seanjc@google.com>

Convert KVM_ARCH_WANT_MMU_NOTIFIER into a Kconfig and select it where
appropriate to effectively maintain existing behavior.  Using a proper
Kconfig will simplify building more functionality on top of KVM's
mmu_notifier infrastructure.

Add a forward declaration of kvm_gfn_range to kvm_types.h so that
including arch/powerpc/include/asm/kvm_ppc.h's with CONFIG_KVM=n doesn't
generate warnings due to kvm_gfn_range being undeclared.  PPC defines
hooks for PR vs. HV without guarding them via #ifdeffery, e.g.

  bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
  bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
  bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
  bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);

Alternatively, PPC could forward declare kvm_gfn_range, but there's no
good reason not to define it in common KVM.

Acked-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Message-Id: <20231027182217.3615211-8-seanjc@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h     |  2 --
 arch/arm64/kvm/Kconfig                |  2 +-
 arch/loongarch/include/asm/kvm_host.h |  1 -
 arch/loongarch/kvm/Kconfig            |  2 +-
 arch/mips/include/asm/kvm_host.h      |  2 --
 arch/mips/kvm/Kconfig                 |  2 +-
 arch/powerpc/include/asm/kvm_host.h   |  2 --
 arch/powerpc/kvm/Kconfig              |  8 ++++----
 arch/powerpc/kvm/powerpc.c            |  4 +---
 arch/riscv/include/asm/kvm_host.h     |  2 --
 arch/riscv/kvm/Kconfig                |  2 +-
 arch/x86/include/asm/kvm_host.h       |  2 --
 arch/x86/kvm/Kconfig                  |  2 +-
 include/linux/kvm_host.h              |  6 +++---
 include/linux/kvm_types.h             |  1 +
 virt/kvm/Kconfig                      |  4 ++++
 virt/kvm/kvm_main.c                   | 10 +++++-----
 17 files changed, 23 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 5653d3553e3e..9029fe09f3f6 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -954,8 +954,6 @@ int __kvm_arm_vcpu_get_events(struct kvm_vcpu *vcpu,
 int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 			      struct kvm_vcpu_events *events);
 
-#define KVM_ARCH_WANT_MMU_NOTIFIER
-
 void kvm_arm_halt_guest(struct kvm *kvm);
 void kvm_arm_resume_guest(struct kvm *kvm);
 
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 83c1e09be42e..1a777715199f 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -22,7 +22,7 @@ menuconfig KVM
 	bool "Kernel-based Virtual Machine (KVM) support"
 	depends on HAVE_KVM
 	select KVM_GENERIC_HARDWARE_ENABLING
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
 	select KVM_MMIO
diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
index 11328700d4fa..b108301c2e5a 100644
--- a/arch/loongarch/include/asm/kvm_host.h
+++ b/arch/loongarch/include/asm/kvm_host.h
@@ -183,7 +183,6 @@ void kvm_flush_tlb_all(void);
 void kvm_flush_tlb_gpa(struct kvm_vcpu *vcpu, unsigned long gpa);
 int kvm_handle_mm_fault(struct kvm_vcpu *vcpu, unsigned long badv, bool write);
 
-#define KVM_ARCH_WANT_MMU_NOTIFIER
 void kvm_set_spte_hva(struct kvm *kvm, unsigned long hva, pte_t pte);
 int kvm_unmap_hva_range(struct kvm *kvm, unsigned long start, unsigned long end, bool blockable);
 int kvm_age_hva(struct kvm *kvm, unsigned long start, unsigned long end);
diff --git a/arch/loongarch/kvm/Kconfig b/arch/loongarch/kvm/Kconfig
index fda425babfb2..f22bae89b07d 100644
--- a/arch/loongarch/kvm/Kconfig
+++ b/arch/loongarch/kvm/Kconfig
@@ -26,9 +26,9 @@ config KVM
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
+	select KVM_GENERIC_MMU_NOTIFIER
 	select KVM_MMIO
 	select KVM_XFER_TO_GUEST_WORK
-	select MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
 	help
 	  Support hosting virtualized guest machines using
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 54a85f1d4f2c..179f320cc231 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -810,8 +810,6 @@ int kvm_mips_mkclean_gpa_pt(struct kvm *kvm, gfn_t start_gfn, gfn_t end_gfn);
 pgd_t *kvm_pgd_alloc(void);
 void kvm_mmu_free_memory_caches(struct kvm_vcpu *vcpu);
 
-#define KVM_ARCH_WANT_MMU_NOTIFIER
-
 /* Emulation */
 enum emulation_result update_pc(struct kvm_vcpu *vcpu, u32 cause);
 int kvm_get_badinstr(u32 *opc, struct kvm_vcpu *vcpu, u32 *out);
diff --git a/arch/mips/kvm/Kconfig b/arch/mips/kvm/Kconfig
index a8cdba75f98d..c04987d2ed2e 100644
--- a/arch/mips/kvm/Kconfig
+++ b/arch/mips/kvm/Kconfig
@@ -25,7 +25,7 @@ config KVM
 	select HAVE_KVM_EVENTFD
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
 	select KVM_MMIO
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 	select INTERVAL_TREE
 	select KVM_GENERIC_HARDWARE_ENABLING
 	help
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 14ee0dece853..4b5c3f2acf78 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -62,8 +62,6 @@
 
 #include <linux/mmu_notifier.h>
 
-#define KVM_ARCH_WANT_MMU_NOTIFIER
-
 #define HPTEG_CACHE_NUM			(1 << 15)
 #define HPTEG_HASH_BITS_PTE		13
 #define HPTEG_HASH_BITS_PTE_LONG	12
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index 902611954200..b33358ee6424 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -42,7 +42,7 @@ config KVM_BOOK3S_64_HANDLER
 config KVM_BOOK3S_PR_POSSIBLE
 	bool
 	select KVM_MMIO
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 
 config KVM_BOOK3S_HV_POSSIBLE
 	bool
@@ -85,7 +85,7 @@ config KVM_BOOK3S_64_HV
 	tristate "KVM for POWER7 and later using hypervisor mode in host"
 	depends on KVM_BOOK3S_64 && PPC_POWERNV
 	select KVM_BOOK3S_HV_POSSIBLE
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 	select CMA
 	help
 	  Support running unmodified book3s_64 guest kernels in
@@ -194,7 +194,7 @@ config KVM_E500V2
 	depends on !CONTEXT_TRACKING_USER
 	select KVM
 	select KVM_MMIO
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 	help
 	  Support running unmodified E500 guest kernels in virtual machines on
 	  E500v2 host processors.
@@ -211,7 +211,7 @@ config KVM_E500MC
 	select KVM
 	select KVM_MMIO
 	select KVM_BOOKE_HV
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 	help
 	  Support running unmodified E500MC/E5500/E6500 guest kernels in
 	  virtual machines on E500MC/E5500/E6500 host processors.
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 8d3ec483bc2b..aac75c98a956 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -632,9 +632,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		break;
 #endif
 	case KVM_CAP_SYNC_MMU:
-#if !defined(CONFIG_MMU_NOTIFIER) || !defined(KVM_ARCH_WANT_MMU_NOTIFIER)
-		BUILD_BUG();
-#endif
+		BUILD_BUG_ON(!IS_ENABLED(CONFIG_KVM_GENERIC_MMU_NOTIFIER));
 		r = 1;
 		break;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 0eefd9c991ae..6964dd235e97 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -267,8 +267,6 @@ struct kvm_vcpu_arch {
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 
-#define KVM_ARCH_WANT_MMU_NOTIFIER
-
 #define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
 
 void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index dfc237d7875b..ae2e05f050ec 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -30,7 +30,7 @@ config KVM
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_MMIO
 	select KVM_XFER_TO_GUEST_WORK
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
 	help
 	  Support hosting virtualized guest machines.
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index d7036982332e..6f559fb75e6d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2141,8 +2141,6 @@ enum {
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
 #endif
 
-#define KVM_ARCH_WANT_MMU_NOTIFIER
-
 int kvm_cpu_has_injectable_intr(struct kvm_vcpu *v);
 int kvm_cpu_has_interrupt(struct kvm_vcpu *vcpu);
 int kvm_cpu_has_extint(struct kvm_vcpu *v);
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 950c12868d30..e61383674c75 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -24,7 +24,7 @@ config KVM
 	depends on HIGH_RES_TIMERS
 	depends on X86_LOCAL_APIC
 	select PREEMPT_NOTIFIERS
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 	select HAVE_KVM_IRQCHIP
 	select HAVE_KVM_PFNCACHE
 	select HAVE_KVM_IRQFD
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 11d091688346..5faba69403ac 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -253,7 +253,7 @@ bool kvm_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #endif
 
-#ifdef KVM_ARCH_WANT_MMU_NOTIFIER
+#ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
 union kvm_mmu_notifier_arg {
 	pte_t pte;
 };
@@ -783,7 +783,7 @@ struct kvm {
 	struct hlist_head irq_ack_notifier_list;
 #endif
 
-#if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
+#ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
 	struct mmu_notifier mmu_notifier;
 	unsigned long mmu_invalidate_seq;
 	long mmu_invalidate_in_progress;
@@ -1946,7 +1946,7 @@ extern const struct _kvm_stats_desc kvm_vm_stats_desc[];
 extern const struct kvm_stats_header kvm_vcpu_stats_header;
 extern const struct _kvm_stats_desc kvm_vcpu_stats_desc[];
 
-#if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
+#ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
 static inline int mmu_invalidate_retry(struct kvm *kvm, unsigned long mmu_seq)
 {
 	if (unlikely(kvm->mmu_invalidate_in_progress))
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index 6f4737d5046a..9d1f7835d8c1 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -6,6 +6,7 @@
 struct kvm;
 struct kvm_async_pf;
 struct kvm_device_ops;
+struct kvm_gfn_range;
 struct kvm_interrupt;
 struct kvm_irq_routing_table;
 struct kvm_memory_slot;
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 484d0873061c..ecae2914c97e 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -92,3 +92,7 @@ config HAVE_KVM_PM_NOTIFIER
 
 config KVM_GENERIC_HARDWARE_ENABLING
        bool
+
+config KVM_GENERIC_MMU_NOTIFIER
+       select MMU_NOTIFIER
+       bool
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 5422ce20dcba..dc81279ea385 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -535,7 +535,7 @@ void kvm_destroy_vcpus(struct kvm *kvm)
 }
 EXPORT_SYMBOL_GPL(kvm_destroy_vcpus);
 
-#if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
+#ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
 static inline struct kvm *mmu_notifier_to_kvm(struct mmu_notifier *mn)
 {
 	return container_of(mn, struct kvm, mmu_notifier);
@@ -962,14 +962,14 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
 	return mmu_notifier_register(&kvm->mmu_notifier, current->mm);
 }
 
-#else  /* !(CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER) */
+#else  /* !CONFIG_KVM_GENERIC_MMU_NOTIFIER */
 
 static int kvm_init_mmu_notifier(struct kvm *kvm)
 {
 	return 0;
 }
 
-#endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
+#endif /* CONFIG_KVM_GENERIC_MMU_NOTIFIER */
 
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
 static int kvm_pm_notifier_call(struct notifier_block *bl,
@@ -1289,7 +1289,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 out_err_no_debugfs:
 	kvm_coalesced_mmio_free(kvm);
 out_no_coalesced_mmio:
-#if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
+#ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
 	if (kvm->mmu_notifier.ops)
 		mmu_notifier_unregister(&kvm->mmu_notifier, current->mm);
 #endif
@@ -1349,7 +1349,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
 		kvm->buses[i] = NULL;
 	}
 	kvm_coalesced_mmio_free(kvm);
-#if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
+#ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
 	mmu_notifier_unregister(&kvm->mmu_notifier, kvm->mm);
 	/*
 	 * At this point, pending calls to invalidate_range_start()
-- 
2.39.1


