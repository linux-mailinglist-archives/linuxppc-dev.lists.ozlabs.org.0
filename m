Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C6D69A4CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 05:19:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHz9k0H1nz3fL0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 15:19:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dOLMIGuU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--yuzhao.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3tp7uywykdjmlhm4xb3bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--yuzhao.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dOLMIGuU;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHz1N2dl5z3cMx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 15:12:40 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 79-20020a250b52000000b009419f64f6afso4297494ybl.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 20:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yzogm92QmXfssxHKM4jCt3C6vEqgvX7DQk09DtYoUyc=;
        b=dOLMIGuUslf4WaXhpFtEYe+ZvfMFSXx31VRArlOz/rNZk3zy5YMmk3nCIzYxrGsNnQ
         7eRf4QdsdODHHdw/wlrVm7kSLLs+E22VAIm7EsCIR92rCUG+EUcYdYgiYbkJnMtJzpTg
         rS6yL1Y8cSJGD2id5jKC2qJUALM2w7GybvtYoZ9p5lB6n892fxqLa/Oi84Gd2BIaAmzM
         1MuoCcs3gdI2qDkS3MSaD05GmwOz5MykmjGtOnBaaMGNkkyIGgyiVAHPQw0yBx6R0RPE
         jtZGgtOi3SyqmladgbWsAbqw7tEMsjumncO64YH26dlS89ZgYt0+Mo5zUNUWGuZxIW4p
         5FZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yzogm92QmXfssxHKM4jCt3C6vEqgvX7DQk09DtYoUyc=;
        b=refy294wdbGFrv1VV5EWd6n9S2io23PURMvBm5kwNrn+vlPnlOr4YcGrUqZMYX0pth
         h6pRAz5FtybZXC5MztRYh7H340vtAHnrEWafdPak1V6CUz40WbyhSIw4Qv8nMrXieiZg
         F6AMP48n+w3pxYRXAVhYgxjj0QfhnzNTTeCilbiDGEGy/zvjrwRBh5MHd5mylDPqORB5
         jDZs3dgyAh/Cj+MmKfHi9Yx05GwT2FEUCN6jBq2Gg0HaN8sQTNxSOByIXDk5nFjegeae
         Z3p0Bn9/t4VTBjhYFpQ8+oJ3x/lZ/ht9y+QlK8YZoED8k0ppg+7D6hYKr1r2EjADxOSb
         3L7A==
X-Gm-Message-State: AO0yUKWUlDasSnCmxgpC/Af7NTmB03eCV7N6KREldvXNj8SciWfWbPmi
	uecN8xiKnh1rL1T4uXGBsEETZ49Q5oY=
X-Google-Smtp-Source: AK7set+ctTnPBlk//+grImBJ58HiDlxzr1n1x/EYTRUxI9MgHdyKhlzqFYbYy1jt34qlgVB0Lo9nfk8TooA=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:6fb3:61e:d31f:1ad3])
 (user=yuzhao job=sendgmr) by 2002:a81:3e05:0:b0:536:4d58:54b2 with SMTP id
 l5-20020a813e05000000b005364d5854b2mr149ywa.4.1676607156974; Thu, 16 Feb 2023
 20:12:36 -0800 (PST)
Date: Thu, 16 Feb 2023 21:12:26 -0700
In-Reply-To: <20230217041230.2417228-1-yuzhao@google.com>
Message-Id: <20230217041230.2417228-2-yuzhao@google.com>
Mime-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Subject: [PATCH mm-unstable v1 1/5] mm/kvm: add mmu_notifier_test_clear_young()
From: Yu Zhao <yuzhao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 17 Feb 2023 15:18:13 +1100
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
Cc: linux-mm@google.com, Yu Zhao <yuzhao@google.com>, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mmu_notifier_test_clear_young() allows the caller to safely test and
clear the accessed bit in KVM PTEs without taking the MMU lock.

This patch adds the generic infrastructure to invoke the subsequent
arch-specific patches. The arch-specific implementations generally
rely on two techniques: RCU and cmpxchg. The former protects KVM page
tables from being freed while the latter clears the accessed bit
atomically against both the hardware and other software page table
walkers.

mmu_notifier_test_clear_young() follows two design patterns: fallback
and batching. For any unsupported cases, it can optionally fall back
to mmu_notifier_ops->clear_young(). For a range of KVM PTEs, it can
test or test and clear their accessed bits according to a bitmap
provided by the caller.

mmu_notifier_test_clear_young() always returns 0 if fallback is not
allowed. If fallback happens, its return value is similar to that of
mmu_notifier_clear_young().

