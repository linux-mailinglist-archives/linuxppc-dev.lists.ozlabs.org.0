Return-Path: <linuxppc-dev+bounces-7999-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F265A9D770
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 05:56:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkwqR5d7Nz2yF0;
	Sat, 26 Apr 2025 13:56:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745639763;
	cv=none; b=H7IEyRzvyQH3JOcSuj33hjiDR4vXuFcb8Wna85q9TXbTI3hqA7hTzWmA2m79D4yBXTumP/PSlSSGpudTcLwAwU+XFVmwKrekNyqRBXtPqqEfhk19e/0O+dxZOBe9t2el8WHWr0Pp+sJbsWtLt9QJf44O8rDpgxCpVBIQ3h7GLmzaI+P0kPgD5fcJQOCjaBVGr+8K+BdBVkBOXd2CejCCjuqsI/X1IKfTFuGRWGYkofrX+aW8sqwtMia7EYJjOt9yc4S5d+iLNqWGqMln8BWVAdBIqzKFDDAohGwU7bYIAWMSqiJQLW8cJaKc3m8TE8Pk9o0JZEB1KZELOqkOaYf2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745639763; c=relaxed/relaxed;
	bh=vlkRp7hAYqS572bGw4BVPpRyLWqjDGUNoo+YOyZs4xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6hXYOBQgoEeBxLpmy+fUIf0z9/1FxthqV/zJbU2PPADRbE4krMr3+J4wlgRlfqkwzSJEZXf4uoVOhn5mI2y+YHCg9EjpX1GKXayZSkT8kPI5Ss/GjgdwP8Pdys0V3Rb4OOBcGzli64H0yA+P5XL3NHhSVwKvPbmncNzAZWPz78xMUcLuwAufduCcdIagAtVaIEHBH51GLdliqHnWJiD1JNPMf2qy88EO3d9u0JVb1Hizz2spHEjIjMjNMz/wMVMrZxyQ4ExQccTKjpLWHPWS9CyDH4N8b6xW+gbafQJvStV+oOV9fYatFJ5T8YyEzWGYIBKLPGPp+2LCFkgOIrTng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j2MOnIqT; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j2MOnIqT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkwqP0hqfz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 13:56:00 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q2xEnP003381;
	Sat, 26 Apr 2025 03:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vlkRp7hAYqS572bGw
	4BVPpRyLWqjDGUNoo+YOyZs4xo=; b=j2MOnIqTiQbU2BoOSrdOOmxNRHUbA9Ru2
	E1uh2lGCT0joioUIaEFAuias6gDPPgmyFDbjNq9odZKfKb9DrN36tp+YkA0MWDI2
	JUZnJSgQbrajSSRnSLh8ZF4B5pR2RZ/vYVwtpFoobyBzJ+omyNUyBTAV4hr1iOYM
	ZfM0iMq2kFxLm+zcRC+dEGkf77NvUvPJb2WWjlEu7k+p5W/rY4NFPPi5LTelW8O6
	N5wE8sCobrNXLZBXzeQ1JpQOk3FxVq8UzeWBYRSsCQjOTsNf3GPODuwZ4lAi2ZNF
	UGdnfXXAck5OyCaajrtpXPGGsHMrxbGZgnJnXPn+KLwm/5VsvM6Zw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468q5002r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:48 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53Q3tmLY003075;
	Sat, 26 Apr 2025 03:55:48 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468q5002r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:48 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0E5RB008552;
	Sat, 26 Apr 2025 03:55:47 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jfy0dx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:47 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53Q3thMj56099126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 26 Apr 2025 03:55:43 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E7BE20043;
	Sat, 26 Apr 2025 03:55:43 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10CBB20040;
	Sat, 26 Apr 2025 03:55:42 +0000 (GMT)
Received: from li-e616facc-2daa-11b2-a85c-9c7f23c3cd5e.in.ibm.com (unknown [9.199.192.254])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 26 Apr 2025 03:55:41 +0000 (GMT)
From: Likhitha Korrapati <likhitha@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, Likhitha Korrapati <likhitha@linux.ibm.com>,
        Anjali K <anjalik@linux.ibm.com>
Subject: [PATCH 1/7] arch/powerpc/perf : Removing unused macros from power5+-pmu.c
Date: Sat, 26 Apr 2025 09:25:29 +0530
Message-ID: <20250426035535.450778-2-likhitha@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: Vz6BmRc5hhhSZ4faY5BRw4JrSniSFtIa
X-Proofpoint-GUID: Ck3p2bceHcbsZPWb_v1zGKg70jLDRUSI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAyNCBTYWx0ZWRfX5Y9O2nYschBm nm84rA0XJrIPNzc44x+r081CZKL7jpaok48IvMvwok/NwmOIFHoNoiHNHz7z4K+JBMdTrnNjdmT dmE+wy28OIrrhCth5VzVudf6EBWNnOIKHe+NozjIb1yEVAwM32WF8ZGKNEn7kf20/l4KPTYlqmr
 SoxSx6XHW90YC9l8pcUhL9YVs2VVYIOIjGgTUs2+oifKvf3mZANrQtJmYFWzgTaZioR5ylJXEgL 4y65GL/m0wdDRv8nTjwsbH8YIT2J+EeRJjDvevKjp+8W94xwiiV4ze2nfGsCnxXJWzHKWiJet85 ehGg5pV85rJNWdeVqArMVq8HdaIdUE6A+n+8u86JN4PuMEuOuG9d4853ZH4FM2twFlIuigDV69p
 EgfpXvrNEWHMWF9AswCtfZaGt4LZ1M2kH1qSB2rH3vqRBHxCS5ZqwI+rmy8ojw18NkXsKeG4
X-Authority-Analysis: v=2.4 cv=BLWzrEQG c=1 sm=1 tr=0 ts=680c5944 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=AOPLFFXR8mby1ZT_o3gA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 mlxlogscore=640 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260024
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The following macros were introduced in power5+-pmu via
commit aabbaa6036fd ("perfcounters/powerpc: add support
for POWER5+ processors")

MMCR1_TTM2SEL_SH, MMCR1_TTMSEL_MSK, MMCR1_TD_CP_DBG1SEL_SH,
MMCR1_TD_CP_DBG2SEL_SH, MMCR1_TD_CP_DBG3SEL_SH, MMCR1_GRS_L2SEL_MSK,
MMCR1_GRS_L3SEL_MSK, MMCR1_GRS_MCSEL_MSK, MMCR1_GRS_FABSEL_MSK
MMCR1_PMC2_ADDER_SEL_SH, MMCR1_PMC3_ADDER_SEL_SH, MMCR1_PMC4_ADDER_SEL_SH
MMCR1_PMC2SEL_SH, MMCR1_PMC3SEL_SH, MMCR1_PMC4SEL_SH, MMCR1_PMCSEL_MSK

Removing the above macros as they are defined but never used.

Co-developed-by: Anjali K <anjalik@linux.ibm.com>
Signed-off-by: Anjali K <anjalik@linux.ibm.com>
Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
---
 arch/powerpc/perf/power5+-pmu.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/powerpc/perf/power5+-pmu.c b/arch/powerpc/perf/power5+-pmu.c
index b4708ab73145..8ece241f8e48 100644
--- a/arch/powerpc/perf/power5+-pmu.c
+++ b/arch/powerpc/perf/power5+-pmu.c
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


