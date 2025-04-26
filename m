Return-Path: <linuxppc-dev+bounces-8002-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB113A9D773
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 05:56:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkwqW2QFhz2ydQ;
	Sat, 26 Apr 2025 13:56:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745639767;
	cv=none; b=h0jeThI81Y0AmorHBhTr4f4U0iXF+RW16LUFce/+FX9GLHwvWIi2NUyZtkpKZ22Qij+kT/UM/WrC/8MqPJbKKaZYueMtwk5uCbVeJXY1C28XkVT/eg/hydD38l3XxgVU21Xy2fVTtEhm+RwtxAeDxrPFbCOxvIUo0kT1n7ZBjYQtxjB5MBsYz2344lXPqEaRehf8a4/6BWx8EfyoWMU+jB4AL9bDdR1Pge3MzEy3V75UwAXoh9YQIIoQ8M8yK8oY123XiHF6C2yMvJT2q+dY6sL+pZY3n8XfrcW/VpqHRdmNKSE1JWDnFnWyBSAwBAQdRwjkv69W4f0gNqW0tZ6gSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745639767; c=relaxed/relaxed;
	bh=QkSuSaNDX7AslZ2ajptuSfhYWnKPKJKNaXqCaKsgig0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQRl2ciIqE7ZcdT49oBGnjz6+tZY6iJm2/WLC9ofLCY4bRhZwtNyteoMAM4XS5sfBX/qR3/Xy/c4TcgRYBkgdsiebDqBTN6Buo6AsgZIyNCuF8SBWqdtBUkSPjYHzImhJwb3zPUJfRNVonyrbNB/ft1X7dB1gk4l68Dj4PxGqfAooRWFZhq23nJiUpc3X32qvTX81b8960eONZqXj1Zs9DE2uHGDvEnWdv+S8g7QTvBobhmBJMoyCXkTeTdzFX4U67hLV/nrj9lmT6CHqf3fBWAk1FuOwMq0jn+yQwXKc6sUmLs3otrBhkIQish20Zj1uY5MnMy/jNxiDW1VTbu+YA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GtcXWaVE; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GtcXWaVE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkwqV4p05z2y06
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 13:56:06 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q2u2fq029575;
	Sat, 26 Apr 2025 03:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=QkSuSaNDX7AslZ2aj
	ptuSfhYWnKPKJKNaXqCaKsgig0=; b=GtcXWaVEMXv/lDavqSyYtTfN2vElM/Qd+
	wakty1aYXa4P7lkm48D9gVXiaKH1How2+9KURJdsjZoAfdiisrKsKtb/HjBqQ5Xt
	CI1J8Jnchuu17rIijheP6s2wBN6lmpZhYWcz1y+JjZcNrDbrTiwWb2xMwZdNHrHD
	Q7WXENA56Y2FpPWG5PNRd+MQOEjZ473YHpudpjW/3xrSocfu58NFrZ+UhovDzWw5
	dM4pR+BiCq0Kfhwlcs8xL2BIazFlK1WUnlnndK/hVhISHrLjKwGJ6o5PfRfCMGL5
	XzHE+Imr2JzBprlku5HM4CCIUHPeDY6NxSinwEZjlnbt12cFRTOqw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468q5002rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:54 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53Q3tmLa003075;
	Sat, 26 Apr 2025 03:55:53 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468q5002re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:53 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0aUkr005884;
	Sat, 26 Apr 2025 03:55:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfxrd1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:53 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53Q3tnJi56295710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 26 Apr 2025 03:55:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52C4420043;
	Sat, 26 Apr 2025 03:55:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAE3020040;
	Sat, 26 Apr 2025 03:55:47 +0000 (GMT)
Received: from li-e616facc-2daa-11b2-a85c-9c7f23c3cd5e.in.ibm.com (unknown [9.199.192.254])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 26 Apr 2025 03:55:47 +0000 (GMT)
From: Likhitha Korrapati <likhitha@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, Likhitha Korrapati <likhitha@linux.ibm.com>,
        Anjali K <anjalik@linux.ibm.com>
