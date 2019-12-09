Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9290F11657B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 04:37:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WTQy1Q0KzDqM7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 14:37:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WTL54HJszDqLC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 14:33:17 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB93X0SF106774; Sun, 8 Dec 2019 22:33:06 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wrt9w8b9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Dec 2019 22:33:06 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xB93X5NM107089;
 Sun, 8 Dec 2019 22:33:05 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wrt9w8b97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Dec 2019 22:33:05 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB93VhUB019865;
 Mon, 9 Dec 2019 03:33:05 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 2wr3q6345w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2019 03:33:04 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB93X3Ij58065330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Dec 2019 03:33:03 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AA526E04E;
 Mon,  9 Dec 2019 03:33:03 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E20F66E04C;
 Mon,  9 Dec 2019 03:33:02 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  9 Dec 2019 03:33:02 +0000 (GMT)
Subject: [PATCH V2 05/13] powerpc/vas: Setup thread IRQ handler per VAS
 instance
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1575861522.16318.9.camel@hbabu-laptop>
References: <1575861522.16318.9.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 08 Dec 2019 19:31:24 -0800
Message-ID: <1575862284.16318.22.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-08_07:2019-12-05,2019-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=3 mlxscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912090029
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


Setup thread IRQ handler per each VAS instance. When NX sees a fault
on CRB, kernel gets an interrupt and vas_fault_handler will be
executed to process fault CRBs. Read all valid CRBs from fault FIFO,
determine the corresponding send window from CRB and process fault
requests.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c  | 83 +++++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-window.c | 60 +++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas.c        | 15 +++++-
 arch/powerpc/platforms/powernv/vas.h        |  4 ++
 4 files changed, 161 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index b0258ed..e1e34c6 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/kthread.h>
+#include <linux/mmu_context.h>
 #include <asm/icswx.h>
 
 #include "vas.h"
@@ -25,6 +26,88 @@
 #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
 
 /*
+ * Process CRBs that we receive on the fault window.
+ */
+irqreturn_t vas_fault_handler(int irq, void *data)
+{
+	struct vas_instance *vinst = (struct vas_instance *)data;
+	struct coprocessor_request_block buf, *crb;
+	struct vas_window *window;
+	void *fifo;
+
+	/*
+	 * VAS can interrupt with multiple page faults. So process all
+	 * valid CRBs within fault FIFO until reaches invalid CRB.
+	 * NX updates nx_fault_stamp in CRB and pastes in fault FIFO.
+	 * kernel retrives send window from parition send window ID
+	 * (pswid) in nx_fault_stamp. So pswid should be non-zero and
+	 * use this to check whether CRB is valid.
+	 * After reading CRB entry, it is reset with 0's in fault FIFO.
+	 *
+	 * In case kernel receives another interrupt with different page
+	 * fault and CRBs are processed by the previous handling, will be
+	 * returned from this function when it sees invalid CRB (means 0's).
+	 */
+	do {
+		mutex_lock(&vinst->mutex);
+
+		/*
+		 * Advance the fault fifo pointer to next CRB.
+		 * Use CRB_SIZE rather than sizeof(*crb) since the latter is
+		 * aligned to CRB_ALIGN (256) but the CRB written to by VAS is
+		 * only CRB_SIZE in len.
+		 */
+		fifo = vinst->fault_fifo + (vinst->fault_crbs * CRB_SIZE);
+		crb = (struct coprocessor_request_block *)fifo;
+
+		/*
+		 * pswid returned from NX will be in _be32, but just
+		 * checking non-zero value to make sure the CRB is valid.
+		 * Return if reached invalid CRB.
+		 */
+		if (!crb->stamp.nx.pswid) {
+			mutex_unlock(&vinst->mutex);
+			return IRQ_HANDLED;
+		}
+
+		vinst->fault_crbs++;
+		if (vinst->fault_crbs == vinst->fault_fifo_size/CRB_SIZE)
+			vinst->fault_crbs = 0;
+
+		crb = &buf;
+		memcpy(crb, fifo, CRB_SIZE);
+		memset(fifo, 0, CRB_SIZE);
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
+			return IRQ_HANDLED;
+		}
+
+	} while (true);
+
+	return IRQ_HANDLED;
+}
+
+/*
  * Fault window is opened per VAS instance. NX pastes fault CRB in fault
  * FIFO upon page faults.
  */
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index f07f49a..cec1b41 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1041,6 +1041,15 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
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
@@ -1255,3 +1264,54 @@ int vas_win_close(struct vas_window *window)
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
index ec34c06..f741b81 100644
--- a/arch/powerpc/platforms/powernv/vas.c
+++ b/arch/powerpc/platforms/powernv/vas.c
@@ -14,6 +14,8 @@
 #include <linux/of_platform.h>
 #include <linux/of_address.h>
 #include <linux/of.h>
+#include <linux/irqdomain.h>
+#include <linux/interrupt.h>
 #include <asm/prom.h>
 
 #include "vas.h"
@@ -25,9 +27,20 @@
 
 static int vas_irq_fault_window_setup(struct vas_instance *vinst)
 {
+	char devname[64];
 	int rc = 0;
 
-	rc = vas_setup_fault_window(vinst);
+	snprintf(devname, sizeof(devname), "vas-%d", vinst->vas_id);
+	rc = request_threaded_irq(vinst->virq, NULL, vas_fault_handler,
+					IRQF_ONESHOT, devname, vinst);
+	if (rc) {
+		pr_err("VAS[%d]: Request IRQ(%d) failed with %d\n",
+				vinst->vas_id, vinst->virq, rc);
+	} else {
+		rc = vas_setup_fault_window(vinst);
+		if (rc)
+			free_irq(vinst->virq, vinst);
+	}
 
 	return rc;
 }
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index 9f08daa..879f5b4 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -315,6 +315,7 @@ struct vas_instance {
 
 	u64 irq_port;
 	int virq;
+	int fault_crbs;
 	int fault_fifo_size;
 	void *fault_fifo;
 	struct vas_window *fault_win; /* Fault window */
@@ -413,6 +414,9 @@ struct vas_winctx {
 extern void vas_window_init_dbgdir(struct vas_window *win);
 extern void vas_window_free_dbgdir(struct vas_window *win);
 extern int vas_setup_fault_window(struct vas_instance *vinst);
+extern irqreturn_t vas_fault_handler(int irq, void *data);
+extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
+						uint32_t pswid);
 
 static inline void vas_log_write(struct vas_window *win, char *name,
 			void *regptr, u64 val)
-- 
1.8.3.1



