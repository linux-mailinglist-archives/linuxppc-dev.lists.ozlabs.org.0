Return-Path: <linuxppc-dev+bounces-8938-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1D1AC41CB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 16:50:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5dx56qmzz2xS2;
	Tue, 27 May 2025 00:50:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748271049;
	cv=none; b=n8Vpd175vy3xICUa6i4mq6mtm1QT3ynl0ITSEZN0VxshxdvW15SAKp0tXXO6rLGOlrc1LgDif0AwnqV4pS6/bqs26cKlex5M2rPQ7oTsXsouaFGpZ0NXnn1Pc+JUm6MEHA+Ty6gXjLDPnPIhMDZPg2b30h7jz58qYsOp2ZR+XQ0NBD+jv/0Vn9I1uu3TxzNEUWnerfbEtiEd7h+KHk+BooynuHm5/fz5vysern/SPc8bmUcOZkouIUjvSFttBjD6FkTWxPfJ0w0Bgd9iAEIFdGj+E1QFIXrcBr5WCZfaufv+qjfY7TPdU2HuscIlWhNrRGrt/C5zB4epgZ3gDFfWdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748271049; c=relaxed/relaxed;
	bh=5JrTdx+ljPMAG0Y5WbWvSy5ZVhhfpc6ReH9JOWW9VxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NeIZkZDBLbaJnhKjz37kHwG9g3sBEfU6XGVRs7ww3I37A9MWgpFZZWdN4r5V4rNaGah+SdpdO/eraCXwS+wATH3bBabuiBDz/SzHfBAB85kiy0HPvmpuJ66nWSqiw/RdFktIICtux9j18s2WvJUPuXSwooSutQev0GqBsFgvIWKD6+xMHVXOSB8P7/QODDVMBMWurQQ5GBjkSEbUCvvefpsinZ3HAP0AXB6BrAlERgh487X4BPE/s0D0NWLJtLGULHSrFbmnFpXsz7Ae1K/2LHAMY1NWeAB2NyBbvSfzoFSFfi1D/i1DAVEQiKmHLELDc3pgdQaBFLiuGBO9khROkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GnEQcSAv; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GnEQcSAv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5dx40krlz2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 May 2025 00:50:47 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q9xEQ9005911;
	Mon, 26 May 2025 14:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=5JrTdx+ljPMAG0Y5WbWvSy5ZVhhf
	pc6ReH9JOWW9VxQ=; b=GnEQcSAvik8781yEbqaNZR6q0YoJQ7uryWPQI9AzUAh4
	WT78FN7rrCnNqnM07pPRaL0jP7LBIgLrKWRdB+YB9Bsl4J0ho9w1KaPT7s+RYUai
	pgxPCK6NLotDLOMQIvxmko8xG3cK1LCYGpJbj0YDOLT0uCIwD/XRHuffJBLAD2Uw
	RGA9Po5dhxK6BpQjHfht53qD4YS8PGQBGMEiZCUpzDVO3ETaDA9R60bZ6YuzWXpz
	niJtG/d9ksmBJBQBV3ZSHK2pPFtzpkKWtYHZbIIX4VTHa/FnEFX37VWFcdxknZ7M
	M6aXT9peYhEWlxK5uP/qtH6FM0kAZTwZX1ik5lfuaA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46v0p2dgkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 14:50:29 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54QEoTnS031317;
	Mon, 26 May 2025 14:50:29 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46v0p2dgkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 14:50:29 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54QDxlM6007944;
	Mon, 26 May 2025 14:50:28 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46uu52x92f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 14:50:28 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54QEoOZY39452932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 May 2025 14:50:24 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E0FF2004B;
	Mon, 26 May 2025 14:50:24 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 920D920040;
	Mon, 26 May 2025 14:50:21 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 May 2025 14:50:21 +0000 (GMT)
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
Subject: [PATCH v6 1/5] drivers/base/node: Optimize memory block registration to reduce boot time
Date: Mon, 26 May 2025 09:50:09 -0500
Message-ID: <bc754a238aa91fa36be463985ccde66aac7055e7.1748270306.git.donettom@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 9m5wHoaXNkHJTuqSw01lPpyfD2GpJKV9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEyNCBTYWx0ZWRfXyJxD7Qy6E7vi 3GkPOIvF6XyFhrboyIFn/IVEYAo3Z6ae7qYFh1+3KWneBXT7WPRqSsmKxQA0D95jrAy4v9ggwjb AFpP3/cJnd3SgCUtvxBeNFYXZqVLZtYMlVoiJGxjog0nBMrXOth/OhPSkzEJ+bRkzZb/t+9Smgf
 kGiKz+ypM9lVBpb03RMxb46eSpNimH7uQDE+c+9lXu86bXdqbJKqd+y0nIMpItrVTCoDYCqXujh +7VxBbu5UNd51wn84A+lxNlYnyUqIODgzx07TEHGO/ffFWtrNMmLtYfZyqqolUl5KDp4hWh4pbz HAiFkxJ3MQDj0C7gUIXOwXeayQw4buNDFFekYBmEgN5W3rXS2vg6Cnm2DF/QeJCgmieFShVYeS9
 cyUHV062YL+Z5MI27KKvuEX+BGn099W0+1o0Go/yfduTM+0/TAO8Ys1UbnGdIac7Y1IhEm8Z
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68347fb5 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Ikd4Dj_1AAAA:8 a=EyhWesA9RUnP0l8RRygA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: HFrxyEeSbPIE2STio0VbNFeiUntGRFKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_07,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 clxscore=1015
 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505260124
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

