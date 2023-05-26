Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A971271309A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 01:47:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QShRc4B1pz3fWv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 09:47:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=HaeURiP8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--yuzhao.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3a0rxzaykdoicydlesksskpi.gsqpmrybttg-hizpmwxw.sdpefw.svk@flex--yuzhao.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=HaeURiP8;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QShNd0XlHz3f7x
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 09:44:47 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5618857518dso17693087b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 16:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685144683; x=1687736683;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=74b92Wk/fESh4Us3jjAt9ER/dw3pjjcYNf6aM3EASmw=;
        b=HaeURiP8Vv+S5DfSxjNudO8jlQJ3LkpTBadHgzP5bqFZBs2b3foI2By3BUQ7HvtvPw
         W7QXj6uSkaA/QUNh4WGZeI/+nH65GkUhIUrM4lyZvIxfASIS2yU+XXbU6dLJN4ghefvO
         HpvDwxabNs2VhwI1FmYErw8clASpd/3GLJz6qPYetihMIY0W6vexsuS/yVGVZpRWw3il
         an2SbsIcj+SL6k3rb4VmBY4XZ/nf3i0WPF6L2efKh0GQc6ZIGr6GiKv97NKXrU9K5c92
         qSgR2Y5nDu/cn+wzryf1LV/5CRQgKNqjczW+qgHgoPm+B6opAwXo+9yxImX5iYvtFZ8h
         Yz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685144683; x=1687736683;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=74b92Wk/fESh4Us3jjAt9ER/dw3pjjcYNf6aM3EASmw=;
        b=XrG8YAFhB8/Ji7ICDs2Bb8ygIfq7I7/IG9hIMmAReerQHs0ejBdF7/NZYd+XpPVPRt
         PxzxlJLaSGn8uZVSUBvGMb0m9v3nIFj2AB0mZb2g3tkDOAgjQHNUP+hqhvwczUtu1Dtn
         y13DaBLF08cC7PFfHwOdTsjtZghpHDV5i8MujrrE2bv+VtUjGHCorT/lAZh8PcbtjIWR
         oBtPf5p1dAV7pkuiLEWVoBxGueg0S8xhqKkizXMXnwzj4e+kQWZf0sCia7/gAQ0rFESy
         v6gPBwMK0l2ik7APUj3HCQQuX01PVHhUPZEBdOrHefUzbvcJ7b/nrMOwxp3ID7qY3Nsm
         jURg==
X-Gm-Message-State: AC+VfDxadmfPsm26Km0sEEBkxHKY87ragqJOgXh6FGx9T8N0KfJbeG+8
	6G9wBjzFFjbQFARwleamG1+5pfaX9p4=
X-Google-Smtp-Source: ACHHUZ77t8VJ8lKvCLJIppCq4GXisPABEajtkBmVe9W7YGxSZPGguPwTv3qLn5OBBx4lDI9spcGEUr4VdcA=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:910f:8a15:592b:2087])
 (user=yuzhao job=sendgmr) by 2002:a81:e608:0:b0:561:c4ef:1def with SMTP id
 u8-20020a81e608000000b00561c4ef1defmr2027484ywl.0.1685144683190; Fri, 26 May
 2023 16:44:43 -0700 (PDT)
Date: Fri, 26 May 2023 17:44:27 -0600
In-Reply-To: <20230526234435.662652-1-yuzhao@google.com>
Message-Id: <20230526234435.662652-3-yuzhao@google.com>
Mime-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Subject: [PATCH mm-unstable v2 02/10] mm/kvm: use mmu_notifier_ops->test_clear_young()
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

Replace test_young() and clear_young() with test_clear_young().

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 include/linux/mmu_notifier.h | 29 ++-----------------
 include/trace/events/kvm.h   | 15 ----------
 mm/mmu_notifier.c            | 42 ----------------------------
 virt/kvm/kvm_main.c          | 54 ------------------------------------
 4 files changed, 2 insertions(+), 138 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index dfdbb370682d..c8f35fc08703 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -104,26 +104,6 @@ struct mmu_notifier_ops {
 				 unsigned long start,
 				 unsigned long end);
 
