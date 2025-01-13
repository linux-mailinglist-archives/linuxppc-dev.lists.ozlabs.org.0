Return-Path: <linuxppc-dev+bounces-5140-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC0FA0B42E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 11:11:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWp1n0NDSz3cPZ;
	Mon, 13 Jan 2025 21:11:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736763069;
	cv=none; b=bHi2jxN7SXRMzHNY85Cubgj48KBk3mJp6kD74oUupHa5XBD/HZTrHxkfP3KHL3Bprvvx2B7Nyjh+rHJFsRFDNzk53kp359ZMMMlXceWIGmkNMx2qvsmSyCltZYCR3ldWWAPE5VPw5csQTmeq4EhDqcWxm67+CZjxybCvjfgkUW9be92iLiqmzQ34N/wp7CI2SRc/BA9YYw3N8nuNpTKgYQERdn0rCYWKbRSlWh0sgUvfTYFV1sUofEZoX4XYZV1IVyfqkhDnbGc6aWWjx5ZsSofElXP0Wky5XdH/KJPHGWr+36D47SdT6f/tXn1t1WyCuxgwHwf4tF1LLW11GiPd4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736763069; c=relaxed/relaxed;
	bh=qxxqhCClHiVLRPPRJLx19hnZmPYhUFEtP468uagrT8o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RHbnii54aiX/M4g+UgOLQx2cyra6ZGkD1vQk+QToi8LH8O4OBU+x/ITYn1UUxBwMGX54ZNDH+1VUqoj6aOyljPd+PRR4pSUW8X0fuU4cJowe0RTVwehET61qfpjt9p93scdsTsKpgN5+M/dcINlnFoZy6DG/i4eRVW3F/oga/bdWWDmxwlDtKXLgYRPqTXhGYVAAT4oEPmDnBXFp64dhqkIV1EPap3s75elVIUHubPpQDueH3c2NQHQPUhBJSMdo6NdIvNH+lHhF+/lQP5Hu4yoTQOKkh/PkHVgBzuYmRq1ltWCofmdI0s+LmMHhtliPzQ207GDyLXfjlOynKoLTkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nUAX4mFJ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nUAX4mFJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWp1m0SQpz2ynn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 21:11:07 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D3qqV9002387
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=qxxqhCClHiVLRPPRJLx19hnZmPYhUFEtP468uagrT
	8o=; b=nUAX4mFJAXLqI7g7ReEjrZ6mxJJ3YcQIcq40IrKaNkWmtGQXttuB0Zybg
	Qc7qcqqFuv62l0lwWRIyWZ0lOKVjgaAeuU/45jTQGHnFvCKVsP6YMrkMFtcwVcdh
	Hc2WjOPDPpOynDA4JmYQevckqrTQ26x9xhhTenpDVhpSFop8xz3S/BzTOKLRlfT+
	xMYUcdGFCQxm7J+rp/26TLlLffSB//QzO8nrlv5FNGbuJ21U5tKENNUhUddZEXaz
	bzGE0NVOW8YnOo4GXTyPL3BknT74QgGQ245N4GHUC6TtgyFV8vDRChsDQ287BwBX
	U0LGUMgKSboUGh/WpSF7YDUqAmGBw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444uagsaym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:11:06 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50D8Ppmd007371
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:11:05 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443ymwme9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:11:05 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DAB1m311338224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 10:11:01 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4998A20063;
	Mon, 13 Jan 2025 10:11:01 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D7102005A;
	Mon, 13 Jan 2025 10:11:00 +0000 (GMT)
Received: from ltcden3-lp4.aus.stglabs.ibm.com (unknown [9.53.174.155])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 10:11:00 +0000 (GMT)
From: adubey@linux.ibm.com
To: maddy@linux.ibm.com, atrajeev@linux.ibm.com, hbathini@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 2/3] powerpc/pseries: Export hardware trace macro dump via debugfs
Date: Mon, 13 Jan 2025 05:10:57 -0500
Message-Id: <20250113101057.289793-1-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
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
X-Proofpoint-ORIG-GUID: CjVgaa7901fX7_Undd6WY7eoiY4k8QCq
X-Proofpoint-GUID: CjVgaa7901fX7_Undd6WY7eoiY4k8QCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130084
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


