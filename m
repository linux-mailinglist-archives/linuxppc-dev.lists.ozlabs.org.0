Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA2811658C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 04:43:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WTYN6JskzDqLR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 14:43:04 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WTNf3VHBzDqLl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 14:35:30 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB93WwQA133020; Sun, 8 Dec 2019 22:35:19 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wrt1xgrwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Dec 2019 22:35:18 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xB93Xc88134488;
 Sun, 8 Dec 2019 22:35:18 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wrt1xgrw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Dec 2019 22:35:18 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB93VgNw005963;
 Mon, 9 Dec 2019 03:35:17 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 2wr3q5y8pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2019 03:35:17 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB93ZGqv49021320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Dec 2019 03:35:16 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAB61AE05C;
 Mon,  9 Dec 2019 03:35:16 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F209EAE066;
 Mon,  9 Dec 2019 03:35:15 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  9 Dec 2019 03:35:15 +0000 (GMT)
Subject: [PATCH V2 08/13] powerpc/vas: Update CSB and notify process for
 fault CRBs
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1575861522.16318.9.camel@hbabu-laptop>
References: <1575861522.16318.9.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 08 Dec 2019 19:33:37 -0800
Message-ID: <1575862417.16318.25.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-08_07:2019-12-05,2019-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 suspectscore=1 impostorscore=0 mlxscore=0 adultscore=0
 mlxlogscore=744 classifier=spam adjust=0 reason=mlx scancount=1
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


For each fault CRB, update fault address in CRB (fault_storage_addr)
and translation error status in CSB so that user space can touch the
fault address and resend the request. If the user space passed invalid
CSB address send signal to process with SIGSEGV.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c | 130 +++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index e1e34c6..88a211b 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/kthread.h>
+#include <linux/sched/signal.h>
 #include <linux/mmu_context.h>
 #include <asm/icswx.h>
 
@@ -25,6 +26,134 @@
  */
 #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
 
+static void notify_process(pid_t pid, u64 fault_addr)
+{
+	int rc;
+	struct kernel_siginfo info;
+
+	memset(&info, 0, sizeof(info));
+
+	info.si_signo = SIGSEGV;
+	info.si_errno = EFAULT;
+	info.si_code = SEGV_MAPERR;
+	info.si_addr = (void *)fault_addr;
+	/*
+	 * process will be polling on csb.flags after request is sent to
+	 * NX. So generally CSB update should not fail except when an
+	 * application does not follow the process properly. So an error
+	 * message will be displayed and leave it to user space whether
+	 * to ignore or handle this signal.
+	 */
+	rcu_read_lock();
+	rc = kill_pid_info(SIGSEGV, &info, find_vpid(pid));
+	rcu_read_unlock();
+
+	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__, pid, rc);
+}
+
+/*
+ * Update the CSB to indicate a translation error.
+ *
+ * If the fault is in the CSB address itself or if we are unable to
+ * update the CSB, send a signal to the process, because we have no
+ * other way of notifying the user process.
+ *
+ * Remaining settings in the CSB are based on wait_for_csb() of
+ * NX-GZIP.
+ */
+static void update_csb(struct vas_window *window,
+			struct coprocessor_request_block *crb)
+{
+	int rc;
+	pid_t pid;
+	int task_exit = 0;
+	void __user *csb_addr;
+	struct task_struct *tsk;
+	struct coprocessor_status_block csb;
+
+	/*
+	 * NX user space windows can not be opened for task->mm=NULL
+	 * and faults will not be generated for kernel requests.
+	 */
+	if (!window->mm || !window->user_win)
+		return;
+
+	csb_addr = (void *)be64_to_cpu(crb->csb_addr);
+
+	csb.cc = CSB_CC_TRANSLATION;
+	csb.ce = CSB_CE_TERMINATION;
+	csb.cs = 0;
+	csb.count = 0;
+
+	/*
+	 * Returns the fault address in CPU format since it is passed with
+	 * signal. But if the user space expects BE format, need changes.
+	 * i.e either kernel (here) or user should convert to CPU format.
+	 * Not both!
+	 */
+	csb.address = be64_to_cpu(crb->stamp.nx.fault_storage_addr);
+	csb.flags = 0;
+
+	use_mm(window->mm);
+	rc = copy_to_user(csb_addr, &csb, sizeof(csb));
+	/*
+	 * User space polls on csb.flags (first byte). So add barrier
+	 * then copy first byte with csb flags update.
+	 */
+	smp_mb();
+	if (!rc) {
+		csb.flags = CSB_V;
+		rc = copy_to_user(csb_addr, &csb, sizeof(u8));
+	}
+	unuse_mm(window->mm);
+
+	/* Success */
+	if (!rc)
+		return;
+
+	/*
+	 * User space passed invalid CSB address, Notify process with
+	 * SEGV signal.
+	 */
+	tsk = get_pid_task(window->pid, PIDTYPE_PID);
+	/*
+	 * Send window will be closed after processing all NX requests
+	 * and process exits after closing all windows. In multi-thread
+	 * applications, thread may not exists, but does not close FD
+	 * (means send window) upon exit. Parent thread (tgid) can use
+	 * and close the window later.
+	 * pid and mm references are taken when window is opened by
+	 * process (pid). So tgid is used only when child thread is not
+	 * available in multithread tasks.
+	 *
+	 */
+	if (tsk) {
+		if (tsk->flags & PF_EXITING)
+			task_exit = 1;
+		put_task_struct(tsk);
+		pid = vas_window_pid(window);
+	} else {
+		pid = window->tgid;
+
+		rcu_read_lock();
+		tsk = find_task_by_vpid(pid);
+		if (!tsk) {
+			rcu_read_unlock();
+			return;
+		}
+		if (tsk->flags & PF_EXITING)
+			task_exit = 1;
+		rcu_read_unlock();
+	}
+
+	/* Do not notify if the task is exiting. */
+	if (!task_exit) {
+		pr_err("Invalid CSB address 0x%p signalling pid(%d)\n",
+				csb_addr, pid);
+		notify_process(pid, (u64)csb_addr);
+	}
+}
+
 /*
  * Process CRBs that we receive on the fault window.
  */
@@ -102,6 +231,7 @@ irqreturn_t vas_fault_handler(int irq, void *data)
 			return IRQ_HANDLED;
 		}
 
+		update_csb(window, crb);
 	} while (true);
 
 	return IRQ_HANDLED;
-- 
1.8.3.1



