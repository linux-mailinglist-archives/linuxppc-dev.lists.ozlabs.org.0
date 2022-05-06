Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCC051D3A4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvkhg44S3z3cNj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 18:47:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nz50FcOm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Nz50FcOm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvkgL2pLBz3brq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 18:46:06 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2468GfkK039965;
 Fri, 6 May 2022 08:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bDALIaC25ztSPb/nwdpjeP2lK2ngU/twHKrNi1MuyO8=;
 b=Nz50FcOm+fHccT+JVHttFdVvS/sYsmB6wlutoDic4ijf0b8a+rWxUqZXyJf8+pc22yp5
 2EDadqeXFB779IfnZttMGpDdZawWPoLlAknviPW4E4Ucx4tlYeQA/JxYfA8O/SiAcqpw
 oRkCc1b1VBtkE3XdbDb9rBXxx1Lm6cjmt7ZxCIKmpA5AtQ0JVGtQSmtffkMRpkaiGMYG
 la2QdVg915g5HvB9XccCTPVhObIPoL03kb8oZL2acjhcA2LRUPC9HRGBTkZXoNikryQc
 InO66uOrIHyzwU6KzS/mongva6xQ6kB0h6RxgTJZrOJJgEBFmxCpcarZs2gpk/mGoLR9 tw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw0178g8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:46:02 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2468hM2g025085;
 Fri, 6 May 2022 08:45:59 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3ftp7fw6y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:45:59 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2468jusp52167050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 08:45:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A56AC4C046;
 Fri,  6 May 2022 08:45:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8926C4C040;
 Fri,  6 May 2022 08:45:54 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 08:45:54 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/35] selftest/powerpc/pmu: Add mask/shift bits for
 extracting threshold compare field
Date: Fri,  6 May 2022 14:15:10 +0530
Message-Id: <20220506084544.56527-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Zumr3CxGnsAjx9PG6TdwuHd3tvyj5WiP
X-Proofpoint-ORIG-GUID: Zumr3CxGnsAjx9PG6TdwuHd3tvyj5WiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_03,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060045
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
index fca054bbc094..1afcd98f6036 100644
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
2.31.1

