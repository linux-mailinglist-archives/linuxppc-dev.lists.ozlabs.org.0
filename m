Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 562BD454C62
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 18:45:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvVhW18Skz3cWq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 04:45:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NUbNDIUD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+95c1bf6b21ef0929fb55+6660+infradead.org+dwmw2@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=NUbNDIUD; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvVb45bf9z2yYx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 04:41:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=00uj7azErnor1qubs68H6tTRgQ0L8uWsIp7jwinBNoE=; b=NUbNDIUDUnO/92rMVvxN1l6Cqz
 hNsjlO3uCmjZHq0pa48C4zRWMmtSZSxksWL0ABrlmNmfshTKxcpN6B8hN5rmJIq78PHKpE4efWTzl
 Jfdm+HOHkeDOq5tnTsQpZSZpFzyFiHnnbACQRM0rSwgSvkO/Bn+F2IvtaghfWz+06xexxfQQENwfY
 6JKnJJCjms7NGAOt4rYsAewxog8gbCttlEaDcGVAizOlS9gwfUaG9mpSgLsq7emcVyIvtzFCgrxDQ
 C28AeWFlZ0nV1J2ovou26uuEKLLIKUwCCktoCfDOqR7GYilyyfuM3mxcwQMpx9jFU0hYReVLhjUxo
 Fw4OR5hA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnOum-007nn3-5Z; Wed, 17 Nov 2021 17:40:08 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mnOum-001Gxg-DT; Wed, 17 Nov 2021 17:40:08 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	kvm <kvm@vger.kernel.org>
Subject: [PATCH v3 08/12] KVM: Propagate vcpu explicitly to
 mark_page_dirty_in_slot()
Date: Wed, 17 Nov 2021 17:39:59 +0000
Message-Id: <20211117174003.297096-9-dwmw2@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211117174003.297096-1-dwmw2@infradead.org>
References: <20211117174003.297096-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "seanjc @ google . com" <seanjc@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, "vkuznets @ redhat . com" <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Woodhouse <dwmw@amazon.co.uk>

The kvm_dirty_ring_get() function uses kvm_get_running_vcpu() to work out
which dirty ring to use, but there are some use cases where that doesn't
work.

There's one in setting the Xen shared info page, introduced in commit
629b5348841a ("KVM: x86/xen: update wallclock region") and reported by
"butt3rflyh4ck" <butterflyhuangxx@gmail.com> in
https://lore.kernel.org/kvm/CAFcO6XOmoS7EacN_n6v4Txk7xL7iqRa2gABg3F7E3Naf5uG94g@mail.gmail.com/

There's also about to be another one when the newly-reintroduced
gfn_to_pfn_cache needs to mark a page as dirty from the MMU notifier
which invalidates the mapping. In that case, we will *know* the vcpu
that can be 'blamed' for dirtying the page, and we just need to be
able to pass it in as an explicit argument when doing so.

This patch preemptively resolves the second issue, and paves the way
for resolving the first. A complete fix for the first issue will need
us to switch the Xen shinfo to be owned by a particular vCPU, which
will happen in a separate patch.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/arm64/kvm/mmu.c           |  2 +-
 arch/x86/kvm/mmu/mmu.c         |  2 +-
 arch/x86/kvm/mmu/spte.c        |  2 +-
 arch/x86/kvm/mmu/tdp_mmu.c     |  2 +-
 arch/x86/kvm/x86.c             |  4 ++--
 include/linux/kvm_dirty_ring.h |  6 ++++--
 include/linux/kvm_host.h       |  3 ++-
 virt/kvm/dirty_ring.c          |  8 ++++++--
 virt/kvm/kvm_main.c            | 18 +++++++++---------
 9 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 326cdfec74a1..d8411ce4db4b 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1143,7 +1143,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	/* Mark the page dirty only if the fault is handled successfully */
 	if (writable && !ret) {
 		kvm_set_pfn_dirty(pfn);
-		mark_page_dirty_in_slot(kvm, memslot, gfn);
+		mark_page_dirty_in_slot(kvm, vcpu, memslot, gfn);
 	}
 
 out_unlock:
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3be9beea838d..cedeab55b0d8 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3090,7 +3090,7 @@ fast_pf_fix_direct_spte(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
 		return false;
 
 	if (is_writable_pte(new_spte) && !is_writable_pte(old_spte))
-		mark_page_dirty_in_slot(vcpu->kvm, fault->slot, fault->gfn);
+		mark_page_dirty_in_slot(vcpu->kvm, vcpu, fault->slot, fault->gfn);
 
 	return true;
 }
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 0c76c45fdb68..0598515f3ae2 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -184,7 +184,7 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 	if ((spte & PT_WRITABLE_MASK) && kvm_slot_dirty_track_enabled(slot)) {
 		/* Enforced by kvm_mmu_hugepage_adjust. */
 		WARN_ON(level > PG_LEVEL_4K);
-		mark_page_dirty_in_slot(vcpu->kvm, slot, gfn);
+		mark_page_dirty_in_slot(vcpu->kvm, vcpu, slot, gfn);
 	}
 
 	*new_spte = spte;
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index a54c3491af42..c5669c9918a4 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -247,7 +247,7 @@ static void handle_changed_spte_dirty_log(struct kvm *kvm, int as_id, gfn_t gfn,
 	if ((!is_writable_pte(old_spte) || pfn_changed) &&
 	    is_writable_pte(new_spte)) {
 		slot = __gfn_to_memslot(__kvm_memslots(kvm, as_id), gfn);
-		mark_page_dirty_in_slot(kvm, slot, gfn);
+		mark_page_dirty_in_slot(kvm, NULL, slot, gfn);
 	}
 }
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 5a403d92833f..5af88f9e7fd1 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3353,7 +3353,7 @@ static void record_steal_time(struct kvm_vcpu *vcpu)
  out:
 	user_access_end();
  dirty:
