Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F366A3B8CDB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 06:17:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFlL062rpz3bXC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 14:17:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fdaZ5lqi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fdaZ5lqi; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFlK371wTz2yN3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 14:16:39 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161466Kb077183; Thu, 1 Jul 2021 00:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=oPIuBBPZ70P+PF/7mhNIHUEPApm7nDezaCT2pZZbVZw=;
 b=fdaZ5lqitbHPfHwZjgMFP7jPbeKosEfr1Idj7lW/roH4vqMDS5u22PIpdVrZyV3bAbAP
 Ru1q2zRdxMbAk99/oAbIHkkqCxJmcMA+er/OFbTAsIdxXB5PRWWf8Q3KMJkfZCRkX/RG
 KrpN2naQkWTjRlSRKWHXulK5fevJW69zu2BsY8XA08uJswILBdNbB6j2uIUSjOqc0CdJ
 mFxZskoXVcM/OFcEugZCsyw3cqg+Mk8OEbG3REq/Zbacf8S3KhmWQhBQDrqsNBeweiDj
 RhsYVDVjkvnQqm2u/ZL8CheOjpgPcjGz2Xnx+uzAzDJRkitvS+RsbJb/q4ZYn1KcPgYs Pw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gwhuw3qk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 00:16:22 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1614C1IL005182;
 Thu, 1 Jul 2021 04:16:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 39duv8j5jq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 04:16:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1614GINs21496226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 04:16:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1576C11C069;
 Thu,  1 Jul 2021 04:16:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8CC711C05B;
 Thu,  1 Jul 2021 04:16:14 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.85.122.203])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Jul 2021 04:16:14 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 2/2] powerpc/numa: Fill distance_lookup_table for offline
 nodes
Date: Thu,  1 Jul 2021 09:45:52 +0530
Message-Id: <20210701041552.112072-3-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210701041552.112072-1-srikar@linux.vnet.ibm.com>
References: <20210701041552.112072-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: m4NvHT9SNR3226OZ_T9x72LK9YghuLAT
X-Proofpoint-GUID: m4NvHT9SNR3226OZ_T9x72LK9YghuLAT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010027
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Rik van Riel <riel@surriel.com>,
 linuxppc-dev@lists.ozlabs.org,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently scheduler populates the distance map by looking at distance
of each node from all other nodes. This should work for most
architectures and platforms.

Scheduler expects unique number of node distances to be available at
boot. It uses node distance to calculate this unique node distances.
On Power Servers, node distances for offline nodes is not available.
However, Power Servers already knows unique possible node distances.
Fake the offline node's distance_lookup_table entries so that all
possible node distances are updated.

For example distance info from numactl from a fully populated 8 node
system at boot may look like this.

node distances:
node   0   1   2   3   4   5   6   7
  0:  10  20  40  40  40  40  40  40
  1:  20  10  40  40  40  40  40  40
  2:  40  40  10  20  40  40  40  40
  3:  40  40  20  10  40  40  40  40
  4:  40  40  40  40  10  20  40  40
  5:  40  40  40  40  20  10  40  40
  6:  40  40  40  40  40  40  10  20
  7:  40  40  40  40  40  40  20  10

However the same system when only two nodes are online at boot, then
distance info from numactl will look like
node distances:
node   0   1
  0:  10  20
  1:  20  10

It may be implementation dependent on what node_distance(0,3) where
node 0 is online and node 3 is offline. In Power Servers case, it returns
LOCAL_DISTANCE(10). Here at boot the scheduler would assume that the max
distance between nodes is 20. However that would not be true.

When Nodes are onlined and CPUs from those nodes are hotplugged,
the max node distance would be 40.

However this only needs to be done if the number of unique node
distances that can be computed for online nodes is less than the
number of possible unique node distances as represented by
distance_ref_points_depth. When the node is actually onlined,
distance_lookup_table will be updated with actual entries.

Cc: LKML <linux-kernel@vger.kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Reported-by: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog v1->v2:
Move to a Powerpc specific solution as suggested by Peter and Valentin

 arch/powerpc/mm/numa.c | 70 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index f2bf98bdcea2..6d0d89127190 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -860,6 +860,75 @@ void __init dump_numa_cpu_topology(void)
 	}
 }
 
+/*
+ * Scheduler expects unique number of node distances to be available at
+ * boot. It uses node distance to calculate this unique node distances. On
+ * POWER, node distances for offline nodes is not available. However, POWER
+ * already knows unique possible node distances. Fake the offline node's
+ * distance_lookup_table entries so that all possible node distances are
+ * updated.
+ */
+void __init fake_update_distance_lookup_table(void)
+{
+	unsigned long distance_map;
+	int i, nr_levels, nr_depth, node;
+
+	if (!numa_enabled)
+		return;
+
+	if (!form1_affinity)
+		return;
+
+	/*
+	 * distance_ref_points_depth lists the unique numa domains
+	 * available. However it ignore LOCAL_DISTANCE. So add +1
+	 * to get the actual number of unique distances.
+	 */
+	nr_depth = distance_ref_points_depth + 1;
+
+	WARN_ON(nr_depth > sizeof(distance_map));
+
+	bitmap_zero(&distance_map, nr_depth);
+	bitmap_set(&distance_map, 0, 1);
+
+	for_each_online_node(node) {
+		int nd, distance = LOCAL_DISTANCE;
+
+		if (node == first_online_node)
+			continue;
+
+		nd = __node_distance(node, first_online_node);
+		for (i = 0; i < nr_depth; i++, distance *= 2) {
+			if (distance == nd) {
+				bitmap_set(&distance_map, i, 1);
+				break;
+			}
+		}
+		nr_levels = bitmap_weight(&distance_map, nr_depth);
+		if (nr_levels == nr_depth)
+			return;
+	}
+
+	for_each_node(node) {
+		if (node_online(node))
+			continue;
+
+		i = find_first_zero_bit(&distance_map, nr_depth);
+		if (i >= nr_depth || i == 0) {
+			pr_warn("Levels(%d) not matching levels(%d)", nr_levels, nr_depth);
+			return;
+		}
+
+		bitmap_set(&distance_map, i, 1);
+		while (i--)
+			distance_lookup_table[node][i] = node;
+
+		nr_levels = bitmap_weight(&distance_map, nr_depth);
+		if (nr_levels == nr_depth)
+			return;
+	}
+}
+
 /* Initialize NODE_DATA for a node on the local memory */
 static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
 {
@@ -975,6 +1044,7 @@ void __init mem_topology_setup(void)
 		 */
 		numa_setup_cpu(cpu);
 	}
+	fake_update_distance_lookup_table();
 }
 
 void __init initmem_init(void)
-- 
2.27.0

