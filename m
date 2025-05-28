Return-Path: <linuxppc-dev+bounces-8970-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 928F2AC6EFF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 19:18:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6x6b6mmjz2xGY;
	Thu, 29 May 2025 03:18:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748452711;
	cv=none; b=bpuc+1IVE+TKMBNM+M96R4S1YSwFoR1vbf/UMYZ5DNF/jUPxGr+tfIdUEQIMSo21617v45cLbBbI6by8lpHqPeh33gCvvqsMFhl3UmdDKCF2Ane0PWuiz3G7hum2Y7OkjoONsql83DZOJEztpuA1iUTaPqAztDS0BRXMvFYV7vZzYeDwIwT0LINLgWQEgaj/8swP8ef5m/4xJMOj0a5TTE4pE+IzclkTGUjgAReAZWsLgQr4mbDnS05m0d9QZKK8lBpKFlSkDawg4ySKapOCssHiZn+CnWUHxlAH8jCmEl0TT8l7pDURMePKMks/7NQzwvBho5jpCO3A9NHfehdRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748452711; c=relaxed/relaxed;
	bh=rNxRMpzTpRqHtbiY/bcnyUNUB7IoSnep9XeZFcyAA3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Na7ochKfV/g84vAKZ4dGzidJkHYKAbGetwKoDlXVaGd16XowU9llcHHykvN+vL6UYyD4KaPx4VXaf8iEiyKTl7g8aQ/7WvhP51w5SaWEcfY6BjtE6NOgj/kzkKczjVv53ubWXu8WVvp3zox9mzfjCXlJqGmL4Wg7hEwn5L4nLlxzHv1diSHFofPeWJJUqXPNKLpbHf5u9XF8TbGLXDDjljZsvolBneNQ6lK/czzUr5sjq5CTySOfMBsgBpCRmxr3WIBi+Qt4hd6efFt1z3SOlGTzPmeq68El4/TXmFVnfOrM1gb3f5zoF+mVxOit17dKGZc11AX3lV8sGBWuePY43Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=huO3LMEz; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=huO3LMEz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6x6Z3YT4z2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 03:18:30 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SE9l0t022766;
	Wed, 28 May 2025 17:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=rNxRMpzTpRqHtbiY/bcnyUNUB7Io
	Snep9XeZFcyAA3Q=; b=huO3LMEzguUMP65ukJy9AKeSLNrL1WiMfzMki2ENYB0V
	NV02vvtk28dqu9FJxtd6/hr/fq0Eb7EVI9cEfxoamOricCVx7P0svH8Jis7lKR+K
	rFmUVwstv27R/5ASk5NDdC1sLwaLzXuSgdqoF+U8oDI245+x7/tRKYSStMCLdrWY
	7VstbyiK17lZx+RMT+1MV72PGtmTu7iOZAH2p3vfHgklagu63lAJJZS/8HBXl0fe
	oeVPB8LkBPfV1UlxKLVJKB9arIvG/QqN7qqr+SUeYkHpSgF3MMdjPFL+3JcP3rGt
	sSWFFZoSeCJ9SIOlVridAylqcgDPZQ9BIrrmqciQ0Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40h10cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 17:18:15 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54SHDEkg009137;
	Wed, 28 May 2025 17:18:14 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40h10cb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 17:18:14 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54SFFKel026439;
	Wed, 28 May 2025 17:18:14 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46usxn0f9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 17:18:13 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54SHI9cr34275758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 17:18:09 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EBBB2004D;
	Wed, 28 May 2025 17:18:09 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E88F420040;
	Wed, 28 May 2025 17:18:06 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 May 2025 17:18:06 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nilay Shroff <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v7 1/5] drivers/base/node: Optimize memory block registration to reduce boot time
Date: Wed, 28 May 2025 12:18:00 -0500
Message-ID: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cnWZHcMqQQ42pRsCFB6mUvkfzaW15eh1
X-Proofpoint-ORIG-GUID: VB-UuhShpyTVBAeKxCo3gvpYJlXY6-Sy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0OCBTYWx0ZWRfX/bKOXGZb5Gf3 UQSg044X/FmMij/Vmp5xVk4nkN6mTDwAvIkdwKXVwtz3d2zebTlv9grk+5pYhXMWNwXFTo3Aq/Z KiXFA5q7zXSzo1kw2scBpk2aaKCxJ2jQ8mlHT7NEo9LIYPgxqnvVtK9wwycLHzsDs1PNB7n9wHo
 oFg4rt9wjUpd7L3orevrh16OsHqANognCBUP1FjpREfQuN+jFOObApz1rIIqo9X0jpI8wk2eiDt 3N+4v5xaCNxYI1CHcryKB8wQIerG+lDLifBf6WCEz6zAqOae2i7pjFA8VpySIUy6P6rX5/PZ1Rr j5hcqDZSXpw40nCE48P6GRANKMWZM+a18CEmykGL4tz9Si4PaXWi+OUdAw5DLDW8dCe6wXVxgm0
 Ia6BEI/fXdOzHw3f+vYuhyY8U3Y0Cyrk+YogiSMwXMpDHjIHrVAeQ5zVT1tYCkRwAKl/8cME
