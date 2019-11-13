Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1171BFB4B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 17:13:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CqR51NRHzDqBt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 03:13:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CqNf172ZzF6wS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 03:11:10 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xADG4ETZ053718
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 11:11:07 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w8mrns7m6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 11:11:06 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Wed, 13 Nov 2019 16:11:05 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 13 Nov 2019 16:11:03 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xADGB2i614614694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 16:11:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B203711C04A;
 Wed, 13 Nov 2019 16:11:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D73211C04C;
 Wed, 13 Nov 2019 16:11:01 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.55.6])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Nov 2019 16:11:01 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/kernel/sysfs: Add PMU_SYSFS config option to
 enable PMU SPRs sysfs file creation
Date: Wed, 13 Nov 2019 21:40:56 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19111316-4275-0000-0000-0000037D6EB3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111316-4276-0000-0000-00003890D145
Message-Id: <20191113161056.7414-1-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-13_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911130144
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
exposed in the sysfs. "perf" API is the primary interface to program
PMU and collect counter data in the system. So expose these
PMU SPRs in the absence of CONFIG_PERF_EVENTS.

Patch adds a new CONFIG option 'CONFIG_PMU_SYSFS'. The new config
option used in kernel/sysfs.c for PMU SPRs sysfs file creation and
this new option is enabled only if 'CONFIG_PERF_EVENTS' option is
disabled.

Tested this patch with enable/disable CONFIG_PERF_EVENTS option
in powernv and pseries machines.
Also did compilation testing for different architecture include:
x86, mips, mips64, alpha, arm. And with book3s_32.config option.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/kernel/sysfs.c            | 21 +++++++++++++++++++++
 arch/powerpc/platforms/Kconfig.cputype |  8 ++++++++
 2 files changed, 29 insertions(+)

---
Changelog:
v1 -> v2
- Added new config option 'PMU_SYSFS' for PMU SPR's creation
  rather than using PERF_EVENTS config option directly and make
  sure SPR's file creation only if 'CONFIG_PERF_EVENTS' disabled.
---
diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 80a676da11cb..b7c01f1ef236 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -457,16 +457,21 @@ static ssize_t __used \
 
 #if defined(CONFIG_PPC64)
 #define HAS_PPC_PMC_CLASSIC	1
+#ifdef CONFIG_PMU_SYSFS
 #define HAS_PPC_PMC_IBM		1
+#endif
 #define HAS_PPC_PMC_PA6T	1
 #elif defined(CONFIG_PPC_BOOK3S_32)
 #define HAS_PPC_PMC_CLASSIC	1
+#ifdef CONFIG_PMU_SYSFS
 #define HAS_PPC_PMC_IBM		1
 #define HAS_PPC_PMC_G4		1
 #endif
+#endif
 
 
 #ifdef HAS_PPC_PMC_CLASSIC
+#ifdef CONFIG_PMU_SYSFS
 SYSFS_PMCSETUP(mmcr0, SPRN_MMCR0);
 SYSFS_PMCSETUP(mmcr1, SPRN_MMCR1);
 SYSFS_PMCSETUP(pmc1, SPRN_PMC1);
@@ -485,6 +490,10 @@ SYSFS_PMCSETUP(pmc7, SPRN_PMC7);
 SYSFS_PMCSETUP(pmc8, SPRN_PMC8);
 
 SYSFS_PMCSETUP(mmcra, SPRN_MMCRA);
+#endif /* CONFIG_PPC64 */
+#endif /* CONFIG_PMU_SYSFS */
+
+#ifdef CONFIG_PPC64
 SYSFS_SPRSETUP(purr, SPRN_PURR);
 SYSFS_SPRSETUP(spurr, SPRN_SPURR);
 SYSFS_SPRSETUP(pir, SPRN_PIR);
@@ -495,7 +504,9 @@ SYSFS_SPRSETUP(tscr, SPRN_TSCR);
   enable write when needed with a separate function.
   Lets be conservative and default to pseries.
 */
+#ifdef CONFIG_PMU_SYSFS
 static DEVICE_ATTR(mmcra, 0600, show_mmcra, store_mmcra);
