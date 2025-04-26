Return-Path: <linuxppc-dev+bounces-8005-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD075A9D776
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 05:56:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zkwqf3hylz3bjG;
	Sat, 26 Apr 2025 13:56:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745639774;
	cv=none; b=PODW80C3kIBXtPGt6p1hFUi5vNRH52kaJTxznWSbKf2kOMTFBs46hBjKvLvr/kFtfBptd+8DKkmU5omlnCIzFRnZb6wb7Vv62gJeMeUWNwhSO5MFBrjSg5WSFg8J48lhe70bDGuVm0g584QhPFbeozZWWcOBQO/fLXhQaFvUBb8MJ06plPaBHkFj/k/GX3gH2yu/V3foPuPKx+WLpiFPLDFfBuHm1MYr6fbeofYr0Hq+G3ggmVGYleF6M2jKGjSyaZCMyW5/ll4dIX5XiPcgz99GO1D/qhTiZW6yWnn+sugZGJni4KtSrEWwHWhs+0Dvk04TgRDLuuUAHaprdc1AaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745639774; c=relaxed/relaxed;
	bh=/QYTI/O3fA063e4KuOSpZDnTiXoCsxGHs2HStxprqR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=llwUlIkwGupGYFHl0LV7Ue7dqKCm5TSpsMKl6eDv2JoQR0hOy2aqv3f5oI91XtwPKYnIuvzX5uXttWGRWIQ/BMAXkKQqeTbN3NvNZBEbj3jmZXGOTJg9vEL2PauLmYXsMZJYokadx6jNaVosHL8viMAZrBwTpa6pCvrjsfkd7wlmdqbvOb1WO5+035tAToP+J+QBtZJz99Y8jNTSTDHNr2tIUn/KmMm9bpR2T+0eCQCeHry0lTBzKBQ+KPuiNQXv30biN2vRzHnD7Tap6++rVq59O1m7hjE3JZBmXUwsddxUem81reif2ZIv2NNzhGBwBXfqulXWPuN8fFt4HjmBoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tnus6ICR; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tnus6ICR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zkwqd53JJz3bcW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 13:56:13 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q2kOfq016429;
	Sat, 26 Apr 2025 03:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=/QYTI/O3fA063e4Ku
	OSpZDnTiXoCsxGHs2HStxprqR4=; b=tnus6ICRuaIGPt+ZWcWpsFWHoDUeAPorR
	b3OdS+R0+f6/r5WirfQK9/0e7/O0824zL4B3642tAPVd2A6dZON2/zdZTcL4l5zO
	V+tr/JNDconM5klrZlRzE4jCbXk2wu0pWmSmA5G2Fqv4fOT/ai4YLYbMc74fP8CL
	oXIS4iqDuOB0mjxetx4rj7HkLT5uDRSWZn2Dd+zDt4ksWvzsZjfcbXgbMTklwUb4
	pNsJUL2rv2Cw2Y/rnPvfayqfoJRxQCY4N2fTzFjn8/Bhz5RAlPuMC/9rkDJtvBK7
	feLFeIHY5sCBxv/LUJNFt7Prhse9H35ttjsKu9l1luASeG8iZx3ZA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468q0bg3bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:57 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53Q3tutM006669;
	Sat, 26 Apr 2025 03:55:56 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468q0bg3bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:56 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0X02i008670;
	Sat, 26 Apr 2025 03:55:55 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jfy0dx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:55 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53Q3tqe733096092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 26 Apr 2025 03:55:52 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE0F020043;
	Sat, 26 Apr 2025 03:55:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F20B20040;
	Sat, 26 Apr 2025 03:55:50 +0000 (GMT)
Received: from li-e616facc-2daa-11b2-a85c-9c7f23c3cd5e.in.ibm.com (unknown [9.199.192.254])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 26 Apr 2025 03:55:50 +0000 (GMT)
From: Likhitha Korrapati <likhitha@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, Likhitha Korrapati <likhitha@linux.ibm.com>,
        Anjali K <anjalik@linux.ibm.com>
