Return-Path: <linuxppc-dev+bounces-8000-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DF5A9D771
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 05:56:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkwqS27Yyz2xqG;
	Sat, 26 Apr 2025 13:56:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745639764;
	cv=none; b=hs5nRp3BocOh8uvDRXbCPsFDf2/pOm1MJCnTdlTDZ4P3kERhGpZfloeeFmOLNgbMuiWErdoHahkqvxYJ3kVi1BZlB9mMH3VdeM5AIvbGpRoQ9Q87vfO+EOUVJgVus4+HZ0SUNWnnehJ60h85Y3zaC565uRg4L8l08+Qanuou2wmVjQFHkhRvuGJd93gHwHj22KLNibg4tkPQawQSW+RmYrwn7WVcRRI2bTO+unwL/HE8EsMGHBkxNLvIvWbs5d7jy3jC5OHgqfGhcuAZNvsvzE2GODNfTjz4MXKySc2dUiCf9JBNkcc21epwujhQdTE7OE4GKkTMsE1tR4Y9/iQOsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745639764; c=relaxed/relaxed;
	bh=r5Sy3C9t82E0IttcwrplvNTxbY6X9qZoO3FAchQu9j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LI8yGm9iu+bJrYPoTDAdATZc+wyAusYec6033j1Y5WFKbvV3sukLvC5usio2/3kpbvfJnq6oc3XAd83LPOtgd9/OAzAgPqkF0t2th9Tw8QCSv1IFHjtMBt5fa7s0M4ijGLuhPTwgOlwfXF1Q5wafb5ccoaQTXZBhbUN+ipwWBEabNAXZ/uT0YfBmFYczXQkJkykBTZ3UbiyATSrCGOscqlaRZ/IkVSA8B8o7S+YjiH0QUOFY4XsDHZpq5pDid2X8nYuNmhNygxOYck+DwTPJiJDcOjyVuGeGSmgrupK7E9QGMEMXMXuS36RUmG23yxrYl/gV9JuP/zNl5Svn/ubiBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q6ZWkyS2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q6ZWkyS2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkwqR0w2vz2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 13:56:02 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0PwUm014377;
	Sat, 26 Apr 2025 03:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=r5Sy3C9t82E0Ittcw
	rplvNTxbY6X9qZoO3FAchQu9j4=; b=Q6ZWkyS2gFRBI0y5jht95X379JjbI/8oI
	bB8EJIDusxonHzJXgdcf5SU8t8mSP5ubLzLPRniUJKrBAI0s6e+uj6RteLj/49+L
	Uaq/3yMYoIA6Fgp+cCLET3RhJ8FivN2emV8EoNiJJV3MMgIOO5PtbL4Xn6aKMG5v
	rMbeJicW02afSon+zeyxqMOoJ8NNPs4G51JJnMEKKIscmHBpK5mhrk6DOpUnFR6R
	gZJpTYe304d9cm+ykSzAmDwKGUdVKz7iB+yNh6x+lrepMT+V8G1P4UD0nsD7NO1F
	33vOGZCrXN2ArtvGCAvaxyW6xpWqgJLkKzSllJkplnERqHPtqlKVg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468mwrrdrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:51 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53Q3to7L015724;
	Sat, 26 Apr 2025 03:55:51 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468mwrrdra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:50 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0aUkq005884;
	Sat, 26 Apr 2025 03:55:50 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfxrd1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:50 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53Q3tk4r30737102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 26 Apr 2025 03:55:46 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55B7520043;
	Sat, 26 Apr 2025 03:55:46 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCB7F20040;
	Sat, 26 Apr 2025 03:55:44 +0000 (GMT)
Received: from li-e616facc-2daa-11b2-a85c-9c7f23c3cd5e.in.ibm.com (unknown [9.199.192.254])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 26 Apr 2025 03:55:44 +0000 (GMT)
From: Likhitha Korrapati <likhitha@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, Likhitha Korrapati <likhitha@linux.ibm.com>,
        Anjali K <anjalik@linux.ibm.com>
