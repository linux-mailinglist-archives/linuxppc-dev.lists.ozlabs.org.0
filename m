Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F637E6374
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 06:54:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cY4eZ3sW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQrkf2FTcz3dWr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 16:54:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cY4eZ3sW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQrf72Jj5z3cRp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 16:50:39 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A95lIfN009122;
	Thu, 9 Nov 2023 05:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0fF3Up0tvVC7FwVj/u5EG0pFt2dXz/KpTcdk+vueGz8=;
 b=cY4eZ3sWu1dLgMV1W8Il4oNVbmcH7/4UIlBVCG4fNMPgkMNpF+mck+iaOfdBqKiOZtOU
 s6gF1hteGu/7MQZ5aIgK52DPc+JqV23Y2BpxO7E6lpgHW3Q3tvXYuvWMj5gxcZGfjb9v
 LJAjQWmSzHSnB6cw6k2ZTT/QK0yliBGxEQKQX8OIZ/OVD2FwRWz40aBLxmYNqkmB7zQl
 h/tfGRU2l5L/SwvGk7DlFW0wmTNbrwziqgyvuE0lOo5mFQHg/d6jGLRjK78ubTGvNBdl
 eLAlLUDVFVBCMoLvEcAia/w0IwHGVODuQ3CeU5o7NleWZo5+pam8tCAiUTblWNutTZkP bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u8sk6g3s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Nov 2023 05:50:18 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3A95n63M015669;
	Thu, 9 Nov 2023 05:50:17 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u8sk6g3r1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Nov 2023 05:50:17 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3A951ue3000675;
	Thu, 9 Nov 2023 05:50:16 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3u7w231tw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Nov 2023 05:50:16 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3A95oEJI51249464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Nov 2023 05:50:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E8DD20043;
	Thu,  9 Nov 2023 05:50:14 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDD4420040;
	Thu,  9 Nov 2023 05:50:11 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.109.198.19])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Nov 2023 05:50:11 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 5/5] powerpc/smp: Dynamically build Powerpc topology
Date: Thu,  9 Nov 2023 11:19:33 +0530
Message-ID: <20231109054938.26589-6-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109054938.26589-1-srikar@linux.vnet.ibm.com>
References: <20231109054938.26589-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LSpB3Rpm9-YZ9TM0Ml6nODh5cjw5hnkn
X-Proofpoint-GUID: irbLnf1ZnOzrwVdp3G4s0XQHNTHLcr-I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_04,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311090045
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently there are four Powerpc specific sched topologies.  These are
all statically defined.  However not all these topologies are used by
all Powerpc systems.

To avoid unnecessary degenerations by the scheduler, masks and flags
are compared. However if the sched topologies are build dynamically then
the code is simpler and there are greater chances of avoiding
degenerations.

Note:
Even X86 builds its sched topologies dynamically and proposed changes
are very similar to the way X86 is building its topologies.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog:
v3 -> v4:
- Conflict resolution due to rebase
	(DIE changed to PKG)

 arch/powerpc/kernel/smp.c | 78 ++++++++++++++-------------------------
 1 file changed, 28 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index a84931c37246..6631659cfb38 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -93,15 +93,6 @@ EXPORT_PER_CPU_SYMBOL(cpu_l2_cache_map);
 EXPORT_PER_CPU_SYMBOL(cpu_core_map);
 EXPORT_SYMBOL_GPL(has_big_cores);
 
-enum {
-#ifdef CONFIG_SCHED_SMT
-	smt_idx,
-#endif
-	cache_idx,
-	mc_idx,
-	die_idx,
-};
-
 #define MAX_THREAD_LIST_SIZE	8
 #define THREAD_GROUP_SHARE_L1   1
 #define THREAD_GROUP_SHARE_L2_L3 2
@@ -1064,16 +1055,6 @@ static const struct cpumask *cpu_mc_mask(int cpu)
 	return cpu_coregroup_mask(cpu);
 }
 
-static struct sched_domain_topology_level powerpc_topology[] = {
-#ifdef CONFIG_SCHED_SMT
-	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
-#endif
-	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
-	{ cpu_mc_mask, powerpc_shared_proc_flags, SD_INIT_NAME(MC) },
-	{ cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(PKG) },
-	{ NULL, },
-};
-
 static int __init init_big_cores(void)
 {
 	int cpu;
@@ -1701,9 +1682,11 @@ void start_secondary(void *unused)
 	BUG();
 }
 
-static void __init fixup_topology(void)
+static struct sched_domain_topology_level powerpc_topology[6];
+
+static void __init build_sched_topology(void)
 {
-	int i;
+	int i = 0;
 
 	if (is_shared_processor() && has_big_cores)
 		static_branch_enable(&splpar_asym_pack);
@@ -1714,36 +1697,33 @@ static void __init fixup_topology(void)
 
 	if (has_big_cores) {
 		pr_info("Big cores detected but using small core scheduling\n");
-		powerpc_topology[smt_idx].mask = smallcore_smt_mask;
+		powerpc_topology[i++] = (struct sched_domain_topology_level){
+			smallcore_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT)
+		};
+	} else {
+		powerpc_topology[i++] = (struct sched_domain_topology_level){
+			cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT)
+		};
 	}
 #endif
+	if (shared_caches) {
+		powerpc_topology[i++] = (struct sched_domain_topology_level){
+			shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE)
+		};
+	}
+	if (has_coregroup_support()) {
+		powerpc_topology[i++] = (struct sched_domain_topology_level){
+			cpu_mc_mask, powerpc_shared_proc_flags, SD_INIT_NAME(MC)
+		};
+	}
+	powerpc_topology[i++] = (struct sched_domain_topology_level){
+		cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(PKG)
+	};
 
-	if (!has_coregroup_support())
-		powerpc_topology[mc_idx].mask = powerpc_topology[cache_idx].mask;
-
-	/*
-	 * Try to consolidate topology levels here instead of
-	 * allowing scheduler to degenerate.
-	 * - Dont consolidate if masks are different.
-	 * - Dont consolidate if sd_flags exists and are different.
-	 */
-	for (i = 1; i <= die_idx; i++) {
-		if (powerpc_topology[i].mask != powerpc_topology[i - 1].mask)
-			continue;
-
-		if (powerpc_topology[i].sd_flags && powerpc_topology[i - 1].sd_flags &&
-				powerpc_topology[i].sd_flags != powerpc_topology[i - 1].sd_flags)
-			continue;
-
-		if (!powerpc_topology[i - 1].sd_flags)
-			powerpc_topology[i - 1].sd_flags = powerpc_topology[i].sd_flags;
+	/* There must be one trailing NULL entry left.  */
+	BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
 
-		powerpc_topology[i].mask = powerpc_topology[i + 1].mask;
-		powerpc_topology[i].sd_flags = powerpc_topology[i + 1].sd_flags;
-#ifdef CONFIG_SCHED_DEBUG
-		powerpc_topology[i].name = powerpc_topology[i + 1].name;
-#endif
-	}
+	set_sched_topology(powerpc_topology);
 }
 
 void __init smp_cpus_done(unsigned int max_cpus)
@@ -1758,9 +1738,7 @@ void __init smp_cpus_done(unsigned int max_cpus)
 		smp_ops->bringup_done();
 
 	dump_numa_cpu_topology();
-
-	fixup_topology();
-	set_sched_topology(powerpc_topology);
+	build_sched_topology();
 }
 
 /*
-- 
2.31.1

