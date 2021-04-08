Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA3A357D86
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 09:45:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGCxF6mnTz3bt0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 17:45:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z7FN0va7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Z7FN0va7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGCwn1vyLz309X
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 17:45:28 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1387XOwM023075; Thu, 8 Apr 2021 03:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pZcW2MmAdT2RY32PufIwngtx+WZFwC7Os6ExqWgNuYI=;
 b=Z7FN0va7IGjIP7uvUwLvenYUPj7yA3hDRLXKUxkkBtrYXf5B2umJhdmpdnTvfwZpgbO+
 cL1k081ekFbxWVthaWIwIcwst/a1PmeR7ZDQ4FQCeSpe49J14GovSTGoiaL9fz8Ppp2S
 OTXBUGwZfJarT8rOsrdog2wO+GLm9iuolMIu/PCfWRn3jL1AjZ8MHUtyq2rjvo1Ew6yG
 NMGXsyiyA6dfVFaZNXgyuhKhxrN/uJbkU4gm+aTPGGDj+h5LJDPNE5QtiKbLBMIEWNc6
 o87cbXvzTQ+FQUvbbj5N+iAZEA1sCOH5F/VsqtMkt+KnFYbiJ9/loki+4H0MpRxqXSYU 4w== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rw6m20vv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 03:45:24 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1387hOfs007616;
 Thu, 8 Apr 2021 07:45:22 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 37rvbw9c1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 07:45:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1387jJ4350659798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Apr 2021 07:45:19 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 765CBA405B;
 Thu,  8 Apr 2021 07:45:19 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E23D9A4066;
 Thu,  8 Apr 2021 07:45:17 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.80.215.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  8 Apr 2021 07:45:17 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/2] powerpc/perf: Add platform specific check_attr_config
Date: Thu,  8 Apr 2021 13:15:04 +0530
Message-Id: <20210408074504.248211-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210408074504.248211-1-maddy@linux.ibm.com>
References: <20210408074504.248211-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3OSULZgI4HRicUF6kBWMRt5U1_M15Ina
X-Proofpoint-ORIG-GUID: 3OSULZgI4HRicUF6kBWMRt5U1_M15Ina
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_02:2021-04-08,
 2021-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104080050
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add platform specific attr.config value checks. Patch
includes checks for both power9 and power10.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v3:
- No changes

Changelog v2:
- Changed function name as suggested.
- Added name of source document referred for reserved values

Changelog v1:
- No changes

 arch/powerpc/perf/isa207-common.c | 42 +++++++++++++++++++++++++++++++
 arch/powerpc/perf/isa207-common.h |  2 ++
 arch/powerpc/perf/power10-pmu.c   | 13 ++++++++++
 arch/powerpc/perf/power9-pmu.c    | 13 ++++++++++
 4 files changed, 70 insertions(+)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index e4f577da33d8..358a0e95ba5f 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -694,3 +694,45 @@ int isa207_get_alternatives(u64 event, u64 alt[], int size, unsigned int flags,
 
 	return num_alt;
 }
+
+int isa3XX_check_attr_config(struct perf_event *ev)
+{
+	u64 val, sample_mode;
+	u64 event = ev->attr.config;
+
+	val = (event >> EVENT_SAMPLE_SHIFT) & EVENT_SAMPLE_MASK;
+	sample_mode = val & 0x3;
+
+	/*
+	 * MMCRA[61:62] is Random Sampling Mode (SM).
+	 * value of 0b11 is reserved.
+	 */
+	if (sample_mode == 0x3)
+		return -EINVAL;
+
+	/*
+	 * Check for all reserved value
+	 * Source: Performance Monitoring Unit User Guide
+	 */
+	switch (val) {
+	case 0x5:
+	case 0x9:
+	case 0xD:
+	case 0x19:
+	case 0x1D:
+	case 0x1A:
+	case 0x1E:
+		return -EINVAL;
+	}
+
+	/*
+	 * MMCRA[48:51]/[52:55]) Threshold Start/Stop
+	 * Events Selection.
+	 * 0b11110000/0b00001111 is reserved.
+	 */
+	val = (event >> EVENT_THR_CTL_SHIFT) & EVENT_THR_CTL_MASK;
+	if (((val & 0xF0) == 0xF0) || ((val & 0xF) == 0xF))
+		return -EINVAL;
+
+	return 0;
+}
diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
index 1af0e8c97ac7..b4d2a2b2b346 100644
--- a/arch/powerpc/perf/isa207-common.h
+++ b/arch/powerpc/perf/isa207-common.h
@@ -280,4 +280,6 @@ void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
 							struct pt_regs *regs);
 void isa207_get_mem_weight(u64 *weight);
 
+int isa3XX_check_attr_config(struct perf_event *ev);
+
 #endif
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index a901c1348cad..f9d64c63bb4a 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -106,6 +106,18 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 	return num_alt;
 }
 
+static int power10_check_attr_config(struct perf_event *ev)
+{
+	u64 val;
+	u64 event = ev->attr.config;
+
+	val = (event >> EVENT_SAMPLE_SHIFT) & EVENT_SAMPLE_MASK;
+	if (val == 0x10 || isa3XX_check_attr_config(ev))
+		return -EINVAL;
+
+	return 0;
+}
+
 GENERIC_EVENT_ATTR(cpu-cycles,			PM_RUN_CYC);
 GENERIC_EVENT_ATTR(instructions,		PM_RUN_INST_CMPL);
 GENERIC_EVENT_ATTR(branch-instructions,		PM_BR_CMPL);
@@ -559,6 +571,7 @@ static struct power_pmu power10_pmu = {
 	.attr_groups		= power10_pmu_attr_groups,
 	.bhrb_nr		= 32,
 	.capabilities           = PERF_PMU_CAP_EXTENDED_REGS,
+	.check_attr_config	= power10_check_attr_config,
 };
 
 int init_power10_pmu(void)
diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
index 2a57e93a79dc..ff3382140d7e 100644
--- a/arch/powerpc/perf/power9-pmu.c
+++ b/arch/powerpc/perf/power9-pmu.c
@@ -151,6 +151,18 @@ static int power9_get_alternatives(u64 event, unsigned int flags, u64 alt[])
 	return num_alt;
 }
 
+static int power9_check_attr_config(struct perf_event *ev)
+{
+	u64 val;
+	u64 event = ev->attr.config;
+
+	val = (event >> EVENT_SAMPLE_SHIFT) & EVENT_SAMPLE_MASK;
+	if (val == 0xC || isa3XX_check_attr_config(ev))
+		return -EINVAL;
+
+	return 0;
+}
+
 GENERIC_EVENT_ATTR(cpu-cycles,			PM_CYC);
 GENERIC_EVENT_ATTR(stalled-cycles-frontend,	PM_ICT_NOSLOT_CYC);
 GENERIC_EVENT_ATTR(stalled-cycles-backend,	PM_CMPLU_STALL);
@@ -437,6 +449,7 @@ static struct power_pmu power9_pmu = {
 	.attr_groups		= power9_pmu_attr_groups,
 	.bhrb_nr		= 32,
 	.capabilities           = PERF_PMU_CAP_EXTENDED_REGS,
+	.check_attr_config	= power9_check_attr_config,
 };
 
 int init_power9_pmu(void)
-- 
2.26.2

