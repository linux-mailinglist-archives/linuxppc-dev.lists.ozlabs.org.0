Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E94264140
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 11:16:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnCtp0vt3zDqZw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 19:16:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=O9fb89ey; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=O9fb89ey; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnCrY1BdvzDqVD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 19:14:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599729272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bG9jcFZqt1ezDhzv7IvKf+DjV9LEx4e4KE6iRuRMdvg=;
 b=O9fb89eyvIv2ZzFXi9nWIOYiZhu0SfB6Oe86/r04ZRPtZ4Wqu3ySCC1Q2fCtrfZM+tnjHM
 gqYyOkf6IoB4ifYaQwYEYUns/UPI6ks4JFlxu0gNQcKYzjcguNG7/AiZTr2maaZ4GXqtet
 LUGU+CjWf18/8u0GvKiKTJ9Hh3qtAss=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599729272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bG9jcFZqt1ezDhzv7IvKf+DjV9LEx4e4KE6iRuRMdvg=;
 b=O9fb89eyvIv2ZzFXi9nWIOYiZhu0SfB6Oe86/r04ZRPtZ4Wqu3ySCC1Q2fCtrfZM+tnjHM
 gqYyOkf6IoB4ifYaQwYEYUns/UPI6ks4JFlxu0gNQcKYzjcguNG7/AiZTr2maaZ4GXqtet
 LUGU+CjWf18/8u0GvKiKTJ9Hh3qtAss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-ptkUy2LiMBG7-ccx0nM6Tg-1; Thu, 10 Sep 2020 05:14:30 -0400
X-MC-Unique: ptkUy2LiMBG7-ccx0nM6Tg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 796B71091061;
 Thu, 10 Sep 2020 09:14:25 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-88.ams2.redhat.com [10.36.113.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55A301A8EC;
 Thu, 10 Sep 2020 09:14:14 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] mm/memory_hotplug: prepare passing flags to
 add_memory() and friends
Date: Thu, 10 Sep 2020 11:13:36 +0200
Message-Id: <20200910091340.8654-4-david@redhat.com>
In-Reply-To: <20200910091340.8654-1-david@redhat.com>
References: <20200910091340.8654-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Pingfan Liu <kernelfans@gmail.com>, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 linux-nvdimm@lists.01.org, Jason Gunthorpe <jgg@ziepe.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-acpi@vger.kernel.org,
 xen-devel@lists.xenproject.org, Heiko Carstens <hca@linux.ibm.com>,
 Len Brown <lenb@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Leonardo Bras <leobras.c@gmail.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Juergen Gross <jgross@suse.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Libor Pechacek <lpechacek@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Oliver O'Halloran <oohall@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We soon want to pass flags, e.g., to mark added System RAM resources.
mergeable. Prepare for that.

This patch is based on a similar patch by Oscar Salvador:

https://lkml.kernel.org/r/20190625075227.15193-3-osalvador@suse.de

Acked-by: Wei Liu <wei.liu@kernel.org>
Reviewed-by: Juergen Gross <jgross@suse.com> # Xen related part
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Len Brown <lenb@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vishal Verma <vishal.l.verma@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Oliver O'Halloran" <oohall@gmail.com>
Cc: Pingfan Liu <kernelfans@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Libor Pechacek <lpechacek@suse.cz>
Cc: Anton Blanchard <anton@ozlabs.org>
Cc: Leonardo Bras <leobras.c@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-acpi@vger.kernel.org
Cc: linux-nvdimm@lists.01.org
Cc: linux-hyperv@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org
Cc: xen-devel@lists.xenproject.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/powernv/memtrace.c       |  2 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c |  2 +-
 drivers/acpi/acpi_memhotplug.c                  |  3 ++-
 drivers/base/memory.c                           |  3 ++-
 drivers/dax/kmem.c                              |  2 +-
 drivers/hv/hv_balloon.c                         |  2 +-
 drivers/s390/char/sclp_cmd.c                    |  2 +-
 drivers/virtio/virtio_mem.c                     |  2 +-
 drivers/xen/balloon.c                           |  2 +-
 include/linux/memory_hotplug.h                  | 16 ++++++++++++----
 mm/memory_hotplug.c                             | 14 +++++++-------
 11 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
