Return-Path: <linuxppc-dev+bounces-5450-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E17FA17EAC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 14:16:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcnmC0XBNz30T9;
	Wed, 22 Jan 2025 00:16:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737465402;
	cv=none; b=hKykYX3fBV41jZoSJur9Obl9AuRCCKumxf7ewb6di7F0DYJTa9KBxN2P3jJzOCjiZhKxYG7CrFnjfyauY1kC67ZQcFnwhSuJgcStgGDofCUX+zPFG9KAxM2BjueRMdmUzMCTquVmagG4da/sezExVF4DMAgA79R202i2OyLSO31mUQpQD4ljTProdAd8t/N5Hg5j3zSnpnwezI11h79WTYmNxL2+DenXXCJSHuHqR9Jw2XmYX44SsULKfu1f3h0Kz9oDXzm8cWsrpQgBVp6/quukqel0vy4aa2M14xtDM7o1kVGFFeXbIEEpbzUpqyj3pXtFQU9ubQdVMBBpf8AiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737465402; c=relaxed/relaxed;
	bh=/drKaW5KH3n8+cPpyv+re95WdZOTIW6bwt1Fx1sqS+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wt1KWU3xCoJ1Nipny71qvIzGLuwBF1EE1FrGSBm221YMq6L32eQHrxld6EpKOoodaO33QJioWzxe0z304YwR/Cjd09ZnPjIEXWtvq+jvLabHZitt5Hy3WGx665B2Bwsf6wdb+O3TLe1XeJ98hS3z7r18k3xLi5JTc8CScW92JrIkCsbz5qVfKO4FXMe6AakYSuh9rxqPPqgtNIfib8Hv6C56R2pbbiBavW2JarKjmWkK7y+1X/pgaBAF7EnLyObr9xp4Rn569OB4XheG20mhzoFAdDB9xqO0iJwnGXYu8YY9FK1r+/kotMY/lNrXDzFmXeOBdny5W/m5sfxMSMD5GQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hEFTjK6g; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hEFTjK6g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcnmB2VtQz306d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 00:16:42 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L7XCXx009903
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 13:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=/drKaW5KH3n8+cPpy
	v+re95WdZOTIW6bwt1Fx1sqS+w=; b=hEFTjK6gtWI9FLefDuD9/1amJ8p56yEHF
	MceqVeBoZg9dMPYGdlEGqD26FAt+ui8K0GolPpDTB8zOR/rHky62sv4dy3+Yqrpj
	7iCCzRo60E//sfYuVxPLni1CyslR0DlTDg+nXgKa2SRaFDGw1TEJ6N/f0bvm2yo+
	Xjp4V4JVKwrXvzf5t6nqe1Ker3QJlV1cCF0Laxr+sDbnVco6sNomX9iBwfJ0dGqF
	P7xZTHWDF+ek8sLG93sNagPvewAnOrGiANIfgE2l41TxHXxmrm3utaeyIlonI7aY
	l6ljVoyGVHpG8lmgIpUI74oow6XwcJY7kHLc4i7QXbLu53W1fhzXg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44a79n1jgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 13:16:40 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50LDCATn024240
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 13:16:39 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448q0y3eq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 13:16:39 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50LDGZWp27460014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 13:16:35 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C71732004B;
	Tue, 21 Jan 2025 13:16:35 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A28E20040;
	Tue, 21 Jan 2025 13:16:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.248.49])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Jan 2025 13:16:31 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, hbathini@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com
Subject: [PATCH V3 2/2] arch/powerpc/perf: Update get_mem_data_src function to use saved values of sier and mmcra regs
Date: Tue, 21 Jan 2025 18:46:21 +0530
Message-Id: <20250121131621.39054-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20250121131621.39054-1-atrajeev@linux.vnet.ibm.com>
References: <20250121131621.39054-1-atrajeev@linux.vnet.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BlY_sj9DWfqOEp4PUB_ApHsz2h4PQCB4
X-Proofpoint-ORIG-GUID: BlY_sj9DWfqOEp4PUB_ApHsz2h4PQCB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=818 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210108
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

During performance monitor interrupt handling, the regs are setup using
perf_read_regs function. Here some of the pt_regs fields is overloaded.
Samples Instruction Event Register (SIER) is loaded into pt_regs,
overloading regs->dar. And regs->dsisr to store MMCRA (Monitor Mode
Control Register A) so that we only need to read these once on each
interrupt.

Update the isa207_get_mem_data_src function to use regs->dar instead of
reading from SPRN_SIER again. Also use regs->dsisr to read the mmcra
value

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/isa207-common.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 031a2b63c171..2b3547fdba4a 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -319,7 +319,13 @@ void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
 		return;
 	}
 
-	sier = mfspr(SPRN_SIER);
+	/*
+	 * Use regs-dar for SPRN_SIER which is saved
+	 * during perf_read_regs at the beginning
+	 * of the PMU interrupt handler to avoid multiple
+	 * reads of SPRN_SIER
+	 */
+	sier = regs->dar;
 	val = (sier & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
 	if (val != 1 && val != 2 && !(val == 7 && cpu_has_feature(CPU_FTR_ARCH_31))) {
 		dsrc->val = 0;
@@ -340,8 +346,12 @@ void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
 		 * to determine the exact instruction type. If the sampling
 		 * criteria is neither load or store, set the type as default
 		 * to NA.
+		 *
+		 * Use regs->dsisr for MMCRA which is saved during perf_read_regs
+		 * at the beginning of the PMU interrupt handler to avoid
+		 * multiple reads of SPRN_MMCRA
 		 */
-		mmcra = mfspr(SPRN_MMCRA);
+		mmcra = regs->dsisr;
 
 		op_type = (mmcra >> MMCRA_SAMP_ELIG_SHIFT) & MMCRA_SAMP_ELIG_MASK;
 		switch (op_type) {
-- 
2.39.3


