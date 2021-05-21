Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B0E38C329
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 11:32:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmhG74R93z3c8G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 19:32:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e520k5bq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=e520k5bq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmhFf2YHYz2yxS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 19:31:50 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L94FS5034887; Fri, 21 May 2021 05:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=EC/1nfUh5G+/nCcLS+tMkI+HePkExbJxj3kwL3fRrks=;
 b=e520k5bqV41psBdiKhpFVQeHvSeWlafci8Yjw+gNCenpIrZu6we9tLowuYoheayxcr2z
 /SsqWZY/qu/ganh/KHQchGDqYiXLmipGt+htH90I1IswmtNU+6aNq/AY5136FJ4quIeB
 ZdWXJKZU9S4z4Rbyvs9qqhOo0Xu6cyPkkGj/Xs+qOjv8wP7YHANYvt3bHjVDEUYFa/c2
 nYBHQdcJP6UMO3wxtJFFxuYTmUHRfD3t8Mh6PpZk5E2ylPe9KWAYLf9ZrNwdEoIx7Tte
 Z1Frra9Hn9MKnLt0/iEh9mY/FQfrycduPJ6Gkho4L5f6armmCa3CLuiXNYNgjfwFwWMN FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38p8k4jxer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:31:43 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14L94Ps6035613;
 Fri, 21 May 2021 05:31:42 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38p8k4jxde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:31:42 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L9DgSO014021;
 Fri, 21 May 2021 09:31:41 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 38j5xaa5mv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 09:31:41 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L9Vecs25493814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 09:31:40 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EC2628060;
 Fri, 21 May 2021 09:31:40 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 150A528059;
 Fri, 21 May 2021 09:31:39 +0000 (GMT)
Received: from sig-9-65-94-165.ibm.com (unknown [9.65.94.165])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 09:31:38 +0000 (GMT)
Message-ID: <16a319614a7ab4ce843f42a49c3ecf68ed03dd36.camel@linux.ibm.com>
Subject: [PATCH v4 04/16] powerpc/vas: Create take/drop pid and mm references
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Fri, 21 May 2021 02:31:37 -0700
In-Reply-To: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b5CWk1h2uGDdAfnOouAR_Y26GPRzynKf
X-Proofpoint-ORIG-GUID: smLDijXOxQS1h7SuG8EAfD0Itb7MUf19
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 mlxlogscore=608 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210059
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


Take pid and mm references when each window opens and drops during
close. This functionality is needed for powerNV and pseries. So
this patch defines the existing code as functions in common book3s
platform vas-api.c

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/vas.h              | 25 +++++++++
 arch/powerpc/platforms/book3s/vas-api.c     | 51 ++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-fault.c  | 10 ++--
 arch/powerpc/platforms/powernv/vas-window.c | 57 ++-------------------
 arch/powerpc/platforms/powernv/vas.h        |  6 +--
 5 files changed, 88 insertions(+), 61 deletions(-)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 668303198772..3f2b02461a76 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -5,6 +5,9 @@
 
 #ifndef _ASM_POWERPC_VAS_H
 #define _ASM_POWERPC_VAS_H
+#include <linux/sched/mm.h>
+#include <linux/mmu_context.h>
+#include <asm/icswx.h>
 #include <uapi/asm/vas-api.h>
 
 struct vas_window;
@@ -49,6 +52,17 @@ enum vas_cop_type {
 	VAS_COP_TYPE_MAX,
 };
 
+/*
+ * User space VAS windows are opened by tasks and take references
+ * to pid and mm until windows are closed.
+ * Stores pid, mm, and tgid for each window.
+ */
+struct vas_user_win_ref {
+	struct pid *pid;	/* PID of owner */
+	struct pid *tgid;	/* Thread group ID of owner */
+	struct mm_struct *mm;	/* Linux process mm_struct */
+};
+
 /*
  * User space window operations used for powernv and powerVM
  */
@@ -59,6 +73,16 @@ struct vas_user_win_ops {
 	int (*close_win)(void *);
 };
 
