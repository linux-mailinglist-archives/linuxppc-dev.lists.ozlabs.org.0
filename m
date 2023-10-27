Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F36CB7DA0AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 20:40:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1BRv14Ac;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SHBL95jQmz3w3M
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Oct 2023 05:40:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1BRv14Ac;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3cqa8zqykdcoykgtpimuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SH9yM4JSvz3cWh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Oct 2023 05:23:07 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d86dac81f8fso2118351276.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 11:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430985; x=1699035785; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Xj30xbFl07atOtCQSMtQg8dB6rp8Wt3n2Y10jzFlxa0=;
        b=1BRv14Acgzih1jK4zgY6vBjOyo0Z96Rbeh1n6kFAMNuaCU3UGBERELZnwPJ8I0PMsR
         s6EN4Y3bM6kz1UObXXKAKAnV0sbhRUu+AA1X1o/++A/gOVCy/WmzCGo6ucaWBs3SPOFh
         Ucx4sZvSTisH+82L8DAMIMxOPJzNimFNoM8Bbpf4sTGs+G20+WtrVSpVVJ4oFz1rGqn0
         B8JUs2o2W4iKPH2d3pFUIwSAnBgDHE5oSIjNuA6iUM60tYclLKc7dfqcqKksLk0YcRai
         XAY7DBF/E4DsM9/LHCb1ifvBFtl4IF7swi5d5HDGKzXS6jwbWKOFd3HlgPrhuFxIP4Xn
         Ru5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430985; x=1699035785;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xj30xbFl07atOtCQSMtQg8dB6rp8Wt3n2Y10jzFlxa0=;
        b=OIYOMlHWmmdrYqNFGAcQcG7CCTP+MyTYZDhC+jnDLdYICFUbjs7ph6rF9adldX1Iql
         B0P9MGBpQ45BO5aiEO+WU+1YAklwEa3Uqe6lwjC0l9xiBobY5M5ivEu6i8suluDnrqS9
         Cy/B4fQ/wzkmDLnmRQRe+BbIi8bPUuXpyj8Nptckx6O0GEXuRf2kXvX5gDPt70DP6KkX
         pNWYxSMia8LG8EfftRR8A6JH+hSGiCBO7KR+AAPXIQ7X1eepgwJVijyeDRlso7yPimwA
         NQ4jlzRnQnGvSAf6V3VMQvZcL5B3wFs+/TULS9Ky2mUAAGb7N6v8mMCziGkzxfrdUcr6
         iFfw==
X-Gm-Message-State: AOJu0YxE7A7Y4Myav5/1PFSsNl71v5Q34P6m+tkxDDesHkhgu1MFGI8p
	5qZ/ldVkk31tqtyp77n5giaeWiGraXI=
X-Google-Smtp-Source: AGHT+IHJyYgXOSmXHw6Q/ZGgKMIZrlqldOTH4kOV2g/1tUJbmTSTwCBf3zyHkDcXb7wW1+WsIfgoTREwpdY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:5f4c:0:b0:da0:3e20:658d with SMTP id
 h12-20020a255f4c000000b00da03e20658dmr63345ybm.10.1698430985424; Fri, 27 Oct
 2023 11:23:05 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:22:02 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-21-seanjc@google.com>
Subject: [PATCH v13 20/35] KVM: x86/mmu: Handle page fault for private memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, Vlastimil Babka <vbabka@suse.cz>, =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve
  <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Chao Peng <chao.p.peng@linux.intel.com>

Add support for resolving page faults on guest private memory for VMs
that differentiate between "shared" and "private" memory.  For such VMs,
KVM_MEM_PRIVATE memslots can include both fd-based private memory and
hva-based shared memory, and KVM needs to map in the "correct" variant,
i.e. KVM needs to map the gfn shared/private as appropriate based on the
current state of the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE flag.

For AMD's SEV-SNP and Intel's TDX, the guest effectively gets to request
shared vs. private via a bit in the guest page tables, i.e. what the guest
wants may conflict with the current memory attributes.  To support such
"implicit" conversion requests, exit to user with KVM_EXIT_MEMORY_FAULT
to forward the request to userspace.  Add a new flag for memory faults,
KVM_MEMORY_EXIT_FLAG_PRIVATE, to communicate whether the guest wants to
map memory as shared vs. private.

