Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6932215D368
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 09:08:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JmGY3md7zDqZj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 19:08:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JmDT4y08zDqXV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 19:06:33 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01E7xuiM064414
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 03:06:30 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y5jxtfen3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 03:06:30 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Fri, 14 Feb 2020 08:06:28 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 14 Feb 2020 08:06:27 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01E85Uf942795494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Feb 2020 08:05:30 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBE3542049;
 Fri, 14 Feb 2020 08:06:24 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F233C42052;
 Fri, 14 Feb 2020 08:06:21 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.37.109])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Feb 2020 08:06:21 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 1/2] powerpc/kernel/sysfs: Refactor current sysfs.c
Date: Fri, 14 Feb 2020 13:36:05 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20021408-0012-0000-0000-00000386B8AE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021408-0013-0000-0000-000021C33EAB
Message-Id: <20200214080606.26872-1-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_02:2020-02-12,
 2020-02-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002140065
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, kjain@linux.ibm.com,
 maddy@linux.vnet.ibm.com, nasastry@in.ibm.com, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.ibm.com>

An attempt to refactor the current sysfs.c file.
To start with a big chuck of macro #defines and dscr
functions are moved to start of the file. Secondly,
HAS_ #define macros are cleanup based on CONFIG_ options

Finally new HAS_ macro added:
1. HAS_PPC_PA6T (for PA6T) to separate out non-PMU SPRs.
2. HAS_PPC_PMC56 to separate out PMC SPR's from HAS_PPC_PMC_CLASSIC
   which come under CONFIG_PPC64.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/kernel/sysfs.c | 375 +++++++++++++++++++++++---------------------
 1 file changed, 200 insertions(+), 175 deletions(-)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 80a676d..74da5eb 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -87,6 +87,155 @@ static int __init setup_smt_snooze_delay(char *str)
 
 #endif /* CONFIG_PPC64 */
 
