Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4332867E5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 20:58:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C63Wn3t48zDqSn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 05:58:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=M7CP0ZMw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C635N5R8fzDqDl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 05:39:04 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097IZgTZ055731; Wed, 7 Oct 2020 14:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pfWPAGyke+qFeG9FqTdwNmA9D5u7aKnmbAFSyM26SU4=;
 b=M7CP0ZMw3NHbYTMb09tufqMKZy3mNgX/uCrIhStP4S2sv1NcFVSvWqy1vh+vwImQkohG
 khuEWVWOb5MExz2cF9HM795dmyfnR7yyRqQS724HxmG51eqce6jDGBcRfEgE4vsJduX+
 YmqPEAftusCNje2Tdr8KySYTMgiiHzlQWawoA2OJbNVWhgIdq3HSx9EqQBd1a7irZ6J0
 xuz1wlTYf39AR0HLFC3ziIBC/IkBhw4y7Ed8rGCHqzDQ5Fn9XScJa3lkEzAilup1IUPn
 1YH/RiEtDZo1gCNb9ZcjUPnFOPdoqCvTKpHdUjjOspR6pse685Sytyk6YXgI8GIpZfu9 jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341jun0cn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 14:38:50 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 097IZmFA056017;
 Wed, 7 Oct 2020 14:38:49 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341jun0ck8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 14:38:49 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 097IQulo011843;
 Wed, 7 Oct 2020 18:38:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 33xgjh4js7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 18:38:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 097Ichnl33554932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Oct 2020 18:38:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99D98A405C;
 Wed,  7 Oct 2020 18:38:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37C66A4054;
 Wed,  7 Oct 2020 18:38:40 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.90.101])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Oct 2020 18:38:39 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 09/11] powerpc/smp: Optimize update_mask_by_l2
Date: Thu,  8 Oct 2020 00:07:58 +0530
Message-Id: <20201007183800.27415-10-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201007183800.27415-1-srikar@linux.vnet.ibm.com>
References: <20201007183800.27415-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_10:2020-10-07,
 2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 mlxscore=0 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 suspectscore=2 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010070118
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
 Valentin Schneider <valentin.schneider@arm.com>, Qian Cai <cai@redhat.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All threads of a SMT4 core can either be part of this CPU's l2-cache
mask or not related to this CPU l2-cache mask. Use this relation to
reduce the number of iterations needed to find all the CPUs that share
the same l2-cache.

Use a temporary mask to iterate through the CPUs that may share l2_cache
mask. Also instead of setting one CPU at a time into cpu_l2_cache_mask,
copy the SMT4/sub mask at one shot.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
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
Cc: Qian Cai <cai@redhat.com>
---
Changelog v2->v3:
	Use GFP_ATOMIC instead of GFP_KERNEL since allocations need to
	atomic at the time of CPU HotPlug
	Reported by Qian Cai <cai@redhat.com>

 arch/powerpc/kernel/smp.c | 52 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 6f866e6b12f8..17e90c2414af 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -671,6 +671,28 @@ static void set_cpus_unrelated(int i, int j,
 #endif
 
 /*
+ * Extends set_cpus_related. Instead of setting one CPU at a time in
+ * dstmask, set srcmask at oneshot. dstmask should be super set of srcmask.
+ */
+static void or_cpumasks_related(int i, int j, struct cpumask *(*srcmask)(int),
+				struct cpumask *(*dstmask)(int))
+{
+	struct cpumask *mask;
+	int k;
+
+	mask = srcmask(j);
+	for_each_cpu(k, srcmask(i))
+		cpumask_or(dstmask(k), dstmask(k), mask);
+
+	if (i == j)
+		return;
+
+	mask = srcmask(i);
+	for_each_cpu(k, srcmask(j))
+		cpumask_or(dstmask(k), dstmask(k), mask);
+}
+
+/*
  * parse_thread_groups: Parses the "ibm,thread-groups" device tree
  *                      property for the CPU device node @dn and stores
  *                      the parsed output in the thread_groups
@@ -1220,7 +1242,9 @@ static struct device_node *cpu_to_l2cache(int cpu)
 
 static bool update_mask_by_l2(int cpu)
 {
+	struct cpumask *(*submask_fn)(int) = cpu_sibling_mask;
 	struct device_node *l2_cache, *np;
+	cpumask_var_t mask;
 	int i;
 
 	l2_cache = cpu_to_l2cache(cpu);
@@ -1240,22 +1264,38 @@ static bool update_mask_by_l2(int cpu)
 		return false;
 	}
 
-	cpumask_set_cpu(cpu, cpu_l2_cache_mask(cpu));
-	for_each_cpu_and(i, cpu_online_mask, cpu_cpu_mask(cpu)) {
+	/* In CPU-hotplug path, hence use GFP_ATOMIC */
+	alloc_cpumask_var_node(&mask, GFP_ATOMIC, cpu_to_node(cpu));
+	cpumask_and(mask, cpu_online_mask, cpu_cpu_mask(cpu));
+
+	if (has_big_cores)
+		submask_fn = cpu_smallcore_mask;
+
+	/* Update l2-cache mask with all the CPUs that are part of submask */
+	or_cpumasks_related(cpu, cpu, submask_fn, cpu_l2_cache_mask);
+
+	/* Skip all CPUs already part of current CPU l2-cache mask */
+	cpumask_andnot(mask, mask, cpu_l2_cache_mask(cpu));
+
+	for_each_cpu(i, mask) {
 		/*
 		 * when updating the marks the current CPU has not been marked
 		 * online, but we need to update the cache masks
 		 */
 		np = cpu_to_l2cache(i);
-		if (!np)
-			continue;
 
-		if (np == l2_cache)
-			set_cpus_related(cpu, i, cpu_l2_cache_mask);
+		/* Skip all CPUs already part of current CPU l2-cache */
+		if (np == l2_cache) {
+			or_cpumasks_related(cpu, i, submask_fn, cpu_l2_cache_mask);
+			cpumask_andnot(mask, mask, submask_fn(i));
+		} else {
+			cpumask_andnot(mask, mask, cpu_l2_cache_mask(i));
+		}
 
 		of_node_put(np);
 	}
 	of_node_put(l2_cache);
+	free_cpumask_var(mask);
 
 	return true;
 }
-- 
2.17.1