Like KVM_MEMORY_ATTRIBUTE_PRIVATE, use bit 3 for flagging private memory
so that KVM can use bits 0-2 for capturing RWX behavior if/when userspace
needs such information, e.g. a likely user of KVM_EXIT_MEMORY_FAULT is to
exit on missing mappings when handling guest page fault VM-Exits.  In
that case, userspace will want to know RWX information in order to
correctly/precisely resolve the fault.

Note, private memory *must* be backed by guest_memfd, i.e. shared mappings
always come from the host userspace page tables, and private mappings
always come from a guest_memfd instance.

Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst  |   8 ++-
 arch/x86/kvm/mmu/mmu.c          | 101 ++++++++++++++++++++++++++++++--
 arch/x86/kvm/mmu/mmu_internal.h |   1 +
 include/linux/kvm_host.h        |   8 ++-
 include/uapi/linux/kvm.h        |   1 +
 5 files changed, 110 insertions(+), 9 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 7f00c310c24a..38dc1fda4f45 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6837,6 +6837,7 @@ spec refer, https://github.com/riscv/riscv-sbi-doc.
 
 		/* KVM_EXIT_MEMORY_FAULT */
 		struct {
+  #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
 			__u64 flags;
 			__u64 gpa;
 			__u64 size;
@@ -6845,8 +6846,11 @@ spec refer, https://github.com/riscv/riscv-sbi-doc.
 KVM_EXIT_MEMORY_FAULT indicates the vCPU has encountered a memory fault that
 could not be resolved by KVM.  The 'gpa' and 'size' (in bytes) describe the
 guest physical address range [gpa, gpa + size) of the fault.  The 'flags' field
-describes properties of the faulting access that are likely pertinent.
-Currently, no flags are defined.
+describes properties of the faulting access that are likely pertinent:
+
+ - KVM_MEMORY_EXIT_FLAG_PRIVATE - When set, indicates the memory fault occurred
+   on a private memory access.  When clear, indicates the fault occurred on a
+   shared access.
 
 Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that it
 accompanies a return code of '-1', not '0'!  errno will always be set to EFAULT
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 4167d557c577..c4e758f0aebb 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3147,9 +3147,9 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
 	return level;
 }
 
-int kvm_mmu_max_mapping_level(struct kvm *kvm,
-			      const struct kvm_memory_slot *slot, gfn_t gfn,
-			      int max_level)
+static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
+				       const struct kvm_memory_slot *slot,
+				       gfn_t gfn, int max_level, bool is_private)
 {
 	struct kvm_lpage_info *linfo;
 	int host_level;
@@ -3161,6 +3161,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
 			break;
 	}
 
+	if (is_private)
+		return max_level;
+
 	if (max_level == PG_LEVEL_4K)
 		return PG_LEVEL_4K;
 
@@ -3168,6 +3171,16 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
 	return min(host_level, max_level);
 }
 
+int kvm_mmu_max_mapping_level(struct kvm *kvm,
+			      const struct kvm_memory_slot *slot, gfn_t gfn,
+			      int max_level)
+{
+	bool is_private = kvm_slot_can_be_private(slot) &&
+			  kvm_mem_is_private(kvm, gfn);
+
+	return __kvm_mmu_max_mapping_level(kvm, slot, gfn, max_level, is_private);
+}
+
 void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
 	struct kvm_memory_slot *slot = fault->slot;
@@ -3188,8 +3201,9 @@ void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	 * Enforce the iTLB multihit workaround after capturing the requested
 	 * level, which will be used to do precise, accurate accounting.
 	 */
-	fault->req_level = kvm_mmu_max_mapping_level(vcpu->kvm, slot,
-						     fault->gfn, fault->max_level);
+	fault->req_level = __kvm_mmu_max_mapping_level(vcpu->kvm, slot,
+						       fault->gfn, fault->max_level,
+						       fault->is_private);
 	if (fault->req_level == PG_LEVEL_4K || fault->huge_page_disallowed)
 		return;
 
