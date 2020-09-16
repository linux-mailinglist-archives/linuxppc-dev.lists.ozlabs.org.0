Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4B126D08D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 03:24:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsK4Q10NJzF1Hm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 11:24:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WOFdDGYl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsJSl3jM0zDqVL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 10:56:39 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08GH3SMR102786; Wed, 16 Sep 2020 13:23:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uGc9rFlewcU2NGyrRWC0NxTGVzlG+cBwooz3Wt5Kryw=;
 b=WOFdDGYlX8MTpR2OAnpJowpvADjiA3BHErPJYfDCzvZqjAZSsZt74gtRcHV3w9hS37nd
 XDWaY9lBHtJDPRSCeyvClujwIQsQ1MGU4fo8N52FOxHtYItApmEiJ8MCy6FtEcQxUcOb
 z+6yoi/MTB0HRV8xIxLWhNMQx79Tgib0N+MU+cUuMejPOgbKKkBHT5GR2F0xUqkEu8G4
 nN/Z2KZTDFZiyIclawSnFRgubyB/XkoGOGJChiLC/20KU33Tdy/9P5n5DipiRnMiPUOr
 fBwu4JMSBgktfTfxH6iW9I9Bmk4MtStivwyv6tgfLknxK31wrBmsFfl4L6bwYSFE/vzs wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33kpk2rsfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 13:22:59 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08GH3U1G102854;
 Wed, 16 Sep 2020 13:22:58 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33kpk2rsew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 13:22:58 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08GH3K0d017592;
 Wed, 16 Sep 2020 17:22:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 33k623gf93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 17:22:55 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08GHMreF23724370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Sep 2020 17:22:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9157142042;
 Wed, 16 Sep 2020 17:22:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07FFA42041;
 Wed, 16 Sep 2020 17:22:52 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.102.2.13])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Sep 2020 17:22:51 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 2/3] powerpc/mce: Add debugfs interface to inject MCE
Date: Wed, 16 Sep 2020 22:52:27 +0530
Message-Id: <20200916172228.83271-3-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916172228.83271-1-ganeshgr@linux.ibm.com>
References: <20200916172228.83271-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_11:2020-09-16,
 2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160120
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
Cc: mahesh@linux.vnet.ibm.com, msuchanek@suse.de,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To test machine check handling, add debugfs interface to inject
slb multihit errors.

To inject slb multihit:
 #echo 1 > /sys/kernel/debug/powerpc/mce_error_inject/inject_slb_multihit

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
Signed-off-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
---
 arch/powerpc/Kconfig.debug             |   9 ++
 arch/powerpc/sysdev/Makefile           |   2 +
 arch/powerpc/sysdev/mce_error_inject.c | 148 +++++++++++++++++++++++++
 3 files changed, 159 insertions(+)
 create mode 100644 arch/powerpc/sysdev/mce_error_inject.c

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index b88900f4832f..61db133f2f0d 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -398,3 +398,12 @@ config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN
 	default 0xe0000000
+
+config MCE_ERROR_INJECT
+	bool "Enable MCE error injection through debugfs"
+	depends on DEBUG_FS
+	default y
+	help
+	  This option creates an mce_error_inject directory in the
+	  powerpc debugfs directory that allows limited injection of
+	  Machine Check Errors (MCEs).
diff --git a/arch/powerpc/sysdev/Makefile b/arch/powerpc/sysdev/Makefile
index 026b3f01a991..7fc102222b77 100644
--- a/arch/powerpc/sysdev/Makefile
+++ b/arch/powerpc/sysdev/Makefile
@@ -52,3 +52,5 @@ obj-$(CONFIG_PPC_XICS)		+= xics/
 obj-$(CONFIG_PPC_XIVE)		+= xive/
 
 obj-$(CONFIG_GE_FPGA)		+= ge/
