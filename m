Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC32227F50
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 13:52:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9xmY6GdYzDqRJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 21:52:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9xT0645pzDqHw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:39:16 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LBYC9q027439; Tue, 21 Jul 2020 07:39:10 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5pfnyvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 07:39:09 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06LBYGGg027718;
 Tue, 21 Jul 2020 07:39:09 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5pfnyuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 07:39:09 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06LBak6Y016123;
 Tue, 21 Jul 2020 11:39:07 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 32brq81xf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 11:39:07 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06LBd21r25821680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 11:39:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B50C642047;
 Tue, 21 Jul 2020 11:39:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79E8542042;
 Tue, 21 Jul 2020 11:38:58 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.93.17])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jul 2020 11:38:58 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <michaele@au1.ibm.com>
Subject: [PATCH v2 07/10] Powerpc/numa: Detect support for coregroup
Date: Tue, 21 Jul 2020 17:08:11 +0530
Message-Id: <20200721113814.32284-8-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721113814.32284-1-srikar@linux.vnet.ibm.com>
References: <20200721113814.32284-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_05:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210077
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
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 Anton Blanchard <anton@au1.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Nick Piggin <npiggin@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for grouping cores based on the device-tree classification.
- The last domain in the associativity domains always refers to the
core.
- If primary reference domain happens to be the penultimate domain in
the associativity domains device-tree property, then there are no
coregroups. However if its not a penultimate domain, then there are
coregroups. There can be more than one coregroup. For now we would be
interested in the last or the smallest coregroups.

Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <michaele@au1.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Nick Piggin <npiggin@au1.ibm.com>
Cc: Oliver OHalloran <oliveroh@au1.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Neuling <mikey@linux.ibm.com>
Cc: Anton Blanchard <anton@au1.ibm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Cc: Jordan Niethe <jniethe5@gmail.com>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog v1 -> v2:
Powerpc/numa: Detect support for coregroup
	Explained Coregroup in commit msg (Michael Ellerman)

 arch/powerpc/include/asm/smp.h |  1 +
 arch/powerpc/kernel/smp.c      |  1 +
 arch/powerpc/mm/numa.c         | 34 +++++++++++++++++++++-------------
 3 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index 49a25e2400f2..5bdc17a7049f 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -28,6 +28,7 @@
 extern int boot_cpuid;
 extern int spinning_secondaries;
 extern u32 *cpu_to_phys_id;
+extern bool coregroup_enabled;
 
 extern void cpu_die(void);
 extern int cpu_to_chip_id(int cpu);
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 933ebdf97432..320e36a0ec0b 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -74,6 +74,7 @@ static DEFINE_PER_CPU(int, cpu_state) = { 0 };
 
 struct task_struct *secondary_current;
 bool has_big_cores;
+bool coregroup_enabled;
 
 DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index bc5b2e8112c8..3248160c0327 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -886,7 +886,9 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
 static void __init find_possible_nodes(void)
 {
 	struct device_node *rtas;
-	u32 numnodes, i;
+	const __be32 *domains;
+	int prop_length, max_nodes;
+	u32 i;
 
 	if (!numa_enabled)
 		return;
@@ -895,25 +897,31 @@ static void __init find_possible_nodes(void)
 	if (!rtas)
 		return;
 
-	if (of_property_read_u32_index(rtas, "ibm,current-associativity-domains",
-				min_common_depth, &numnodes)) {
-		/*
-		 * ibm,current-associativity-domains is a fairly recent
-		 * property. If it doesn't exist, then fallback on
-		 * ibm,max-associativity-domains. Current denotes what the
-		 * platform can support compared to max which denotes what the
-		 * Hypervisor can support.
-		 */
-		if (of_property_read_u32_index(rtas, "ibm,max-associativity-domains",
-				min_common_depth, &numnodes))
+	/*
+	 * ibm,current-associativity-domains is a fairly recent property. If
+	 * it doesn't exist, then fallback on ibm,max-associativity-domains.
+	 * Current denotes what the platform can support compared to max
+	 * which denotes what the Hypervisor can support.
+	 */
+	domains = of_get_property(rtas, "ibm,current-associativity-domains",
+					&prop_length);
+	if (!domains) {
+		domains = of_get_property(rtas, "ibm,max-associativity-domains",
+					&prop_length);
+		if (!domains)
 			goto out;
 	}
 
-	for (i = 0; i < numnodes; i++) {
+	max_nodes = of_read_number(&domains[min_common_depth], 1);
+	for (i = 0; i < max_nodes; i++) {
 		if (!node_possible(i))
 			node_set(i, node_possible_map);
 	}
 
+	prop_length /= sizeof(int);
+	if (prop_length > min_common_depth + 2)
+		coregroup_enabled = 1;
+
 out:
 	of_node_put(rtas);
 }
-- 
2.17.1

