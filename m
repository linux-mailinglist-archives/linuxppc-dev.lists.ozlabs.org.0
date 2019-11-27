Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F0710A7E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 02:19:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47N2wv3Vz3zDqkk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 12:19:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47N2k44n0WzDqST
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 12:09:48 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAR17Q0d116631; Tue, 26 Nov 2019 20:09:41 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxq3npf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 20:09:41 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAR19I0U011343;
 Tue, 26 Nov 2019 20:09:40 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxq3np5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 20:09:40 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAR15vc7028917;
 Wed, 27 Nov 2019 01:09:40 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 2wevd6g8y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 01:09:40 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAR19did58851808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 01:09:39 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D5C6C6055;
 Wed, 27 Nov 2019 01:09:39 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE93BC6059;
 Wed, 27 Nov 2019 01:09:38 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 27 Nov 2019 01:09:38 +0000 (GMT)
Subject: [PATCH 06/14] powerpc/vas: Setup fault handler per VAS instance
From: Haren Myneni <haren@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
 herbert@gondor.apana.org.au
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Nov 2019 17:08:20 -0800
Message-ID: <1574816900.13250.12.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_08:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=2
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270007
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
Cc: sukadev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Fault handler is created as kernel thread for each VAS instance and
invoked whenever NX generates page fault. This thread reads CRBs
from fault FIFO and process them.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c | 54 ++++++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas.c       |  7 ++++
 arch/powerpc/platforms/powernv/vas.h       |  6 ++++
 3 files changed, 67 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index a5e63a5..c6c105c 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/kthread.h>
+#include <linux/sched/signal.h>
 #include <asm/icswx.h>
 
 #include "vas.h"
@@ -24,6 +25,54 @@
  */
 #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
 
+struct task_struct *fault_handler;
+
+void vas_wakeup_fault_handler(int virq, void *arg)
+{
+	struct vas_instance *vinst = arg;
+
+	atomic_inc(&vinst->pending_fault);
+	wake_up(&vinst->fault_wq);
+}
+
+/*
+ * Fault handler thread for each VAS instance and process fault CRBs.
+ */
+static int fault_handler_func(void *arg)
+{
+	struct vas_instance *vinst = (struct vas_instance *)arg;
+
+	do {
+		if (signal_pending(current))
+			flush_signals(current);
+
+		wait_event_interruptible(vinst->fault_wq,
+					atomic_read(&vinst->pending_fault) ||
+					kthread_should_stop());
+
+		if (kthread_should_stop())
+			break;
+
+		atomic_dec(&vinst->pending_fault);
+	} while (!kthread_should_stop());
+
+	return 0;
+}
+
+/*
+ * Create a thread that processes the fault CRBs.
+ */
+int vas_setup_fault_handler(struct vas_instance *vinst)
+{
+	vinst->fault_handler = kthread_run(fault_handler_func, (void *)vinst,
+					"vas-fault-%u", vinst->vas_id);
+
+	if (IS_ERR(vinst->fault_handler))
+		return PTR_ERR(vinst->fault_handler);
+
+	return 0;
+}
+
 /*
  * Fault window is opened per VAS instance. NX pastes fault CRB in fault
  * FIFO upon page faults.
@@ -102,4 +151,9 @@ int vas_cleanup_fault_window(struct vas_instance *vinst)
 
 	return rc;
 }
+
+void vas_cleanup_fault_handler(struct vas_instance *vinst)
+{
+	kthread_stop(vinst->fault_handler);
+}
 #endif
diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/powernv/vas.c
index dd0e06c..db2aca4 100644
--- a/arch/powerpc/platforms/powernv/vas.c
+++ b/arch/powerpc/platforms/powernv/vas.c
@@ -30,6 +30,7 @@ static irqreturn_t vas_irq_handler(int virq, void *data)
 	struct vas_instance *vinst = data;
 
 	pr_devel("VAS %d: virq %d\n", vinst->vas_id, virq);
+	vas_wakeup_fault_handler(virq, data);
 
 	return IRQ_HANDLED;
 }
@@ -54,6 +55,10 @@ static void vas_irq_fault_handle_setup(struct vas_instance *vinst)
 	 * for user space.
 	 */
 	rc = vas_setup_fault_window(vinst);
+
+	if (!rc)
+		rc = vas_setup_fault_handler(vinst);
+
 	if (rc) {
 		free_irq(vinst->virq, vinst);
 		vinst->virq = 0;
@@ -129,6 +134,8 @@ static int init_vas_instance(struct platform_device *pdev)
 		}
 	}
 
+	init_waitqueue_head(&vinst->fault_wq);
+
 	pr_devel("Initialized instance [%s, %d] paste_base 0x%llx paste_win_id_shift 0x%llx IRQ %d Port 0x%llx\n",
 			pdev->name, vasid, vinst->paste_base_addr,
 			vinst->paste_win_id_shift, vinst->virq,
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index e23fd69..ee284b3 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -317,6 +317,9 @@ struct vas_instance {
 	int virq;
 	int fault_fifo_size;
 	void *fault_fifo;
+	atomic_t pending_fault;
+	wait_queue_head_t fault_wq;
+	struct task_struct *fault_handler;
 	struct vas_window *fault_win; /* Fault window */
 
 	struct mutex mutex;
@@ -414,6 +417,9 @@ struct vas_winctx {
 extern void vas_window_free_dbgdir(struct vas_window *win);
 extern int vas_setup_fault_window(struct vas_instance *vinst);
 extern int vas_cleanup_fault_window(struct vas_instance *vinst);
+extern void vas_wakeup_fault_handler(int virq, void *arg);
+extern int vas_setup_fault_handler(struct vas_instance *vinst);
+extern void vas_cleanup_fault_handler(struct vas_instance *vinst);
 
 static inline void vas_log_write(struct vas_window *win, char *name,
 			void *regptr, u64 val)
-- 
1.8.3.1



