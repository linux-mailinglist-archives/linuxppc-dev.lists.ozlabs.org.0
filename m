Return-Path: <linuxppc-dev+bounces-11873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BD1B48790
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 10:51:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cL10K0vGdz2xgX;
	Mon,  8 Sep 2025 18:51:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757321505;
	cv=none; b=WDHaOFc0VW7VyhdHpgxwodikn1m+GDCaQkY6XH8x5JAX+gCJfoWk37kzl07RpS8SQEaVVRBdeTAhiy8Si2thIyeKMm8807GJy7NtceTTIbpif2wCatkVR3PdLvt7R6UDcBZC6orMQll2IYQQLUR5VVnxzIEd5jEHMJddUXogpmJyBUG0VumKkS84E8FQguYUsdgx+aPrgc7lCXMh3w/AAVwg0lvQmrp2wfpWiDzny7ZhaT2QlxH6yjjsCa6ZMtiSrSdAbSrovRDf5NCjIbwhBi8KOVTQHf7KSFyPF4KfZSQaZHnem2Uv7OWlk9htroXs3Xu8QH9EKpRkBHGB6I+Ejw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757321505; c=relaxed/relaxed;
	bh=SPaCzwT5euVLX4cjSm1le8FJ8d4tv3xZCmtar6nGD9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HHkSHfqr8URF0UziIflTU4j9PA+TU9Gh4+nyvRVnsuljU5O7LEK3Aw75Q/Y/NYGBbraLIOaquFQ30e+/egLTqEjc8DUIvQGGUxWjYuAn31aWP7tk4mh/Cfjv6O2BeyOyX5rLMF9oFF9Ti5egBelEAV5IS4ouYPNkjh+8Bx4OtkMV9QEC8GtKfbimQNooA+B8IF2QJlNVWWfAl4XAroRIpdh6oOAJ1HbTt61WzlWbCPtw8GlN+uOozUCayE/EVsWdJaHVMHnsoyQZWFLX4/PgHODMB3nSIuQcM8CXTAQZ8vZdfOXSvnbZc8kPLkRq2QdOIn0K5GrSCU0h6YqxBZhzyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M0iZ8/RW; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aboorvad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M0iZ8/RW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aboorvad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cL10J1HNPz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 18:51:43 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5886TPKA022908;
	Mon, 8 Sep 2025 08:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=SPaCzwT5euVLX4cjSm1le8FJ8d4tv3xZCmtar6nGD
	9I=; b=M0iZ8/RWVqekHf8NGa4h1ifYuqbnnWDSfCRAAYNhfbhFOO5YN02SNaSp0
	aJsLYQiDyO0CUDLNEQHEZjWmZzCcDSSOYzkPGWRgWHTO/kWhP3mw8n3vP48YPA1g
	dTh1MhwIzsOBqMtmg6x52zSEpuQBJWZP6GsRZ8YxHCpghCEKevdKM0hDdIpZrnkU
	qzfR2k2E7vzrDggwwR7pBgf8Pc3mAx11iS+B8moo9/Vq8kzZig/3tVEtrq5divm0
	0obd7BA9MFmAMAAMy2uy+66/vlKLVag64VjBe/Sti4JgOzgdeAyugexpToXS+L4S
	oufQkZF0EanLodYhnU0a7x/OcrK6A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cff08gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 08:51:31 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5888nGYG017220;
	Mon, 8 Sep 2025 08:51:31 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cff08g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 08:51:30 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5886hc1c001156;
	Mon, 8 Sep 2025 08:51:30 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4912034wj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 08:51:29 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5888pQ8d7537022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Sep 2025 08:51:26 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A68D2004E;
	Mon,  8 Sep 2025 08:51:26 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 557332004B;
	Mon,  8 Sep 2025 08:51:24 +0000 (GMT)
