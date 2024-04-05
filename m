Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CFF899C3D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 14:00:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L+fkPk88;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L+fkPk88;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9xrX2FKDz3vj5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 23:00:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L+fkPk88;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L+fkPk88;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9xpD0mZpz2xTP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 22:58:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712318305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54r2v6x4hCqSU9lpxJJX8F9xMdFOFqhWRrFs4bS58g8=;
	b=L+fkPk88xtYljnT+Hv3FJ4sNNlN5KHkdQkihJdDQ4wxc0nBSGyK0ZEzE04QgP8PSx3AG2U
	N1PBRnGO5JhBvkxWMfZzORD4Ar9MDXt+UOEAhADNY2r+/ZjpDWWTxvfz8I2S54rk2GHfRX
	Nu/moYoIEexMqVG+j8CXsbfms1SyvFc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712318305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54r2v6x4hCqSU9lpxJJX8F9xMdFOFqhWRrFs4bS58g8=;
	b=L+fkPk88xtYljnT+Hv3FJ4sNNlN5KHkdQkihJdDQ4wxc0nBSGyK0ZEzE04QgP8PSx3AG2U
	N1PBRnGO5JhBvkxWMfZzORD4Ar9MDXt+UOEAhADNY2r+/ZjpDWWTxvfz8I2S54rk2GHfRX
	Nu/moYoIEexMqVG+j8CXsbfms1SyvFc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-1T7hKq5gPw2fRM982K2a_w-1; Fri, 05 Apr 2024 07:58:22 -0400
X-MC-Unique: 1T7hKq5gPw2fRM982K2a_w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4A2888D0C8;
	Fri,  5 Apr 2024 11:58:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 13F6640C6CB3;
	Fri,  5 Apr 2024 11:58:20 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH 3/4] mmu_notifier: remove the .change_pte() callback
Date: Fri,  5 Apr 2024 07:58:14 -0400
Message-ID: <20240405115815.3226315-4-pbonzini@redhat.com>
In-Reply-To: <20240405115815.3226315-1-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
Cc: kvm-riscv@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, loongarch@lists.linux.dev, David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-mips@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Bibo Mao <maobibo@loongson.cn>, Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, kvmarm@lists.linux.dev, Oliver Upton <oliver.upton@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The scope of set_pte_at_notify() has reduced more and more through the
years.  Initially, it was meant for when the change to the PTE was
not bracketed by mmu_notifier_invalidate_range_{start,end}().  However,
that has not been so for over ten years.  During all this period
the only implementation of .change_pte() was KVM and it
had no actual functionality, because it was called after
mmu_notifier_invalidate_range_start() zapped the secondary PTE.

Now that this (nonfunctional) user of the .change_pte() callback is
gone, the whole callback can be removed.  For now, leave in place
set_pte_at_notify() even though it is just a synonym for set_pte_at().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/linux/mmu_notifier.h | 46 ++----------------------------------
 mm/mmu_notifier.c            | 17 -------------
 2 files changed, 2 insertions(+), 61 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index f349e08a9dfe..8c72bf651606 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -122,15 +122,6 @@ struct mmu_notifier_ops {
 			  struct mm_struct *mm,
 			  unsigned long address);
 
-	/*
-	 * change_pte is called in cases that pte mapping to page is changed:
-	 * for example, when ksm remaps pte to point to a new shared page.
-	 */
-	void (*change_pte)(struct mmu_notifier *subscription,
-			   struct mm_struct *mm,
-			   unsigned long address,
-			   pte_t pte);
-
 	/*
 	 * invalidate_range_start() and invalidate_range_end() must be
 	 * paired and are called only when the mmap_lock and/or the
@@ -392,8 +383,6 @@ extern int __mmu_notifier_clear_young(struct mm_struct *mm,
 				      unsigned long end);
 extern int __mmu_notifier_test_young(struct mm_struct *mm,
 				     unsigned long address);
-extern void __mmu_notifier_change_pte(struct mm_struct *mm,
-				      unsigned long address, pte_t pte);
 extern int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *r);
 extern void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *r);
 extern void __mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
@@ -439,13 +428,6 @@ static inline int mmu_notifier_test_young(struct mm_struct *mm,
 	return 0;
 }
 
-static inline void mmu_notifier_change_pte(struct mm_struct *mm,
-					   unsigned long address, pte_t pte)
-{
-	if (mm_has_notifiers(mm))
-		__mmu_notifier_change_pte(mm, address, pte);
-}
-
 static inline void
 mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
 {
@@ -581,26 +563,6 @@ static inline void mmu_notifier_range_init_owner(
 	__young;							\
 })
 
-/*
- * set_pte_at_notify() sets the pte _after_ running the notifier.
- * This is safe to start by updating the secondary MMUs, because the primary MMU
- * pte invalidate must have already happened with a ptep_clear_flush() before
- * set_pte_at_notify() has been invoked.  Updating the secondary MMUs first is
- * required when we change both the protection of the mapping from read-only to
- * read-write and the pfn (like during copy on write page faults). Otherwise the
- * old page would remain mapped readonly in the secondary MMUs after the new
- * page is already writable by some CPU through the primary MMU.
- */
-#define set_pte_at_notify(__mm, __address, __ptep, __pte)		\
-({									\
-	struct mm_struct *___mm = __mm;					\
-	unsigned long ___address = __address;				\
-	pte_t ___pte = __pte;						\
-									\
-	mmu_notifier_change_pte(___mm, ___address, ___pte);		\
-	set_pte_at(___mm, ___address, __ptep, ___pte);			\
-})
-
 #else /* CONFIG_MMU_NOTIFIER */
 
 struct mmu_notifier_range {
@@ -650,11 +612,6 @@ static inline int mmu_notifier_test_young(struct mm_struct *mm,
 	return 0;
 }
 
-static inline void mmu_notifier_change_pte(struct mm_struct *mm,
-					   unsigned long address, pte_t pte)
-{
-}
-
 static inline void
 mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
 {
@@ -693,7 +650,6 @@ static inline void mmu_notifier_subscriptions_destroy(struct mm_struct *mm)
 #define	ptep_clear_flush_notify ptep_clear_flush
 #define pmdp_huge_clear_flush_notify pmdp_huge_clear_flush
 #define pudp_huge_clear_flush_notify pudp_huge_clear_flush
-#define set_pte_at_notify set_pte_at
 
 static inline void mmu_notifier_synchronize(void)
 {
@@ -701,4 +657,6 @@ static inline void mmu_notifier_synchronize(void)
 
 #endif /* CONFIG_MMU_NOTIFIER */
 
+#define set_pte_at_notify set_pte_at
+
 #endif /* _LINUX_MMU_NOTIFIER_H */
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index ec3b068cbbe6..8982e6139d07 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -424,23 +424,6 @@ int __mmu_notifier_test_young(struct mm_struct *mm,
 	return young;
 }
 
-void __mmu_notifier_change_pte(struct mm_struct *mm, unsigned long address,
-			       pte_t pte)
-{
-	struct mmu_notifier *subscription;
-	int id;
-
-	id = srcu_read_lock(&srcu);
-	hlist_for_each_entry_rcu(subscription,
-				 &mm->notifier_subscriptions->list, hlist,
-				 srcu_read_lock_held(&srcu)) {
-		if (subscription->ops->change_pte)
-			subscription->ops->change_pte(subscription, mm, address,
-						      pte);
-	}
-	srcu_read_unlock(&srcu, id);
-}
-
 static int mn_itree_invalidate(struct mmu_notifier_subscriptions *subscriptions,
 			       const struct mmu_notifier_range *range)
 {
-- 
2.43.0


