Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F0E116577
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 04:35:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WTNY31JwzDqM3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 14:35:25 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WTK56RGFzDqLr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 14:32:25 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB93CFHE098842; Sun, 8 Dec 2019 22:32:15 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wr8kvnvc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Dec 2019 22:32:15 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xB93CxZK100225;
 Sun, 8 Dec 2019 22:32:15 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wr8kvnvbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Dec 2019 22:32:14 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB93Vgjo025361;
 Mon, 9 Dec 2019 03:32:13 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 2wr3q5y8sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2019 03:32:13 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB93WCdr60555642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Dec 2019 03:32:12 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA43D78060;
 Mon,  9 Dec 2019 03:32:12 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A4597805C;
 Mon,  9 Dec 2019 03:32:12 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  9 Dec 2019 03:32:12 +0000 (GMT)
Subject: [PATCH V2 04/13] powerpc/vas: Setup fault window per VAS instance
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1575861522.16318.9.camel@hbabu-laptop>
References: <1575861522.16318.9.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 08 Dec 2019 19:30:33 -0800
Message-ID: <1575862233.16318.21.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-08_07:2019-12-05,2019-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=3 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912090028
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
Cc: devicetree@vger.kernel.org, mikey@neuling.org, herbert@gondor.apana.org.au,
 npiggin@gmail.com, hch@infradead.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Setup fault window for each VAS instance. When NX gets fault on request
buffer, write fault CRBs in the corresponding fault FIFO and then sends
an interrupt to the OS.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/Makefile     |  2 +-
 arch/powerpc/platforms/powernv/vas-fault.c  | 73 +++++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-window.c |  3 +-
 arch/powerpc/platforms/powernv/vas.c        | 24 ++++++++++
 arch/powerpc/platforms/powernv/vas.h        |  5 ++
 5 files changed, 105 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/vas-fault.c

diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index a3ac964..74c2246 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -17,6 +17,6 @@ obj-$(CONFIG_MEMORY_FAILURE)	+= opal-memory-errors.o
 obj-$(CONFIG_OPAL_PRD)	+= opal-prd.o
 obj-$(CONFIG_PERF_EVENTS) += opal-imc.o
 obj-$(CONFIG_PPC_MEMTRACE)	+= memtrace.o
-obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o
+obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-fault.o
 obj-$(CONFIG_OCXL_BASE)	+= ocxl.o
 obj-$(CONFIG_SCOM_DEBUGFS) += opal-xscom.o
diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
new file mode 100644
index 0000000..b0258ed
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -0,0 +1,73 @@
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
index 0c0d27d..f07f49a 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -827,9 +827,10 @@ void vas_init_rx_win_attr(struct vas_rx_win_attr *rxattr, enum vas_cop_type cop)
 		rxattr->fault_win = true;
 		rxattr->notify_disable = true;
 		rxattr->rx_wcred_mode = true;
-		rxattr->tx_wcred_mode = true;
 		rxattr->rx_win_ord_mode = true;
 		rxattr->tx_win_ord_mode = true;
+		rxattr->rej_no_credit = true;
+		rxattr->tc_mode = VAS_THRESH_DISABLED;
 	} else if (cop == VAS_COP_TYPE_FTW) {
 		rxattr->user_win = true;
 		rxattr->intr_disable = true;
diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/powernv/vas.c
index 40d8213..ec34c06 100644
--- a/arch/powerpc/platforms/powernv/vas.c
+++ b/arch/powerpc/platforms/powernv/vas.c
@@ -23,6 +23,15 @@
 
 static DEFINE_PER_CPU(int, cpu_vas_id);
 
+static int vas_irq_fault_window_setup(struct vas_instance *vinst)
+{
+	int rc = 0;
+
+	rc = vas_setup_fault_window(vinst);
+
+	return rc;
+}
+
 static int init_vas_instance(struct platform_device *pdev)
 {
 	struct device_node *dn = pdev->dev.of_node;
@@ -106,6 +115,21 @@ static int init_vas_instance(struct platform_device *pdev)
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
index 598608b..9f08daa 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -315,6 +315,10 @@ struct vas_instance {
 
 	u64 irq_port;
 	int virq;
+	int fault_fifo_size;
+	void *fault_fifo;
+	struct vas_window *fault_win; /* Fault window */
+
 	struct mutex mutex;
 	struct vas_window *rxwin[VAS_COP_TYPE_MAX];
 	struct vas_window *windows[VAS_WINDOWS_PER_CHIP];
@@ -408,6 +412,7 @@ struct vas_winctx {
 extern void vas_instance_init_dbgdir(struct vas_instance *vinst);
 extern void vas_window_init_dbgdir(struct vas_window *win);
 extern void vas_window_free_dbgdir(struct vas_window *win);
+extern int vas_setup_fault_window(struct vas_instance *vinst);
 
 static inline void vas_log_write(struct vas_window *win, char *name,
 			void *regptr, u64 val)
-- 
1.8.3.1