+#define __SYSFS_SPRSETUP_READ_WRITE(NAME, ADDRESS, EXTRA) \
+static void read_##NAME(void *val) \
+{ \
+	*(unsigned long *)val = mfspr(ADDRESS);	\
+} \
+static void write_##NAME(void *val) \
+{ \
+	EXTRA; \
+	mtspr(ADDRESS, *(unsigned long *)val);	\
+}
+
+#define __SYSFS_SPRSETUP_SHOW_STORE(NAME) \
+static ssize_t show_##NAME(struct device *dev, \
+			struct device_attribute *attr, \
+			char *buf) \
+{ \
+	struct cpu *cpu = container_of(dev, struct cpu, dev); \
+	unsigned long val; \
+	smp_call_function_single(cpu->dev.id, read_##NAME, &val, 1);	\
+	return sprintf(buf, "%lx\n", val); \
+} \
+static ssize_t __used \
+	store_##NAME(struct device *dev, struct device_attribute *attr, \
+			const char *buf, size_t count) \
+{ \
+	struct cpu *cpu = container_of(dev, struct cpu, dev); \
+	unsigned long val; \
+	int ret = sscanf(buf, "%lx", &val); \
+	if (ret != 1) \
+		return -EINVAL; \
+	smp_call_function_single(cpu->dev.id, write_##NAME, &val, 1); \
+	return count; \
+}
+
+#define SYSFS_PMCSETUP(NAME, ADDRESS) \
+	__SYSFS_SPRSETUP_READ_WRITE(NAME, ADDRESS, ppc_enable_pmcs()) \
+	__SYSFS_SPRSETUP_SHOW_STORE(NAME)
+#define SYSFS_SPRSETUP(NAME, ADDRESS) \
+	__SYSFS_SPRSETUP_READ_WRITE(NAME, ADDRESS, ) \
+	__SYSFS_SPRSETUP_SHOW_STORE(NAME)
+
+#define SYSFS_SPRSETUP_SHOW_STORE(NAME) \
+	__SYSFS_SPRSETUP_SHOW_STORE(NAME)
+
+#ifdef CONFIG_PPC64
+
+/*
+ * This is the system wide DSCR register default value. Any
+ * change to this default value through the sysfs interface
+ * will update all per cpu DSCR default values across the
+ * system stored in their respective PACA structures.
+ */
+static unsigned long dscr_default;
+
+/**
+ * read_dscr() - Fetch the cpu specific DSCR default
+ * @val:	Returned cpu specific DSCR default value
+ *
+ * This function returns the per cpu DSCR default value
+ * for any cpu which is contained in it's PACA structure.
+ */
+static void read_dscr(void *val)
+{
+	*(unsigned long *)val = get_paca()->dscr_default;
+}
+
+
+/**
+ * write_dscr() - Update the cpu specific DSCR default
+ * @val:	New cpu specific DSCR default value to update
+ *
+ * This function updates the per cpu DSCR default value
+ * for any cpu which is contained in it's PACA structure.
+ */
+static void write_dscr(void *val)
+{
+	get_paca()->dscr_default = *(unsigned long *)val;
+	if (!current->thread.dscr_inherit) {
+		current->thread.dscr = *(unsigned long *)val;
+		mtspr(SPRN_DSCR, *(unsigned long *)val);
+	}
+}
+
+SYSFS_SPRSETUP_SHOW_STORE(dscr);
+static DEVICE_ATTR(dscr, 0600, show_dscr, store_dscr);
+
+static void add_write_permission_dev_attr(struct device_attribute *attr)
+{
+	attr->attr.mode |= 0200;
+}
+
+/**
+ * show_dscr_default() - Fetch the system wide DSCR default
+ * @dev:	Device structure
+ * @attr:	Device attribute structure
+ * @buf:	Interface buffer
+ *
+ * This function returns the system wide DSCR default value.
+ */
+static ssize_t show_dscr_default(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%lx\n", dscr_default);
+}
+
+/**
+ * store_dscr_default() - Update the system wide DSCR default
+ * @dev:	Device structure
+ * @attr:	Device attribute structure
+ * @buf:	Interface buffer
+ * @count:	Size of the update
+ *
+ * This function updates the system wide DSCR default value.
+ */
+static ssize_t __used store_dscr_default(struct device *dev,
+		struct device_attribute *attr, const char *buf,
+		size_t count)
+{
+	unsigned long val;
+	int ret = 0;
+
+	ret = sscanf(buf, "%lx", &val);
+	if (ret != 1)
+		return -EINVAL;
+	dscr_default = val;
+
+	on_each_cpu(write_dscr, &val, 1);
+
+	return count;
+}
+
+static DEVICE_ATTR(dscr_default, 0600,
+		show_dscr_default, store_dscr_default);
+
+static void sysfs_create_dscr_default(void)
+{
+	if (cpu_has_feature(CPU_FTR_DSCR)) {
+		int err = 0;
+		int cpu;
+
+		dscr_default = spr_default_dscr;
+		for_each_possible_cpu(cpu)
+			paca_ptrs[cpu]->dscr_default = dscr_default;
+
+		err = device_create_file(cpu_subsys.dev_root, &dev_attr_dscr_default);
+	}
+}
+#endif /* CONFIG_PPC64 */
+
 #ifdef CONFIG_PPC_FSL_BOOK3E
 #define MAX_BIT				63
 
@@ -407,84 +556,33 @@ void ppc_enable_pmcs(void)
 }
 EXPORT_SYMBOL(ppc_enable_pmcs);
 
-#define __SYSFS_SPRSETUP_READ_WRITE(NAME, ADDRESS, EXTRA) \
-static void read_##NAME(void *val) \
-{ \
-	*(unsigned long *)val = mfspr(ADDRESS);	\
-} \
-static void write_##NAME(void *val) \
-{ \
-	EXTRA; \
-	mtspr(ADDRESS, *(unsigned long *)val);	\
-}
 
