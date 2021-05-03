Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8C2371E4A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 19:18:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYqSs6sYYz30FQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 03:18:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A0cp2wlw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=A0cp2wlw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYqSL6VY8z2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 03:18:26 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 143HE1OX078808
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 3 May 2021 13:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=7f3BWnnsEDany25MFyAfPJcPksUN5HkBLHNWKdOaLGM=;
 b=A0cp2wlw0VoqqbM3UjRS3gBcWHu+YmL/ZOC9RK/F7BbGt7AJIDzVWEGR98ZKytMIkR95
 aUnMTHAl9FYvSqReLL9dmZ+J2XPyZZ3Yn2bleYHIqdoeMrP6ms0ev9J+8M4/E/KR0cyy
 o38CpmPV0/1heJ5oSNgRjjDKzrS8RsXR+KFOlGkguecz8NdpXNvWWWCVdI2+PXKpSEA4
 M+vqBl/1N+/Awm3ogD8WLJ+UkVQKx40DwQv5Ta/lo2hWt5rH0khh1G6v7ql4Tt67NV6p
 rXCslZLmWgtFKy2T7xP1ZUXqxMH3itKKT3mpGq2ZWY81UlA99EzfSvAadW16eMiLiyN1 lg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38and1r33f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 13:18:23 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 143HHX5A006885
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 3 May 2021 17:18:22 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 388xm9kdy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 17:18:22 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 143HILdm16318722
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 3 May 2021 17:18:21 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 726AB6A047
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 17:18:21 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 540A26A04F
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 17:18:21 +0000 (GMT)
Received: from localhost (unknown [9.211.126.236])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 17:18:21 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC] powerpc/pseries: delete scanlog
Date: Mon,  3 May 2021 12:18:20 -0500
Message-Id: <20210503171820.1514957-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: g73UDsvynQFelKqAHD1OutUIvPryqY49
X-Proofpoint-ORIG-GUID: g73UDsvynQFelKqAHD1OutUIvPryqY49
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_13:2021-05-03,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030111
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A commit from 2008 says this driver was relevant only for "older
systems", and currently supported hardware doesn't have this
facility. Get rid of it.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/configs/ppc64_defconfig     |   1 -
 arch/powerpc/configs/pseries_defconfig   |   1 -
 arch/powerpc/platforms/pseries/Kconfig   |   4 -
 arch/powerpc/platforms/pseries/Makefile  |   1 -
 arch/powerpc/platforms/pseries/scanlog.c | 195 -----------------------
 5 files changed, 202 deletions(-)
 delete mode 100644 arch/powerpc/platforms/pseries/scanlog.c

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 701811c91a6f..acf13b4917c4 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -26,7 +26,6 @@ CONFIG_PPC64=y
 CONFIG_NR_CPUS=2048
 CONFIG_PPC_SPLPAR=y
 CONFIG_DTL=y
-CONFIG_SCANLOG=m
 CONFIG_PPC_SMLPAR=y
 CONFIG_IBMEBUS=y
 CONFIG_PPC_SVM=y
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index 50168dde4ea5..d120321e4eea 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -38,7 +38,6 @@ CONFIG_MODULE_SRCVERSION_ALL=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_PPC_SPLPAR=y
 CONFIG_DTL=y
-CONFIG_SCANLOG=m
 CONFIG_PPC_SMLPAR=y
 CONFIG_IBMEBUS=y
 CONFIG_PAPR_SCM=m
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 5e037df2a3a1..bf9b612a929b 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -61,10 +61,6 @@ config PSERIES_ENERGY
 	  Provides: /sys/devices/system/cpu/pseries_(de)activation_hint_list
 	  and /sys/devices/system/cpu/cpuN/pseries_(de)activation_hint
 
-config SCANLOG
-	tristate "Scanlog dump interface"
-	depends on RTAS_PROC && PPC_PSERIES
-
 config IO_EVENT_IRQ
 	bool "IO Event Interrupt support"
 	depends on PPC_PSERIES
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index c8a2b0b05ac0..754d1102de08 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -8,7 +8,6 @@ obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
 			   firmware.o power.o dlpar.o mobility.o rng.o \
 			   pci.o pci_dlpar.o eeh_pseries.o msi.o
 obj-$(CONFIG_SMP)	+= smp.o
-obj-$(CONFIG_SCANLOG)	+= scanlog.o
 obj-$(CONFIG_KEXEC_CORE)	+= kexec.o
 obj-$(CONFIG_PSERIES_ENERGY)	+= pseries_energy.o
 
