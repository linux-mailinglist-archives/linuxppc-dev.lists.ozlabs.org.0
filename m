Return-Path: <linuxppc-dev+bounces-8003-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2779FA9D774
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 05:56:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zkwqb1mqrz2yfD;
	Sat, 26 Apr 2025 13:56:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745639771;
	cv=none; b=Eza+DUTo6UwVwc7gsCL+uWP6bvBtwgUMru9YhieQU64AyMPUrGsdea62szkzHHl4M6crI1QzmB9v39oEnEbqTWEg+7enDxYHLmbBLJPhhhbAVf0bWn/eoYrNSfYAMBnautq6SiXNPqFL+k17dhJ0BORZYWe191zXmAU9MfbCrR4/MSNY1Fkrcv0llpX38hMj7azK+XFR9Z1u04mOuiqgl/KPVAB8nk6PT451AMj9rdc9Rap7P0lwtoY6ptV9ZZWuApsSd20IkSdarML4eTJWGQA+6u6Yq+vrDRz7FfAFBy1GAmV/opvWTGgSdMwmNoa0tRnTaAhSSQzLGUa4NS5FAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745639771; c=relaxed/relaxed;
	bh=cwJGSyoRmzv0S7WjrpGtbuMg+PFy24X3pVxmuo03UWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jntLQa+enyxSKzHg/gJK+AzOhvlhNybWUZPBK64tHkqC8FYlYgqVuPFCHiFGJl3kPg24eVgy3qp1i43IT0yd4Z1fI6RBRnINueFwG3R4FjYhJ5YUgT+EA0ZRJdShcU/3dVohilbwussGXPlZ7rftGTv+19sDkqtaTZyUAexg8cc/JM/O7qkhubp3OVixN7y7kI13S9wJiYD2WWbdCA3zKpBjOuRdAA2KwONe6Sv3GOQnDmX+nLXkoeC1pCT+YeLuCkkHoJGcyrcjvXYZWtraq9Xru6R1YnV8+f0gNasxw10XM+PHz6Qtj4gbSSMH2TIcOFGmpv8BA3qxj450zmie5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X4uZ/e1y; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X4uZ/e1y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkwqZ3N7Vz2y06
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 13:56:10 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q3PNB2024472;
	Sat, 26 Apr 2025 03:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=cwJGSyoRmzv0S7Wjr
	pGtbuMg+PFy24X3pVxmuo03UWs=; b=X4uZ/e1yNLI1CPZ2AIfw3bRNrYEkuCwKD
	YH3chdL7pkeUDDn/tXV7NnEHo3vXB/gWamvhNugbL8f2WfNHeolggGFOEHjcQlpS
	1BhRfLNNrU9/4vw0mpQCKfoMGwP1sgNAXGHGweYh4JCmUrpCZNdZyg9jMrphbGmH
	i/1XpHOIAkP745EyUshESjDnK1cUKo/sEQZL9hUPBS46XRB3d7KZxhNq2kgrkgMB
	LrxxcGBlYyNt9x8159an0kDS7g5/JpcUHM0UWRxGMYdz9zY3EIpMvdkHcX9SpZC1
	ucVV3tET1UWXmOzIPWFowfxiItjtt9y2C47EuDOTDBRJgmtwtp/ug==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468mwrrdrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:59 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53Q3rK5t011248;
	Sat, 26 Apr 2025 03:55:59 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468mwrrdre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:59 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0agoi028434;
	Sat, 26 Apr 2025 03:55:58 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfw0cv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:58 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53Q3tsil44106214
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 26 Apr 2025 03:55:54 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9F9120043;
	Sat, 26 Apr 2025 03:55:54 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D68E20040;
	Sat, 26 Apr 2025 03:55:53 +0000 (GMT)
