Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B21C03253FF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 17:50:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dmf1Q53hbz3cc3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 03:50:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ls+USaX0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ls+USaX0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dmf0z0QLFz3cRR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 03:50:26 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PGi8ZV091934; Thu, 25 Feb 2021 11:50:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=tvQlYMW626CVGrNIfQdRMSvmVjTXwJOzrDsJ7QDBYDc=;
 b=ls+USaX0HzbOomVzKoxd6zcTHcARgvTJ+bhnApIRI4x3Lxu08jiXgnmzHoxhZE247+KE
 zGZqOuLGqfqZ+GHdvsHm2nN+WnUKJaYa78PYy7ens0e5EWulReudAXhDR8Wpl+GRL+iE
 V+TUvKTj6mGmhkUGKKXevG9p34NPyhFIZHKGeO108Yb/k5flWVyWggP4W6xxMHSdmorL
 9KvH7colGdL+F41xgY8GSfe0en3XCiithHxqsMYXwDRJDgFhZUUWcGaWmXoFoiuHsfN8
 PSyAbDpMe6P1YAkR3lCdTRblxrObYes42M33WYaBVhEpOE2xMt+KHFkG0k42wTKftr5x HQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36x8dwrdr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 11:50:12 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11PGh5mM024872;
 Thu, 25 Feb 2021 16:50:10 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 36tt28ae7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 16:50:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11PGo7R451315064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Feb 2021 16:50:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 163CC4C040;
 Thu, 25 Feb 2021 16:50:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EA744C046;
 Thu, 25 Feb 2021 16:50:03 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.195.39.192])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 25 Feb 2021 16:50:03 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mpe@ellerman.id.au, acme@kernel.org,
 jolsa@kernel.org
Subject: [PATCH] perf bench numa: Fix the condition checks for max number of
 numa nodes
Date: Thu, 25 Feb 2021 11:50:02 -0500
Message-Id: <1614271802-1503-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_10:2021-02-24,
 2021-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102250128
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.ibm.com, srikar@linux.vnet.ibm.com,
 peterz@infradead.org, kjain@linux.ibm.com, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In systems having higher node numbers available like node
255, perf numa bench will fail with SIGABORT.

