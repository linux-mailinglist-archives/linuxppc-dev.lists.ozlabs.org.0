Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC25430D2BC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 06:03:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVqMk5p4czDww5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 16:03:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EXArw6TF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVqFf0lCGzDwqd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 15:58:29 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1134Xdg6063344; Tue, 2 Feb 2021 23:58:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aHkbgF+19HjTCFG4Y+B9Sm8NgPquUjfAZBW0B40kPKM=;
 b=EXArw6TF3eqvZr7pz9X4mW6kEOVsMe5hvzCicYq8Rorfr8Aoeb1QUe6MFpRd0Q36S5Vp
 5zWBJaPfIYpDb9MjlGgbMRbQ1bx1X3FDXCdGFKgY5LnQH/zngX1Vj2Rhk3leL9QcTu+1
 KwsuuKfbyu5ICO6N1u69fM6/7+yoSA2Qf5Y7iAq4J3Y4dsYdptH/aiQ868CkueSEjVLp
 5i7R1YxbKZzOCJSIfdD0Y4Cq3TluCFngdop7RycSnMBTdosSMBR0cCkhrIevLjwhp8om
 s6KXdNE0OCUfbppokTy/5xZrJZwJBRDcv2caMKN6frIELQd+RhP3LtoGN/cPKhTsaFVo Hw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fm83hbgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 23:58:26 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1134uA3W028704;
 Wed, 3 Feb 2021 04:58:25 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 36ex3ntm1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 04:58:25 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1134wOlR26149254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 04:58:24 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79A0D28058;
 Wed,  3 Feb 2021 04:58:24 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FDDF2805C;
 Wed,  3 Feb 2021 04:58:23 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.69.155])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  3 Feb 2021 04:58:22 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 3/3] powerpc/mm: Remove dcache flush from memory remove.
Date: Wed,  3 Feb 2021 10:28:12 +0530
Message-Id: <20210203045812.234439-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203045812.234439-1-aneesh.kumar@linux.ibm.com>
References: <20210203045812.234439-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_01:2021-02-02,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030024
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We added dcache flush on memory add/remove in
commit fb5924fddf9e ("powerpc/mm: Flush cache on memory hot(un)plug")
to handle crashes on GPU hotplug. Instead of adding dcache flush in
generic memory add/remove routine which is used even for regular
memory, we should handle these devices specific flush in the device
driver code.

memtrace did handle this in the driver and that was removed by
commit 7fd6641de28f ("powerpc/powernv/memtrace: Let the arch
hotunplug code flush cache"). This patch reverts that commit.

The dcache flush in memory add was removed by
Fixes: ea458effa88e ("powerpc: Don't flush caches when adding memory")
which I don't think is correct. The reason why we require dcache flush
in memtrace is to make sure we don't have a dirty cache when we remap
a pfn to cache inhibited. We should do that when the memtrace module
removes the memory and make the pfn available for HTM traces to map it
as cache inhibited.

The other device mentioned in
commit fb5924fddf9e ("powerpc/mm: Flush cache on memory hot(un)plug") is
nvlink device with coherent memory. The support for that was removed in
commit 3182215dd0b2 ("powerpc/powernv/npu: Remove NPU DMA ops")
and commit 25b2995a35b6 ("mm: remove MEMORY_DEVICE_PUBLIC support")

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/mem.c                     | 22 -----------------
 arch/powerpc/platforms/powernv/memtrace.c | 29 +++++++++++++++++++++++
 2 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 883e67d37bbc..4e8ce6d85232 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -91,27 +91,6 @@ int __weak remove_section_mapping(unsigned long start, unsigned long end)
 	return -ENODEV;
 }
 
-#define FLUSH_CHUNK_SIZE SZ_1G
-/**
- * flush_dcache_range_chunked(): Write any modified data cache blocks out to
- * memory and invalidate them, in chunks of up to FLUSH_CHUNK_SIZE
- * Does not invalidate the corresponding instruction cache blocks.
- *
- * @start: the start address
- * @stop: the stop address (exclusive)
- * @chunk: the max size of the chunks
- */
-static void flush_dcache_range_chunked(unsigned long start, unsigned long stop,
-				       unsigned long chunk)
-{
-	unsigned long i;
-
-	for (i = start; i < stop; i += chunk) {
-		flush_dcache_range(i, min(stop, i + chunk));
-		cond_resched();
-	}
-}
-
 int __ref arch_create_linear_mapping(int nid, u64 start, u64 size,
 				     struct mhp_params *params)
 {
@@ -136,7 +115,6 @@ void __ref arch_remove_linear_mapping(u64 start, u64 size)
 
 	/* Remove htab bolted mappings for this section of memory */
 	start = (unsigned long)__va(start);
-	flush_dcache_range_chunked(start, start + size, FLUSH_CHUNK_SIZE);
 
 	mutex_lock(&linear_mapping_mutex);
 	ret = remove_section_mapping(start, start + size);
diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
index 5fc9408bb0b3..019669eb21d2 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -19,6 +19,7 @@
 #include <linux/numa.h>
 #include <asm/machdep.h>
 #include <asm/debugfs.h>
+#include <asm/cacheflush.h>
 
 /* This enables us to keep track of the memory removed from each node. */
 struct memtrace_entry {
@@ -51,6 +52,27 @@ static const struct file_operations memtrace_fops = {
 	.open	= simple_open,
 };
 
+#define FLUSH_CHUNK_SIZE SZ_1G
+/**
+ * flush_dcache_range_chunked(): Write any modified data cache blocks out to
+ * memory and invalidate them, in chunks of up to FLUSH_CHUNK_SIZE
+ * Does not invalidate the corresponding instruction cache blocks.
+ *
+ * @start: the start address
+ * @stop: the stop address (exclusive)
+ * @chunk: the max size of the chunks
+ */
+static void flush_dcache_range_chunked(unsigned long start, unsigned long stop,
+				       unsigned long chunk)
+{
+	unsigned long i;
+
+	for (i = start; i < stop; i += chunk) {
+		flush_dcache_range(i, min(stop, i + chunk));
+		cond_resched();
+	}
+}
+
 static void memtrace_clear_range(unsigned long start_pfn,
 				 unsigned long nr_pages)
 {
@@ -62,6 +84,13 @@ static void memtrace_clear_range(unsigned long start_pfn,
 			cond_resched();
 		clear_page(__va(PFN_PHYS(pfn)));
 	}
+	/*
+	 * Before we go ahead and use this range as cache inhibited range
+	 * flush the cache.
+	 */
+	flush_dcache_range_chunked(PFN_PHYS(start_pfn),
+				   PFN_PHYS(start_pfn + nr_pages),
+				   FLUSH_CHUNK_SIZE);
 }
 
 static u64 memtrace_alloc_node(u32 nid, u64 size)
-- 
2.29.2