Received: from aboo.in.ibm.com (unknown [9.109.247.181])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Sep 2025 08:51:24 +0000 (GMT)
From: Aboorva Devarajan <aboorvad@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: mahesh@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc/powernv: Enable cpuidle state detection for POWER11
Date: Mon,  8 Sep 2025 14:21:23 +0530
Message-ID: <20250908085123.216780-1-aboorvad@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _nXOU51C7D55QJBEqtCChAahAfspMhHb
X-Proofpoint-GUID: Q3yQJ3tYt9-jXTTWceHQM7L6tWaRn9xf
X-Authority-Analysis: v=2.4 cv=EYDIQOmC c=1 sm=1 tr=0 ts=68be9913 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=88GbL-a48S0T7VR8CBkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMCBTYWx0ZWRfX2C+frJyViY82
 KOdntBRwLp5erZYWwLymNPpa2U/ahChCIzB3KRAIzkf/0TKIDpdNvO4PSFP9LYK+mPmpqmFMDX5
 Qc6MGecwuIuFaC4ykhAAatz+BwHbX0SfCdbm7gv/GGE0Ls0VDyXyO18gU7c7XGrHcrK5llj6yKY
 K+3QCvXYDYZsjccLKo+xt689ai2JB6YixCWM0txwsEhR/0v9bNNkFwYphr/6/IAeRGdoJyv89T5
 Ex6qdHrQ//xtWEn+EfX5Cq5VTmZ4BCPDq9fNGLJBOvEUfa8QGDYw+OGWgyDl4yUkcY1wHrJ0xHL
 MDwUKbOYefDkBEUr1CyCk2paG/vN8CfOdqjAoN5DwiU5+XxDl0+5+j5JOfNm5BAmnaS3bMRwdig
 BG5+PX9g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Extend cpuidle state detection to POWER11 by updating the PVR check.
This ensures POWER11 correctly recognizes supported stop states,
similar to POWER9 and POWER10.

Without Patch: (Power11 - PowerNV systems)

CPUidle driver: powernv_idle
CPUidle governor: menu
analyzing CPU 927:

Number of idle states: 1
Available idle states: snooze
snooze:
Flags/Description: snooze
Latency: 0
Usage: 251631
Duration: 207497715900

--
With Patch: (Power11 - PowerNV systems)

CPUidle driver: powernv_idle
CPUidle governor: menu
analyzing CPU 959:

Number of idle states: 4
Available idle states: snooze stop0_lite stop0 stop3
snooze:
Flags/Description: snooze
Latency: 0
Usage: 2
Duration: 33
stop0_lite:
Flags/Description: stop0_lite
Latency: 1
Usage: 1
Duration: 52
stop0:
Flags/Description: stop0
Latency: 10
Usage: 13
Duration: 1920
stop3:
Flags/Description: stop3
Latency: 45
Usage: 381
Duration: 21638478

Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>

---

v1: https://lore.kernel.org/all/20250421070718.162783-1-aboorvad@linux.ibm.com/

v1 -> v2: Fixed overly permissive PVR version check as pointed out by
Christophe.

---
 arch/powerpc/platforms/powernv/idle.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index d98b933e4984..e4f4e907f6e3 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -1171,8 +1171,9 @@ static void __init pnv_arch300_idle_init(void)
 	u64 max_residency_ns = 0;
 	int i;
 
-	/* stop is not really architected, we only have p9,p10 drivers */
-	if (!pvr_version_is(PVR_POWER10) && !pvr_version_is(PVR_POWER9))
+	/* stop is not really architected, we only have p9,p10 and p11 drivers */
+	if (!pvr_version_is(PVR_POWER9) && !pvr_version_is(PVR_POWER10) &&
+		!pvr_version_is(PVR_POWER11))
 		return;
 
 	/*
@@ -1189,8 +1190,8 @@ static void __init pnv_arch300_idle_init(void)
 		struct pnv_idle_states_t *state = &pnv_idle_states[i];
 		u64 psscr_rl = state->psscr_val & PSSCR_RL_MASK;
 
-		/* No deep loss driver implemented for POWER10 yet */
-		if (pvr_version_is(PVR_POWER10) &&
+		/* No deep loss driver implemented for POWER10 and POWER11 yet */
+		if ((pvr_version_is(PVR_POWER10) || pvr_version_is(PVR_POWER11)) &&
 				state->flags & (OPAL_PM_TIMEBASE_STOP|OPAL_PM_LOSE_FULL_CONTEXT))
 			continue;
 
-- 
2.47.1


