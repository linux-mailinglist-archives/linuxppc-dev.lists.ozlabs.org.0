Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD065130EFF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 09:56:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rqBR3t5qzDqDp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 19:56:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rq874fqjzDqDJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2020 19:54:43 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0068qwNT163717
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 6 Jan 2020 03:54:40 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xb8wwk9b9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jan 2020 03:54:40 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Mon, 6 Jan 2020 08:54:38 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 Jan 2020 08:54:36 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0068sZr042729720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jan 2020 08:54:35 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C28F42047;
 Mon,  6 Jan 2020 08:54:35 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4606B42049;
 Mon,  6 Jan 2020 08:54:34 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.61])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jan 2020 08:54:34 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3] powerpc/kernel/sysfs: Add new config option PMU_SYSFS to
 enable PMU SPRs sysfs file creation
Date: Mon,  6 Jan 2020 14:24:23 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20010608-4275-0000-0000-0000039501A4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010608-4276-0000-0000-000038A8E9D2
Message-Id: <20200106085423.13928-1-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_02:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001060081
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
Cc: kjain@linux.ibm.com, anju@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Many of the performance moniroting unit (PMU) SPRs are
exposed in the sysfs. This may not be a desirable since
"perf" API is the primary interface to program PMU and
collect counter data in the system. But that said, we
cant remove these sysfs files since we dont whether
anyone/anything is using them.

So the patch adds a new CONFIG option 'CONFIG_PMU_SYSFS'
(user selectable) to be used in sysfs file creation for
PMU SPRs. New option by default is disabled, but can be
enabled if user needs it.

Tested this patch behaviour in powernv and pseries machines.
Also did compilation testing for different architecture include:
x86, mips, mips64, alpha, arm. Patch is also compile tested for
pmac32_defconfig.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/kernel/sysfs.c            | 22 +++++++++++++---------
 arch/powerpc/platforms/Kconfig.cputype |  6 ++++++
 2 files changed, 19 insertions(+), 9 deletions(-)

---
Changelog:
v2 -> v3
- Make 'PMU_SYSFS' config option a user selectable option
  and remove its dependency on 'PERF_EVENTS' option.
- Add PMU_SYSFS config check at time of register/unregister
  PMU SPRs.
- Replace #ifdefs with IS_ENABLE while registering/unregistering
  PMU SPRs.

Resend v2
        Added 'Reviewed-by' and 'Tested-by' tag along with test scenarios.

v1 -> v2
- Added new config option 'PMU_SYSFS' for PMU SPR's creation
  rather than using PERF_EVENTS config option directly and make
  sure SPR's file creation only if 'CONFIG_PERF_EVENTS' disabled.
---
diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 80a676da11cb..d4faa60f1d27 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -606,12 +606,14 @@ static void sysfs_create_dscr_default(void)
 #endif /* CONFIG_PPC64 */
 
 #ifdef HAS_PPC_PMC_PA6T
+#ifdef CONFIG_PMU_SYSFS
 SYSFS_PMCSETUP(pa6t_pmc0, SPRN_PA6T_PMC0);
 SYSFS_PMCSETUP(pa6t_pmc1, SPRN_PA6T_PMC1);
 SYSFS_PMCSETUP(pa6t_pmc2, SPRN_PA6T_PMC2);
 SYSFS_PMCSETUP(pa6t_pmc3, SPRN_PA6T_PMC3);
 SYSFS_PMCSETUP(pa6t_pmc4, SPRN_PA6T_PMC4);
 SYSFS_PMCSETUP(pa6t_pmc5, SPRN_PA6T_PMC5);
+#endif /* CONFIG_PMU_SYSFS */
 #ifdef CONFIG_DEBUG_MISC
 SYSFS_SPRSETUP(hid0, SPRN_HID0);
 SYSFS_SPRSETUP(hid1, SPRN_HID1);
@@ -645,21 +647,21 @@ SYSFS_SPRSETUP(tsr3, SPRN_PA6T_TSR3);
 #endif /* HAS_PPC_PMC_PA6T */
 
 #ifdef HAS_PPC_PMC_IBM
