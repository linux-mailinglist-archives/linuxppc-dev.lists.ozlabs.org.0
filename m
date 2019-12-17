Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B226F12247E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 07:08:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cSPr4PvBzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 17:08:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cSBB75G6zDqCF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 16:58:42 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBH5w5Em028408; Tue, 17 Dec 2019 00:58:29 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wxfgsr62d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 00:58:29 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBH5wTf9029419;
 Tue, 17 Dec 2019 00:58:29 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wxfgsr626-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 00:58:29 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBH5tapp030662;
 Tue, 17 Dec 2019 05:58:28 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 2wvqc69ger-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 05:58:28 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBH5wRlb31195556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Dec 2019 05:58:28 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB9C0C605D;
 Tue, 17 Dec 2019 05:58:27 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7843AC6055;
 Tue, 17 Dec 2019 05:58:27 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Dec 2019 05:58:27 +0000 (GMT)
Subject: [PATCH V3 08/13] powerpc/vas: Update CSB and notify process for
 fault CRBs
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1576561080.16318.6531.camel@hbabu-laptop>
References: <1576561080.16318.6531.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Dec 2019 21:56:35 -0800
Message-ID: <1576562195.16318.6542.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-17_01:2019-12-16,2019-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=785 mlxscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912170053
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
 arch/powerpc/platforms/powernv/vas-fault.c | 121 +++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 57f21ea..45bea15c 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/kthread.h>
+#include <linux/sched/signal.h>
 #include <linux/mmu_context.h>
 #include <asm/icswx.h>
 
@@ -26,6 +27,125 @@
 #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
 
 /*
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
+	struct pid *pid;
+	void __user *csb_addr;
+	struct task_struct *tsk;
+	struct kernel_siginfo info;
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
+	pid = window->pid;
+	tsk = get_pid_task(pid, PIDTYPE_PID);
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
+	if (!tsk) {
+		pid = window->tgid;
+		tsk = get_pid_task(pid, PIDTYPE_PID);
+		/*
+		 * Parent thread will be closing window during its exit.
+		 * So should not get here.
+		 */
+		if (!tsk)
+			return;
+	}
+
+	/* Do not notify if the task is exiting. */
+	if (tsk->flags & PF_EXITING) {
+		put_task_struct(tsk);
+		return;
+	}
+	put_task_struct(tsk);
+
+	pr_err("Invalid CSB address 0x%p signalling pid(%d)\n",
+			csb_addr, pid_vnr(pid));
+
+	clear_siginfo(&info);
+	info.si_signo = SIGSEGV;
+	info.si_errno = EFAULT;
+	info.si_code = SEGV_MAPERR;
+	info.si_addr = csb_addr;
+
+	/*
+	 * process will be polling on csb.flags after request is sent to
+	 * NX. So generally CSB update should not fail except when an
+	 * application does not follow the process properly. So an error
+	 * message will be displayed and leave it to user space whether
+	 * to ignore or handle this signal.
+	 */
+	rcu_read_lock();
+	rc = kill_pid_info(SIGSEGV, &info, pid);
+	rcu_read_unlock();
+
+	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__,
+			pid_vnr(pid), rc);
+}
+
+/*
  * Process CRBs that we receive on the fault window.
  */
 irqreturn_t vas_fault_handler(int irq, void *data)
@@ -102,6 +222,7 @@ irqreturn_t vas_fault_handler(int irq, void *data)
 			return IRQ_HANDLED;
 		}
 
+		update_csb(window, crb);
 	} while (true);
 
 	return IRQ_HANDLED;
-- 
1.8.3.1



