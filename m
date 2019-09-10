Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC975AEFC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 18:41:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SW5L0JDqzF1Sm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 02:41:42 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SW324CdbzDrBl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 02:39:40 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A6DA837E79;
 Tue, 10 Sep 2019 16:39:38 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-108.ams2.redhat.com [10.36.116.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6855060BF3;
 Tue, 10 Sep 2019 16:39:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1] powerpc/pseries: CMM: Drop page array
Date: Tue, 10 Sep 2019 18:39:32 +0200
Message-Id: <20190910163932.13160-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 10 Sep 2019 16:39:38 +0000 (UTC)
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
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Arun KS <arunks@codeaurora.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We can simply store the pages in a list (page->lru), no need for a
separate data structure (+ complicated handling). This is how most
other balloon drivers store allocated pages without additional tracking
data.

For the notifiers, use page_to_pfn() to check if a page is in the
applicable range. plpar_page_set_loaned()/plpar_page_set_active() were
called with __pa(page_address()) for now, I assume we can simply switch
to page_to_phys() here. The pfn_to_kaddr() handling is now mostly gone.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Arun KS <arunks@codeaurora.org>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

Only compile-tested. I hope the page_to_phys() thingy is correct and I
didn't mess up something else / ignoring something important why the array
is needed.

I stumbled over this while looking at how the memory isolation notifier is
used - and wondered why the additional array is necessary. Also, I think
by switching to the generic balloon compaction mechanism, we could get
rid of the memory hotplug notifier and the memory isolation notifier in
this code, as the migration capability of the inflated pages is the real
requirement:
	commit 14b8a76b9d53346f2871bf419da2aaf219940c50
	Author: Robert Jennings <rcj@linux.vnet.ibm.com>
	Date:   Thu Dec 17 14:44:52 2009 +0000
	
	    powerpc: Make the CMM memory hotplug aware
	
	    The Collaborative Memory Manager (CMM) module allocates individual pages
	    over time that are not migratable.  On a long running system this can
	    severely impact the ability to find enough pages to support a hotplug
	    memory remove operation.
	[...]

Thoughts?

---
 arch/powerpc/platforms/pseries/cmm.c | 155 ++++++---------------------
 1 file changed, 31 insertions(+), 124 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index b33251d75927..9cab34a667bf 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -75,21 +75,13 @@ module_param_named(debug, cmm_debug, uint, 0644);
 MODULE_PARM_DESC(debug, "Enable module debugging logging. Set to 1 to enable. "
 		 "[Default=" __stringify(CMM_DEBUG) "]");
 
-#define CMM_NR_PAGES ((PAGE_SIZE - sizeof(void *) - sizeof(unsigned long)) / sizeof(unsigned long))
-
 #define cmm_dbg(...) if (cmm_debug) { printk(KERN_INFO "cmm: "__VA_ARGS__); }
 
-struct cmm_page_array {
-	struct cmm_page_array *next;
-	unsigned long index;
-	unsigned long page[CMM_NR_PAGES];
-};
-
 static unsigned long loaned_pages;
 static unsigned long loaned_pages_target;
 static unsigned long oom_freed_pages;
 
-static struct cmm_page_array *cmm_page_list;
+static LIST_HEAD(cmm_page_list);
 static DEFINE_SPINLOCK(cmm_lock);
 
 static DEFINE_MUTEX(hotplug_mutex);
@@ -138,8 +130,7 @@ static long plpar_page_set_active(unsigned long vpa)
  **/
 static long cmm_alloc_pages(long nr)
 {
-	struct cmm_page_array *pa, *npa;
-	unsigned long addr;
+	struct page *page;
 	long rc;
 
 	cmm_dbg("Begin request for %ld pages\n", nr);
@@ -156,43 +147,20 @@ static long cmm_alloc_pages(long nr)
 			break;
 		}
 
-		addr = __get_free_page(GFP_NOIO | __GFP_NOWARN |
-				       __GFP_NORETRY | __GFP_NOMEMALLOC);
-		if (!addr)
+		page = alloc_page(GFP_NOIO | __GFP_NOWARN | __GFP_NORETRY |
+				  __GFP_NOMEMALLOC);
+		if (!page)
 			break;
 		spin_lock(&cmm_lock);