The bitmap parameter has the following specifications:
1. The number of bits should be at least (end-start)/PAGE_SIZE.
2. The offset of each bit is relative to the end. E.g., the offset
   corresponding to addr is (end-addr)/PAGE_SIZE-1. This is to better
   suit batching while forward looping.
3. For each KVM PTE with the accessed bit set (young), arch-specific
   implementations flip the corresponding bit in the bitmap. It only
   clears the accessed bit if the old value is 1. A caller can test or
   test and clear the accessed bit by setting the corresponding bit in
   the bitmap to 0 or 1, and the new value will be 1 or 0 for a young
   KVM PTE.

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 include/linux/kvm_host.h     | 29 ++++++++++++++++++
 include/linux/mmu_notifier.h | 40 +++++++++++++++++++++++++
 mm/mmu_notifier.c            | 26 ++++++++++++++++
 virt/kvm/kvm_main.c          | 58 ++++++++++++++++++++++++++++++++++++
 4 files changed, 153 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4f26b244f6d0..df46fc815c8b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2281,4 +2281,33 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
 
+/*
+ * Architectures that implement kvm_arch_test_clear_young() should override
+ * kvm_arch_has_test_clear_young().
+ *
+ * kvm_arch_has_test_clear_young() is allowed to return false positive. It can
+ * return true if kvm_arch_test_clear_young() is supported but disabled due to
+ * some runtime constraint. In this case, kvm_arch_test_clear_young() should
+ * return false.
+ *
+ * The last parameter to kvm_arch_test_clear_young() is a bitmap with the
+ * following specifications:
+ * 1. The offset of each bit is relative to the second to the last parameter
+ *    lsb_gfn. E.g., the offset corresponding to gfn is lsb_gfn-gfn. This is to
+ *    better suit batching while forward looping.
+ * 2. For each KVM PTE with the accessed bit set, the implementation should flip
+ *    the corresponding bit in the bitmap. It should only clear the accessed bit
+ *    if the old value is 1. This allows the caller to test or test and clear
+ *    the accessed bit.
+ */
+#ifndef kvm_arch_has_test_clear_young
+static inline bool kvm_arch_has_test_clear_young(void)
+{
+	return false;
+}
+#endif
+
+bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *range,
+			       gfn_t lsb_gfn, unsigned long *bitmap);
+
 #endif
diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 64a3e051c3c4..432b51cd6843 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -122,6 +122,11 @@ struct mmu_notifier_ops {
 			  struct mm_struct *mm,
 			  unsigned long address);
 
