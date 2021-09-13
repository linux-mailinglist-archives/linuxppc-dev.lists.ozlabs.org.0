Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE8C408B6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 14:58:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7RP45Y6gz2yw6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 22:58:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K60K4oqS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=K60K4oqS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7RNG717rz2xtT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 22:57:50 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18DAYF9J018803;
 Mon, 13 Sep 2021 08:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=LF1t6WdCz2unmIfqD3P7k9V0vfXdQcq7fnN1UbKvk0Y=;
 b=K60K4oqS3lwzUIZDZ/VWokIru4MqbjJz0xhSvGGdomBWt91cq4rynfXkt48HD4HiKBEI
 MQb/H4dsMpMGXMvvCyS9pEDturNhNpzzQ78ABRz8yZmEXapb0vabt/Yj0lcD1+36jgOU
 /nijkDCz+5vVaGTfV3gjltuyg04LJ5ac5+darHt/EPa6Bq76w3HcQyAGXssCnHQoDDrU
 3QjFpah74Fht2g39cCJ9DA9ejUW7Ip7gctOp2BpSP0d3IJaS+PmpgLyKMfhVWQbiVik4
 +8jsiQk+FPJqHJLtCp2vTzmxNTXyymSlfceWqRbyomM9V9SYYIzPulI1awjlAOEQtQZd Ww== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b232aeha5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 08:57:30 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18DCq7PK020582;
 Mon, 13 Sep 2021 12:57:27 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3b0m38qqj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 12:57:27 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18DCqvpo57999764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Sep 2021 12:52:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 508BC11C04C;
 Mon, 13 Sep 2021 12:57:24 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7764B11C05E;
 Mon, 13 Sep 2021 12:57:20 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.43.55.225])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Sep 2021 12:57:20 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3] powerpc/numa: Fill distance_lookup_table for offline nodes
Date: Mon, 13 Sep 2021 18:27:08 +0530
Message-Id: <20210913125708.135670-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BQNunjbAQypGkTQ9Hu4xfeaTfpFVts1-
X-Proofpoint-ORIG-GUID: BQNunjbAQypGkTQ9Hu4xfeaTfpFVts1-
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130046
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
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Ingo Molnar <mingo@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Scheduler expects the number of unique node distances to be available
at boot. It iterates over all pairs of nodes and records
node_distance() for that pair, and then calculates the set of unique
distances. As per PAPR, node distances for offline nodes is not
available. However, PAPR already exposes unique possible node
distances. Fake the offline node's distance_lookup_table entries so
that all possible node distances are updated.

However this only needs to be done if the number of unique node
distances that can be computed for online nodes is less than the
number of possible unique node distances as represented by
distance_ref_points_depth. When the node is actually onlined,
distance_lookup_table will be updated with actual entries.

Cc: linuxppc-dev@lists.ozlabs.org
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Cc: kernel test robot <lkp@intel.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog:
v2: https://lore.kernel.org/linuxppc-dev/20210821102535.169643-4-srikar@linux.vnet.ibm.com/t/#u
- Updated changelog
- Updated variable names
- Rebased to newer branch
- tweaked the WARN if the depth is greater than sizeof(long)
- All of the above based on comments from Michael Ellerman

v1: https://lore.kernel.org/linuxppc-dev/20210701041552.112072-3-srikar@linux.vnet.ibm.com/t/#u
[ Fixed a missing prototype warning Reported-by: kernel test robot <lkp@intel.com>]

 arch/powerpc/mm/numa.c | 68 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 6f14c8fb6359..5ac9f20ebbc8 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1079,6 +1079,73 @@ void __init dump_numa_cpu_topology(void)
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
+static void __init fake_update_distance_lookup_table(void)
+{
+	unsigned long distance_map;
+	int i, cur_depth, max_depth, node;
+
+	if (!numa_enabled)
+		return;
+
+	if (affinity_form != FORM1_AFFINITY)
+		return;
+
+	/*
+	 * distance_ref_points_depth lists the unique numa domains
+	 * available. However it ignore LOCAL_DISTANCE. So add +1
+	 * to get the actual number of unique distances.
+	 */
+	max_depth = distance_ref_points_depth + 1;
+
+	if (max_depth > sizeof(distance_map)) {
+		WARN(1, "Max depth %d > %ld\n", max_depth, sizeof(distance_map));
+		max_depth = sizeof(distance_map);
+	}
+
+	bitmap_zero(&distance_map, max_depth);
+	bitmap_set(&distance_map, 0, 1);
+
+	for_each_online_node(node) {
+		int nd, distance;
+
+		if (node == first_online_node)
+			continue;
+
+		nd = __node_distance(node, first_online_node);
+		for (i = 0, distance = LOCAL_DISTANCE; i < max_depth; i++, distance *= 2) {
+			if (distance == nd) {
+				bitmap_set(&distance_map, i, 1);
+				break;
+			}
+		}
+		cur_depth = bitmap_weight(&distance_map, max_depth);
+		if (cur_depth == max_depth)
+			return;
+	}
+
+	for_each_node(node) {
+		if (node_online(node))
+			continue;
+
+		i = find_first_zero_bit(&distance_map, max_depth);
+		bitmap_set(&distance_map, i, 1);
+		while (i--)
+			distance_lookup_table[node][i] = node;
+
+		cur_depth = bitmap_weight(&distance_map, max_depth);
+		if (cur_depth == max_depth)
+			return;
+	}
+}
+
 /* Initialize NODE_DATA for a node on the local memory */
 static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
 {
@@ -1201,6 +1268,7 @@ void __init mem_topology_setup(void)
 		 */
 		numa_setup_cpu(cpu);
 	}
+	fake_update_distance_lookup_table();
 }
 
 void __init initmem_init(void)
-- 
2.27.0