-	/*
-	 * clear_young is a lightweight version of clear_flush_young. Like the
-	 * latter, it is supposed to test-and-clear the young/accessed bitflag
-	 * in the secondary pte, but it may omit flushing the secondary tlb.
-	 */
-	int (*clear_young)(struct mmu_notifier *subscription,
-			   struct mm_struct *mm,
-			   unsigned long start,
-			   unsigned long end);
-
-	/*
-	 * test_young is called to check the young/accessed bitflag in
-	 * the secondary pte. This is used to know if the page is
-	 * frequently used without actually clearing the flag or tearing
-	 * down the secondary mapping on the page.
-	 */
-	int (*test_young)(struct mmu_notifier *subscription,
-			  struct mm_struct *mm,
-			  unsigned long address);
-
 	int (*test_clear_young)(struct mmu_notifier *mn, struct mm_struct *mm,
 				unsigned long start, unsigned long end,
 				bool clear, unsigned long *bitmap);
@@ -393,11 +373,6 @@ extern void __mmu_notifier_release(struct mm_struct *mm);
 extern int __mmu_notifier_clear_flush_young(struct mm_struct *mm,
 					  unsigned long start,
 					  unsigned long end);
-extern int __mmu_notifier_clear_young(struct mm_struct *mm,
-				      unsigned long start,
-				      unsigned long end);
-extern int __mmu_notifier_test_young(struct mm_struct *mm,
-				     unsigned long address);
 extern int __mmu_notifier_test_clear_young(struct mm_struct *mm,
 					   unsigned long start, unsigned long end,
 					   bool clear, unsigned long *bitmap);
@@ -437,7 +412,7 @@ static inline int mmu_notifier_clear_young(struct mm_struct *mm,
 					   unsigned long end)
 {
 	if (mm_has_notifiers(mm))
-		return __mmu_notifier_clear_young(mm, start, end);
+		return __mmu_notifier_test_clear_young(mm, start, end, true, NULL);
 	return 0;
 }
 
@@ -445,7 +420,7 @@ static inline int mmu_notifier_test_young(struct mm_struct *mm,
 					  unsigned long address)
 {
 	if (mm_has_notifiers(mm))
-		return __mmu_notifier_test_young(mm, address);
+		return __mmu_notifier_test_clear_young(mm, address, address + 1, false, NULL);
 	return 0;
 }
 
diff --git a/include/trace/events/kvm.h b/include/trace/events/kvm.h
index 3bd31ea23fee..46c347e56e60 100644
--- a/include/trace/events/kvm.h
+++ b/include/trace/events/kvm.h
@@ -489,21 +489,6 @@ TRACE_EVENT(kvm_age_hva,
 		  __entry->start, __entry->end)
 );
 
-TRACE_EVENT(kvm_test_age_hva,
-	TP_PROTO(unsigned long hva),
-	TP_ARGS(hva),
-
-	TP_STRUCT__entry(
-		__field(	unsigned long,	hva		)
-	),
-
-	TP_fast_assign(
-		__entry->hva		= hva;
-	),
-
-	TP_printk("mmu notifier test age hva: %#016lx", __entry->hva)
-);
-
 #endif /* _TRACE_KVM_MAIN_H */
 
 /* This part must be outside protection */
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 7e6aba4bddcb..c7e9747c9920 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -382,48 +382,6 @@ int __mmu_notifier_clear_flush_young(struct mm_struct *mm,
 	return young;
 }
 
