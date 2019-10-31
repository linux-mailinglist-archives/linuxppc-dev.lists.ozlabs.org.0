Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBF3EB31E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 15:49:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473pBK0fGJzF5Vr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 01:49:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="isdPTqTH"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473nlx3kxZzF5nL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 01:30:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572532201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHVBGu9CdY7QItoOD6SCu9jnvm9hWb8IWyIPvshQ5ao=;
 b=isdPTqTHRAqVjFxo/TvSwO+t196ks66DijwnY9IvZbDh21LnEvFxFcykZHDCecmi8n0Rv8
 YTSnXFXxb49Opaui2OfVmfRgAvjIA0BGMyRD6g/ilmQnuNM46VCol8Hfe0KYXiPxXg4yZK
 p5/9bZWSoh77eruX/QYb+Q7GdqFKFYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-eH1V_FPVNEGCYp7GXfp4MA-1; Thu, 31 Oct 2019 10:30:00 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F217E1005500;
 Thu, 31 Oct 2019 14:29:58 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F2A05D6D6;
 Thu, 31 Oct 2019 14:29:56 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/12] powerpc/pseries: CMM: Drop page array
Date: Thu, 31 Oct 2019 15:29:25 +0100
Message-Id: <20191031142933.10779-5-david@redhat.com>
In-Reply-To: <20191031142933.10779-1-david@redhat.com>
References: <20191031142933.10779-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: eH1V_FPVNEGCYp7GXfp4MA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
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
 David Hildenbrand <david@redhat.com>, Richard Fontana <rfontana@redhat.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Arun KS <arunks@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We can simply store the pages in a list (page->lru), no need for a
separate data structure (+ complicated handling). This is how most
other balloon drivers store allocated pages without additional tracking
data.

For the notifiers, use page_to_pfn() to check if a page is in the
applicable range. Use page_to_phys() in plpar_page_set_loaned() and
plpar_page_set_active() (I assume due to the __pa() that's the right
thing to do).

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Richard Fontana <rfontana@redhat.com>
Cc: Allison Randal <allison@lohutok.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arun KS <arunks@codeaurora.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/cmm.c | 163 ++++++---------------------
 1 file changed, 36 insertions(+), 127 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/=
pseries/cmm.c
index 738eb1681d40..33d31e48ec15 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -75,21 +75,13 @@ module_param_named(debug, cmm_debug, uint, 0644);
 MODULE_PARM_DESC(debug, "Enable module debugging logging. Set to 1 to enab=
le. "
 =09=09 "[Default=3D" __stringify(CMM_DEBUG) "]");
=20
-#define CMM_NR_PAGES ((PAGE_SIZE - sizeof(void *) - sizeof(unsigned long))=
 / sizeof(unsigned long))
-
 #define cmm_dbg(...) if (cmm_debug) { printk(KERN_INFO "cmm: "__VA_ARGS__)=
; }
=20
-struct cmm_page_array {
-=09struct cmm_page_array *next;
-=09unsigned long index;
-=09unsigned long page[CMM_NR_PAGES];
-};
-
 static unsigned long loaned_pages;
 static unsigned long loaned_pages_target;
 static unsigned long oom_freed_pages;
=20
-static struct cmm_page_array *cmm_page_list;
+static LIST_HEAD(cmm_page_list);
 static DEFINE_SPINLOCK(cmm_lock);
=20
 static DEFINE_MUTEX(hotplug_mutex);
@@ -97,8 +89,9 @@ static int hotplug_occurred; /* protected by the hotplug =
mutex */
=20
 static struct task_struct *cmm_thread_ptr;
=20
-static long plpar_page_set_loaned(unsigned long vpa)
+static long plpar_page_set_loaned(struct page *page)
 {
+=09const unsigned long vpa =3D page_to_phys(page);
 =09unsigned long cmo_page_sz =3D cmo_get_page_size();
 =09long rc =3D 0;
 =09int i;
@@ -113,8 +106,9 @@ static long plpar_page_set_loaned(unsigned long vpa)
 =09return rc;
 }
