Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 325578C3141
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2024 14:23:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L9tjBxpH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vc4fd5VDDz3cXv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2024 22:23:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L9tjBxpH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=anjalik@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vbygx57mWz30V7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2024 17:54:21 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44B7d6In001583;
	Sat, 11 May 2024 07:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ecl/eayyIai2XJP7MPcuH9T5ixrO/RIMTNTfUvM4CgE=;
 b=L9tjBxpHSgS2ii4b+r2b1KJfDEe4knupLp9eQVfpsPHqwKNnatw/NGPFvRjSdMgiOJMI
 rMvfziK8bStbdExb7gWl6eGsxiEx1B3BX+URSPRo4/JU9o7P86zPYRqYqdNDNHQaK+yh
 nKTlDIDNqhRcmCG4CMZE+/cJ1x3uyfPCFH/ZnNoNU35QJtIMuwMvCLq87Qjme58lx0R3
 Yc16T+LKyxJqbA3OHuG/TsJ0DtBTxx0G+rFkNfzj0hv7MIXXXGXxH/5rSszkIU8DY6cj
 v/go6r5GjeteZdOehmdQ7HxZpF9hYRGc0fIvtpt/J3EFGql2mCiv4oxtvxgXPGhhCinQ 4A== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y24ekg0vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 May 2024 07:54:14 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44B53dNi004174;
	Sat, 11 May 2024 07:54:13 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xysgswtwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 May 2024 07:54:13 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44B7s7Nh42074460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 May 2024 07:54:09 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 610F42004F;
	Sat, 11 May 2024 07:54:07 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A45BE20040;
	Sat, 11 May 2024 07:54:05 +0000 (GMT)
Received: from li-e43b234c-2c54-11b2-a85c-fec5a724df9f.ibm.com.com (unknown [9.43.118.128])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 11 May 2024 07:54:05 +0000 (GMT)
From: Anjali K <anjalik@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/perf: set cpumode flags using sample address in the PPMU_ARCH_31 case
Date: Sat, 11 May 2024 13:23:44 +0530
Message-Id: <20240511075344.1393631-1-anjalik@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZjYAXvfBJvlv4U96q-LRKEHh6ZXMbWjL
X-Proofpoint-ORIG-GUID: ZjYAXvfBJvlv4U96q-LRKEHh6ZXMbWjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-11_03,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 clxscore=1011
 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405110057
X-Mailman-Approved-At: Sat, 11 May 2024 22:23:01 +1000
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
the corresponding flags to be used for the address symbol and this
privilege bit details are read from the sampled event register. In the
above snippet, address "0x00007fff9f94a02c" is shown as "k" (kernel) due
to the inconsistent privilege bits captured in the sampled event register.
To address this case, the proposed fix is to additionally check whether the
sampled address is in the kernel area. Also since this fix is to address a
specific case, the fix is included within the corresponding flag
(PPMU_ARCH_31).

Signed-off-by: Anjali K <anjalik@linux.ibm.com>
---
 arch/powerpc/perf/core-book3s.c | 41 ++++++++++++++-------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 6b5f8a94e7d8..dd0c23ebaf5a 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -268,29 +268,12 @@ static inline u32 perf_get_misc_flags(struct pt_regs *regs)
 	bool use_siar = regs_use_siar(regs);
 	unsigned long mmcra = regs->dsisr;
 	int marked = mmcra & MMCRA_SAMPLE_ENABLE;
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
@@ -298,19 +281,29 @@ static inline u32 perf_get_misc_flags(struct pt_regs *regs)
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
+		if (!(ppmu->flags & PPMU_ARCH_31))
+			return PERF_RECORD_MISC_USER;
+	} else if (regs_sihv(regs) && (freeze_events_kernel != MMCR0_FCHV))
 		return PERF_RECORD_MISC_HYPERVISOR;
 
+	/*
+	 * Check the address in SIAR to identify the
+	 * privilege levels since the SIER[MSR_HV, MSR_PR]
+	 * bits are not set correctly in power10 sometimes
+	 */
+	if (ppmu->flags & PPMU_ARCH_31) {
+		addr = siar ? siar : regs->nip;
+		if (!is_kernel_addr(addr))
+			return PERF_RECORD_MISC_USER;
+	}
+
 	return PERF_RECORD_MISC_KERNEL;
 }
 

base-commit: dd5a440a31fae6e459c0d6271dddd62825505361
-- 
2.39.3

