Return-Path: <linuxppc-dev+bounces-5377-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA93A15D2F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2025 14:21:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZy0l0rsrz2yYq;
	Sun, 19 Jan 2025 00:21:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737206471;
	cv=none; b=XyLngPysclNFla1G80HXwW4sCGLiJnwVzWrmrSQlWzgjMcnQCNVD+waUsxwU4+j2LWtfVm5ed0OH0eCPHg9r4YK7UfVekLl9acYxlrXuO5p5uujm4HpCWS6J4sOBMr8bTN3TV3fkKwt9hkldaJRcgDMwM8mgCwvx+lg/zrr9zkW2VDkd2QpkqImrM+BPwq+W0wLz9GzIdkLv8pV+Pllyv0H3rlth10siFuoFYRYQMjeyfWCJXG9tHNGJxJ9GP5fvZ1lZ+VGYDcgaIYEuiMD6rRIti6XNhtoTxoq5qeoEW1xxxkfqBXNjsAN2/6IhqR2aeKeLfk79PF+NLk40Wq0xSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737206471; c=relaxed/relaxed;
	bh=/drKaW5KH3n8+cPpyv+re95WdZOTIW6bwt1Fx1sqS+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nPmkNbuOvvOjaAXLQPVdrC/dWZBmHqpVevbCh8eilJ2AFHVpDMmXbWz+x9tMQ9UhhY0kC96wJgzpIsN0bbjc8zz5hhPRvq+tk9FoDCIgOQtDVGP0tB+ls9wV5sTOcRJRj3L03wvqFrlt+n53Yw7eHSmZ0R0O9kbNZj7rOa18sOtu/wX/8nOtbOKsaLCn+yYDHWK1yXNl82KMog6t5tO9eublllC8X5RdWzi78naBYqcx0aWvExe7APFGxxWdE9WOtfLkZJAGdgA5IYAUEMrhuXrtfHOlvD6iD6c6J/zCKWghoQMyNNxgl6UA/ivO89Aj4tX5jrs6cwqziIA7ZG8R+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ove599Dl; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ove599Dl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZy0g291Vz2yjJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jan 2025 00:21:07 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50IBF5So007612
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 13:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=/drKaW5KH3n8+cPpy
	v+re95WdZOTIW6bwt1Fx1sqS+w=; b=ove599Dl6eHLoScYv5Gtvy9wJbPJFSiUN
	OS+1p27IWQBLvCcFSFwTUoRqluBxxZDgO9BKE6eKNrrAr/hXj5wSFTccbt9V2Nne
	HkLWDsNZOy+sN0rgOp7+4RzehWE3eN/1PcIr3EUsGn4t00ftR3mQNxUyx8msGLbZ
	PDjQkMYGIzIffkADHs4oBy7fOlNZxYxjQCJhT+AG0k8MnLyiUw6oej6hqLXr4ELp
	jnlVir/ruSsiQ7/NBDK15EpyWjMJIreah+BJ58fRtr4gpYC0kVUgiHpI2WerwLrL
	GJimAFJ1cZonqAP3U7o+S7HXBxLN6OdZGLxtLV5xpGpEtBVShKFfQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44880n8tdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 13:21:03 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50IA0D3M032421
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 13:21:03 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4485pqhf8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 13:21:03 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50IDKxCF52298126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 18 Jan 2025 13:21:00 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4F0520040;
	Sat, 18 Jan 2025 13:20:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6218C20043;
	Sat, 18 Jan 2025 13:20:56 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.250.155])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 18 Jan 2025 13:20:55 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, hbathini@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com
Subject: [PATCH V2 2/2] arch/powerpc/perf: Update get_mem_data_src function to use saved values of sier and mmcra regs
Date: Sat, 18 Jan 2025 18:50:46 +0530
Message-Id: <20250118132046.93872-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20250118132046.93872-1-atrajeev@linux.vnet.ibm.com>
References: <20250118132046.93872-1-atrajeev@linux.vnet.ibm.com>
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
X-Proofpoint-ORIG-GUID: jbF0lZWFL-A4DOed5xHeC4Lj-uCoqbrl
X-Proofpoint-GUID: jbF0lZWFL-A4DOed5xHeC4Lj-uCoqbrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_04,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxscore=0
 spamscore=0 mlxlogscore=822 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501180104
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