-		pa = cmm_page_list;
-		if (!pa || pa->index >= CMM_NR_PAGES) {
-			/* Need a new page for the page list. */
-			spin_unlock(&cmm_lock);
-			npa = (struct cmm_page_array *)__get_free_page(
-					GFP_NOIO | __GFP_NOWARN |
-					__GFP_NORETRY | __GFP_NOMEMALLOC);
-			if (!npa) {
-				pr_info("%s: Can not allocate new page list\n", __func__);
-				free_page(addr);
-				break;
-			}
-			spin_lock(&cmm_lock);
-			pa = cmm_page_list;
-
-			if (!pa || pa->index >= CMM_NR_PAGES) {
-				npa->next = pa;
-				npa->index = 0;
-				pa = npa;
-				cmm_page_list = pa;
-			} else
-				free_page((unsigned long) npa);
-		}
-
-		if ((rc = plpar_page_set_loaned(__pa(addr)))) {
+		rc = plpar_page_set_loaned(page_to_phys(page));
+		if (rc) {
 			pr_err("%s: Can not set page to loaned. rc=%ld\n", __func__, rc);
 			spin_unlock(&cmm_lock);
-			free_page(addr);
+			__free_page(page);
 			break;
 		}
 
-		pa->page[pa->index++] = addr;
+		list_add(&page->lru, &cmm_page_list);
 		loaned_pages++;
 		totalram_pages_dec();
 		spin_unlock(&cmm_lock);
@@ -212,25 +180,16 @@ static long cmm_alloc_pages(long nr)
  **/
 static long cmm_free_pages(long nr)
 {
-	struct cmm_page_array *pa;
-	unsigned long addr;
+	struct page *page, *tmp;
 
 	cmm_dbg("Begin free of %ld pages.\n", nr);
 	spin_lock(&cmm_lock);
-	pa = cmm_page_list;
-	while (nr) {
-		if (!pa || pa->index <= 0)
+	list_for_each_entry_safe(page, tmp, &cmm_page_list, lru) {
+		if (!nr)
 			break;
-		addr = pa->page[--pa->index];
-
-		if (pa->index == 0) {
-			pa = pa->next;
-			free_page((unsigned long) cmm_page_list);
-			cmm_page_list = pa;
-		}
-
-		plpar_page_set_active(__pa(addr));
-		free_page(addr);
+		plpar_page_set_active(page_to_phys(page));
+		list_del(&page->lru);
+		__free_page(page);
 		loaned_pages--;
 		nr--;
 		totalram_pages_inc();
@@ -491,20 +450,13 @@ static struct notifier_block cmm_reboot_nb = {
 static unsigned long cmm_count_pages(void *arg)
 {
 	struct memory_isolate_notify *marg = arg;
-	struct cmm_page_array *pa;
-	unsigned long start = (unsigned long)pfn_to_kaddr(marg->start_pfn);
-	unsigned long end = start + (marg->nr_pages << PAGE_SHIFT);
-	unsigned long idx;
+	struct page *page;
 
 	spin_lock(&cmm_lock);
-	pa = cmm_page_list;
-	while (pa) {
-		if ((unsigned long)pa >= start && (unsigned long)pa < end)
+	list_for_each_entry(page, &cmm_page_list, lru) {
+		if (page_to_pfn(page) >= marg->start_pfn &&
+		    page_to_pfn(page) < marg->start_pfn + marg->nr_pages)
 			marg->pages_found++;
-		for (idx = 0; idx < pa->index; idx++)
-			if (pa->page[idx] >= start && pa->page[idx] < end)
-				marg->pages_found++;
-		pa = pa->next;
 	}
 	spin_unlock(&cmm_lock);
 	return 0;
@@ -545,69 +497,24 @@ static struct notifier_block cmm_mem_isolate_nb = {
 static int cmm_mem_going_offline(void *arg)
 {
 	struct memory_notify *marg = arg;
-	unsigned long start_page = (unsigned long)pfn_to_kaddr(marg->start_pfn);
-	unsigned long end_page = start_page + (marg->nr_pages << PAGE_SHIFT);
-	struct cmm_page_array *pa_curr, *pa_last, *npa;
-	unsigned long idx;
+	struct page *page, *tmp;
 	unsigned long freed = 0;
 
 	cmm_dbg("Memory going offline, searching 0x%lx (%ld pages).\n",
-			start_page, marg->nr_pages);
+		(unsigned long)pfn_to_kaddr(marg->start_pfn), marg->nr_pages);
 	spin_lock(&cmm_lock);
 
 	/* Search the page list for pages in the range to be offlined */
-	pa_last = pa_curr = cmm_page_list;
-	while (pa_curr) {
-		for (idx = (pa_curr->index - 1); (idx + 1) > 0; idx--) {
-			if ((pa_curr->page[idx] < start_page) ||
-			    (pa_curr->page[idx] >= end_page))
-				continue;
-
-			plpar_page_set_active(__pa(pa_curr->page[idx]));
-			free_page(pa_curr->page[idx]);
-			freed++;
-			loaned_pages--;
-			totalram_pages_inc();
-			pa_curr->page[idx] = pa_last->page[--pa_last->index];
-			if (pa_last->index == 0) {
-				if (pa_curr == pa_last)
-					pa_curr = pa_last->next;
-				pa_last = pa_last->next;
-				free_page((unsigned long)cmm_page_list);
-				cmm_page_list = pa_last;
-			}
-		}
-		pa_curr = pa_curr->next;
-	}
-
-	/* Search for page list structures in the range to be offlined */
-	pa_last = NULL;
-	pa_curr = cmm_page_list;
-	while (pa_curr) {
-		if (((unsigned long)pa_curr >= start_page) &&
-				((unsigned long)pa_curr < end_page)) {
-			npa = (struct cmm_page_array *)__get_free_page(
-					GFP_NOIO | __GFP_NOWARN |
-					__GFP_NORETRY | __GFP_NOMEMALLOC);
-			if (!npa) {
-				spin_unlock(&cmm_lock);
-				cmm_dbg("Failed to allocate memory for list "
-						"management. Memory hotplug "
-						"failed.\n");
-				return -ENOMEM;
-			}
-			memcpy(npa, pa_curr, PAGE_SIZE);
-			if (pa_curr == cmm_page_list)
-				cmm_page_list = npa;
-			if (pa_last)
-				pa_last->next = npa;
-			free_page((unsigned long) pa_curr);
-			freed++;
-			pa_curr = npa;
-		}
-
-		pa_last = pa_curr;
-		pa_curr = pa_curr->next;
+	list_for_each_entry_safe(page, tmp, &cmm_page_list, lru) {
+		if (page_to_pfn(page) < marg->start_pfn ||
+		    page_to_pfn(page) >= marg->start_pfn + marg->nr_pages)
+			continue;
+		plpar_page_set_active(page_to_phys(page));
+		list_del(&page->lru);
+		__free_page(page);
+		freed++;
+		loaned_pages--;
+		totalram_pages_inc();
 	}
 
 	spin_unlock(&cmm_lock);
-- 
2.21.0

