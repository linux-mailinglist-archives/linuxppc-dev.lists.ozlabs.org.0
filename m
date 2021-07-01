Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 373AE3B8CDD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 06:17:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFlLT1B7Lz3cdV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 14:17:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GYdRC4h9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GYdRC4h9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFlKF1dCWz3002
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 14:16:49 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16144445193283; Thu, 1 Jul 2021 00:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=1QeEN8lYtB5E3x3m5VwTT+Q6+645tDNgC2asz074Es0=;
 b=GYdRC4h9cYtdeNnPrwOxhUpXnbKweWClxnzpPdP+ASedvrH7zP2Vo8haRi8Z8S2G1T3x
 67Uc4cR8co855xbVIym4kUUw2paKz9Z2WXhXJnVMa3mSQGYSEzyYwrKRQQZY6o45VzMw
 m3XqS+kC9eIWD9UuRhgDFn7z7i6hmbUUAK4v0hMxIp4v5VGMwenGo6NY+g4Obi0iMgAG
 H1/k72WqXPMG9tUdz9oF/T0TSpcp+YGyKodD9wqzJVa0vwlDKOCm5ErnxhrXzPgwVh0o
 HjxS0b16I1/dRqXY8knQPmSmVMnicLdOVA2QIMl2hz+xZUxUjPUYT/MpGniIlfgf4V6K cQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gt05cnyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 00:16:20 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1614GFsi009388;
 Thu, 1 Jul 2021 04:16:17 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 39dugh94ph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 04:16:17 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1614EY6A30212556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 04:14:34 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DB6411C070;
 Thu,  1 Jul 2021 04:16:14 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D88211C050;
 Thu,  1 Jul 2021 04:16:11 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.85.122.203])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Jul 2021 04:16:11 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 1/2] sched/topology: Skip updating masks for non-online
 nodes
Date: Thu,  1 Jul 2021 09:45:51 +0530
Message-Id: <20210701041552.112072-2-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210701041552.112072-1-srikar@linux.vnet.ibm.com>
References: <20210701041552.112072-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: seh_S1PwfZvT5jv2RQ5mzXErcKr8xvet
X-Proofpoint-ORIG-GUID: seh_S1PwfZvT5jv2RQ5mzXErcKr8xvet
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Currently scheduler doesn't check if node is online before adding CPUs
to the node mask. However on some architectures, node distance is only
available for nodes that are online. Its not sure how much to rely on
the node distance, when one of the nodes is offline.

If said node distance is fake (since one of the nodes is offline) and
the actual node distance is different, then the cpumask of such nodes
when the nodes become becomes online will be wrong.

This can cause topology_span_sane to throw up a warning message and the
rest of the topology being not updated properly.

Resolve this by skipping update of cpumask for nodes that are not
online.

However by skipping, relevant CPUs may not be set when nodes are
onlined. i.e when coming up with NUMA masks at a certain NUMA distance,
CPUs that are part of other nodes, which are already online will not be
part of the NUMA mask. Hence the first time, a CPU is added to the newly
onlined node, add the other CPUs to the numa_mask.

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
v1 link: http://lore.kernel.org/lkml/20210520154427.1041031-4-srikar@linux.vnet.ibm.com/t/#u
Update the NUMA masks, whenever 1st CPU is added to cpuless node

 kernel/sched/topology.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index b77ad49dc14f..f25dbcab4fd2 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1833,6 +1833,9 @@ void sched_init_numa(void)
 			sched_domains_numa_masks[i][j] = mask;
 
 			for_each_node(k) {
+				if (!node_online(j))
+					continue;
+
 				if (sched_debug() && (node_distance(j, k) != node_distance(k, j)))
 					sched_numa_warn("Node-distance not symmetric");
 
@@ -1891,12 +1894,30 @@ void sched_init_numa(void)
 void sched_domains_numa_masks_set(unsigned int cpu)
 {
 	int node = cpu_to_node(cpu);
-	int i, j;
+	int i, j, empty;
 
+	empty = cpumask_empty(sched_domains_numa_masks[0][node]);
 	for (i = 0; i < sched_domains_numa_levels; i++) {
 		for (j = 0; j < nr_node_ids; j++) {
-			if (node_distance(j, node) <= sched_domains_numa_distance[i])
+			if (!node_online(j))
+				continue;
+
+			if (node_distance(j, node) <= sched_domains_numa_distance[i]) {
 				cpumask_set_cpu(cpu, sched_domains_numa_masks[i][j]);
+
+				/*
+				 * We skip updating numa_masks for offline
+				 * nodes. However now that the node is
+				 * finally online, CPUs that were added
+				 * earlier, should now be accommodated into
+				 * newly oneline node's numa mask.
+				 */
+				if (node != j && empty) {
+					cpumask_or(sched_domains_numa_masks[i][node],
+							sched_domains_numa_masks[i][node],
+							sched_domains_numa_masks[0][j]);
+				}
+			}
 		}
 	}
 }
-- 
2.27.0