Subject: [PATCH 3/7] arch/powerpc/perf : Removing unused macros from ppc970-pmu.c
Date: Sat, 26 Apr 2025 09:25:31 +0530
Message-ID: <20250426035535.450778-4-likhitha@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250426035535.450778-1-likhitha@linux.ibm.com>
References: <20250426035535.450778-1-likhitha@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: Wq4I1M80UifDV2ysMwdcJkPVO5R7DUzr
X-Proofpoint-GUID: eF_aDpQJsL_pj4KVMuuKf4dhI2-tW6xg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAyNCBTYWx0ZWRfX5ZqvcI5N92V5 m5oOEHWdzyKysqHAta7Klbk2b+rp79h5TIS0Na36VF+EqkxfPt0Wv+TUhGB4kvjulgczMwLWwzl jemNe23jw/stOcGNS4RAnMMlZg7Klit4cLOzQpjqPCVMzb93UMsAtM5VCPG342OG+zzfUUKSmLt
 i9qd4LVHs2IwdXETXhRByqreRjLBwrEP+XHwnymLdSYSf/YbxrpIqvE9+fpOk85km8n4WcPFxTc iay9oe/aau5f/yqkjLEs5WQnZvsrcw590L4x06DtTWM1hI+GrHLs8rGuK2cg8SMGN0UyEnTrrjD 1xokVBSs4ix0FGf+p1nR+21mvcbHYsDuURfPfZUrjg9C7HndgvK/qzGInivu8yJJ/ATjLIemQDc
 djD1htkidptvB/aTDgttni+y8LRjZgLNVv5DH3kh20UQEJ619ibkM8HPfSJ5zhUmuyOoRFoi
X-Authority-Analysis: v=2.4 cv=BLWzrEQG c=1 sm=1 tr=0 ts=680c594a cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=XXE5ypWWyMV9p-g9OucA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 mlxlogscore=849 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260024
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The following macros were introduced in ppc970-pmu via
commit 16b067993dee ("powerpc/perf_counter: Add
support for PPC970 family")

PM_NONE, PM_LSU1U, MMCR0_PMC2SEL_SH, MMCR_PMCSEL_MSK
MMCR1_TTM0SEL_SH, MMCR1_TTMSEL_MSK, MMCR1_TD_CP_DBG1SEL_SH
MMCR1_TD_CP_DBG2SEL_SH, MMCR1_TD_CP_DBG3SEL_SH, MMCR1_PMC4SEL_SH
MMCR1_PMC5SEL_SH, MMCR1_PMC6SEL_SH, MMCR1_PMC7SEL_SH
MMCR1_PMC8SEL_SH

Removing the above macros as they are defined but never used.

Co-developed-by: Anjali K <anjalik@linux.ibm.com>
Signed-off-by: Anjali K <anjalik@linux.ibm.com>
Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
---
 arch/powerpc/perf/ppc970-pmu.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/powerpc/perf/ppc970-pmu.c b/arch/powerpc/perf/ppc970-pmu.c
index 762676fb839e..eef55b6f78b2 100644
--- a/arch/powerpc/perf/ppc970-pmu.c
+++ b/arch/powerpc/perf/ppc970-pmu.c
@@ -25,7 +25,6 @@
 #define PM_PMCSEL_MSK	0xf
 
 /* Values in PM_UNIT field */
-#define PM_NONE		0
 #define PM_FPU		1
 #define PM_VPU		2
 #define PM_ISU		3
@@ -33,7 +32,6 @@
 #define PM_IDU		5
 #define PM_STS		6
 #define PM_LSU0		7
-#define PM_LSU1U	8
 #define PM_LSU1L	9
 #define PM_LASTUNIT	9
 
@@ -41,20 +39,13 @@
  * Bits in MMCR0 for PPC970
  */
 #define MMCR0_PMC1SEL_SH	8
-#define MMCR0_PMC2SEL_SH	1
-#define MMCR_PMCSEL_MSK		0x1f
 
 /*
  * Bits in MMCR1 for PPC970
  */
-#define MMCR1_TTM0SEL_SH	62
 #define MMCR1_TTM1SEL_SH	59
 #define MMCR1_TTM3SEL_SH	53
-#define MMCR1_TTMSEL_MSK	3
 #define MMCR1_TD_CP_DBG0SEL_SH	50
-#define MMCR1_TD_CP_DBG1SEL_SH	48
-#define MMCR1_TD_CP_DBG2SEL_SH	46
-#define MMCR1_TD_CP_DBG3SEL_SH	44
 #define MMCR1_PMC1_ADDER_SEL_SH	39
 #define MMCR1_PMC2_ADDER_SEL_SH	38
 #define MMCR1_PMC6_ADDER_SEL_SH	37
@@ -64,11 +55,6 @@
 #define MMCR1_PMC3_ADDER_SEL_SH	33
 #define MMCR1_PMC4_ADDER_SEL_SH	32
 #define MMCR1_PMC3SEL_SH	27
-#define MMCR1_PMC4SEL_SH	22
-#define MMCR1_PMC5SEL_SH	17
-#define MMCR1_PMC6SEL_SH	12
-#define MMCR1_PMC7SEL_SH	7
-#define MMCR1_PMC8SEL_SH	2
 
 static short mmcr1_adder_bits[8] = {
 	MMCR1_PMC1_ADDER_SEL_SH,
-- 
2.43.5


