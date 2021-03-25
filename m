Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E16A3349140
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 12:54:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5k6L6tClz3bcw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 22:54:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OsoC352k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OsoC352k; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5k5v5frdz309g
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 22:53:54 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PBYCJX185643; Thu, 25 Mar 2021 07:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zrSIz8GosWAM7DICp1qJ9iezdU42BVPSIaREmROt8YY=;
 b=OsoC352kmZEcKBQkyTIuDMaQpFUhTB3P9nLA5CaM5YCJdKtqitxyJ4u1qzUPiRSR8qKG
 j8O1YvTL+c9Uv87iCLSvvgmErsAa73NcxthUU+x/mKQdFaRzf90vhyeAPd/1Y/KL/J/H
 so4XlNGSOPMv3owHc1gGy5cVBDtitAyBIpHiijrq0vJdD7ZCgYZxrfYaEQ6S/Dy2pkXt
 SoNlQTbyeupG1TdY/ampq+gSdVHhwhd29LiLNA0+2PZ6DNCRERer0ELrc/wM0vLh6p0a
 tboXDKI6YBd0+SEwQreWSvCL9RPqA86FVDKFTthzDv92/dYsbC/Xs5cXEgv7ekoa2xOh TA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37gpjv6367-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 07:53:46 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12PBplNL028278;
 Thu, 25 Mar 2021 11:53:44 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 37d99xjt21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 11:53:44 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12PBrNQ338011358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 11:53:23 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B299AE045;
 Thu, 25 Mar 2021 11:53:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA0D0AE04D;
 Thu, 25 Mar 2021 11:53:39 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.167.233])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 25 Mar 2021 11:53:39 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 2/2] powerpc/perf: Add platform specific check_attr_config
Date: Thu, 25 Mar 2021 17:23:26 +0530
Message-Id: <20210325115326.143151-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210325115326.143151-1-maddy@linux.ibm.com>
References: <20210325115326.143151-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_02:2021-03-24,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 phishscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250086
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

