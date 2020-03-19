Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8635A18ACC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 07:29:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jcTF0yCqzDr8r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 17:29:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jcCg4HFjzDr6x
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 17:18:07 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02J63xKi056218; Thu, 19 Mar 2020 02:17:54 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yu7fsp2nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 02:17:54 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02J64FPI057055;
 Thu, 19 Mar 2020 02:17:53 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yu7fsp2my-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 02:17:53 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02J6G77X013861;
 Thu, 19 Mar 2020 06:17:52 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 2yrpw6yw5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 06:17:52 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02J6Hppg14811788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 06:17:51 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6797AC605B;
 Thu, 19 Mar 2020 06:17:51 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0146C6055;
 Thu, 19 Mar 2020 06:17:50 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Mar 2020 06:17:50 +0000 (GMT)
Subject: [PATCH v8 09/14] powerpc/vas: Update CSB and notify process for
 fault CRBs
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1584598120.9256.15237.camel@hbabu-laptop>
References: <1584598120.9256.15237.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 18 Mar 2020 23:17:28 -0700
Message-ID: <1584598648.9256.15258.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_10:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=1 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003190024
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
 linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


For each fault CRB, update fault address in CRB (fault_storage_addr)
and translation error status in CSB so that user space can touch the
fault address and resend the request. If the user space passed invalid
CSB address send signal to process with SIGSEGV.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c | 115 +++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 1c6d5cc..6eceac5d 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/kthread.h>
+#include <linux/sched/signal.h>
 #include <linux/mmu_context.h>
 #include <asm/icswx.h>
 
@@ -26,6 +27,119 @@
 #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
 
 /*
+ * Update the CSB to indicate a translation error.
+ *
+ * If we are unable to update the CSB means copy_to_user failed due to
+ * invalid csb_addr, send a signal to the process.
+ *
+ * Remaining settings in the CSB are based on wait_for_csb() of
+ * NX-GZIP.
+ */
+static void update_csb(struct vas_window *window,
+			struct coprocessor_request_block *crb)
+{
+	struct coprocessor_status_block csb;
+	struct kernel_siginfo info;
+	struct task_struct *tsk;
+	void __user *csb_addr;
+	struct pid *pid;
+	int rc;
+
+	/*
+	 * NX user space windows can not be opened for task->mm=NULL
+	 * and faults will not be generated for kernel requests.
+	 */
+	if (WARN_ON_ONCE(!window->mm || !window->user_win))
+		return;
+
+	csb_addr = (void __user *)be64_to_cpu(crb->csb_addr);
+
+	memset(&csb, 0, sizeof(csb));
+	csb.cc = CSB_CC_TRANSLATION;
+	csb.ce = CSB_CE_TERMINATION;
+	csb.cs = 0;
+	csb.count = 0;
+
+	/*
+	 * NX operates and returns in BE format as defined CRB struct.
+	 * So return fault_storage_addr in BE as NX pastes in FIFO and
+	 * expects user space to convert to CPU format.
+	 */
+	csb.address = crb->stamp.nx.fault_storage_addr;
+	csb.flags = 0;
+
+	pid = window->pid;
+	tsk = get_pid_task(pid, PIDTYPE_PID);
+	/*
+	 * Send window will be closed after processing all NX requests
+	 * and process exits after closing all windows. In multi-thread
+	 * applications, thread may not exists, but does not close FD
+	 * (means send window) upon exit. Parent thread (tgid) can use
+	 * and close the window later.
+	 * pid and mm references are taken when window is opened by
+	 * process (pid). So tgid is used only when child thread opens
+	 * a window and exits without closing it in multithread tasks.
+	 */
+	if (!tsk) {
+		pid = window->tgid;
+		tsk = get_pid_task(pid, PIDTYPE_PID);
+		/*
+		 * Parent thread will be closing window during its exit.
+		 * So should not get here.
+		 */
+		if (WARN_ON_ONCE(!tsk))
+			return;
+	}
+
+	/* Return if the task is exiting. */
+	if (tsk->flags & PF_EXITING) {
+		put_task_struct(tsk);
+		return;
+	}
+
+	use_mm(window->mm);
+	rc = copy_to_user(csb_addr, &csb, sizeof(csb));
+	/*
+	 * User space polls on csb.flags (first byte). So add barrier
+	 * then copy first byte with csb flags update.
+	 */
+	if (!rc) {
+		csb.flags = CSB_V;
+		smp_mb();
+		rc = copy_to_user(csb_addr, &csb, sizeof(u8));
+	}
+	unuse_mm(window->mm);
+	put_task_struct(tsk);
+
+	/* Success */
+	if (!rc)
+		return;
+
+	pr_debug("Invalid CSB address 0x%p signalling pid(%d)\n",
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
  * Process valid CRBs in fault FIFO.
  */
 irqreturn_t vas_fault_thread_fn(int irq, void *data)
@@ -111,6 +225,7 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
 			return IRQ_HANDLED;
 		}
 
+		update_csb(window, crb);
 	} while (true);
 }
 
-- 
1.8.3.1



