Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED0D3C5CB8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 14:58:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNkN550XCz3blB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 22:58:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RMHnwqwy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RMHnwqwy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=RMHnwqwy; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=RMHnwqwy; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNk1L1gjXz2yXy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 22:42:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626093728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JgthilpN6XZFAy+UGPe835lylTvKYfM8g6LSaHbkPeU=;
 b=RMHnwqwyz0jet4Vd+oHM+nw8qUWHuOY1ZSFAlWkGWPPgutu0X1U6DHadq7dku4Az1XCn/A
 iq/A6bb75pIssW+TNjhVNx0+fRoyb4/IbLJZPfyeYuuX6a2KjgHs/0BK24d7OSF5ZDJRJg
 f+1ZZ2ys4cFxpzmagWDOGBhtB3IjwSs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626093728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JgthilpN6XZFAy+UGPe835lylTvKYfM8g6LSaHbkPeU=;
 b=RMHnwqwyz0jet4Vd+oHM+nw8qUWHuOY1ZSFAlWkGWPPgutu0X1U6DHadq7dku4Az1XCn/A
 iq/A6bb75pIssW+TNjhVNx0+fRoyb4/IbLJZPfyeYuuX6a2KjgHs/0BK24d7OSF5ZDJRJg
 f+1ZZ2ys4cFxpzmagWDOGBhtB3IjwSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-3hAqniKNON2zUxKAhWLfZw-1; Mon, 12 Jul 2021 08:42:06 -0400
X-MC-Unique: 3hAqniKNON2zUxKAhWLfZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B87381936B71;
 Mon, 12 Jul 2021 12:42:00 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-111.rdu2.redhat.com [10.10.113.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3670D5C1D1;
 Mon, 12 Jul 2021 12:41:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] mm/memory_hotplug: remove nid parameter from
 arch_remove_memory()
Date: Mon, 12 Jul 2021 14:40:50 +0200
Message-Id: <20210712124052.26491-3-david@redhat.com>
In-Reply-To: <20210712124052.26491-1-david@redhat.com>
References: <20210712124052.26491-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Mailman-Approved-At: Mon, 12 Jul 2021 22:57:40 +1000
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
Cc: Michel Lespinasse <michel@lespinasse.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-ia64@vger.kernel.org,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Rich Felker <dalias@libc.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-s390@vger.kernel.org,
 Laurent Dufour <ldufour@linux.ibm.com>, Dave Jiang <dave.jiang@intel.com>,
 Baoquan He <bhe@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-sh@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Borislav Petkov <bp@alien8.de>,
 Sergei Trofimovich <slyfox@gentoo.org>, Andy Lutomirski <luto@kernel.org>,
 Jia He <justin.he@arm.com>, Dan Williams <dan.j.williams@intel.com>,
 Michal Hocko <mhocko@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pierre Morel <pmorel@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Thomas Gleixner <tglx@linutronix.de>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The parameter is unused, let's remove it.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Cc: Sergei Trofimovich <slyfox@gentoo.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Michel Lespinasse <michel@lespinasse.org>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: Joe Perches <joe@perches.com>
Cc: Pierre Morel <pmorel@linux.ibm.com>
Cc: Jia He <justin.he@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-ia64@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/arm64/mm/mmu.c            | 3 +--
 arch/ia64/mm/init.c            | 3 +--
 arch/powerpc/mm/mem.c          | 3 +--
 arch/s390/mm/init.c            | 3 +--
 arch/sh/mm/init.c              | 3 +--
 arch/x86/mm/init_32.c          | 3 +--
 arch/x86/mm/init_64.c          | 3 +--
 include/linux/memory_hotplug.h | 3 +--
 mm/memory_hotplug.c            | 4 ++--
 mm/memremap.c                  | 5 +----
 10 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index d74586508448..af8ab553a268 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1506,8 +1506,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
 	return ret;
 }
 
-void arch_remove_memory(int nid, u64 start, u64 size,
-			struct vmem_altmap *altmap)
+void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
index 064a967a7b6e..5c6da8d83c1a 100644
--- a/arch/ia64/mm/init.c
+++ b/arch/ia64/mm/init.c
@@ -484,8 +484,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
 	return ret;
 }
 
