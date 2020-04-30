Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DD11BF58F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 12:33:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CWvC6rgKzDrFr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 20:33:43 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=fm39ePLN; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=fm39ePLN; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CWpp08BJzDr9S
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:29:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588242591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZ5IMSF8ZkjNCkTQzjTv952CxqGeCi/XaPtFmGo7H8U=;
 b=fm39ePLNVN1RuPVswXNCmUj7p06bS1/kxRMLGUuq9/cIB6i/h9JjD34LG3b/pJuhEHf5/7
 r6redKOruVYad9KUaLG6RdMovt51NVUQlG1s6QUBwsO0Cju6+FTsqa7e3kIySuN458STLv
 smKwi2Qq0ez3rV9LoJ34ytMxgMEilAw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588242591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZ5IMSF8ZkjNCkTQzjTv952CxqGeCi/XaPtFmGo7H8U=;
 b=fm39ePLNVN1RuPVswXNCmUj7p06bS1/kxRMLGUuq9/cIB6i/h9JjD34LG3b/pJuhEHf5/7
 r6redKOruVYad9KUaLG6RdMovt51NVUQlG1s6QUBwsO0Cju6+FTsqa7e3kIySuN458STLv
 smKwi2Qq0ez3rV9LoJ34ytMxgMEilAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-WETd19g0OlqD5GCQnge_oQ-1; Thu, 30 Apr 2020 06:29:44 -0400
X-MC-Unique: WETd19g0OlqD5GCQnge_oQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6843A100CCC1;
 Thu, 30 Apr 2020 10:29:40 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 591C45EDEE;
 Thu, 30 Apr 2020 10:29:32 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] mm/memory_hotplug: Prepare passing flags to
 add_memory() and friends
Date: Thu, 30 Apr 2020 12:29:06 +0200
Message-Id: <20200430102908.10107-2-david@redhat.com>
In-Reply-To: <20200430102908.10107-1-david@redhat.com>
References: <20200430102908.10107-1-david@redhat.com>
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Pingfan Liu <kernelfans@gmail.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, virtio-dev@lists.oasis-open.org,
 Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 David Hildenbrand <david@redhat.com>, linux-acpi@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, xen-devel@lists.xenproject.org,
 Len Brown <lenb@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>, Leonardo Bras <leobras.c@gmail.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Thomas Gleixner <tglx@linutronix.de>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We soon want to pass flags - prepare for that.

This patch is based on a similar patch by Oscar Salvador:

https://lkml.kernel.org/r/20190625075227.15193-3-osalvador@suse.de

Acked-by: Wei Liu <wei.liu@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Len Brown <lenb@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Vishal Verma <vishal.l.verma@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Pingfan Liu <kernelfans@gmail.com>
Cc: Leonardo Bras <leobras.c@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richard.weiyang@gmail.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Eric Biederman <ebiederm@xmission.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
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
 drivers/acpi/acpi_memhotplug.c                  |  2 +-
 drivers/base/memory.c                           |  2 +-
 drivers/dax/kmem.c                              |  2 +-
 drivers/hv/hv_balloon.c                         |  2 +-
 drivers/s390/char/sclp_cmd.c                    |  2 +-
 drivers/xen/balloon.c                           |  2 +-
 include/linux/memory_hotplug.h                  |  7 ++++---
 mm/memory_hotplug.c                             | 11 ++++++-----
 10 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/pla=
tforms/powernv/memtrace.c
index 13b369d2cc45..a7475d18c671 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -224,7 +224,7 @@ static int memtrace_online(void)
 			ent->mem =3D 0;
 		}
