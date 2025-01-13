Return-Path: <linuxppc-dev+bounces-5170-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B529BA0BDCD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 17:41:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWygd12YLz3cg1;
	Tue, 14 Jan 2025 03:41:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736786461;
	cv=none; b=FiYpiGtGEFATH8ROp/lJt0o6sMB+YrHhG0F9mrwRyu8onu9Fmwmz/njkNN+5P/JlfvafCsLt90iYThnruaRbgvM73Bnp6m9xI1RjfihdqM/xiQYhYSh3yDutIcxdImJy1ljsYl/zeqYSbQ/B2/FwYDlFtOHcZcqGJ9gOLwPA14ZPX5ABKn3p9oHDzsllTeabLav3QonKqYiVPlX7pqdUno7VzRYpHrs1Uh6AgSwBeAfQ2yvDhvX+O3DH350CtEDvwO+9lhxb863p+TDVEELQBBYNFW8XXDOduJkHaxaF5LEJU4pJk9hkfTKzxz122T6nqtipQw1lNDvHy2z0pV2Nww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736786461; c=relaxed/relaxed;
	bh=7duP/VN60KMYePyWXTesk0jVZPNWRBqcFNuJmEaY0Cs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LYkMmtsJWSF0LU73Zv2vknRG+Epi7hHyyJDDbsjzUhc+cvnz7dhZS6tDI0dFKO1TXkqkJImgWnY2T9nPKl+GkucMsikaXTi90xXtZ2FftC4ToD5NutlFQBFTXeAFUEEMZZs3bIgwLK2hiLCuWFqq8/2hU2r914OIy8HPI8Z5ojwr0y+DBn3H8D50mliZj1TooFdBh9QJW5wwoxG5O0GOP9u1uhkT8LluiqZ/7ph47wn8RyFK4ahlbXrVN0J9k+p+7BWeRKPX9h/t3vGlwZZNleTr+8sIVUhi9w9KLH+yKECsmDXqtyReuF3ezuIC4ZBobipmIjTAvnmY5ElOej0yRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hODh9Ehg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hODh9Ehg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWygc0Sqzz3cdh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 03:40:59 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DE7PaI021345
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 16:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=7duP/VN60KMYePyWX
	Tesk0jVZPNWRBqcFNuJmEaY0Cs=; b=hODh9EhgJrcW4weNcBPl6dC5V4/3xRk3A
	wd8ORy8y5pdDIDIPyns+grxTd+1bWjY0hsaE+S4GZ3edGHP9Vz97+hk5L5ChQY5o
	+yl6+eBouERdmfID/wPrJkZ34JzL64Li6i5uh/Xxh7rcys+93StoXTrGkCtMYirr
	eF61u9Isjb4NGASrj61GcyeOKXAwQVslQqFDknubi6n9e7aHNw80jGa/5dUL785R
	WPjQx0oLM1oWdDuZQ33r+HKqEFC1jP8bBH0F0FdYcm6kXo1NLkh129cjHEzmwDfO
	7DxJkHFA2yukhFmiZeMcHWWZ6cnyyyxI3qcwyo1UsIs3tGPh7BilA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4454a58r9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 16:40:56 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50DDsuhD016512
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 16:40:55 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4445p1ers0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 16:40:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DGeqDZ35848518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:40:52 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1122620063;
	Mon, 13 Jan 2025 16:40:52 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4AD5020043;
	Mon, 13 Jan 2025 16:40:51 +0000 (GMT)
Received: from ltcden3-lp4.aus.stglabs.ibm.com (unknown [9.53.174.155])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 16:40:51 +0000 (GMT)
From: adubey@linux.ibm.com
To: maddy@linux.ibm.com, atrajeev@linux.ibm.com, hbathini@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 RESEND 2/3] powerpc/pseries: Export hardware trace macro dump via debugfs
Date: Mon, 13 Jan 2025 11:40:38 -0500
Message-Id: <20250113164039.302017-2-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250113164039.302017-1-adubey@linux.ibm.com>
References: <20250113164039.302017-1-adubey@linux.ibm.com>
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
X-Proofpoint-GUID: 33Q4O3Age661acTM8dWcgqqwB0ztcjjO
X-Proofpoint-ORIG-GUID: 33Q4O3Age661acTM8dWcgqqwB0ztcjjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130135
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Abhishek Dubey <adubey@linux.ibm.com>

This patch adds debugfs interface to export Hardware Trace Macro (HTM)
function data in a LPAR. New hypervisor call "H_HTM" has been
defined to setup, configure, control and dump the HTM data.
This patch supports only dumping of HTM data in a LPAR.
New debugfs folder called "htmdump" has been added under
/sys/kernel/debug/arch path which contains files need to
pass required parameters for the H_HTM dump function. New Kconfig
option called "CONFIG_HTMDUMP" is added in platform/pseries
for the same.

With this module loaded, list of files in debugfs path

/sys/kernel/debug/powerpc/htmdump
coreindexonchip  htmtype  nodalchipindex  nodeindex  trace

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
  v5->v6 : Header file inclusion
  v4->v5 : Removed offset from available calculation, as offset is
           always zero leading to buffur size reads.
           Edited comments and commit message

v3 patch:
  https://lore.kernel.org/linuxppc-dev/20240828085223.42177-2-maddy@linux.ibm.com/

 arch/powerpc/platforms/pseries/Kconfig   |   9 ++
 arch/powerpc/platforms/pseries/Makefile  |   1 +
 arch/powerpc/platforms/pseries/htmdump.c | 121 +++++++++++++++++++++++
 3 files changed, 131 insertions(+)
 create mode 100644 arch/powerpc/platforms/pseries/htmdump.c

diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 42fc66e97539..b839e87408aa 100644
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
index 000000000000..57fc1700f604
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) IBM Corporation, 2024
+ */
+
+#define pr_fmt(fmt) "htmdump: " fmt
+
+#include <linux/debugfs.h>
+#include <linux/module.h>
+#include <asm/io.h>
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
2.39.3


