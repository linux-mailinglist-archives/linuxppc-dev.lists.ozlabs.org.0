Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E722949DB60
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:24:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JksXc5xdhz3cnB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:24:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TyuRJR8E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TyuRJR8E; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksT247QSz30gg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:21:10 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R6BaNs006131; 
 Thu, 27 Jan 2022 07:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ktih7UMaCVI8lsarfozl83Ma+1LOZx3Ft0xctgxTxiM=;
 b=TyuRJR8ERhHR+SwU33px7nPf6CqSgoyNAnvUhrkDBabDKslDLaYE0U0jpZRcT4RTGkyY
 pxE+8Q5qIlMUsvX7bnflA7ZfbwXnNH97waNln/5MrapSuWz7yBwnwSDtjVHCTZCJxvBo
 18JHV6TpXCO9W26lh6G2HsbXwoLCnNymWOlo3QvS4ZFNYisG0t3U3P1/H5EwE7PsXkp4
 20HhXNvjgq11Yl0W1M58KItOBpSGpsRUZtsiMNbL+fX2U4m8z10u7G4+uFU+0hRSx5Rx
 o6jv3LOSx1PqVGSpPjpbEoGdkR1168ALDXZzQX9h2/9QooxX+vC76tZ4nJBuK/KEkTYU 7Q== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dunwh1dd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:05 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20R78KVs028446;
 Thu, 27 Jan 2022 07:21:04 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3dr9j9ansp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:04 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20R7BLaG46924224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 07:11:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 393434204B;
 Thu, 27 Jan 2022 07:20:58 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 332C242045;
 Thu, 27 Jan 2022 07:20:56 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.106.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 07:20:55 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 04/20] selftest/powerpc/pmu: Add utility functions to post
 process the mmap buffer
Date: Thu, 27 Jan 2022 12:49:56 +0530
Message-Id: <20220127072012.662451-5-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127072012.662451-1-kjain@linux.ibm.com>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jTf1VVU6db2E3NoJ-O-9tFxo_8HtmeFf
X-Proofpoint-ORIG-GUID: jTf1VVU6db2E3NoJ-O-9tFxo_8HtmeFf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_02,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270040
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add couple of basic utility functions to post process the
mmap buffer. It includes function to read the total
number of samples present in the mmap buffer and function
to get the address of the first sample.

Add function "get_intr_regs" which will return pointer to
interrupt registers present in the sample, incase sample
type PERF_SAMPLE_REGS_INTR is set.

Add functions "get_reg_value" which can be used to read any
interrupt register value from a given sample.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../powerpc/pmu/sampling_tests/misc.c         | 175 ++++++++++++++++++
 .../powerpc/pmu/sampling_tests/misc.h         |   4 +
 2 files changed, 179 insertions(+)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
index fcd139c95971..5712df1bd3c2 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
@@ -2,6 +2,7 @@
 /*
  * Copyright 2022, Athira Rajeev, IBM Corp.
  * Copyright 2022, Madhavan Srinivasan, IBM Corp.
+ * Copyright 2022, Kajol Jain, IBM Corp.
  */
 
 #include <unistd.h>
@@ -330,3 +331,177 @@ void *__event_read_samples(void *sample_buff, size_t *size, u64 *sample_count)
 	}
 	return NULL;
 }
