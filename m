Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C72E18103B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 06:52:36 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ch1s50fHzDqZx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 16:52:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ch0X6cjQzDqLn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 16:51:21 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02B5oWWU034674
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 01:51:09 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ypt2u0a1d-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 01:51:09 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Wed, 11 Mar 2020 05:51:07 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Mar 2020 05:51:04 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02B5o1P235324308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 05:50:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7668942047;
 Wed, 11 Mar 2020 05:51:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 462CE4203F;
 Wed, 11 Mar 2020 05:51:00 +0000 (GMT)
Received: from vajain21.in.ibm.com.com (unknown [9.199.53.91])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Mar 2020 05:51:00 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] pseries/iommu: Tweak ddw behavior in presence of pmem
Date: Wed, 11 Mar 2020 11:20:50 +0530
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031105-0020-0000-0000-000003B29187
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031105-0021-0000-0000-0000220AE026
Message-Id: <20200311055050.161556-1-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_01:2020-03-10,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=930 bulkscore=0 adultscore=0 spamscore=0 suspectscore=1
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2003110036
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 Michael Ellerman <ellerman@au1.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Recently we discovered an issue on pseries guests that prevents pci
devices from accessing pmem memory via DMA. Performing such an
operation will cause PHB to freeze the corresponding partition
endpoint and in some scenarios will shutdown the disk that hosts the
rootfs.

A fix for this is in works until then this patch proposes to disable
DDW if pmem nodes are present in the device-tree. This would force all
DMA from I/O adapters through default 2-GB window and prevent direct
access of pmem memory which is located beyond 4-TB guest physical
address.

Since this change can have performance penalty for cases where its
known that i/o adapters wont be performing DMA to pmem, the patch
adds new args to the 'disable_ddw' kernel commanline flag with
following possible values:

'default' : Enable DDW only if no Pmem nodes present in device-tree
'Yes' : Disable DDW always
'No'  : Force enable DDW even if Pmem nodes present in device-tree

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 .../admin-guide/kernel-parameters.txt         | 10 ++-
 arch/powerpc/platforms/pseries/iommu.c        | 67 +++++++++++++++++--
 2 files changed, 70 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c07815d230bc..58e09f7a2cb9 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -901,9 +901,13 @@
 			The feature only exists starting from
 			Arch Perfmon v4 (Skylake and newer).
 
-	disable_ddw	[PPC/PSERIES]
-			Disable Dynamic DMA Window support. Use this if
-			to workaround buggy firmware.
+	disable_ddw=	[PPC/PSERIES]
+			Controls weather Dynamic DMA Window support is enabled.
+			Use this if to workaround buggy firmware. Following
+			values are supported:
+                on      Disable ddw always
+                off     Enable ddw always
+		default Enable ddw if no Persistent memory present (default)
 
 	disable_ipv6=	[IPV6]
 			See Documentation/networking/ipv6.txt.
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 2e0a8eab5588..97498cc25c9f 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -12,6 +12,7 @@
 
 #include <linux/init.h>
 #include <linux/types.h>
+#include <linux/string.h>
 #include <linux/slab.h>
 #include <linux/mm.h>
 #include <linux/memblock.h>
@@ -755,12 +756,39 @@ static void pci_dma_dev_setup_pSeries(struct pci_dev *dev)
 		       pci_name(dev));
 }
 
+/*
+ * Following values for the variable are handled
+ * '-1': Force enable ddw even if Persistent memory is present
+ * '0' : Enable ddw if no Persistent memory present (default)
+ * '1' : Disable ddw always
+ */
 static int __read_mostly disable_ddw;
 
-static int __init disable_ddw_setup(char *str)
+static int __init disable_ddw_setup(char *param)
 {
-	disable_ddw = 1;
-	printk(KERN_INFO "ppc iommu: disabling ddw.\n");
+	bool val;
+	int res;
+
+	/* Maintain old behaviour that disables DDW when flag given */
+	if (!param) {
+		disable_ddw = 1;
+		return 0;
+	}
+
+	res = strtobool(param, &val);
+
+	if (!res) {
+		if (val) {
+			disable_ddw = 1;
+			pr_info("ppc iommu: disabling ddw.\n");
+		} else if (!val) {
+			/* Force enable of DDW even if pmem is available */
+			disable_ddw = -1;
+			pr_info("ppc iommu: will force enable ddw.\n");
+		}
+	} else if (strcmp(param, "default") == 0) {
+		disable_ddw = 0;
+	}
 
 	return 0;
 }
@@ -1313,6 +1341,37 @@ static struct notifier_block iommu_reconfig_nb = {
 	.notifier_call = iommu_reconfig_notifier,
 };
 
+/* Check if DDW can be supported for this lpar */
+int ddw_supported(void)
+{
+	struct device_node *dn;
+
+	if (disable_ddw == -1) /* force enable ddw */
+		goto out;
+
+	if (disable_ddw == 1)
+		return 0;
+
+	/*
+	 * Due to DMA window limitations currently DDW is not supported
+	 * for persistent memory. This is due 1 TiB size of direct mapped
+	 * DMA window size limitation enforce by phyp. Since pmem memory
+	 * will be mapped at phy address > 4TiB, we cannot accmodate pmem
+	 * in the DDW window and DMA's to/from the pmem memory will result in
+	 * PHBs getting frozen triggering EEH. Hence for the the time being
+	 * disable DDW in presence of a 'ibm,pmemory' node.
+	 */
+	dn = of_find_compatible_node(NULL, NULL, "ibm,pmemory");
+	if (dn) {
+		pr_info("IOMMU: Disabling DDW as pmem memory available\n");
+		of_node_put(dn);
+		return 0;
+	}
+ out:
+	pr_info("IOMMU: Enabling DDW support\n");
+	return 1;
+}
+
 /* These are called very early. */
 void iommu_init_early_pSeries(void)
 {
@@ -1322,7 +1381,7 @@ void iommu_init_early_pSeries(void)
 	if (firmware_has_feature(FW_FEATURE_LPAR)) {
 		pseries_pci_controller_ops.dma_bus_setup = pci_dma_bus_setup_pSeriesLP;
 		pseries_pci_controller_ops.dma_dev_setup = pci_dma_dev_setup_pSeriesLP;
-		if (!disable_ddw)
+		if (ddw_supported())
 			pseries_pci_controller_ops.iommu_bypass_supported =
 				iommu_bypass_supported_pSeriesLP;
 	} else {
-- 
2.24.1

