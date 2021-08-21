Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8BC3F3A36
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 12:28:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GsF950mfqz3cXS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 20:28:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aP4DnCnj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aP4DnCnj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GsF5x0LDHz2yLm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Aug 2021 20:26:12 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17LA45ti096807; Sat, 21 Aug 2021 06:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=h0Ta1oGqWhzVGq4NRuIpPe2H/eTJC8OyiJYJaYIvExI=;
 b=aP4DnCnj8DTRBNMeu3qwTlR2szgmbU4ValWicXGfdKMk762eysoe/6VsOVMyjRc4z0yR
 CDFQWGs3df+u/FoyFxonoY8YasEQQaXjPlVtW6sKhilsGkRA0etvgceIoKPb4h227ZVV
 IaVuD8lgacxLkP/9wywZquNmBYUtgNlTqmayCeV7q46LMk+tPvmNifQUlyvYfHir7Stf
 XDJymQYRhVnYaArFIPflGw/Sco9/pjHjn/6RhAM0kResRnLaQJC5G0SoiDwRRvkKa+8P
 BQ7WM0utJkRb7Now500sMxjCkjXDJ/4Eikii1eXdbQfGn4dX5djk7aZAFlAygmvkoYLq Ng== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ajter5bu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Aug 2021 06:26:01 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17LA9JaJ018399;
 Sat, 21 Aug 2021 10:25:58 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3ajs488egt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Aug 2021 10:25:58 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17LAMI3359900412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 21 Aug 2021 10:22:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26E8911C011;
 Sat, 21 Aug 2021 10:25:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9EC111C013;
 Sat, 21 Aug 2021 10:25:50 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.85.90.43])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 21 Aug 2021 10:25:50 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 3/3] powerpc/numa: Fill distance_lookup_table for offline
 nodes
Date: Sat, 21 Aug 2021 15:55:35 +0530
Message-Id: <20210821102535.169643-4-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
References: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DtNlpwDZdWFjvlWRX1KXroNIVTZAqB20
X-Proofpoint-GUID: DtNlpwDZdWFjvlWRX1KXroNIVTZAqB20
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-21_03:2021-08-20,
 2021-08-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108210059
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

Scheduler expects unique number of node distances to be available at
boot. It uses node distance to calculate this unique node distances.
On POWER, node distances for offline nodes is not available. However,
POWER already knows unique possible node distances. Fake the offline
node's distance_lookup_table entries so that all possible node
distances are updated.

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
 arch/powerpc/mm/numa.c | 70 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

Changelog:
v1: https://lore.kernel.org/linuxppc-dev/20210701041552.112072-3-srikar@linux.vnet.ibm.com/t/#u
[ Fixed a missing prototype warning Reported-by: kernel test robot <lkp@intel.com>]

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 3c124928a16d..0ee79a08c9e1 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -856,6 +856,75 @@ void __init dump_numa_cpu_topology(void)
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
@@ -971,6 +1040,7 @@ void __init mem_topology_setup(void)
 		 */
 		numa_setup_cpu(cpu);
 	}
+	fake_update_distance_lookup_table();
 }
 
 void __init initmem_init(void)
-- 
2.18.2

