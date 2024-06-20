Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 906D1910F57
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 19:48:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g4sToxHX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4nzJ1XYbz3cV4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 03:48:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g4sToxHX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4nxy5Lxmz3cXV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 03:47:34 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHQHAY004500;
	Thu, 20 Jun 2024 17:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=wmCCtQu9q8Vpp
	asZvVTCBBVuanYtFe8mOC4ySQvKyIA=; b=g4sToxHXhTtE6XPUdtsKUiG1ow6Vu
	MYkOOiUVO7zCOESbzcHcnNEL3CN4GYzeNd/3NqLre5cnsetH3wnv36gUjhYFOSMg
	9d7aNEw2mPD8w6EVcRz+9IfQuA9yuyBQMGXKFWyVOxqO9RGBnLaC9Nm+g8Cipuqa
	BbuWz0XcevysRlU526eJqEDtFoooz+LpThPC+70570/yh9OHuWnOKKZHVO43jFzP
	twCMPGg5OD1wAUO69ErtODYif9nb29ZQIunpPqgS0xEqAuhVuVoDzjWg0qt0WKXL
	7XmNka/0FAJyD4eXgQuEcMmMhDvIk1L+ykl9fX5IF1kVk9Ewqo1Htl5+Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yvrss0216-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 17:47:28 +0000 (GMT)
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45KHlSPq008331;
	Thu, 20 Jun 2024 17:47:28 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yvrss0213-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 17:47:28 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45KHJlGl025658;
	Thu, 20 Jun 2024 17:47:27 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yvrqv06jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 17:47:27 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45KHlLJG51380586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Jun 2024 17:47:23 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDD8320049;
	Thu, 20 Jun 2024 17:47:21 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A33F820040;
	Thu, 20 Jun 2024 17:47:18 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.195.32.74])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 20 Jun 2024 17:47:18 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/3] powerpc/pseries: Export hardware trace macro dump via debugfs
Date: Thu, 20 Jun 2024 23:16:13 +0530
Message-ID: <20240620174614.53751-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620174614.53751-1-maddy@linux.ibm.com>
References: <20240620174614.53751-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zJtDoSmiMWSVZFNpZSre7sh_iin1Qexu
X-Proofpoint-ORIG-GUID: rwOBzIJY4yNgRidxEDlYyYJ6xm_eJToG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_08,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406200126
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, christophe.leroy@csgroup.eu, Madhavan Srinivasan <maddy@linux.ibm.com>, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch adds debugfs interface to export Hardware Trace Macro (HTM)
function data in a LPAR. New hypervisor call "H_HTM" has been
defined to setup, configure, control and dump the HTM data.
This patch supports only dumping of HTM data in a LPAR.
New debugfs folder called "htmdump" has been added under
/sys/kernel/debug/arch path which contains files need to
pass required parameters for the H_HTM dump function. New Kconfig
option called "CONFIG_HTMDUMP" has been in platform/pseries for the same.

With patch series applied and booted, list of files in debugfs path

# pwd
/sys/kernel/debug/powerpc/htmdump
# ls
coreindexonchip  htmtype  nodalchipindex  nodeindex  trace

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/Kconfig   |   8 ++
 arch/powerpc/platforms/pseries/Makefile  |   1 +
 arch/powerpc/platforms/pseries/htmdump.c | 130 +++++++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 arch/powerpc/platforms/pseries/htmdump.c

diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index afc0f6a61337..46c0ea605e33 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -128,6 +128,14 @@ config CMM
 	  will be reused for other LPARs. The interface allows firmware to
 	  balance memory across many LPARs.
 
+config HTMDUMP
+	tristate "PHYP HTM data dumper"
+	default y
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
index 000000000000..540cdb7e069c
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/htmdump.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) IBM Corporation, 2024
+ */
+
+#define pr_fmt(fmt) "htmdump: " fmt
+
+#include <linux/bitops.h>
+#include <linux/string.h>
+#include <linux/init.h>
+#include <linux/moduleparam.h>
+#include <linux/fs.h>
+#include <linux/debugfs.h>
+#include <linux/slab.h>
+#include <linux/memory.h>
+#include <linux/memory_hotplug.h>
+#include <linux/numa.h>
+#include <linux/memblock.h>
+#include <asm/machdep.h>
+#include <asm/plpar_wrappers.h>
+
+/* This enables us to keep track of the memory removed from each node. */
+struct htmdump_entry {
+	void *buf;
+	struct dentry *dir;
+	char name[16];
+};
+
+static u32 nodeindex = 0;
+static u32 nodalchipindex = 0;
+static u32 coreindexonchip = 0;
+static u32 htmtype = 0;
+
+#define BUFFER_SIZE PAGE_SIZE
+
+static ssize_t htmdump_read(struct file *filp, char __user *ubuf,
+			     size_t count, loff_t *ppos)
+{
+	struct htmdump_entry *ent = filp->private_data;
+	unsigned long page, read_size, available;
+	loff_t offset;
+	long rc;
+
+	page = ALIGN_DOWN(*ppos, BUFFER_SIZE);
+	offset = (*ppos) % BUFFER_SIZE;
+
+	rc = htm_get_dump_hardware(nodeindex, nodalchipindex, coreindexonchip,
+				   htmtype, virt_to_phys(ent->buf), BUFFER_SIZE, page);
+
+	switch(rc) {
+	case H_SUCCESS:
+	case H_PARTIAL:
+		break;
+	case H_NOT_AVAILABLE:
+		return 0;
+	case H_BUSY:
+	case H_LONG_BUSY_ORDER_1_MSEC:
+	case H_LONG_BUSY_ORDER_10_MSEC:
+	case H_LONG_BUSY_ORDER_100_MSEC:
+	case H_LONG_BUSY_ORDER_1_SEC:
+	case H_LONG_BUSY_ORDER_10_SEC:
+	case H_LONG_BUSY_ORDER_100_SEC:
+	case H_PARAMETER:
+	case H_P2:
+	case H_P3:
+	case H_P4:
+	case H_P5:
+	case H_P6:
+	case H_STATE:
+	case H_AUTHORITY:
+		return -EINVAL;
+	}
+
+	available = BUFFER_SIZE - offset;
+	read_size = min(count, available);
+	*ppos += read_size;
+	return simple_read_from_buffer(ubuf, count, &offset, ent->buf, available);
+}
+
+static const struct file_operations htmdump_fops = {
+	.llseek = default_llseek,
+	.read	= htmdump_read,
+	.open	= simple_open,
+};
+
+static struct dentry *htmdump_debugfs_dir;
+
+static int htmdump_init_debugfs(void)
+{
+	struct htmdump_entry *ent;
+
+	ent = kcalloc(1, sizeof(struct htmdump_entry), GFP_KERNEL);
+	if (!ent) {
+		pr_err("Failed to allocate ent\n");
+		return -EINVAL;
+	}
+
+	ent->buf = kmalloc(BUFFER_SIZE, GFP_KERNEL);
+	if (!ent->buf) {
+		pr_err("Failed to allocate htmdump buf\n");
+		return -ENOMEM;
+	}
+
+	pr_debug("%s: ent:%lx buf:%lx\n",
+			__func__, (long unsigned int)ent, (long unsigned int)ent->buf);
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
+	debugfs_create_file("trace", 0400, htmdump_debugfs_dir, ent, &htmdump_fops);
+
+	return 0;
+}
+
+static int htmdump_init(void)
+{
+	if (htmdump_init_debugfs())
+		return -EINVAL;
+
+	return 0;
+}
+machine_device_initcall(pseries, htmdump_init);
-- 
2.45.2

