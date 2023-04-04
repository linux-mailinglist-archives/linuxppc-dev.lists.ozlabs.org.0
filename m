Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6306D71ED
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 03:19:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Prmxh6F9mz3fRv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 11:19:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gg1Iu/u0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gg1Iu/u0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=ypodemsk@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gg1Iu/u0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gg1Iu/u0;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrTVT34crz3bYW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 23:43:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680615790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=98dFpManPARgksa4GjoMPiRXPOJRbGoDK3gntpYc2e0=;
	b=gg1Iu/u0HbSP7KBLpYcpTxs24v0hvoOowo1jF4Ot9giP9ttkFkGtHtQVVvRFd+RDrj3Kwk
	xPqFncNm2pWhlKG4/zbRbD241F5Sf0MG0k7aLr7xKOncrWsR0L20C9AKpUfP+qVU++JQER
	pAb+JtGSciykdS19Pj+fBsAH4IPKf7E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680615790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=98dFpManPARgksa4GjoMPiRXPOJRbGoDK3gntpYc2e0=;
	b=gg1Iu/u0HbSP7KBLpYcpTxs24v0hvoOowo1jF4Ot9giP9ttkFkGtHtQVVvRFd+RDrj3Kwk
	xPqFncNm2pWhlKG4/zbRbD241F5Sf0MG0k7aLr7xKOncrWsR0L20C9AKpUfP+qVU++JQER
	pAb+JtGSciykdS19Pj+fBsAH4IPKf7E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-C67ab_qpOfSKsM99qL632Q-1; Tue, 04 Apr 2023 09:43:07 -0400
X-MC-Unique: C67ab_qpOfSKsM99qL632Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E405101A553;
	Tue,  4 Apr 2023 13:43:05 +0000 (UTC)
