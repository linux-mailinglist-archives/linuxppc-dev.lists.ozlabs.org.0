Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2472EB33B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 15:54:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473pHw4HL0zF5tH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 01:54:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="flrzH+Pg"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473nmM29wdzF5nL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 01:30:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572532224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+MquLFtj1tdbsSkS8Es6gRK3X9epZedepDGQ07loiw=;
 b=flrzH+PgHYmRcec94EvyG2s0/mMkkNP2h03kDYOq4JpTzr5df/ufBKhEguTf98b/wH2y26
 POByReVmwozC9TCH4KeRdpkXOfKticn8LMDeG3X/KbDgej2Ebg799vbgbKo43G1j4bD+NW
 gfAJpuIful5N6xok3OTNXYhF4o+mfOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-tV0WuhMWO06oxQN3VRGbTw-1; Thu, 31 Oct 2019 10:30:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52A94800D49;
 Thu, 31 Oct 2019 14:30:19 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 146FB5D6D6;
 Thu, 31 Oct 2019 14:30:06 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/12] powerpc/pseries: CMM: Rip out memory isolate notifier
Date: Thu, 31 Oct 2019 15:29:27 +0100
Message-Id: <20191031142933.10779-7-david@redhat.com>
In-Reply-To: <20191031142933.10779-1-david@redhat.com>
References: <20191031142933.10779-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: tV0WuhMWO06oxQN3VRGbTw-1
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

The memory isolate notifier was added to allow to offline memory blocks
that contain inflated/"loaned" pages. We can achieve the same using the
balloon compaction framework.

Get rid of the memory isolate notifier. Also, we can get rid of
cmm_mem_going_offline(), as we will never reach that code path now when
we have allocated memory in the balloon (allocated pages are unmovable and
will no longer be special-cased using the memory isolation notifier).

Leave the memory notifier in place, so we can still back off in case
memory gets offlined.

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
 arch/powerpc/platforms/pseries/cmm.c | 97 +---------------------------
 1 file changed, 1 insertion(+), 96 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/=
pseries/cmm.c
index f82c468ca2c4..29416b621189 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -38,12 +38,8 @@
 #define CMM_MIN_MEM_MB=09=09256
 #define KB2PAGES(_p)=09=09((_p)>>(PAGE_SHIFT-10))
 #define PAGES2KB(_p)=09=09((_p)<<(PAGE_SHIFT-10))
-/*
- * The priority level tries to ensure that this notifier is called as
- * late as possible to reduce thrashing in the shared memory pool.
- */
+
 #define CMM_MEM_HOTPLUG_PRI=091
-#define CMM_MEM_ISOLATE_PRI=0915
=20
 static unsigned int delay =3D CMM_DEFAULT_DELAY;
 static unsigned int hotplug_delay =3D CMM_HOTPLUG_DELAY;
@@ -446,90 +442,6 @@ static struct notifier_block cmm_reboot_nb =3D {
 =09.notifier_call =3D cmm_reboot_notifier,
 };