+	/* see the comments on mmu_notifier_test_clear_young() */
+	bool (*test_clear_young)(struct mmu_notifier *mn, struct mm_struct *mm,
+				 unsigned long start, unsigned long end,
+				 unsigned long *bitmap);
+
 	/*
 	 * change_pte is called in cases that pte mapping to page is changed:
 	 * for example, when ksm remaps pte to point to a new shared page.
@@ -390,6 +395,9 @@ extern int __mmu_notifier_clear_flush_young(struct mm_struct *mm,
 extern int __mmu_notifier_clear_young(struct mm_struct *mm,
 				      unsigned long start,
 				      unsigned long end);
+extern int __mmu_notifier_test_clear_young(struct mm_struct *mm,
+					   unsigned long start, unsigned long end,
+					   bool fallback, unsigned long *bitmap);
 extern int __mmu_notifier_test_young(struct mm_struct *mm,
 				     unsigned long address);
 extern void __mmu_notifier_change_pte(struct mm_struct *mm,
@@ -432,6 +440,31 @@ static inline int mmu_notifier_clear_young(struct mm_struct *mm,
 	return 0;
 }
 
+/*
+ * This function always returns 0 if fallback is not allowed. If fallback
+ * happens, its return value is similar to that of mmu_notifier_clear_young().
+ *
+ * The bitmap has the following specifications:
+ * 1. The number of bits should be at least (end-start)/PAGE_SIZE.
+ * 2. The offset of each bit is relative to the end. E.g., the offset
+ *    corresponding to addr is (end-addr)/PAGE_SIZE-1. This is to better suit
+ *    batching while forward looping.
+ * 3. For each KVM PTE with the accessed bit set (young), this function flips
+ *    the corresponding bit in the bitmap. It only clears the accessed bit if
+ *    the old value is 1. A caller can test or test and clear the accessed bit
+ *    by setting the corresponding bit in the bitmap to 0 or 1, and the new
+ *    value will be 1 or 0 for a young KVM PTE.
+ */
+static inline int mmu_notifier_test_clear_young(struct mm_struct *mm,
+						unsigned long start, unsigned long end,
+						bool fallback, unsigned long *bitmap)
+{
+	if (mm_has_notifiers(mm))
+		return __mmu_notifier_test_clear_young(mm, start, end, fallback, bitmap);
+
+	return 0;
+}
+
 static inline int mmu_notifier_test_young(struct mm_struct *mm,
 					  unsigned long address)
 {
@@ -684,6 +717,13 @@ static inline int mmu_notifier_clear_flush_young(struct mm_struct *mm,
 	return 0;
 }
 
+static inline int mmu_notifier_test_clear_young(struct mm_struct *mm,
+						unsigned long start, unsigned long end,
+						bool fallback, unsigned long *bitmap)
+{
+	return 0;
+}
+
 static inline int mmu_notifier_test_young(struct mm_struct *mm,
 					  unsigned long address)
 {
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 50c0dde1354f..dd39b9b4d6d3 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -402,6 +402,32 @@ int __mmu_notifier_clear_young(struct mm_struct *mm,
 	return young;
 }
 
+/* see the comments on mmu_notifier_test_clear_young() */
+int __mmu_notifier_test_clear_young(struct mm_struct *mm,
+				    unsigned long start, unsigned long end,
+				    bool fallback, unsigned long *bitmap)
+{
+	int key;
+	struct mmu_notifier *mn;
+	int young = 0;
+
+	key = srcu_read_lock(&srcu);
+
+	hlist_for_each_entry_srcu(mn, &mm->notifier_subscriptions->list,
+				  hlist, srcu_read_lock_held(&srcu)) {
+		if (mn->ops->test_clear_young &&
+		    mn->ops->test_clear_young(mn, mm, start, end, bitmap))
+			continue;
+
+		if (fallback && mn->ops->clear_young)
+			young |= mn->ops->clear_young(mn, mm, start, end);
+	}
+
+	srcu_read_unlock(&srcu, key);
+
+	return young;
+}
+
 int __mmu_notifier_test_young(struct mm_struct *mm,
 			      unsigned long address)
 {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9c60384b5ae0..1b465df4a93d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -875,6 +875,63 @@ static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,
 	return kvm_handle_hva_range_no_flush(mn, start, end, kvm_age_gfn);
 }
 
+static bool kvm_test_clear_young(struct kvm *kvm, unsigned long start,
+				 unsigned long end, unsigned long *bitmap)
+{
+	int i;
+	int key;
+	bool success = true;
+
+	trace_kvm_age_hva(start, end);
+
+	key = srcu_read_lock(&kvm->srcu);
+
+	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+		struct interval_tree_node *node;
+		struct kvm_memslots *slots = __kvm_memslots(kvm, i);
+
+		kvm_for_each_memslot_in_hva_range(node, slots, start, end - 1) {
+			gfn_t lsb_gfn;
+			unsigned long hva_start, hva_end;
+			struct kvm_gfn_range range = {
+				.slot = container_of(node, struct kvm_memory_slot,
+						     hva_node[slots->node_idx]),
+			};
+
+			hva_start = max(start, range.slot->userspace_addr);
+			hva_end = min(end - 1, range.slot->userspace_addr +
+					       range.slot->npages * PAGE_SIZE - 1);
+
+			range.start = hva_to_gfn_memslot(hva_start, range.slot);
+			range.end = hva_to_gfn_memslot(hva_end, range.slot) + 1;
+
+			if (WARN_ON_ONCE(range.end <= range.start))
+				continue;
+
+			/* see the comments on the generic kvm_arch_has_test_clear_young() */
+			lsb_gfn = hva_to_gfn_memslot(end - 1, range.slot);
+
+			success = kvm_arch_test_clear_young(kvm, &range, lsb_gfn, bitmap);
+			if (!success)
+				break;
+		}
+	}
+
+	srcu_read_unlock(&kvm->srcu, key);
+
+	return success;
+}
+
+static bool kvm_mmu_notifier_test_clear_young(struct mmu_notifier *mn, struct mm_struct *mm,
+					      unsigned long start, unsigned long end,
+					      unsigned long *bitmap)
+{
+	if (kvm_arch_has_test_clear_young())
+		return kvm_test_clear_young(mmu_notifier_to_kvm(mn), start, end, bitmap);
+
+	return false;
+}
+
 static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
 				       struct mm_struct *mm,
 				       unsigned long address)
@@ -903,6 +960,7 @@ static const struct mmu_notifier_ops kvm_mmu_notifier_ops = {
 	.clear_flush_young	= kvm_mmu_notifier_clear_flush_young,
 	.clear_young		= kvm_mmu_notifier_clear_young,
 	.test_young		= kvm_mmu_notifier_test_young,
+	.test_clear_young	= kvm_mmu_notifier_test_clear_young,
 	.change_pte		= kvm_mmu_notifier_change_pte,
 	.release		= kvm_mmu_notifier_release,
 };
-- 
2.39.2.637.g21b0678d19-goog