Received: from ypodemsk.tlv.csb (unknown [10.39.194.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C2282166B26;
	Tue,  4 Apr 2023 13:42:57 +0000 (UTC)
From: Yair Podemsky <ypodemsk@redhat.com>
To: linux@armlinux.org.uk,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	will@kernel.org,
	aneesh.kumar@linux.ibm.com,
	akpm@linux-foundation.org,
	peterz@infradead.org,
	arnd@arndb.de,
	keescook@chromium.org,
	paulmck@kernel.org,
	jpoimboe@kernel.org,
	samitolvanen@google.com,
	frederic@kernel.org,
	ardb@kernel.org,
	juerg.haefliger@canonical.com,
	rmk+kernel@armlinux.org.uk,
	geert+renesas@glider.be,
	tony@atomide.com,
	linus.walleij@linaro.org,
	sebastian.reichel@collabora.com,
	nick.hawkins@hpe.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	mtosatti@redhat.com,
	vschneid@redhat.com,
	dhildenb@redhat.com
Subject: [PATCH 2/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI only to MM CPUs
Date: Tue,  4 Apr 2023 16:42:23 +0300
Message-Id: <20230404134224.137038-3-ypodemsk@redhat.com>
In-Reply-To: <20230404134224.137038-1-ypodemsk@redhat.com>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Wed, 05 Apr 2023 11:17:04 +1000
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
Cc: alougovs@redhat.com, ypodemsk@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the tlb_remove_table_smp_sync IPI is sent to all CPUs
indiscriminately, this causes unnecessary work and delays notable in
real-time use-cases and isolated cpus.
This patch will limit this IPI on systems with ARCH_HAS_CPUMASK_BITS,
Where the IPI will only be sent to cpus referencing the affected mm.

Signed-off-by: Yair Podemsky <ypodemsk@redhat.com>
Suggested-by: David Hildenbrand <david@redhat.com>
---
 include/asm-generic/tlb.h |  4 ++--
 mm/khugepaged.c           |  4 ++--
 mm/mmu_gather.c           | 17 ++++++++++++-----
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index b46617207c93..0b6ba17cc8d3 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -222,7 +222,7 @@ extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
 #define tlb_needs_table_invalidate() (true)
 #endif
 
-void tlb_remove_table_sync_one(void);
+void tlb_remove_table_sync_one(struct mm_struct *mm);
 
 #else
 
@@ -230,7 +230,7 @@ void tlb_remove_table_sync_one(void);
 #error tlb_needs_table_invalidate() requires MMU_GATHER_RCU_TABLE_FREE
 #endif
 
-static inline void tlb_remove_table_sync_one(void) { }
+static inline void tlb_remove_table_sync_one(struct mm_struct *mm) { }
 
 #endif /* CONFIG_MMU_GATHER_RCU_TABLE_FREE */
 
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 92e6f56a932d..2b4e6ca1f38e 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1070,7 +1070,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 	_pmd = pmdp_collapse_flush(vma, address, pmd);
 	spin_unlock(pmd_ptl);
 	mmu_notifier_invalidate_range_end(&range);
-	tlb_remove_table_sync_one();
+	tlb_remove_table_sync_one(mm);
 
 	spin_lock(pte_ptl);
 	result =  __collapse_huge_page_isolate(vma, address, pte, cc,
@@ -1427,7 +1427,7 @@ static void collapse_and_free_pmd(struct mm_struct *mm, struct vm_area_struct *v
 				addr + HPAGE_PMD_SIZE);
 	mmu_notifier_invalidate_range_start(&range);
 	pmd = pmdp_collapse_flush(vma, addr, pmdp);
-	tlb_remove_table_sync_one();
+	tlb_remove_table_sync_one(mm);
 	mmu_notifier_invalidate_range_end(&range);
 	mm_dec_nr_ptes(mm);
 	page_table_check_pte_clear_range(mm, addr, pmd);
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index 2b93cf6ac9ae..5ea9be6fb87c 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -191,7 +191,13 @@ static void tlb_remove_table_smp_sync(void *arg)
 	/* Simply deliver the interrupt */
 }
 
-void tlb_remove_table_sync_one(void)
+#ifdef CONFIG_ARCH_HAS_CPUMASK_BITS
+#define REMOVE_TABLE_IPI_MASK mm_cpumask(mm)
+#else
+#define REMOVE_TABLE_IPI_MASK NULL
+#endif /* CONFIG_ARCH_HAS_CPUMASK_BITS */
+
+void tlb_remove_table_sync_one(struct mm_struct *mm)
 {
 	/*
 	 * This isn't an RCU grace period and hence the page-tables cannot be
@@ -200,7 +206,8 @@ void tlb_remove_table_sync_one(void)
 	 * It is however sufficient for software page-table walkers that rely on
 	 * IRQ disabling.
 	 */
-	smp_call_function(tlb_remove_table_smp_sync, NULL, 1);
+	on_each_cpu_mask(REMOVE_TABLE_IPI_MASK, tlb_remove_table_smp_sync,
+			NULL, true);
 }
 
 static void tlb_remove_table_rcu(struct rcu_head *head)
@@ -237,9 +244,9 @@ static inline void tlb_table_invalidate(struct mmu_gather *tlb)
 	}
 }
 
-static void tlb_remove_table_one(void *table)
+static void tlb_remove_table_one(struct mm_struct *mm, void *table)
 {
-	tlb_remove_table_sync_one();
+	tlb_remove_table_sync_one(mm);
 	__tlb_remove_table(table);
 }
 
@@ -262,7 +269,7 @@ void tlb_remove_table(struct mmu_gather *tlb, void *table)
 		*batch = (struct mmu_table_batch *)__get_free_page(GFP_NOWAIT | __GFP_NOWARN);
 		if (*batch == NULL) {
 			tlb_table_invalidate(tlb);
-			tlb_remove_table_one(table);
+			tlb_remove_table_one(tlb->mm, table);
 			return;
 		}
 		(*batch)->nr = 0;
-- 
2.31.1

