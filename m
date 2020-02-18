Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4531626CD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 14:08:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MLl73VgHzDqdG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 00:08:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MLTY0kjmzDqjG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 23:56:48 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01ICsDiH128494
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 07:56:46 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y6dntp7tn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 07:56:46 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <maddy@linux.ibm.com>;
 Tue, 18 Feb 2020 12:56:45 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Feb 2020 12:56:43 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01ICufsA27787356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Feb 2020 12:56:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B46D54C04A;
 Tue, 18 Feb 2020 12:56:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE5AA4C044;
 Tue, 18 Feb 2020 12:56:40 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.31.118])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Feb 2020 12:56:40 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 2/2] powerpc/perf: Check pmus_inuse flag in
 perf_event_print_debug()
Date: Tue, 18 Feb 2020 18:26:31 +0530
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218125631.19692-1-maddy@linux.ibm.com>
References: <20200218125631.19692-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20021812-0020-0000-0000-000003AB472D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021812-0021-0000-0000-00002203425E
Message-Id: <20200218125631.19692-2-maddy@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_02:2020-02-17,
 2020-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=960 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=1 mlxscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002180103
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

pmu_inuse flag is part of lppaca struct which notifies the hypervisor
whether guest/partition is using PMUs. This provides a hint for
save/restore of PMU registers. Currently perf_event_print_debug()
does not check for pmu_inuse flag and it is not safe to use it to
dump PMU SPRs in a CONFIG_PSERIES.

Patch adds two things here. 1) An inline ppc_get_pmu_inuse() to get
the pmu_inuse value and 2)check in perf_event_print_debug() before
dumping the PMU SPRs.

ppc_get_pmu_inuse() is based on ppc_set_pmu_inuse() and includes same
CONFIG_ checks.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
- Fixed pmac32_deconfig build break 
- Fixed errors reported by checkpatch.pl

 arch/powerpc/include/asm/pmc.h  | 15 +++++++++++++++
 arch/powerpc/perf/core-book3s.c |  9 +++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/powerpc/include/asm/pmc.h b/arch/powerpc/include/asm/pmc.h
index c6bbe9778d3c..600c133b49cd 100644
--- a/arch/powerpc/include/asm/pmc.h
+++ b/arch/powerpc/include/asm/pmc.h
@@ -34,11 +34,26 @@ static inline void ppc_set_pmu_inuse(int inuse)
 #endif
 }
 
+static inline u8 ppc_get_pmu_inuse(void)
+{
+#if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE)
+	if (firmware_has_feature(FW_FEATURE_LPAR)) {
+#ifdef CONFIG_PPC_PSERIES
+		return get_lppaca()->pmcregs_in_use;
+#endif
+	}
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	return get_paca()->pmcregs_in_use;
+#endif
+#endif
+}
+
 extern void power4_enable_pmcs(void);
 
 #else /* CONFIG_PPC64 */
 
 static inline void ppc_set_pmu_inuse(int inuse) { }
+static inline u8 ppc_get_pmu_inuse(void) { return 0; }
 
 #endif
 
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 6e35bf9ff80a..61d4a290b336 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -808,6 +808,15 @@ void perf_event_print_debug(void)
 	if (!ppmu->n_counter)
 		return;
 
+	/*
+	 * Check pmu_inuse flag. As per PAPR spec, hypersivor
+	 * will save/restore the PMU regs only if pmu_inuse is
+	 * set. If its not enable, values dumped from these SPRs
+	 * may not be valid or useful.
+	 */
+	if (!ppc_get_pmu_inuse())
+		return;
+
 	local_irq_save(flags);
 
 	pr_info("CPU: %d PMU registers, ppmu = %s n_counters = %d",
-- 
2.21.1

