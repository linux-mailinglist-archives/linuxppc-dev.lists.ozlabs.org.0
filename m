Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0244F7E6371
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 06:52:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M2l8iWos;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQrgj6TNTz3cgd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 16:52:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M2l8iWos;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQrdt6Wdyz3bWQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 16:50:26 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A95Aln4013504;
	Thu, 9 Nov 2023 05:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pQhQg4apXhsXXZZDAj4vFHJNWV4fH6SB8zFy8oQ+Hm4=;
 b=M2l8iWosE9NHHvK8p5Ns4EdLhwd0cjILt7UFMpAJ//hhvF51ZmL8zGCTyWvAwqg5/EOg
 3zJv34qtkPp10f4rpB+c4WabZZn/wng2tYBLAcTsqsv89uq2qxoE2Abz/mbtlgkBA7AK
 Az7VRd2D0/26vBznm5orjWLoKlb7mA6mjkdkQlECJSlM0oxijjCXya4KdpXEqtFl8otR
 J0PqGub62L0nmeHSih+PVjrJP/VqhHbv/KNkWovzAJ7hFUB6XcOpbL3Nr2veLTHUPIfr
 hAxG+1KVdDlo9TXA2KUKWSIUvSkuTnmf/XyQR1FeadmR2Qau9K6zgL2GRJTuJ1WgM+YX XA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u8s201f0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Nov 2023 05:50:02 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3A95mgLx020288;
	Thu, 9 Nov 2023 05:50:02 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u8s201f00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Nov 2023 05:50:02 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3A94rlc2000726;
	Thu, 9 Nov 2023 05:50:01 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3u7w231ttv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Nov 2023 05:50:01 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3A95nxcm45810180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Nov 2023 05:49:59 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C86620043;
	Thu,  9 Nov 2023 05:49:59 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 161A920040;
	Thu,  9 Nov 2023 05:49:57 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.109.198.19])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Nov 2023 05:49:56 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 1/5] powerpc/smp: Enable Asym packing for cores on shared processor
Date: Thu,  9 Nov 2023 11:19:29 +0530
Message-ID: <20231109054938.26589-2-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109054938.26589-1-srikar@linux.vnet.ibm.com>
References: <20231109054938.26589-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vtM3-coGDw4fG6ceF_CwiN4LweawGrYV
X-Proofpoint-ORIG-GUID: b-SMEp_SUD0NIqtTBUv4XDdOsy5d8c6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_04,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
v3 -> v4:
- Dont use splpar_asym_pack with SMT
- Conflict resolution due to rebase
	(DIE changed to PKG)
v2 -> v3:
- Handle comments from Michael Ellerman.
- Rework using existing cpu_has_features static key
v1->v2: Using Jump label instead of a variable.

 arch/powerpc/kernel/smp.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index ab691c89d787..69a3262024f1 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -993,16 +993,20 @@ static bool shared_caches;
 /* cpumask of CPUs with asymmetric SMT dependency */
 static int powerpc_smt_flags(void)
 {
-	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
+	if (!cpu_has_feature(CPU_FTR_ASYM_SMT))
+		return SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
 
-	if (cpu_has_feature(CPU_FTR_ASYM_SMT)) {
-		printk_once(KERN_INFO "Enabling Asymmetric SMT scheduling\n");
-		flags |= SD_ASYM_PACKING;
-	}
-	return flags;
+	return SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES | SD_ASYM_PACKING;
 }
 #endif
 
+/*
+ * On shared processor LPARs scheduled on a big core (which has two or more
+ * independent thread groups per core), prefer lower numbered CPUs, so
+ * that workload consolidates to lesser number of cores.
+ */
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(splpar_asym_pack);
+
 /*
  * P9 has a slightly odd architecture where pairs of cores share an L2 cache.
  * This topology makes it *much* cheaper to migrate tasks between adjacent cores
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
-	{ cpu_cpu_mask, SD_INIT_NAME(PKG) },
+	{ cpu_mc_mask, powerpc_shared_proc_flags, SD_INIT_NAME(MC) },
+	{ cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(PKG) },
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