+
+int collect_samples(void *sample_buff)
+{
+	u64 sample_count;
+	size_t size = 0;
+
+	__event_read_samples(sample_buff, &size, &sample_count);
+	return sample_count;
+}
+
+static void *perf_read_first_sample(void *sample_buff, size_t *size)
+{
+	return __event_read_samples(sample_buff, size, NULL);
+}
+
+u64 *get_intr_regs(struct event *event, void *sample_buff)
+{
+	u64 type = event->attr.sample_type;
+	u64 *intr_regs;
+	size_t size = 0;
+
+	if ((type ^ PERF_SAMPLE_REGS_INTR))
+		return NULL;
+
+	intr_regs = (u64 *)perf_read_first_sample(sample_buff, &size);
+	if (!intr_regs)
+		return NULL;
+
+	/*
+	 * First entry in the sample buffer used to specify
+	 * PERF_SAMPLE_REGS_ABI_64, skip perf regs abi to access
+	 * interrupt registers.
+	 */
+	++intr_regs;
+
+	return intr_regs;
+}
+
+static const unsigned int __perf_reg_mask(const char *register_name)
+{
+	if (!strcmp(register_name, "R0"))
+		return 0;
+	else if (!strcmp(register_name, "R1"))
+		return 1;
+	else if (!strcmp(register_name, "R2"))
+		return 2;
+	else if (!strcmp(register_name, "R3"))
+		return 3;
+	else if (!strcmp(register_name, "R4"))
+		return 4;
+	else if (!strcmp(register_name, "R5"))
+		return 5;
+	else if (!strcmp(register_name, "R6"))
+		return 6;
+	else if (!strcmp(register_name, "R7"))
+		return 7;
+	else if (!strcmp(register_name, "R8"))
+		return 8;
+	else if (!strcmp(register_name, "R9"))
+		return 9;
+	else if (!strcmp(register_name, "R10"))
+		return 10;
+	else if (!strcmp(register_name, "R11"))
+		return 11;
+	else if (!strcmp(register_name, "R12"))
+		return 12;
+	else if (!strcmp(register_name, "R13"))
+		return 13;
+	else if (!strcmp(register_name, "R14"))
+		return 14;
+	else if (!strcmp(register_name, "R15"))
+		return 15;
+	else if (!strcmp(register_name, "R16"))
+		return 16;
+	else if (!strcmp(register_name, "R17"))
+		return 17;
+	else if (!strcmp(register_name, "R18"))
+		return 18;
+	else if (!strcmp(register_name, "R19"))
+		return 19;
+	else if (!strcmp(register_name, "R20"))
+		return 20;
+	else if (!strcmp(register_name, "R21"))
+		return 21;
+	else if (!strcmp(register_name, "R22"))
+		return 22;
+	else if (!strcmp(register_name, "R23"))
+		return 23;
+	else if (!strcmp(register_name, "R24"))
+		return 24;
+	else if (!strcmp(register_name, "R25"))
+		return 25;
+	else if (!strcmp(register_name, "R26"))
+		return 26;
+	else if (!strcmp(register_name, "R27"))
+		return 27;
+	else if (!strcmp(register_name, "R28"))
+		return 28;
+	else if (!strcmp(register_name, "R29"))
+		return 29;
+	else if (!strcmp(register_name, "R30"))
+		return 30;
+	else if (!strcmp(register_name, "R31"))
+		return 31;
+	else if (!strcmp(register_name, "NIP"))
+		return 32;
+	else if (!strcmp(register_name, "MSR"))
+		return 33;
+	else if (!strcmp(register_name, "ORIG_R3"))
+		return 34;
+	else if (!strcmp(register_name, "CTR"))
+		return 35;
+	else if (!strcmp(register_name, "LINK"))
+		return 36;
+	else if (!strcmp(register_name, "XER"))
+		return 37;
+	else if (!strcmp(register_name, "CCR"))
+		return 38;
+	else if (!strcmp(register_name, "SOFTE"))
+		return 39;
+	else if (!strcmp(register_name, "TRAP"))
+		return 40;
+	else if (!strcmp(register_name, "DAR"))
+		return 41;
+	else if (!strcmp(register_name, "DSISR"))
+		return 42;
+	else if (!strcmp(register_name, "SIER"))
+		return 43;
+	else if (!strcmp(register_name, "MMCRA"))
+		return 44;
+	else if (!strcmp(register_name, "MMCR0"))
+		return 45;
+	else if (!strcmp(register_name, "MMCR1"))
+		return 46;
+	else if (!strcmp(register_name, "MMCR2"))
+		return 47;
+	else if (!strcmp(register_name, "MMCR3"))
+		return 48;
+	else if (!strcmp(register_name, "SIER2"))
+		return 49;
+	else if (!strcmp(register_name, "SIER3"))
+		return 50;
+	else if (!strcmp(register_name, "PMC1"))
+		return 51;
+	else if (!strcmp(register_name, "PMC2"))
+		return 52;
+	else if (!strcmp(register_name, "PMC3"))
+		return 53;
+	else if (!strcmp(register_name, "PMC4"))
+		return 54;
+	else if (!strcmp(register_name, "PMC5"))
+		return 55;
+	else if (!strcmp(register_name, "PMC6"))
+		return 56;
+	else if (!strcmp(register_name, "SDAR"))
+		return 57;
+	else if (!strcmp(register_name, "SIAR"))
+		return 58;
+	else
+		return -1;
+}
+
+u64 get_reg_value(u64 *intr_regs, char *register_name)
+{
+	int register_bit_position;
+
+	register_bit_position = __perf_reg_mask(register_name);
+
+	if (register_bit_position < 0 || (!((platform_extended_mask >>
+			(register_bit_position - 1)) & 1)))
+		return -1;
+
+	return *(intr_regs + register_bit_position);
+}
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
index 8526c15d4c90..3cfe98716b1e 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
@@ -2,6 +2,7 @@
 /*
  * Copyright 2022, Athira Rajeev, IBM Corp.
  * Copyright 2022, Madhavan Srinivasan, IBM Corp.
+ * Copyright 2022, Kajol Jain, IBM Corp.
  */
 
 #include "../event.h"
@@ -57,3 +58,6 @@ static inline int is_pSeries(void)
 
 void *event_sample_buf_mmap(int fd, int mmap_pages);
 void *__event_read_samples(void *sample_buff, size_t *size, u64 *sample_count);
+int collect_samples(void *sample_buff);
+u64 *get_intr_regs(struct event *event, void *sample_buff);
+u64 get_reg_value(u64 *intr_regs, char *register_name);
-- 
2.27.0

