Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C3B8C8411
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 11:47:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JYG5X5MF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vghvt52W7z3cPX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 19:47:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JYG5X5MF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=anjalik@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vghv80JVdz2yvh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 19:46:59 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44H9Ckui015320;
	Fri, 17 May 2024 09:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=RqX2zjc5R3IfihzlQ53nNL1r3JkyAQFo2XCX+rmM3Ug=;
 b=JYG5X5MFhD3Wmiir/Y4uCN9NtF3eVRiuStrNYFHDZqX4bALesjrGoh9lMV3BHg+pf2oT
 STA/HdaAns2HyxDPiUA7jJG07uWeSDlGLmfOFjcQa7Wgsd+nFSlhZ0ET//PT90beKbnF
 dkuyEYpdIZdbxZVjjF2NnMDQRpW4w7Vhq+4XCWxnj0DWFwnB9/U77ukERj0+v/zxyJsL
 LjueOYuaii8t8nQFtRZkMFSf/KzSfSu7ZdduQKU2X8tr2lwTrXni7ulTbtwqxzoclMcr
 49p9Otq8EAC6igkaTYHN1URYV3p4jX8z8tK3PlMuP93fOqpZu8Oeouukpcj1FeT8yzWy 4Q== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y64d6r20c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 09:46:53 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44H9N4XD029591;
	Fri, 17 May 2024 09:46:52 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2n7m71n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 09:46:52 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44H9kkw752429246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 09:46:48 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A514520043;
	Fri, 17 May 2024 09:46:46 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5484A2004F;
	Fri, 17 May 2024 09:46:45 +0000 (GMT)
Received: from li-e43b234c-2c54-11b2-a85c-fec5a724df9f.ibm.com.com (unknown [9.43.43.247])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 May 2024 09:46:45 +0000 (GMT)
From: Anjali K <anjalik@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/perf: Set cpumode flags using sample address
Date: Fri, 17 May 2024 15:16:07 +0530
Message-Id: <20240517094607.422166-1-anjalik@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: upDhc3sA7v7G_VGoPAnrXaOrDJ8_Dzn_
X-Proofpoint-ORIG-GUID: upDhc3sA7v7G_VGoPAnrXaOrDJ8_Dzn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_03,2024-05-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405170078
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
Cc: anjalik@linux.ibm.com, kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently in some cases, when the sampled instruction address register
latches to a specific address during sampling, there is an inconsistency
in the privilege bits captured in the sampled event register.
For example, a snippet from the perf report on a power10 system is:
Overhead  Address             Command       Shared Object      Symbol
........  ..................  ............  .................  .......................
     2.41%  0x7fff9f94a02c      null_syscall  [unknown]          [k] 0x00007fff9f94a02c
     2.20%  0x7fff9f94a02c      null_syscall  libc.so.6          [.] syscall

perf_get_misc_flags() function looks at the privilege bits to return
the corresponding flags to be used for the address symbol and these
privilege bit details are read from the sampled event register. In the
above snippet, address "0x00007fff9f94a02c" is shown as "k" (kernel) due
to the inconsistent privilege bits captured in the sampled event register.
To address this case, the proposed fix is to additionally check whether the
sampled address is in the kernel area. Since this is specific to the latest
platform, a new pmu flag is added called "PPMU_P10" and is used to
contain the proposed fix.

Signed-off-by: Anjali K <anjalik@linux.ibm.com>
---
Changelog:
V1->V2:
Fixed the build warning reported by the kernel test bot
Added a new flag PPMU_P10 and used it instead of PPMU_ARCH_31 to restrict
the changes to the current platform (Power10)

 arch/powerpc/include/asm/perf_event_server.h |  1 +
 arch/powerpc/perf/core-book3s.c              | 43 ++++++++------------
 arch/powerpc/perf/power10-pmu.c              |  3 +-
 3 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
