Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6498E32D210
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 12:56:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drq8J2TQPz3d6l
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 22:56:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F15kLLvR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=F15kLLvR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drq7r3mqFz3bP5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 22:55:51 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 124Bp6Yb191853; Thu, 4 Mar 2021 06:55:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=9DBGU4lcSJgGd3Vehh5cjdhwwEXUCX54i9v1eFqFRQo=;
 b=F15kLLvRjk1denBfkfCn0MOoofIEINFcAlYqfVaYARkkG8bU90R5pAPRNGEz798o8inf
 CtYBeVzLj/3m+33WN5kcXvtTs4tRwbdep+RVQ7lRDPtSma2MT9Jvrl7l8BMYzkR7IRMC
 yO6y0/9BnnchVn3d7NmVvgbHb1aMi1a+rnN3r5tkm0oleIBIofGXjb4/jSr4BykpKSrz
 y1NtvkvMuEgYRZxJLdoE1AfNCPLCXvduGO2RrjSz01HLsO56BQnb83ADMoJW3pAevToJ
 swn8/Qwvo1huxgfNyDzqsZxKi8ycYxb+V9tRu95L1XyznToQthkZ7tEXz4jYPbJBqSL0 XQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 372y1fr2aj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 06:55:44 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 124BhB0x021471;
 Thu, 4 Mar 2021 11:55:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 37293fs1mn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 11:55:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 124Btelq46793016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Mar 2021 11:55:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2D094C046;
 Thu,  4 Mar 2021 11:55:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B971D4C040;
 Thu,  4 Mar 2021 11:55:38 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.195.34.64])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Mar 2021 11:55:38 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Fix sampled instruction type for larx/stcx
Date: Thu,  4 Mar 2021 06:55:37 -0500
Message-Id: <1614858937-1485-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_03:2021-03-03,
 2021-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103040054
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sampled Instruction Event Register (SIER) field [46:48]
identifies the sampled instruction type. ISA v3.1 says value
of 0b111 for this field as reserved, but in POWER10 it denotes
LARX/STCX type which will hopefully be fixed in ISA v3.1 update.

Patch fixes the functions to handle type value 7 for
CPU_FTR_ARCH_31.

Fixes: a64e697cef23 ("powerpc/perf: power10 Performance Monitoring support")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/isa207-common.c | 30 +++++++++++++++++++++++++++---
 arch/powerpc/perf/isa207-common.h |  1 +
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index e4f577da33d8..754f904d8d69 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -266,6 +266,8 @@ void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
 	u32 sub_idx;
 	u64 sier;
 	u64 val;
+	u64 mmcra = mfspr(SPRN_MMCRA);
+	u32 op_type;
 
 	/* Skip if no SIER support */
 	if (!(flags & PPMU_HAS_SIER)) {
@@ -275,12 +277,34 @@ void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
 
 	sier = mfspr(SPRN_SIER);
 	val = (sier & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
-	if (val == 1 || val == 2) {
+	if (val == 1 || val == 2 || (val == 7 && cpu_has_feature(CPU_FTR_ARCH_31))) {
 		idx = (sier & ISA207_SIER_LDST_MASK) >> ISA207_SIER_LDST_SHIFT;
 		sub_idx = (sier & ISA207_SIER_DATA_SRC_MASK) >> ISA207_SIER_DATA_SRC_SHIFT;
 
 		dsrc->val = isa207_find_source(idx, sub_idx);
-		dsrc->val |= (val == 1) ? P(OP, LOAD) : P(OP, STORE);
+		if (val == 7) {
+			/*
+			 * Type 0b111 denotes either larx or stcx instruction. Use the
+			 * MMCRA sampling bits [57:59] along with the type value
+			 * to determine the exact instruction type. If the sampling
+			 * criteria is neither load or store, set the type as default
+			 * to NA.
+			 */
+			op_type = (mmcra >> MMCRA_SAMP_ELIG_SHIFT) & MMCRA_SAMP_ELIG_MASK;
+			switch (op_type) {
+			case 5:
+				dsrc->val |= P(OP, LOAD);
+				break;
+			case 7:
+				dsrc->val |= P(OP, STORE);
+				break;
+			default:
+				dsrc->val |= P(OP, NA);
+				break;
+			}
+		} else {
+			dsrc->val |= (val == 1) ? P(OP, LOAD) : P(OP, STORE);
+		}
 	}
 }
 
@@ -295,7 +319,7 @@ void isa207_get_mem_weight(u64 *weight)
 	if (cpu_has_feature(CPU_FTR_ARCH_31))
 		mantissa = P10_MMCRA_THR_CTR_MANT(mmcra);
 
-	if (val == 0 || val == 7)
+	if (val == 0 || (val == 7 && !cpu_has_feature(CPU_FTR_ARCH_31)))
 		*weight = 0;
 	else
 		*weight = mantissa << (2 * exp);
diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
index 1af0e8c97ac7..7b0242efe4b9 100644
--- a/arch/powerpc/perf/isa207-common.h
+++ b/arch/powerpc/perf/isa207-common.h
@@ -220,6 +220,7 @@
 /* Bits in MMCRA for PowerISA v2.07 */
 #define MMCRA_SAMP_MODE_SHIFT		1
 #define MMCRA_SAMP_ELIG_SHIFT		4
+#define MMCRA_SAMP_ELIG_MASK		7
 #define MMCRA_THR_CTL_SHIFT		8
 #define MMCRA_THR_SEL_SHIFT		16
 #define MMCRA_THR_CMP_SHIFT		32
-- 
1.8.3.1

