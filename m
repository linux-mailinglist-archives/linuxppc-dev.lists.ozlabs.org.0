Return-Path: <linuxppc-dev+bounces-5113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6110A0AF50
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 07:28:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWj554fLdz3c95;
	Mon, 13 Jan 2025 17:28:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736749721;
	cv=none; b=DdTlC65nzIPQBsQGoEKajVUKlbk+NmiphodRfXk4bmcLOV3RsQKg5RSuRkCSC/toAuVcxEqtfacQUkrihiS0tHz0NtL7h1Uqq7T1vhhrRYgdUb1RAUHsv0kZ5nzvarOSOtQ+pJadNtlDwBUbuyZrzAzlU+dj2VgNUHYd7FDDW2Ej/fM4j7fdrWrK13I4XoAEabSnfSJQIytc0dO3YQk4RXhSq0w79hn87LP1zpDgESbOtGghaPLqzWdm/AhfhJ4XJoZMkuIu/B+aGPST358/frfoQONZXGwqDbBety0x7Xki1U1oeFMcE6I4an76EyWtIdd7bjg6o5rcZTSWEvRmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736749721; c=relaxed/relaxed;
	bh=+FiKWtK2MiS4W9MgG6JkRm5itZ4ID78bm1MvzRhBzzA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KI+R24FxWZv9c+gzmB6s1iWJ+3oKP1sJLDwO0vCSLToMm1xITVMCGiE1kHFTcTpmXGLq1PyxOkDJTQy6jEBWX6Fj5J4exdKCUSFxrtsVnmbuOWasegYtPYWz6ggKrY+DrC3hJEiBSsZgWayprACJYKQuM18ocrZRt1keCQw69+sdhHJ+zqcYfdP+yjeqaUgsNP67OrDSJwy4T55DrJWc/blWXZUS79CG61plCIlU7qEjikz7DPA856AkKUBJJOS35PlSLsKenx17U29vzOPViYJrwLBdulSm5QuB6EiZGyrRfJvbec2vk9JBqKgtU45tcQqVU9gGF7uBEUy9sk1UEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W6x9VMda; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W6x9VMda;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWj54426zz3c3x
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 17:28:40 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CJrNJk007519
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 06:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=+FiKWtK2MiS4W9MgG
	6JkRm5itZ4ID78bm1MvzRhBzzA=; b=W6x9VMdaDSGFhXVU2UrrLdbVW1iWGJmLM
	qS5+MTM4s9X+lS/1LDMp0b3ZW7zsXdGLlj4ivgG3x9i37d7uiaTP5ETWnLfOf0xo
	ZkWeSjFMUeQG7Mfh7C2j+TJmCCtyC/FflQ2MO3r9cCg0VBL6PvxwsHC/86siZvFs
	wHJ1s9Y0mRxrS1Y5NIwP5GKUkkyJOJViG/JiW3l3o/dIIJDUVW7BgtooGouXmcFh
	630gu1fUfwqp8BYCZRFIUpjruVMszlN6StrQY3qil8YMyBQEbQMronno7wK2hUR2
	z+cQc03/bj4L+pIJuoIswr9njuqwKwQTSjO+QyCYGFO2Zloh0qPzQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4449x2b0fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 06:28:35 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5mhpA016499
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 06:28:35 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4445p1ch7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 06:28:35 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50D6SVef63242540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 06:28:31 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A110920043;
	Mon, 13 Jan 2025 06:28:31 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FA752004B;
	Mon, 13 Jan 2025 06:28:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.243.204])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 06:28:27 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, hbathini@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com
Subject: [PATCH 2/2] arch/powerpc/perf: Update get_mem_data_src function to use saved values of sier and mmcra regs
Date: Mon, 13 Jan 2025 11:58:18 +0530
Message-Id: <20250113062818.33187-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20250113062818.33187-1-atrajeev@linux.vnet.ibm.com>
References: <20250113062818.33187-1-atrajeev@linux.vnet.ibm.com>
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
X-Proofpoint-GUID: Nc3MJqXazH48wHMguy8OckbCnfj4pNEa
X-Proofpoint-ORIG-GUID: Nc3MJqXazH48wHMguy8OckbCnfj4pNEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=825 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130050
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

Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
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
2.43.5


