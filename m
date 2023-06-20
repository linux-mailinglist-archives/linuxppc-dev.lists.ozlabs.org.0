Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC770736FCF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 17:07:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KYoKKh3v;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BlwY8o85;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qlqk45X3lz3dST
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 01:07:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KYoKKh3v;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BlwY8o85;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=ypodemsk@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlqd50YkCz3cRN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 01:03:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687273075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMVWP9uUwreYp41lBQlzx9rQqv8YUX+d+4RkZ35R+cQ=;
	b=KYoKKh3v/VZH1L0TW+/ZULfh7LDh/wixi3ybrqqbuoLS9i5Z+KmNGcrIvJLunTaYcgtYuC
	D3dSWdYCKXYNe486IGv783o0s9+/yRa23QetyBFlZ2lzF6vWUQPOE2k3goWzO4xF9LIwbz
	k+9jOEHDia7ej/rrlfKqrVQULRpdx1U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687273379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMVWP9uUwreYp41lBQlzx9rQqv8YUX+d+4RkZ35R+cQ=;
	b=BlwY8o85KHDHYi9SNt3J3Zv8rM18ksXT/7RXjiWUe6BCwtzp9YON4C1V8FSiUqTfyKTStg
	EfyaERVEj2/ha4Dk3SZG040dJ6hdAlVb8TWC4UloPHDK0BndrU1DZuGespYEdAoX01bDFk
	l47egin5UHEQBTVJVM1fXLRSt+dF5hU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-PGZ8P0JHPzaSP3c_R985HA-1; Tue, 20 Jun 2023 10:54:43 -0400
X-MC-Unique: PGZ8P0JHPzaSP3c_R985HA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFAFA18E0072;
	Tue, 20 Jun 2023 14:46:51 +0000 (UTC)
Received: from ypodemsk.tlv.csb (unknown [10.39.195.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E04889E9C;
	Tue, 20 Jun 2023 14:46:42 +0000 (UTC)
From: Yair Podemsky <ypodemsk@redhat.com>
To: mtosatti@redhat.com,
	ppandit@redhat.com,
	david@redhat.com,
	linux@armlinux.org.uk,
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
	hpa@zytor.com,
	keescook@chromium.org,
	paulmck@kernel.org,
	frederic@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	ardb@kernel.org,
	samitolvanen@google.com,
	juerg.haefliger@canonical.com,
	arnd@arndb.de,
	rmk+kernel@armlinux.org.uk,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	akpm@linux-foundation.org,
	sebastian.reichel@collabora.com,
	rppt@kernel.org,
	aneesh.kumar@linux.ibm.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mm/mmu_gather: send tlb_remove_table_smp_sync IPI only to MM CPUs
Date: Tue, 20 Jun 2023 17:46:18 +0300
Message-Id: <20230620144618.125703-3-ypodemsk@redhat.com>
In-Reply-To: <20230620144618.125703-1-ypodemsk@redhat.com>
References: <20230620144618.125703-1-ypodemsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: ypodemsk@redhat.com
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
index 6b9d39d65b73..3e5cb079d268 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1166,7 +1166,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 	_pmd = pmdp_collapse_flush(vma, address, pmd);
 	spin_unlock(pmd_ptl);
 	mmu_notifier_invalidate_range_end(&range);
-	tlb_remove_table_sync_one();
+	tlb_remove_table_sync_one(mm);
 
 	spin_lock(pte_ptl);
 	result =  __collapse_huge_page_isolate(vma, address, pte, cc,
@@ -1525,7 +1525,7 @@ static void collapse_and_free_pmd(struct mm_struct *mm, struct vm_area_struct *v
 				addr + HPAGE_PMD_SIZE);
 	mmu_notifier_invalidate_range_start(&range);
 	pmd = pmdp_collapse_flush(vma, addr, pmdp);
-	tlb_remove_table_sync_one();
+	tlb_remove_table_sync_one(mm);
 	mmu_notifier_invalidate_range_end(&range);
 	mm_dec_nr_ptes(mm);
 	page_table_check_pte_clear_range(mm, addr, pmd);
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index ea9683e12936..692d8175a88e 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -191,7 +191,13 @@ static void tlb_remove_table_smp_sync(void *arg)
 	/* Simply deliver the interrupt */
 }
 
-void tlb_remove_table_sync_one(void)
+#ifdef CONFIG_ARCH_HAS_CPUMASK_BITS
+#define REMOVE_TABLE_IPI_MASK mm_cpumask(mm)
+#else
+#define REMOVE_TABLE_IPI_MASK cpu_online_mask
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
---
v2: replaced no REMOVE_TABLE_IPI_MASK REMOVE_TABLE_IPI_MASK to cpu_online_mask
-- 
2.39.3