Subject: [PATCH 4/7] arch/powerpc/perf : Removing unused macros from power7-pmu.c
Date: Sat, 26 Apr 2025 09:25:32 +0530
Message-ID: <20250426035535.450778-5-likhitha@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=V9590fni c=1 sm=1 tr=0 ts=680c594d cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=8BdXJxj_C24AKXdwOPwA:9
X-Proofpoint-GUID: qMh4DAviyaNuoQP_isAdrIP-Ua3XB_aW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAyNCBTYWx0ZWRfX3FT5YYaCUGPp iA0Ad53/wgtBrg4NpP42qguQlT1G5+/8NBDMRORlVUNAwpAYthQFmq6D9ZclzrarUDipeROmNoU yZNiP9fN6d5YXiZ/Rfm3YKVx7g84OyWUc/kcC96C3Zh5BUT2sUKF8eFM5nF359/iat5Lj+ANAsc
 9AkD7ZZaV1KtulvCjWE+zQqcbXAP7k7OgbL2xHjxBiB5aKF1Un3/SBWbI8r80tm6KMaP9bIEwsi mmKVmaW8P885MvhlCAQNsP1FgrGFlVPLhgOD22fwjAuWMF9SWBNIlxoZQdWk9JJ8FqZAwpa2+M5 DvDMd44QVg7d7UuzM2kFvnXsbvAqyd83qXwp6wPiapVIiXy176FDu9OzvSqR8oHPlwgmueawtV2
 NlyoH8BflgB3o4DI7HW0cAtnZCk+ZR5ig76iV70VSO0IQgRhRCKONGGRk4sBzccULHg3L/Dr
X-Proofpoint-ORIG-GUID: g2SL12ZgMSKo8rZHGFe9KEznlasXKHD1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=921 impostorscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260024
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The following macros were introduced in power7-pmu via
commit 4da52960fd1a ("perf_counters: powerpc: Add
support for POWER7 processors")

PM_PMC_MSKS, PM_COMBINE_MSKS, MMCR1_TTM1SEL_SH,
MMCR1_TTM2SEL_SH, MMCR1_TTM3SEL_SH, MMCR1_TTMSEL_MSK,
MMCR1_L2SEL_MSK, MMCR1_PMC2_COMBINE_SH, MMCR1_PMC3_COMBINE_SH,
MMCR1_PMC4_COMBINE_SH, MMCR1_PMC2SEL_SH, MMCR1_PMC3SEL_SH,
MMCR1_PMC4SEL_SH, MMCR1_PMCSEL_MSK

Removing the above macros as they are defined but never used.

Co-developed-by: Anjali K <anjalik@linux.ibm.com>
Signed-off-by: Anjali K <anjalik@linux.ibm.com>
Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
---
 arch/powerpc/perf/power7-pmu.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/powerpc/perf/power7-pmu.c b/arch/powerpc/perf/power7-pmu.c
index c95ccf2e28da..b8f3028d3127 100644
--- a/arch/powerpc/perf/power7-pmu.c
+++ b/arch/powerpc/perf/power7-pmu.c
@@ -17,12 +17,10 @@
  */
 #define PM_PMC_SH	16	/* PMC number (1-based) for direct events */
 #define PM_PMC_MSK	0xf
-#define PM_PMC_MSKS	(PM_PMC_MSK << PM_PMC_SH)
 #define PM_UNIT_SH	12	/* TTMMUX number and setting - unit select */
 #define PM_UNIT_MSK	0xf
 #define PM_COMBINE_SH	11	/* Combined event bit */
 #define PM_COMBINE_MSK	1
-#define PM_COMBINE_MSKS	0x800
 #define PM_L2SEL_SH	8	/* L2 event select */
 #define PM_L2SEL_MSK	7
 #define PM_PMCSEL_MSK	0xff
@@ -31,22 +29,10 @@
  * Bits in MMCR1 for POWER7
  */
 #define MMCR1_TTM0SEL_SH	60
-#define MMCR1_TTM1SEL_SH	56
-#define MMCR1_TTM2SEL_SH	52
-#define MMCR1_TTM3SEL_SH	48
-#define MMCR1_TTMSEL_MSK	0xf
 #define MMCR1_L2SEL_SH		45
-#define MMCR1_L2SEL_MSK		7
 #define MMCR1_PMC1_COMBINE_SH	35
-#define MMCR1_PMC2_COMBINE_SH	34
-#define MMCR1_PMC3_COMBINE_SH	33
-#define MMCR1_PMC4_COMBINE_SH	32
 #define MMCR1_PMC1SEL_SH	24
-#define MMCR1_PMC2SEL_SH	16
-#define MMCR1_PMC3SEL_SH	8
-#define MMCR1_PMC4SEL_SH	0
 #define MMCR1_PMCSEL_SH(n)	(MMCR1_PMC1SEL_SH - (n) * 8)
-#define MMCR1_PMCSEL_MSK	0xff
 
 /*
  * Power7 event codes.
-- 
2.43.5