@@ -4261,6 +4275,55 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
 	kvm_mmu_do_page_fault(vcpu, work->cr2_or_gpa, 0, true, NULL);
 }
 
+static inline u8 kvm_max_level_for_order(int order)
+{
+	BUILD_BUG_ON(KVM_MAX_HUGEPAGE_LEVEL > PG_LEVEL_1G);
+
+	KVM_MMU_WARN_ON(order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G) &&
+			order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M) &&
+			order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_4K));
+
+	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G))
+		return PG_LEVEL_1G;
+
+	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M))
+		return PG_LEVEL_2M;
+
+	return PG_LEVEL_4K;
+}
+
+static void kvm_mmu_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
+					      struct kvm_page_fault *fault)
+{
+	kvm_prepare_memory_fault_exit(vcpu, fault->gfn << PAGE_SHIFT,
+				      PAGE_SIZE, fault->write, fault->exec,
+				      fault->is_private);
+}
+
+static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
+				   struct kvm_page_fault *fault)
+{
+	int max_order, r;
+
+	if (!kvm_slot_can_be_private(fault->slot)) {
+		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
+		return -EFAULT;
+	}
+
+	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
+			     &max_order);
+	if (r) {
+		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
+		return r;
+	}
+
+	fault->max_level = min(kvm_max_level_for_order(max_order),
+			       fault->max_level);
+	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
+
+	return RET_PF_CONTINUE;
+}
+
 static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
 	struct kvm_memory_slot *slot = fault->slot;
@@ -4293,6 +4356,14 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 			return RET_PF_EMULATE;
 	}
 
+	if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
+		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
+		return -EFAULT;
+	}
+
+	if (fault->is_private)
+		return kvm_faultin_pfn_private(vcpu, fault);
+
 	async = false;
 	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, false, &async,
 					  fault->write, &fault->map_writable,
@@ -7173,6 +7244,26 @@ void kvm_mmu_pre_destroy_vm(struct kvm *kvm)
 }
 
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
+bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
+					struct kvm_gfn_range *range)
+{
+	/*
+	 * Zap SPTEs even if the slot can't be mapped PRIVATE.  KVM x86 only
+	 * supports KVM_MEMORY_ATTRIBUTE_PRIVATE, and so it *seems* like KVM
+	 * can simply ignore such slots.  But if userspace is making memory
+	 * PRIVATE, then KVM must prevent the guest from accessing the memory
+	 * as shared.  And if userspace is making memory SHARED and this point
+	 * is reached, then at least one page within the range was previously
+	 * PRIVATE, i.e. the slot's possible hugepage ranges are changing.
+	 * Zapping SPTEs in this case ensures KVM will reassess whether or not
+	 * a hugepage can be used for affected ranges.
+	 */
+	if (WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm)))
+		return false;
+
+	return kvm_unmap_gfn_range(kvm, range);
+}
+
 static bool hugepage_test_mixed(struct kvm_memory_slot *slot, gfn_t gfn,
 				int level)
 {
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index decc1f153669..86c7cb692786 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -201,6 +201,7 @@ struct kvm_page_fault {
 
 	/* Derived from mmu and global state.  */
 	const bool is_tdp;
+	const bool is_private;
 	const bool nx_huge_page_workaround_enabled;
 
 	/*
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7de93858054d..e3223cafd7db 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2358,14 +2358,18 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
 
 static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
-						 gpa_t gpa, gpa_t size)
+						 gpa_t gpa, gpa_t size,
+						 bool is_write, bool is_exec,
+						 bool is_private)
 {
 	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
 	vcpu->run->memory_fault.gpa = gpa;
 	vcpu->run->memory_fault.size = size;
 
-	/* Flags are not (yet) defined or communicated to userspace. */
+	/* RWX flags are not (yet) defined or communicated to userspace. */
 	vcpu->run->memory_fault.flags = 0;
+	if (is_private)
+		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
 }
 
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 33d542de0a61..29e9eb51dec9 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -527,6 +527,7 @@ struct kvm_run {
 		} notify;
 		/* KVM_EXIT_MEMORY_FAULT */
 		struct {
+#define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
 			__u64 flags;
 			__u64 gpa;
 			__u64 size;
-- 
2.42.0.820.g83a721a137-goog