-void arch_remove_memory(int nid, u64 start, u64 size,
-			struct vmem_altmap *altmap)
+void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index ad198b439222..c3c4e31462ec 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -119,8 +119,7 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
 	return rc;
 }
 
-void __ref arch_remove_memory(int nid, u64 start, u64 size,
-			      struct vmem_altmap *altmap)
+void __ref arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index 8ac710de1ab1..d85bd7f5d8dc 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -306,8 +306,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
 	return rc;
 }
 
-void arch_remove_memory(int nid, u64 start, u64 size,
-			struct vmem_altmap *altmap)
+void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index ce26c7f8950a..506784702430 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -414,8 +414,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
 	return ret;
 }
 
-void arch_remove_memory(int nid, u64 start, u64 size,
-			struct vmem_altmap *altmap)
+void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 {
 	unsigned long start_pfn = PFN_DOWN(start);
 	unsigned long nr_pages = size >> PAGE_SHIFT;
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index 74b78840182d..bd90b8fe81e4 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -801,8 +801,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
 	return __add_pages(nid, start_pfn, nr_pages, params);
 }
 
-void arch_remove_memory(int nid, u64 start, u64 size,
-			struct vmem_altmap *altmap)
+void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index ddeaba947eb3..a6e11763763f 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1255,8 +1255,7 @@ kernel_physical_mapping_remove(unsigned long start, unsigned long end)
 	remove_pagetable(start, end, true, NULL);
 }
 
-void __ref arch_remove_memory(int nid, u64 start, u64 size,
-			      struct vmem_altmap *altmap)
+void __ref arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
 {
 	unsigned long start_pfn = start >> PAGE_SHIFT;
 	unsigned long nr_pages = size >> PAGE_SHIFT;
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index d01b504ce06f..010a192298b5 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -130,8 +130,7 @@ static inline bool movable_node_is_enabled(void)
 	return movable_node_enabled;
 }
 
-extern void arch_remove_memory(int nid, u64 start, u64 size,
-			       struct vmem_altmap *altmap);
+extern void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap);
 extern void __remove_pages(unsigned long start_pfn, unsigned long nr_pages,
 			   struct vmem_altmap *altmap);
 
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 93b3abaf9828..f2a9af3af184 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1106,7 +1106,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	/* create memory block devices after memory was added */
 	ret = create_memory_block_devices(start, size, mhp_altmap.alloc);
 	if (ret) {
-		arch_remove_memory(nid, start, size, NULL);
+		arch_remove_memory(start, size, NULL);
 		goto error;
 	}
 
@@ -1892,7 +1892,7 @@ static int __ref try_remove_memory(int nid, u64 start, u64 size)
 
 	mem_hotplug_begin();
 
-	arch_remove_memory(nid, start, size, altmap);
+	arch_remove_memory(start, size, altmap);
 
 	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
 		memblock_free(start, size);
diff --git a/mm/memremap.c b/mm/memremap.c
index 15a074ffb8d7..ed593bf87109 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -140,14 +140,11 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
 {
 	struct range *range = &pgmap->ranges[range_id];
 	struct page *first_page;
-	int nid;
 
 	/* make sure to access a memmap that was actually initialized */
 	first_page = pfn_to_page(pfn_first(pgmap, range_id));
 
 	/* pages are dead and unused, undo the arch mapping */
-	nid = page_to_nid(first_page);
-
 	mem_hotplug_begin();
 	remove_pfn_range_from_zone(page_zone(first_page), PHYS_PFN(range->start),
 				   PHYS_PFN(range_len(range)));
@@ -155,7 +152,7 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
 		__remove_pages(PHYS_PFN(range->start),
 			       PHYS_PFN(range_len(range)), NULL);
 	} else {
-		arch_remove_memory(nid, range->start, range_len(range),
+		arch_remove_memory(range->start, range_len(range),
 				pgmap_altmap(pgmap));
 		kasan_remove_zero_shadow(__va(range->start), range_len(range));
 	}
-- 
2.31.1