index e2221d29fdf9..12f7bfb4cab1 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -90,6 +90,7 @@ struct power_pmu {
 #define PPMU_ARCH_31		0x00000200 /* Has MMCR3, SIER2 and SIER3 */
 #define PPMU_P10_DD1		0x00000400 /* Is power10 DD1 processor version */
 #define PPMU_HAS_ATTR_CONFIG1	0x00000800 /* Using config1 attribute */
+#define PPMU_P10			0x00001000 /* For power10 pmu */
 
 /*
  * Values for flags to get_alternatives()
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 6b5f8a94e7d8..8a2677463a73 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -266,31 +266,12 @@ static inline u32 perf_flags_from_msr(struct pt_regs *regs)
 static inline u32 perf_get_misc_flags(struct pt_regs *regs)
 {
 	bool use_siar = regs_use_siar(regs);
-	unsigned long mmcra = regs->dsisr;
-	int marked = mmcra & MMCRA_SAMPLE_ENABLE;
+	unsigned long siar = mfspr(SPRN_SIAR);
+	unsigned long addr;
 
 	if (!use_siar)
 		return perf_flags_from_msr(regs);
 
-	/*
-	 * Check the address in SIAR to identify the
-	 * privilege levels since the SIER[MSR_HV, MSR_PR]
-	 * bits are not set for marked events in power10
-	 * DD1.
-	 */
-	if (marked && (ppmu->flags & PPMU_P10_DD1)) {
-		unsigned long siar = mfspr(SPRN_SIAR);
-		if (siar) {
-			if (is_kernel_addr(siar))
-				return PERF_RECORD_MISC_KERNEL;
-			return PERF_RECORD_MISC_USER;
-		} else {
-			if (is_kernel_addr(regs->nip))
-				return PERF_RECORD_MISC_KERNEL;
-			return PERF_RECORD_MISC_USER;
-		}
-	}
-
 	/*
 	 * If we don't have flags in MMCRA, rather than using
 	 * the MSR, we intuit the flags from the address in
@@ -298,19 +279,29 @@ static inline u32 perf_get_misc_flags(struct pt_regs *regs)
 	 * results
 	 */
 	if (ppmu->flags & PPMU_NO_SIPR) {
-		unsigned long siar = mfspr(SPRN_SIAR);
 		if (is_kernel_addr(siar))
 			return PERF_RECORD_MISC_KERNEL;
 		return PERF_RECORD_MISC_USER;
 	}
 
 	/* PR has priority over HV, so order below is important */
-	if (regs_sipr(regs))
-		return PERF_RECORD_MISC_USER;
-
-	if (regs_sihv(regs) && (freeze_events_kernel != MMCR0_FCHV))
+	if (regs_sipr(regs)) {
+		if (!(ppmu->flags & PPMU_P10))
+			return PERF_RECORD_MISC_USER;
+	} else if (regs_sihv(regs) && (freeze_events_kernel != MMCR0_FCHV))
 		return PERF_RECORD_MISC_HYPERVISOR;
 
+	/*
+	 * Check the address in SIAR to identify the
+	 * privilege levels since the SIER[MSR_HV, MSR_PR]
+	 * bits are not set correctly in power10 sometimes
+	 */
+	if (ppmu->flags & PPMU_P10) {
+		addr = siar ? siar : regs->nip;
+		if (!is_kernel_addr(addr))
+			return PERF_RECORD_MISC_USER;
+	}
+
 	return PERF_RECORD_MISC_KERNEL;
 }
 
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index 62a68b6b2d4b..bb57b7cfe640 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -593,7 +593,8 @@ static struct power_pmu power10_pmu = {
 	.get_mem_weight		= isa207_get_mem_weight,
 	.disable_pmc		= isa207_disable_pmc,
 	.flags			= PPMU_HAS_SIER | PPMU_ARCH_207S |
-				  PPMU_ARCH_31 | PPMU_HAS_ATTR_CONFIG1,
+				  PPMU_ARCH_31 | PPMU_HAS_ATTR_CONFIG1 |
+				  PPMU_P10,
 	.n_generic		= ARRAY_SIZE(power10_generic_events),
 	.generic_events		= power10_generic_events,
 	.cache_events		= &power10_cache_events,

base-commit: dd5a440a31fae6e459c0d6271dddd62825505361
-- 
2.39.3

