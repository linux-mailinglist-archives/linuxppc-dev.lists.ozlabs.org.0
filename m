Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6428319B7AB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 23:34:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48szwy31FgzDqN5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 08:34:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48szng6ZpszDqpC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 08:28:07 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031L3tUV025490; Wed, 1 Apr 2020 17:27:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3043g8qs0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 17:27:49 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 031L4VWE028920;
 Wed, 1 Apr 2020 17:27:49 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3043g8qs0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 17:27:49 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 031LQ4ki020081;
 Wed, 1 Apr 2020 21:27:48 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 301x77mxne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 21:27:48 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031LRkPM60359114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 21:27:46 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 638A86A047;
 Wed,  1 Apr 2020 21:27:46 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B93716A04F;
 Wed,  1 Apr 2020 21:27:45 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 21:27:45 +0000 (GMT)
Subject: [PATCH v9 04/13] powerpc/vas: Setup fault window per VAS instance
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1585775978.10664.438.camel@hbabu-laptop>
References: <1585775978.10664.438.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Apr 2020 14:26:59 -0700
Message-ID: <1585776419.10664.445.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 suspectscore=3 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010174
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
Cc: mikey@neuling.org, srikar@linux.vnet.ibm.com, frederic.barrat@fr.ibm.com,
 ajd@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, clg@kaod.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, herbert@gondor.apana.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Setup fault window for each VAS instance. When NX gets a fault on
request buffer, pastes fault CRB in the corresponding fault FIFO and
then raises an interrupt to the OS. The kernel handles this fault
and process faults CRB from this FIFO.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/Makefile     |  2 +-
 arch/powerpc/platforms/powernv/vas-fault.c  | 77 +++++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-window.c |  4 +-
 arch/powerpc/platforms/powernv/vas.c        | 20 ++++++++
 arch/powerpc/platforms/powernv/vas.h        | 21 ++++++++
 5 files changed, 121 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/vas-fault.c

diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index c0f8120..395789f 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -17,7 +17,7 @@ obj-$(CONFIG_MEMORY_FAILURE)	+= opal-memory-errors.o
 obj-$(CONFIG_OPAL_PRD)	+= opal-prd.o
 obj-$(CONFIG_PERF_EVENTS) += opal-imc.o
 obj-$(CONFIG_PPC_MEMTRACE)	+= memtrace.o
-obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o
+obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-fault.o
 obj-$(CONFIG_OCXL_BASE)	+= ocxl.o
 obj-$(CONFIG_SCOM_DEBUGFS) += opal-xscom.o
 obj-$(CONFIG_PPC_SECURE_BOOT) += opal-secvar.o
diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
new file mode 100644
index 0000000..4044998
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * VAS Fault handling.
+ * Copyright 2019, IBM Corporation
+ */
+
+#define pr_fmt(fmt) "vas: " fmt
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/kthread.h>
+#include <asm/icswx.h>
+
+#include "vas.h"
+
+/*
+ * The maximum FIFO size for fault window can be 8MB
+ * (VAS_RX_FIFO_SIZE_MAX). Using 4MB FIFO since each VAS
+ * instance will be having fault window.
+ * 8MB FIFO can be used if expects more faults for each VAS
+ * instance.
+ */
+#define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
+
+/*
+ * Fault window is opened per VAS instance. NX pastes fault CRB in fault
+ * FIFO upon page faults.
+ */
+int vas_setup_fault_window(struct vas_instance *vinst)
+{
+	struct vas_rx_win_attr attr;
+
+	vinst->fault_fifo_size = VAS_FAULT_WIN_FIFO_SIZE;
+	vinst->fault_fifo = kzalloc(vinst->fault_fifo_size, GFP_KERNEL);
+	if (!vinst->fault_fifo) {
+		pr_err("Unable to alloc %d bytes for fault_fifo\n",
+				vinst->fault_fifo_size);
+		return -ENOMEM;
+	}
+
+	/*
+	 * Invalidate all CRB entries. NX pastes valid entry for each fault.
+	 */
+	memset(vinst->fault_fifo, FIFO_INVALID_ENTRY, vinst->fault_fifo_size);
+	vas_init_rx_win_attr(&attr, VAS_COP_TYPE_FAULT);
+
+	attr.rx_fifo_size = vinst->fault_fifo_size;
+	attr.rx_fifo = vinst->fault_fifo;
+
+	/*
+	 * Max creds is based on number of CRBs can fit in the FIFO.
+	 * (fault_fifo_size/CRB_SIZE). If 8MB FIFO is used, max creds
+	 * will be 0xffff since the receive creds field is 16bits wide.
+	 */
+	attr.wcreds_max = vinst->fault_fifo_size / CRB_SIZE;
+	attr.lnotify_lpid = 0;
+	attr.lnotify_pid = mfspr(SPRN_PID);
+	attr.lnotify_tid = mfspr(SPRN_PID);
+
+	vinst->fault_win = vas_rx_win_open(vinst->vas_id, VAS_COP_TYPE_FAULT,
+					&attr);
+
+	if (IS_ERR(vinst->fault_win)) {
+		pr_err("VAS: Error %ld opening FaultWin\n",
+			PTR_ERR(vinst->fault_win));
+		kfree(vinst->fault_fifo);
+		return PTR_ERR(vinst->fault_win);
+	}
+
+	pr_devel("VAS: Created FaultWin %d, LPID/PID/TID [%d/%d/%d]\n",
+			vinst->fault_win->winid, attr.lnotify_lpid,
+			attr.lnotify_pid, attr.lnotify_tid);
+
+	return 0;
+}
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 0c0d27d..1783fa9 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -827,9 +827,9 @@ void vas_init_rx_win_attr(struct vas_rx_win_attr *rxattr, enum vas_cop_type cop)
 		rxattr->fault_win = true;
 		rxattr->notify_disable = true;
 		rxattr->rx_wcred_mode = true;