-static struct device_attribute ibm_common_attrs[] = {
+static  __maybe_unused struct device_attribute ibm_common_attrs[] = {
 	__ATTR(mmcr0, 0600, show_mmcr0, store_mmcr0),
 	__ATTR(mmcr1, 0600, show_mmcr1, store_mmcr1),
 };
 #endif /* HAS_PPC_PMC_G4 */
 
 #ifdef HAS_PPC_PMC_G4
-static struct device_attribute g4_common_attrs[] = {
+static  __maybe_unused struct device_attribute g4_common_attrs[] = {
 	__ATTR(mmcr0, 0600, show_mmcr0, store_mmcr0),
 	__ATTR(mmcr1, 0600, show_mmcr1, store_mmcr1),
 	__ATTR(mmcr2, 0600, show_mmcr2, store_mmcr2),
 };
 #endif /* HAS_PPC_PMC_G4 */
 
-static struct device_attribute classic_pmc_attrs[] = {
+static  __maybe_unused struct device_attribute classic_pmc_attrs[] = {
 	__ATTR(pmc1, 0600, show_pmc1, store_pmc1),
 	__ATTR(pmc2, 0600, show_pmc2, store_pmc2),
 	__ATTR(pmc3, 0600, show_pmc3, store_pmc3),
@@ -674,6 +676,7 @@ static struct device_attribute classic_pmc_attrs[] = {
 
 #ifdef HAS_PPC_PMC_PA6T
 static struct device_attribute pa6t_attrs[] = {
+#ifdef CONFIG_PMU_SYSFS
 	__ATTR(mmcr0, 0600, show_mmcr0, store_mmcr0),
 	__ATTR(mmcr1, 0600, show_mmcr1, store_mmcr1),
 	__ATTR(pmc0, 0600, show_pa6t_pmc0, store_pa6t_pmc0),
@@ -682,6 +685,7 @@ static struct device_attribute pa6t_attrs[] = {
 	__ATTR(pmc3, 0600, show_pa6t_pmc3, store_pa6t_pmc3),
 	__ATTR(pmc4, 0600, show_pa6t_pmc4, store_pa6t_pmc4),
 	__ATTR(pmc5, 0600, show_pa6t_pmc5, store_pa6t_pmc5),
+#endif /* CONFIG_PMU_SYSFS */
 #ifdef CONFIG_DEBUG_MISC
 	__ATTR(hid0, 0600, show_hid0, store_hid0),
 	__ATTR(hid1, 0600, show_hid1, store_hid1),
@@ -751,13 +755,12 @@ static int register_cpu_online(unsigned int cpu)
 
 	/* PMC stuff */
 	switch (cur_cpu_spec->pmc_type) {
-#ifdef HAS_PPC_PMC_IBM
+#ifdef CONFIG_PMU_SYSFS
 	case PPC_PMC_IBM:
 		attrs = ibm_common_attrs;
 		nattrs = sizeof(ibm_common_attrs) / sizeof(struct device_attribute);
 		pmc_attrs = classic_pmc_attrs;
 		break;
-#endif /* HAS_PPC_PMC_IBM */
 #ifdef HAS_PPC_PMC_G4
 	case PPC_PMC_G4:
 		attrs = g4_common_attrs;
@@ -765,6 +768,7 @@ static int register_cpu_online(unsigned int cpu)
 		pmc_attrs = classic_pmc_attrs;
 		break;
 #endif /* HAS_PPC_PMC_G4 */
+#endif /* CONFIG_PMU_SYSFS */
 #ifdef HAS_PPC_PMC_PA6T
 	case PPC_PMC_PA6T:
 		/* PA Semi starts counting at PMC0 */
@@ -787,7 +791,7 @@ static int register_cpu_online(unsigned int cpu)
 			device_create_file(s, &pmc_attrs[i]);
 
 #ifdef CONFIG_PPC64
-	if (cpu_has_feature(CPU_FTR_MMCRA))
+	if (IS_ENABLED(CONFIG_PMU_SYSFS) && cpu_has_feature(CPU_FTR_MMCRA))
 		device_create_file(s, &dev_attr_mmcra);
 
 	if (cpu_has_feature(CPU_FTR_PURR)) {
@@ -840,13 +844,12 @@ static int unregister_cpu_online(unsigned int cpu)
 
 	/* PMC stuff */
 	switch (cur_cpu_spec->pmc_type) {
-#ifdef HAS_PPC_PMC_IBM
+#ifdef CONFIG_PMU_SYSFS
 	case PPC_PMC_IBM:
 		attrs = ibm_common_attrs;
 		nattrs = sizeof(ibm_common_attrs) / sizeof(struct device_attribute);
 		pmc_attrs = classic_pmc_attrs;
 		break;
-#endif /* HAS_PPC_PMC_IBM */
 #ifdef HAS_PPC_PMC_G4
 	case PPC_PMC_G4:
 		attrs = g4_common_attrs;
@@ -854,6 +857,7 @@ static int unregister_cpu_online(unsigned int cpu)
 		pmc_attrs = classic_pmc_attrs;
 		break;
 #endif /* HAS_PPC_PMC_G4 */
+#endif /* CONFIG_PMU_SYSFS */
 #ifdef HAS_PPC_PMC_PA6T
 	case PPC_PMC_PA6T:
 		/* PA Semi starts counting at PMC0 */
@@ -876,7 +880,7 @@ static int unregister_cpu_online(unsigned int cpu)
 			device_remove_file(s, &pmc_attrs[i]);
 
 #ifdef CONFIG_PPC64
-	if (cpu_has_feature(CPU_FTR_MMCRA))
+	if (IS_ENABLED(CONFIG_PMU_SYSFS) && cpu_has_feature(CPU_FTR_MMCRA))
 		device_remove_file(s, &dev_attr_mmcra);
 
 	if (cpu_has_feature(CPU_FTR_PURR))
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 12543e53fa96..58c72b9b8902 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -417,6 +417,12 @@ config PPC_MM_SLICES
 config PPC_HAVE_PMU_SUPPORT
        bool
 
+config PMU_SYSFS
+	bool
+	default n
+	help
+	  This option enables sysfs file creation for PMU SPRs like MMCR* and PMC*.
+
 config PPC_PERF_CTRS
        def_bool y
        depends on PERF_EVENTS && PPC_HAVE_PMU_SUPPORT
-- 
2.12.3