+static inline void vas_drop_reference_pid_mm(struct vas_user_win_ref *ref)
+{
+	/* Drop references to pid and mm */
+	put_pid(ref->pid);
+	if (ref->mm) {
+		mm_context_remove_vas_window(ref->mm);
+		mmdrop(ref->mm);
+	}
+}
+
 /*
  * Receive window attributes specified by the (in-kernel) owner of window.
  */
@@ -192,4 +216,5 @@ int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
 			    struct vas_user_win_ops *vops);
 void vas_unregister_coproc_api(void);
 
+int vas_reference_pid_mm(struct vas_user_win_ref *task_ref);
 #endif /* __ASM_POWERPC_VAS_H */
diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 6c39320bfb9b..a0141bfb2e4b 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -55,6 +55,57 @@ static char *coproc_devnode(struct device *dev, umode_t *mode)
 	return kasprintf(GFP_KERNEL, "crypto/%s", dev_name(dev));
 }
 
+/*
+ * Take reference to pid and mm
+ */
+int vas_reference_pid_mm(struct vas_user_win_ref *task_ref)
+{
+	/*
+	 * Window opened by a child thread may not be closed when
+	 * it exits. So take reference to its pid and release it
+	 * when the window is free by parent thread.
+	 * Acquire a reference to the task's pid to make sure
+	 * pid will not be re-used - needed only for multithread
+	 * applications.
+	 */
+	task_ref->pid = get_task_pid(current, PIDTYPE_PID);
+	/*
+	 * Acquire a reference to the task's mm.
+	 */
+	task_ref->mm = get_task_mm(current);
+	if (!task_ref->mm) {
+		put_pid(task_ref->pid);
+		pr_err("VAS: pid(%d): mm_struct is not found\n",
+				current->pid);
+		return -EPERM;
+	}
+
+	mmgrab(task_ref->mm);
+	mmput(task_ref->mm);
+	mm_context_add_vas_window(task_ref->mm);
+	/*
+	 * Process closes window during exit. In the case of
+	 * multithread application, the child thread can open
+	 * window and can exit without closing it. Expects parent
+	 * thread to use and close the window. So do not need
+	 * to take pid reference for parent thread.
+	 */
+	task_ref->tgid = find_get_pid(task_tgid_vnr(current));
+	/*
+	 * Even a process that has no foreign real address mapping can
+	 * use an unpaired COPY instruction (to no real effect). Issue
+	 * CP_ABORT to clear any pending COPY and prevent a covert
+	 * channel.
+	 *
+	 * __switch_to() will issue CP_ABORT on future context switches
+	 * if process / thread has any open VAS window (Use
+	 * current->mm->context.vas_windows).
+	 */
+	asm volatile(PPC_CP_ABORT);
+
+	return 0;
+}
+
 static int coproc_open(struct inode *inode, struct file *fp)
 {
 	struct coproc_instance *cp_inst;
diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 3d21fce254b7..ac3a71ec3bd5 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -73,7 +73,7 @@ static void update_csb(struct vas_window *window,
 	 * NX user space windows can not be opened for task->mm=NULL
 	 * and faults will not be generated for kernel requests.
 	 */
-	if (WARN_ON_ONCE(!window->mm || !window->user_win))
+	if (WARN_ON_ONCE(!window->task_ref.mm || !window->user_win))
 		return;
 
 	csb_addr = (void __user *)be64_to_cpu(crb->csb_addr);
@@ -92,7 +92,7 @@ static void update_csb(struct vas_window *window,
 	csb.address = crb->stamp.nx.fault_storage_addr;
 	csb.flags = 0;
 
-	pid = window->pid;
+	pid = window->task_ref.pid;
 	tsk = get_pid_task(pid, PIDTYPE_PID);
 	/*
 	 * Process closes send window after all pending NX requests are
@@ -111,7 +111,7 @@ static void update_csb(struct vas_window *window,
 	 * a window and exits without closing it.
 	 */
 	if (!tsk) {
-		pid = window->tgid;
+		pid = window->task_ref.tgid;
 		tsk = get_pid_task(pid, PIDTYPE_PID);
 		/*
 		 * Parent thread (tgid) will be closing window when it
@@ -127,7 +127,7 @@ static void update_csb(struct vas_window *window,
 		return;
 	}
 
-	kthread_use_mm(window->mm);
+	kthread_use_mm(window->task_ref.mm);
 	rc = copy_to_user(csb_addr, &csb, sizeof(csb));
 	/*
 	 * User space polls on csb.flags (first byte). So add barrier
@@ -139,7 +139,7 @@ static void update_csb(struct vas_window *window,
 		smp_mb();
 		rc = copy_to_user(csb_addr, &csb, sizeof(u8));
 	}
-	kthread_unuse_mm(window->mm);
+	kthread_unuse_mm(window->task_ref.mm);
 	put_task_struct(tsk);
 
 	/* Success */
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 3ccd3edcaf1a..ffd619e5a218 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1065,51 +1065,9 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
 			rc = -ENODEV;
 			goto free_window;
 		}
-
-		/*
-		 * Window opened by a child thread may not be closed when
-		 * it exits. So take reference to its pid and release it
-		 * when the window is free by parent thread.
-		 * Acquire a reference to the task's pid to make sure
-		 * pid will not be re-used - needed only for multithread
-		 * applications.
-		 */
-		txwin->pid = get_task_pid(current, PIDTYPE_PID);
-		/*
-		 * Acquire a reference to the task's mm.
-		 */
-		txwin->mm = get_task_mm(current);
-
-		if (!txwin->mm) {
-			put_pid(txwin->pid);
-			pr_err("VAS: pid(%d): mm_struct is not found\n",
-					current->pid);
-			rc = -EPERM;
+		rc = vas_reference_pid_mm(&txwin->task_ref);
+		if (rc)
 			goto free_window;
-		}
-
-		mmgrab(txwin->mm);
-		mmput(txwin->mm);
-		mm_context_add_vas_window(txwin->mm);
-		/*
-		 * Process closes window during exit. In the case of
-		 * multithread application, the child thread can open
-		 * window and can exit without closing it. Expects parent
-		 * thread to use and close the window. So do not need
-		 * to take pid reference for parent thread.
-		 */
-		txwin->tgid = find_get_pid(task_tgid_vnr(current));
-		/*
-		 * Even a process that has no foreign real address mapping can
-		 * use an unpaired COPY instruction (to no real effect). Issue
-		 * CP_ABORT to clear any pending COPY and prevent a covert
-		 * channel.
-		 *
-		 * __switch_to() will issue CP_ABORT on future context switches
-		 * if process / thread has any open VAS window (Use
-		 * current->mm->context.vas_windows).
-		 */
-		asm volatile(PPC_CP_ABORT);
 	}
 
 	set_vinst_win(vinst, txwin);
@@ -1339,14 +1297,9 @@ int vas_win_close(struct vas_window *window)
 
 	/* if send window, drop reference to matching receive window */
 	if (window->tx_win) {
-		if (window->user_win) {
-			/* Drop references to pid and mm */
-			put_pid(window->pid);
-			if (window->mm) {
-				mm_context_remove_vas_window(window->mm);
-				mmdrop(window->mm);
-			}
-		}
+		if (window->user_win)
+			vas_drop_reference_pid_mm(&window->task_ref);
+
 		put_rx_win(window->rxwin);
 	}
 
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index c7db3190baca..f354dd5c51bd 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -357,11 +357,9 @@ struct vas_window {
 	bool user_win;		/* True if user space window */
 	void *hvwc_map;		/* HV window context */
 	void *uwc_map;		/* OS/User window context */
-	struct pid *pid;	/* Linux process id of owner */
-	struct pid *tgid;	/* Thread group ID of owner */
-	struct mm_struct *mm;	/* Linux process mm_struct */
 	int wcreds_max;		/* Window credits */
 
+	struct vas_user_win_ref task_ref;
 	char *dbgname;
 	struct dentry *dbgdir;
 
@@ -443,7 +441,7 @@ extern void vas_win_paste_addr(struct vas_window *window, u64 *addr,
 
 static inline int vas_window_pid(struct vas_window *window)
 {
-	return pid_vnr(window->pid);
+	return pid_vnr(window->task_ref.pid);
 }
 
 static inline void vas_log_write(struct vas_window *win, char *name,
-- 
2.18.2


