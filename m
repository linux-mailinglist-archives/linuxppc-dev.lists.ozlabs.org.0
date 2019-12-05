Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4BE113B52
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 06:28:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47T44T6SV9zDqYb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 16:28:09 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47T42d4SVHzDqXT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 16:26:33 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB55ORXW027582
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 5 Dec 2019 00:26:30 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wpuqjg2dj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Dec 2019 00:26:30 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Thu, 5 Dec 2019 05:26:28 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Dec 2019 05:26:26 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB55QPXq49086568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Dec 2019 05:26:25 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 493CFA405F;
 Thu,  5 Dec 2019 05:26:25 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B5C5A405C;
 Thu,  5 Dec 2019 05:26:23 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.42.202])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Dec 2019 05:26:23 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RESEND PATCH v2] powerpc/kernel/sysfs: Add PMU_SYSFS config option
 to enable PMU SPRs sysfs file creation
Date: Thu,  5 Dec 2019 10:55:58 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19120505-0028-0000-0000-000003C52346
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120505-0029-0000-0000-000024884401
Message-Id: <20191205052558.2091-1-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_04:2019-12-04,2019-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912050041
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
Cc: Nageswara R Sastry <nasastry@in.ibm.com>, kjain@linux.ibm.com,
 anju@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com
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

Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Tested-by: Nageswara R Sastry <nasastry@in.ibm.com>

Tested using the following different scenarios:
1. CONFIG_PERF_EVENT - enabled, CONFIG_PMU_SYSFS - disabled,
RESULT: not seen any sysfs files(mmrc*, pmc*) from /sys/bus/cpu/devices/cpu?/
2. CONFIG_PERF_EVENT - disabled, CONFIG_PMU_SYSFS - enabled,
RESULT: seen any sysfs files(mmrc*, pmc*) from /sys/bus/cpu/devices/cpu?/
3. CONFIG_PERF_EVENT -disabled, CONFIG_PMU_SYSFS - disabled,
RESULT: not possible, any one of the config options need to be enabled.
4. CONFIG_PERF_EVENT -enabled, CONFIG_PMU_SYSFS - enabled,
RESULT: not possible, any one of the config options need to be enabled.
---
 arch/powerpc/kernel/sysfs.c            | 21 +++++++++++++++++++++
 arch/powerpc/platforms/Kconfig.cputype |  8 ++++++++
 2 files changed, 29 insertions(+)

---
Changelog:
Resend v2 
	Added 'Reviewed-by' and 'Tested-by' tag along with test scenarios.	

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

