Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D281F7369
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 07:21:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jpxB0H15zDqsw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 15:21:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jpl55xMqzDqSr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 15:12:49 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C53UbO116994; Fri, 12 Jun 2020 01:12:44 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ktp1c2sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:44 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05C559NW121253;
 Fri, 12 Jun 2020 01:12:43 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ktp1c2s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:43 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05C59M6v011044;
 Fri, 12 Jun 2020 05:12:43 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 31hw1cftxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 05:12:43 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05C5CgCC50135372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jun 2020 05:12:42 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A356B2064;
 Fri, 12 Jun 2020 05:12:42 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D141B2065;
 Fri, 12 Jun 2020 05:12:42 +0000 (GMT)
Received: from localhost (unknown [9.65.252.60])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 12 Jun 2020 05:12:42 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/18] powerpc/numa: remove unreachable topology update code
Date: Fri, 12 Jun 2020 00:12:24 -0500
Message-Id: <20200612051238.1007764-5-nathanl@linux.ibm.com>
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
 mlxlogscore=999 mlxscore=0
 bulkscore=0 malwarescore=0 adultscore=0 cotscore=-2147483648 spamscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=1
 priorityscore=1501 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
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

Since the topology_updates_enabled flag is now always false, remove it
and the code which has become unreachable. This is the minimum change
that prevents 'defined but unused' warnings emitted by the compiler
after stubbing out the start/stop_topology_updates() functions.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 149 +----------------------------------------
 1 file changed, 2 insertions(+), 147 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 34d95de77bdd..9e20f12e6caf 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -984,8 +984,6 @@ static int __init early_numa(char *p)
 }
 early_param("numa", early_numa);
 
