Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6022E8494EF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 08:59:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s5vfb/Jf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TSzLg6TsSz3cCS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 18:59:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s5vfb/Jf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TSzK926ZSz3069
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 18:58:37 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41562KoH000632;
	Mon, 5 Feb 2024 07:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uA4dX/64WBn82zEY5zK7EFXEXLF6PezbIylDMQQcklE=;
 b=s5vfb/JfH1TjNIY9Pl/I6m+1hp8cpkh6AACR13HqOE1dfbUByRmRxQmJO6fqOCCBgCVl
 wYP8CdJF3VqmKFfhhz05iBXl+AFwl2NKdG0EoL0s/MnF9ZL5QJTAGcPy/OEvZAx9Ms+9
 XgEjO08Xw6CV9VUxvDf24IFUCkRrOXVv+T0sMmYqO6BPixI+HkwS7vuHlGJ3TJIIUxq4
 PQsDv/eFJz3xWRTqJIeUehW4tciuiCcB90ZxbSlzEMZOWq1E7L/QybKgxjN5ZR4whZ10
 sHUsVCbs/+m+REPYe/VZSf1i8BcdcPW0nCRlYohaoGSUTH3z1FLWBTrKCMb4iyTyGxb8 bA== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w2t23t92p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 07:58:32 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4156wKur008818;
	Mon, 5 Feb 2024 07:58:31 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w206y79h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 07:58:30 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4157wRIX42402268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Feb 2024 07:58:27 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B623A20043;
	Mon,  5 Feb 2024 07:58:27 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CEE920040;
	Mon,  5 Feb 2024 07:58:25 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.177.88.200])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Feb 2024 07:58:24 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 2/2] powerpc/perf: Power11 Performance Monitoring support
Date: Mon,  5 Feb 2024 13:28:08 +0530
Message-ID: <20240205075808.174477-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205075808.174477-1-maddy@linux.ibm.com>
References: <20240205075808.174477-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VUgJGqCms5XwSpJ6_pVApGMgT4Rtr0_c
X-Proofpoint-ORIG-GUID: VUgJGqCms5XwSpJ6_pVApGMgT4Rtr0_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_03,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=957 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402050060
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

