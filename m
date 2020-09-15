Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCB126AB47
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 19:57:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrWCQ0gXgzDqWL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 03:57:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrW9K1mLvzDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 03:55:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BokYlAUY; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BrW9J5B04z8tF4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 03:55:32 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BrW9J4VrKz9sTt; Wed, 16 Sep 2020 03:55:32 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BokYlAUY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BrW9H66ztz9sSn
 for <linuxppc-dev@ozlabs.org>; Wed, 16 Sep 2020 03:55:31 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08FHjRou120764; Tue, 15 Sep 2020 13:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=EE2yzL+woz+F1DWQ1rUUzsjDO78SCb+qe/hkxFzZl7w=;
 b=BokYlAUYKg1tTE/qL5F9gXAXdXZTfoBLYPqBorPlX8xuFwGt1qAb+HHmsEph3fnwyIo3
 W6waWM3igrHBpuoaCoapLITPj/LPwBRmJPNAt9tVaKQIF7x7l3zXs5/uHKZNc1wPTjQV
 aWwHft4Rg9gCC2gYGcb9ik/3BuWYUQzSZ1ly9tvWXDeIwWIeX7C/W04NrdezzJ5EjTSO
 HDTcx334vT6/bid188MKDoxZrMlWwi7DK1AWjL8rHJeNwW8hDF2y10lKIm9ksewYOr6t
 cjtEiEgzvfp0TdcLZi/39Nm/QHmv+XAwkFD2r8G7ZNQEyWHbACGNvrB6FmZHJWd4sCQk FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33k29vr62r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2020 13:55:28 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08FHjrrU121953;
 Tue, 15 Sep 2020 13:55:28 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33k29vr62k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2020 13:55:27 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08FHqKm3022881;
 Tue, 15 Sep 2020 17:55:27 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 33gny9191n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2020 17:55:27 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08FHtQU951970512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Sep 2020 17:55:27 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3608124053;
 Tue, 15 Sep 2020 17:55:26 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 603BA124054;
 Tue, 15 Sep 2020 17:55:26 +0000 (GMT)
Received: from rascal.austin.ibm.com (unknown [9.41.179.32])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 15 Sep 2020 17:55:26 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2] pseries/hotplug-memory: hot-add: skip redundant LMB lookup
Date: Tue, 15 Sep 2020 12:55:26 -0500
Message-Id: <20200915175526.3324209-1-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-15_12:2020-09-15,
 2020-09-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150137
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During memory hot-add, dlpar_add_lmb() calls memory_add_physaddr_to_nid()
to determine which node id (nid) to use when later calling __add_memory().

This is wasteful.  On pseries, memory_add_physaddr_to_nid() finds an
appropriate nid for a given address by looking up the LMB containing the
address and then passing that LMB to of_drconf_to_nid_single() to get the
nid.  In dlpar_add_lmb() we get this address from the LMB itself.

In short, we have a pointer to an LMB and then we are searching for
that LMB *again* in order to find its nid.

If we call of_drconf_to_nid_single() directly from dlpar_add_lmb() we
can skip the redundant lookup.  The only error handling we need to
duplicate from memory_add_physaddr_to_nid() is the fallback to the
default nid when drconf_to_nid_single() returns -1 (NUMA_NO_NODE) or
an invalid nid.

Skipping the extra lookup makes hot-add operations faster, especially
on machines with many LMBs.

Consider an LPAR with 126976 LMBs.  In one test, hot-adding 126000
LMBs on an upatched kernel took ~3.5 hours while a patched kernel
completed the same operation in ~2 hours:

Unpatched (12450 seconds):
Sep  9 04:06:31 ltc-brazos1 drmgr[810169]: drmgr: -c mem -a -q 126000
Sep  9 04:06:31 ltc-brazos1 kernel: pseries-hotplug-mem: Attempting to hot-add 126000 LMB(s)
[...]
Sep  9 07:34:01 ltc-brazos1 kernel: pseries-hotplug-mem: Memory at 20000000 (drc index 80000002) was hot-added

Patched (7065 seconds):
Sep  8 21:49:57 ltc-brazos1 drmgr[877703]: drmgr: -c mem -a -q 126000
Sep  8 21:49:57 ltc-brazos1 kernel: pseries-hotplug-mem: Attempting to hot-add 126000 LMB(s)
[...]
Sep  8 23:27:42 ltc-brazos1 kernel: pseries-hotplug-mem: Memory at 20000000 (drc index 80000002) was hot-added

It should be noted that the speedup grows more substantial when
hot-adding LMBs at the end of the drconf range.  This is because we
are skipping a linear LMB search.

To see the distinction, consider smaller hot-add test on the same
LPAR.  A perf-stat run with 10 iterations showed that hot-adding 4096
LMBs completed less than 1 second faster on a patched kernel:

Unpatched:
 Performance counter stats for 'drmgr -c mem -a -q 4096' (10 runs):

        104,753.42 msec task-clock                #    0.992 CPUs utilized            ( +-  0.55% )
             4,708      context-switches          #    0.045 K/sec                    ( +-  0.69% )
             2,444      cpu-migrations            #    0.023 K/sec                    ( +-  1.25% )
               394      page-faults               #    0.004 K/sec                    ( +-  0.22% )
   445,902,503,057      cycles                    #    4.257 GHz                      ( +-  0.55% )  (66.67%)
     8,558,376,740      stalled-cycles-frontend   #    1.92% frontend cycles idle     ( +-  0.88% )  (49.99%)
   300,346,181,651      stalled-cycles-backend    #   67.36% backend cycles idle      ( +-  0.76% )  (50.01%)
   258,091,488,691      instructions              #    0.58  insn per cycle
                                                  #    1.16  stalled cycles per insn  ( +-  0.22% )  (66.67%)
    70,568,169,256      branches                  #  673.660 M/sec                    ( +-  0.17% )  (50.01%)
     3,100,725,426      branch-misses             #    4.39% of all branches          ( +-  0.20% )  (49.99%)

           105.583 +- 0.589 seconds time elapsed  ( +-  0.56% )

Patched:
 Performance counter stats for 'drmgr -c mem -a -q 4096' (10 runs):

        104,055.69 msec task-clock                #    0.993 CPUs utilized            ( +-  0.32% )
             4,606      context-switches          #    0.044 K/sec                    ( +-  0.20% )
             2,463      cpu-migrations            #    0.024 K/sec                    ( +-  0.93% )
               394      page-faults               #    0.004 K/sec                    ( +-  0.25% )
   442,951,129,921      cycles                    #    4.257 GHz                      ( +-  0.32% )  (66.66%)
     8,710,413,329      stalled-cycles-frontend   #    1.97% frontend cycles idle     ( +-  0.47% )  (50.06%)
   299,656,905,836      stalled-cycles-backend    #   67.65% backend cycles idle      ( +-  0.39% )  (50.02%)
   252,731,168,193      instructions              #    0.57  insn per cycle
                                                  #    1.19  stalled cycles per insn  ( +-  0.20% )  (66.66%)
    68,902,851,121      branches                  #  662.173 M/sec                    ( +-  0.13% )  (49.94%)
     3,100,242,882      branch-misses             #    4.50% of all branches          ( +-  0.15% )  (49.98%)

           104.829 +- 0.325 seconds time elapsed  ( +-  0.31% )

This is consistent.  An add-by-count hot-add operation adds LMBs
greedily, so LMBs near the start of the drconf range are considered
first.  On an otherwise idle LPAR with so many LMBs we would expect to
find the LMBs we need near the start of the drconf range, hence the
smaller speedup.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
Changelog:

v1: https://lore.kernel.org/linuxppc-dev/20200910175637.2865160-1-cheloha@linux.ibm.com/

v2:
- Move prototype for of_drconf_to_nid_single() to topology.h.
  Requested by Michael Ellerman.

 arch/powerpc/include/asm/topology.h           |   2 +
 arch/powerpc/mm/numa.c                        |   2 +-
 .../platforms/pseries/hotplug-memory.c        | 101 +++++++-----------
 3 files changed, 44 insertions(+), 61 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index f0b6300e7dd3..afd7e0513a65 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -96,6 +96,8 @@ static inline int find_and_online_cpu_nid(int cpu)
 
 #endif /* CONFIG_NUMA && CONFIG_PPC_SPLPAR */
 
+extern int of_drconf_to_nid_single(struct drmem_lmb *);
+
 #include <asm-generic/topology.h>
 
 #ifdef CONFIG_SMP
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 1f61fa2148b5..63507b47164d 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -430,7 +430,7 @@ static int of_get_assoc_arrays(struct assoc_arrays *aa)
  * This is like of_node_to_nid_single() for memory represented in the
  * ibm,dynamic-reconfiguration-memory node.
  */
