Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D42C73F851A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 12:10:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwJWr4l3Qz3cCx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 20:10:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tfHZHle+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tfHZHle+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwJQY4N6kz3c4g
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 20:06:13 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17QA3WoI066238; Thu, 26 Aug 2021 06:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=VP+B0KnRS6rU4WavJQMVD5cx+wlQvTWVEaPc9e+/zFE=;
 b=tfHZHle+MT9gvHZvAi8xTx4zRz7z6bHi/apwnhW5uJjELc1m6Xx9+9bVRFXGo1jMI/F4
 AAjOOU4vCVVGAPW/WoWfpMqqik9teNHIFNnxj9PvwmLRWTyb0qS3aKGSjKFSgFW2tfL7
 67qB/faArK+3GaS7Cco2YQ4hgDUXVAyh1gAA0IfDO/NAThTBUNI+7CWv6Pi6MM3um4ck
 yDxBfMuObH1G3gKlsI+UY101ksKs5wHORgaXRnX/dE9eKktjhN7QkWlUfpzTFRSavCbC
 dvYtgDSG8Mp4nsFns9iZzKe4pNKb8gNwJQwdzkMRAyKg0lf0GvYgv9Ebt8XWfwtW3Kn9 fA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ap3u9yar3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 06:05:59 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17QA2uBG018611;
 Thu, 26 Aug 2021 10:05:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3ajs48fnna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 10:05:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17QA5prE35979632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Aug 2021 10:05:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48ABEAE053;
 Thu, 26 Aug 2021 10:05:51 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB92AAE061;
 Thu, 26 Aug 2021 10:05:46 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.43.43.205])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Aug 2021 10:05:46 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 5/5] powerpc/numa: Fill distance_lookup_table for offline
 nodes
Date: Thu, 26 Aug 2021 15:35:21 +0530
Message-Id: <20210826100521.412639-6-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826100521.412639-1-srikar@linux.vnet.ibm.com>
References: <20210826100521.412639-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: U5po7jAXND8PaILeZwGxQEnSJCVOt-g6
X-Proofpoint-ORIG-GUID: U5po7jAXND8PaILeZwGxQEnSJCVOt-g6
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-26_02:2021-08-26,
 2021-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108260061
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
index 87ade2f56f45..afa2ede4ac53 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -849,6 +849,75 @@ void __init dump_numa_cpu_topology(void)
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
@@ -964,6 +1033,7 @@ void __init mem_topology_setup(void)
 		 */
 		numa_setup_cpu(cpu);
 	}
+	fake_update_distance_lookup_table();
 }
 
 void __init initmem_init(void)
-- 
2.18.2

