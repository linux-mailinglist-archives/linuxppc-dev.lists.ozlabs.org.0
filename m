Return-Path: <linuxppc-dev+bounces-4547-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC02D9FF326
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2025 07:47:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YNL4b4c4Kz2yjb;
	Wed,  1 Jan 2025 17:47:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735714063;
	cv=none; b=OqCRlSIZpI6hzOkgI2QA1PCgnRy+cgC/2RGtAXQNYmqxlkyd6aHlpzXHMODf1qJD37nDMz0Wi14jhlvx02tQvSyRYwx/hByNNxqNiISd9ynbDxNZhlOT8OUcLoEvp1OhsHHoE1E5u+DjLQ8cblmrSzMVv2ne0gvfj4kQ3dmfpZair3hqvJfi+Q7Pxij/+l9BUULwiK8aW+eUVX1l48NFIZK0SbaT/B/VrfeeVJTzFSJXuxAEVMCgln+jdQS+PSwc9P4wQ3GftDNNey+Oka1CZOcwSSf9cTQMvE3smthcVIAFEOn9sPyDZCGyBDPVWUOPtL09DxeDaUy2XSE76CDk2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735714063; c=relaxed/relaxed;
	bh=LXrYCPtMJg6/B7WYM4ZSoWOiMsCprVPbDq+JXzElec8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nIofdEEwgu0902CvpSomHMruHdGaS2mJ+6iKarzgEZGmeu1veW0JBuaGqkEJvSJpJt0xxrlHlNMYMQa883JOHKE4np638i2hcCQGttnv87PCxNOotF88HGF5zlXFi15uuY0ifWaZauMgk90aYJuN24P3zPV/K82hMHuH085cQWzhFUVcSqro5KJOF5ECexHjhRJK0WHzWS68yTGh0L341sLWMmYMMEfEkgorM30mZJHfDDexlpAoT0ij5GTRpj17GU/cGoJGyARkkFOpRR+ymkZ8tDfQ8JQIv+WfufbZ70hHHTc742eyxqBZy2f1O7uyKGbuuFbahGAvDym7Gjxopw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nn8eyDXo; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nn8eyDXo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YNL4Z3vxjz2y66
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jan 2025 17:47:42 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5014Q7Hb010428
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Jan 2025 06:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=LXrYCPtMJg6/B7WYM
	4ZSoWOiMsCprVPbDq+JXzElec8=; b=Nn8eyDXokxbj/IAY1nUefGpUKiGqBn4nf
	Oxs8SzlX8IC41w9o+bKsB/TK/i+5DpFQwlfVz10zMO/eMSRteLTeoFPyHGrydXzK
	yNa/MGLrt9Dt98qzjHqTPbAB6QILnF1Aa4laftF2coz2YhduwC4Hc1AYfifVSAnz
	eAWzRBKbLE/LNSsoZ2AIcU4PFJcvCYF64YpzZ2Zwz8LVGrsNUBfw6+2W5kieQDyF
	xT1e5CMHDYL0Fhvqfu0Ijha/1O7+NS1b2D/EjSE4kQNFdeFGT2HVJwrb1TFtm/rQ
	mqPNqqG5y0IOlMhS19cyyGZRFx9yfdULSsZER6Fxg1TY2f2izgtLA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43vct33jpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jan 2025 06:47:39 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5012A3Lj004362
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Jan 2025 06:47:38 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43twvjw2bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jan 2025 06:47:38 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5016lYli35914102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jan 2025 06:47:34 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A87B20040;
	Wed,  1 Jan 2025 06:47:34 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 447A820043;
	Wed,  1 Jan 2025 06:47:33 +0000 (GMT)
Received: from ltcden3-lp14.aus.stglabs.ibm.com (unknown [9.53.174.165])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jan 2025 06:47:33 +0000 (GMT)
From: Abhishek Dubey <adubey@linux.ibm.com>
To: maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com, hbathini@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH v5 2/3] powerpc/pseries: Export hardware trace macro dump via debugfs
Date: Wed,  1 Jan 2025 01:47:30 -0500
Message-ID: <54da5843f92c71cbab5a8050f7873572a4942398.1734277855.git.adubey@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <a102e9d6923c4696c54f399b5c5ded7d28415fa5.1734277855.git.adubey@linux.ibm.com>
References: <a102e9d6923c4696c54f399b5c5ded7d28415fa5.1734277855.git.adubey@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vRJO93-A4Md2yTv_6eRAzHIp3PLPT0pU
X-Proofpoint-ORIG-GUID: vRJO93-A4Md2yTv_6eRAzHIp3PLPT0pU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501010054
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This patch adds debugfs interface to export Hardware Trace Macro (HTM)
function data in a LPAR. New hypervisor call "H_HTM" has been
defined to setup, configure, control and dump the HTM data.
This patch supports only dumping of HTM data in a LPAR.
New debugfs folder called "htmdump" has been added under
/sys/kernel/debug/arch path which contains files need to
pass required parameters for the H_HTM dump function. New Kconfig
option called "CONFIG_HTMDUMP" introduced in platform/pseries for the same.

With this module loaded, list of files in debugfs path

/sys/kernel/debug/powerpc/htmdump
coreindexonchip  htmtype  nodalchipindex  nodeindex  trace

Changelog:
  v4->v5 : Removed offset from available calculation, as offset is
           always zero leading to buffur size reads.
           Edited comments and commit message

