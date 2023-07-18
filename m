Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C0D7589E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 02:04:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=u+28Wdze;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5GK55wlqz3cnx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 10:04:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=u+28Wdze;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=38cs3zaykdemxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Fz62hz7z3bcP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 09:49:06 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-56fffdea2d0so42427987b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 16:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724144; x=1692316144;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8TdJ1H9vY0vZ6d4Ib+S5mGLNRUVvHsylOvOW0QhRfnk=;
        b=u+28WdzeWc40Gm+Je1x1UFfDLSLxds49kd/6cqkzLMXf4jy+V6QtZTuGEoBKa71Rcu
         xg+sLXnFWp3IWF94fBSqPSjOmJbnWdsevA1ZXgY7o9A/h+kuNZYLpmc2HukjMPatPza4
         bxbe/VVib5gL1I9HqShDRV4bFhCvQBMgcqIy1VFhBxpcya3h6Q52dV75EjdhVIAPxjjN
         wxT87kXK0wL48yMvGVPc/XWafV0cS0EPf90K+wFMc3WuKEWI3FatqxiQl8K69yyJ40KH
         xIklmB6W3R2L80L6WyYqIQwJ5fMxk7Q+kqHJKmDnyACB3D7Hucmc3LR/fm+aquGvOS2x
         x9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724144; x=1692316144;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TdJ1H9vY0vZ6d4Ib+S5mGLNRUVvHsylOvOW0QhRfnk=;
        b=GIJz0Ff1J2Yh+XRzuGUMaJWJbA3qnFGY1mpEDO9x39BkGfdv/PmIYmPU0LfMwrdT4y
         SL+AqgeUhzDrBYMABcReLwWtRVctVjztoGcrwDJPDF+D7GjwM6CP/S0oT4TbWw972bcr
         QplMAUsU9o9DJzdYp+g5dX86gooFG5PdNVI1JQmq9wjJjFVGsQ+M2XZJLT9FJUUT+7fK
         Pba6b6wj8bze2OL4K6mmI0GARq8OHQe6LKAFPQm/o6+814SPSj8EWh+69cJey0icE5sY
         9Y/0ews2ex40MRVHxHUXb1DqrCVqgSAXW79cEIOQn5wNEs+cW2OWj/mXZ8quXT5MxgaR
         qDMQ==
X-Gm-Message-State: ABy/qLaH1MxotXETM86LWl28KkA/NTeFSV5ZDE94ZMQM4vJ1uvuETiLR
	wi14YIx/xp1JHIOV/Yat049YqexRIsY=
X-Google-Smtp-Source: APBJJlG8VHtP5R3fLmhww44xOijLMkdC3Pr9yKhyucdlmfeXwSJcZ8t7uie3AFyIq7NSw15x1EhqscyHcLI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d78b:0:b0:c4c:b107:65f9 with SMTP id
 o133-20020a25d78b000000b00c4cb10765f9mr12571ybg.10.1689724144344; Tue, 18 Jul
 2023 16:49:04 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:45:00 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-18-seanjc@google.com>
Subject: [RFC PATCH v11 17/29] KVM: x86: Add support for "protected VMs" that
 can utilize private memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst  | 32 ++++++++++++++++++++++++++++++++
 arch/x86/include/asm/kvm_host.h | 15 +++++++++------
 arch/x86/include/uapi/asm/kvm.h |  3 +++
 arch/x86/kvm/Kconfig            | 12 ++++++++++++
 arch/x86/kvm/mmu/mmu_internal.h |  1 +
 arch/x86/kvm/x86.c              | 16 +++++++++++++++-
 include/uapi/linux/kvm.h        |  1 +
 virt/kvm/Kconfig                |  5 +++++
 8 files changed, 78 insertions(+), 7 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 0ca8561775ac..9f7b95327c2a 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -147,10 +147,29 @@ described as 'basic' will be available.
 The new VM has no virtual cpus and no memory.
 You probably want to use 0 as machine type.
 
+X86:
+^^^^
+
+Supported X86 VM types can be queried via KVM_CAP_VM_TYPES.
+
+S390:
+^^^^^
+
 In order to create user controlled virtual machines on S390, check
 KVM_CAP_S390_UCONTROL and use the flag KVM_VM_S390_UCONTROL as
 privileged user (CAP_SYS_ADMIN).
 
+MIPS:
+^^^^^
+
+To use hardware assisted virtualization on MIPS (VZ ASE) rather than
+the default trap & emulate implementation (which changes the virtual
+memory layout to fit in user mode), check KVM_CAP_MIPS_VZ and use the
+flag KVM_VM_MIPS_VZ.
+
+ARM64:
+^^^^^^
+
 On arm64, the physical address size for a VM (IPA Size limit) is limited
 to 40bits by default. The limit can be configured if the host supports the
 extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
@@ -8554,6 +8573,19 @@ block sizes is exposed in KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES as a
 This capability indicates KVM supports per-page memory attributes and ioctls
 KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES/KVM_SET_MEMORY_ATTRIBUTES are available.
 