-	mark_page_dirty_in_slot(vcpu->kvm, ghc->memslot, gpa_to_gfn(ghc->gpa));
+	mark_page_dirty_in_slot(vcpu->kvm, vcpu, ghc->memslot, gpa_to_gfn(ghc->gpa));
 }
 
 int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
@@ -4420,7 +4420,7 @@ static void kvm_steal_time_set_preempted(struct kvm_vcpu *vcpu)
 	if (!copy_to_user_nofault(&st->preempted, &preempted, sizeof(preempted)))
 		vcpu->arch.st.preempted = KVM_VCPU_PREEMPTED;
 
-	mark_page_dirty_in_slot(vcpu->kvm, ghc->memslot, gpa_to_gfn(ghc->gpa));
+	mark_page_dirty_in_slot(vcpu->kvm, vcpu, ghc->memslot, gpa_to_gfn(ghc->gpa));
 }
 
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
diff --git a/include/linux/kvm_dirty_ring.h b/include/linux/kvm_dirty_ring.h
index 4da8d4a4140b..f3be974f9c5a 100644
--- a/include/linux/kvm_dirty_ring.h
+++ b/include/linux/kvm_dirty_ring.h
@@ -43,7 +43,8 @@ static inline int kvm_dirty_ring_alloc(struct kvm_dirty_ring *ring,
 	return 0;
 }
 
-static inline struct kvm_dirty_ring *kvm_dirty_ring_get(struct kvm *kvm)
+static inline struct kvm_dirty_ring *kvm_dirty_ring_get(struct kvm *kvm,
+							struct kvm_vcpu *vcpu)
 {
 	return NULL;
 }
@@ -78,7 +79,8 @@ static inline bool kvm_dirty_ring_soft_full(struct kvm_dirty_ring *ring)
 
 u32 kvm_dirty_ring_get_rsvd_entries(void);
 int kvm_dirty_ring_alloc(struct kvm_dirty_ring *ring, int index, u32 size);
