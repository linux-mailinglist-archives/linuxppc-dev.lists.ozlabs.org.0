Return-Path: <linuxppc-dev+bounces-5144-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFC0A0B4B1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 11:40:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWpgd0NZWz30Q3;
	Mon, 13 Jan 2025 21:40:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736764829;
	cv=none; b=Y9GRl8XSePon2PZLKTcUaJ7bgR+QKokQKvLJISPP5IMcBRrpvKsEmhiMg2KPwpQuPBc5K+i9Y5+572a5oBdwDQo0QrogL16fS7njhjCFzLEIQlu6NWrUCuz3GBR414urth6x7uYPHUr8RiIa2RtCyJFjyyZwEGTx5nJyNnk/A5S8isJKFCZHAYPZP3dmdjePJyse9fH/PqJ54CxG2rC9Y4BK56Nvqup4fcnVv9FeLrhVacjldvP4wubj0zbI6nUI5HiREEOKpWH3WVlgfR7CqaO0oa1DoyaWQMfoKnYmrUTjm4KzyIVjdN9I7JA2cWSsxC6ZDU0rAOjelKiHmnTt9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736764829; c=relaxed/relaxed;
	bh=qxxqhCClHiVLRPPRJLx19hnZmPYhUFEtP468uagrT8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O8cUYJKB9mrd/BaWMf7ZS9lWEvsgQ77dKJDBH3fmMYDjTFtikGTNQFkOvE0UcDA+9la1kkTg8zPdxR946VxSCOqp8RU0es6rq8OyE4ByWwSGuOOCWtWg/DaYtmDsM6i0BcBs6CEpPVYNMTDhJ5WYhML1ndSYFOJZOisQXBnnvlkiTiQ7Vyr1O8z9YxjqMl/0wVc78tKF6dAmb4TVqDpUAjJUFg17dv2i6gXOr45woCB8CJI4I0emt8QMDXZVbNqpp0bQrWmg1aJD9nR9fqMFpXkioJL5AEo7qJ04IfQxIWoDk7WasvECHRESmJUOZmRKQXjRkbIF0n6y3jp2wpXPyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C2m8MeLI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C2m8MeLI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWpgc1Z1vz2yRF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 21:40:27 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D0kBCp002392
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=qxxqhCClHiVLRPPRJ
	Lx19hnZmPYhUFEtP468uagrT8o=; b=C2m8MeLI5YDhvxJnmoIkIBAkS0Ah7nxxF
	rzQaHyiXH/TS/IqqB0dKLamaUJRzsLaUhNPQcw51wZzS8iGgA2WJwA1p9Dl8eKip
	+OWbf8EFImeVDs8f4IjffBOpCAkVvWl1T56QCVTrIBz52La8eWzh/0RzU3AhU6fI
	bqfDzsnxweOLfj807qbjE12IH7IxcjLgze9+LF3A+0VRJ69mL/1A9Ndz6D4hUvf5
	1DGV+zFvsHhwpMvNhl1qzwj2DHB73Mc02P9/egnbN8XUCWBAdDFDkR6AucHLI9dI
	OoJ+Rj4Q8Ik14QadL2mC3IMB/Hbh3fGH0oQ5+2GkWtetvqytb6RYg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444f74k780-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:40:25 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50D8Q450007994
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:40:25 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443ymwqba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:40:25 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DAeLmc53215510
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 10:40:21 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E0CB2004D;
	Mon, 13 Jan 2025 10:40:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D2A382004B;
	Mon, 13 Jan 2025 10:40:20 +0000 (GMT)
Received: from ltcden3-lp4.aus.stglabs.ibm.com (unknown [9.53.174.155])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 10:40:20 +0000 (GMT)
From: adubey@linux.ibm.com
To: maddy@linux.ibm.com, atrajeev@linux.ibm.com, hbathini@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 2/3] powerpc/pseries: Export hardware trace macro dump via debugfs
Date: Mon, 13 Jan 2025 05:40:14 -0500
Message-Id: <20250113104015.290566-2-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250113104015.290566-1-adubey@linux.ibm.com>
References: <20250113104015.290566-1-adubey@linux.ibm.com>
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
X-Proofpoint-GUID: kBOShFl3oWnXIglx-VEX8FTEJW6aGkwG
X-Proofpoint-ORIG-GUID: kBOShFl3oWnXIglx-VEX8FTEJW6aGkwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501130089
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

Changelog:
  v5->v6 : Header file inclusion
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


