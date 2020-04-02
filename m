Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DA019BCA8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 09:26:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tF4N6yM2zDqvD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 18:26:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tDnx5cDnzDqw4
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 18:14:13 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03274WZr069672; Thu, 2 Apr 2020 03:13:57 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 304gst3hgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 03:13:57 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03274aYZ070071;
 Thu, 2 Apr 2020 03:13:57 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 304gst3hgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 03:13:57 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0327Bjbh030793;
 Thu, 2 Apr 2020 07:13:56 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 301x76y2fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 07:13:56 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0327DtId57409966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 07:13:55 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5153F136055;
 Thu,  2 Apr 2020 07:13:55 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B30E136053;
 Thu,  2 Apr 2020 07:13:54 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 07:13:54 +0000 (GMT)
Subject: [PATCH v10 07/14] powerpc/vas: Setup thread IRQ handler per VAS
 instance
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1585810846.2275.23.camel@hbabu-laptop>
References: <1585810846.2275.23.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Apr 2020 00:13:53 -0700
Message-ID: <1585811633.2275.49.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=3 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004020060
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
Cc: mikey@neuling.org, ajd@linux.ibm.com, frederic.barrat@fr.ibm.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, hch@infradead.org,
 oohall@gmail.com, clg@kaod.org, herbert@gondor.apana.org.au,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


When NX encounters translation error on CRB and any request buffer,
raises an interrupt on the CPU to handle the fault. It can raise one
interrupt for multiple faults. Expects OS to handle these faults and
return credits for fault window after processing faults.

Setup thread IRQ handler and IRQ thread function per each VAS instance.
IRQ handler checks if the thread is already woken up and can handle new
faults. If so returns with IRQ_HANDLED, otherwise wake up thread to
process new faults.

The thread functions reads each CRB entry from fault FIFO until sees
invalid entry. After reading each CRB, determine the corresponding
send window using pswid (from CRB) and process fault CRB. Then
invalidate the entry and return credit. Processing fault CRB and
return credit is described in subsequent patches.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c  | 131 ++++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-window.c |  60 +++++++++++++
 arch/powerpc/platforms/powernv/vas.c        |  23 ++++-
 arch/powerpc/platforms/powernv/vas.h        |   7 ++
 4 files changed, 220 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 4044998..0da8358 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/kthread.h>
+#include <linux/mmu_context.h>
 #include <asm/icswx.h>
 
 #include "vas.h"
