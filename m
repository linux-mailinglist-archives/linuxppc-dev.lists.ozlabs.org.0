Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A948D2402E6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 09:41:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ7Dv1MR2zDqM6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 17:41:03 +1000 (AEST)
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
 header.s=pp1 header.b=Krf1qfJ9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ78J6Tz8zDqSF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 17:37:04 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07A7aspq096541; Mon, 10 Aug 2020 03:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qMHGl+1t4gMfa2qMarGYbBHG6334xaEDPdjFO253suY=;
 b=Krf1qfJ9I2CaPj+doPp4MVODycGA52WR10Ymh6f9HHZtf3YCO+k9a/nmRBBhA45fRkf9
 VjaOpYGSv6l7IpFymfppth92RsZx8KO4URFqPtjn/cDeTQ95Z2EPcgynlHl26EteNMTu
 Pai+CjOgIkoLKgwIEqZFGCV8wzpTw7v0+a+tNnL6bcVBfVpLvf2w/JNT9ThL4UI2oSU4
 EGLqVzXdMBxh+uC6NPs1mlefwLv8bxA3PxCTwDkY2Ne+vdglleoFw58UmKFeejrDSGVA
 44t9dofTYau2Svy20RFvXdJq4Qgv+3Mb5Hzbp2v7Jw3jzoxxPZghLL7auVj4SV3Pboo6 /w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sr7h9sr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 03:36:54 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07A7RlMp058579;
 Mon, 10 Aug 2020 03:27:47 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sr7h9qun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 03:25:17 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07A7H9F0017736;
 Mon, 10 Aug 2020 07:18:52 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 32skah17wa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 07:18:51 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07A7Im4t27460080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Aug 2020 07:18:49 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFA1511C05B;
 Mon, 10 Aug 2020 07:18:48 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25B8311C052;
 Mon, 10 Aug 2020 07:18:46 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.102.18.208])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 Aug 2020 07:18:45 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v5 02/10] powerpc/smp: Merge Power9 topology with Power
 topology
Date: Mon, 10 Aug 2020 12:48:26 +0530
Message-Id: <20200810071834.92514-3-srikar@linux.vnet.ibm.com>
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
 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008100048
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

A new sched_domain_topology_level was added just for Power9. However the
same can be achieved by merging powerpc_topology with power9_topology
and makes the code more simpler especially when adding a new sched
domain.

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
Changelog v1 -> v2:
	Replaced a reference to cpu_smt_mask with per_cpu(cpu_sibling_map, cpu)
	since cpu_smt_mask is only defined under CONFIG_SCHED_SMT

 arch/powerpc/kernel/smp.c | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index edf94ca64eea..08da765b91f1 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1313,7 +1313,7 @@ int setup_profiling_timer(unsigned int multiplier)
 }
 
 #ifdef CONFIG_SCHED_SMT
-/* cpumask of CPUs with asymetric SMT dependancy */
+/* cpumask of CPUs with asymmetric SMT dependency */
 static int powerpc_smt_flags(void)
 {
 	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
@@ -1326,14 +1326,6 @@ static int powerpc_smt_flags(void)
 }
 #endif
 
-static struct sched_domain_topology_level powerpc_topology[] = {
-#ifdef CONFIG_SCHED_SMT
-	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
-#endif
-	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
-	{ NULL, },
-};
-
 /*
  * P9 has a slightly odd architecture where pairs of cores share an L2 cache.
  * This topology makes it *much* cheaper to migrate tasks between adjacent cores
@@ -1361,7 +1353,7 @@ static const struct cpumask *smallcore_smt_mask(int cpu)
 }
 #endif
 
-static struct sched_domain_topology_level power9_topology[] = {
+static struct sched_domain_topology_level powerpc_topology[] = {
 #ifdef CONFIG_SCHED_SMT
 	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
 #endif
@@ -1386,21 +1378,10 @@ void __init smp_cpus_done(unsigned int max_cpus)
 #ifdef CONFIG_SCHED_SMT
 	if (has_big_cores) {
 		pr_info("Big cores detected but using small core scheduling\n");
-		power9_topology[0].mask = smallcore_smt_mask;
 		powerpc_topology[0].mask = smallcore_smt_mask;
 	}
 #endif
-	/*
-	 * If any CPU detects that it's sharing a cache with another CPU then
-	 * use the deeper topology that is aware of this sharing.
-	 */
-	if (shared_caches) {
-		pr_info("Using shared cache scheduler topology\n");
-		set_sched_topology(power9_topology);
-	} else {
-		pr_info("Using standard scheduler topology\n");
-		set_sched_topology(powerpc_topology);
-	}
+	set_sched_topology(powerpc_topology);
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
-- 
2.18.2

