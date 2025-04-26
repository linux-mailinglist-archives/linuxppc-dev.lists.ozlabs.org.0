Return-Path: <linuxppc-dev+bounces-8004-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A197A9D775
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 05:56:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zkwqf0wqpz3bcj;
	Sat, 26 Apr 2025 13:56:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745639774;
	cv=none; b=lxo3pOv9tkdM/bHN1ZSwLzElqoaWqn3IcEF5SduKnJsTJj15i48vmWougrd/TwWyDdP4tT1CENdbw7k+N7+qejTODix1srXMX+7WA4Ms3CH6DMboGXedtb6inRODf9hRrtiobhwhq5MKUeuWtVJt/mmMgDAY6Zdq3z3e4K5YtGG371Hwttrc5IsLVdHtNXZJZLz1oO6B7VryCviQN6Ndpq1PMELONcKf3NkACkdcsfSakxntkk38tbxkMkH4T41jd1ZKdZSmCptuSI+DlnosE77Nk68uUm17d/aA6alB5pz/f6A8DHgmtqeTHAj8phSYA1FiZN47HDjbQ3cIDiVqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745639774; c=relaxed/relaxed;
	bh=FRLyfhaoAwKOIWXroeniw8xu7HfmStRln9zdOP1iRXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vx4h89fgTVQNYu39TCO01cCj9oPXxxdpXg+p5z5eVzFM1afDeCfW/bOrAeOTBoOaVJvB9EFD28uZiiw7x958wQmH2HOIFxonGrWimNbyK0f4uy7w/olyoXkfw3lWLYH+QDhfXMu3txY+d+0PetjFaQTJUnXd9c80MMypzk5fpW24zZSglSQ/nccrcocSXabO3vrTGGc6zjAfRGTYxck52tBJyp2OpTIGvg2m4aGTSIGn4A87hFS4ZpEl17sVutyXMdXDP7HwH2v3pWnogkoscETeTfFmugrklyRnbkJBGp9mKpxOXmnSubsjPB6IWnEeFPimzRoUMudBN3H1oB4gCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tgC6DZ/f; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tgC6DZ/f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zkwqd383Lz2y06
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 13:56:13 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q1WZ2g003375;
	Sat, 26 Apr 2025 03:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=FRLyfhaoAwKOIWXro
	eniw8xu7HfmStRln9zdOP1iRXQ=; b=tgC6DZ/ft7npMdNkeSOcbQGhHt53FpT8C
	Pp5lA/iSzphONG9edOCMXX7M1A91EWicJC3FSvaK8tjZTfvc9Ijd1DUcliyv1T/0
	9tBDKqi53Dcc8b+3bR4TU9jdBobKDfzJTfYk+V6LyKjLFnHRgMga3nILQEDUsBdy
	NXdkTGCf09dTDa9/ThMqeQX9z3rJRORcgQL/inSOhBZ0SyfUO9doOT4wINV1Ehz4
	tSUvjUbJCwhNJmdQ28Er5eWxW1Muw+xDTy/i3DTi7q7wbM6FPbEfGOQLLpSWJhkq
	y1jwsHloG6u/l0X360dwazmJefE8xcbDFBEhTNB32pjsI5xw32y2A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468nwmg9mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:56:02 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53Q3u2X9009329;
	Sat, 26 Apr 2025 03:56:02 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468nwmg9mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:56:02 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0Y2WX005829;
	Sat, 26 Apr 2025 03:56:01 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfxrd2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:56:01 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53Q3tvxk56951054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 26 Apr 2025 03:55:57 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EB1220040;
	Sat, 26 Apr 2025 03:55:57 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD4D220043;
	Sat, 26 Apr 2025 03:55:55 +0000 (GMT)
Received: from li-e616facc-2daa-11b2-a85c-9c7f23c3cd5e.in.ibm.com (unknown [9.199.192.254])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 26 Apr 2025 03:55:55 +0000 (GMT)
From: Likhitha Korrapati <likhitha@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, Likhitha Korrapati <likhitha@linux.ibm.com>,
        Anjali K <anjalik@linux.ibm.com>
Subject: [PATCH 6/7] arch/powerpc/perf : Removing unused macros from power8-pmu.c
Date: Sat, 26 Apr 2025 09:25:34 +0530
Message-ID: <20250426035535.450778-7-likhitha@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAyNCBTYWx0ZWRfX3TWdaMxwieNj haq8oigDwGmzf8m7hBXoiIAyRIi9yjcQEXpCt7qDgoixC5vXouAyz19iuFSn1k2ikABvkgOHFCo 5xqHciOEfkMYnUxWmUuBFLKwse2KocLyDlCO44BJoFOg1ZH6SL0Pb2FoGzewlev2jC+XkeKcOX0
 4ZOygAPyUPai6Ww+6A4c1BSy9io3W/a9dMtesZ0qohhAnfpK6VVR1SLlb+wl+8RtqCMahY4RhAa nwXwFRZEKhXR5UpuIG+A0log1Vdl99OSg+KFDQtm8DbUmRBbmzYRbrbR4n2DuP1GxZrVcwaneTL zOPo8uVmpeD7Pjfm6hAiAZqjksvAoKHjApz36OQ/5s2iFSIp3JMYyS7wH8M49Jcs9sauqpPd8aE
 C6J15lHsZuAWQlRGrXkC/TA+lZwX01TdLBnfLzzX0Q2RoyOyzonFNIZBf53RN68V0Ui3f1sG
X-Authority-Analysis: v=2.4 cv=Yfq95xRf c=1 sm=1 tr=0 ts=680c5952 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=5AfshRIO-9GBVtf8LogA:9
X-Proofpoint-ORIG-GUID: pPPT9hMioL69xCFjUjnkn3Oj3ouTGdGi
X-Proofpoint-GUID: Ug_yIgj68lQs6o-gdec8we-3_u17Oa33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=815 priorityscore=1501
 clxscore=1015 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260024
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The following macros were introduced in power8-pmu via
commit b1113557fb5f ("powerpc/perf: Define BHRB generic functions, data
and flags for POWER8")

POWER8_MMCRA_IFM2, POWER8_MMCRA_IFM3

Removing the above macros as they are defined but never used.

Co-developed-by: Anjali K <anjalik@linux.ibm.com>
Signed-off-by: Anjali K <anjalik@linux.ibm.com>
Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
---
 arch/powerpc/perf/power8-pmu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/perf/power8-pmu.c b/arch/powerpc/perf/power8-pmu.c
index ef9685065aaf..6fcf5ddb0b54 100644
--- a/arch/powerpc/perf/power8-pmu.c
+++ b/arch/powerpc/perf/power8-pmu.c
@@ -23,8 +23,6 @@ enum {
 
 /* MMCRA IFM bits - POWER8 */
 #define	POWER8_MMCRA_IFM1		0x0000000040000000UL
-#define	POWER8_MMCRA_IFM2		0x0000000080000000UL
-#define	POWER8_MMCRA_IFM3		0x00000000C0000000UL
 #define	POWER8_MMCRA_BHRB_MASK		0x00000000C0000000UL
 
 /*
-- 
2.43.5