-static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
+int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 {
 	struct assoc_arrays aa = { .arrays = NULL };
 	int default_nid = NUMA_NO_NODE;
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 0ea976d1cac4..f4474ef91fe5 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -388,108 +388,87 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 {
 	struct drmem_lmb *lmb;
-	int lmbs_removed = 0;
-	int lmbs_available = 0;
+	u32 lmbs_available, lmbs_removed;
 	int rc;
+	boolean readd;
 
-	pr_info("Attempting to hot-remove %d LMB(s)\n", lmbs_to_remove);
+	lmbs_available = lmbs_removed = 0;
+	readd = false;
 
-	if (lmbs_to_remove == 0)
-		return -EINVAL;
+	pr_info("attempting to hot-remove %u LMB(s)\n", lmbs_to_remove);
 
 	/* Validate that there are enough LMBs to satisfy the request */
 	for_each_drmem_lmb(lmb) {
-		if (lmb_is_removable(lmb))
-			lmbs_available++;
-
 		if (lmbs_available == lmbs_to_remove)
 			break;
+		if (lmb_is_removable(lmb))
+			lmbs_available++;
 	}
 
 	if (lmbs_available < lmbs_to_remove) {
-		pr_info("Not enough LMBs available (%d of %d) to satisfy request\n",
+		pr_info("hot-remove failed: insufficient LMB(s): have %u/%u\n",
 			lmbs_available, lmbs_to_remove);
 		return -EINVAL;
 	}
 
 	for_each_drmem_lmb(lmb) {
-		rc = dlpar_remove_lmb(lmb);
-		if (rc)
+		if (lmbs_removed == lmbs_to_remove)
+			break;
+		if (dlpar_remove_lmb(lmb))
 			continue;
 
-		/* Mark this lmb so we can add it later if all of the
-		 * requested LMBs cannot be removed.
+		/*
+		 * Success!  Mark the LMB so we can readd it later if
+		 * the request fails.
 		 */
 		drmem_mark_lmb_reserved(lmb);
-
 		lmbs_removed++;
-		if (lmbs_removed == lmbs_to_remove)
-			break;
+		pr_debug("hot-removed LMB %u\n", lmb->drc_index);
 	}
 
 	if (lmbs_removed != lmbs_to_remove) {
-		pr_err("Memory hot-remove failed, adding LMB's back\n");
-
-		for_each_drmem_lmb(lmb) {
-			if (!drmem_lmb_reserved(lmb))
-				continue;
+		pr_err("hot-remove failed: readding LMB(s)\n");
+		readd = true;
+	}
 
-			rc = dlpar_add_lmb(lmb);
-			if (rc)
-				pr_err("Failed to add LMB back, drc index %x\n",
+	for_each_drmem_lmb(lmb) {
+		if (!drmem_lmb_reserved(lmb))
+			continue;
+		if (readd) {
+			if (dlpar_add_lmb(lmb)) {
+				pr_err("failed to readd LMB %u\n",
 				       lmb->drc_index);
-
-			drmem_remove_lmb_reservation(lmb);
-		}
-
-		rc = -EINVAL;
-	} else {
-		for_each_drmem_lmb(lmb) {
-			if (!drmem_lmb_reserved(lmb))
-				continue;
-
+			}
+		} else
 			dlpar_release_drc(lmb->drc_index);
-			pr_info("Memory at %llx was hot-removed\n",
-				lmb->base_addr);
-
-			drmem_remove_lmb_reservation(lmb);
-		}
-		rc = 0;
+		drmem_remove_lmb_reservation(lmb);
 	}
 
-	return rc;
+	return (readd) ? -EINVAL : 0;
 }
 
 static int dlpar_memory_remove_by_index(u32 drc_index)
 {
 	struct drmem_lmb *lmb;
-	int lmb_found;
 	int rc;
 
-	pr_info("Attempting to hot-remove LMB, drc index %x\n", drc_index);
-
 	lmb_found = 0;
 	for_each_drmem_lmb(lmb) {
 		if (lmb->drc_index == drc_index) {
-			lmb_found = 1;
 			rc = dlpar_remove_lmb(lmb);
-			if (!rc)
+			if (!rc) {
 				dlpar_release_drc(lmb->drc_index);
-
-			break;
+				pr_info("hot-removed LMB %u\n", drc_index);
+			} else {
+				pr_err("failed to hot-remove LMB %u\n",
+				       drc_index);
+			}
+			return rc;
 		}
 	}
 
-	if (!lmb_found)
-		rc = -EINVAL;
-
-	if (rc)
-		pr_info("Failed to hot-remove memory at %llx\n",
-			lmb->base_addr);
-	else
-		pr_info("Memory at %llx was hot-removed\n", lmb->base_addr);
-
-	return rc;
+	pr_err("failed to hot-remove LMB %u: no such LMB\n", drc_index);
+	return -EINVAL;
 }
 
 static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
@@ -611,8 +590,10 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 
 	block_sz = memory_block_size_bytes();
 
-	/* Find the node id for this address. */
-	nid = memory_add_physaddr_to_nid(lmb->base_addr);
+	/* Find the node id for this LMB.  Fake one if necessary. */
+	nid = of_drconf_to_nid_single(lmb);
+	if (nid < 0 || !node_possible(nid))
+		nid = first_online_node;
 
 	/* Add the memory */
 	rc = __add_memory(nid, lmb->base_addr, block_sz);
-- 
2.24.1