X-Authority-Analysis: v=2.4 cv=L8MdQ/T8 c=1 sm=1 tr=0 ts=68374557 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8
 a=y_Vbiix7gtgA8xZMur0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280148
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

During node device initialization, `memory blocks` are registered under
each NUMA node. The `memory blocks` to be registered are identified using
the node’s start and end PFNs, which are obtained from the node's pg_data

However, not all PFNs within this range necessarily belong to the same
node—some may belong to other nodes. Additionally, due to the
discontiguous nature of physical memory, certain sections within a
`memory block` may be absent.

As a result, `memory blocks` that fall between a node’s start and end
PFNs may span across multiple nodes, and some sections within those blocks
may be missing. `Memory blocks` have a fixed size, which is architecture
dependent.

Due to these considerations, the memory block registration is currently
performed as follows:

for_each_online_node(nid):
    start_pfn = pgdat->node_start_pfn;
    end_pfn = pgdat->node_start_pfn + node_spanned_pages;
    for_each_memory_block_between(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn))
        mem_blk = memory_block_id(pfn_to_section_nr(pfn));
        pfn_mb_start=section_nr_to_pfn(mem_blk->start_section_nr)
        pfn_mb_end = pfn_start + memory_block_pfns - 1
        for (pfn = pfn_mb_start; pfn < pfn_mb_end; pfn++):
            if (get_nid_for_pfn(pfn) != nid):
                continue;
            else
                do_register_memory_block_under_node(nid, mem_blk,
                                                        MEMINIT_EARLY);

Here, we derive the start and end PFNs from the node's pg_data, then
determine the memory blocks that may belong to the node. For each
`memory block` in this range, we inspect all PFNs it contains and check
their associated NUMA node ID. If a PFN within the block matches the
current node, the memory block is registered under that node.

If CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, get_nid_for_pfn() performs
a binary search in the `memblock regions` to determine the NUMA node ID
for a given PFN. If it is not enabled, the node ID is retrieved directly
from the struct page.

On large systems, this process can become time-consuming, especially since
we iterate over each `memory block` and all PFNs within it until a match is
found. When CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, the additional
overhead of the binary search increases the execution time significantly,
potentially leading to soft lockups during boot.

In this patch, we iterate over `memblock region` to identify the
`memory blocks` that belong to the current NUMA node. `memblock regions`
are contiguous memory ranges, each associated with a single NUMA node, and
they do not span across multiple nodes.

for_each_memory_region(r): // r => region
  if (!node_online(r->nid)):
    continue;
  else
    for_each_memory_block_between(r->base, r->base + r->size - 1):
      do_register_memory_block_under_node(r->nid, mem_blk, MEMINIT_EARLY);

We iterate over all memblock regions, and if the node associated with the
region is online, we calculate the start and end memory blocks based on the
region's start and end PFNs. We then register all the memory blocks within
that range under the region node.

Test Results on My system with 32TB RAM
=======================================
1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.

Without this patch
------------------
Startup finished in 1min 16.528s (kernel)

With this patch
---------------
Startup finished in 17.236s (kernel) - 78% Improvement

2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.

Without this patch
------------------
Startup finished in 28.320s (kernel)

With this patch
---------------
Startup finished in 15.621s (kernel) - 46% Improvement

Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>

---

v6 -> v7

Removed unwanted comments

v6 - https://lore.kernel.org/all/bc754a238aa91fa36be463985ccde66aac7055e7.1748270306.git.donettom@linux.ibm.com/
v5 - https://lore.kernel.org/all/d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com/
v4 - https://lore.kernel.org/all/f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com/
v3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
---
 drivers/base/memory.c  | 21 ++++-----------------
 drivers/base/node.c    | 35 +++++++++++++++++++++++++++++++++--
 include/linux/memory.h | 19 ++++++++++++++++++-
 include/linux/node.h   |  3 +++
 4 files changed, 58 insertions(+), 20 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 19469e7f88c2..39fcc075a36f 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -22,6 +22,7 @@
 #include <linux/stat.h>
 #include <linux/slab.h>
 #include <linux/xarray.h>
+#include <linux/export.h>
 
 #include <linux/atomic.h>
 #include <linux/uaccess.h>
@@ -48,22 +49,8 @@ int mhp_online_type_from_str(const char *str)
 
 #define to_memory_block(dev) container_of(dev, struct memory_block, dev)
 
