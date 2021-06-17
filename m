Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F323ABD7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 22:33:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5YfZ059bz3cZl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:33:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LfkTohWV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LfkTohWV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5Yf51gcZz3bsT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 06:33:01 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HK44mX144085; Thu, 17 Jun 2021 16:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=g3C4iUgTQyLKqF3l4jfi69i9vl+mxFkzQGMS6WbT+co=;
 b=LfkTohWVKzOG8YikZMW+OjUSvyK48Y9mXgoJxXg1SKQzaWXVcDC6oLyD0PlF/Sq5lng0
 MbZWlAP2+53Fj9L3G8L+o5Loyj+yL3mLObk9WzFOuYdlb7pqDgZk8ldoWZkEInhxDTmo
 zBUpQzdtiOEL1uBKIOH9tTlHdq9aJ9XVKfpO5bLlFCFyeHMeR0QMYX0wktdW9VBAB0ky
 Z/sUq30ByZf3oKakbEg2DTM0GjoDaj48eBEYUg2FctfF9Q0PrCYgVJs9sVi+YPLMyB5x
 u96iU21w74dI267vL4zC/Jl52PqiF/Jyh+32vMxEOwY29GN9zcODoWs+NFDZMY85d1gu Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398ck2hh07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:32:55 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HKFseb071559;
 Thu, 17 Jun 2021 16:32:54 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398ck2hh02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:32:54 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HKILiv028874;
 Thu, 17 Jun 2021 20:32:53 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 3980b9f82p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 20:32:53 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HKWq5t18940258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 20:32:52 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78CB7BE051;
 Thu, 17 Jun 2021 20:32:52 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B37AFBE054;
 Thu, 17 Jun 2021 20:32:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 20:32:48 +0000 (GMT)
Message-ID: <bf8d5b0770fa1ef5cba88c96580caa08d999d3b5.camel@linux.ibm.com>
Subject: [PATCH v6 06/17] powerpc/vas: Move update_csb/dump_crb to common
 book3s platform
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Thu, 17 Jun 2021 13:32:38 -0700
In-Reply-To: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Hu78DSF2bIMkexz7KZL-vx-xdY1oI1PB
X-Proofpoint-ORIG-GUID: vBENB8f71djO3revsxrQU4YZyEYvipIh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_16:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170122
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


If a coprocessor encounters an error translating an address, the
VAS will cause an interrupt in the host. The kernel processes
the fault by updating CSB. This functionality is same for both
powerNV and pseries. So this patch moves these functions to
common vas-api.c and the actual functionality is not changed.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/vas.h             |   3 +
 arch/powerpc/platforms/book3s/vas-api.c    | 167 +++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-fault.c | 155 ++-----------------
 3 files changed, 179 insertions(+), 146 deletions(-)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 71cff6d6bf3a..6b41c0818958 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -230,4 +230,7 @@ int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
 void vas_unregister_coproc_api(void);
 
 int get_vas_user_win_ref(struct vas_user_win_ref *task_ref);
+void vas_update_csb(struct coprocessor_request_block *crb,
+		    struct vas_user_win_ref *task_ref);
+void vas_dump_crb(struct coprocessor_request_block *crb);
 #endif /* __ASM_POWERPC_VAS_H */
diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 4ce82500f4c5..30172e52e16b 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -10,6 +10,9 @@
 #include <linux/fs.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/kthread.h>
+#include <linux/sched/signal.h>
+#include <linux/mmu_context.h>
 #include <linux/io.h>
 #include <asm/vas.h>
 #include <uapi/asm/vas-api.h>
@@ -94,6 +97,170 @@ int get_vas_user_win_ref(struct vas_user_win_ref *task_ref)
 	return 0;
 }
 
