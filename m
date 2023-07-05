Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAEC7486FA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 16:56:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VeqS544S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qx2mL103Gz3c3n
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:56:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VeqS544S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx2gd47YCz3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:52:13 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365ElJLV014632;
	Wed, 5 Jul 2023 14:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nlJqE+cibo+UGPtsuePdjSJKwhvmoIYKb8/8e1U+CWc=;
 b=VeqS544SGNTZXr8SoolGAk+daCsWjvVCmNY24lC0C8flKWr65m42edYhYusmEO5vcu28
 XNuSNNiAotsvUM1gxnDWlFfKt+daWVnQOoenXOWK1efQma+IhUjx2o+RlseIztVnk2FB
 G+GZxm5ZRQLvs/TUO2dNxTduKsXv2Kb4di57o0EKTwF2RFkbHKYCS7LeC2eMadtz+IGI
 RWn1ElrwtadOh+cuvLfpKpi1cCUopq8Inf9/btugoURIF/OebFQKZEYvQfu3HHAkg7IK
 N60DjUiHE/qwttrP3RW0HpMfRmC6B7ib3xlgMdKIfSeZV+x70mgrElX9XTE/+vLHaEE7 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnakcr35a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jul 2023 14:51:58 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 365EmZTO018154;
	Wed, 5 Jul 2023 14:51:58 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnakcr336-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jul 2023 14:51:58 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 364LU7H5004614;
	Wed, 5 Jul 2023 14:51:54 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3rjbs4tn9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jul 2023 14:51:54 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 365EpqmP63373808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jul 2023 14:51:52 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 199C32004B;
	Wed,  5 Jul 2023 14:51:52 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1258D20040;
	Wed,  5 Jul 2023 14:51:51 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.171.79.178])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jul 2023 14:51:50 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 05/10] cpu/SMT: Remove topology_smt_supported()
Date: Wed,  5 Jul 2023 16:51:38 +0200
Message-ID: <20230705145143.40545-6-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705145143.40545-1-ldufour@linux.ibm.com>
References: <20230705145143.40545-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EZEHUxAK9b3XFBFmZGNyaEO7onkPwYgU
X-Proofpoint-GUID: _9JftSO7MBQkHp8wXgczc90LL4an8GH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307050131
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, mingo@redhat.com, bp@alien8.de, npiggin@gmail.com, tglx@linutronix.de, rui.zhang@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since the maximum number of threads is now passed to
cpu_smt_set_num_threads(), checking that value is enough to know if SMT is
supported.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/x86/include/asm/topology.h | 2 --
 arch/x86/kernel/smpboot.c       | 8 --------
 kernel/cpu.c                    | 4 ++--
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
index ae49ed4417d0..3235ba1e5b06 100644
--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -141,7 +141,6 @@ static inline int topology_max_smt_threads(void)
 int topology_update_package_map(unsigned int apicid, unsigned int cpu);
 int topology_update_die_map(unsigned int dieid, unsigned int cpu);
 int topology_phys_to_logical_pkg(unsigned int pkg);
-bool topology_smt_supported(void);
 
 extern struct cpumask __cpu_primary_thread_mask;
 #define cpu_primary_thread_mask ((const struct cpumask *)&__cpu_primary_thread_mask)
@@ -164,7 +163,6 @@ static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
 static inline int topology_max_die_per_package(void) { return 1; }
 static inline int topology_max_smt_threads(void) { return 1; }
 static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
-static inline bool topology_smt_supported(void) { return false; }
 #endif /* !CONFIG_SMP */
 
 static inline void arch_fix_phys_package_id(int num, u32 slot)
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index ed2d51960a7d..f8e709fd2cd5 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -326,14 +326,6 @@ static void notrace start_secondary(void *unused)
 	cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
 }
 
-/**
- * topology_smt_supported - Check whether SMT is supported by the CPUs
- */
-bool topology_smt_supported(void)
-{
-	return smp_num_siblings > 1;
-}
-
 /**
  * topology_phys_to_logical_pkg - Map a physical package id to a logical
  * @phys_pkg:	The physical package id to map
diff --git a/kernel/cpu.c b/kernel/cpu.c
index d7dd535cb5b5..70add058e77b 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -621,7 +621,7 @@ void __init cpu_smt_set_num_threads(unsigned int num_threads,
 {
 	WARN_ON(!num_threads || (num_threads > max_threads));
 
-	if (!topology_smt_supported())
+	if (max_threads == 1)
 		cpu_smt_control = CPU_SMT_NOT_SUPPORTED;
 
 	cpu_smt_max_threads = max_threads;
@@ -1801,7 +1801,7 @@ early_param("cpuhp.parallel", parallel_bringup_parse_param);
 
 static inline bool cpuhp_smt_aware(void)
 {
-	return topology_smt_supported();
+	return cpu_smt_max_threads > 1;
 }
 
 static inline const struct cpumask *cpuhp_get_primary_thread_mask(void)
-- 
2.41.0