+
+obj-$(CONFIG_MCE_ERROR_INJECT)	+= mce_error_inject.o
diff --git a/arch/powerpc/sysdev/mce_error_inject.c b/arch/powerpc/sysdev/mce_error_inject.c
new file mode 100644
index 000000000000..ca4726bfa2d9
--- /dev/null
+++ b/arch/powerpc/sysdev/mce_error_inject.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Machine Check Exception injection code
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include <linux/fs.h>
+#include <linux/debugfs.h>
+#include <asm/debugfs.h>
+
+static inline unsigned long get_slb_index(void)
+{
+	unsigned long index;
+
+	index = get_paca()->stab_rr;
+
+	/*
+	 * simple round-robin replacement of slb starting at SLB_NUM_BOLTED.
+	 */
+	if (index < (mmu_slb_size - 1))
+		index++;
+	else
+		index = SLB_NUM_BOLTED;
+	get_paca()->stab_rr = index;
+	return index;
+}
+
+#define slb_esid_mask(ssize)	\
+	(((ssize) == MMU_SEGSIZE_256M) ? ESID_MASK : ESID_MASK_1T)
+
+static inline unsigned long mk_esid_data(unsigned long ea, int ssize,
+					 unsigned long slot)
+{
+	return (ea & slb_esid_mask(ssize)) | SLB_ESID_V | slot;
+}
+
+#define slb_vsid_shift(ssize)	\
+	((ssize) == MMU_SEGSIZE_256M ? SLB_VSID_SHIFT : SLB_VSID_SHIFT_1T)
+
+static inline unsigned long mk_vsid_data(unsigned long ea, int ssize,
+					 unsigned long flags)
+{
+	return (get_kernel_vsid(ea, ssize) << slb_vsid_shift(ssize)) | flags |
+		((unsigned long)ssize << SLB_VSID_SSIZE_SHIFT);
+}
+
+static void insert_slb_entry(char *p, int ssize)
+{
+	unsigned long flags, entry;
+	struct paca_struct *paca;
+
+	flags = SLB_VSID_KERNEL | mmu_psize_defs[MMU_PAGE_64K].sllp;
+
+	preempt_disable();
+
+	paca = get_paca();
+
+	entry = get_slb_index();
+	asm volatile("slbmte %0,%1" :
+			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
+			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
+			: "memory");
+
+	entry = get_slb_index();
+	asm volatile("slbmte %0,%1" :
+			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
+			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
+			: "memory");
+	preempt_enable();
+	p[0] = '!';
+}
+
+static void inject_vmalloc_slb_multihit(void)
+{
+	char *p;
+
+	p = vmalloc(2048);
+	if (!p)
+		return;
+
+	insert_slb_entry(p, MMU_SEGSIZE_1T);
+	vfree(p);
+}
+
+static void inject_kmalloc_slb_multihit(void)
+{
+	char *p;
+
+	p = kmalloc(2048, GFP_KERNEL);
+	if (!p)
+		return;
+
+	insert_slb_entry(p, MMU_SEGSIZE_1T);
+	kfree(p);
+}
+
+static ssize_t inject_slb_multihit(const char __user *u_buf, size_t count)
+{
+	char buf[32];
+	size_t buf_size;
+
+	buf_size = min(count, (sizeof(buf) - 1));
+	if (copy_from_user(buf, u_buf, buf_size))
+		return -EFAULT;
+	buf[buf_size] = '\0';
+
+	if (buf[0] != '1')
+		return -EINVAL;
+
+	inject_vmalloc_slb_multihit();
+	inject_kmalloc_slb_multihit();
+	return count;
+}
+
+static ssize_t inject_write(struct file *file, const char __user *buf,
+			    size_t count, loff_t *ppos)
+{
+	static ssize_t (*func)(const char __user *, size_t);
+
+	func = file->f_inode->i_private;
+	return func(buf, count);
+}
+
+static const struct file_operations inject_fops = {
+	.write		= inject_write,
+	.llseek		= default_llseek,
+};
+
+static int mce_error_inject_setup(void)
+{
+	struct dentry *mce_error_inject_dir;
+
+	mce_error_inject_dir = debugfs_create_dir("mce_error_inject",
+						  powerpc_debugfs_root);
+
+	if (mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
+		(void)debugfs_create_file("inject_slb_multihit", 0200,
+					  mce_error_inject_dir,
+					  &inject_slb_multihit,
+					  &inject_fops);
+	}
+
+	return 0;
+}
+
+device_initcall(mce_error_inject_setup);
-- 
2.26.2