-struct kvm_dirty_ring *kvm_dirty_ring_get(struct kvm *kvm);
+struct kvm_dirty_ring *kvm_dirty_ring_get(struct kvm *kvm,
+					  struct kvm_vcpu *vcpu);
 
 /*
  * called with kvm->slots_lock held, returns the number of
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c310648cc8f1..1628c32e4464 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -942,7 +942,8 @@ struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn);
 bool kvm_is_visible_gfn(struct kvm *kvm, gfn_t gfn);
 bool kvm_vcpu_is_visible_gfn(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_host_page_size(struct kvm_vcpu *vcpu, gfn_t gfn);
-void mark_page_dirty_in_slot(struct kvm *kvm, struct kvm_memory_slot *memslot, gfn_t gfn);
+void mark_page_dirty_in_slot(struct kvm *kvm, struct kvm_vcpu *vcpu,
+			     struct kvm_memory_slot *memslot, gfn_t gfn);
 void mark_page_dirty(struct kvm *kvm, gfn_t gfn);
 
 struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index 88f4683198ea..61c94fc4d7f0 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -36,12 +36,16 @@ static bool kvm_dirty_ring_full(struct kvm_dirty_ring *ring)
 	return kvm_dirty_ring_used(ring) >= ring->size;
 }
 
-struct kvm_dirty_ring *kvm_dirty_ring_get(struct kvm *kvm)
+struct kvm_dirty_ring *kvm_dirty_ring_get(struct kvm *kvm, struct kvm_vcpu *vcpu)
 {
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+	struct kvm_vcpu *running_vcpu = kvm_get_running_vcpu();
 
+	WARN_ON_ONCE(vcpu && vcpu != running_vcpu);
 	WARN_ON_ONCE(vcpu->kvm != kvm);
 
+	if (!vcpu)
+		vcpu = running_vcpu;
+
 	return &vcpu->dirty_ring;
 }
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 356d636e037d..7137995cab41 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2781,7 +2781,7 @@ int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa,
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_read_guest_atomic);
 
-static int __kvm_write_guest_page(struct kvm *kvm,
+static int __kvm_write_guest_page(struct kvm *kvm, struct kvm_vcpu *vcpu,
 				  struct kvm_memory_slot *memslot, gfn_t gfn,
 			          const void *data, int offset, int len)
 {
@@ -2794,7 +2794,7 @@ static int __kvm_write_guest_page(struct kvm *kvm,
 	r = __copy_to_user((void __user *)addr + offset, data, len);
 	if (r)
 		return -EFAULT;
-	mark_page_dirty_in_slot(kvm, memslot, gfn);
+	mark_page_dirty_in_slot(kvm, vcpu, memslot, gfn);
 	return 0;
 }
 
@@ -2803,7 +2803,7 @@ int kvm_write_guest_page(struct kvm *kvm, gfn_t gfn,
 {
 	struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
 
-	return __kvm_write_guest_page(kvm, slot, gfn, data, offset, len);
+	return __kvm_write_guest_page(kvm, NULL, slot, gfn, data, offset, len);
 }
 EXPORT_SYMBOL_GPL(kvm_write_guest_page);
 
@@ -2812,7 +2812,7 @@ int kvm_vcpu_write_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn,
 {
 	struct kvm_memory_slot *slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
 
-	return __kvm_write_guest_page(vcpu->kvm, slot, gfn, data, offset, len);
+	return __kvm_write_guest_page(vcpu->kvm, vcpu, slot, gfn, data, offset, len);
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_write_guest_page);
 
@@ -2931,7 +2931,7 @@ int kvm_write_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 	r = __copy_to_user((void __user *)ghc->hva + offset, data, len);
 	if (r)
 		return -EFAULT;
-	mark_page_dirty_in_slot(kvm, ghc->memslot, gpa >> PAGE_SHIFT);
+	mark_page_dirty_in_slot(kvm, NULL, ghc->memslot, gpa >> PAGE_SHIFT);
 
 	return 0;
 }
@@ -3000,7 +3000,7 @@ int kvm_clear_guest(struct kvm *kvm, gpa_t gpa, unsigned long len)
 }
 EXPORT_SYMBOL_GPL(kvm_clear_guest);
 
-void mark_page_dirty_in_slot(struct kvm *kvm,
+void mark_page_dirty_in_slot(struct kvm *kvm, struct kvm_vcpu *vcpu,
 			     struct kvm_memory_slot *memslot,
 		 	     gfn_t gfn)
 {
@@ -3009,7 +3009,7 @@ void mark_page_dirty_in_slot(struct kvm *kvm,
 		u32 slot = (memslot->as_id << 16) | memslot->id;
 
 		if (kvm->dirty_ring_size)
-			kvm_dirty_ring_push(kvm_dirty_ring_get(kvm),
+			kvm_dirty_ring_push(kvm_dirty_ring_get(kvm, vcpu),
 					    slot, rel_gfn);
 		else
 			set_bit_le(rel_gfn, memslot->dirty_bitmap);
@@ -3022,7 +3022,7 @@ void mark_page_dirty(struct kvm *kvm, gfn_t gfn)
 	struct kvm_memory_slot *memslot;
 
 	memslot = gfn_to_memslot(kvm, gfn);
-	mark_page_dirty_in_slot(kvm, memslot, gfn);
+	mark_page_dirty_in_slot(kvm, NULL, memslot, gfn);
 }
 EXPORT_SYMBOL_GPL(mark_page_dirty);
 
@@ -3031,7 +3031,7 @@ void kvm_vcpu_mark_page_dirty(struct kvm_vcpu *vcpu, gfn_t gfn)
 	struct kvm_memory_slot *memslot;
 
 	memslot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
-	mark_page_dirty_in_slot(vcpu->kvm, memslot, gfn);
+	mark_page_dirty_in_slot(vcpu->kvm, vcpu, memslot, gfn);
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_mark_page_dirty);
 
-- 
2.31.1