-#define __SYSFS_SPRSETUP_SHOW_STORE(NAME) \
-static ssize_t show_##NAME(struct device *dev, \
-			struct device_attribute *attr, \
-			char *buf) \
-{ \
-	struct cpu *cpu = container_of(dev, struct cpu, dev); \
-	unsigned long val; \
-	smp_call_function_single(cpu->dev.id, read_##NAME, &val, 1);	\
-	return sprintf(buf, "%lx\n", val); \
-} \
-static ssize_t __used \
-	store_##NAME(struct device *dev, struct device_attribute *attr, \
-			const char *buf, size_t count) \
-{ \
-	struct cpu *cpu = container_of(dev, struct cpu, dev); \
-	unsigned long val; \
-	int ret = sscanf(buf, "%lx", &val); \
-	if (ret != 1) \
-		return -EINVAL; \
-	smp_call_function_single(cpu->dev.id, write_##NAME, &val, 1); \
-	return count; \
-}
-
-#define SYSFS_PMCSETUP(NAME, ADDRESS) \
-	__SYSFS_SPRSETUP_READ_WRITE(NAME, ADDRESS, ppc_enable_pmcs()) \
-	__SYSFS_SPRSETUP_SHOW_STORE(NAME)
-#define SYSFS_SPRSETUP(NAME, ADDRESS) \
-	__SYSFS_SPRSETUP_READ_WRITE(NAME, ADDRESS, ) \
-	__SYSFS_SPRSETUP_SHOW_STORE(NAME)
-
-#define SYSFS_SPRSETUP_SHOW_STORE(NAME) \
-	__SYSFS_SPRSETUP_SHOW_STORE(NAME)
 
 /* Let's define all possible registers, we'll only hook up the ones
  * that are implemented on the current processor
  */
 
-#if defined(CONFIG_PPC64)
+#if defined(CONFIG_PPC64) || defined(CONFIG_PPC_BOOK3S_32)
 #define HAS_PPC_PMC_CLASSIC	1
 #define HAS_PPC_PMC_IBM		1
-#define HAS_PPC_PMC_PA6T	1
-#elif defined(CONFIG_PPC_BOOK3S_32)
-#define HAS_PPC_PMC_CLASSIC	1
-#define HAS_PPC_PMC_IBM		1
-#define HAS_PPC_PMC_G4		1
 #endif
 
+#ifdef CONFIG_PPC64
+#define HAS_PPC_PMC_PA6T	1
+#define HAS_PPC_PMC56          1
+#endif
 
-#ifdef HAS_PPC_PMC_CLASSIC
-SYSFS_PMCSETUP(mmcr0, SPRN_MMCR0);
-SYSFS_PMCSETUP(mmcr1, SPRN_MMCR1);
-SYSFS_PMCSETUP(pmc1, SPRN_PMC1);
-SYSFS_PMCSETUP(pmc2, SPRN_PMC2);
-SYSFS_PMCSETUP(pmc3, SPRN_PMC3);
-SYSFS_PMCSETUP(pmc4, SPRN_PMC4);
-SYSFS_PMCSETUP(pmc5, SPRN_PMC5);
-SYSFS_PMCSETUP(pmc6, SPRN_PMC6);
-
-#ifdef HAS_PPC_PMC_G4
-SYSFS_PMCSETUP(mmcr2, SPRN_MMCR2);
+#ifdef CONFIG_PPC_BOOK3S_32
+#define HAS_PPC_PMC_G4		1
 #endif
 
+#if defined(CONFIG_PPC64) && defined(CONFIG_DEBUG_MISC)
+#define HAS_PPC_PA6T
+#endif
+/*
+ * SPRs which are not related to PMU.
+ */
 #ifdef CONFIG_PPC64
-SYSFS_PMCSETUP(pmc7, SPRN_PMC7);
-SYSFS_PMCSETUP(pmc8, SPRN_PMC8);
-
-SYSFS_PMCSETUP(mmcra, SPRN_MMCRA);
 SYSFS_SPRSETUP(purr, SPRN_PURR);
 SYSFS_SPRSETUP(spurr, SPRN_SPURR);
 SYSFS_SPRSETUP(pir, SPRN_PIR);
@@ -495,115 +593,38 @@ void ppc_enable_pmcs(void)
   enable write when needed with a separate function.
   Lets be conservative and default to pseries.
 */
-static DEVICE_ATTR(mmcra, 0600, show_mmcra, store_mmcra);
 static DEVICE_ATTR(spurr, 0400, show_spurr, NULL);
 static DEVICE_ATTR(purr, 0400, show_purr, store_purr);
 static DEVICE_ATTR(pir, 0400, show_pir, NULL);
 static DEVICE_ATTR(tscr, 0600, show_tscr, store_tscr);
+#endif /* CONFIG_PPC64 */
 
-/*
- * This is the system wide DSCR register default value. Any
- * change to this default value through the sysfs interface
- * will update all per cpu DSCR default values across the
- * system stored in their respective PACA structures.
- */
-static unsigned long dscr_default;
-
-/**
- * read_dscr() - Fetch the cpu specific DSCR default
- * @val:	Returned cpu specific DSCR default value
- *
- * This function returns the per cpu DSCR default value
- * for any cpu which is contained in it's PACA structure.
- */
-static void read_dscr(void *val)
-{
-	*(unsigned long *)val = get_paca()->dscr_default;
-}
-
-
-/**
- * write_dscr() - Update the cpu specific DSCR default
- * @val:	New cpu specific DSCR default value to update
- *
- * This function updates the per cpu DSCR default value
- * for any cpu which is contained in it's PACA structure.
- */
-static void write_dscr(void *val)
-{
-	get_paca()->dscr_default = *(unsigned long *)val;
-	if (!current->thread.dscr_inherit) {
-		current->thread.dscr = *(unsigned long *)val;
-		mtspr(SPRN_DSCR, *(unsigned long *)val);
-	}
-}
-
-SYSFS_SPRSETUP_SHOW_STORE(dscr);
-static DEVICE_ATTR(dscr, 0600, show_dscr, store_dscr);
-
-static void add_write_permission_dev_attr(struct device_attribute *attr)
-{
-	attr->attr.mode |= 0200;
-}
-
-/**
- * show_dscr_default() - Fetch the system wide DSCR default
- * @dev:	Device structure
- * @attr:	Device attribute structure
- * @buf:	Interface buffer
- *
- * This function returns the system wide DSCR default value.
- */
-static ssize_t show_dscr_default(struct device *dev,
-		struct device_attribute *attr, char *buf)
-{
-	return sprintf(buf, "%lx\n", dscr_default);
-}
-
-/**
- * store_dscr_default() - Update the system wide DSCR default
- * @dev:	Device structure
- * @attr:	Device attribute structure
- * @buf:	Interface buffer
- * @count:	Size of the update
- *
- * This function updates the system wide DSCR default value.
- */
-static ssize_t __used store_dscr_default(struct device *dev,
-		struct device_attribute *attr, const char *buf,
-		size_t count)
-{
-	unsigned long val;
-	int ret = 0;
-	
-	ret = sscanf(buf, "%lx", &val);
-	if (ret != 1)
-		return -EINVAL;
-	dscr_default = val;
+#ifdef HAS_PPC_PMC_CLASSIC
+SYSFS_PMCSETUP(mmcr0, SPRN_MMCR0);
+SYSFS_PMCSETUP(mmcr1, SPRN_MMCR1);
+SYSFS_PMCSETUP(pmc1, SPRN_PMC1);
+SYSFS_PMCSETUP(pmc2, SPRN_PMC2);
+SYSFS_PMCSETUP(pmc3, SPRN_PMC3);
+SYSFS_PMCSETUP(pmc4, SPRN_PMC4);
+SYSFS_PMCSETUP(pmc5, SPRN_PMC5);
+SYSFS_PMCSETUP(pmc6, SPRN_PMC6);
+#endif
 
-	on_each_cpu(write_dscr, &val, 1);
+#ifdef HAS_PPC_PMC_G4
+SYSFS_PMCSETUP(mmcr2, SPRN_MMCR2);
+#endif
 
-	return count;
-}
+#ifdef HAS_PPC_PMC56
+SYSFS_PMCSETUP(pmc7, SPRN_PMC7);
+SYSFS_PMCSETUP(pmc8, SPRN_PMC8);
 
-static DEVICE_ATTR(dscr_default, 0600,
-		show_dscr_default, store_dscr_default);
+SYSFS_PMCSETUP(mmcra, SPRN_MMCRA);
 
-static void sysfs_create_dscr_default(void)
-{
-	if (cpu_has_feature(CPU_FTR_DSCR)) {
-		int err = 0;
-		int cpu;
+static DEVICE_ATTR(mmcra, 0600, show_mmcra, store_mmcra);
+#endif /* HAS_PPC_PMC56 */
 
-		dscr_default = spr_default_dscr;
-		for_each_possible_cpu(cpu)
-			paca_ptrs[cpu]->dscr_default = dscr_default;
 
-		err = device_create_file(cpu_subsys.dev_root, &dev_attr_dscr_default);
-	}
-}
 
-#endif /* CONFIG_PPC64 */
 
 #ifdef HAS_PPC_PMC_PA6T
 SYSFS_PMCSETUP(pa6t_pmc0, SPRN_PA6T_PMC0);
@@ -612,7 +633,9 @@ static void sysfs_create_dscr_default(void)
 SYSFS_PMCSETUP(pa6t_pmc3, SPRN_PA6T_PMC3);
 SYSFS_PMCSETUP(pa6t_pmc4, SPRN_PA6T_PMC4);
 SYSFS_PMCSETUP(pa6t_pmc5, SPRN_PA6T_PMC5);
-#ifdef CONFIG_DEBUG_MISC
+#endif
+
+#ifdef HAS_PPC_PA6T
 SYSFS_SPRSETUP(hid0, SPRN_HID0);
 SYSFS_SPRSETUP(hid1, SPRN_HID1);
 SYSFS_SPRSETUP(hid4, SPRN_HID4);
@@ -641,15 +664,14 @@ static void sysfs_create_dscr_default(void)
 SYSFS_SPRSETUP(tsr1, SPRN_PA6T_TSR1);
 SYSFS_SPRSETUP(tsr2, SPRN_PA6T_TSR2);
 SYSFS_SPRSETUP(tsr3, SPRN_PA6T_TSR3);
-#endif /* CONFIG_DEBUG_MISC */
-#endif /* HAS_PPC_PMC_PA6T */
+#endif /* HAS_PPC_PA6T */
 
 #ifdef HAS_PPC_PMC_IBM
 static struct device_attribute ibm_common_attrs[] = {
 	__ATTR(mmcr0, 0600, show_mmcr0, store_mmcr0),
 	__ATTR(mmcr1, 0600, show_mmcr1, store_mmcr1),
 };
-#endif /* HAS_PPC_PMC_G4 */
+#endif /* HAS_PPC_PMC_IBM */
 
 #ifdef HAS_PPC_PMC_G4
 static struct device_attribute g4_common_attrs[] = {
@@ -659,6 +681,7 @@ static void sysfs_create_dscr_default(void)
 };
 #endif /* HAS_PPC_PMC_G4 */
 
+#ifdef HAS_PPC_PMC_CLASSIC
 static struct device_attribute classic_pmc_attrs[] = {
 	__ATTR(pmc1, 0600, show_pmc1, store_pmc1),
 	__ATTR(pmc2, 0600, show_pmc2, store_pmc2),
@@ -666,14 +689,16 @@ static void sysfs_create_dscr_default(void)
 	__ATTR(pmc4, 0600, show_pmc4, store_pmc4),
 	__ATTR(pmc5, 0600, show_pmc5, store_pmc5),
 	__ATTR(pmc6, 0600, show_pmc6, store_pmc6),
-#ifdef CONFIG_PPC64
+#ifdef HAS_PPC_PMC56
 	__ATTR(pmc7, 0600, show_pmc7, store_pmc7),
 	__ATTR(pmc8, 0600, show_pmc8, store_pmc8),
 #endif
 };
+#endif
 
-#ifdef HAS_PPC_PMC_PA6T
+#if defined(HAS_PPC_PMC_PA6T) || defined(HAS_PPC_PA6T)
 static struct device_attribute pa6t_attrs[] = {
+#ifdef HAS_PPC_PMC_PA6T
 	__ATTR(mmcr0, 0600, show_mmcr0, store_mmcr0),
 	__ATTR(mmcr1, 0600, show_mmcr1, store_mmcr1),
 	__ATTR(pmc0, 0600, show_pa6t_pmc0, store_pa6t_pmc0),
@@ -682,7 +707,8 @@ static void sysfs_create_dscr_default(void)
 	__ATTR(pmc3, 0600, show_pa6t_pmc3, store_pa6t_pmc3),
 	__ATTR(pmc4, 0600, show_pa6t_pmc4, store_pa6t_pmc4),
 	__ATTR(pmc5, 0600, show_pa6t_pmc5, store_pa6t_pmc5),
-#ifdef CONFIG_DEBUG_MISC
+#endif
+#ifdef HAS_PPC_PA6T
 	__ATTR(hid0, 0600, show_hid0, store_hid0),
 	__ATTR(hid1, 0600, show_hid1, store_hid1),
 	__ATTR(hid4, 0600, show_hid4, store_hid4),
@@ -711,10 +737,9 @@ static void sysfs_create_dscr_default(void)
 	__ATTR(tsr1, 0600, show_tsr1, store_tsr1),
 	__ATTR(tsr2, 0600, show_tsr2, store_tsr2),
 	__ATTR(tsr3, 0600, show_tsr3, store_tsr3),
-#endif /* CONFIG_DEBUG_MISC */
+#endif /* HAS_PPC_PA6T */
 };
-#endif /* HAS_PPC_PMC_PA6T */
-#endif /* HAS_PPC_PMC_CLASSIC */
+#endif
 
 #ifdef CONFIG_PPC_SVM
 static ssize_t show_svm(struct device *dev, struct device_attribute *attr, char *buf)
@@ -765,14 +790,14 @@ static int register_cpu_online(unsigned int cpu)
 		pmc_attrs = classic_pmc_attrs;
 		break;
 #endif /* HAS_PPC_PMC_G4 */
-#ifdef HAS_PPC_PMC_PA6T
+#if defined(HAS_PPC_PMC_PA6T) || defined(HAS_PPC_PA6T)
 	case PPC_PMC_PA6T:
 		/* PA Semi starts counting at PMC0 */
 		attrs = pa6t_attrs;
 		nattrs = sizeof(pa6t_attrs) / sizeof(struct device_attribute);
 		pmc_attrs = NULL;
 		break;
-#endif /* HAS_PPC_PMC_PA6T */
+#endif
 	default:
 		attrs = NULL;
 		nattrs = 0;
@@ -854,14 +879,14 @@ static int unregister_cpu_online(unsigned int cpu)
 		pmc_attrs = classic_pmc_attrs;
 		break;
 #endif /* HAS_PPC_PMC_G4 */
-#ifdef HAS_PPC_PMC_PA6T
+#if defined(HAS_PPC_PMC_PA6T) || defined(HAS_PPC_PA6T)
 	case PPC_PMC_PA6T:
 		/* PA Semi starts counting at PMC0 */
 		attrs = pa6t_attrs;
 		nattrs = sizeof(pa6t_attrs) / sizeof(struct device_attribute);
 		pmc_attrs = NULL;
 		break;
-#endif /* HAS_PPC_PMC_PA6T */
+#endif
 	default:
 		attrs = NULL;
 		nattrs = 0;
-- 
1.8.3.1

