Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D43797D80AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 12:24:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XZly470g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGMP25Njnz3vhG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 21:24:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XZly470g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGMHk6zD7z3cGv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 21:20:18 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39QAHT5N032283;
	Thu, 26 Oct 2023 10:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9008Q87wL6AP8f/ZvWozZv8Ku4hVuj3Jg/uxAmF4Tys=;
 b=XZly470g6tp9l3MkZaBbawLsnLDEJiABdageHGN6UIidBmqx+ELUY8Pq1wG55Yo/0ogu
 rDP7RAN+iPIytnbpKZWQyrxZ4RAPHLeH4mhGYXzm5Q+LAYbUqN8aURhg5zcLbSm9i4Aq
 YMzPd+9wQHez+6jo9/tdIvuLxiKwhBNEAjGgIvneqHMhFJ/C40sVeS3QzENObW3zZkhE
 qpoZNhJwfGJFHoSugHX6wXfPNq3A22ovDYzlwl5BDqQzSES+95TSHxOiZ4JAIo9UTaKO
 7KRcnP4i1gtL+DVRwqnmZlf8VgcLcGcILPwayU/GyE5wbXMh5xs3ivSBnmZZKR54FdQO 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3typ7q071k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 10:20:04 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39QAHUPF032408;
	Thu, 26 Oct 2023 10:20:00 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3typ7q069d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 10:19:59 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39Q9eC4W005105;
	Thu, 26 Oct 2023 10:19:48 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tvtfkw4e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 10:19:48 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39QAJkvn38404762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Oct 2023 10:19:46 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFFB12007D;
	Thu, 26 Oct 2023 10:19:46 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBAE420063;
	Thu, 26 Oct 2023 10:19:44 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.109.198.113])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Oct 2023 10:19:44 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 5/5] powerpc/smp: Dynamically build Powerpc topology
Date: Thu, 26 Oct 2023 15:48:40 +0530
Message-ID: <20231026101843.56784-6-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026101843.56784-1-srikar@linux.vnet.ibm.com>
References: <20231026101843.56784-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VAC_yQGkVur_MAU3ju3p-xgf90EQXURV
X-Proofpoint-ORIG-GUID: 1ZRtY_U1-XEQBQ2jRKisfwxJqQyA9_l7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-26_08,2023-10-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310260087
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
 arch/powerpc/kernel/smp.c | 78 ++++++++++++++-------------------------
 1 file changed, 28 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index daede8c2abc1..19af2b41cc53 100644
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
-	{ cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(DIE) },
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
+		cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(DIE)
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

