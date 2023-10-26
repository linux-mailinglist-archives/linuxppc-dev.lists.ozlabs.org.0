Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EE07D8097
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 12:21:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EWwuFy0C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGMKB1cSvz3cWd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 21:21:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EWwuFy0C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGMHK2wnhz300g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 21:19:57 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39QAF9f3023246;
	Thu, 26 Oct 2023 10:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ovM917uH+87OQ0k9Dg80qKD8TwUEd4qrT2eob+aCDVU=;
 b=EWwuFy0Ctcj4OV6v/Z8tDzN/6zqFqh3f0JC/N44x6eG3GpXeGRb7Ck04bmk2J0h6Jwi2
 u8KQPDo+WDExkPIyQfQgy3PubSEHoSdyWDdi6GaK3jxMyub7NcMV9McZGsx8QC9nSbg5
 KcY0gwNDuM8zAQZJpP3GA697mUbsEeb7GKegUb9cVHfArzpSJffsCosBIni/JjXX28rY
 ZsT41VbFUhjz2E4L0DkWMiSVr+eCIwwFdQX3JHU2lNnJ6PFtDe8faXPhKPhC420EXstA
 MgJcacgnL9oehpFfX+Fu5tgf7DV0BEnRTIU66zrqtdUL0TVhQbCNVjNsaAUabyI+9EjV Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3typ6qg3xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 10:19:37 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39QAFGC6024458;
	Thu, 26 Oct 2023 10:19:37 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3typ6qg3xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 10:19:37 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39QAFijh024403;
	Thu, 26 Oct 2023 10:19:36 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tvu6kd137-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 10:19:36 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39QAJYnv15008352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Oct 2023 10:19:34 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96EDC20063;
	Thu, 26 Oct 2023 10:19:34 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39FE62007C;
	Thu, 26 Oct 2023 10:19:32 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.109.198.113])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Oct 2023 10:19:32 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 1/5] powerpc/smp: Enable Asym packing for cores on shared processor
Date: Thu, 26 Oct 2023 15:48:36 +0530
Message-ID: <20231026101843.56784-2-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026101843.56784-1-srikar@linux.vnet.ibm.com>
References: <20231026101843.56784-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b1_Afhd855bKBcsXoZutgBbOx5d4_kg0
X-Proofpoint-ORIG-GUID: aL2h6E4vKUQo0rgGMIpbgHT8PY5JSp1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-26_07,2023-10-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 malwarescore=0 clxscore=1011 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310260086
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

If there are shared processor LPARs, underlying Hypervisor can have more
virtual cores to handle than actual physical cores.

Starting with Power 9, a big core (aka SMT8 core) has 2 nearly
independent thread groups. On a shared processors LPARs, it helps to
pack threads to lesser number of cores so that the overall system
performance and utilization improves. PowerVM schedules at a big core
level. Hence packing to fewer cores helps.

For example: Lets says there are two 8-core Shared LPARs that are
actually sharing a 8 Core shared physical pool, each running 8 threads
each. Then Consolidating 8 threads to 4 cores on each LPAR would help
them to perform better. This is because each of the LPAR will get
100% time to run applications and there will no switching required by
the Hypervisor.

To achieve this, enable SD_ASYM_PACKING flag at CACHE, MC and DIE level
when the system is running in shared processor mode and has big cores.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog:
v1->v2: Using Jump label instead of a variable.
v2 -> v3:
- Handle comments on commit message (Michael Ellerman)
- Rework using existing cpu_has_features static key (Michael Ellerman)
- Added a comment on why we do asym_packing at core (Peter Zijlstra)

 arch/powerpc/kernel/smp.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5826f5108a12..dbf0a584804b 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -988,18 +988,22 @@ static int __init init_thread_group_cache_map(int cpu, int cache_property)
 }
 
 static bool shared_caches;
+/*
+ * On shared processor LPARs scheduled on a big core (which has two or more
+ * independent thread groups per core), prefer lower numbered CPUs, so
+ * that workload consolidates to lesser number of cores.
+ */
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(splpar_asym_pack);
 
 #ifdef CONFIG_SCHED_SMT
 /* cpumask of CPUs with asymmetric SMT dependency */
 static int powerpc_smt_flags(void)
 {
-	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
+	if (cpu_has_feature(CPU_FTR_ASYM_SMT) ||
+			static_branch_unlikely(&splpar_asym_pack))
+		return SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES | SD_ASYM_PACKING;
 
-	if (cpu_has_feature(CPU_FTR_ASYM_SMT)) {
-		printk_once(KERN_INFO "Enabling Asymmetric SMT scheduling\n");
-		flags |= SD_ASYM_PACKING;
-	}
-	return flags;
+	return SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
 }
 #endif
 
@@ -1011,9 +1015,20 @@ static int powerpc_smt_flags(void)
  */
 static int powerpc_shared_cache_flags(void)
 {
+	if (static_branch_unlikely(&splpar_asym_pack))
+		return SD_SHARE_PKG_RESOURCES | SD_ASYM_PACKING;
+
 	return SD_SHARE_PKG_RESOURCES;
 }
 
+static int powerpc_shared_proc_flags(void)
+{
+	if (static_branch_unlikely(&splpar_asym_pack))
+		return SD_ASYM_PACKING;
+
+	return 0;
+}
+
 /*
  * We can't just pass cpu_l2_cache_mask() directly because
  * returns a non-const pointer and the compiler barfs on that.
@@ -1050,8 +1065,8 @@ static struct sched_domain_topology_level powerpc_topology[] = {
 	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
 #endif
 	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
-	{ cpu_mc_mask, SD_INIT_NAME(MC) },
-	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
+	{ cpu_mc_mask, powerpc_shared_proc_flags, SD_INIT_NAME(MC) },
+	{ cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(DIE) },
 	{ NULL, },
 };
 
@@ -1686,7 +1701,13 @@ static void __init fixup_topology(void)
 {
 	int i;
 
+	if (is_shared_processor() && has_big_cores)
+		static_branch_enable(&splpar_asym_pack);
+
 #ifdef CONFIG_SCHED_SMT
+	if (cpu_has_feature(CPU_FTR_ASYM_SMT))
+		pr_info_once("Enabling Asymmetric SMT scheduling\n");
+
 	if (has_big_cores) {
 		pr_info("Big cores detected but using small core scheduling\n");
 		powerpc_topology[smt_idx].mask = smallcore_smt_mask;
-- 
2.31.1

