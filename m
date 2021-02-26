Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1C7325DB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 07:51:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dn0gd3hZcz3clh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 17:51:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rlvt+WNP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rlvt+WNP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dn0fg6rnQz3cXd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 17:50:51 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11Q6m6QV062032; Fri, 26 Feb 2021 01:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=p7WJh7/ASqeoCdKCY6J33l2T/A0mLBreVtRhnuLK/Iw=;
 b=rlvt+WNPj40yL/npBXE/sXbWAZOn2kte0q3h7H+RdjFfhlAlaj6qdciuk4CuFWsFjdG3
 XaK2itvkz/wBA9eKZfCq/Jn+lWscZ/bJlUkzcEfUkdRUM7DnkF3TskBsrOLFVMuAOTwV
 0Xtn/h9Xx+qZeQxZJcsnw6ra7vjKMp6kktJodsTUuzM6Ap5HtzS8payPUU4mughTIGiY
 ONvqbLnE4LYx3qKbbBAKpgirb3RluUiJ0Ga3wH6K+9+8bu+X0LeVGNkmBXKda69Reiy9
 pJFtpgPbWl0LMFRacx5TQoNgKx9F+X9K4ffoTqyQWgPtruPbY7DXpP31U6oNBDj486aA Hw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36xv1s013g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 01:50:45 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11Q6lap3030997;
 Fri, 26 Feb 2021 06:50:42 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 36tsphanyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 06:50:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 11Q6oQ9S32244212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 06:50:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B413911C052;
 Fri, 26 Feb 2021 06:50:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3652711C058;
 Fri, 26 Feb 2021 06:50:38 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.180.74])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Feb 2021 06:50:37 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 2/2] powerpc/perf: Add platform specific check_attr_config
Date: Fri, 26 Feb 2021 12:20:25 +0530
Message-Id: <20210226065025.1254973-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226065025.1254973-1-maddy@linux.ibm.com>
References: <20210226065025.1254973-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_01:2021-02-24,
 2021-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260049
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
Changelog v1:
- No changes.

 arch/powerpc/perf/isa207-common.c | 41 +++++++++++++++++++++++++++++++
 arch/powerpc/perf/isa207-common.h |  2 ++
 arch/powerpc/perf/power10-pmu.c   | 13 ++++++++++
 arch/powerpc/perf/power9-pmu.c    | 13 ++++++++++
 4 files changed, 69 insertions(+)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index e4f577da33d8..b255799f5b51 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -694,3 +694,44 @@ int isa207_get_alternatives(u64 event, u64 alt[], int size, unsigned int flags,
 
 	return num_alt;
 }
+
+int isa3_X_check_attr_config(struct perf_event *ev)
+{
+	u64 val, sample_mode;
+	u64 event = ev->attr.config;
+
+	val = (event >> EVENT_SAMPLE_SHIFT) & EVENT_SAMPLE_MASK;
+	sample_mode = val & 0x3;
+
+	/*
+	 * MMCRA[61:62] is Randome Sampling Mode (SM).
+	 * value of 0b11 is reserved.
+	 */
+	if (sample_mode == 0x3)
+		return -1;
+
+	/*
+	 * Check for all reserved value
+	 */
+	switch (val) {
+	case 0x5:
+	case 0x9:
+	case 0xD:
+	case 0x19:
+	case 0x1D:
+	case 0x1A:
+	case 0x1E:
+		return -1;
+	}
+
+	/*
+	 * MMCRA[48:51]/[52:55]) Threshold Start/Stop
+	 * Events Selection.
+	 * 0b11110000/0b00001111 is reserved.
+	 */
+	val = (event >> EVENT_THR_CTL_SHIFT) & EVENT_THR_CTL_MASK;
+	if (((val & 0xF0) == 0xF0) || ((val & 0xF) == 0xF))
+		return -1;
+
+	return 0;
+}
diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
index 1af0e8c97ac7..ae8eaf05efd1 100644
--- a/arch/powerpc/perf/isa207-common.h
+++ b/arch/powerpc/perf/isa207-common.h
@@ -280,4 +280,6 @@ void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
 							struct pt_regs *regs);
 void isa207_get_mem_weight(u64 *weight);
 
+int isa3_X_check_attr_config(struct perf_event *ev);
+
 #endif
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index a901c1348cad..bc64354cab6a 100644
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
+	if (val == 0x10 || isa3_X_check_attr_config(ev))
+		return -1;
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
index 2a57e93a79dc..b3b9b226d053 100644
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
+	if (val == 0xC || isa3_X_check_attr_config(ev))
+		return -1;
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