+8.41 KVM_CAP_VM_TYPES
+---------------------
+
+:Capability: KVM_CAP_MEMORY_ATTRIBUTES
+:Architectures: x86
+:Type: system ioctl
+
+This capability returns a bitmap of support VM types.  The 1-setting of bit @n
+means the VM type with value @n is supported.  Possible values of @n are::
+
+  #define KVM_X86_DEFAULT_VM	0
+  #define KVM_X86_SW_PROTECTED_VM	1
+
 9. Known KVM API problems
 =========================
 
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 08b44544a330..bbefd79b7950 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1227,6 +1227,7 @@ enum kvm_apicv_inhibit {
 };
 
 struct kvm_arch {
+	unsigned long vm_type;
 	unsigned long n_used_mmu_pages;
 	unsigned long n_requested_mmu_pages;
 	unsigned long n_max_mmu_pages;
@@ -2058,6 +2059,12 @@ void kvm_mmu_new_pgd(struct kvm_vcpu *vcpu, gpa_t new_pgd);
 void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 		       int tdp_max_root_level, int tdp_huge_page_level);
 
+#ifdef CONFIG_KVM_PRIVATE_MEM
+#define kvm_arch_has_private_mem(kvm) ((kvm)->arch.vm_type != KVM_X86_DEFAULT_VM)
+#else
+#define kvm_arch_has_private_mem(kvm) false
+#endif
+
 static inline u16 kvm_read_ldt(void)
 {
 	u16 ldt;
@@ -2106,14 +2113,10 @@ enum {
 #define HF_SMM_INSIDE_NMI_MASK	(1 << 2)
 
 # define KVM_MAX_NR_ADDRESS_SPACES	2
+/* SMM is currently unsupported for guests with private memory. */
+# define kvm_arch_nr_memslot_as_ids(kvm) (kvm_arch_has_private_mem(kvm) ? 1 : 2)
 # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
-
-static inline int kvm_arch_nr_memslot_as_ids(struct kvm *kvm)
-{
-	return KVM_MAX_NR_ADDRESS_SPACES;
-}
-
 #else
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
 #endif
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 1a6a1f987949..a448d0964fc0 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -562,4 +562,7 @@ struct kvm_pmu_event_filter {
 /* x86-specific KVM_EXIT_HYPERCALL flags. */
 #define KVM_EXIT_HYPERCALL_LONG_MODE	BIT(0)
 
+#define KVM_X86_DEFAULT_VM	0
+#define KVM_X86_SW_PROTECTED_VM	1
+
 #endif /* _ASM_X86_KVM_H */
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index a7eb2bdbfb18..029c76bcd1a5 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -77,6 +77,18 @@ config KVM_WERROR
 
 	  If in doubt, say "N".
 
+config KVM_SW_PROTECTED_VM
+	bool "Enable support for KVM software-protected VMs"
+	depends on EXPERT
+	depends on X86_64
+	select KVM_GENERIC_PRIVATE_MEM
+	help
+	  Enable support for KVM software-protected VMs.  Currently "protected"
+	  means the VM can be backed with memory provided by
+	  KVM_CREATE_GUEST_MEMFD.
+
+	  If unsure, say "N".
+
 config KVM_INTEL
 	tristate "KVM for Intel (and compatible) processors support"
 	depends on KVM && IA32_FEAT_CTL
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 268b517e88cb..f1786698ae00 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -301,6 +301,7 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 		.max_level = KVM_MAX_HUGEPAGE_LEVEL,
 		.req_level = PG_LEVEL_4K,
 		.goal_level = PG_LEVEL_4K,
+		.is_private = kvm_mem_is_private(vcpu->kvm, cr2_or_gpa >> PAGE_SHIFT),
 	};
 	int r;
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 463ecf70cec0..de195ad83ec0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4427,6 +4427,13 @@ static int kvm_ioctl_get_supported_hv_cpuid(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static bool kvm_is_vm_type_supported(unsigned long type)
+{
+	return type == KVM_X86_DEFAULT_VM ||
+	       (type == KVM_X86_SW_PROTECTED_VM &&
+		IS_ENABLED(CONFIG_KVM_SW_PROTECTED_VM) && tdp_enabled);
+}
+
 int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 {
 	int r = 0;
@@ -4617,6 +4624,11 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_X86_NOTIFY_VMEXIT:
 		r = kvm_caps.has_notify_vmexit;
 		break;
+	case KVM_CAP_VM_TYPES:
+		r = BIT(KVM_X86_DEFAULT_VM);
+		if (kvm_is_vm_type_supported(KVM_X86_SW_PROTECTED_VM))
+			r |= BIT(KVM_X86_SW_PROTECTED_VM);
+		break;
 	default:
 		break;
 	}
@@ -12274,9 +12286,11 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	int ret;
 	unsigned long flags;
 
-	if (type)
+	if (!kvm_is_vm_type_supported(type))
 		return -EINVAL;
 
+	kvm->arch.vm_type = type;
+
 	ret = kvm_page_track_init(kvm);
 	if (ret)
 		goto out;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 17b12ee8b70e..eb900344a054 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1216,6 +1216,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
 #define KVM_CAP_USER_MEMORY2 230
 #define KVM_CAP_MEMORY_ATTRIBUTES 231
+#define KVM_CAP_VM_TYPES 232
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 3ee3205e0b39..1a48cb530092 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -107,3 +107,8 @@ config KVM_GENERIC_MEMORY_ATTRIBUTES
 config KVM_PRIVATE_MEM
        select XARRAY_MULTI
        bool
+
+config KVM_GENERIC_PRIVATE_MEM
+       select KVM_GENERIC_MEMORY_ATTRIBUTES
+       select KVM_PRIVATE_MEM
+       bool
-- 
2.41.0.255.g8b1d071c50-goog

