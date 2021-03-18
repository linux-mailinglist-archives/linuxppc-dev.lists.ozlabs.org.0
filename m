Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5770A3401D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 10:20:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1M2b2L8Vz3bxp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 20:20:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i8pJ0iJy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i8pJ0iJy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1M2706Vnz30HV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 20:20:29 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12I94JUV163680; Thu, 18 Mar 2021 05:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=QjGR4oR/CWmKdCUFLUfb0MtAIUvkP5icZx/y1HlBJuQ=;
 b=i8pJ0iJymkof45s1Ynrf0WmmxdKFQLyyzH0RPEs+IOqaecMhfsRMxAZrQHVo/faeqvtn
 E0QRz7AV+RgPteCnqeGuF/tDR3j0UY52yLj7WuJJij0ffxUFc9g+bKuPdv4+fq2at4vw
 7Z9Jp75LmntaPi0YxO2wIT1oE+Kc3ILOwE4qw6C36dLemKeZUgdGjfmz6ho7EsdJ6hxG
 fkhlBCZFFgv+qq4QEoQMMqQme4moHqG58LN6fkkAZaZHbl/bKzWTpNH3fCI7oxjBtsnq
 JWiEq0TbTshdnhstVr8bQilVa1swZulpe4dFYVOs3M+DPyQ9PUV7lyzHRiSZbvEr5BNm 0w== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37bnrext5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 05:20:21 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12I9D56a019951;
 Thu, 18 Mar 2021 09:20:19 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 378mnhae6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 09:20:19 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12I9KG7V27918798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 09:20:16 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7984552051;
 Thu, 18 Mar 2021 09:20:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.185.107])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 181C05204F;
 Thu, 18 Mar 2021 09:20:16 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org
Subject: [PATCH] pseries: prevent free CPU ids to be reused on another node
Date: Thu, 18 Mar 2021 10:20:14 +0100
Message-Id: <20210318092014.95489-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-18_04:2021-03-17,
 2021-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103180069
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
Cc: nathanl@linux.ibm.com, cheloha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a CPU is hot added, the CPU ids are taken from the available mask from
the lower possible set. If that set of values was previously used for CPU
attached to a different node, this seems to application like if these CPUs
have migrated from a node to another one which is not expected in real
life.

To prevent this, it is needed to record the CPU ids used for each node and
to not reuse them on another node. However, to prevent CPU hot plug to
fail, in the case the CPU ids is starved on a node, the capability to reuse
other nodes’ free CPU ids is kept. A warning is displayed in such a case
to warn the user.

A new CPU bit mask (node_recorded_ids_map) is introduced for each possible
node. It is populated with the CPU onlined at boot time, and then when a
CPU is hot plug to a node. The bits in that mask remain when the CPU is hot
unplugged, to remind this CPU ids have been used for this node.

If no id set was found, a retry is made without removing the ids used on
the other nodes to try reusing them. This is the way ids have been
allocated prior to this patch.

The effect of this patch can be seen by removing and adding CPUs using the
Qemu monitor. In the following case, the first CPU from the node 2 is
removed, then the first one from the node 1 is removed too. Later, the
first CPU of the node 2 is added back. Without that patch, the kernel will
numbered these CPUs using the first CPU ids available which are the ones
freed when removing the second CPU of the node 0. This leads to the CPU ids
16-23 to move from the node 1 to the node 2. With the patch applied, the
CPU ids 32-39 are used since they are the lowest free ones which have not
been used on another node.

At boot time:
[root@vm40 ~]# numactl -H | grep cpus
available: 3 nodes (0-2)
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
node 1 cpus: 16 17 18 19 20 21 22 23 40 41 42 43 44 45 46 47
node 2 cpus: 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39

Unpatched kernel, after the CPU hot unplug/plug operations:
[root@vm40 ~]# numactl -H | grep cpus
available: 3 nodes (0-2)
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
node 1 cpus: 24 25 26 27 28 29 30 31
node 2 cpus: 16 17 18 19 20 21 22 23 40 41 42 43 44 45 46 47

Patched kernel, after the CPU hot unplug/plug operations:
[root@vm40 ~]# numactl -H | grep cpus
available: 3 nodes (0-2)
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
node 1 cpus: 24 25 26 27 28 29 30 31
node 2 cpus: 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 83 ++++++++++++++++++--
 1 file changed, 76 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 12cbffd3c2e3..dc5797110d6e 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -39,6 +39,8 @@
 /* This version can't take the spinlock, because it never returns */
 static int rtas_stop_self_token = RTAS_UNKNOWN_SERVICE;
 
