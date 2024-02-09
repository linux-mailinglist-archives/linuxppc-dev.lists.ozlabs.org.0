Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B333484EF9A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 05:09:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FdGrINIb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWL334YDJz3cmK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 15:09:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FdGrINIb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWL1S50Klz309c
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 15:08:11 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4193tBMf011978;
	Fri, 9 Feb 2024 04:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vAwBNJnxJxzJKXiFupQxwp7XhOljS7xACC3q1vNJb1g=;
 b=FdGrINIbpikmEPWEPKW7ouKP1GREFgyWc42YfDLCDhzgvf41iukX9fd5wodhCNxysl7i
 7ziIpGN6X3ZfILTSHk7xt9hX6OJ3/HnxwuQOIipUQAqtWe3NAhUoSWQwhp50Zuiiim5O
 i8hXi20LNxRt5S2mXlkkWE02sC/84XevZ//PPP2rYKFlOK1KXhHcXa2b8BkD1oV4ve9p
 i/CLEbmHnEs/uP+i/+PfQbmavHb0uft6ZZWpA/TmaAx7A5Sf5EeWdrSh+DCk+SAiSMls
 +CoGwicqiEqw9Xs7DeovWhSnOcqcwQRukWUQMm5oHOhBdNhI8zOXLVmX8Wd0LEEMmIso tA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w5cjg07rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 04:08:05 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4191NCQR016198;
	Fri, 9 Feb 2024 04:08:04 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w22h2ggn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 04:08:04 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 419482eo25363020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Feb 2024 04:08:02 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8E7720040;
	Fri,  9 Feb 2024 04:08:01 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C97D220043;
	Fri,  9 Feb 2024 04:08:00 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.171.62.238])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Feb 2024 04:08:00 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 2/2] powerpc/perf: Power11 Performance Monitoring support
Date: Fri,  9 Feb 2024 09:37:53 +0530
Message-ID: <20240209040753.748609-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209040753.748609-1-maddy@linux.ibm.com>
References: <20240209040753.748609-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VyIYZc26XtVHgFJc-9xAb1_P6SznhBUx
X-Proofpoint-ORIG-GUID: VyIYZc26XtVHgFJc-9xAb1_P6SznhBUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_01,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 mlxscore=0 phishscore=0
 mlxlogscore=959 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402090027
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Base enablement patch to register performance monitoring
hardware support for Power11. Most of fields are copied
from power10_pmu struct for power11_pmu struct.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog V2:
- No change

Changelog v1:
- Copied power10 struct for power11 with name change

 arch/powerpc/perf/core-book3s.c |  2 ++
 arch/powerpc/perf/internal.h    |  1 +
 arch/powerpc/perf/power10-pmu.c | 27 +++++++++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index b7ff680cde96..6f0d46c53027 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2593,6 +2593,8 @@ static int __init init_ppc64_pmu(void)
 		return 0;
 	else if (!init_power10_pmu())
 		return 0;
+	else if (!init_power11_pmu())
+		return 0;
 	else if (!init_ppc970_pmu())
 		return 0;
 	else
diff --git a/arch/powerpc/perf/internal.h b/arch/powerpc/perf/internal.h
index 4c18b5504326..a70ac471a5a5 100644
--- a/arch/powerpc/perf/internal.h
+++ b/arch/powerpc/perf/internal.h
@@ -10,4 +10,5 @@ int __init init_power7_pmu(void);
 int __init init_power8_pmu(void);
 int __init init_power9_pmu(void);
 int __init init_power10_pmu(void);
+int __init init_power11_pmu(void);
 int __init init_generic_compat_pmu(void);
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index 9b5133e361a7..62a68b6b2d4b 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -634,3 +634,30 @@ int __init init_power10_pmu(void)
 
 	return 0;
 }
+
+static struct power_pmu power11_pmu;
+
+int __init init_power11_pmu(void)
+{
+	unsigned int pvr;
+	int rc;
+
+	pvr = mfspr(SPRN_PVR);
+	if (PVR_VER(pvr) != PVR_POWER11)
+		return -ENODEV;
+
+	/* Set the PERF_REG_EXTENDED_MASK here */
+	PERF_REG_EXTENDED_MASK = PERF_REG_PMU_MASK_31;
+
+	power11_pmu = power10_pmu;
+	power11_pmu.name = "Power11";
+
+	rc = register_power_pmu(&power11_pmu);
+	if (rc)
+		return rc;
+
+	/* Tell userspace that EBB is supported */
+	cur_cpu_spec->cpu_user_features2 |= PPC_FEATURE2_EBB;
+
+	return 0;
+}
-- 
2.43.0

