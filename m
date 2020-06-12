Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7A11F737F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 07:30:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jq7Y6K0wzDqNj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 15:30:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jplB68jrzDqlf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 15:12:54 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C55w7k062522; Fri, 12 Jun 2020 01:12:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31m1snjccc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:50 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05C58W7i068507;
 Fri, 12 Jun 2020 01:12:50 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31m1snjcc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:50 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05C59K2u022132;
 Fri, 12 Jun 2020 05:12:49 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 31hyh06a8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 05:12:49 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05C5CmbV50200888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jun 2020 05:12:48 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E77BC13604F;
 Fri, 12 Jun 2020 05:12:47 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83757136055;
 Fri, 12 Jun 2020 05:12:47 +0000 (GMT)
Received: from localhost (unknown [9.65.252.60])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 12 Jun 2020 05:12:47 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/18] powerpc/numa: stub out numa_update_cpu_topology()
Date: Fri, 12 Jun 2020 00:12:29 -0500
Message-Id: <20200612051238.1007764-10-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200612051238.1007764-1-nathanl@linux.ibm.com>
References: <20200612051238.1007764-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_23:2020-06-11,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 cotscore=-2147483648 mlxscore=0
 suspectscore=1 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006110174
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
Cc: tyreld@linux.ibm.com, srikar@linux.vnet.ibm.com, ego@linux.vnet.ibm.com,
 npiggin@gmail.com, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Previous changes have removed the code which sets bits in
cpu_associativity_changes_mask and thus it is never modifed at
runtime. From this we can reason that numa_update_cpu_topology()
always returns 0 without doing anything. Remove the body of
numa_update_cpu_topology() and remove all code which becomes
unreachable as a result.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 193 +----------------------------------------
 1 file changed, 1 insertion(+), 192 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 8749d7f2b1a6..b220e5b60140 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1122,14 +1122,6 @@ u64 memory_hotplug_max(void)
 
 /* Virtual Processor Home Node (VPHN) support */
 #ifdef CONFIG_PPC_SPLPAR
