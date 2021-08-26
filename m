Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F2A3F851E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 12:11:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwJXf1lgyz3ckR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 20:11:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pLPOMBT6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pLPOMBT6; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwJQb6f35z3bmk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 20:06:15 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17QA3UVs173466; Thu, 26 Aug 2021 06:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jGpsByp0FRxL91Eq3oNPREb0QUHDWvNdQLWOj+mLqrs=;
 b=pLPOMBT6qevJU1HxOL+hihlByyJq19Djj75+/VQpQQpqorSa6DEDlC8rgFPKbC2tW0Zx
 IffJRGKAhbSTECHA08YRdq2KWi+LnQEam1pGwBXEx65JRTrijOKXIGPYuvvhZ59o11MJ
 pTCnYVSaDm7iQPpjuMptBHnRH4OX6xByXVfItCKA0MJtcpPadhGzTrifltUUMQVdAl0C
 t9fvm+8D4irFURkfLB29hkZZc8jBXmCj8wKvHfoxsPnj9sMk2bfBx7zIvsWs1J/jGKWP
 QyJXD4sF6eo+//3EiQz5fo7bPRFtIrG18apN4P8jewMoVHKd45/FWbXyTku/Zo12tMus kw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ap7x79r1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 06:05:39 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17QA2qu9028462;
 Thu, 26 Aug 2021 10:05:38 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3ajs48fp2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 10:05:37 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17QA5WRK51118446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Aug 2021 10:05:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D9FAAE045;
 Thu, 26 Aug 2021 10:05:32 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98C4BAE065;
 Thu, 26 Aug 2021 10:05:28 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.43.43.205])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Aug 2021 10:05:28 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v5 1/5] powerpc/numa: Drop dbg in favour of pr_debug
Date: Thu, 26 Aug 2021 15:35:17 +0530
Message-Id: <20210826100521.412639-2-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826100521.412639-1-srikar@linux.vnet.ibm.com>
References: <20210826100521.412639-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DlXyyP2sUrh1l6swkvtsxKcddXHbAeGT
X-Proofpoint-GUID: DlXyyP2sUrh1l6swkvtsxKcddXHbAeGT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-26_02:2021-08-26,
 2021-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108260061
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
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerPc supported numa=debug which is not documented. This option was
used to print early debug output. However something more flexible can be
achieved by using CONFIG_DYNAMIC_DEBUG.

Hence drop dbg (and numa=debug) in favour of pr_debug

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
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/mm/numa.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index f2bf98bdcea2..5e9b777a1151 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -40,9 +40,6 @@ static int numa_enabled = 1;
 
 static char *cmdline __initdata;
 
-static int numa_debug;
-#define dbg(args...) if (numa_debug) { printk(KERN_INFO args); }
-
 int numa_cpu_lookup_table[NR_CPUS];
 cpumask_var_t node_to_cpumask_map[MAX_NUMNODES];
 struct pglist_data *node_data[MAX_NUMNODES];
@@ -79,7 +76,7 @@ static void __init setup_node_to_cpumask_map(void)
 		alloc_bootmem_cpumask_var(&node_to_cpumask_map[node]);
 
 	/* cpumask_of_node() will now work */
-	dbg("Node to cpumask map for %u nodes\n", nr_node_ids);
+	pr_debug("Node to cpumask map for %u nodes\n", nr_node_ids);
 }
 
 static int __init fake_numa_create_new_node(unsigned long end_pfn,
@@ -123,7 +120,7 @@ static int __init fake_numa_create_new_node(unsigned long end_pfn,
 		cmdline = p;
 		fake_nid++;
 		*nid = fake_nid;
-		dbg("created new fake_node with id %d\n", fake_nid);
+		pr_debug("created new fake_node with id %d\n", fake_nid);
 		return 1;
 	}
 	return 0;
@@ -141,7 +138,7 @@ static void map_cpu_to_node(int cpu, int node)
 {
 	update_numa_cpu_lookup_table(cpu, node);
 
-	dbg("adding cpu %d to node %d\n", cpu, node);
+	pr_debug("adding cpu %d to node %d\n", cpu, node);
 
 	if (!(cpumask_test_cpu(cpu, node_to_cpumask_map[node])))
 		cpumask_set_cpu(cpu, node_to_cpumask_map[node]);
@@ -152,7 +149,7 @@ static void unmap_cpu_from_node(unsigned long cpu)
 {
 	int node = numa_cpu_lookup_table[cpu];
 
-	dbg("removing cpu %lu from node %d\n", cpu, node);
+	pr_debug("removing cpu %lu from node %d\n", cpu, node);
 
 	if (cpumask_test_cpu(cpu, node_to_cpumask_map[node])) {
 		cpumask_clear_cpu(cpu, node_to_cpumask_map[node]);
@@ -313,7 +310,7 @@ static int __init find_min_common_depth(void)
 					&distance_ref_points_depth);
 
 	if (!distance_ref_points) {
-		dbg("NUMA: ibm,associativity-reference-points not found.\n");
+		pr_debug("NUMA: ibm,associativity-reference-points not found.\n");
 		goto err;
 	}
 
@@ -321,7 +318,7 @@ static int __init find_min_common_depth(void)
 
 	if (firmware_has_feature(FW_FEATURE_OPAL) ||
 	    firmware_has_feature(FW_FEATURE_TYPE1_AFFINITY)) {
-		dbg("Using form 1 affinity\n");
+		pr_debug("Using form 1 affinity\n");
 		form1_affinity = 1;
 	}
 
@@ -719,7 +716,7 @@ static int __init parse_numa_properties(void)
 		return min_common_depth;
 	}
 
-	dbg("NUMA associativity depth for CPU/Memory: %d\n", min_common_depth);
+	pr_debug("NUMA associativity depth for CPU/Memory: %d\n", min_common_depth);
 
 	/*
 	 * Even though we connect cpus to numa domains later in SMP
@@ -1014,9 +1011,6 @@ static int __init early_numa(char *p)
 	if (strstr(p, "off"))
 		numa_enabled = 0;
 
-	if (strstr(p, "debug"))
-		numa_debug = 1;
-
 	p = strstr(p, "fake=");
 	if (p)
 		cmdline = p + strlen("fake=");
@@ -1179,7 +1173,7 @@ static long vphn_get_associativity(unsigned long cpu,
 
 	switch (rc) {
 	case H_SUCCESS:
-		dbg("VPHN hcall succeeded. Reset polling...\n");
+		pr_debug("VPHN hcall succeeded. Reset polling...\n");
 		goto out;
 
 	case H_FUNCTION:
-- 
2.18.2

