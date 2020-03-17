Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D76B187FF9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 12:06:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hVj117n9zDqG0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 22:06:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Jnp1a/LW; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hVLq49n8zDqcF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 21:50:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584442223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V59E7vNQ/J1sWCSrCuIGfyF/JUs0k+zR/JYAQnnzPbY=;
 b=Jnp1a/LWfhx7gT6hFxPxJ0+MvfNMbAZYlKlKUUpu7WDzkOqBnXkgZAUbkaW4aiOWBwtuKN
 89hjzEgPRNxMHXBWesHxC4NbU3WxP+xXV1fCjj9SnRSgep7h5paMEPumPOC0g8PCJW1OaH
 DMM1845RWhnpxWEMRaFoBc6C4V3QOVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-_1sloA26MUOHIPosJgaWyQ-1; Tue, 17 Mar 2020 06:50:19 -0400
X-MC-Unique: _1sloA26MUOHIPosJgaWyQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2801100550E;
 Tue, 17 Mar 2020 10:50:17 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-136.ams2.redhat.com [10.36.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF30373865;
 Tue, 17 Mar 2020 10:50:14 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] hv_balloon: don't check for memhp_auto_online manually
Date: Tue, 17 Mar 2020 11:49:39 +0100
Message-Id: <20200317104942.11178-6-david@redhat.com>
In-Reply-To: <20200317104942.11178-1-david@redhat.com>
References: <20200317104942.11178-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 Baoquan He <bhe@redhat.com>, David Hildenbrand <david@redhat.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Wei Yang <richard.weiyang@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linuxppc-dev@lists.ozlabs.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We get the MEM_ONLINE notifier call if memory is added right from the
kernel via add_memory() or later from user space.

Let's get rid of the "ha_waiting" flag - the wait event has an inbuilt
mechanism (->done) for that. Initialize the wait event only once and
reinitialize before adding memory. Unconditionally call complete() and
wait_for_completion_timeout().

If there are no waiters, complete() will only increment ->done - which
will be reset by reinit_completion(). If complete() has already been
called, wait_for_completion_timeout() will not wait.

There is still the chance for a small race between concurrent
reinit_completion() and complete(). If complete() wins, we would not
wait - which is tolerable (and the race exists in current code as well).

Note: We only wait for "some" memory to get onlined, which seems to be
      good enough for now.

Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richard.weiyang@gmail.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: linux-hyperv@vger.kernel.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/hv/hv_balloon.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
index a02ce43d778d..af5e09f08130 100644
--- a/drivers/hv/hv_balloon.c
+++ b/drivers/hv/hv_balloon.c
@@ -533,7 +533,6 @@ struct hv_dynmem_device {
 	 * State to synchronize hot-add.
 	 */
 	struct completion  ol_waitevent;
-	bool ha_waiting;
 	/*
 	 * This thread handles hot-add
 	 * requests from the host as well as notifying
@@ -634,10 +633,7 @@ static int hv_memory_notifier(struct notifier_block =
*nb, unsigned long val,
 	switch (val) {
 	case MEM_ONLINE:
 	case MEM_CANCEL_ONLINE:
-		if (dm_device.ha_waiting) {
-			dm_device.ha_waiting =3D false;
-			complete(&dm_device.ol_waitevent);
-		}
+		complete(&dm_device.ol_waitevent);
 		break;
=20
 	case MEM_OFFLINE:
@@ -726,8 +722,7 @@ static void hv_mem_hot_add(unsigned long start, unsig=
ned long size,
 		has->covered_end_pfn +=3D  processed_pfn;
 		spin_unlock_irqrestore(&dm_device.ha_lock, flags);
=20
-		init_completion(&dm_device.ol_waitevent);
-		dm_device.ha_waiting =3D !memhp_auto_online;
+		reinit_completion(&dm_device.ol_waitevent);
=20
 		nid =3D memory_add_physaddr_to_nid(PFN_PHYS(start_pfn));
 		ret =3D add_memory(nid, PFN_PHYS((start_pfn)),
@@ -753,15 +748,14 @@ static void hv_mem_hot_add(unsigned long start, uns=
igned long size,
 		}
=20
 		/*
-		 * Wait for the memory block to be onlined when memory onlining
-		 * is done outside of kernel (memhp_auto_online). Since the hot
-		 * add has succeeded, it is ok to proceed even if the pages in
-		 * the hot added region have not been "onlined" within the
-		 * allowed time.
+		 * Wait for memory to get onlined. If the kernel onlined the
+		 * memory when adding it, this will return directly. Otherwise,
+		 * it will wait for user space to online the memory. This helps
+		 * to avoid adding memory faster than it is getting onlined. As
+		 * adding succeeded, it is ok to proceed even if the memory was
+		 * not onlined in time.
 		 */
-		if (dm_device.ha_waiting)
-			wait_for_completion_timeout(&dm_device.ol_waitevent,
-						    5*HZ);
+		wait_for_completion_timeout(&dm_device.ol_waitevent, 5 * HZ);
 		post_status(&dm_device);
 	}
 }
@@ -1707,6 +1701,7 @@ static int balloon_probe(struct hv_device *dev,
 #ifdef CONFIG_MEMORY_HOTPLUG
 	set_online_page_callback(&hv_online_page);
 	register_memory_notifier(&hv_memory_nb);
+	init_completion(&dm_device.ol_waitevent);
 #endif
=20
 	hv_set_drvdata(dev, &dm_device);
--=20
2.24.1

