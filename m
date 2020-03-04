Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F879179A80
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 21:56:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XmQX2lgLzDqVc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 07:56:52 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XmFP39cgzDqbw
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 07:48:57 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 024Ke1db060046; Wed, 4 Mar 2020 15:48:46 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yhyxr7dxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 15:48:46 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 024Kfei0064386;
 Wed, 4 Mar 2020 15:48:46 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yhyxr7dxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 15:48:46 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 024KjNFd030142;
 Wed, 4 Mar 2020 20:48:45 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 2yffk7qa9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 20:48:45 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 024Kmijn33030408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Mar 2020 20:48:44 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CA5F112063;
 Wed,  4 Mar 2020 20:48:44 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA764112064;
 Wed,  4 Mar 2020 20:48:43 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  4 Mar 2020 20:48:43 +0000 (GMT)
Subject: [PATCH V6 06/14] powerpc/vas: Setup thread IRQ handler per VAS
 instance
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1583353283.18705.2112.camel@hbabu-laptop>
References: <1583353283.18705.2112.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 04 Mar 2020 12:47:41 -0800
Message-ID: <1583354861.18705.2147.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_08:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=3 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003040134
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Setup thread IRQ handler per each VAS instance. When NX sees a fault
on CRB, kernel gets an interrupt and vas_fault_handler will be
executed to process fault CRBs. Read all valid CRBs from fault FIFO,
determine the corresponding send window from CRB and process fault
requests.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c  | 90 +++++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-window.c | 60 +++++++++++++++++++
 arch/powerpc/platforms/powernv/vas.c        | 49 +++++++++++++++-
 arch/powerpc/platforms/powernv/vas.h        |  6 ++
 4 files changed, 204 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 4044998..85e4280 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/kthread.h>
+#include <linux/mmu_context.h>
 #include <asm/icswx.h>
 
 #include "vas.h"
@@ -25,6 +26,95 @@
 #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
 
 /*
+ * Process valid CRBs in fault FIFO.
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
+	 * NX updates nx_fault_stamp in CRB and pastes in fault FIFO.
+	 * kernel retrives send window from parition send window ID
+	 * (pswid) in nx_fault_stamp. So pswid should be valid and
+	 * ccw[0] (in be) should be zero since this bit is reserved.
+	 * If user space touches this bit, NX returns with "CRB format
+	 * error".
+	 *
+	 * After reading CRB entry, invalidate it with pswid (set
+	 * 0xffffffff) and ccw[0] (set to 1).
+	 *
+	 * In case kernel receives another interrupt with different page
+	 * fault, CRBs are already processed by the previous handling. So
+	 * will be returned from this function when it sees invalid CRB.
+	 */
+	do {
+		mutex_lock(&vinst->mutex);
+
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
+		if ((entry->stamp.nx.pswid == FIFO_INVALID_ENTRY) ||
+			(entry->ccw & CCW0_INVALID)) {
+			atomic_set(&vinst->faults_in_progress, 0);
+			spin_unlock_irqrestore(&vinst->fault_lock, flags);
+			mutex_unlock(&vinst->mutex);
+			return IRQ_HANDLED;
+		}
+
+		spin_unlock_irqrestore(&vinst->fault_lock, flags);
+		vinst->fault_crbs++;
+		if (vinst->fault_crbs == (vinst->fault_fifo_size / CRB_SIZE))
+			vinst->fault_crbs = 0;
+
+		memcpy(crb, fifo, CRB_SIZE);
+		entry->stamp.nx.pswid = FIFO_INVALID_ENTRY;
+		entry->ccw |= CCW0_INVALID;
+		mutex_unlock(&vinst->mutex);
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
+			 * even clean it up (return credit).
+			 * But we should not get here.
+			 */
+			pr_err("VAS[%d] fault_fifo %p, fifo %p, pswid 0x%x, fault_crbs %d bad CRB?\n",
+				vinst->vas_id, vinst->fault_fifo, fifo,
+				be32_to_cpu(crb->stamp.nx.pswid),
+				vinst->fault_crbs);
+
+			WARN_ON_ONCE(1);
+			atomic_set(&vinst->faults_in_progress, 0);
+			return IRQ_HANDLED;
+		}
+
+	} while (true);
+}
+
+/*
  * Fault window is opened per VAS instance. NX pastes fault CRB in fault
  * FIFO upon page faults.
  */
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 1783fa9..7c6f55f 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1040,6 +1040,15 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
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
@@ -1254,3 +1263,54 @@ int vas_win_close(struct vas_window *window)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(vas_win_close);
+
+struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
+		uint32_t pswid)
+{
+	int winid;
+	struct vas_window *window;
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
index 557c8e4..3d9ba58 100644
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
 
@@ -24,9 +26,53 @@
 
 static DEFINE_PER_CPU(int, cpu_vas_id);
 
+static irqreturn_t vas_fault_handler(int irq, void *dev_id)
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
+	if (atomic_read(&vinst->faults_in_progress))
+		ret = IRQ_HANDLED;
+	else
+		atomic_set(&vinst->faults_in_progress, 1);
+
+	spin_unlock_irqrestore(&vinst->fault_lock, flags);
+
+	return ret;
+}
+
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
@@ -109,6 +155,7 @@ static int init_vas_instance(struct platform_device *pdev)
 	list_add(&vinst->node, &vas_instances);
 	mutex_unlock(&vas_mutex);
 
+	spin_lock_init(&vinst->fault_lock);
 	/*
 	 * IRQ and fault handling setup is needed only for user space
 	 * send windows.
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index 9785c81..b82d5da 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -326,7 +326,10 @@ struct vas_instance {
 
 	u64 irq_port;
 	int virq;
+	int fault_crbs;
 	int fault_fifo_size;
+	atomic_t faults_in_progress;
+	spinlock_t fault_lock;
 	void *fault_fifo;
 	struct vas_window *fault_win; /* Fault window */
 
@@ -424,6 +427,9 @@ struct vas_winctx {
 extern void vas_window_init_dbgdir(struct vas_window *win);
 extern void vas_window_free_dbgdir(struct vas_window *win);
 extern int vas_setup_fault_window(struct vas_instance *vinst);
+extern irqreturn_t vas_fault_thread_fn(int irq, void *data);
+extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
+						uint32_t pswid);
 
 static inline void vas_log_write(struct vas_window *win, char *name,
 			void *regptr, u64 val)
-- 
1.8.3.1



