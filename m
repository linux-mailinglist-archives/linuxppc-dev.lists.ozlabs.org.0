Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C550722E59E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 07:55:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFTYc0t3LzDqdx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 15:55:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFT3y2dwBzDrBq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 15:33:18 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R5X0eh054099; Mon, 27 Jul 2020 01:33:08 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32ggqrh3rk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 01:33:07 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06R5X0Pd054131;
 Mon, 27 Jul 2020 01:33:07 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32ggqrh3ph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 01:33:07 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06R5VGtL026292;
 Mon, 27 Jul 2020 05:33:03 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 32gcy4htse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 05:33:02 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06R5X085262652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 05:33:00 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDC5C4C046;
 Mon, 27 Jul 2020 05:33:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F6D64C040;
 Mon, 27 Jul 2020 05:32:57 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.97.241])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jul 2020 05:32:56 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v4 07/10] Powerpc/numa: Detect support for coregroup
Date: Mon, 27 Jul 2020 11:02:27 +0530
Message-Id: <20200727053230.19753-8-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200727053230.19753-1-srikar@linux.vnet.ibm.com>
References: <20200727053230.19753-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_03:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270037
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
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
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Anton Blanchard <anton@ozlabs.org>
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Neuling <mikey@neuling.org>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Jordan Niethe <jniethe5@gmail.com>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog v1 -> v2:
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
index 3c5ccf6d2b1c..698000c7f76f 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -74,6 +74,7 @@ static DEFINE_PER_CPU(int, cpu_state) = { 0 };
 
 struct task_struct *secondary_current;
 bool has_big_cores;
+bool coregroup_enabled;
 
 DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 2298899a0f0a..51cb672f113b 100644
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