-static const bool topology_updates_enabled;
-
 #ifdef CONFIG_MEMORY_HOTPLUG
 /*
  * Find the node associated with a hot added memory section for
@@ -1133,7 +1131,6 @@ struct topology_update_data {
 
 #define TOPOLOGY_DEF_TIMER_SECS	60
 
-static u8 vphn_cpu_change_counts[NR_CPUS][MAX_DISTANCE_REF_POINTS];
 static cpumask_t cpu_associativity_changes_mask;
 static int vphn_enabled;
 static int prrn_enabled;
@@ -1158,63 +1155,6 @@ int timed_topology_update(int nsecs)
 	return 0;
 }
 
-/*
- * Store the current values of the associativity change counters in the
- * hypervisor.
- */
-static void setup_cpu_associativity_change_counters(void)
-{
-	int cpu;
-
-	/* The VPHN feature supports a maximum of 8 reference points */
-	BUILD_BUG_ON(MAX_DISTANCE_REF_POINTS > 8);
-
-	for_each_possible_cpu(cpu) {
-		int i;
-		u8 *counts = vphn_cpu_change_counts[cpu];
-		volatile u8 *hypervisor_counts = lppaca_of(cpu).vphn_assoc_counts;
-
-		for (i = 0; i < distance_ref_points_depth; i++)
-			counts[i] = hypervisor_counts[i];
-	}
-}
-
-/*
- * The hypervisor maintains a set of 8 associativity change counters in
- * the VPA of each cpu that correspond to the associativity levels in the
- * ibm,associativity-reference-points property. When an associativity
- * level changes, the corresponding counter is incremented.
- *
- * Set a bit in cpu_associativity_changes_mask for each cpu whose home
- * node associativity levels have changed.
- *
- * Returns the number of cpus with unhandled associativity changes.
- */
-static int update_cpu_associativity_changes_mask(void)
-{
-	int cpu;
-	cpumask_t *changes = &cpu_associativity_changes_mask;
-
-	for_each_possible_cpu(cpu) {
-		int i, changed = 0;
-		u8 *counts = vphn_cpu_change_counts[cpu];
-		volatile u8 *hypervisor_counts = lppaca_of(cpu).vphn_assoc_counts;
-
-		for (i = 0; i < distance_ref_points_depth; i++) {
-			if (hypervisor_counts[i] != counts[i]) {
-				counts[i] = hypervisor_counts[i];
-				changed = 1;
-			}
-		}
-		if (changed) {
-			cpumask_or(changes, changes, cpu_sibling_mask(cpu));
-			cpu = cpu_last_thread_sibling(cpu);
-		}
-	}
-
-	return cpumask_weight(changes);
-}
-
 /*
  * Retrieve the new associativity information for a virtual processor's
  * home node.
@@ -1498,16 +1438,6 @@ static void topology_schedule_update(void)
 	schedule_work(&topology_work);
 }
 
-static void topology_timer_fn(struct timer_list *unused)
-{
-	if (prrn_enabled && cpumask_weight(&cpu_associativity_changes_mask))
-		topology_schedule_update();
-	else if (vphn_enabled) {
-		if (update_cpu_associativity_changes_mask() > 0)
-			topology_schedule_update();
-		reset_topology_timer();
-	}
-}
 static struct timer_list topology_timer;
 
 static void reset_topology_timer(void)
@@ -1516,69 +1446,12 @@ static void reset_topology_timer(void)
 		mod_timer(&topology_timer, jiffies + topology_timer_secs * HZ);
 }
 
-#ifdef CONFIG_SMP
-
-static int dt_update_callback(struct notifier_block *nb,
-				unsigned long action, void *data)
-{
-	struct of_reconfig_data *update = data;
-	int rc = NOTIFY_DONE;
-
-	switch (action) {
-	case OF_RECONFIG_UPDATE_PROPERTY:
-		if (of_node_is_type(update->dn, "cpu") &&
-		    !of_prop_cmp(update->prop->name, "ibm,associativity")) {
-			u32 core_id;
-			of_property_read_u32(update->dn, "reg", &core_id);
-			rc = dlpar_cpu_readd(core_id);
-			rc = NOTIFY_OK;
-		}
-		break;
-	}
-
-	return rc;
-}
-
-static struct notifier_block dt_update_nb = {
-	.notifier_call = dt_update_callback,
-};
-
-#endif
-
 /*
  * Start polling for associativity changes.
  */
 int start_topology_update(void)
 {
-	int rc = 0;
-
-	if (!topology_updates_enabled)
-		return 0;
-
-	if (firmware_has_feature(FW_FEATURE_PRRN)) {
-		if (!prrn_enabled) {
-			prrn_enabled = 1;
-#ifdef CONFIG_SMP
-			rc = of_reconfig_notifier_register(&dt_update_nb);
-#endif
-		}
-	}
-	if (firmware_has_feature(FW_FEATURE_VPHN) &&
-		   lppaca_shared_proc(get_lppaca())) {
-		if (!vphn_enabled) {
-			vphn_enabled = 1;
-			setup_cpu_associativity_change_counters();
-			timer_setup(&topology_timer, topology_timer_fn,
-				    TIMER_DEFERRABLE);
-			reset_topology_timer();
-		}
-	}
-
-	pr_info("Starting topology update%s%s\n",
-		(prrn_enabled ? " prrn_enabled" : ""),
-		(vphn_enabled ? " vphn_enabled" : ""));
-
-	return rc;
+	return 0;
 }
 
 /*
@@ -1586,25 +1459,7 @@ int start_topology_update(void)
  */
 int stop_topology_update(void)
 {
-	int rc = 0;
-
-	if (!topology_updates_enabled)
-		return 0;
-
-	if (prrn_enabled) {
-		prrn_enabled = 0;
-#ifdef CONFIG_SMP
-		rc = of_reconfig_notifier_unregister(&dt_update_nb);
-#endif
-	}
-	if (vphn_enabled) {
-		vphn_enabled = 0;
-		rc = del_timer_sync(&topology_timer);
-	}
-
-	pr_info("Stopping topology update\n");
-
-	return rc;
+	return 0;
 }
 
 int prrn_is_enabled(void)
-- 
2.25.4

