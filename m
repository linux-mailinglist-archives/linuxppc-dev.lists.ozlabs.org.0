Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E763552E89B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 11:19:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4LlD5jV5z3brk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:19:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FbEgKjVi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FbEgKjVi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Ljx4JPdz2yyM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 19:18:13 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K9Ew3B014187;
 Fri, 20 May 2022 09:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=z8JlJkoOVYyDRlSnXVuarwW7MZ6A9lhK1LXXaHCc4A4=;
 b=FbEgKjViqto66LtMHzsgE78OSRh/VKsNq/F1QH8IKxZXo9wPW6f88qoQc7RH9jDJyz3A
 eY2Brc1lNvc3iFBuFuSjqA1zRclCmk6GzxsirJQ5W2kkYh214Vo9MRa+z2T7MH7YJnpe
 X0Z6TguBRcYeT6OtgkOFyd7gPOLfZPuELvx7cYjKJ61kY5dlY6+NuD5c9aVdLQdcvPkL
 aqsm5Ewsx4QMHHJwkiyksUfWuz2dkCN8qHhExUZ6M5xWBXPc1VrlfK33Sz0o/pgZzx2m
 5xWBsLzH64wmzo7LowCtUbpSaHEB1RZjyjFQB+RpZwWHqI8lGPtked/4e13hVSeUhQG7 QQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g686c0181-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:18:08 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K9Ex0U013201;
 Fri, 20 May 2022 09:18:06 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3g2428ybq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:18:06 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24K9I31335783130
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 09:18:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E27654C044;
 Fri, 20 May 2022 09:18:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D17034C040;
 Fri, 20 May 2022 09:17:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 09:17:59 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 01/35] selftest/powerpc/pmu: Add mask/shift bits for
 extracting threshold compare field
Date: Fri, 20 May 2022 14:47:17 +0530
Message-Id: <20220520091751.17000-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
References: <20220520091751.17000-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hQET1Hz6Acxc62i4tArnjzq8fYzDe_aj
X-Proofpoint-GUID: hQET1Hz6Acxc62i4tArnjzq8fYzDe_aj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-19_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200066
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kajol Jain <kjain@linux.ibm.com>

In power10, threshold compare field is not part of the raw
event code and provided via event attribute config1.
Hence add the mask and shift bits based on event attribute
config1, to extract the threshold compare value for power10

Also add a new function called get_thresh_cmp_val to compute
and return the threshold compare field for a given platform,
since incase of power10, threshold compare value provided
is decimal.

Signed-off-by: Kajol Jain<kjain@linux.ibm.com>
---
 .../powerpc/pmu/sampling_tests/misc.c         | 44 +++++++++++++++++++
 .../powerpc/pmu/sampling_tests/misc.h         |  1 +
 2 files changed, 45 insertions(+)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
index c01a31d5f4ee..b984d1e162ac 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
@@ -60,6 +60,8 @@ static void init_ev_encodes(void)
 
 	switch (pvr) {
 	case POWER10:
+		ev_mask_thd_cmp = 0x3ffff;
+		ev_shift_thd_cmp = 0;
 		ev_mask_rsq = 1;
 		ev_shift_rsq = 9;
 		ev_mask_comb = 3;
@@ -410,3 +412,45 @@ u64 get_reg_value(u64 *intr_regs, char *register_name)
 
 	return *(intr_regs + register_bit_position);
 }
+
+int get_thresh_cmp_val(struct event event)
+{
+	int exp = 0;
+	u64 result = 0;
+	u64 value;
+
+	if (!have_hwcap2(PPC_FEATURE2_ARCH_3_1))
+		return EV_CODE_EXTRACT(event.attr.config, thd_cmp);
+
+	value = EV_CODE_EXTRACT(event.attr.config1, thd_cmp);
+
+	if (!value)
+		return value;
+
+	/*
+	 * Incase of P10, thresh_cmp value is not part of raw event code
+	 * and provided via attr.config1 parameter. To program threshold in MMCRA,
+	 * take a 18 bit number N and shift right 2 places and increment
+	 * the exponent E by 1 until the upper 10 bits of N are zero.
+	 * Write E to the threshold exponent and write the lower 8 bits of N
+	 * to the threshold mantissa.
+	 * The max threshold that can be written is 261120.
+	 */
+	if (value > 261120)
+		value = 261120;
+	while ((64 - __builtin_clzl(value)) > 8) {
+		exp++;
+		value >>= 2;
+	}
+
+	/*
+	 * Note that it is invalid to write a mantissa with the
+	 * upper 2 bits of mantissa being zero, unless the
+	 * exponent is also zero.
+	 */
+	if (!(value & 0xC0) && exp)
+		result = -1;
+	else
+		result = (exp << 8) | value;
+	return result;
+}
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
index 7675f3177725..078120883fde 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
@@ -52,6 +52,7 @@ void *__event_read_samples(void *sample_buff, size_t *size, u64 *sample_count);
 int collect_samples(void *sample_buff);
 u64 *get_intr_regs(struct event *event, void *sample_buff);
 u64 get_reg_value(u64 *intr_regs, char *register_name);
+int get_thresh_cmp_val(struct event event);
 
 static inline int get_mmcr0_fc56(u64 mmcr0, int pmc)
 {
-- 
2.35.1

