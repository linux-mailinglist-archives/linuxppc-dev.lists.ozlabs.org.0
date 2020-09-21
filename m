Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CAE272121
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 12:30:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw10r6gSPzDqNy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 20:30:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ke24WU87; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw0Hf0wW5zDqWr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 19:58:05 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08L9X1rR041088; Mon, 21 Sep 2020 05:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jQOaqnEcRrITUPYlnEMjvu9BklPy8ufP8IkIeL0k9Nk=;
 b=ke24WU87Hvi17tFeibm/TEDq147cnFK1GKY6AebOE14REOdJt+hUuJvblEnLeLp4SW0Y
 gINQ3MJMRxiCAcPBAjH/h8vZgUIwDNTVLqM8yblkDfY6NZrQ90bPhFpyvyeWvyXLeBw/
 z1GOLG+nhRQv5FryrvzfxsuAhzvzr0Z2z0VxzbzOKk5KdPP2WJPUtk9cFi1NgCUEGQPN
 ASnxQ3j0J6RvOBfeQc7JgC8QmReNKsnXXo/4wYjQKg/rXEL+uI6Y6pcZZISZio84n3BH
 a/xysvrhatrqvRVYqFjKUs1osaYhOyXxEu9PmxTSNaXu0yPz12nleP9sM9WOrkSOIguW RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33pshv0sy9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 05:57:55 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08L9vO5V121984;
 Mon, 21 Sep 2020 05:57:55 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33pshv0sxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 05:57:55 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08L9vrQc012141;
 Mon, 21 Sep 2020 09:57:53 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 33n98gswsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 09:57:53 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08L9vowT30409120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 09:57:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D55CA52050;
 Mon, 21 Sep 2020 09:57:50 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.77.192.225])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8C55552051;
 Mon, 21 Sep 2020 09:57:47 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 11/11] powerpc/smp: Optimize update_coregroup_mask
Date: Mon, 21 Sep 2020 15:26:53 +0530
Message-Id: <20200921095653.9701-12-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200921095653.9701-1-srikar@linux.vnet.ibm.com>
References: <20200921095653.9701-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-21_01:2020-09-21,
 2020-09-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=2
 impostorscore=0 phishscore=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009210069
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
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All threads of a SMT4/SMT8 core can either be part of CPU's coregroup
mask or outside the coregroup. Use this relation to reduce the
number of iterations needed to find all the CPUs that share the same
coregroup

Use a temporary mask to iterate through the CPUs that may share
coregroup mask. Also instead of setting one CPU at a time into
cpu_coregroup_mask, copy the SMT4/SMT8/submask at one shot.

Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Anton Blanchard <anton@ozlabs.org>
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Neuling <mikey@neuling.org>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/smp.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index b48ae4e306d3..bbaea93dc558 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1339,19 +1339,33 @@ static inline void add_cpu_to_smallcore_masks(int cpu)
 
 static void update_coregroup_mask(int cpu)
 {
-	int first_thread = cpu_first_thread_sibling(cpu);
+	struct cpumask *(*submask_fn)(int) = cpu_sibling_mask;
+	cpumask_var_t mask;
 	int coregroup_id = cpu_to_coregroup_id(cpu);
 	int i;
 
-	cpumask_set_cpu(cpu, cpu_coregroup_mask(cpu));
-	for_each_cpu_and(i, cpu_online_mask, cpu_cpu_mask(cpu)) {
-		int fcpu = cpu_first_thread_sibling(i);
+	alloc_cpumask_var_node(&mask, GFP_KERNEL, cpu_to_node(cpu));
+	cpumask_and(mask, cpu_online_mask, cpu_cpu_mask(cpu));
+
+	if (shared_caches)
+		submask_fn = cpu_l2_cache_mask;
+
+	/* Update coregroup mask with all the CPUs that are part of submask */
+	or_cpumasks_related(cpu, cpu, submask_fn, cpu_coregroup_mask);
+
+	/* Skip all CPUs already part of coregroup mask */
+	cpumask_andnot(mask, mask, cpu_coregroup_mask(cpu));
 
-		if (fcpu == first_thread)
-			set_cpus_related(cpu, i, cpu_coregroup_mask);
-		else if (coregroup_id == cpu_to_coregroup_id(i))
-			set_cpus_related(cpu, i, cpu_coregroup_mask);
+	for_each_cpu(i, mask) {
+		/* Skip all CPUs not part of this coregroup */
+		if (coregroup_id == cpu_to_coregroup_id(i)) {
+			or_cpumasks_related(cpu, i, submask_fn, cpu_coregroup_mask);
+			cpumask_andnot(mask, mask, submask_fn(i));
+		} else {
+			cpumask_andnot(mask, mask, cpu_coregroup_mask(i));
+		}
 	}
+	free_cpumask_var(mask);
 }
 
 static void add_cpu_to_masks(int cpu)
-- 
2.17.1