Received: from li-e616facc-2daa-11b2-a85c-9c7f23c3cd5e.in.ibm.com (unknown [9.199.192.254])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 26 Apr 2025 03:55:52 +0000 (GMT)
From: Likhitha Korrapati <likhitha@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, Likhitha Korrapati <likhitha@linux.ibm.com>,
        Anjali K <anjalik@linux.ibm.com>
Subject: [PATCH 5/7] arch/powerpc/perf : Removing unused macros from power6-pmu.c
Date: Sat, 26 Apr 2025 09:25:33 +0530
Message-ID: <20250426035535.450778-6-likhitha@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAyNCBTYWx0ZWRfX4mtiF4L5YPkD nOPMFSbS8nOoHqQbD4rLXoasnAN2ZfzS8o8vlqEImWJWcUUVz1H1DPi4TXpsVaf1U6sWLWPlILl C10VcCn702ZxsST6TlK834gBSml+X3wj9V1BWyfN+bdJxoHfudYshKT9ATOTnb3YG+Pr1nmb9rC
 sOaFFcItFhlB9TKJwjLS9i0jLA02f6ILP8eV/jJLx90po6QhiKbhJX0rYdMICTm/Qb66qab5ney 3oRy1J5fgTC/tAgXt3stTdes6jLvWEZbeRIzhiQeAGyqgyzJwjhTS7gE4zOnJ9/tRONBRnCks3a 3ciJRQyLVpZ3v3xMnE+RPYTtG/dgRcFXFVDV29r2xQQ2hROPzmNjiLnoyWtk8hlZQz/BUtSBT/t
 +HzXykkJ/Zh7GINugS04avWFNbQQXl0+Jv5TJqn0JMo+hjgvetbovg07MrWMqMOTPLfhlMNh
X-Authority-Analysis: v=2.4 cv=IMsCChvG c=1 sm=1 tr=0 ts=680c594f cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=nr16SDbJOwr322wGldEA:9
X-Proofpoint-ORIG-GUID: pO0xc6IVBWbul4LVLytWa3-qmweLaRJG
X-Proofpoint-GUID: Ebb_ltWDU5bE7XPBwht7hOwewdMcKtCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260024
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The macro MMCR1_PMCSEL_MSK was introduced in power6-pmu via
commit f78628374a13 ("powerpc/perf_counter: Add support
for POWER6") but never used.

The usage of macro PM_SUBUNIT_MSKS was removed in commit ab7ef2e50a55
("perf_counter: powerpc: allow use of limited-function counters")
and failed to remove its definition.

Removing both the macros as they are not in use.

Co-developed-by: Anjali K <anjalik@linux.ibm.com>
Signed-off-by: Anjali K <anjalik@linux.ibm.com>
Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
---
 arch/powerpc/perf/power6-pmu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/perf/power6-pmu.c b/arch/powerpc/perf/power6-pmu.c
index 9f720b522e17..ceb75235a6ef 100644
--- a/arch/powerpc/perf/power6-pmu.c
+++ b/arch/powerpc/perf/power6-pmu.c
@@ -27,7 +27,6 @@
 #define PM_BYTE_MSK	3
 #define PM_SUBUNIT_SH	8	/* Subunit event comes from (NEST_SEL enc.) */
 #define PM_SUBUNIT_MSK	7
-#define PM_SUBUNIT_MSKS	(PM_SUBUNIT_MSK << PM_SUBUNIT_SH)
 #define PM_PMCSEL_MSK	0xff	/* PMCxSEL value */
 #define PM_BUSEVENT_MSK	0xf3700
 
@@ -46,7 +45,6 @@
 #define MMCR1_PMC1_ADDR_SEL	(1ul << 35)
 #define MMCR1_PMC1SEL_SH	24
 #define MMCR1_PMCSEL_SH(n)	(MMCR1_PMC1SEL_SH - (n) * 8)
-#define MMCR1_PMCSEL_MSK	0xff
 
 /*
  * Map of which direct events on which PMCs are marked instruction events.
-- 
2.43.5


