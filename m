Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3034515D381
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 09:09:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JmJM1bynzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 19:09:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JmDf4KJczDqXd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 19:06:42 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01E808ZE128563
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 03:06:40 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y4j8amxhq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 03:06:39 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Fri, 14 Feb 2020 08:06:38 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 14 Feb 2020 08:06:35 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01E86YWb42664394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Feb 2020 08:06:34 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44B954204B;
 Fri, 14 Feb 2020 08:06:34 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0E9142049;
 Fri, 14 Feb 2020 08:06:31 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.37.109])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Feb 2020 08:06:31 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 2/2] powerpc/kernel/sysfs: Add new config option PMU_SYSFS to
 enable PMU SPRs sysfs file creation
Date: Fri, 14 Feb 2020 13:36:06 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200214080606.26872-1-kjain@linux.ibm.com>
References: <20200214080606.26872-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20021408-0012-0000-0000-00000386B8B3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021408-0013-0000-0000-000021C33EAF
Message-Id: <20200214080606.26872-2-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_02:2020-02-12,
 2020-02-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002140065
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com, nasastry@in.ibm.com,
 anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Many of the performance monitoring unit (PMU) SPRs are
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
Patch is also tested for pmac32_defconfig.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/kernel/sysfs.c            | 6 ++++++
 arch/powerpc/platforms/Kconfig.cputype | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 74da5eb..cd807e8 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -562,6 +562,7 @@ void ppc_enable_pmcs(void)
  * that are implemented on the current processor
  */
 
+#ifdef CONFIG_PMU_SYSFS
 #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_BOOK3S_32)
 #define HAS_PPC_PMC_CLASSIC	1
 #define HAS_PPC_PMC_IBM		1
@@ -575,6 +576,7 @@ void ppc_enable_pmcs(void)
 #ifdef CONFIG_PPC_BOOK3S_32
 #define HAS_PPC_PMC_G4		1
 #endif
+#endif /* CONFIG_PMU_SYSFS */
 
 #if defined(CONFIG_PPC64) && defined(CONFIG_DEBUG_MISC)
 #define HAS_PPC_PA6T
@@ -812,8 +814,10 @@ static int register_cpu_online(unsigned int cpu)
 			device_create_file(s, &pmc_attrs[i]);
 
 #ifdef CONFIG_PPC64
+#ifdef	CONFIG_PMU_SYSFS
 	if (cpu_has_feature(CPU_FTR_MMCRA))
 		device_create_file(s, &dev_attr_mmcra);
+#endif /* CONFIG_PMU_SYSFS */
 
 	if (cpu_has_feature(CPU_FTR_PURR)) {
 		if (!firmware_has_feature(FW_FEATURE_LPAR))
@@ -901,8 +905,10 @@ static int unregister_cpu_online(unsigned int cpu)
 			device_remove_file(s, &pmc_attrs[i]);
 
 #ifdef CONFIG_PPC64
+#ifdef CONFIG_PMU_SYSFS
 	if (cpu_has_feature(CPU_FTR_MMCRA))
 		device_remove_file(s, &dev_attr_mmcra);
+#endif /* CONFIG_PMU_SYSFS */
 
 	if (cpu_has_feature(CPU_FTR_PURR))
 		device_remove_file(s, &dev_attr_purr);
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 8d7f9c3..e58b48d 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -417,6 +417,12 @@ config PPC_MM_SLICES
 config PPC_HAVE_PMU_SUPPORT
 	bool
 
+config PMU_SYSFS
+	bool "Create PMU SPRs sysfs file"
+	default n
+	help
+	  This option enables sysfs file creation for PMU SPRs like MMCR* and PMC*.
+
 config PPC_PERF_CTRS
 	def_bool y
 	depends on PERF_EVENTS && PPC_HAVE_PMU_SUPPORT
-- 
1.8.3.1