Acked-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>

---

v5 -> v6

1. Changed function name register_memory_blocks_under_node_early() to register_memory_blocks_under_nodes()
2. Added memblock_get_region_node() to get the region node.

v5 - https://lore.kernel.org/all/d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com/
v4 - https://lore.kernel.org/all/f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com/
v3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
---
 drivers/base/memory.c  | 21 ++++-------------
 drivers/base/node.c    | 51 ++++++++++++++++++++++++++++++++++++++++--
 include/linux/memory.h | 19 +++++++++++++++-
 include/linux/node.h   |  3 +++
 4 files changed, 74 insertions(+), 20 deletions(-)

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
index cd13ef287011..20b6f4496e1b 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/swap.h>
 #include <linux/slab.h>
+#include <linux/memblock.h>
 
 static const struct bus_type node_subsys = {
 	.name = "node",
@@ -850,6 +851,47 @@ void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
 			  kobject_name(&node_devices[mem_blk->nid]->dev.kobj));
 }
 
+/*
+ * register_memory_blocks_under_nodes : Register the memory blocks
+ *                 under the nodes.
+ *
+ * This function registers all memory blocks to their corresponding nodes
+ * based on the associated memory regions. Each memory region is tied to
+ * a specific node and does not span multiple nodes. Therefore, all memory
+ * blocks within a given region are considered to belong to that node. The
+ * function iterates through each memory region and registers the memory
+ * blocks contained within that region to the respective node. Since memory
+ * blocks can span across multiple regions (and hence multiple nodes), a
+ * single memory block may be registered under more than one node if it
+ * overlaps with regions belonging to different nodes.
+ */
+static void register_memory_blocks_under_nodes(void)
+{
+	struct memblock_region *r;
+
+	for_each_mem_region(r) {
+		const unsigned long start_block_id = phys_to_block_id(r->base);
+		const unsigned long end_block_id = phys_to_block_id(r->base + r->size - 1);
+		unsigned long block_id;
+		int nid = memblock_get_region_node(r);
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
@@ -971,11 +1013,16 @@ void __init node_dev_init(void)
 
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
+	/*
+	 * Link the node to memory block devices
+	 */
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


