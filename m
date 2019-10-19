Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEC9DD6D9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 08:04:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46wC5Z6P5gzDqRw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 17:04:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46wBxD30c5zDqD2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 16:56:48 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9J5HiCn157157; Sat, 19 Oct 2019 01:56:44 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vqcbnc3kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2019 01:56:43 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9J5JQl6020935;
 Sat, 19 Oct 2019 05:56:42 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 2vqt460xkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2019 05:56:42 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9J5ugqt48234946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Oct 2019 05:56:42 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71A1A28059;
 Sat, 19 Oct 2019 05:56:42 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01C2028058;
 Sat, 19 Oct 2019 05:56:42 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 19 Oct 2019 05:56:41 +0000 (GMT)
Subject: [RFC PATCH 06/13] powerpc/vas: Read and process fault CRBs
From: Haren Myneni <haren@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Oct 2019 22:56:27 -0700
Message-ID: <1571464587.24387.31.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-19_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910190051
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


NX pastes CRB in fault FIFO and generates interrupt whenever faults
on CRB. OS reads CRBs from fault FIFO and process them by setting
faulting address in fault_storge_addr in CRB and update CSB. When CSB
status is changed, process sends NX request after touching the fault
address.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c  | 84 +++++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-window.c | 51 ++++++++++++++++++
 arch/powerpc/platforms/powernv/vas.h        |  3 ++
 3 files changed, 138 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 3e2f4cb..02b5c10 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -14,6 +14,8 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/kthread.h>
+#include <linux/sched/signal.h>
+#include <linux/mmu_context.h>
 #include <asm/icswx.h>
 
 #include "vas.h"
@@ -38,6 +40,86 @@ void vas_wakeup_fault_handler(int virq, void *arg)
 }
 
 /*
+ * Process CRBs that we receive on the fault window.
+ */
+static void process_fault_crbs(struct vas_instance *vinst)
+{
+	void *fifo;
+	struct vas_window *window;
+	struct coprocessor_request_block buf;
+	struct coprocessor_request_block *crb;
+	u64 csb_addr;
+
+	crb = &buf;
+
+	/*
+	 * VAS can interrupt with multiple page faults. So process all
+	 * valid CRBs within fault FIFO until reaches invalid CRB.
+	 * For valid CRBs, csb_addr should be valid address points to CSB
+	 * section within CRB. After reading CRB entry, it is reset with
+	 * 0's in fault FIFO.
+	 *
+	 * In case kernel receives another interrupt with different page
+	 * fault and is processed by the previous handling, will be returned
+	 * from this function when it sees invalid CRB (means 0's).
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
+		csb_addr = ((struct coprocessor_request_block *)fifo)->csb_addr;
+
+		/*
+		 * Return if reached invalid CRB.
+		 */
+		if (!csb_addr) {
+			mutex_unlock(&vinst->mutex);
+			return;
+		}
+
+		vinst->fault_crbs++;
+		if (vinst->fault_crbs == vinst->fault_fifo_size/CRB_SIZE)
+			vinst->fault_crbs = 0;
+
+		memcpy(crb, fifo, CRB_SIZE);
+		memset(fifo, 0, CRB_SIZE);
+		mutex_unlock(&vinst->mutex);
+
+		pr_devel("VAS[%d] fault_fifo %p, fifo %p, fault_crbs %d "
+				"pending %d\n", vinst->vas_id,
+				vinst->fault_fifo, fifo, vinst->fault_crbs,
+				atomic_read(&vinst->pending_fault));
+
+		window = vas_pswid_to_window(vinst, crb_nx_pswid(crb));
+
+		if (IS_ERR(window)) {
+			/*
+			 * What now? We got an interrupt about a specific send
+			 * window but we can't find that window and we can't
+			 * even clean it up (return credit).
+			 * But we should not get here.
+			 */
+			pr_err("VAS[%d] fault_fifo %p, fifo %p, pswid 0x%x, "
+				"fault_crbs %d, pending %d bad CRB?\n",
+				vinst->vas_id,
+				vinst->fault_fifo, fifo, crb_nx_pswid(crb),
+				vinst->fault_crbs,
+				atomic_read(&vinst->pending_fault));
+
+			WARN_ON_ONCE(1);
+			return;
+		}
+
+	} while (true);
+}
+
+/*
  * Fault handler thread for each VAS instance and process fault CRBs.
  */
 static int fault_handler_func(void *arg)
@@ -56,6 +138,8 @@ static int fault_handler_func(void *arg)
 			break;
 
 		atomic_dec(&vinst->pending_fault);
+		process_fault_crbs(vinst);
+
 	} while (!kthread_should_stop());
 
 	return 0;
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 6530a0b..77871c1 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1287,3 +1287,54 @@ u32 vas_win_id(struct vas_window *win)
 	return encode_pswid(win->vinst->vas_id, win->winid);
 }
 EXPORT_SYMBOL_GPL(vas_win_id);
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
+		pr_err("PSWID decode: Could not find window for winid %d"
+			" pswid %d vinst 0x%p\n", winid, pswid, vinst);
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
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index ee284b3..eb929c7 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -317,6 +317,7 @@ struct vas_instance {
 	int virq;
 	int fault_fifo_size;
 	void *fault_fifo;
+	int fault_crbs;
 	atomic_t pending_fault;
 	wait_queue_head_t fault_wq;
 	struct task_struct *fault_handler;
@@ -420,6 +421,8 @@ struct vas_winctx {
 extern void vas_wakeup_fault_handler(int virq, void *arg);
 extern int vas_setup_fault_handler(struct vas_instance *vinst);
 extern void vas_cleanup_fault_handler(struct vas_instance *vinst);
+extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
+						uint32_t pswid);
 
 static inline void vas_log_write(struct vas_window *win, char *name,
 			void *regptr, u64 val)
-- 
1.8.3.1