=20
-		if (add_memory(ent->nid, ent->start, ent->size)) {
+		if (add_memory(ent->nid, ent->start, ent->size, 0)) {
 			pr_err("Failed to add trace memory to node %d\n",
 				ent->nid);
 			ret +=3D 1;
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/power=
pc/platforms/pseries/hotplug-memory.c
index 5ace2f9a277e..ae44eba46ca0 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -646,7 +646,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 	block_sz =3D memory_block_size_bytes();
=20
 	/* Add the memory */
-	rc =3D __add_memory(lmb->nid, lmb->base_addr, block_sz);
+	rc =3D __add_memory(lmb->nid, lmb->base_addr, block_sz, 0);
 	if (rc) {
 		invalidate_lmb_associativity_index(lmb);
 		return rc;
diff --git a/drivers/acpi/acpi_memhotplug.c b/drivers/acpi/acpi_memhotplu=
g.c
index e294f44a7850..d91b3584d4b2 100644
--- a/drivers/acpi/acpi_memhotplug.c
+++ b/drivers/acpi/acpi_memhotplug.c
@@ -207,7 +207,7 @@ static int acpi_memory_enable_device(struct acpi_memo=
ry_device *mem_device)
 		if (node < 0)
 			node =3D memory_add_physaddr_to_nid(info->start_addr);
=20
-		result =3D __add_memory(node, info->start_addr, info->length);
+		result =3D __add_memory(node, info->start_addr, info->length, 0);
=20
 		/*
 		 * If the memory block has been used by the kernel, add_memory()
diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 2b09b68b9f78..c0ef7d9e310a 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -432,7 +432,7 @@ static ssize_t probe_store(struct device *dev, struct=
 device_attribute *attr,
=20
 	nid =3D memory_add_physaddr_to_nid(phys_addr);
 	ret =3D __add_memory(nid, phys_addr,
-			   MIN_MEMORY_BLOCK_SIZE * sections_per_block);
+			   MIN_MEMORY_BLOCK_SIZE * sections_per_block, 0);
=20
 	if (ret)
 		goto out;
diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index 3d0a7e702c94..e159184e0ba0 100644
--- a/drivers/dax/kmem.c
+++ b/drivers/dax/kmem.c
@@ -65,7 +65,7 @@ int dev_dax_kmem_probe(struct device *dev)
 	new_res->flags =3D IORESOURCE_SYSTEM_RAM;
 	new_res->name =3D dev_name(dev);
=20
-	rc =3D add_memory(numa_node, new_res->start, resource_size(new_res));
+	rc =3D add_memory(numa_node, new_res->start, resource_size(new_res), 0)=
;
 	if (rc) {
 		release_resource(new_res);
 		kfree(new_res);
diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
index 32e3bc0aa665..0194bed1a573 100644
--- a/drivers/hv/hv_balloon.c
+++ b/drivers/hv/hv_balloon.c
@@ -726,7 +726,7 @@ static void hv_mem_hot_add(unsigned long start, unsig=
ned long size,
=20
 		nid =3D memory_add_physaddr_to_nid(PFN_PHYS(start_pfn));
 		ret =3D add_memory(nid, PFN_PHYS((start_pfn)),
-				(HA_CHUNK << PAGE_SHIFT));
+				(HA_CHUNK << PAGE_SHIFT), 0);
=20
 		if (ret) {
 			pr_err("hot_add memory failed error is %d\n", ret);
diff --git a/drivers/s390/char/sclp_cmd.c b/drivers/s390/char/sclp_cmd.c
index a864b21af602..a6a908244c74 100644
--- a/drivers/s390/char/sclp_cmd.c
+++ b/drivers/s390/char/sclp_cmd.c
@@ -406,7 +406,7 @@ static void __init add_memory_merged(u16 rn)
 	if (!size)
 		goto skip_add;
 	for (addr =3D start; addr < start + size; addr +=3D block_size)
-		add_memory(0, addr, block_size);
+		add_memory(0, addr, block_size, 0);
 skip_add:
 	first_rn =3D rn;
 	num =3D 1;
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 0c142bcab79d..6ec0373fa624 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -347,7 +347,7 @@ static enum bp_state reserve_additional_memory(void)
 	mutex_unlock(&balloon_mutex);
 	/* add_memory_resource() requires the device_hotplug lock */
 	lock_device_hotplug();
-	rc =3D add_memory_resource(nid, resource);
+	rc =3D add_memory_resource(nid, resource, 0);
 	unlock_device_hotplug();
 	mutex_lock(&balloon_mutex);
=20
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplu=
g.h
index 7dca9cd6076b..0151fb935c09 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -339,9 +339,10 @@ extern void set_zone_contiguous(struct zone *zone);
 extern void clear_zone_contiguous(struct zone *zone);
=20
 extern void __ref free_area_init_core_hotplug(int nid);
-extern int __add_memory(int nid, u64 start, u64 size);
-extern int add_memory(int nid, u64 start, u64 size);
-extern int add_memory_resource(int nid, struct resource *resource);
+extern int __add_memory(int nid, u64 start, u64 size, unsigned long flag=
s);
+extern int add_memory(int nid, u64 start, u64 size, unsigned long flags)=
;
+extern int add_memory_resource(int nid, struct resource *resource,
+			       unsigned long flags);
 extern void move_pfn_range_to_zone(struct zone *zone, unsigned long star=
t_pfn,
 		unsigned long nr_pages, struct vmem_altmap *altmap);
 extern void remove_pfn_range_from_zone(struct zone *zone,
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 555137bd0882..c01be92693e3 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1004,7 +1004,8 @@ static int online_memory_block(struct memory_block =
*mem, void *arg)
  *
  * we are OK calling __meminit stuff here - we have CONFIG_MEMORY_HOTPLU=
G
  */
-int __ref add_memory_resource(int nid, struct resource *res)
+int __ref add_memory_resource(int nid, struct resource *res,
+			      unsigned long flags)
 {
 	struct mhp_params params =3D { .pgprot =3D PAGE_KERNEL };
 	u64 start, size;
@@ -1082,7 +1083,7 @@ int __ref add_memory_resource(int nid, struct resou=
rce *res)
 }
=20
 /* requires device_hotplug_lock, see add_memory_resource() */
-int __ref __add_memory(int nid, u64 start, u64 size)
+int __ref __add_memory(int nid, u64 start, u64 size, unsigned long flags=
)
 {
 	struct resource *res;
 	int ret;
@@ -1091,18 +1092,18 @@ int __ref __add_memory(int nid, u64 start, u64 si=
ze)
 	if (IS_ERR(res))
 		return PTR_ERR(res);
=20
-	ret =3D add_memory_resource(nid, res);
+	ret =3D add_memory_resource(nid, res, flags);
 	if (ret < 0)
 		release_memory_resource(res);
 	return ret;
 }
=20
-int add_memory(int nid, u64 start, u64 size)
+int add_memory(int nid, u64 start, u64 size, unsigned long flags)
 {
 	int rc;
=20
 	lock_device_hotplug();
-	rc =3D __add_memory(nid, start, size);
+	rc =3D __add_memory(nid, start, size, flags);
 	unlock_device_hotplug();
=20
 	return rc;
--=20
2.25.3

