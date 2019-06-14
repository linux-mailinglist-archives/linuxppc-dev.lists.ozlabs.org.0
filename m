Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E553459E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 12:04:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QGR06VBkzDrYb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 20:03:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QGNd5m9GzDrTK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 20:01:50 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6C2B1356DA;
 Fri, 14 Jun 2019 10:01:42 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-252.ams2.redhat.com [10.36.116.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC6615D9D2;
 Fri, 14 Jun 2019 10:01:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/6] mm: Section numbers use the type "unsigned long"
Date: Fri, 14 Jun 2019 12:01:09 +0200
Message-Id: <20190614100114.311-2-david@redhat.com>
In-Reply-To: <20190614100114.311-1-david@redhat.com>
References: <20190614100114.311-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 14 Jun 2019 10:01:42 +0000 (UTC)
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Hocko <mhocko@suse.com>,
 Pavel Tatashin <pasha.tatashin@oracle.com>, Baoquan He <bhe@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Mel Gorman <mgorman@techsingularity.net>, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, linux-acpi@vger.kernel.org,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Arun KS <arunks@codeaurora.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We are using a mixture of "int" and "unsigned long". Let's make this
consistent by using "unsigned long" everywhere. We'll do the same with
memory block ids next.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Wei Yang <richard.weiyang@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Arun KS <arunks@codeaurora.org>
Cc: Pavel Tatashin <pasha.tatashin@oracle.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: Baoquan He <bhe@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/base/memory.c  |  9 +++++----
 include/linux/mmzone.h |  4 ++--
 mm/sparse.c            | 12 ++++++------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 826dd76f662e..5b3a2fd250ba 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -34,7 +34,7 @@ static DEFINE_MUTEX(mem_sysfs_mutex);
 
 static int sections_per_block;
 
-static inline int base_memory_block_id(int section_nr)
+static inline int base_memory_block_id(unsigned long section_nr)
 {
 	return section_nr / sections_per_block;
 }
@@ -691,10 +691,11 @@ static int init_memory_block(struct memory_block **memory, int block_id,
 	return ret;
 }
 
-static int add_memory_block(int base_section_nr)
+static int add_memory_block(unsigned long base_section_nr)
 {
+	int ret, section_count = 0;
 	struct memory_block *mem;
-	int i, ret, section_count = 0;
+	unsigned long i;
 
 	for (i = base_section_nr;
 	     i < base_section_nr + sections_per_block;
@@ -822,7 +823,7 @@ static const struct attribute_group *memory_root_attr_groups[] = {
  */
 int __init memory_dev_init(void)
 {
-	unsigned int i;
+	unsigned long i;
 	int ret;
 	int err;
 	unsigned long block_sz;
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 427b79c39b3c..83b6aae16f13 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1220,7 +1220,7 @@ static inline struct mem_section *__nr_to_section(unsigned long nr)
 		return NULL;
 	return &mem_section[SECTION_NR_TO_ROOT(nr)][nr & SECTION_ROOT_MASK];
 }
-extern int __section_nr(struct mem_section* ms);
+extern unsigned long __section_nr(struct mem_section *ms);
 extern unsigned long usemap_size(void);
 
 /*
@@ -1292,7 +1292,7 @@ static inline struct mem_section *__pfn_to_section(unsigned long pfn)
 	return __nr_to_section(pfn_to_section_nr(pfn));
 }
 
-extern int __highest_present_section_nr;
+extern unsigned long __highest_present_section_nr;
 
 #ifndef CONFIG_HAVE_ARCH_PFN_VALID
 static inline int pfn_valid(unsigned long pfn)
diff --git a/mm/sparse.c b/mm/sparse.c
index 1552c855d62a..e8c57e039be8 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -102,7 +102,7 @@ static inline int sparse_index_init(unsigned long section_nr, int nid)
 #endif
 
 #ifdef CONFIG_SPARSEMEM_EXTREME
-int __section_nr(struct mem_section* ms)
+unsigned long __section_nr(struct mem_section *ms)
 {
 	unsigned long root_nr;
 	struct mem_section *root = NULL;
@@ -121,9 +121,9 @@ int __section_nr(struct mem_section* ms)
 	return (root_nr * SECTIONS_PER_ROOT) + (ms - root);
 }
 #else
-int __section_nr(struct mem_section* ms)
+unsigned long __section_nr(struct mem_section *ms)
 {
-	return (int)(ms - mem_section[0]);
+	return (unsigned long)(ms - mem_section[0]);
 }
 #endif
 
@@ -178,10 +178,10 @@ void __meminit mminit_validate_memmodel_limits(unsigned long *start_pfn,
  * Keeping track of this gives us an easy way to break out of
  * those loops early.
  */
-int __highest_present_section_nr;
+unsigned long __highest_present_section_nr;
 static void section_mark_present(struct mem_section *ms)
 {
-	int section_nr = __section_nr(ms);
+	unsigned long section_nr = __section_nr(ms);
 
 	if (section_nr > __highest_present_section_nr)
 		__highest_present_section_nr = section_nr;
@@ -189,7 +189,7 @@ static void section_mark_present(struct mem_section *ms)
 	ms->section_mem_map |= SECTION_MARKED_PRESENT;
 }
 
-static inline int next_present_section_nr(int section_nr)
+static inline unsigned long next_present_section_nr(unsigned long section_nr)
 {
 	do {
 		section_nr++;
-- 
2.21.0

