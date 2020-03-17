Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A6187ECA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 11:55:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hVSB19R7zDqkD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 21:55:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JCg8Nkvh; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hVLQ1j0rzDqcJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 21:50:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584442203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/zIoqC9iuXsa5f8/VSxEZwSGgHlkLg8Xk5BlvkskKTA=;
 b=JCg8NkvhTJAzgT0yctm0naF7VQsG9UUKNb1XuYUynfMl4EAqs3+jncuQcejzdi/fPRXakZ
 IaFJCLLzSNTASVKzf5X2T8MRi8eQ82utjWnZI3YOOoIY0et+hE/E8hlxJsT9g67cyKyJd+
 ADhyhmIIA+o5aESnkDI/EGtm19pxxbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-_Xga-gJhPG62y0Zo0G7AJA-1; Tue, 17 Mar 2020 06:49:59 -0400
X-MC-Unique: _Xga-gJhPG62y0Zo0G7AJA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97A57107ACC4;
 Tue, 17 Mar 2020 10:49:57 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-136.ams2.redhat.com [10.36.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF78673865;
 Tue, 17 Mar 2020 10:49:51 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] drivers/base/memory: rename MMOP_ONLINE_KEEP to
 MMOP_ONLINE
Date: Tue, 17 Mar 2020 11:49:35 +0100
Message-Id: <20200317104942.11178-2-david@redhat.com>
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
Cc: linux-hyperv@vger.kernel.org, Baoquan He <bhe@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The name is misleading and it's not really clear what is "kept". Let's ju=
st
name it like the online_type name we expose to user space ("online").

Add some documentation to the types.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richard.weiyang@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/base/memory.c          | 9 +++++----
 include/linux/memory_hotplug.h | 6 +++++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 6448c9ece2cb..8c5ce42c0fc3 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -216,7 +216,7 @@ static int memory_subsys_online(struct device *dev)
 	 * attribute and need to set the online_type.
 	 */
 	if (mem->online_type < 0)
-		mem->online_type =3D MMOP_ONLINE_KEEP;
+		mem->online_type =3D MMOP_ONLINE;
=20
 	ret =3D memory_block_change_state(mem, MEM_ONLINE, MEM_OFFLINE);
=20
@@ -251,7 +251,7 @@ static ssize_t state_store(struct device *dev, struct=
 device_attribute *attr,
 	else if (sysfs_streq(buf, "online_movable"))
 		online_type =3D MMOP_ONLINE_MOVABLE;
 	else if (sysfs_streq(buf, "online"))
-		online_type =3D MMOP_ONLINE_KEEP;
+		online_type =3D MMOP_ONLINE;
 	else if (sysfs_streq(buf, "offline"))
 		online_type =3D MMOP_OFFLINE;
 	else {
@@ -262,7 +262,7 @@ static ssize_t state_store(struct device *dev, struct=
 device_attribute *attr,
 	switch (online_type) {
 	case MMOP_ONLINE_KERNEL:
 	case MMOP_ONLINE_MOVABLE:
-	case MMOP_ONLINE_KEEP:
+	case MMOP_ONLINE:
 		/* mem->online_type is protected by device_hotplug_lock */
 		mem->online_type =3D online_type;
 		ret =3D device_online(&mem->dev);
@@ -342,7 +342,8 @@ static ssize_t valid_zones_show(struct device *dev,
 	}
=20
 	nid =3D mem->nid;
-	default_zone =3D zone_for_pfn_range(MMOP_ONLINE_KEEP, nid, start_pfn, n=
r_pages);
+	default_zone =3D zone_for_pfn_range(MMOP_ONLINE, nid, start_pfn,
+					  nr_pages);
 	strcat(buf, default_zone->name);
=20
 	print_allowed_zone(buf, nid, start_pfn, nr_pages, MMOP_ONLINE_KERNEL,
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplu=
g.h
index f4d59155f3d4..261dbf010d5d 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -47,9 +47,13 @@ enum {
=20
 /* Types for control the zone type of onlined and offlined memory */
 enum {
+	/* Offline the memory. */
 	MMOP_OFFLINE =3D -1,
-	MMOP_ONLINE_KEEP,
+	/* Online the memory. Zone depends, see default_zone_for_pfn(). */
+	MMOP_ONLINE,
+	/* Online the memory to ZONE_NORMAL. */
 	MMOP_ONLINE_KERNEL,
+	/* Online the memory to ZONE_MOVABLE. */
 	MMOP_ONLINE_MOVABLE,
 };
=20
--=20
2.24.1

