Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0CF10A7E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 02:24:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47N33L29gdzDqQc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 12:24:46 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47N2nT4dsJzDqkX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 12:12:45 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAR1CC7F083594; Tue, 26 Nov 2019 20:12:34 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2whcy73m6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 20:12:34 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAR1CYXp084414;
 Tue, 26 Nov 2019 20:12:34 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2whcy73m60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 20:12:34 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAR1A8n6004319;
 Wed, 27 Nov 2019 01:12:38 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 2wevd689ge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 01:12:38 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAR1CXOO42074590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 01:12:33 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5550D124058;
 Wed, 27 Nov 2019 01:12:33 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9812C124053;
 Wed, 27 Nov 2019 01:12:32 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 27 Nov 2019 01:12:32 +0000 (GMT)
Subject: [PATCH 09/14] powerpc/vas: Update CSB and notify process for fault
 CRBs
From: Haren Myneni <haren@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
 herbert@gondor.apana.org.au
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Nov 2019 17:11:14 -0800
Message-ID: <1574817074.13250.16.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_08:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 spamscore=0 mlxlogscore=542 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270008
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


For each fault CRB, update fault address in CRB (fault_storage_addr)
and translation error status in CSB so that user space touch the
fault address and resend the request. If the user space passed invalid
CSB address send signal to process with SIGSEGV.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c | 121 ++++++++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 7a8b2b5..dd27649 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -36,6 +36,124 @@ void vas_wakeup_fault_handler(int virq, void *arg)
 	wake_up(&vinst->fault_wq);
 }
 
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
+
+	info.si_addr = (void *)fault_addr;
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
+	csb_addr = (void *)__be64_to_cpu(crb->csb_addr);
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
+	csb.address = crb_nx_fault_addr(crb);
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
+	 */
+	if (tsk) {
+		if (tsk->flags & PF_EXITING)
+			task_exit = 1;
+		put_task_struct(tsk);
+		pid = vas_window_pid(window);
+	} else {
+		pid = vas_window_tgid(window);
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
@@ -97,7 +215,7 @@ static void process_fault_crbs(struct vas_instance *vinst)
 
 		if (IS_ERR(window)) {
 			/*
-			 * What now? We got an interrupt about a specific send
+			 * We got an interrupt about a specific send
 			 * window but we can't find that window and we can't
 			 * even clean it up (return credit).
 			 * But we should not get here.
@@ -111,6 +229,7 @@ static void process_fault_crbs(struct vas_instance *vinst)
 			return;
 		}
 
+		update_csb(window, crb);
 	} while (true);
 }
 
-- 
1.8.3.1



