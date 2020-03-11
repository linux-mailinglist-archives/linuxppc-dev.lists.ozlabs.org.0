Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ACC1818CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 13:52:55 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48csLp3CTSzDqRg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 23:52:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JCDsyWup; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48crsh4d18zDqN1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 23:31:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583929862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v715Pod0UxvClK9bH9aohxdjtGh4u2snNdM9PwSvbNU=;
 b=JCDsyWupSvK+WyEmW+5ZwxzJByyXBnP/SMs0/nNCgJvXp46+QrfowfO7/5CD9ditkMVVLL
 GucsPNaJH1rqc1kAaMt/QOlrW/RGcOW9JaPNvvP2I173ijzf6dfSfaGSTMcAWOtiA+k5AT
 UvPjXW+8RGrZfP86sTQIqeP6mm9jpeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-VzLk7vfzM92cAL1UG8cahQ-1; Wed, 11 Mar 2020 08:30:58 -0400
X-MC-Unique: VzLk7vfzM92cAL1UG8cahQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72D618017DF;
 Wed, 11 Mar 2020 12:30:55 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.36.118.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0735F5C1D4;
 Wed, 11 Mar 2020 12:30:46 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] mm/memory_hotplug: convert memhp_auto_online to store
 an online_type
Date: Wed, 11 Mar 2020 13:30:25 +0100
Message-Id: <20200311123026.16071-5-david@redhat.com>
In-Reply-To: <20200311123026.16071-1-david@redhat.com>
References: <20200311123026.16071-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: linux-hyperv@vger.kernel.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Baoquan He <bhe@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Wei Yang <richard.weiyang@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

... and rename it to memhp_default_online_type. This is a preparation
for more detailed default online behavior.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richard.weiyang@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-hyperv@vger.kernel.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/powernv/memtrace.c |  2 +-
 drivers/base/memory.c                     | 10 ++++------
 drivers/hv/hv_balloon.c                   |  2 +-
 include/linux/memory_hotplug.h            |  3 ++-
 mm/memory_hotplug.c                       | 13 +++++++------
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/pla=
tforms/powernv/memtrace.c
index d6d64f8718e6..e15a600cfa4d 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -235,7 +235,7 @@ static int memtrace_online(void)
 		 * If kernel isn't compiled with the auto online option
 		 * we need to online the memory ourselves.
 		 */
-		if (!memhp_auto_online) {
+		if (memhp_default_online_type =3D=3D MMOP_OFFLINE) {
 			lock_device_hotplug();
 			walk_memory_blocks(ent->start, ent->size, NULL,
 					   online_mem_block);
diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 8a7f29c0bf97..8d3e16dab69f 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -386,10 +386,8 @@ static DEVICE_ATTR_RO(block_size_bytes);
 static ssize_t auto_online_blocks_show(struct device *dev,
 				       struct device_attribute *attr, char *buf)
 {
-	if (memhp_auto_online)
-		return sprintf(buf, "online\n");
-	else
-		return sprintf(buf, "offline\n");
+	return sprintf(buf, "%s\n",
+		       online_type_to_str[memhp_default_online_type]);
 }
=20
 static ssize_t auto_online_blocks_store(struct device *dev,
@@ -397,9 +395,9 @@ static ssize_t auto_online_blocks_store(struct device=
 *dev,
 					const char *buf, size_t count)
 {
 	if (sysfs_streq(buf, "online"))
-		memhp_auto_online =3D true;
+		memhp_default_online_type =3D MMOP_ONLINE;
 	else if (sysfs_streq(buf, "offline"))
-		memhp_auto_online =3D false;
+		memhp_default_online_type =3D MMOP_OFFLINE;
 	else
 		return -EINVAL;
=20
diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
index a02ce43d778d..3b90fd12e0c5 100644
--- a/drivers/hv/hv_balloon.c
+++ b/drivers/hv/hv_balloon.c
@@ -727,7 +727,7 @@ static void hv_mem_hot_add(unsigned long start, unsig=
ned long size,
 		spin_unlock_irqrestore(&dm_device.ha_lock, flags);
=20
 		init_completion(&dm_device.ol_waitevent);
-		dm_device.ha_waiting =3D !memhp_auto_online;
+		dm_device.ha_waiting =3D memhp_default_online_type =3D=3D MMOP_OFFLINE=
;
=20
 		nid =3D memory_add_physaddr_to_nid(PFN_PHYS(start_pfn));
 		ret =3D add_memory(nid, PFN_PHYS((start_pfn)),
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplu=
g.h
index c2e06ed5e0e9..c6e090b34c4b 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -117,7 +117,8 @@ extern int arch_add_memory(int nid, u64 start, u64 si=
ze,
 			struct mhp_restrictions *restrictions);
 extern u64 max_mem_size;
=20
-extern bool memhp_auto_online;
+/* Default online_type (MMOP_*) when new memory blocks are added. */
+extern int memhp_default_online_type;
 /* If movable_node boot option specified */
 extern bool movable_node_enabled;
 static inline bool movable_node_is_enabled(void)
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 1a00b5a37ef6..01443c70aa27 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -67,18 +67,18 @@ void put_online_mems(void)
 bool movable_node_enabled =3D false;
=20
 #ifndef CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE
-bool memhp_auto_online;
+int memhp_default_online_type =3D MMOP_OFFLINE;
 #else
-bool memhp_auto_online =3D true;
+int memhp_default_online_type =3D MMOP_ONLINE;
 #endif
-EXPORT_SYMBOL_GPL(memhp_auto_online);
+EXPORT_SYMBOL_GPL(memhp_default_online_type);
=20
 static int __init setup_memhp_default_state(char *str)
 {
 	if (!strcmp(str, "online"))
-		memhp_auto_online =3D true;
+		memhp_default_online_type =3D MMOP_ONLINE;
 	else if (!strcmp(str, "offline"))
-		memhp_auto_online =3D false;
+		memhp_default_online_type =3D MMOP_OFFLINE;
=20
 	return 1;
 }
@@ -991,6 +991,7 @@ static int check_hotplug_memory_range(u64 start, u64 =
size)
=20
 static int online_memory_block(struct memory_block *mem, void *arg)
 {
+	mem->online_type =3D memhp_default_online_type;
 	return device_online(&mem->dev);
 }
=20
@@ -1063,7 +1064,7 @@ int __ref add_memory_resource(int nid, struct resou=
rce *res)
 	mem_hotplug_done();
=20
 	/* online pages if requested */
-	if (memhp_auto_online)
+	if (memhp_default_online_type !=3D MMOP_OFFLINE)
 		walk_memory_blocks(start, size, NULL, online_memory_block);
=20
 	return ret;
--=20
2.24.1