index 13b369d2cc454..6828108486f83 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -224,7 +224,7 @@ static int memtrace_online(void)
 			ent->mem = 0;
 		}
 
-		if (add_memory(ent->nid, ent->start, ent->size)) {
+		if (add_memory(ent->nid, ent->start, ent->size, MHP_NONE)) {
 			pr_err("Failed to add trace memory to node %d\n",
 				ent->nid);
 			ret += 1;
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 0ea976d1cac47..e1c9fa0d730f5 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -615,7 +615,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 	nid = memory_add_physaddr_to_nid(lmb->base_addr);
 
 	/* Add the memory */
-	rc = __add_memory(nid, lmb->base_addr, block_sz);
+	rc = __add_memory(nid, lmb->base_addr, block_sz, MHP_NONE);
 	if (rc) {
 		invalidate_lmb_associativity_index(lmb);
 		return rc;
diff --git a/drivers/acpi/acpi_memhotplug.c b/drivers/acpi/acpi_memhotplug.c
index e294f44a78504..2067c3bc55763 100644
--- a/drivers/acpi/acpi_memhotplug.c
+++ b/drivers/acpi/acpi_memhotplug.c
@@ -207,7 +207,8 @@ static int acpi_memory_enable_device(struct acpi_memory_device *mem_device)
 		if (node < 0)
 			node = memory_add_physaddr_to_nid(info->start_addr);
 
-		result = __add_memory(node, info->start_addr, info->length);
+		result = __add_memory(node, info->start_addr, info->length,
+				      MHP_NONE);
 
 		/*
 		 * If the memory block has been used by the kernel, add_memory()
diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 4db3c660de831..b4c297dd04755 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -432,7 +432,8 @@ static ssize_t probe_store(struct device *dev, struct device_attribute *attr,
 
 	nid = memory_add_physaddr_to_nid(phys_addr);
 	ret = __add_memory(nid, phys_addr,
-			   MIN_MEMORY_BLOCK_SIZE * sections_per_block);
+			   MIN_MEMORY_BLOCK_SIZE * sections_per_block,
+			   MHP_NONE);
 
 	if (ret)
 		goto out;
diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index 7dcb2902e9b1b..896cb9444e727 100644
--- a/drivers/dax/kmem.c
+++ b/drivers/dax/kmem.c
@@ -95,7 +95,7 @@ int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 		 * this as RAM automatically.
 		 */
 		rc = add_memory_driver_managed(numa_node, range.start,
-				range_len(&range), kmem_name);
+				range_len(&range), kmem_name, MHP_NONE);
 
 		res->flags |= IORESOURCE_BUSY;
 		if (rc) {
diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
index 32e3bc0aa665a..3c0d52e244520 100644
--- a/drivers/hv/hv_balloon.c
+++ b/drivers/hv/hv_balloon.c
@@ -726,7 +726,7 @@ static void hv_mem_hot_add(unsigned long start, unsigned long size,
 
 		nid = memory_add_physaddr_to_nid(PFN_PHYS(start_pfn));
 		ret = add_memory(nid, PFN_PHYS((start_pfn)),
-				(HA_CHUNK << PAGE_SHIFT));
+				(HA_CHUNK << PAGE_SHIFT), MHP_NONE);
 
 		if (ret) {
 			pr_err("hot_add memory failed error is %d\n", ret);
diff --git a/drivers/s390/char/sclp_cmd.c b/drivers/s390/char/sclp_cmd.c
index a864b21af602a..f6e97f0830f64 100644
--- a/drivers/s390/char/sclp_cmd.c
+++ b/drivers/s390/char/sclp_cmd.c
@@ -406,7 +406,7 @@ static void __init add_memory_merged(u16 rn)
 	if (!size)
 		goto skip_add;
 	for (addr = start; addr < start + size; addr += block_size)
-		add_memory(0, addr, block_size);
+		add_memory(0, addr, block_size, MHP_NONE);
 skip_add:
 	first_rn = rn;
 	num = 1;
diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 834b7c13ef3dc..ed99e43354010 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -424,7 +424,7 @@ static int virtio_mem_mb_add(struct virtio_mem *vm, unsigned long mb_id)
 
 	dev_dbg(&vm->vdev->dev, "adding memory block: %lu\n", mb_id);
 	return add_memory_driver_managed(nid, addr, memory_block_size_bytes(),
-					 vm->resource_name);
+					 vm->resource_name, MHP_NONE);
 }
 
 /*
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 51427c752b37b..9f40a294d398d 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -331,7 +331,7 @@ static enum bp_state reserve_additional_memory(void)
 	mutex_unlock(&balloon_mutex);
 	/* add_memory_resource() requires the device_hotplug lock */
 	lock_device_hotplug();
-	rc = add_memory_resource(nid, resource);
+	rc = add_memory_resource(nid, resource, MHP_NONE);
 	unlock_device_hotplug();
 	mutex_lock(&balloon_mutex);
 
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 51a877fec8da8..e53d1058f3443 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -57,6 +57,12 @@ enum {
 	MMOP_ONLINE_MOVABLE,
 };
 
+/* Flags for add_memory() and friends to specify memory hotplug details. */
+typedef int __bitwise mhp_t;
+
+/* No special request */
+#define MHP_NONE		((__force mhp_t)0)
+
 /*
  * Extended parameters for memory hotplug:
  * altmap: alternative allocator for memmap array (optional)
@@ -345,11 +351,13 @@ extern void set_zone_contiguous(struct zone *zone);
 extern void clear_zone_contiguous(struct zone *zone);
 
 extern void __ref free_area_init_core_hotplug(int nid);
-extern int __add_memory(int nid, u64 start, u64 size);
-extern int add_memory(int nid, u64 start, u64 size);
-extern int add_memory_resource(int nid, struct resource *resource);
+extern int __add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
+extern int add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
+extern int add_memory_resource(int nid, struct resource *resource,
+			       mhp_t mhp_flags);
 extern int add_memory_driver_managed(int nid, u64 start, u64 size,
-				     const char *resource_name);
+				     const char *resource_name,
+				     mhp_t mhp_flags);
 extern void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 				   unsigned long nr_pages,
 				   struct vmem_altmap *altmap, int migratetype);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 8e1cd18b5cf14..8f0bd7c9a63a5 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1039,7 +1039,7 @@ static int online_memory_block(struct memory_block *mem, void *arg)
  *
  * we are OK calling __meminit stuff here - we have CONFIG_MEMORY_HOTPLUG
  */
-int __ref add_memory_resource(int nid, struct resource *res)
+int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 {
 	struct mhp_params params = { .pgprot = PAGE_KERNEL };
 	u64 start, size;
@@ -1118,7 +1118,7 @@ int __ref add_memory_resource(int nid, struct resource *res)
 }
 
 /* requires device_hotplug_lock, see add_memory_resource() */
-int __ref __add_memory(int nid, u64 start, u64 size)
+int __ref __add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags)
 {
 	struct resource *res;
 	int ret;
@@ -1127,18 +1127,18 @@ int __ref __add_memory(int nid, u64 start, u64 size)
 	if (IS_ERR(res))
 		return PTR_ERR(res);
 
-	ret = add_memory_resource(nid, res);
+	ret = add_memory_resource(nid, res, mhp_flags);
 	if (ret < 0)
 		release_memory_resource(res);
 	return ret;
 }
 
-int add_memory(int nid, u64 start, u64 size)
+int add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags)
 {
 	int rc;
 
 	lock_device_hotplug();
-	rc = __add_memory(nid, start, size);
+	rc = __add_memory(nid, start, size, mhp_flags);
 	unlock_device_hotplug();
 
 	return rc;
@@ -1167,7 +1167,7 @@ EXPORT_SYMBOL_GPL(add_memory);
  * "System RAM ($DRIVER)".
  */
 int add_memory_driver_managed(int nid, u64 start, u64 size,
-			      const char *resource_name)
+			      const char *resource_name, mhp_t mhp_flags)
 {
 	struct resource *res;
 	int rc;
@@ -1185,7 +1185,7 @@ int add_memory_driver_managed(int nid, u64 start, u64 size,
 		goto out_unlock;
 	}
 
-	rc = add_memory_resource(nid, res);
+	rc = add_memory_resource(nid, res, mhp_flags);
 	if (rc < 0)
 		release_memory_resource(res);
 
-- 
2.26.2