+cpumask_var_t node_recorded_ids_map[MAX_NUMNODES];
+
 static void rtas_stop_self(void)
 {
 	static struct rtas_args args;
@@ -151,29 +153,61 @@ static void pseries_cpu_die(unsigned int cpu)
  */
 static int pseries_add_processor(struct device_node *np)
 {
-	unsigned int cpu;
+	unsigned int cpu, node;
 	cpumask_var_t candidate_mask, tmp;
-	int err = -ENOSPC, len, nthreads, i;
+	int err = -ENOSPC, len, nthreads, i, nid;
 	const __be32 *intserv;
+	bool force_reusing = false;
 
 	intserv = of_get_property(np, "ibm,ppc-interrupt-server#s", &len);
 	if (!intserv)
 		return 0;
 
-	zalloc_cpumask_var(&candidate_mask, GFP_KERNEL);
-	zalloc_cpumask_var(&tmp, GFP_KERNEL);
+	alloc_cpumask_var(&candidate_mask, GFP_KERNEL);
+	alloc_cpumask_var(&tmp, GFP_KERNEL);
+
+	/*
+	 * Fetch from the DT nodes read by dlpar_configure_connector() the NUMA
+	 * node id the added CPU belongs to.
+	 */
+	nid = of_node_to_nid(np);
+	if (nid < 0 || !node_possible(nid))
+		nid = first_online_node;
 
 	nthreads = len / sizeof(u32);
-	for (i = 0; i < nthreads; i++)
-		cpumask_set_cpu(i, tmp);
 
 	cpu_maps_update_begin();
 
 	BUG_ON(!cpumask_subset(cpu_present_mask, cpu_possible_mask));
 
+again:
+	cpumask_clear(candidate_mask);
+	cpumask_clear(tmp);
+	for (i = 0; i < nthreads; i++)
+		cpumask_set_cpu(i, tmp);
+
 	/* Get a bitmap of unoccupied slots. */
 	cpumask_xor(candidate_mask, cpu_possible_mask, cpu_present_mask);
+
+	/*
+	 * Remove free ids previously assigned on the other nodes. We can walk
+	 * only online nodes because once a node became online it is not turned
+	 * offlined back.
+	 */
+	if (!force_reusing)
+		for_each_online_node(node) {
+			if (node == nid) /* Keep our node's recorded ids */
+				continue;
+			cpumask_andnot(candidate_mask, candidate_mask,
+				       node_recorded_ids_map[node]);
+		}
+
 	if (cpumask_empty(candidate_mask)) {
+		if (!force_reusing) {
+			force_reusing = true;
+			goto again;
+		}
+
 		/* If we get here, it most likely means that NR_CPUS is
 		 * less than the partition's max processors setting.
 		 */
@@ -191,12 +225,36 @@ static int pseries_add_processor(struct device_node *np)
 			cpumask_shift_left(tmp, tmp, nthreads);
 
 	if (cpumask_empty(tmp)) {
+		if (!force_reusing) {
+			force_reusing = true;
+			goto again;
+		}
 		printk(KERN_ERR "Unable to find space in cpu_present_mask for"
 		       " processor %pOFn with %d thread(s)\n", np,
 		       nthreads);
 		goto out_unlock;
 	}
 
+	/* Record the newly used CPU ids for the associate node. */
+	cpumask_or(node_recorded_ids_map[nid], node_recorded_ids_map[nid], tmp);
+
+	/*
+	 * If we force reusing the id, remove these ids from any node which was
+	 * previously using it.
+	 */
+	if (force_reusing) {
+		cpu = cpumask_first(tmp);
+		pr_warn("Reusing free CPU ids %d-%d from another node\n",
+			cpu, cpu + nthreads - 1);
+
+		for_each_online_node(node) {
+			if (node == nid)
+				continue;
+			cpumask_andnot(node_recorded_ids_map[node],
+				       node_recorded_ids_map[node], tmp);
+		}
+	}
+
 	for_each_cpu(cpu, tmp) {
 		BUG_ON(cpu_present(cpu));
 		set_cpu_present(cpu, true);
@@ -889,6 +947,7 @@ static struct notifier_block pseries_smp_nb = {
 static int __init pseries_cpu_hotplug_init(void)
 {
 	int qcss_tok;
+	unsigned int node;
 
 #ifdef CONFIG_ARCH_CPU_PROBE_RELEASE
 	ppc_md.cpu_probe = dlpar_cpu_probe;
@@ -910,8 +969,18 @@ static int __init pseries_cpu_hotplug_init(void)
 	smp_ops->cpu_die = pseries_cpu_die;
 
 	/* Processors can be added/removed only on LPAR */
-	if (firmware_has_feature(FW_FEATURE_LPAR))
+	if (firmware_has_feature(FW_FEATURE_LPAR)) {
+		for_each_node(node) {
+			alloc_bootmem_cpumask_var(&node_recorded_ids_map[node]);
+
+			/* Record ids of CPU added at boot time */
+			cpumask_or(node_recorded_ids_map[node],
+				   node_recorded_ids_map[node],
+				   node_to_cpumask_map[node]);
+		}
+
 		of_reconfig_notifier_register(&pseries_smp_nb);
+	}
 
 	return 0;
 }
-- 
2.30.2