@@ -25,6 +26,136 @@
 #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
 
 /*
+ * Process valid CRBs in fault FIFO.
+ * NX process user space requests, return credit and update the status
+ * in CRB. If it encounters transalation error when accessing CRB or
+ * request buffers, raises interrupt on the CPU to handle the fault.
+ * It takes credit on fault window, updates nx_fault_stamp in CRB with
+ * the following information and pastes CRB in fault FIFO.
+ *
+ * pswid - window ID of the window on which the request is sent.
+ * fault_storage_addr - fault address
+ *
+ * It can raise a single interrupt for multiple faults. Expects OS to
+ * process all valid faults and return credit for each fault on user
+ * space and fault windows. This fault FIFO control will be done with
+ * credit mechanism. NX can continuously paste CRBs until credits are not
+ * available on fault window. Otherwise, returns with RMA_reject.
+ *
+ * Total credits available on fault window: FIFO_SIZE(4MB)/CRBS_SIZE(128)
+ *
+ */
+irqreturn_t vas_fault_thread_fn(int irq, void *data)
+{
+	struct vas_instance *vinst = data;
+	struct coprocessor_request_block *crb, *entry;
+	struct coprocessor_request_block buf;
+	struct vas_window *window;
+	unsigned long flags;
+	void *fifo;
+
+	crb = &buf;
+
+	/*
+	 * VAS can interrupt with multiple page faults. So process all
+	 * valid CRBs within fault FIFO until reaches invalid CRB.
+	 * We use CCW[0] and pswid to validate validate CRBs:
+	 *
+	 * CCW[0]	Reserved bit. When NX pastes CRB, CCW[0]=0
+	 *		OS sets this bit to 1 after reading CRB.
+	 * pswid	NX assigns window ID. Set pswid to -1 after
+	 *		reading CRB from fault FIFO.
+	 *
+	 * We exit this function if no valid CRBs are available to process.
+	 * So acquire fault_lock and reset fifo_in_progress to 0 before
+	 * exit.
+	 * In case kernel receives another interrupt with different page
+	 * fault, interrupt handler returns with IRQ_HANDLED if
+	 * fifo_in_progress is set. Means these new faults will be
+	 * handled by the current thread. Otherwise set fifo_in_progress
+	 * and return IRQ_WAKE_THREAD to wake up thread.
+	 */
+	while (true) {
+		spin_lock_irqsave(&vinst->fault_lock, flags);
+		/*
+		 * Advance the fault fifo pointer to next CRB.
+		 * Use CRB_SIZE rather than sizeof(*crb) since the latter is
+		 * aligned to CRB_ALIGN (256) but the CRB written to by VAS is
+		 * only CRB_SIZE in len.
+		 */
+		fifo = vinst->fault_fifo + (vinst->fault_crbs * CRB_SIZE);
+		entry = fifo;
+
+		if ((entry->stamp.nx.pswid == cpu_to_be32(FIFO_INVALID_ENTRY))
+			|| (entry->ccw & cpu_to_be32(CCW0_INVALID))) {
+			vinst->fifo_in_progress = 0;
+			spin_unlock_irqrestore(&vinst->fault_lock, flags);
+			return IRQ_HANDLED;
+		}
+
+		spin_unlock_irqrestore(&vinst->fault_lock, flags);
+		vinst->fault_crbs++;
+		if (vinst->fault_crbs == (vinst->fault_fifo_size / CRB_SIZE))
+			vinst->fault_crbs = 0;
+
+		memcpy(crb, fifo, CRB_SIZE);
+		entry->stamp.nx.pswid = cpu_to_be32(FIFO_INVALID_ENTRY);
+		entry->ccw |= cpu_to_be32(CCW0_INVALID);
+
+		pr_devel("VAS[%d] fault_fifo %p, fifo %p, fault_crbs %d\n",
+				vinst->vas_id, vinst->fault_fifo, fifo,
+				vinst->fault_crbs);
+
+		window = vas_pswid_to_window(vinst,
+				be32_to_cpu(crb->stamp.nx.pswid));
+
+		if (IS_ERR(window)) {
+			/*
+			 * We got an interrupt about a specific send
+			 * window but we can't find that window and we can't
+			 * even clean it up (return credit on user space
+			 * window).
+			 * But we should not get here.
+			 * TODO: Disable IRQ.
+			 */
+			pr_err("VAS[%d] fault_fifo %p, fifo %p, pswid 0x%x, fault_crbs %d bad CRB?\n",
+				vinst->vas_id, vinst->fault_fifo, fifo,
+				be32_to_cpu(crb->stamp.nx.pswid),
+				vinst->fault_crbs);
+
+			WARN_ON_ONCE(1);
+		}
+
+	}
+}
+
+irqreturn_t vas_fault_handler(int irq, void *dev_id)
+{
+	struct vas_instance *vinst = dev_id;
+	irqreturn_t ret = IRQ_WAKE_THREAD;
+	unsigned long flags;
+
+	/*
+	 * NX can generate an interrupt for multiple faults. So the
+	 * fault handler thread process all CRBs until finds invalid
+	 * entry. In case if NX sees continuous faults, it is possible
+	 * that the thread function entered with the first interrupt
+	 * can execute and process all valid CRBs.
+	 * So wake up thread only if the fault thread is not in progress.
+	 */
+	spin_lock_irqsave(&vinst->fault_lock, flags);
+
+	if (vinst->fifo_in_progress)
+		ret = IRQ_HANDLED;
+	else
+		vinst->fifo_in_progress = 1;
+
+	spin_unlock_irqrestore(&vinst->fault_lock, flags);
+
+	return ret;
+}
+
+/*
  * Fault window is opened per VAS instance. NX pastes fault CRB in fault
  * FIFO upon page faults.
  */
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 063cda2..f12f7eb 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1050,6 +1050,15 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
 		}
 	} else {
 		/*
+		 * Interrupt hanlder or fault window setup failed. Means
+		 * NX can not generate fault for page fault. So not
+		 * opening for user space tx window.
+		 */
+		if (!vinst->virq) {
+			rc = -ENODEV;
+			goto free_window;
+		}
+		/*
 		 * A user mapping must ensure that context switch issues
 		 * CP_ABORT for this thread.
 		 */
@@ -1307,3 +1316,54 @@ int vas_win_close(struct vas_window *window)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(vas_win_close);
+
+struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
+		uint32_t pswid)
+{
+	struct vas_window *window;
+	int winid;
+
+	if (!pswid) {
+		pr_devel("%s: called for pswid 0!\n", __func__);
+		return ERR_PTR(-ESRCH);
+	}
+
+	decode_pswid(pswid, NULL, &winid);
+
+	if (winid >= VAS_WINDOWS_PER_CHIP)
+		return ERR_PTR(-ESRCH);
+
+	/*
+	 * If application closes the window before the hardware
+	 * returns the fault CRB, we should wait in vas_win_close()
+	 * for the pending requests. so the window must be active
+	 * and the process alive.
+	 *
+	 * If its a kernel process, we should not get any faults and
+	 * should not get here.
+	 */
+	window = vinst->windows[winid];
+
+	if (!window) {
+		pr_err("PSWID decode: Could not find window for winid %d pswid %d vinst 0x%p\n",
+			winid, pswid, vinst);
+		return NULL;
+	}
+
+	/*
+	 * Do some sanity checks on the decoded window.  Window should be
+	 * NX GZIP user send window. FTW windows should not incur faults
+	 * since their CRBs are ignored (not queued on FIFO or processed
+	 * by NX).
+	 */
+	if (!window->tx_win || !window->user_win || !window->nx_win ||
+			window->cop == VAS_COP_TYPE_FAULT ||
+			window->cop == VAS_COP_TYPE_FTW) {
+		pr_err("PSWID decode: id %d, tx %d, user %d, nx %d, cop %d\n",
+			winid, window->tx_win, window->user_win,
+			window->nx_win, window->cop);
+		WARN_ON(1);
+	}
+
+	return window;
+}
diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/powernv/vas.c
index 9013a63..598e4cd 100644
--- a/arch/powerpc/platforms/powernv/vas.c
+++ b/arch/powerpc/platforms/powernv/vas.c
@@ -14,6 +14,8 @@
 #include <linux/of_platform.h>
 #include <linux/of_address.h>
 #include <linux/of.h>
