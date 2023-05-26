Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD2C713099
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 01:46:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QShQj4CzHz3fFH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 09:46:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=hvb8rxkE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--yuzhao.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3aurxzaykdoaawbjcqiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--yuzhao.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=hvb8rxkE;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QShNd0R77z3c8r
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 09:44:47 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-bac6a453dd5so1730066276.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 16:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685144681; x=1687736681;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kGsSI0lPP8ERxd6p+DSa9eEPYGyuTkZRYkJGde6ThZo=;
        b=hvb8rxkERCbIh1bZc0q4NRTJ+rJW/WU+U0AR8hQmLag3Ue+qSWO6cakjY3a2+aFQIE
         x+dhqQS7EQpNz5Tcg/879WfdtsT2g9m9IEV/ar3WsH6hpivs+AgK+n3cV9xivqmDDPOm
         KKmHGpOcNrwi3l5Yw+fAvneY5R+j+Mh2hjIBHhqkVzBeZTwwqArwApBbzG0OmYJUYGc6
         DRb2e1iDRkrr5VQNcGKChaSGvbQt6NfDiW4utZo1zEzUWIhsS0vIBmPt/jCICfYU7AGj
         2EXBMubac0epYeTWkMmnp5dg4awgt7i7k/gPemJKnVVjNCrCZqeAJZJODgbRp4LsgzpY
         rjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685144681; x=1687736681;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kGsSI0lPP8ERxd6p+DSa9eEPYGyuTkZRYkJGde6ThZo=;
        b=AmOj+CJMtjWGpuod0PMxZ16bhFDTr9t8TePQ0we8Hrgl5gwchJwh78MUO+6mXmJNKJ
         lIjz6vsdOOeke/AicumXfFpmHhX2ECLJEKIoU/dhv+81kCE1OhJGUeDBA8M0IjmrC9sH
         LXGO38W3c9iHQf6g/WcwNLitXqKXn8giufekIWnRQ2JyafSAt17eya3oNXT27/pArfbq
         l3eUJ6bYB/gNF+MU1a5MHcHyz6qqSnCzaQ6AvH2DljbyRS7u1SNbwCuuXqR8T4If+pUk
         EPSb8EoTKVoN9OQ4FRFHx6L7kzuBju60rCSdOT5UNvYuBW9+mXCMCIizMwHd9NvDsewN
         o2Nw==
X-Gm-Message-State: AC+VfDxHvl8uIM1KD+QARBkILc/cj0d/rdOj4GcZ7Kwx6jWUOgKhxSB2
	rLECbgkgvIRnPVTtItRxywXWwArgeNk=
X-Google-Smtp-Source: ACHHUZ6fi8C05HO0+KMDQENWGjZ4c7vAIwn8WK8PM0ILwAQbwBWVWIEplGkrZ1gydvcndVbPZA/WyjMMkr8=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:910f:8a15:592b:2087])
 (user=yuzhao job=sendgmr) by 2002:a05:6902:50d:b0:ba8:3e2d:58f8 with SMTP id
 x13-20020a056902050d00b00ba83e2d58f8mr1858255ybs.5.1685144681575; Fri, 26 May
 2023 16:44:41 -0700 (PDT)
Date: Fri, 26 May 2023 17:44:26 -0600
In-Reply-To: <20230526234435.662652-1-yuzhao@google.com>
Message-Id: <20230526234435.662652-2-yuzhao@google.com>
Mime-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Subject: [PATCH mm-unstable v2 01/10] mm/kvm: add mmu_notifier_ops->test_clear_young()
From: Yu Zhao <yuzhao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Yu Zhao <yuzhao@google.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-ke
 rnel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add mmu_notifier_ops->test_clear_young() to supersede test_young()
and clear_young().

test_clear_young() has a fast path, which if supported, allows its
callers to safely clear the accessed bit without taking
kvm->mmu_lock.

The fast path requires arch-specific code that generally relies on
RCU and CAS: the former protects KVM page tables from being freed
while the latter clears the accessed bit atomically against both the
hardware and other software page table walkers. If the fast path is
unsupported, test_clear_young() falls back to the existing slow path
where kvm->mmu_lock is then taken.

