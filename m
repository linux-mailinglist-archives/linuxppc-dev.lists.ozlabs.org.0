Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4532B123E94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 05:35:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d2HJ3VB1zDqXd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 15:35:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d2BT6MCCzDqQh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 15:30:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47d2BT2wjpz8wL6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 15:30:57 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47d2BT2MV4z9sRc; Wed, 18 Dec 2019 15:30:57 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sukadev@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47d2BS48FMz9sR4;
 Wed, 18 Dec 2019 15:30:56 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBI4MOZr137169; Tue, 17 Dec 2019 23:30:51 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wy9vyw4u7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 23:30:51 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBI4UVBD012923;
 Wed, 18 Dec 2019 04:30:51 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 2wvqc6j7b0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 04:30:51 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBI4Uomr15074048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 04:30:50 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AEBDB2068;
 Wed, 18 Dec 2019 04:30:50 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8523B205F;
 Wed, 18 Dec 2019 04:30:49 +0000 (GMT)
Received: from suka-w540.usor.ibm.com (unknown [9.70.94.45])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 18 Dec 2019 04:30:49 +0000 (GMT)
From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@ozlabs.org>, 
 linuxram@us.ibm.com
Subject: [PATCH 2/2] powerpc/pseries/svm: Disable PMUs in SVMs
Date: Tue, 17 Dec 2019 20:30:48 -0800
Message-Id: <20191218043048.3400-2-sukadev@linux.ibm.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191218043048.3400-1-sukadev@linux.ibm.com>
References: <20191218043048.3400-1-sukadev@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-17_05:2019-12-17,2019-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912180033
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
Cc: linuxppc-dev@ozlabs.org, andmike@linux.ibm.com, kvm-ppc@vger.kernel.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For now, disable hardware PMU facilities in secure virtual
machines (SVMs) to prevent any information leak between SVMs
and the (untrusted) HV.

With this, a simple 'myperf' program that uses the perf_event_open()
fails for SVMs (with the corresponding fix to UV). In normal VMs and
on the bare-metal HV the syscall and performance counters work

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
---
 arch/powerpc/kernel/cpu_setup_power.S | 22 ++++++++++++++++++++++
 arch/powerpc/perf/core-book3s.c       |  6 ++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/cpu_setup_power.S
index a460298c7ddb..d5eb06e20b5a 100644
--- a/arch/powerpc/kernel/cpu_setup_power.S
+++ b/arch/powerpc/kernel/cpu_setup_power.S
@@ -206,14 +206,36 @@ __init_PMU_HV_ISA207:
 	blr
 
 __init_PMU:
+#ifdef CONFIG_PPC_SVM
+	/*
+	 * For now, SVM's are restricted from accessing PMU
+	 * features, so skip accordingly.
+	 */
+	mfmsr	r5
+	rldicl	r5, r5, 64-MSR_S_LG, 62
+	cmpwi	r5,1
+	beq	skip1
+#endif
 	li	r5,0
 	mtspr	SPRN_MMCRA,r5
 	mtspr	SPRN_MMCR0,r5
 	mtspr	SPRN_MMCR1,r5
 	mtspr	SPRN_MMCR2,r5
+skip1:
 	blr
 
 __init_PMU_ISA207:
+#ifdef CONFIG_PPC_SVM
+	/*
+	 * For now, SVM's are restricted from accessing PMU
+	 * features, so skip accordingly.
+	 */
+	mfmsr	r5
+	rldicl	r5, r5, 64-MSR_S_LG, 62
+	cmpwi	r5,1
+	beq	skip2
+#endif
 	li	r5,0
 	mtspr	SPRN_MMCRS,r5
+skip2:
 	blr
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 4e76b2251801..9e6a9f1803f6 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2275,6 +2275,12 @@ static int power_pmu_prepare_cpu(unsigned int cpu)
 
 int register_power_pmu(struct power_pmu *pmu)
 {
+	/*
+	 * PMU events are not currently supported in SVMs
+	 */
+	if (is_secure_guest())
+		return -ENOSYS;
+
 	if (ppmu)
 		return -EBUSY;		/* something's already registered */
 
-- 
2.17.2