-struct topology_update_data {
-	struct topology_update_data *next;
-	unsigned int cpu;
-	int old_nid;
-	int new_nid;
-};
-
-static cpumask_t cpu_associativity_changes_mask;
 static int topology_inited;
 
 /*
@@ -1219,192 +1211,9 @@ int find_and_online_cpu_nid(int cpu)
 	return new_nid;
 }
 
-/*
- * Update the CPU maps and sysfs entries for a single CPU when its NUMA
- * characteristics change. This function doesn't perform any locking and is
- * only safe to call from stop_machine().
- */
-static int update_cpu_topology(void *data)
-{
-	struct topology_update_data *update;
-	unsigned long cpu;
-
-	if (!data)
-		return -EINVAL;
-
-	cpu = smp_processor_id();
-
-	for (update = data; update; update = update->next) {
-		int new_nid = update->new_nid;
-		if (cpu != update->cpu)
-			continue;
-
-		unmap_cpu_from_node(cpu);
-		map_cpu_to_node(cpu, new_nid);
-		set_cpu_numa_node(cpu, new_nid);
-		set_cpu_numa_mem(cpu, local_memory_node(new_nid));
-		vdso_getcpu_init();
-	}
-
-	return 0;
-}
-
-static int update_lookup_table(void *data)
-{
-	struct topology_update_data *update;
-
-	if (!data)
-		return -EINVAL;
-
-	/*
-	 * Upon topology update, the numa-cpu lookup table needs to be updated
-	 * for all threads in the core, including offline CPUs, to ensure that
-	 * future hotplug operations respect the cpu-to-node associativity
-	 * properly.
-	 */
-	for (update = data; update; update = update->next) {
-		int nid, base, j;
-
-		nid = update->new_nid;
-		base = cpu_first_thread_sibling(update->cpu);
-
-		for (j = 0; j < threads_per_core; j++) {
-			update_numa_cpu_lookup_table(base + j, nid);
-		}
-	}
-
-	return 0;
-}
-
-/*
- * Update the node maps and sysfs entries for each cpu whose home node
- * has changed. Returns 1 when the topology has changed, and 0 otherwise.
- *
- * cpus_locked says whether we already hold cpu_hotplug_lock.
- */
 int numa_update_cpu_topology(bool cpus_locked)
 {
-	unsigned int cpu, sibling, changed = 0;
-	struct topology_update_data *updates, *ud;
-	cpumask_t updated_cpus;
-	struct device *dev;
-	int weight, new_nid, i = 0;
-
-	if (topology_inited)
-		return 0;
-
-	weight = cpumask_weight(&cpu_associativity_changes_mask);
-	if (!weight)
-		return 0;
-
-	updates = kcalloc(weight, sizeof(*updates), GFP_KERNEL);
-	if (!updates)
-		return 0;
-
-	cpumask_clear(&updated_cpus);
-
-	for_each_cpu(cpu, &cpu_associativity_changes_mask) {
-		/*
-		 * If siblings aren't flagged for changes, updates list
-		 * will be too short. Skip on this update and set for next
-		 * update.
-		 */
-		if (!cpumask_subset(cpu_sibling_mask(cpu),
-					&cpu_associativity_changes_mask)) {
-			pr_info("Sibling bits not set for associativity "
-					"change, cpu%d\n", cpu);
-			cpumask_or(&cpu_associativity_changes_mask,
-					&cpu_associativity_changes_mask,
-					cpu_sibling_mask(cpu));
-			cpu = cpu_last_thread_sibling(cpu);
-			continue;
-		}
-
-		new_nid = find_and_online_cpu_nid(cpu);
-
-		if (new_nid == numa_cpu_lookup_table[cpu]) {
-			cpumask_andnot(&cpu_associativity_changes_mask,
-					&cpu_associativity_changes_mask,
-					cpu_sibling_mask(cpu));
-			dbg("Assoc chg gives same node %d for cpu%d\n",
-					new_nid, cpu);
-			cpu = cpu_last_thread_sibling(cpu);
-			continue;
-		}
-
-		for_each_cpu(sibling, cpu_sibling_mask(cpu)) {
-			ud = &updates[i++];
-			ud->next = &updates[i];
-			ud->cpu = sibling;
-			ud->new_nid = new_nid;
-			ud->old_nid = numa_cpu_lookup_table[sibling];
-			cpumask_set_cpu(sibling, &updated_cpus);
-		}
-		cpu = cpu_last_thread_sibling(cpu);
-	}
-
-	/*
-	 * Prevent processing of 'updates' from overflowing array
-	 * where last entry filled in a 'next' pointer.
-	 */
-	if (i)
-		updates[i-1].next = NULL;
-
-	pr_debug("Topology update for the following CPUs:\n");
-	if (cpumask_weight(&updated_cpus)) {
-		for (ud = &updates[0]; ud; ud = ud->next) {
-			pr_debug("cpu %d moving from node %d "
-					  "to %d\n", ud->cpu,
-					  ud->old_nid, ud->new_nid);
-		}
-	}
-
-	/*
-	 * In cases where we have nothing to update (because the updates list
-	 * is too short or because the new topology is same as the old one),
-	 * skip invoking update_cpu_topology() via stop-machine(). This is
-	 * necessary (and not just a fast-path optimization) since stop-machine
-	 * can end up electing a random CPU to run update_cpu_topology(), and
-	 * thus trick us into setting up incorrect cpu-node mappings (since
-	 * 'updates' is kzalloc()'ed).
-	 *
-	 * And for the similar reason, we will skip all the following updating.
-	 */
-	if (!cpumask_weight(&updated_cpus))
-		goto out;
-
-	if (cpus_locked)
-		stop_machine_cpuslocked(update_cpu_topology, &updates[0],
-					&updated_cpus);
-	else
-		stop_machine(update_cpu_topology, &updates[0], &updated_cpus);
-
-	/*
-	 * Update the numa-cpu lookup table with the new mappings, even for
-	 * offline CPUs. It is best to perform this update from the stop-
-	 * machine context.
-	 */
-	if (cpus_locked)
-		stop_machine_cpuslocked(update_lookup_table, &updates[0],
-					cpumask_of(raw_smp_processor_id()));
-	else
-		stop_machine(update_lookup_table, &updates[0],
-			     cpumask_of(raw_smp_processor_id()));
-
-	for (ud = &updates[0]; ud; ud = ud->next) {
-		unregister_cpu_under_node(ud->cpu, ud->old_nid);
-		register_cpu_under_node(ud->cpu, ud->new_nid);
-
-		dev = get_cpu_device(ud->cpu);
-		if (dev)
-			kobject_uevent(&dev->kobj, KOBJ_CHANGE);
-		cpumask_clear_cpu(ud->cpu, &cpu_associativity_changes_mask);
-		changed = 1;
-	}
-
-out:
-	kfree(updates);
-	return changed;
+	return 0;
 }
 
 int arch_update_cpu_topology(void)
-- 
2.25.4