-int __mmu_notifier_clear_young(struct mm_struct *mm,
-			       unsigned long start,
-			       unsigned long end)
-{
-	struct mmu_notifier *subscription;
-	int young = 0, id;
-
-	id = srcu_read_lock(&srcu);
-	hlist_for_each_entry_rcu(subscription,
-				 &mm->notifier_subscriptions->list, hlist,
-				 srcu_read_lock_held(&srcu)) {
-		if (subscription->ops->clear_young)
-			young |= subscription->ops->clear_young(subscription,
-								mm, start, end);
-	}
-	srcu_read_unlock(&srcu, id);
-
-	return young;
-}
-
-int __mmu_notifier_test_young(struct mm_struct *mm,
-			      unsigned long address)
-{
-	struct mmu_notifier *subscription;
-	int young = 0, id;
-
-	id = srcu_read_lock(&srcu);
-	hlist_for_each_entry_rcu(subscription,
-				 &mm->notifier_subscriptions->list, hlist,
-				 srcu_read_lock_held(&srcu)) {
-		if (subscription->ops->test_young) {
-			young = subscription->ops->test_young(subscription, mm,
-							      address);
-			if (young)
-				break;
-		}
-	}
-	srcu_read_unlock(&srcu, id);
-
-	return young;
-}
-
 int __mmu_notifier_test_clear_young(struct mm_struct *mm,
 				    unsigned long start, unsigned long end,
 				    bool clear, unsigned long *bitmap)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 31ee58754b19..977baaf1b248 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -674,25 +674,6 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 	return __kvm_handle_hva_range(kvm, &range);
 }
 
-static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn,
-							 unsigned long start,
-							 unsigned long end,
-							 hva_handler_t handler)
-{
-	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const struct kvm_hva_range range = {
-		.start		= start,
-		.end		= end,
-		.pte		= __pte(0),
-		.handler	= handler,
-		.on_lock	= (void *)kvm_null_fn,
-		.on_unlock	= (void *)kvm_null_fn,
-		.flush_on_ret	= false,
-		.may_block	= false,
-	};
-
-	return __kvm_handle_hva_range(kvm, &range);
-}
 static void kvm_mmu_notifier_change_pte(struct mmu_notifier *mn,
 					struct mm_struct *mm,
 					unsigned long address,
@@ -854,39 +835,6 @@ static int kvm_mmu_notifier_clear_flush_young(struct mmu_notifier *mn,
 	return kvm_handle_hva_range(mn, start, end, __pte(0), kvm_age_gfn);
 }
 
-static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,
-					struct mm_struct *mm,
-					unsigned long start,
-					unsigned long end)
-{
-	trace_kvm_age_hva(start, end);
-
-	/*
-	 * Even though we do not flush TLB, this will still adversely
-	 * affect performance on pre-Haswell Intel EPT, where there is
-	 * no EPT Access Bit to clear so that we have to tear down EPT
-	 * tables instead. If we find this unacceptable, we can always
-	 * add a parameter to kvm_age_hva so that it effectively doesn't
-	 * do anything on clear_young.
-	 *
-	 * Also note that currently we never issue secondary TLB flushes
-	 * from clear_young, leaving this job up to the regular system
-	 * cadence. If we find this inaccurate, we might come up with a
-	 * more sophisticated heuristic later.
-	 */
-	return kvm_handle_hva_range_no_flush(mn, start, end, kvm_age_gfn);
-}
-
-static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
-				       struct mm_struct *mm,
-				       unsigned long address)
-{
-	trace_kvm_test_age_hva(address);
-
-	return kvm_handle_hva_range_no_flush(mn, address, address + 1,
-					     kvm_test_age_gfn);
-}
-
 struct test_clear_young_args {
 	unsigned long *bitmap;
 	unsigned long end;
@@ -969,8 +917,6 @@ static const struct mmu_notifier_ops kvm_mmu_notifier_ops = {
 	.invalidate_range_start	= kvm_mmu_notifier_invalidate_range_start,
 	.invalidate_range_end	= kvm_mmu_notifier_invalidate_range_end,
 	.clear_flush_young	= kvm_mmu_notifier_clear_flush_young,
-	.clear_young		= kvm_mmu_notifier_clear_young,
-	.test_young		= kvm_mmu_notifier_test_young,
 	.test_clear_young	= kvm_mmu_notifier_test_clear_young,
 	.change_pte		= kvm_mmu_notifier_change_pte,
 	.release		= kvm_mmu_notifier_release,
-- 
2.41.0.rc0.172.g3f132b7071-goog