Subject: [PATCH 2/7] arch/powerpc/perf : Removing unused macros from power5-pmu.c
Date: Sat, 26 Apr 2025 09:25:30 +0530
Message-ID: <20250426035535.450778-3-likhitha@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAyNCBTYWx0ZWRfX5MIB/uSDs4N4 Pg0Rgd6DoVT8AjX4kQDKaPqriBWJvMJ2kYiKnanpBHx5Wrf5GZxVV8L08mDQWWgz+q7932yNi+C OCvf8MXgCnF03s8OA643n5ComsArNncQLBWU4STCCaVuOyjRO1wJGTlfmOYvD5INtBo11TKDmSc
 uVqzvcOjOc1hls5UAkuFT/etP1Ox8Qa6OCcg0055YYpdddLvmYwdN/MBrIUe6NkEOHEKY6aOam3 fh0QIzuuaJpqpaFNYrHOasJ1rSaJ/lH9/EMlTuIim7r7lgJpmR2SWxc9qIq5mC5ggR4Nuetg8ZL WedhtgDuUifJKsrYJ8HO6Va5Kcc/grfLFrD8Sm52a7M0lPTmewckJacH3vjnRm11FRtbtEjDSjJ
 lmHPxCSAnMuZy9Gqye7CiBVF7eQ/D5bokEQ/4NV3j8mqUnnOEvgOhTTF4VoZuq+PyfZIn2IM
X-Authority-Analysis: v=2.4 cv=IMsCChvG c=1 sm=1 tr=0 ts=680c5947 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=AOPLFFXR8mby1ZT_o3gA:9
X-Proofpoint-ORIG-GUID: WfFTryPTSfYMjjgqxJi1RDRLw7AaMCHT
X-Proofpoint-GUID: HqywMmIKT83anzwesKFELfISCLq2aMU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=641 mlxscore=0 clxscore=1011 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260024
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The following macros were introduced in power5-pmu via
commit 742bd95ba96e ("perfcounters/powerpc: Add
support for POWER5 processors")

MMCR1_TTM2SEL_SH, MMCR1_TTMSEL_MSK, MMCR1_TD_CP_DBG1SEL_SH
MMCR1_TD_CP_DBG2SEL_SH, MMCR1_TD_CP_DBG3SEL_SH, MMCR1_GRS_L2SEL_MSK
MMCR1_GRS_L3SEL_MSK, MMCR1_GRS_MCSEL_MSK, MMCR1_GRS_FABSEL_MSK
MMCR1_PMC2_ADDER_SEL_SH, MMCR1_PMC3_ADDER_SEL_SH, MMCR1_PMC4_ADDER_SEL_SH
MMCR1_PMC2SEL_SH, MMCR1_PMC3SEL_SH, MMCR1_PMC4SEL_SH, MMCR1_PMCSEL_MSK

Removing the above macros as they are defined but never used.

Co-developed-by: Anjali K <anjalik@linux.ibm.com>
Signed-off-by: Anjali K <anjalik@linux.ibm.com>
Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
---
 arch/powerpc/perf/power5-pmu.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/powerpc/perf/power5-pmu.c b/arch/powerpc/perf/power5-pmu.c
index c6aefd0a1cc8..4fe4f16ae65f 100644
--- a/arch/powerpc/perf/power5-pmu.c
+++ b/arch/powerpc/perf/power5-pmu.c
@@ -44,31 +44,15 @@
  */
 #define MMCR1_TTM0SEL_SH	62
 #define MMCR1_TTM1SEL_SH	60
-#define MMCR1_TTM2SEL_SH	58
 #define MMCR1_TTM3SEL_SH	56
-#define MMCR1_TTMSEL_MSK	3
 #define MMCR1_TD_CP_DBG0SEL_SH	54
-#define MMCR1_TD_CP_DBG1SEL_SH	52
-#define MMCR1_TD_CP_DBG2SEL_SH	50
-#define MMCR1_TD_CP_DBG3SEL_SH	48
 #define MMCR1_GRS_L2SEL_SH	46
-#define MMCR1_GRS_L2SEL_MSK	3
 #define MMCR1_GRS_L3SEL_SH	44
-#define MMCR1_GRS_L3SEL_MSK	3
 #define MMCR1_GRS_MCSEL_SH	41
-#define MMCR1_GRS_MCSEL_MSK	7
 #define MMCR1_GRS_FABSEL_SH	39
-#define MMCR1_GRS_FABSEL_MSK	3
 #define MMCR1_PMC1_ADDER_SEL_SH	35
-#define MMCR1_PMC2_ADDER_SEL_SH	34
-#define MMCR1_PMC3_ADDER_SEL_SH	33
-#define MMCR1_PMC4_ADDER_SEL_SH	32
 #define MMCR1_PMC1SEL_SH	25
-#define MMCR1_PMC2SEL_SH	17
-#define MMCR1_PMC3SEL_SH	9
-#define MMCR1_PMC4SEL_SH	1
 #define MMCR1_PMCSEL_SH(n)	(MMCR1_PMC1SEL_SH - (n) * 8)
-#define MMCR1_PMCSEL_MSK	0x7f
 
 /*
  * Layout of constraint bits:
-- 
2.43.5