+#include <linux/irqdomain.h>
+#include <linux/interrupt.h>
 #include <asm/prom.h>
 #include <asm/xive.h>
 
@@ -26,7 +28,25 @@
 
 static int vas_irq_fault_window_setup(struct vas_instance *vinst)
 {
-	return vas_setup_fault_window(vinst);
+	char devname[64];
+	int rc = 0;
+
+	snprintf(devname, sizeof(devname), "vas-%d", vinst->vas_id);
+	rc = request_threaded_irq(vinst->virq, vas_fault_handler,
+				vas_fault_thread_fn, 0, devname, vinst);
+
+	if (rc) {
+		pr_err("VAS[%d]: Request IRQ(%d) failed with %d\n",
+				vinst->vas_id, vinst->virq, rc);
+		goto out;
+	}
+
+	rc = vas_setup_fault_window(vinst);
+	if (rc)
+		free_irq(vinst->virq, vinst);
+
+out:
+	return rc;
 }
 
 static int init_vas_instance(struct platform_device *pdev)
@@ -119,6 +139,7 @@ static int init_vas_instance(struct platform_device *pdev)
 	list_add(&vinst->node, &vas_instances);
 	mutex_unlock(&vas_mutex);
 
+	spin_lock_init(&vinst->fault_lock);
 	/*
 	 * IRQ and fault handling setup is needed only for user space
 	 * send windows.
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index 2a04072..0af7912 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -331,7 +331,10 @@ struct vas_instance {
 
 	u64 irq_port;
 	int virq;
+	int fault_crbs;
 	int fault_fifo_size;
+	int fifo_in_progress;
+	spinlock_t fault_lock;
 	void *fault_fifo;
 	struct vas_window *fault_win; /* Fault window */
 
@@ -431,6 +434,10 @@ struct vas_winctx {
 extern void vas_window_init_dbgdir(struct vas_window *win);
 extern void vas_window_free_dbgdir(struct vas_window *win);
 extern int vas_setup_fault_window(struct vas_instance *vinst);
+extern irqreturn_t vas_fault_thread_fn(int irq, void *data);
+extern irqreturn_t vas_fault_handler(int irq, void *dev_id);
+extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
+						uint32_t pswid);
 
 static inline int vas_window_pid(struct vas_window *window)
 {
-- 
1.8.3.1