-static int sections_per_block;
-
-static inline unsigned long memory_block_id(unsigned long section_nr)
-{
-	return section_nr / sections_per_block;
-}
-
-static inline unsigned long pfn_to_block_id(unsigned long pfn)
-{
-	return memory_block_id(pfn_to_section_nr(pfn));
-}
-
-static inline unsigned long phys_to_block_id(unsigned long phys)
-{
-	return pfn_to_block_id(PFN_DOWN(phys));
-}
+int sections_per_block;
+EXPORT_SYMBOL(sections_per_block);
 
 static int memory_subsys_online(struct device *dev);
 static int memory_subsys_offline(struct device *dev);
@@ -632,7 +619,7 @@ int __weak arch_get_memory_phys_device(unsigned long start_pfn)
  *
  * Called under device_hotplug_lock.
  */
-static struct memory_block *find_memory_block_by_id(unsigned long block_id)
+struct memory_block *find_memory_block_by_id(unsigned long block_id)
 {
 	struct memory_block *mem;
 
diff --git a/drivers/base/node.c b/drivers/base/node.c
index 618712071a1e..b229dee13632 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/swap.h>
 #include <linux/slab.h>
+#include <linux/memblock.h>
 
 static const struct bus_type node_subsys = {
 	.name = "node",
@@ -850,6 +851,34 @@ void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
 			  kobject_name(&node_devices[mem_blk->nid]->dev.kobj));
 }
 
+/* register all memory blocks under the corresponding nodes */
+static void register_memory_blocks_under_nodes(void)
+{
+	struct memblock_region *r;
+
+	for_each_mem_region(r) {
+		const unsigned long start_block_id = phys_to_block_id(r->base);
+		const unsigned long end_block_id = phys_to_block_id(r->base + r->size - 1);
+		const int nid = memblock_get_region_node(r);
+		unsigned long block_id;
+
+		if (!node_online(nid))
+			continue;
+
+		for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
+			struct memory_block *mem;
+
+			mem = find_memory_block_by_id(block_id);
+			if (!mem)
+				continue;
+
+			do_register_memory_block_under_node(nid, mem, MEMINIT_EARLY);
+			put_device(&mem->dev);
+		}
+
+	}
+}
+
 void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
 				       unsigned long end_pfn,
 				       enum meminit_context context)
@@ -971,11 +1000,13 @@ void __init node_dev_init(void)
 
 	/*
 	 * Create all node devices, which will properly link the node
-	 * to applicable memory block devices and already created cpu devices.
+	 * to already created cpu devices.
 	 */
 	for_each_online_node(i) {
-		ret = register_one_node(i);
+		ret =  __register_one_node(i);
 		if (ret)
 			panic("%s() failed to add node: %d\n", __func__, ret);
 	}
+
+	register_memory_blocks_under_nodes();
 }
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 12daa6ec7d09..2a61088e17ad 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -171,12 +171,30 @@ struct memory_group *memory_group_find_by_id(int mgid);
 typedef int (*walk_memory_groups_func_t)(struct memory_group *, void *);
 int walk_dynamic_memory_groups(int nid, walk_memory_groups_func_t func,
 			       struct memory_group *excluded, void *arg);
+struct memory_block *find_memory_block_by_id(unsigned long block_id);
 #define hotplug_memory_notifier(fn, pri) ({		\
 	static __meminitdata struct notifier_block fn##_mem_nb =\
 		{ .notifier_call = fn, .priority = pri };\
 	register_memory_notifier(&fn##_mem_nb);			\
 })
 
+extern int sections_per_block;
+
+static inline unsigned long memory_block_id(unsigned long section_nr)
+{
+	return section_nr / sections_per_block;
+}
+
+static inline unsigned long pfn_to_block_id(unsigned long pfn)
+{
+	return memory_block_id(pfn_to_section_nr(pfn));
+}
+
+static inline unsigned long phys_to_block_id(unsigned long phys)
+{
+	return pfn_to_block_id(PFN_DOWN(phys));
+}
+
 #ifdef CONFIG_NUMA
 void memory_block_add_nid(struct memory_block *mem, int nid,
 			  enum meminit_context context);
@@ -188,5 +206,4 @@ void memory_block_add_nid(struct memory_block *mem, int nid,
  * can sleep.
  */
 extern struct mutex text_mutex;
-
 #endif /* _LINUX_MEMORY_H_ */
diff --git a/include/linux/node.h b/include/linux/node.h
index 2b7517892230..485370f3bc17 100644
--- a/include/linux/node.h
+++ b/include/linux/node.h
@@ -120,6 +120,9 @@ static inline void register_memory_blocks_under_node(int nid, unsigned long star
 						     enum meminit_context context)
 {
 }
+static inline void register_memory_blocks_under_nodes(void)
+{
+}
 #endif
 
 extern void unregister_node(struct node *node);
-- 
2.43.5