=20
-/**
- * cmm_count_pages - Count the number of pages loaned in a particular rang=
e.
- *
- * @arg: memory_isolate_notify structure with address range and count
- *
- * Return value:
- *      0 on success
- **/
-static unsigned long cmm_count_pages(void *arg)
-{
-=09struct memory_isolate_notify *marg =3D arg;
-=09struct page *page;
-
-=09spin_lock(&cmm_lock);
-=09list_for_each_entry(page, &cmm_page_list, lru) {
-=09=09if (page_to_pfn(page) >=3D marg->start_pfn &&
-=09=09    page_to_pfn(page) < marg->start_pfn + marg->nr_pages)
-=09=09=09marg->pages_found++;
-=09}
-=09spin_unlock(&cmm_lock);
-=09return 0;
-}
-
-/**
- * cmm_memory_isolate_cb - Handle memory isolation notifier calls
- * @self:=09notifier block struct
- * @action:=09action to take
- * @arg:=09struct memory_isolate_notify data for handler
- *
- * Return value:
- *=09NOTIFY_OK or notifier error based on subfunction return value
- **/
-static int cmm_memory_isolate_cb(struct notifier_block *self,
-=09=09=09=09 unsigned long action, void *arg)
-{
-=09int ret =3D 0;
-
-=09if (action =3D=3D MEM_ISOLATE_COUNT)
-=09=09ret =3D cmm_count_pages(arg);
-
-=09return notifier_from_errno(ret);
-}
-
-static struct notifier_block cmm_mem_isolate_nb =3D {
-=09.notifier_call =3D cmm_memory_isolate_cb,
-=09.priority =3D CMM_MEM_ISOLATE_PRI
-};
-
-/**
- * cmm_mem_going_offline - Unloan pages where memory is to be removed
- * @arg: memory_notify structure with page range to be offlined
- *
- * Return value:
- *=090 on success
- **/
-static int cmm_mem_going_offline(void *arg)
-{
-=09struct memory_notify *marg =3D arg;
-=09struct page *page, *tmp;
-=09unsigned long freed =3D 0;
-
-=09cmm_dbg("Memory going offline, searching PFN 0x%lx (%ld pages).\n",
-=09=09marg->start_pfn, marg->nr_pages);
-=09spin_lock(&cmm_lock);
-
-=09/* Search the page list for pages in the range to be offlined */
-=09list_for_each_entry_safe(page, tmp, &cmm_page_list, lru) {
-=09=09if (page_to_pfn(page) < marg->start_pfn ||
-=09=09    page_to_pfn(page) >=3D marg->start_pfn + marg->nr_pages)
-=09=09=09continue;
-=09=09plpar_page_set_active(page);
-=09=09list_del(&page->lru);
-=09=09adjust_managed_page_count(page, 1);
-=09=09__free_page(page);
-=09=09freed++;
-=09=09loaned_pages--;
-=09}
-
-=09spin_unlock(&cmm_lock);
-=09cmm_dbg("Released %ld pages in the search range.\n", freed);
-
-=09return 0;
-}
-
 /**
  * cmm_memory_cb - Handle memory hotplug notifier calls
  * @self:=09notifier block struct
@@ -549,7 +461,6 @@ static int cmm_memory_cb(struct notifier_block *self,
 =09case MEM_GOING_OFFLINE:
 =09=09mutex_lock(&hotplug_mutex);
 =09=09hotplug_occurred =3D 1;
-=09=09ret =3D cmm_mem_going_offline(arg);
 =09=09break;
 =09case MEM_OFFLINE:
 =09case MEM_CANCEL_OFFLINE:
@@ -596,10 +507,6 @@ static int cmm_init(void)
 =09if (rc)
 =09=09goto out_unregister_notifier;
=20
-=09rc =3D register_memory_isolate_notifier(&cmm_mem_isolate_nb);
-=09if (rc)
-=09=09goto out_unregister_notifier;
-
 =09if (cmm_disabled)
 =09=09return 0;
=20
@@ -612,7 +519,6 @@ static int cmm_init(void)
 =09return 0;
 out_unregister_notifier:
 =09unregister_memory_notifier(&cmm_mem_nb);
-=09unregister_memory_isolate_notifier(&cmm_mem_isolate_nb);
 =09cmm_unregister_sysfs(&cmm_dev);
 out_reboot_notifier:
 =09unregister_reboot_notifier(&cmm_reboot_nb);
@@ -634,7 +540,6 @@ static void cmm_exit(void)
 =09unregister_oom_notifier(&cmm_oom_nb);
 =09unregister_reboot_notifier(&cmm_reboot_nb);
 =09unregister_memory_notifier(&cmm_mem_nb);
-=09unregister_memory_isolate_notifier(&cmm_mem_isolate_nb);
 =09cmm_free_pages(loaned_pages);
 =09cmm_unregister_sysfs(&cmm_dev);
 }
--=20
2.21.0

