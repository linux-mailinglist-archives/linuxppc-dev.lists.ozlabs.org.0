Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E0A813973
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 19:09:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i9o6ZYlb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrgNC6s6yz3dLN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 05:09:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i9o6ZYlb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrgML2mF9z3cV5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 05:08:29 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BEHHnAX031022;
	Thu, 14 Dec 2023 18:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dtYv0ToIrImgw3VsCchO2oRgpTEWYtsdeq4xYNNdzGE=;
 b=i9o6ZYlbjWdC87h4ZZLMHau/qVJS8phD26FUxPEgtnhr3/V3g6wjeFNFFjU1iVsOMaN0
 DvlVIBEM8X7YtGiQMDos02LUXerrINXn3xYQl1WBxpS2ir0lEK/3a/8JMixuEcU/pW4e
 12dr7CjYJEv0y00+31CGWbf/XZTZM8Zw4W+dF5dX+7cQ5g/EVB7KJOxv+S/ihbRssRJd
 HsQvtCvP0fgGGzF4KXpTFsauFT0jkSfVtrTBv/hGZmA8Cm9EhU8oJuSBl/d78T88+Sgn
 VSCNiA+jPDkhmsATxVD3zmhKzbiJxgffnm4L93n2rhoM5gFkg3UufCeCWxSTqfnmcxgB lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v05yu9a0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 18:08:05 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BEHsIG9020038;
	Thu, 14 Dec 2023 18:08:04 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v05yu99yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 18:08:04 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BEHYMqV012555;
	Thu, 14 Dec 2023 18:08:03 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uw3jpah04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 18:08:03 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BEI81p446727600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Dec 2023 18:08:01 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FFAD20049;
	Thu, 14 Dec 2023 18:08:01 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D25E20040;
	Thu, 14 Dec 2023 18:07:58 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.43.25.55])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Dec 2023 18:07:58 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v5 1/5] powerpc/smp: Enable Asym packing for cores on shared processor
Date: Thu, 14 Dec 2023 23:37:11 +0530
Message-ID: <20231214180720.310852-2-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214180720.310852-1-srikar@linux.vnet.ibm.com>
References: <20231214180720.310852-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lSWww8Upt2l9eFaWiCOmoIctfNE8Nb8C
X-Proofpoint-GUID: lsqJHUbody1aOUnDAtfYjaFaYYxb9U6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-14_12,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312140128
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Aneesh <aneesh.kumar@kernel.org>, Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If there are shared processor LPARs, underlying Hypervisor can have more
virtual cores to handle than actual physical cores.

Starting with Power 9, a big core (aka SMT8 core) has 2 nearly
independent thread groups. On a shared processors LPARs, it helps to
pack threads to lesser number of cores so that the overall system
performance and utilization improves. PowerVM schedules at a big core
level. Hence packing to fewer cores helps.

Since each thread-group is independent, running threads on both the
thread-groups of a SMT8 core, should have a minimal adverse impact in
non over provisioned scenarios. These changes in this patchset will not
affect in the over provisioned scenario. If there are more threads than
SMT domains, then asym_packing will not kick-in

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
v4 -> v5:
- commit msg update
v3 -> v4:
- Dont use splpar_asym_pack with SMT
- Conflict resolution due to rebase
	(DIE changed to PKG)
v2 -> v3:
- Handle comments from Michael Ellerman.
- Rework using existing cpu_has_features static key
v1->v2: Using Jump label instead of a variable.

 arch/powerpc/kernel/smp.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index ab691c89d787..3fc8ad9646a4 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1003,6 +1003,13 @@ static int powerpc_smt_flags(void)
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
@@ -1011,9 +1018,20 @@ static int powerpc_smt_flags(void)
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
@@ -1050,8 +1068,8 @@ static struct sched_domain_topology_level powerpc_topology[] = {
 	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
 #endif
 	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
-	{ cpu_mc_mask, SD_INIT_NAME(MC) },
-	{ cpu_cpu_mask, SD_INIT_NAME(PKG) },
+	{ cpu_mc_mask, powerpc_shared_proc_flags, SD_INIT_NAME(MC) },
+	{ cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(PKG) },
 	{ NULL, },
 };
 
@@ -1686,6 +1704,9 @@ static void __init fixup_topology(void)
 {
 	int i;
 
+	if (is_shared_processor() && has_big_cores)
+		static_branch_enable(&splpar_asym_pack);
+
 #ifdef CONFIG_SCHED_SMT
 	if (has_big_cores) {
 		pr_info("Big cores detected but using small core scheduling\n");
-- 
2.35.3

