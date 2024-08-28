Return-Path: <linuxppc-dev+bounces-662-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE68F9622CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 10:52:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtyq65T5vz2yYf;
	Wed, 28 Aug 2024 18:52:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724835170;
	cv=none; b=mprO8+KpPg+DS7/iuDRicC6q44j3LiHfelU/DqldZOx8hsXUkNvlXQb0NDvq0UAxHrzkwM/qgwWPH6F6cwxcXdrPakMNyhc7PNNcBo672jbRJFgyTzS6yrQRaREv/DhyyGCbtqA/IzbucCalPEFX8zLz/z+q4hhbXHA1vfVe9l0/yRSjyJL8lNkRnG+P+HE6wwG9ewUaFhzV5L1eSrpym811HRe6qckPTg2j5TZCDyK0ZSNRiYPCphGR353pTW9BZvzqtBt/60G4r0tHzYCgN06e4DbB7W56D5X2KEV/2sylCjxEdSXzs6yEg4EdJita5rj3kqWeU8y5zPM3a+N+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724835170; c=relaxed/relaxed;
	bh=CEiKy2YteHbQdjifF6R+UrKVKMM0Iw+q4nqvKGDr+2A=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details; b=ZsgzvJl84f5UvRd8e5YtnSEhRWi8ooPcaSbiyUWSGPdg+gOddYMp0FuB0HHevMVIBQ5TWbHAh6QZG7P/HaQjXpZxmrrpnv5ZmC2rJ5Ft2NYkvLgwaFzrnNiYhGsgxPk8hQDCcpxzncJ0nythWbeLSuRuWtvJln4grKpoT9ayMNRs39/IdO3T2FtRYoVXCMhWmDPaIUL653nXKFg2szGap78oJ/40W1nXG8bgtFT8IIS6ZG+hfTEI6Qj+IBeKf4jVpcO08P0kqJjQPEJo3n+YF0dgDyr7nDPkKRTcGzT0hvyaLaJ6emXSkKENNg17swk3ClNaev8LSj/fCauZhDCkdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IBUnh7xc; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IBUnh7xc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtyq62y6Kz2xpv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 18:52:50 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RM36R2011663;
	Wed, 28 Aug 2024 08:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=CEiKy2YteHbQd
	jifF6R+UrKVKMM0Iw+q4nqvKGDr+2A=; b=IBUnh7xcQmCWTmFoKjTD3E4bUH+7o
	PncwyspxNWwnQpE5D3MYnQgTtxkXfywk7VSC50WKNGFtNmFtQj3grMYQED6yvg8O
	XnL/BIo0fgOwzNNfDGL3TOwnC+V1d36iMaLKyU8tnMwXf9Na4AwTZ7yRtri8UMvF
	XIsn9axZ8DoSGDim0WPmvPRPXXBA4M/+PfDOAbHWHoFqJBSIEeduXRA9gO0MQQQS
	EPuo/7QEZEOinGtKOjvG95KZDZk/Tzwc+hEcJD6gg7WrDqOIoF/8QGMb0u8i5vfZ
	VtfRkkj8nzsaF/PSBtWmBGyxCM9q0cClvdsmscDS685TKUssLpK+QV2gQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8nsy2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 08:52:42 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47S8qfVc008136;
	Wed, 28 Aug 2024 08:52:41 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8nsy2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 08:52:41 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47S6Kmx7027941;
	Wed, 28 Aug 2024 08:52:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 417ubn6n3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 08:52:40 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47S8qagd49807802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Aug 2024 08:52:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D07920043;
	Wed, 28 Aug 2024 08:52:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C74420040;
	Wed, 28 Aug 2024 08:52:34 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.122.25])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Aug 2024 08:52:34 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v3 2/3] powerpc/pseries: Export hardware trace macro dump via debugfs
Date: Wed, 28 Aug 2024 14:22:22 +0530
Message-ID: <20240828085223.42177-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240828085223.42177-1-maddy@linux.ibm.com>
References: <20240828085223.42177-1-maddy@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vtUIy6XUq_i58cL-EPkkRoPtSznI0K6X
X-Proofpoint-ORIG-GUID: XP5ioWcndm7zfWBkFGq5IqKSTu6-daIS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280060

This patch adds debugfs interface to export Hardware Trace Macro (HTM)
function data in a LPAR. New hypervisor call "H_HTM" has been
defined to setup, configure, control and dump the HTM data.
This patch supports only dumping of HTM data in a LPAR.
New debugfs folder called "htmdump" has been added under
/sys/kernel/debug/arch path which contains files need to
pass required parameters for the H_HTM dump function. New Kconfig
option called "CONFIG_HTMDUMP" has been in platform/pseries for the same.

With this module loaded, list of files in debugfs path

/sys/kernel/debug/powerpc/htmdump
coreindexonchip  htmtype  nodalchipindex  nodeindex  trace

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v2:
- Made driver as modules based on review comments
Changelog v1:
- Changed from tristate to bool with dependency flags
- Trimmed the include headers

 arch/powerpc/platforms/pseries/Kconfig   |   9 ++
 arch/powerpc/platforms/pseries/Makefile  |   1 +
 arch/powerpc/platforms/pseries/htmdump.c | 130 +++++++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 arch/powerpc/platforms/pseries/htmdump.c

diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index afc0f6a61337..a66be66d690e 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -128,6 +128,15 @@ config CMM
 	  will be reused for other LPARs. The interface allows firmware to
 	  balance memory across many LPARs.
 
+config HTMDUMP
+	tristate "PHYP HTM data dumper"
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
index 000000000000..54c28525c4a7
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
+#include <linux/debugfs.h>
+
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
+static u32 nodeindex;
+static u32 nodalchipindex;
+static u32 coreindexonchip;
+static u32 htmtype;
+static struct dentry *htmdump_debugfs_dir;
+static struct htmdump_entry *ent;
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
+	switch (rc) {
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
+static int htmdump_init_debugfs(void)
+{
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
+static int __init htmdump_init(void)
+{
+	if (htmdump_init_debugfs())
+		return -EINVAL;
+
+	return 0;
+}
+
+static void __exit htmdump_exit(void)
+{
+	debugfs_remove_recursive(htmdump_debugfs_dir);
+	kfree(ent->buf);
+	kfree(ent);
+}
+
+module_init(htmdump_init);
+module_exit(htmdump_exit);
+MODULE_DESCRIPTION("PHYP Hardware Trace Macro (HTM) data dumper");
+MODULE_LICENSE("GPL");
-- 
2.45.2