=20
-static long plpar_page_set_active(unsigned long vpa)
+static long plpar_page_set_active(struct page *page)
 {
+=09const unsigned long vpa =3D page_to_phys(page);
 =09unsigned long cmo_page_sz =3D cmo_get_page_size();
 =09long rc =3D 0;
 =09int i;
@@ -138,8 +132,7 @@ static long plpar_page_set_active(unsigned long vpa)
  **/
 static long cmm_alloc_pages(long nr)
 {
-=09struct cmm_page_array *pa, *npa;
-=09unsigned long addr;
+=09struct page *page;
 =09long rc;
=20
 =09cmm_dbg("Begin request for %ld pages\n", nr);
@@ -156,43 +149,20 @@ static long cmm_alloc_pages(long nr)
 =09=09=09break;
 =09=09}
=20
-=09=09addr =3D __get_free_page(GFP_NOIO | __GFP_NOWARN |
-=09=09=09=09       __GFP_NORETRY | __GFP_NOMEMALLOC);
-=09=09if (!addr)
+=09=09page =3D alloc_page(GFP_NOIO | __GFP_NOWARN | __GFP_NORETRY |
+=09=09=09=09  __GFP_NOMEMALLOC);
+=09=09if (!page)
 =09=09=09break;
 =09=09spin_lock(&cmm_lock);
-=09=09pa =3D cmm_page_list;
-=09=09if (!pa || pa->index >=3D CMM_NR_PAGES) {
-=09=09=09/* Need a new page for the page list. */
-=09=09=09spin_unlock(&cmm_lock);
-=09=09=09npa =3D (struct cmm_page_array *)__get_free_page(
-=09=09=09=09=09GFP_NOIO | __GFP_NOWARN |
-=09=09=09=09=09__GFP_NORETRY | __GFP_NOMEMALLOC);
-=09=09=09if (!npa) {
-=09=09=09=09pr_info("%s: Can not allocate new page list\n", __func__);
-=09=09=09=09free_page(addr);
-=09=09=09=09break;
-=09=09=09}
-=09=09=09spin_lock(&cmm_lock);
-=09=09=09pa =3D cmm_page_list;
-
-=09=09=09if (!pa || pa->index >=3D CMM_NR_PAGES) {
-=09=09=09=09npa->next =3D pa;
-=09=09=09=09npa->index =3D 0;
-=09=09=09=09pa =3D npa;
-=09=09=09=09cmm_page_list =3D pa;
-=09=09=09} else
-=09=09=09=09free_page((unsigned long) npa);
-=09=09}
-
-=09=09if ((rc =3D plpar_page_set_loaned(__pa(addr)))) {
+=09=09rc =3D plpar_page_set_loaned(page);
+=09=09if (rc) {
 =09=09=09pr_err("%s: Can not set page to loaned. rc=3D%ld\n", __func__, rc=
);
 =09=09=09spin_unlock(&cmm_lock);
-=09=09=09free_page(addr);
+=09=09=09__free_page(page);
 =09=09=09break;
 =09=09}
=20
-=09=09pa->page[pa->index++] =3D addr;
+=09=09list_add(&page->lru, &cmm_page_list);
 =09=09loaned_pages++;
 =09=09totalram_pages_dec();
 =09=09spin_unlock(&cmm_lock);
@@ -212,25 +182,16 @@ static long cmm_alloc_pages(long nr)
  **/
 static long cmm_free_pages(long nr)
 {
-=09struct cmm_page_array *pa;
-=09unsigned long addr;
+=09struct page *page, *tmp;
=20
 =09cmm_dbg("Begin free of %ld pages.\n", nr);
 =09spin_lock(&cmm_lock);
-=09pa =3D cmm_page_list;
-=09while (nr) {
-=09=09if (!pa || pa->index <=3D 0)
+=09list_for_each_entry_safe(page, tmp, &cmm_page_list, lru) {
+=09=09if (!nr)
 =09=09=09break;
-=09=09addr =3D pa->page[--pa->index];
-
-=09=09if (pa->index =3D=3D 0) {
-=09=09=09pa =3D pa->next;
-=09=09=09free_page((unsigned long) cmm_page_list);
-=09=09=09cmm_page_list =3D pa;
-=09=09}
-
-=09=09plpar_page_set_active(__pa(addr));
-=09=09free_page(addr);
+=09=09plpar_page_set_active(page);
+=09=09list_del(&page->lru);
+=09=09__free_page(page);
 =09=09loaned_pages--;
 =09=09nr--;
 =09=09totalram_pages_inc();
@@ -496,20 +457,13 @@ static struct notifier_block cmm_reboot_nb =3D {
 static unsigned long cmm_count_pages(void *arg)
 {
 =09struct memory_isolate_notify *marg =3D arg;
-=09struct cmm_page_array *pa;
-=09unsigned long start =3D (unsigned long)pfn_to_kaddr(marg->start_pfn);
-=09unsigned long end =3D start + (marg->nr_pages << PAGE_SHIFT);
-=09unsigned long idx;
+=09struct page *page;
=20
 =09spin_lock(&cmm_lock);
-=09pa =3D cmm_page_list;
-=09while (pa) {
-=09=09if ((unsigned long)pa >=3D start && (unsigned long)pa < end)
+=09list_for_each_entry(page, &cmm_page_list, lru) {
+=09=09if (page_to_pfn(page) >=3D marg->start_pfn &&
+=09=09    page_to_pfn(page) < marg->start_pfn + marg->nr_pages)
 =09=09=09marg->pages_found++;
-=09=09for (idx =3D 0; idx < pa->index; idx++)
-=09=09=09if (pa->page[idx] >=3D start && pa->page[idx] < end)
-=09=09=09=09marg->pages_found++;
-=09=09pa =3D pa->next;
 =09}
 =09spin_unlock(&cmm_lock);
 =09return 0;
@@ -550,69 +504,24 @@ static struct notifier_block cmm_mem_isolate_nb =3D {
 static int cmm_mem_going_offline(void *arg)
 {
 =09struct memory_notify *marg =3D arg;
-=09unsigned long start_page =3D (unsigned long)pfn_to_kaddr(marg->start_pf=
n);
-=09unsigned long end_page =3D start_page + (marg->nr_pages << PAGE_SHIFT);
-=09struct cmm_page_array *pa_curr, *pa_last, *npa;
-=09unsigned long idx;
+=09struct page *page, *tmp;
 =09unsigned long freed =3D 0;
=20
-=09cmm_dbg("Memory going offline, searching 0x%lx (%ld pages).\n",
-=09=09=09start_page, marg->nr_pages);
+=09cmm_dbg("Memory going offline, searching PFN 0x%lx (%ld pages).\n",
+=09=09marg->start_pfn, marg->nr_pages);
 =09spin_lock(&cmm_lock);
=20
 =09/* Search the page list for pages in the range to be offlined */
-=09pa_last =3D pa_curr =3D cmm_page_list;
-=09while (pa_curr) {
-=09=09for (idx =3D (pa_curr->index - 1); (idx + 1) > 0; idx--) {
-=09=09=09if ((pa_curr->page[idx] < start_page) ||
-=09=09=09    (pa_curr->page[idx] >=3D end_page))
-=09=09=09=09continue;
-
-=09=09=09plpar_page_set_active(__pa(pa_curr->page[idx]));
-=09=09=09free_page(pa_curr->page[idx]);
-=09=09=09freed++;
-=09=09=09loaned_pages--;
-=09=09=09totalram_pages_inc();
-=09=09=09pa_curr->page[idx] =3D pa_last->page[--pa_last->index];
-=09=09=09if (pa_last->index =3D=3D 0) {
-=09=09=09=09if (pa_curr =3D=3D pa_last)
-=09=09=09=09=09pa_curr =3D pa_last->next;
-=09=09=09=09pa_last =3D pa_last->next;
-=09=09=09=09free_page((unsigned long)cmm_page_list);
-=09=09=09=09cmm_page_list =3D pa_last;
-=09=09=09}
-=09=09}
-=09=09pa_curr =3D pa_curr->next;
-=09}
-
-=09/* Search for page list structures in the range to be offlined */
-=09pa_last =3D NULL;
-=09pa_curr =3D cmm_page_list;
-=09while (pa_curr) {
-=09=09if (((unsigned long)pa_curr >=3D start_page) &&
-=09=09=09=09((unsigned long)pa_curr < end_page)) {
-=09=09=09npa =3D (struct cmm_page_array *)__get_free_page(
-=09=09=09=09=09GFP_NOIO | __GFP_NOWARN |
-=09=09=09=09=09__GFP_NORETRY | __GFP_NOMEMALLOC);
-=09=09=09if (!npa) {
-=09=09=09=09spin_unlock(&cmm_lock);
-=09=09=09=09cmm_dbg("Failed to allocate memory for list "
-=09=09=09=09=09=09"management. Memory hotplug "
-=09=09=09=09=09=09"failed.\n");
-=09=09=09=09return -ENOMEM;
-=09=09=09}
-=09=09=09memcpy(npa, pa_curr, PAGE_SIZE);
-=09=09=09if (pa_curr =3D=3D cmm_page_list)
-=09=09=09=09cmm_page_list =3D npa;
-=09=09=09if (pa_last)
-=09=09=09=09pa_last->next =3D npa;
-=09=09=09free_page((unsigned long) pa_curr);
-=09=09=09freed++;
-=09=09=09pa_curr =3D npa;
-=09=09}
-
-=09=09pa_last =3D pa_curr;
-=09=09pa_curr =3D pa_curr->next;
+=09list_for_each_entry_safe(page, tmp, &cmm_page_list, lru) {
+=09=09if (page_to_pfn(page) < marg->start_pfn ||
+=09=09    page_to_pfn(page) >=3D marg->start_pfn + marg->nr_pages)
+=09=09=09continue;
+=09=09plpar_page_set_active(page);
+=09=09list_del(&page->lru);
+=09=09__free_page(page);
+=09=09freed++;
+=09=09loaned_pages--;
+=09=09totalram_pages_inc();
 =09}
=20
 =09spin_unlock(&cmm_lock);
--=20
2.21.0