+/*
+ * Successful return must release the task reference with
+ * put_task_struct
+ */
+static bool ref_get_pid_and_task(struct vas_user_win_ref *task_ref,
+			  struct task_struct **tskp, struct pid **pidp)
+{
+	struct task_struct *tsk;
+	struct pid *pid;
+
+	pid = task_ref->pid;
+	tsk = get_pid_task(pid, PIDTYPE_PID);
+	if (!tsk) {
+		pid = task_ref->tgid;
+		tsk = get_pid_task(pid, PIDTYPE_PID);
+		/*
+		 * Parent thread (tgid) will be closing window when it
+		 * exits. So should not get here.
+		 */
+		if (WARN_ON_ONCE(!tsk))
+			return false;
+	}
+
+	/* Return if the task is exiting. */
+	if (tsk->flags & PF_EXITING) {
+		put_task_struct(tsk);
+		return false;
+	}
+
+	*tskp = tsk;
+	*pidp = pid;
+
+	return true;
+}
+
+/*
+ * Update the CSB to indicate a translation error.
+ *
+ * User space will be polling on CSB after the request is issued.
+ * If NX can handle the request without any issues, it updates CSB.
+ * Whereas if NX encounters page fault, the kernel will handle the
+ * fault and update CSB with translation error.
+ *
+ * If we are unable to update the CSB means copy_to_user failed due to
+ * invalid csb_addr, send a signal to the process.
+ */
+void vas_update_csb(struct coprocessor_request_block *crb,
+		    struct vas_user_win_ref *task_ref)
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
+	if (WARN_ON_ONCE(!task_ref->mm))
+		return;
+
+	csb_addr = (void __user *)be64_to_cpu(crb->csb_addr);
+
+	memset(&csb, 0, sizeof(csb));
+	csb.cc = CSB_CC_FAULT_ADDRESS;
+	csb.ce = CSB_CE_TERMINATION;
+	csb.cs = 0;
+	csb.count = 0;
+
+	/*
+	 * NX operates and returns in BE format as defined CRB struct.
+	 * So saves fault_storage_addr in BE as NX pastes in FIFO and
+	 * expects user space to convert to CPU format.
+	 */
+	csb.address = crb->stamp.nx.fault_storage_addr;
+	csb.flags = 0;
+
+	/*
+	 * Process closes send window after all pending NX requests are
+	 * completed. In multi-thread applications, a child thread can
+	 * open a window and can exit without closing it. May be some
+	 * requests are pending or this window can be used by other
+	 * threads later. We should handle faults if NX encounters
+	 * pages faults on these requests. Update CSB with translation
+	 * error and fault address. If csb_addr passed by user space is
+	 * invalid, send SEGV signal to pid saved in window. If the
+	 * child thread is not running, send the signal to tgid.
+	 * Parent thread (tgid) will close this window upon its exit.
+	 *
+	 * pid and mm references are taken when window is opened by
+	 * process (pid). So tgid is used only when child thread opens
+	 * a window and exits without closing it.
+	 */
+
+	if (!ref_get_pid_and_task(task_ref, &tsk, &pid))
+		return;
+
+	kthread_use_mm(task_ref->mm);
+	rc = copy_to_user(csb_addr, &csb, sizeof(csb));
+	/*
+	 * User space polls on csb.flags (first byte). So add barrier
+	 * then copy first byte with csb flags update.
+	 */
+	if (!rc) {
+		csb.flags = CSB_V;
+		/* Make sure update to csb.flags is visible now */
+		smp_mb();
+		rc = copy_to_user(csb_addr, &csb, sizeof(u8));
+	}
+	kthread_unuse_mm(task_ref->mm);
+	put_task_struct(tsk);
+
+	/* Success */
+	if (!rc)
+		return;
+
+
+	pr_debug("Invalid CSB address 0x%p signalling pid(%d)\n",
+			csb_addr, pid_vnr(pid));
+
+	clear_siginfo(&info);
+	info.si_signo = SIGSEGV;
+	info.si_errno = EFAULT;
+	info.si_code = SEGV_MAPERR;
+	info.si_addr = csb_addr;
+	/*
+	 * process will be polling on csb.flags after request is sent to
+	 * NX. So generally CSB update should not fail except when an
+	 * application passes invalid csb_addr. So an error message will
+	 * be displayed and leave it to user space whether to ignore or
+	 * handle this signal.
+	 */
+	rcu_read_lock();
+	rc = kill_pid_info(SIGSEGV, &info, pid);
+	rcu_read_unlock();
+
+	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__,
+			pid_vnr(pid), rc);
+}
+
+void vas_dump_crb(struct coprocessor_request_block *crb)
+{
+	struct data_descriptor_entry *dde;
+	struct nx_fault_stamp *nx;
+
+	dde = &crb->source;
+	pr_devel("SrcDDE: addr 0x%llx, len %d, count %d, idx %d, flags %d\n",
+		be64_to_cpu(dde->address), be32_to_cpu(dde->length),
+		dde->count, dde->index, dde->flags);
+
+	dde = &crb->target;
+	pr_devel("TgtDDE: addr 0x%llx, len %d, count %d, idx %d, flags %d\n",
+		be64_to_cpu(dde->address), be32_to_cpu(dde->length),
+		dde->count, dde->index, dde->flags);
+
+	nx = &crb->stamp.nx;
+	pr_devel("NX Stamp: PSWID 0x%x, FSA 0x%llx, flags 0x%x, FS 0x%x\n",
+		be32_to_cpu(nx->pswid),
+		be64_to_cpu(crb->stamp.nx.fault_storage_addr),
+		nx->flags, nx->fault_status);
+}
+
 static int coproc_open(struct inode *inode, struct file *fp)
 {
 	struct coproc_instance *cp_inst;
diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index ac3a71ec3bd5..2729ac541fb3 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -26,150 +26,6 @@
  */
 #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
 
-static void dump_crb(struct coprocessor_request_block *crb)
-{
-	struct data_descriptor_entry *dde;
-	struct nx_fault_stamp *nx;
-
-	dde = &crb->source;
-	pr_devel("SrcDDE: addr 0x%llx, len %d, count %d, idx %d, flags %d\n",
-		be64_to_cpu(dde->address), be32_to_cpu(dde->length),
-		dde->count, dde->index, dde->flags);
-
-	dde = &crb->target;
-	pr_devel("TgtDDE: addr 0x%llx, len %d, count %d, idx %d, flags %d\n",
-		be64_to_cpu(dde->address), be32_to_cpu(dde->length),
-		dde->count, dde->index, dde->flags);
-
-	nx = &crb->stamp.nx;
-	pr_devel("NX Stamp: PSWID 0x%x, FSA 0x%llx, flags 0x%x, FS 0x%x\n",
-		be32_to_cpu(nx->pswid),
-		be64_to_cpu(crb->stamp.nx.fault_storage_addr),
-		nx->flags, nx->fault_status);
-}
-
-/*
- * Update the CSB to indicate a translation error.
- *
- * User space will be polling on CSB after the request is issued.
- * If NX can handle the request without any issues, it updates CSB.
- * Whereas if NX encounters page fault, the kernel will handle the
- * fault and update CSB with translation error.
- *
- * If we are unable to update the CSB means copy_to_user failed due to
- * invalid csb_addr, send a signal to the process.
- */
-static void update_csb(struct vas_window *window,
-			struct coprocessor_request_block *crb)
-{
-	struct coprocessor_status_block csb;
-	struct kernel_siginfo info;
-	struct task_struct *tsk;
-	void __user *csb_addr;
-	struct pid *pid;
-	int rc;
-
-	/*
-	 * NX user space windows can not be opened for task->mm=NULL
-	 * and faults will not be generated for kernel requests.
-	 */
-	if (WARN_ON_ONCE(!window->task_ref.mm || !window->user_win))
-		return;
-
-	csb_addr = (void __user *)be64_to_cpu(crb->csb_addr);
-
-	memset(&csb, 0, sizeof(csb));
-	csb.cc = CSB_CC_FAULT_ADDRESS;
-	csb.ce = CSB_CE_TERMINATION;
-	csb.cs = 0;
-	csb.count = 0;
-
-	/*
-	 * NX operates and returns in BE format as defined CRB struct.
-	 * So saves fault_storage_addr in BE as NX pastes in FIFO and
-	 * expects user space to convert to CPU format.
-	 */
-	csb.address = crb->stamp.nx.fault_storage_addr;
-	csb.flags = 0;
-
-	pid = window->task_ref.pid;
-	tsk = get_pid_task(pid, PIDTYPE_PID);
-	/*
-	 * Process closes send window after all pending NX requests are
-	 * completed. In multi-thread applications, a child thread can
-	 * open a window and can exit without closing it. May be some
-	 * requests are pending or this window can be used by other
-	 * threads later. We should handle faults if NX encounters
-	 * pages faults on these requests. Update CSB with translation
-	 * error and fault address. If csb_addr passed by user space is
-	 * invalid, send SEGV signal to pid saved in window. If the
-	 * child thread is not running, send the signal to tgid.
-	 * Parent thread (tgid) will close this window upon its exit.
-	 *
-	 * pid and mm references are taken when window is opened by
-	 * process (pid). So tgid is used only when child thread opens
-	 * a window and exits without closing it.
-	 */
-	if (!tsk) {
-		pid = window->task_ref.tgid;
-		tsk = get_pid_task(pid, PIDTYPE_PID);
-		/*
-		 * Parent thread (tgid) will be closing window when it
-		 * exits. So should not get here.
-		 */
-		if (WARN_ON_ONCE(!tsk))
-			return;
-	}
-
-	/* Return if the task is exiting. */
-	if (tsk->flags & PF_EXITING) {
-		put_task_struct(tsk);
-		return;
-	}
-
-	kthread_use_mm(window->task_ref.mm);
-	rc = copy_to_user(csb_addr, &csb, sizeof(csb));
-	/*
-	 * User space polls on csb.flags (first byte). So add barrier
-	 * then copy first byte with csb flags update.
-	 */
-	if (!rc) {
-		csb.flags = CSB_V;
-		/* Make sure update to csb.flags is visible now */
-		smp_mb();
-		rc = copy_to_user(csb_addr, &csb, sizeof(u8));
-	}
-	kthread_unuse_mm(window->task_ref.mm);
-	put_task_struct(tsk);
-
-	/* Success */
-	if (!rc)
-		return;
-
-	pr_debug("Invalid CSB address 0x%p signalling pid(%d)\n",
-			csb_addr, pid_vnr(pid));
-
-	clear_siginfo(&info);
-	info.si_signo = SIGSEGV;
-	info.si_errno = EFAULT;
-	info.si_code = SEGV_MAPERR;
-	info.si_addr = csb_addr;
-
-	/*
-	 * process will be polling on csb.flags after request is sent to
-	 * NX. So generally CSB update should not fail except when an
-	 * application passes invalid csb_addr. So an error message will
-	 * be displayed and leave it to user space whether to ignore or
-	 * handle this signal.
-	 */
-	rcu_read_lock();
-	rc = kill_pid_info(SIGSEGV, &info, pid);
-	rcu_read_unlock();
-
-	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__,
-			pid_vnr(pid), rc);
-}
-
 static void dump_fifo(struct vas_instance *vinst, void *entry)
 {
 	unsigned long *end = vinst->fault_fifo + vinst->fault_fifo_size;
@@ -272,7 +128,7 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
 				vinst->vas_id, vinst->fault_fifo, fifo,
 				vinst->fault_crbs);
 
-		dump_crb(crb);
+		vas_dump_crb(crb);
 		window = vas_pswid_to_window(vinst,
 				be32_to_cpu(crb->stamp.nx.pswid));
 
@@ -293,7 +149,14 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
 
 			WARN_ON_ONCE(1);
 		} else {
-			update_csb(window, crb);
+			/*
+			 * NX sees faults only with user space windows.
+			 */
+			if (window->user_win)
+				vas_update_csb(crb, &window->task_ref);
+			else
+				WARN_ON_ONCE(!window->user_win);
+
 			/*
 			 * Return credit for send window after processing
 			 * fault CRB.
-- 
2.18.2


