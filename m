Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 091EA213457
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 08:40:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ylh06mlYzDqxq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 16:40:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anju@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ylcS2mQGzDqxL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 16:36:53 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0636XbE3059879; Fri, 3 Jul 2020 02:36:47 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3212au5g92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 02:36:47 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0636aiqN010220;
 Fri, 3 Jul 2020 06:36:44 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 31wwr7u9vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 06:36:44 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0636agl947251456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Jul 2020 06:36:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 786EB11C05C;
 Fri,  3 Jul 2020 06:36:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC78411C058;
 Fri,  3 Jul 2020 06:36:40 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.87.150])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Jul 2020 06:36:40 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Add kernel support for new MSR[HV PR] bits in
 trace-imc.
Date: Fri,  3 Jul 2020 12:06:26 +0530
Message-Id: <20200703063626.1412544-1-anju@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_02:2020-07-02,
 2020-07-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 cotscore=-2147483648
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1011 phishscore=0
 mlxlogscore=999 suspectscore=1 lowpriorityscore=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007030048
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

IMC trace-mode record has MSR[HV PR] bits added in the third DW. 
These bits can be used to set the cpumode for the instruction pointer
captured in each sample.                                                                  
                                                                           
Add support in kernel to use these bits to set the cpumode for         
each sample.                                                               
                                                                           
Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
---
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
index cb50a9e1fd2d..310922fed9eb 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -1178,11 +1178,30 @@ static int trace_imc_prepare_sample(struct trace_imc_data *mem,
 	header->size = sizeof(*header) + event->header_size;
 	header->misc = 0;
 
-	if (is_kernel_addr(data->ip))
-		header->misc |= PERF_RECORD_MISC_KERNEL;
-	else
-		header->misc |= PERF_RECORD_MISC_USER;
-
+	if (cpu_has_feature(CPU_FTRS_POWER9)) {
+		if (is_kernel_addr(data->ip))
+			header->misc |= PERF_RECORD_MISC_KERNEL;
+		else
+			header->misc |= PERF_RECORD_MISC_USER;
+	} else {
+		switch (IMC_TRACE_RECORD_VAL_HVPR(mem->val)) {
+		case 0:/* when MSR HV and PR not set in the trace-record */
+			header->misc |= PERF_RECORD_MISC_GUEST_KERNEL;
+			break;
+		case 1: /* MSR HV is 0 and PR is 1 */
+			header->misc |= PERF_RECORD_MISC_GUEST_USER;
+			break;
+		case 2: /* MSR Hv is 1 and PR is 0 */
+			header->misc |= PERF_RECORD_MISC_HYPERVISOR;
+			break;
+		case 3: /* MSR HV is 1 and PR is 1 */
+			header->misc |= PERF_RECORD_MISC_USER;
+			break;
+		default:
+			pr_info("IMC: Unable to set the flag based on MSR bits\n");
+			break;
+		}
+	}
 	perf_event_header__init_id(header, data, event);
 
 	return 0;
-- 
2.25.4

