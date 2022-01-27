Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFCB49DB69
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:26:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JksbC1tknz3cTs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:26:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IchShwi9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IchShwi9; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksT91GZXz3bZY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:21:16 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R7CaOs001994; 
 Thu, 27 Jan 2022 07:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cPWze1VAPgkwDl7TG+DCuuPvQCowx++9b9K3NLVhYBY=;
 b=IchShwi9actTXEGlmgA1vMt3jLkpjdFllZUAqbdJg0w16aeu2a1ShMgY6nTGuu08xA/H
 wTzYQlPadEcWwkOAT3ZP1TPfApd7xNeXOiYEP891/CNnQCwL2ZnrbM/5dwdhoeQ+3mf3
 S0WBEEMHEAJALHrLHXY7wqsO4eoQ1FsOpZqgudcDTeEzFAIWQXqb3RMMleM0RTjqdLgy
 OJds6uJdEhjy/tZ6K+FyDdk6mVyr0xOTYNKOSFY8UQfs8dby1FiHTnBx+5d+w039DxJG
 jO0NpHJvFb2nJWCJmdMkvmSLcOloq+V/qFJ/E3LP5f74RIeDvWkRG8X1TYhYdfrltzR/ 1w== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dupt0058m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:11 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20R78JuW021659;
 Thu, 27 Jan 2022 07:21:10 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3dr9j9mpb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:10 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20R7L71V43188568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 07:21:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0BA442047;
 Thu, 27 Jan 2022 07:21:06 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90A874204C;
 Thu, 27 Jan 2022 07:21:04 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.106.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 07:21:04 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 07/20] selftest/powerpc/pmu: Add macro to extract mmcr0/mmcr1
 fields
Date: Thu, 27 Jan 2022 12:49:59 +0530
Message-Id: <20220127072012.662451-8-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127072012.662451-1-kjain@linux.ibm.com>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pE5spmSqJsqL-rJHtPO0XjixAVIehzP_
X-Proofpoint-ORIG-GUID: pE5spmSqJsqL-rJHtPO0XjixAVIehzP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_02,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Add macro and utility functions to fetch individual
fields from Monitor Mode Control Register 0(MMCR0) and
Monitor Mode Control Register 1(MMCR1) PMU register.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../powerpc/pmu/sampling_tests/misc.h         | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
index 0f5446b56463..fea029506aa3 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
@@ -12,6 +12,10 @@
 #define PERF_POWER9_MASK        0x7f8ffffffffffff
 #define PERF_POWER10_MASK       0x7ffffffffffffff
 
+#define MMCR0_FC56      0x00000010UL /* freeze counters 5 and 6 */
+#define MMCR0_PMCCEXT   0x00000200UL /* PMCCEXT control */
+#define MMCR1_RSQ       0x200000000000ULL /* radix scope qual field */
+
 extern int ev_mask_pmcxsel, ev_shift_pmcxsel;
 extern int ev_mask_marked, ev_shift_marked;
 extern int ev_mask_comb, ev_shift_comb;
@@ -62,6 +66,66 @@ int collect_samples(void *sample_buff);
 u64 *get_intr_regs(struct event *event, void *sample_buff);
 u64 get_reg_value(u64 *intr_regs, char *register_name);
 
+static inline int get_mmcr0_fc56(u64 mmcr0, int pmc)
+{
+	return (mmcr0 & MMCR0_FC56);
+}
+
+static inline int get_mmcr0_pmccext(u64 mmcr0, int pmc)
+{
+	return (mmcr0 & MMCR0_PMCCEXT);
+}
+
+static inline int get_mmcr0_pmao(u64 mmcr0, int pmc)
+{
+	return ((mmcr0 >> 7) & 0x1);
+}
+
+static inline int get_mmcr0_cc56run(u64 mmcr0, int pmc)
+{
+	return ((mmcr0 >> 8) & 0x1);
+}
+
+static inline int get_mmcr0_pmcjce(u64 mmcr0, int pmc)
+{
+	return ((mmcr0 >> 14) & 0x1);
+}
+
+static inline int get_mmcr0_pmc1ce(u64 mmcr0, int pmc)
+{
+	return ((mmcr0 >> 15) & 0x1);
+}
+
+static inline int get_mmcr0_pmae(u64 mmcr0, int pmc)
+{
+	return ((mmcr0 >> 27) & 0x1);
+}
+
+static inline int get_mmcr1_pmcxsel(u64 mmcr1, int pmc)
+{
+	return ((mmcr1 >> ((24 - (((pmc) - 1) * 8))) & 0xff));
+}
+
+static inline int get_mmcr1_unit(u64 mmcr1, int pmc)
+{
+	return ((mmcr1 >> ((60 - (4 * ((pmc) - 1))))) & 0xf);
+}
+
+static inline int get_mmcr1_comb(u64 mmcr1, int pmc)
+{
+	return ((mmcr1 >> (38 - ((pmc - 1) * 2))) & 0x3);
+}
+
+static inline int get_mmcr1_cache(u64 mmcr1, int pmc)
+{
+	return ((mmcr1 >> 46) & 0x3);
+}
+
+static inline int get_mmcr1_rsq(u64 mmcr1, int pmc)
+{
+	return mmcr1 & MMCR1_RSQ;
+}
+
 static inline int get_mmcr2_fcs(u64 mmcr2, int pmc)
 {
 	return ((mmcr2 & (1ull << (63 - (((pmc) - 1) * 9)))) >> (63 - (((pmc) - 1) * 9)));
@@ -114,6 +178,8 @@ static inline int get_mmcr2_l2l3(u64 mmcr2, int pmc)
 	return 0;
 }
 
+#define GET_MMCR0(a, b, c)        get_mmcr0_##c(a, b)
+#define GET_MMCR1(a, b, c)        get_mmcr1_##c(a, b)
 #define GET_MMCR2(a, b, c)        get_mmcr2_##c(a, b)
 
 /*
-- 
2.27.0