+#endif /* CONFIG_PMU_SYSFS */
 static DEVICE_ATTR(spurr, 0400, show_spurr, NULL);
 static DEVICE_ATTR(purr, 0400, show_purr, store_purr);
 static DEVICE_ATTR(pir, 0400, show_pir, NULL);
@@ -606,12 +617,14 @@ static void sysfs_create_dscr_default(void)
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
@@ -644,6 +657,7 @@ SYSFS_SPRSETUP(tsr3, SPRN_PA6T_TSR3);
 #endif /* CONFIG_DEBUG_MISC */
 #endif /* HAS_PPC_PMC_PA6T */
 
+#ifdef CONFIG_PMU_SYSFS
 #ifdef HAS_PPC_PMC_IBM
 static struct device_attribute ibm_common_attrs[] = {
 	__ATTR(mmcr0, 0600, show_mmcr0, store_mmcr0),
@@ -671,9 +685,11 @@ static struct device_attribute classic_pmc_attrs[] = {
 	__ATTR(pmc8, 0600, show_pmc8, store_pmc8),
 #endif
 };
+#endif /* CONFIG_PMU_SYSFS */
 
 #ifdef HAS_PPC_PMC_PA6T
 static struct device_attribute pa6t_attrs[] = {
+#ifdef CONFIG_PMU_SYSFS
 	__ATTR(mmcr0, 0600, show_mmcr0, store_mmcr0),
 	__ATTR(mmcr1, 0600, show_mmcr1, store_mmcr1),
 	__ATTR(pmc0, 0600, show_pa6t_pmc0, store_pa6t_pmc0),
@@ -682,6 +698,7 @@ static struct device_attribute pa6t_attrs[] = {
 	__ATTR(pmc3, 0600, show_pa6t_pmc3, store_pa6t_pmc3),
 	__ATTR(pmc4, 0600, show_pa6t_pmc4, store_pa6t_pmc4),
 	__ATTR(pmc5, 0600, show_pa6t_pmc5, store_pa6t_pmc5),
+#endif /* CONFIG_PMU_SYSFS */
 #ifdef CONFIG_DEBUG_MISC
 	__ATTR(hid0, 0600, show_hid0, store_hid0),
 	__ATTR(hid1, 0600, show_hid1, store_hid1),
@@ -787,8 +804,10 @@ static int register_cpu_online(unsigned int cpu)
 			device_create_file(s, &pmc_attrs[i]);
 
 #ifdef CONFIG_PPC64
+#ifdef CONFIG_PMU_SYSFS
 	if (cpu_has_feature(CPU_FTR_MMCRA))
 		device_create_file(s, &dev_attr_mmcra);
+#endif /* CONFIG_PMU_SYSFS */
 
 	if (cpu_has_feature(CPU_FTR_PURR)) {
 		if (!firmware_has_feature(FW_FEATURE_LPAR))
@@ -876,8 +895,10 @@ static int unregister_cpu_online(unsigned int cpu)
 			device_remove_file(s, &pmc_attrs[i]);
 
 #ifdef CONFIG_PPC64
+#ifdef CONFIG_PMU_SYSFS
 	if (cpu_has_feature(CPU_FTR_MMCRA))
 		device_remove_file(s, &dev_attr_mmcra);
+#endif /* CONFIG_PMU_SYSFS */
 
 	if (cpu_has_feature(CPU_FTR_PURR))
 		device_remove_file(s, &dev_attr_purr);
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 12543e53fa96..f3ad579c559f 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -417,6 +417,14 @@ config PPC_MM_SLICES
 config PPC_HAVE_PMU_SUPPORT
        bool
 
+config PMU_SYSFS
+	bool
+	default y if !PERF_EVENTS
+	help
+	  This option enables PMU SPR sysfs file creation. Since PMU SPRs are
+	  intended to be used via "perf" interface, config option is enabled
+	  only when CONFIG_PERF_EVENTS is disabled.
+
 config PPC_PERF_CTRS
        def_bool y
        depends on PERF_EVENTS && PPC_HAVE_PMU_SUPPORT
-- 
2.12.3