diff --git a/arch/powerpc/platforms/pseries/scanlog.c b/arch/powerpc/platforms/pseries/scanlog.c
deleted file mode 100644
index 2879c4f0ceb7..000000000000
--- a/arch/powerpc/platforms/pseries/scanlog.c
+++ /dev/null
@@ -1,195 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  c 2001 PPC 64 Team, IBM Corp
- *
- * scan-log-data driver for PPC64  Todd Inglett <tinglett@vnet.ibm.com>
- *
- * When ppc64 hardware fails the service processor dumps internal state
- * of the system.  After a reboot the operating system can access a dump
- * of this data using this driver.  A dump exists if the device-tree
- * /chosen/ibm,scan-log-data property exists.
- *
- * This driver exports /proc/powerpc/scan-log-dump which can be read.
- * The driver supports only sequential reads.
- *
- * The driver looks at a write to the driver for the single word "reset".
- * If given, the driver will reset the scanlog so the platform can free it.
- */
-
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/errno.h>
-#include <linux/proc_fs.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/slab.h>
-#include <linux/uaccess.h>
-#include <asm/rtas.h>
-#include <asm/prom.h>
-
-#define MODULE_VERS "1.0"
-#define MODULE_NAME "scanlog"
-
-/* Status returns from ibm,scan-log-dump */
-#define SCANLOG_COMPLETE 0
-#define SCANLOG_HWERROR -1
-#define SCANLOG_CONTINUE 1
-
-
-static unsigned int ibm_scan_log_dump;			/* RTAS token */
-static unsigned int *scanlog_buffer;			/* The data buffer */
-
-static ssize_t scanlog_read(struct file *file, char __user *buf,
-			    size_t count, loff_t *ppos)
-{
-	unsigned int *data = scanlog_buffer;
-	int status;
-	unsigned long len, off;
-	unsigned int wait_time;
-
-	if (count > RTAS_DATA_BUF_SIZE)
-		count = RTAS_DATA_BUF_SIZE;
-
-	if (count < 1024) {
-		/* This is the min supported by this RTAS call.  Rather
-		 * than do all the buffering we insist the user code handle
-		 * larger reads.  As long as cp works... :)
-		 */
-		printk(KERN_ERR "scanlog: cannot perform a small read (%ld)\n", count);
-		return -EINVAL;
-	}
-
-	if (!access_ok(buf, count))
-		return -EFAULT;
-
-	for (;;) {
-		wait_time = 500;	/* default wait if no data */
-		spin_lock(&rtas_data_buf_lock);
-		memcpy(rtas_data_buf, data, RTAS_DATA_BUF_SIZE);
-		status = rtas_call(ibm_scan_log_dump, 2, 1, NULL,
-				   (u32) __pa(rtas_data_buf), (u32) count);
-		memcpy(data, rtas_data_buf, RTAS_DATA_BUF_SIZE);
-		spin_unlock(&rtas_data_buf_lock);
-
-		pr_debug("scanlog: status=%d, data[0]=%x, data[1]=%x, " \
-			 "data[2]=%x\n", status, data[0], data[1], data[2]);
-		switch (status) {
-		    case SCANLOG_COMPLETE:
-			pr_debug("scanlog: hit eof\n");
-			return 0;
-		    case SCANLOG_HWERROR:
-			pr_debug("scanlog: hardware error reading data\n");
-			return -EIO;
-		    case SCANLOG_CONTINUE:
-			/* We may or may not have data yet */
-			len = data[1];
-			off = data[2];
-			if (len > 0) {
-				if (copy_to_user(buf, ((char *)data)+off, len))
-					return -EFAULT;
-				return len;
-			}
-			/* Break to sleep default time */
-			break;
-		    default:
-			/* Assume extended busy */
-			wait_time = rtas_busy_delay_time(status);
-			if (!wait_time) {
-				printk(KERN_ERR "scanlog: unknown error " \
-				       "from rtas: %d\n", status);
-				return -EIO;
-			}
-		}
-		/* Apparently no data yet.  Wait and try again. */
-		msleep_interruptible(wait_time);
-	}
-	/*NOTREACHED*/
-}
-
-static ssize_t scanlog_write(struct file * file, const char __user * buf,
-			     size_t count, loff_t *ppos)
-{
-	char stkbuf[20];
-	int status;
-
-	if (count > 19) count = 19;
-	if (copy_from_user (stkbuf, buf, count)) {
-		return -EFAULT;
-	}
-	stkbuf[count] = 0;
-
-	if (buf) {
-		if (strncmp(stkbuf, "reset", 5) == 0) {
-			pr_debug("scanlog: reset scanlog\n");
-			status = rtas_call(ibm_scan_log_dump, 2, 1, NULL, 0, 0);
-			pr_debug("scanlog: rtas returns %d\n", status);
-		}
-	}
-	return count;
-}
-
-static int scanlog_open(struct inode * inode, struct file * file)
-{
-	unsigned int *data = scanlog_buffer;
-
-	if (data[0] != 0) {
-		/* This imperfect test stops a second copy of the
-		 * data (or a reset while data is being copied)
-		 */
-		return -EBUSY;
-	}
-
-	data[0] = 0;	/* re-init so we restart the scan */
-
-	return 0;
-}
-
-static int scanlog_release(struct inode * inode, struct file * file)
-{
-	unsigned int *data = scanlog_buffer;
-
-	data[0] = 0;
-	return 0;
-}
-
-static const struct proc_ops scanlog_proc_ops = {
-	.proc_read	= scanlog_read,
-	.proc_write	= scanlog_write,
-	.proc_open	= scanlog_open,
-	.proc_release	= scanlog_release,
-	.proc_lseek	= noop_llseek,
-};
-
-static int __init scanlog_init(void)
-{
-	struct proc_dir_entry *ent;
-	int err = -ENOMEM;
-
-	ibm_scan_log_dump = rtas_token("ibm,scan-log-dump");
-	if (ibm_scan_log_dump == RTAS_UNKNOWN_SERVICE)
-		return -ENODEV;
-
-	/* Ideally we could allocate a buffer < 4G */
-	scanlog_buffer = kzalloc(RTAS_DATA_BUF_SIZE, GFP_KERNEL);
-	if (!scanlog_buffer)
-		goto err;
-
-	ent = proc_create("powerpc/rtas/scan-log-dump", 0400, NULL,
-			  &scanlog_proc_ops);
-	if (!ent)
-		goto err;
-	return 0;
-err:
-	kfree(scanlog_buffer);
-	return err;
-}
-
-static void __exit scanlog_cleanup(void)
-{
-	remove_proc_entry("powerpc/rtas/scan-log-dump", NULL);
-	kfree(scanlog_buffer);
-}
-
-module_init(scanlog_init);
-module_exit(scanlog_cleanup);
-MODULE_LICENSE("GPL");
-- 
2.30.2

