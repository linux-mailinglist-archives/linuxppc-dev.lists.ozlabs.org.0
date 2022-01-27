Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 390E749DB67
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:25:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JksZH11msz3cTZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:25:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NVFQh63h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NVFQh63h; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksT55D24z3bV8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:21:13 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R7COuT017334; 
 Thu, 27 Jan 2022 07:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=i+5D2Hcog1PkMw75IYyWMORx1aN5xyxqkfytCe0F8cM=;
 b=NVFQh63hVj4TcbhfW7S0TIim5UT+I894TA6hVlTxylRFqlFRhTars8t92TMfSZlBmNjZ
 Et5g5/mgX2CbCyYjvDvYy4+xYHZx6m7nmOd9ahoQZRbGHahJ2nZFLsMfE8Fv90XsFoOw
 4zuNVKVD35KFsY/Q+bOHvK3HFvUBd2pzOkdqvIuL1tx6unsDHVLpWimUVewt3DK+GRFv
 eet66M+tDw25H/yChpMvz1X78jKZKBxYUORhEmCzBns6YdkStv4hwYXqK4bXzohse00K
 YJs3sMTAqXYlKF0EKGqbEBAwb/N3hAy9z9zV72c9YEMxX/a8BhbUKNN7kkrKvJ5nSMBh lw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dupsug5s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:09 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20R781EU016000;
 Thu, 27 Jan 2022 07:21:07 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3dr9j9mn44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:07 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20R7L4J944957994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 07:21:04 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E930A42041;
 Thu, 27 Jan 2022 07:21:03 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8905B42045;
 Thu, 27 Jan 2022 07:21:01 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.106.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 07:21:01 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 06/20] selftest/powerpc/pmu: Add macros to extract mmcr fields
Date: Thu, 27 Jan 2022 12:49:58 +0530
Message-Id: <20220127072012.662451-7-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127072012.662451-1-kjain@linux.ibm.com>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n3bYXR2qnWqxZDfNyXTJu--vk2RGj6id
X-Proofpoint-ORIG-GUID: n3bYXR2qnWqxZDfNyXTJu--vk2RGj6id
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_02,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: atrajeev@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com,
 maddy@linux.vnet.ibm.com, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.ibm.com>

Generic macro (GET_MMCR_FIELD) added to extract specific fields of
a given MMCRx. Along with it, patch also adds macro and utility
functions to fetch individual fields from
Monitor Mode Control Register 2(MMCR2) register.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 .../powerpc/pmu/sampling_tests/misc.h         | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
index 3cfe98716b1e..0f5446b56463 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
@@ -61,3 +61,73 @@ void *__event_read_samples(void *sample_buff, size_t *size, u64 *sample_count);
 int collect_samples(void *sample_buff);
 u64 *get_intr_regs(struct event *event, void *sample_buff);
 u64 get_reg_value(u64 *intr_regs, char *register_name);
+
+static inline int get_mmcr2_fcs(u64 mmcr2, int pmc)
+{
+	return ((mmcr2 & (1ull << (63 - (((pmc) - 1) * 9)))) >> (63 - (((pmc) - 1) * 9)));
+}
+
+static inline int get_mmcr2_fcp(u64 mmcr2, int pmc)
+{
+	return ((mmcr2 & (1ull << (62 - (((pmc) - 1) * 9)))) >> (62 - (((pmc) - 1) * 9)));
+}
+
+static inline int get_mmcr2_fcpc(u64 mmcr2, int pmc)
+{
+	return ((mmcr2 & (1ull << (61 - (((pmc) - 1) * 9)))) >> (61 - (((pmc) - 1) * 9)));
+}
+
+static inline int get_mmcr2_fcm1(u64 mmcr2, int pmc)
+{
+	return ((mmcr2 & (1ull << (60 - (((pmc) - 1) * 9)))) >> (60 - (((pmc) - 1) * 9)));
+}
+
+static inline int get_mmcr2_fcm0(u64 mmcr2, int pmc)
+{
+	return ((mmcr2 & (1ull << (59 - (((pmc) - 1) * 9)))) >> (59 - (((pmc) - 1) * 9)));
+}
+
+static inline int get_mmcr2_fcwait(u64 mmcr2, int pmc)
+{
+	return ((mmcr2 & (1ull << (58 - (((pmc) - 1) * 9)))) >> (58 - (((pmc) - 1) * 9)));
+}
+
+static inline int get_mmcr2_fch(u64 mmcr2, int pmc)
+{
+	return ((mmcr2 & (1ull << (57 - (((pmc) - 1) * 9)))) >> (57 - (((pmc) - 1) * 9)));
+}
+
+static inline int get_mmcr2_fcti(u64 mmcr2, int pmc)
+{
+	return ((mmcr2 & (1ull << (56 - (((pmc) - 1) * 9)))) >> (56 - (((pmc) - 1) * 9)));
+}
+
+static inline int get_mmcr2_fcta(u64 mmcr2, int pmc)
+{
+	return ((mmcr2 & (1ull << (55 - (((pmc) - 1) * 9)))) >> (55 - (((pmc) - 1) * 9)));
+}
+
+static inline int get_mmcr2_l2l3(u64 mmcr2, int pmc)
+{
+	if (pvr == POWER10)
+		return ((mmcr2 & 0xf8) >> 3);
+	return 0;
+}
+
+#define GET_MMCR2(a, b, c)        get_mmcr2_##c(a, b)
+
+/*
+ * Generic MMCR macro to get specific field value
+ * from a specific MMCR.
+ *
+ * Input:
+ * 'x'  -       MMCRx
+ * 'a'  -       u64
+ * 'b'  -       PMC#
+ * 'c'  -       Field#
+ *
+ * Output:
+ * u32
+ */
+#define GET_MMCR_FIELD(x, a, b, c) \
+	GET_MMCR##x(a, b, c)
-- 
2.27.0

