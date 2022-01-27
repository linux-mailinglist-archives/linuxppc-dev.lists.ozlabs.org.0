Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BE349DB6A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:27:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jksc016pyz3cYJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:27:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aBKZydcy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aBKZydcy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JksTC38Y5z3bV2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:21:19 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R7AkH5018073; 
 Thu, 27 Jan 2022 07:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sdbjQM/LOxrgQ9vZfpegywbfRpyYFHn4FyeAyeQd4d4=;
 b=aBKZydcyWZCiRBOxrCaBdgT5ywNjEguadbjHdU8ey4sJZ30Q73NPMPbH8NlBjMtOebaz
 avYSMksc58mWXqqOw/gXQV1mcYLxKVF3/w1DFCmE67iw4nfwkfQRXdsuDS9dD0p5UVZu
 k1lCKgvI1BF495cOujUwq1+wxjeNABiGw7IbVGSbtwlb3gMbZHougZAzWhjXhZHu+Bmf
 AIRSwy3WfVtkPXxufphIxM/cHI2ds1wqAbnBQrkx3818zj4PYkh0+5lkJ+UjPWyT/4/U
 d34AkTIMfaoN3wmEiOlop09tFGUd6wzoH9gADMTU1I3zKpEu0AX7s32b40edW0AiBIlw fg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dupc3gjac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:14 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20R77s1P027674;
 Thu, 27 Jan 2022 07:21:12 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3dr9j9jn30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 07:21:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20R7L9FY40829198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 07:21:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 877F442041;
 Thu, 27 Jan 2022 07:21:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EBFB42049;
 Thu, 27 Jan 2022 07:21:07 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.106.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 07:21:07 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 08/20] selftest/powerpc/pmu: Add macro to extract mmcr3 and
 mmcra fields
Date: Thu, 27 Jan 2022 12:50:00 +0530
Message-Id: <20220127072012.662451-9-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127072012.662451-1-kjain@linux.ibm.com>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: M55II3jlCBmm0ySOCzhuFj5ct8oxTgP9
X-Proofpoint-GUID: M55II3jlCBmm0ySOCzhuFj5ct8oxTgP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_02,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201270040
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

Add macro and utility functions to fetch individual
fields from Monitor Mode Control Register 3(MMCR3)and
Monitor Mode Control Register A(MMCRA) PMU registers

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../powerpc/pmu/sampling_tests/misc.h         | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
index fea029506aa3..b4995d4e6588 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.h
@@ -15,6 +15,7 @@
 #define MMCR0_FC56      0x00000010UL /* freeze counters 5 and 6 */
 #define MMCR0_PMCCEXT   0x00000200UL /* PMCCEXT control */
 #define MMCR1_RSQ       0x200000000000ULL /* radix scope qual field */
+#define BHRB_DISABLE    0x2000000000ULL /* MMCRA BHRB DISABLE bit */
 
 extern int ev_mask_pmcxsel, ev_shift_pmcxsel;
 extern int ev_mask_marked, ev_shift_marked;
@@ -178,9 +179,72 @@ static inline int get_mmcr2_l2l3(u64 mmcr2, int pmc)
 	return 0;
 }
 
+static inline int get_mmcr3_src(u64 mmcr3, int pmc)
+{
+	if (pvr != POWER10)
+		return 0;
+	return ((mmcr3 >> ((49 - (15 * ((pmc) - 1))))) & 0x7fff);
+}
+
+static inline int get_mmcra_thd_cmp(u64 mmcra, int pmc)
+{
+	if (pvr == POWER10)
+		return ((mmcra >> 45) & 0x7ff);
+	return ((mmcra >> 45) & 0x3ff);
+}
+
+static inline int get_mmcra_sm(u64 mmcra, int pmc)
+{
+	return ((mmcra >> 42) & 0x3);
+}
+
+static inline int get_mmcra_bhrb_disable(u64 mmcra, int pmc)
+{
+	if (pvr == POWER10)
+		return mmcra & BHRB_DISABLE;
+	return 0;
+}
+
+static inline int get_mmcra_ifm(u64 mmcra, int pmc)
+{
+	return ((mmcra >> 30) & 0x3);
+}
+
+static inline int get_mmcra_thd_sel(u64 mmcra, int pmc)
+{
+	return ((mmcra >> 16) & 0x7);
+}
+
+static inline int get_mmcra_thd_start(u64 mmcra, int pmc)
+{
+	return ((mmcra >> 12) & 0xf);
+}
+
+static inline int get_mmcra_thd_stop(u64 mmcra, int pmc)
+{
+	return ((mmcra >> 8) & 0xf);
+}
+
+static inline int get_mmcra_rand_samp_elig(u64 mmcra, int pmc)
+{
+	return ((mmcra >> 4) & 0x7);
+}
+
+static inline int get_mmcra_sample_mode(u64 mmcra, int pmc)
+{
+	return ((mmcra >> 1) & 0x3);
+}
+
+static inline int get_mmcra_marked(u64 mmcra, int pmc)
+{
+	return mmcra & 0x1;
+}
+
 #define GET_MMCR0(a, b, c)        get_mmcr0_##c(a, b)
 #define GET_MMCR1(a, b, c)        get_mmcr1_##c(a, b)
 #define GET_MMCR2(a, b, c)        get_mmcr2_##c(a, b)
+#define GET_MMCR3(a, b, c)        get_mmcr3_##c(a, b)
+#define GET_MMCRA(a, b, c)        get_mmcra_##c(a, b)
 
 /*
  * Generic MMCR macro to get specific field value
-- 
2.27.0