test_clear_young() can also operate on a range of KVM PTEs
individually according to a bitmap, if the caller provides it.

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 include/linux/kvm_host.h     | 22 +++++++++++
 include/linux/mmu_notifier.h | 52 ++++++++++++++++++++++++
 mm/mmu_notifier.c            | 24 ++++++++++++
 virt/kvm/kvm_main.c          | 76 +++++++++++++++++++++++++++++++++++-
 4 files changed, 173 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 0e571e973bc2..374262545f96 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -258,6 +258,7 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #ifdef KVM_ARCH_WANT_MMU_NOTIFIER
 struct kvm_gfn_range {
 	struct kvm_memory_slot *slot;
+	void *args;
 	gfn_t start;
 	gfn_t end;
 	pte_t pte;
@@ -267,6 +268,27 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
+bool kvm_should_clear_young(struct kvm_gfn_range *range, gfn_t gfn);
+bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *range);
+#endif
+
+/*
+ * Architectures that implement kvm_arch_test_clear_young() should override
+ * kvm_arch_has_test_clear_young().
+ *
+ * kvm_arch_has_test_clear_young() is allowed to return false positive, i.e., it
+ * can return true if kvm_arch_test_clear_young() is supported but disabled due
+ * to some runtime constraint. In this case, kvm_arch_test_clear_young() should
+ * return true; otherwise, it should return false.
+ *
+ * For each young KVM PTE, kvm_arch_test_clear_young() should call
+ * kvm_should_clear_young() to decide whether to clear the accessed bit.
+ */
+#ifndef kvm_arch_has_test_clear_young
+static inline bool kvm_arch_has_test_clear_young(void)
+{
+	return false;
+}
 #endif
 
 enum {
diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 64a3e051c3c4..dfdbb370682d 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -60,6 +60,8 @@ enum mmu_notifier_event {
 };
 
 #define MMU_NOTIFIER_RANGE_BLOCKABLE (1 << 0)
+#define MMU_NOTIFIER_RANGE_LOCKLESS	(1 << 1)
+#define MMU_NOTIFIER_RANGE_YOUNG	(1 << 2)
 
 struct mmu_notifier_ops {
 	/*
@@ -122,6 +124,10 @@ struct mmu_notifier_ops {
 			  struct mm_struct *mm,
 			  unsigned long address);
 
+	int (*test_clear_young)(struct mmu_notifier *mn, struct mm_struct *mm,
+				unsigned long start, unsigned long end,
+				bool clear, unsigned long *bitmap);
+
 	/*
 	 * change_pte is called in cases that pte mapping to page is changed:
 	 * for example, when ksm remaps pte to point to a new shared page.
@@ -392,6 +398,9 @@ extern int __mmu_notifier_clear_young(struct mm_struct *mm,
 				      unsigned long end);
 extern int __mmu_notifier_test_young(struct mm_struct *mm,
 				     unsigned long address);
+extern int __mmu_notifier_test_clear_young(struct mm_struct *mm,
+					   unsigned long start, unsigned long end,
+					   bool clear, unsigned long *bitmap);
 extern void __mmu_notifier_change_pte(struct mm_struct *mm,
 				      unsigned long address, pte_t pte);
 extern int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *r);
@@ -440,6 +449,35 @@ static inline int mmu_notifier_test_young(struct mm_struct *mm,
 	return 0;
 }
 
+/*
+ * mmu_notifier_test_clear_young() returns nonzero if any of the KVM PTEs within
+ * a given range was young. Specifically, it returns MMU_NOTIFIER_RANGE_LOCKLESS
+ * if the fast path was successful, MMU_NOTIFIER_RANGE_YOUNG otherwise.
+ *
+ * The last parameter to the function is a bitmap and only the fast path
+ * supports it: if it is NULL, the function falls back to the slow path if the
+ * fast path was unsuccessful; otherwise, the function bails out.
+ *
+ * The bitmap has the following specifications:
+ * 1. The number of bits should be at least (end-start)/PAGE_SIZE.
+ * 2. The offset of each bit should be relative to the end, i.e., the offset
+ *    corresponding to addr should be (end-addr)/PAGE_SIZE-1. This is convenient
+ *    for batching while forward looping.
+ *
+ * When testing, this function sets the corresponding bit in the bitmap for each
+ * young KVM PTE. When clearing, this function clears the accessed bit for each
+ * young KVM PTE whose corresponding bit in the bitmap is set.
+ */
+static inline int mmu_notifier_test_clear_young(struct mm_struct *mm,
+						unsigned long start, unsigned long end,
+						bool clear, unsigned long *bitmap)
+{
+	if (mm_has_notifiers(mm))
+		return __mmu_notifier_test_clear_young(mm, start, end, clear, bitmap);
+
+	return 0;
+}
+
 static inline void mmu_notifier_change_pte(struct mm_struct *mm,
 					   unsigned long address, pte_t pte)
 {
@@ -684,12 +722,26 @@ static inline int mmu_notifier_clear_flush_young(struct mm_struct *mm,
 	return 0;
 }
 
+static inline int mmu_notifier_clear_young(struct mm_struct *mm,
+					   unsigned long start,
+					   unsigned long end)
+{
+	return 0;
+}
+
 static inline int mmu_notifier_test_young(struct mm_struct *mm,
 					  unsigned long address)
 {
 	return 0;
 }
 
+static inline int mmu_notifier_test_clear_young(struct mm_struct *mm,
+						unsigned long start, unsigned long end,
+						bool clear, unsigned long *bitmap)
+{
+	return 0;
+}
+
 static inline void mmu_notifier_change_pte(struct mm_struct *mm,
 					   unsigned long address, pte_t pte)
 {
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 50c0dde1354f..7e6aba4bddcb 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -424,6 +424,30 @@ int __mmu_notifier_test_young(struct mm_struct *mm,
 	return young;
 }
 
+int __mmu_notifier_test_clear_young(struct mm_struct *mm,
+				    unsigned long start, unsigned long end,
+				    bool clear, unsigned long *bitmap)
+{
+	int idx;
+	struct mmu_notifier *mn;
+	int young = 0;
+
+	idx = srcu_read_lock(&srcu);
+
+	hlist_for_each_entry_srcu(mn, &mm->notifier_subscriptions->list, hlist,
+				  srcu_read_lock_held(&srcu)) {
+		if (mn->ops->test_clear_young)
+			young |= mn->ops->test_clear_young(mn, mm, start, end, clear, bitmap);
+
+		if (young && !clear)
+			break;
+	}
+
+	srcu_read_unlock(&srcu, idx);
+
+	return young;
+}
+
 void __mmu_notifier_change_pte(struct mm_struct *mm, unsigned long address,
 			       pte_t pte)
 {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 51e4882d0873..31ee58754b19 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -541,6 +541,7 @@ typedef void (*on_lock_fn_t)(struct kvm *kvm, unsigned long start,
 typedef void (*on_unlock_fn_t)(struct kvm *kvm);
 
 struct kvm_hva_range {
+	void *args;
 	unsigned long start;
 	unsigned long end;
 	pte_t pte;
@@ -549,6 +550,7 @@ struct kvm_hva_range {
 	on_unlock_fn_t on_unlock;
 	bool flush_on_ret;
 	bool may_block;
+	bool lockless;
 };
 
 /*
@@ -602,6 +604,8 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 			hva_end = min(range->end, slot->userspace_addr +
 						  (slot->npages << PAGE_SHIFT));
 
+			gfn_range.args = range->args;
+
 			/*
 			 * To optimize for the likely case where the address
 			 * range is covered by zero or one memslots, don't
@@ -619,7 +623,7 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 			gfn_range.end = hva_to_gfn_memslot(hva_end + PAGE_SIZE - 1, slot);
 			gfn_range.slot = slot;
 
-			if (!locked) {
+			if (!range->lockless && !locked) {
 				locked = true;
 				KVM_MMU_LOCK(kvm);
 				if (!IS_KVM_NULL_FN(range->on_lock))
@@ -628,6 +632,9 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 					break;
 			}
 			ret |= range->handler(kvm, &gfn_range);
+
+			if (range->lockless && ret)
+				break;
 		}
 	}
 
@@ -880,6 +887,72 @@ static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
 					     kvm_test_age_gfn);
 }
 
+struct test_clear_young_args {
+	unsigned long *bitmap;
+	unsigned long end;
+	bool clear;
+	bool young;
+};
+
+bool kvm_should_clear_young(struct kvm_gfn_range *range, gfn_t gfn)
+{
+	struct test_clear_young_args *args = range->args;
+
+	VM_WARN_ON_ONCE(gfn < range->start || gfn >= range->end);
+
+	args->young = true;
+
+	if (args->bitmap) {
+		int offset = hva_to_gfn_memslot(args->end - 1, range->slot) - gfn;
+
+		if (args->clear)
+			return test_bit(offset, args->bitmap);
+
+		__set_bit(offset, args->bitmap);
+	}
+
+	return args->clear;
+}
+
+static int kvm_mmu_notifier_test_clear_young(struct mmu_notifier *mn, struct mm_struct *mm,
+					     unsigned long start, unsigned long end,
+					     bool clear, unsigned long *bitmap)
+{
+	struct kvm *kvm = mmu_notifier_to_kvm(mn);
+	struct kvm_hva_range range = {
+		.start		= start,
+		.end		= end,
+		.on_lock	= (void *)kvm_null_fn,
+		.on_unlock	= (void *)kvm_null_fn,
+	};
+
+	trace_kvm_age_hva(start, end);
+
+	if (kvm_arch_has_test_clear_young()) {
+		struct test_clear_young_args args = {
+			.bitmap	= bitmap,
+			.end	= end,
+			.clear	= clear,
+		};
+
+		range.args = &args;
+		range.lockless = true;
+		range.handler = kvm_arch_test_clear_young;
+
+		if (!__kvm_handle_hva_range(kvm, &range))
+			return args.young ? MMU_NOTIFIER_RANGE_LOCKLESS : 0;
+	}
+
+	if (bitmap)
+		return 0;
+
+	range.args = NULL;
+	range.lockless = false;
+	range.handler = clear ? kvm_age_gfn : kvm_test_age_gfn;
+
+	return __kvm_handle_hva_range(kvm, &range) ? MMU_NOTIFIER_RANGE_YOUNG : 0;
+}
+
 static void kvm_mmu_notifier_release(struct mmu_notifier *mn,
 				     struct mm_struct *mm)
 {
@@ -898,6 +971,7 @@ static const struct mmu_notifier_ops kvm_mmu_notifier_ops = {
 	.clear_flush_young	= kvm_mmu_notifier_clear_flush_young,
 	.clear_young		= kvm_mmu_notifier_clear_young,
 	.test_young		= kvm_mmu_notifier_test_young,
+	.test_clear_young	= kvm_mmu_notifier_test_clear_young,
 	.change_pte		= kvm_mmu_notifier_change_pte,
 	.release		= kvm_mmu_notifier_release,
 };
-- 
2.41.0.rc0.172.g3f132b7071-goog

