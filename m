Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D29D19569E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 12:52:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pgFv4FP2zDrBx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 22:52:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pfqN0PJkzDr5N
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 22:33:03 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02RB4dKL107909; Fri, 27 Mar 2020 07:32:58 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywdr9kcyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 07:32:57 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02RBUgcc005451;
 Fri, 27 Mar 2020 11:32:53 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 2ywaw2x8q5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 11:32:52 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02RBWpYw13435396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Mar 2020 11:32:51 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 837B1BE058;
 Fri, 27 Mar 2020 11:32:51 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B44FEBE053;
 Fri, 27 Mar 2020 11:32:50 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.72.108])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 27 Mar 2020 11:32:50 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 7548D2E3B08; Fri, 27 Mar 2020 17:02:45 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH v4 4/6] powerpc/sysfs: Show idle_purr and idle_spurr for every
 CPU
Date: Fri, 27 Mar 2020 17:02:38 +0530
Message-Id: <1585308760-28792-5-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585308760-28792-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1585308760-28792-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-27_03:2020-03-27,
 2020-03-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxlogscore=987 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003270097
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

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/sysfs.c | 82 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 3 deletions(-)

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