-		rxattr->tx_wcred_mode = true;
 		rxattr->rx_win_ord_mode = true;
-		rxattr->tx_win_ord_mode = true;
+		rxattr->rej_no_credit = true;
+		rxattr->tc_mode = VAS_THRESH_DISABLED;
 	} else if (cop == VAS_COP_TYPE_FTW) {
 		rxattr->user_win = true;
 		rxattr->intr_disable = true;
diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/powernv/vas.c
index 3303cfe..9013a63 100644
--- a/arch/powerpc/platforms/powernv/vas.c
+++ b/arch/powerpc/platforms/powernv/vas.c
@@ -24,6 +24,11 @@
 
 static DEFINE_PER_CPU(int, cpu_vas_id);
 
+static int vas_irq_fault_window_setup(struct vas_instance *vinst)
+{
+	return vas_setup_fault_window(vinst);
+}
+
 static int init_vas_instance(struct platform_device *pdev)
 {
 	struct device_node *dn = pdev->dev.of_node;
@@ -114,6 +119,21 @@ static int init_vas_instance(struct platform_device *pdev)
 	list_add(&vinst->node, &vas_instances);
 	mutex_unlock(&vas_mutex);
 
+	/*
+	 * IRQ and fault handling setup is needed only for user space
+	 * send windows.
+	 */
+	if (vinst->virq) {
+		rc = vas_irq_fault_window_setup(vinst);
+		/*
+		 * Fault window is used only for user space send windows.
+		 * So if vinst->virq is NULL, tx_win_open returns -ENODEV
+		 * for user space.
+		 */
+		if (rc)
+			vinst->virq = 0;
+	}
+
 	vas_instance_init_dbgdir(vinst);
 
 	dev_set_drvdata(&pdev->dev, vinst);
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index 598608b..9c8e3f5 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -296,6 +296,22 @@ enum vas_notify_after_count {
 };
 
 /*
+ * NX can generate an interrupt for multiple faults and expects kernel
+ * to process all of them. So read all valid CRB entries until find the
+ * invalid one. So use pswid which is pasted by NX and ccw[0] (reserved
+ * bit in BE) to check valid CRB. CCW[0] will not be touched by user
+ * space. Application gets CRB formt error if it updates this bit.
+ *
+ * Invalidate FIFO during allocation and process all entries from last
+ * successful read until finds invalid pswid and ccw[0] values.
+ * After reading each CRB entry from fault FIFO, the kernel invalidate
+ * it by updating pswid with FIFO_INVALID_ENTRY and CCW[0] with
+ * CCW0_INVALID.
+ */
+#define FIFO_INVALID_ENTRY	0xffffffff
+#define CCW0_INVALID		1
+
+/*
  * One per instance of VAS. Each instance will have a separate set of
  * receive windows, one per coprocessor type.
  *
@@ -315,6 +331,10 @@ struct vas_instance {
 
 	u64 irq_port;
 	int virq;
+	int fault_fifo_size;
+	void *fault_fifo;
+	struct vas_window *fault_win; /* Fault window */
+
 	struct mutex mutex;
 	struct vas_window *rxwin[VAS_COP_TYPE_MAX];
 	struct vas_window *windows[VAS_WINDOWS_PER_CHIP];
@@ -408,6 +428,7 @@ struct vas_winctx {
 extern void vas_instance_init_dbgdir(struct vas_instance *vinst);
 extern void vas_window_init_dbgdir(struct vas_window *win);
 extern void vas_window_free_dbgdir(struct vas_window *win);
+extern int vas_setup_fault_window(struct vas_instance *vinst);
 
 static inline void vas_log_write(struct vas_window *win, char *name,
 			void *regptr, u64 val)
-- 
1.8.3.1