<<>>
perf: bench/numa.c:1416: init: Assertion `!(g->p.nr_nodes > 64 || g->p.nr_nodes < 0)' failed.
Aborted (core dumped)
<<>>

Snippet from 'numactl -H' below on a powerpc system where the highest
node number available is 255.

available: 6 nodes (0,8,252-255)
node 0 cpus: <cpu-list>
node 0 size: 519587 MB
node 0 free: 516659 MB
node 8 cpus: <cpu-list>
node 8 size: 523607 MB
node 8 free: 486757 MB
node 252 cpus:
node 252 size: 0 MB
node 252 free: 0 MB
node 253 cpus:
node 253 size: 0 MB
node 253 free: 0 MB
node 254 cpus:
node 254 size: 0 MB
node 254 free: 0 MB
node 255 cpus:
node 255 size: 0 MB
node 255 free: 0 MB
node distances:
node   0   8  252  253  254  255

Note: <cpu-list> expands to actual cpu list in the original output.
These nodes 252-255 are to represent the memory on GPUs and are valid
nodes.

The perf numa bench init code has a condition check to see if the number
of numa nodes (nr_nodes) exceeds MAX_NR_NODES. The value of MAX_NR_NODES
defined in perf code is 64. And the 'nr_nodes' is the value from
numa_max_node() which represents the highest node number available in the
system. In some systems where we could have numa node 255, this condition
check fails and results in SIGABORT.

The numa benchmark uses static value of MAX_NR_NODES in the code to
represent size of two numa node arrays and node bitmask used for setting
memory policy. Patch adds a fix to dynamically allocate size for the
two arrays and bitmask value based on the node numbers available in the
system. With the fix, perf numa benchmark will work with node configuration
on any system and thus removes the static MAX_NR_NODES value.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/bench/numa.c | 42 +++++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/tools/perf/bench/numa.c b/tools/perf/bench/numa.c
index 11726ec..20b87e2 100644
--- a/tools/perf/bench/numa.c
+++ b/tools/perf/bench/numa.c
@@ -344,18 +344,22 @@ static void mempol_restore(void)
 
 static void bind_to_memnode(int node)
 {
-	unsigned long nodemask;
+	struct bitmask *node_mask;
 	int ret;
 
 	if (node == NUMA_NO_NODE)
 		return;
 
-	BUG_ON(g->p.nr_nodes > (int)sizeof(nodemask)*8);
-	nodemask = 1L << node;
+	node_mask = numa_allocate_nodemask();
+	BUG_ON(!node_mask);
 
-	ret = set_mempolicy(MPOL_BIND, &nodemask, sizeof(nodemask)*8);
-	dprintf("binding to node %d, mask: %016lx => %d\n", node, nodemask, ret);
+	numa_bitmask_clearall(node_mask);
+	numa_bitmask_setbit(node_mask, node);
 
+	ret = set_mempolicy(MPOL_BIND, node_mask->maskp, node_mask->size + 1);
+	dprintf("binding to node %d, mask: %016lx => %d\n", node, *node_mask->maskp, ret);
+
+	numa_bitmask_free(node_mask);
 	BUG_ON(ret);
 }
 
@@ -876,8 +880,6 @@ static void update_curr_cpu(int task_nr, unsigned long bytes_worked)
 	prctl(0, bytes_worked);
 }
 
-#define MAX_NR_NODES	64
-
 /*
  * Count the number of nodes a process's threads
  * are spread out on.
@@ -888,10 +890,15 @@ static void update_curr_cpu(int task_nr, unsigned long bytes_worked)
  */
 static int count_process_nodes(int process_nr)
 {
-	char node_present[MAX_NR_NODES] = { 0, };
+	char *node_present;
 	int nodes;
 	int n, t;
 
+	node_present = (char *)malloc(g->p.nr_nodes * sizeof(char));
+	BUG_ON(!node_present);
+	for (nodes = 0; nodes < g->p.nr_nodes; nodes++)
+		node_present[nodes] = 0;
+
 	for (t = 0; t < g->p.nr_threads; t++) {
 		struct thread_data *td;
 		int task_nr;
@@ -901,17 +908,20 @@ static int count_process_nodes(int process_nr)
 		td = g->threads + task_nr;
 
 		node = numa_node_of_cpu(td->curr_cpu);
-		if (node < 0) /* curr_cpu was likely still -1 */
+		if (node < 0) /* curr_cpu was likely still -1 */ {
+			free(node_present);
 			return 0;
+		}
 
 		node_present[node] = 1;
 	}
 
 	nodes = 0;
 
-	for (n = 0; n < MAX_NR_NODES; n++)
+	for (n = 0; n < g->p.nr_nodes; n++)
 		nodes += node_present[n];
 
+	free(node_present);
 	return nodes;
 }
 
@@ -980,7 +990,7 @@ static void calc_convergence(double runtime_ns_max, double *convergence)
 {
 	unsigned int loops_done_min, loops_done_max;
 	int process_groups;
-	int nodes[MAX_NR_NODES];
+	int *nodes;
 	int distance;
 	int nr_min;
 	int nr_max;
@@ -994,6 +1004,8 @@ static void calc_convergence(double runtime_ns_max, double *convergence)
 	if (!g->p.show_convergence && !g->p.measure_convergence)
 		return;
 
+	nodes = (int *)malloc(g->p.nr_nodes * sizeof(int));
+	BUG_ON(!nodes);
 	for (node = 0; node < g->p.nr_nodes; node++)
 		nodes[node] = 0;
 
@@ -1035,8 +1047,10 @@ static void calc_convergence(double runtime_ns_max, double *convergence)
 
 	BUG_ON(sum > g->p.nr_tasks);
 
-	if (0 && (sum < g->p.nr_tasks))
+	if (0 && (sum < g->p.nr_tasks)) {
+		free(nodes);
 		return;
+	}
 
 	/*
 	 * Count the number of distinct process groups present
@@ -1088,6 +1102,8 @@ static void calc_convergence(double runtime_ns_max, double *convergence)
 		}
 		tprintf("\n");
 	}
+
+	free(nodes);
 }
 
 static void show_summary(double runtime_ns_max, int l, double *convergence)
@@ -1413,7 +1429,7 @@ static int init(void)
 	g->p.nr_nodes = numa_max_node() + 1;
 
 	/* char array in count_process_nodes(): */
-	BUG_ON(g->p.nr_nodes > MAX_NR_NODES || g->p.nr_nodes < 0);
+	BUG_ON(g->p.nr_nodes < 0);
 
 	if (g->p.show_quiet && !g->p.show_details)
 		g->p.show_details = -1;
-- 
1.8.3.1

