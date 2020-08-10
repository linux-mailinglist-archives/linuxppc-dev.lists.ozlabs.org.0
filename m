Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BD0240288
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 09:31:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ71T5YqfzDqSl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 17:31:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=M8rU9dVt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ6lr534KzDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 17:19:20 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07A75L2o041877; Mon, 10 Aug 2020 03:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EABG8Gu6w1DW2OlVB0Kw6GlIxF3JELepaysVn8EfUZ4=;
 b=M8rU9dVt6q7KMOLvAZwci69wYPYjnA7uE5GPtmNeBKt8MNhOll23dOZlRmNCub+uezU9
 Fkavw4XUPafHCqf4nkW0X7BzgxFe8zOXmggoHxtNcc0izo2wmwDu+/GS8xrkIqOPC7lW
 /gs7X1RF0qsks9UDu6xx2A99F/z8vy5dFxzENrdiUHLYYlsrlYonGZykVN0wFJFpZrVU
 ctVOakvxopAmYBEYJG8OuKGGs+smDWfx7DBk8MZMSH/cQzk27iK75B2BxkGF/MYuTnMN
 8C55hv28MskJE6zLuG9C98NAWlQyKE0mRd2euD6ja+DjdqSxJJcWesLQZ8bHw1qRicvg kQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32sr7mtgtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 03:19:09 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07A78L26052167;
 Mon, 10 Aug 2020 03:19:09 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32sr7mtgt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 03:19:08 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07A7GC67028365;
 Mon, 10 Aug 2020 07:19:07 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 32skp817h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 07:19:06 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07A7J4kc65405356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Aug 2020 07:19:04 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08F8C11C04C;
 Mon, 10 Aug 2020 07:19:04 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55E0011C04A;
 Mon, 10 Aug 2020 07:19:01 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.102.18.208])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 Aug 2020 07:19:01 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v5 07/10] powerpc/numa: Detect support for coregroup
Date: Mon, 10 Aug 2020 12:48:31 +0530
Message-Id: <20200810071834.92514-8-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810071834.92514-1-srikar@linux.vnet.ibm.com>
References: <20200810071834.92514-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-10_02:2020-08-06,
 2020-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008100046
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
interested in the last or the smallest coregroups, i.e one sub-group
per DIE.

Currently there are no firmwares that are exposing this grouping. Hence
allow the basis for grouping to be abstract.  Once the firmware starts
using this grouping, code would be added to detect the type of grouping
and adjust the sd domain flags accordingly.

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
Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog v4->v5:
	Updated commit msg with current abstract nature of the coregroups
						(Michael Ellerman)

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
index 91cf5d05e7ec..7403fdcf3821 100644
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
2.18.2