v3 patch:
  https://lore.kernel.org/linuxppc-dev/20240828085223.42177-2-maddy@linux.ibm.com/

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/Kconfig   |   9 ++
 arch/powerpc/platforms/pseries/Makefile  |   1 +
 arch/powerpc/platforms/pseries/htmdump.c | 120 +++++++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 arch/powerpc/platforms/pseries/htmdump.c

diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index afc0f6a61337..e0fcd4bef986 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -128,6 +128,15 @@ config CMM
 	  will be reused for other LPARs. The interface allows firmware to
 	  balance memory across many LPARs.
 
+config HTMDUMP
+	tristate "PowerVM data dumper"
+	depends on PPC_PSERIES && DEBUG_FS
+	default m
+	help
+	  Select this option, if you want to enable the kernel debugfs
+	  interface to dump the Hardware Trace Macro (HTM) function data
+	  in the LPAR.
+
 config HV_PERF_CTRS
 	bool "Hypervisor supplied PMU events (24x7 & GPCI)"
 	default y
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 7bf506f6b8c8..3f3e3492e436 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_HVC_CONSOLE)	+= hvconsole.o
 obj-$(CONFIG_HVCS)		+= hvcserver.o
 obj-$(CONFIG_HCALL_STATS)	+= hvCall_inst.o
 obj-$(CONFIG_CMM)		+= cmm.o
+obj-$(CONFIG_HTMDUMP)		+= htmdump.o
 obj-$(CONFIG_IO_EVENT_IRQ)	+= io_event_irq.o
 obj-$(CONFIG_LPARCFG)		+= lparcfg.o
 obj-$(CONFIG_IBMVIO)		+= vio.o
diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
new file mode 100644
index 000000000000..9ba0507e54d7
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) IBM Corporation, 2024
+ */
+
+#define pr_fmt(fmt) "htmdump: " fmt
+
+#include <linux/debugfs.h>
+#include <linux/module.h>
+#include <asm/machdep.h>
+#include <asm/plpar_wrappers.h>
+
+static void *htm_buf;
+static u32 nodeindex;
+static u32 nodalchipindex;
+static u32 coreindexonchip;
+static u32 htmtype;
+static struct dentry *htmdump_debugfs_dir;
+
+static ssize_t htmdump_read(struct file *filp, char __user *ubuf,
+			     size_t count, loff_t *ppos)
+{
+	void *htm_buf = filp->private_data;
+	unsigned long page, read_size, available;
+	loff_t offset;
+	long rc;
+
+	page = ALIGN_DOWN(*ppos, PAGE_SIZE);
+	offset = (*ppos) % PAGE_SIZE;
+
+	rc = htm_get_dump_hardware(nodeindex, nodalchipindex, coreindexonchip,
+				   htmtype, virt_to_phys(htm_buf), PAGE_SIZE, page);
+
+	switch (rc) {
+	case H_SUCCESS:
+	/* H_PARTIAL for the case where all available data can't be
+	 * returned due to buffer size constraint.
+	 */
+	case H_PARTIAL:
+		break;
+	/* H_NOT_AVAILABLE indicates reading from an offset outside the range,
+	 * i.e. past end of file.
+	 */
+	case H_NOT_AVAILABLE:
+		return 0;
+	case H_BUSY:
+	case H_LONG_BUSY_ORDER_1_MSEC:
+	case H_LONG_BUSY_ORDER_10_MSEC:
+	case H_LONG_BUSY_ORDER_100_MSEC:
+	case H_LONG_BUSY_ORDER_1_SEC:
+	case H_LONG_BUSY_ORDER_10_SEC:
+	case H_LONG_BUSY_ORDER_100_SEC:
+		return -EBUSY;
+	case H_PARAMETER:
+	case H_P2:
+	case H_P3:
+	case H_P4:
+	case H_P5:
+	case H_P6:
+		return -EINVAL;
+	case H_STATE:
+		return -EIO;
+	case H_AUTHORITY:
+		return -EPERM;
+	}
+
+	available = PAGE_SIZE;
+	read_size = min(count, available);
+	*ppos += read_size;
+	return simple_read_from_buffer(ubuf, count, &offset, htm_buf, available);
+}
+
+static const struct file_operations htmdump_fops = {
+	.llseek = NULL,
+	.read	= htmdump_read,
+	.open	= simple_open,
+};
+
+static int htmdump_init_debugfs(void)
+{
+	htm_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!htm_buf) {
+		pr_err("Failed to allocate htmdump buf\n");
+		return -ENOMEM;
+	}
+
+	htmdump_debugfs_dir = debugfs_create_dir("htmdump",
+						  arch_debugfs_dir);
+
+	debugfs_create_u32("nodeindex", 0600,
+			htmdump_debugfs_dir, &nodeindex);
+	debugfs_create_u32("nodalchipindex", 0600,
+			htmdump_debugfs_dir, &nodalchipindex);
+	debugfs_create_u32("coreindexonchip", 0600,
+			htmdump_debugfs_dir, &coreindexonchip);
+	debugfs_create_u32("htmtype", 0600,
+			htmdump_debugfs_dir, &htmtype);
+	debugfs_create_file("trace", 0400, htmdump_debugfs_dir, htm_buf, &htmdump_fops);
+
+	return 0;
+}
+
+static int __init htmdump_init(void)
+{
+	if (htmdump_init_debugfs())
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void __exit htmdump_exit(void)
+{
+	debugfs_remove_recursive(htmdump_debugfs_dir);
+	kfree(htm_buf);
+}
+
+module_init(htmdump_init);
+module_exit(htmdump_exit);
+MODULE_DESCRIPTION("PHYP Hardware Trace Macro (HTM) data dumper");
+MODULE_LICENSE("GPL");
-- 
2.44.0


