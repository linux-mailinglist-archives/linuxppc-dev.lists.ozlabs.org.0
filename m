Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 072AD1A09A4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 10:57:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xLrc39txzDr7G
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 18:57:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xLf517JFzDqcP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 18:48:12 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0378Xruo069113; Tue, 7 Apr 2020 04:48:05 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 306kuw9t7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 04:48:05 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0378fxYm024069;
 Tue, 7 Apr 2020 08:48:05 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 306hv6mbtj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 08:48:04 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0378m3en57541070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 08:48:03 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEC0678069;
 Tue,  7 Apr 2020 08:48:03 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 271417805C;
 Tue,  7 Apr 2020 08:48:03 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.79.178.96])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  7 Apr 2020 08:48:03 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 28DBC2E33AC; Tue,  7 Apr 2020 14:17:59 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH v5 4/5] powerpc/sysfs: Show idle_purr and idle_spurr for every
 CPU
Date: Tue,  7 Apr 2020 14:17:42 +0530
Message-Id: <1586249263-14048-5-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586249263-14048-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1586249263-14048-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_01:2020-04-07,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070068
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

On Pseries LPARs, to calculate utilization, we need to know the
[S]PURR ticks when the CPUs were busy or idle.

The total PURR and SPURR ticks are already exposed via the per-cpu
sysfs files "purr" and "spurr". This patch adds support for exposing
the idle PURR and SPURR ticks via new per-cpu sysfs files named
"idle_purr" and "idle_spurr".

This patch also adds helper functions to accurately read the values of
idle_purr and idle_spurr especially from an interrupt context between
when the interrupt has occurred between the pseries_idle_prolog() and
pseries_idle_epilog(). This will ensure that the idle purr/spurr
values corresponding to the latest idle period is accounted for before
these values are read.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/idle.h | 32 ++++++++++++++++
 arch/powerpc/kernel/sysfs.c     | 82 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 111 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/idle.h b/arch/powerpc/include/asm/idle.h
index 0efb250..accd1f5 100644
--- a/arch/powerpc/include/asm/idle.h
+++ b/arch/powerpc/include/asm/idle.h
@@ -57,5 +57,37 @@ static inline void pseries_idle_epilog(void)
 	ppc64_runlatch_on();
 }
 
+static inline u64 read_this_idle_purr(void)
+{
+	/*
+	 * If we are reading from an idle context, update the
+	 * idle-purr cycles corresponding to the last idle period.
+	 * Since the idle context is not yet over, take a fresh
+	 * snapshot of the idle-purr.
+	 */
+	if (unlikely(get_lppaca()->idle == 1)) {
+		update_idle_purr_accounting();
+		snapshot_purr_idle_entry();
+	}
+
+	return be64_to_cpu(get_lppaca()->wait_state_cycles);
+}
+
+static inline u64 read_this_idle_spurr(void)
+{
+	/*
+	 * If we are reading from an idle context, update the
+	 * idle-spurr cycles corresponding to the last idle period.
+	 * Since the idle context is not yet over, take a fresh
+	 * snapshot of the idle-spurr.
+	 */
+	if (get_lppaca()->idle == 1) {
+		update_idle_spurr_accounting();
+		snapshot_spurr_idle_entry();
+	}
+
+	return *this_cpu_ptr(&idle_spurr_cycles);
+}
+
 #endif /* CONFIG_PPC_PSERIES */
 #endif
diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 479c706..571b325 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -19,6 +19,7 @@
 #include <asm/smp.h>
 #include <asm/pmc.h>
 #include <asm/firmware.h>
+#include <asm/idle.h>
 #include <asm/svm.h>
 
 #include "cacheinfo.h"
@@ -760,6 +761,74 @@ static void create_svm_file(void)
 }
 #endif /* CONFIG_PPC_SVM */
 
+#ifdef CONFIG_PPC_PSERIES
+static void read_idle_purr(void *val)
+{
+	u64 *ret = val;
+
+	*ret = read_this_idle_purr();
+}
+
+static ssize_t idle_purr_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct cpu *cpu = container_of(dev, struct cpu, dev);
+	u64 val;
+
+	smp_call_function_single(cpu->dev.id, read_idle_purr, &val, 1);
+	return sprintf(buf, "%llx\n", val);
+}
+static DEVICE_ATTR(idle_purr, 0400, idle_purr_show, NULL);
+
+static void create_idle_purr_file(struct device *s)
+{
+	if (firmware_has_feature(FW_FEATURE_LPAR))
+		device_create_file(s, &dev_attr_idle_purr);
+}
+
+static void remove_idle_purr_file(struct device *s)
+{
+	if (firmware_has_feature(FW_FEATURE_LPAR))
+		device_remove_file(s, &dev_attr_idle_purr);
+}
+
+static void read_idle_spurr(void *val)
+{
+	u64 *ret = val;
+
+	*ret = read_this_idle_spurr();
+}
+
+static ssize_t idle_spurr_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct cpu *cpu = container_of(dev, struct cpu, dev);
+	u64 val;
+
+	smp_call_function_single(cpu->dev.id, read_idle_spurr, &val, 1);
+	return sprintf(buf, "%llx\n", val);
+}
+static DEVICE_ATTR(idle_spurr, 0400, idle_spurr_show, NULL);
+
+static void create_idle_spurr_file(struct device *s)
+{
+	if (firmware_has_feature(FW_FEATURE_LPAR))
+		device_create_file(s, &dev_attr_idle_spurr);
+}
+
+static void remove_idle_spurr_file(struct device *s)
+{
+	if (firmware_has_feature(FW_FEATURE_LPAR))
+		device_remove_file(s, &dev_attr_idle_spurr);
+}
+
+#else /* CONFIG_PPC_PSERIES */
+#define create_idle_purr_file(s)
+#define remove_idle_purr_file(s)
+#define create_idle_spurr_file(s)
+#define remove_idle_spurr_file(s)
+#endif /* CONFIG_PPC_PSERIES */
+
 static int register_cpu_online(unsigned int cpu)
 {
 	struct cpu *c = &per_cpu(cpu_devices, cpu);
@@ -823,10 +892,13 @@ static int register_cpu_online(unsigned int cpu)
 		if (!firmware_has_feature(FW_FEATURE_LPAR))
 			add_write_permission_dev_attr(&dev_attr_purr);
 		device_create_file(s, &dev_attr_purr);
+		create_idle_purr_file(s);
 	}
 
-	if (cpu_has_feature(CPU_FTR_SPURR))
+	if (cpu_has_feature(CPU_FTR_SPURR)) {
 		device_create_file(s, &dev_attr_spurr);
+		create_idle_spurr_file(s);
+	}
 
 	if (cpu_has_feature(CPU_FTR_DSCR))
 		device_create_file(s, &dev_attr_dscr);
@@ -910,11 +982,15 @@ static int unregister_cpu_online(unsigned int cpu)
 		device_remove_file(s, &dev_attr_mmcra);
 #endif /* CONFIG_PMU_SYSFS */
 
-	if (cpu_has_feature(CPU_FTR_PURR))
+	if (cpu_has_feature(CPU_FTR_PURR)) {
 		device_remove_file(s, &dev_attr_purr);
+		remove_idle_purr_file(s);
+	}
 
-	if (cpu_has_feature(CPU_FTR_SPURR))
+	if (cpu_has_feature(CPU_FTR_SPURR)) {
 		device_remove_file(s, &dev_attr_spurr);
+		remove_idle_spurr_file(s);
+	}
 
 	if (cpu_has_feature(CPU_FTR_DSCR))
 		device_remove_file(s, &dev_attr_dscr);
-- 
1.9.4

