Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7615C21D8E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 16:49:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B563w70pVzDqTp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 00:49:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B561437m6zDqTC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 00:46:48 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06DEVllI187142; Mon, 13 Jul 2020 10:46:38 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3279kwebkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 10:46:38 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06DEZhag006764;
 Mon, 13 Jul 2020 14:46:37 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3275282ab3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 14:46:36 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06DEkYOU50921700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 14:46:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE24752050;
 Mon, 13 Jul 2020 14:46:34 +0000 (GMT)
Received: from maddy.in.ibm.com (unknown [9.199.49.3])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 847535204F;
 Mon, 13 Jul 2020 14:46:33 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/perf: Add kernel support for new MSR[HV PR] bits
 in trace-imc
Date: Mon, 13 Jul 2020 20:16:23 +0530
Message-Id: <20200713144623.508695-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_11:2020-07-13,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 suspectscore=1 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007130106
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
Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Anju T Sudhakar <anju@linux.vnet.ibm.com>

IMC trace-mode record has MSR[HV PR] bits added in the third DW.
These bits can be used to set the cpumode for the instruction pointer
captured in each sample.

Add support in kernel to use these bits to set the cpumode for
each sample.

Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com> 
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
- Changed check to use CPU_FTR_ARCH_31

 arch/powerpc/include/asm/imc-pmu.h |  5 +++++
 arch/powerpc/perf/imc-pmu.c        | 29 ++++++++++++++++++++++++-----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/imc-pmu.h b/arch/powerpc/include/asm/imc-pmu.h
index 4da4fcba0684..4f897993b710 100644
--- a/arch/powerpc/include/asm/imc-pmu.h
+++ b/arch/powerpc/include/asm/imc-pmu.h
@@ -99,6 +99,11 @@ struct trace_imc_data {
  */
 #define IMC_TRACE_RECORD_TB1_MASK      0x3ffffffffffULL
 
+/*
+ * Bit 0:1 in third DW of IMC trace record
+ * specifies the MSR[HV PR] values.
+ */
+#define IMC_TRACE_RECORD_VAL_HVPR(x)	((x) >> 62)
 
 /*
  * Device tree parser code detects IMC pmu support and
diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index 0edcfd0b491d..a45d694a5d5d 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -1288,11 +1288,30 @@ static int trace_imc_prepare_sample(struct trace_imc_data *mem,
 	header->size = sizeof(*header) + event->header_size;
 	header->misc = 0;
 
-	if (is_kernel_addr(data->ip))
-		header->misc |= PERF_RECORD_MISC_KERNEL;
-	else
-		header->misc |= PERF_RECORD_MISC_USER;
-
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		switch (IMC_TRACE_RECORD_VAL_HVPR(mem->val)) {
+		case 0:/* when MSR HV and PR not set in the trace-record */
+			header->misc |= PERF_RECORD_MISC_GUEST_KERNEL;
+			break;
+		case 1: /* MSR HV is 0 and PR is 1 */
+			header->misc |= PERF_RECORD_MISC_GUEST_USER;
+			break;
+		case 2: /* MSR HV is 1 and PR is 0 */
+			header->misc |= PERF_RECORD_MISC_HYPERVISOR;
+			break;
+		case 3: /* MSR HV is 1 and PR is 1 */
+			header->misc |= PERF_RECORD_MISC_USER;
+			break;
+		default:
+			pr_info("IMC: Unable to set the flag based on MSR bits\n");
+			break;
+		}
+	} else {
+		if (is_kernel_addr(data->ip))
+			header->misc |= PERF_RECORD_MISC_KERNEL;
+		else
+			header->misc |= PERF_RECORD_MISC_USER;
+	}
 	perf_event_header__init_id(header, data, event);
 
 	return 0;
-- 
2.26.2

