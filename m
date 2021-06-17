Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D5C3ABD7A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 22:32:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5YdQ1qBdz3cTq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:32:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nvn9+0dc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Nvn9+0dc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5Ycw2sxDz3btt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 06:32:00 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HK3KUC004828; Thu, 17 Jun 2021 16:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=xQg/Im9kMRXPnYmdDllCfa3ZewLt0ykMdUxieBWzceY=;
 b=Nvn9+0dcnsfIwdobUR4W34b4VY+Vs25WGTYBrZribPObMuDm3JI2WYi+j34+8az93XLV
 uCh2joC++i8Q6qMeBlYN7t9mmY4D1AtSfF1XPsuVxg7Mw46+cJCNENSq7RQ90uu9dLBY
 mtRpxzs1dm0nxQIO1vSt3qV0Jb86rlQ8Z2NG0kEowGxzP5poBQVy8cWzr2j7bvpCkUTy
 Py3Qa+FbpsF690p1q990Yo9l/Xr5s+SvwSE/MbrUDG4FfDK+1tOxGb7dRkQJNQs1by5q
 /g0Dn/4euDp1kwn19uCRxvrBWf610/aANZ+wwCGrwmSMcKzxbmesBV7n8N5Snotic2HH 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398cem9qjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:31:53 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HKN1FQ093413;
 Thu, 17 Jun 2021 16:31:53 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398cem9qjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:31:53 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HKHSup030393;
 Thu, 17 Jun 2021 20:31:51 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 3954gkqagf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 20:31:51 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HKVpoZ40501614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 20:31:51 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C32EAE062;
 Thu, 17 Jun 2021 20:31:51 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5415CAE05F;
 Thu, 17 Jun 2021 20:31:50 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 20:31:50 +0000 (GMT)
Message-ID: <2fa40df962250a737c804e58202924717b39e381.camel@linux.ibm.com>
Subject: [PATCH v6 05/17] powerpc/vas: Create take/drop pid and mm reference
 functions
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Thu, 17 Jun 2021 13:31:43 -0700
In-Reply-To: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xLNsRo8cnJ1dRzLnOrEiF675h2kPvvPa
X-Proofpoint-ORIG-GUID: zmeEbWj47fUItcMWA-_O4rIPG4E1awpt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_15:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=664 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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


Take pid and mm references when each window opens and drops during
close. This functionality is needed for powerNV and pseries. So
this patch defines the existing code as functions in common book3s
platform vas-api.c

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/vas.h              | 40 +++++++++++++++
 arch/powerpc/platforms/book3s/vas-api.c     | 39 +++++++++++++++
 arch/powerpc/platforms/powernv/vas-fault.c  | 10 ++--
 arch/powerpc/platforms/powernv/vas-window.c | 55 ++-------------------
 arch/powerpc/platforms/powernv/vas.h        |  6 +--
 5 files changed, 91 insertions(+), 59 deletions(-)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 163a8bb85d02..71cff6d6bf3a 100644
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
@@ -59,6 +73,31 @@ struct vas_user_win_ops {
 	int (*close_win)(struct vas_window *);
 };
 
+static inline void put_vas_user_win_ref(struct vas_user_win_ref *ref)
+{
+	/* Drop references to pid, tgid, and mm */
+	put_pid(ref->pid);
+	put_pid(ref->tgid);
+	if (ref->mm)
+		mmdrop(ref->mm);
+}
+
+static inline void vas_user_win_add_mm_context(struct vas_user_win_ref *ref)
+{
+	mm_context_add_vas_window(ref->mm);
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
+}
+
 /*
  * Receive window attributes specified by the (in-kernel) owner of window.
  */
@@ -190,4 +229,5 @@ int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
 			    const struct vas_user_win_ops *vops);
 void vas_unregister_coproc_api(void);
 
+int get_vas_user_win_ref(struct vas_user_win_ref *task_ref);
 #endif /* __ASM_POWERPC_VAS_H */
diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index ad566464b55b..4ce82500f4c5 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -55,6 +55,45 @@ static char *coproc_devnode(struct device *dev, umode_t *mode)
 	return kasprintf(GFP_KERNEL, "crypto/%s", dev_name(dev));
 }
 
+/*
+ * Take reference to pid and mm
+ */
+int get_vas_user_win_ref(struct vas_user_win_ref *task_ref)
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
+	/*
+	 * Process closes window during exit. In the case of
+	 * multithread application, the child thread can open
+	 * window and can exit without closing it. So takes tgid
+	 * reference until window closed to make sure tgid is not
+	 * reused.
+	 */
+	task_ref->tgid = find_get_pid(task_tgid_vnr(current));
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
index 26440da4fc6a..6489e29085be 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1065,51 +1065,11 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
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
+		rc = get_vas_user_win_ref(&txwin->task_ref);
+		if (rc)
 			goto free_window;
-		}
 
-		mmgrab(txwin->mm);
-		mmput(txwin->mm);
-		mm_context_add_vas_window(txwin->mm);
-		/*
-		 * Process closes window during exit. In the case of
-		 * multithread application, the child thread can open
-		 * window and can exit without closing it. so takes tgid
-		 * reference until window closed to make sure tgid is not
-		 * reused.
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
+		vas_user_win_add_mm_context(&txwin->task_ref);
 	}
 
 	set_vinst_win(vinst, txwin);
@@ -1340,13 +1300,8 @@ int vas_win_close(struct vas_window *window)
 	/* if send window, drop reference to matching receive window */
 	if (window->tx_win) {
 		if (window->user_win) {
-			/* Drop references to pid. tgid and mm */
-			put_pid(window->pid);
-			put_pid(window->tgid);
-			if (window->mm) {
-				mm_context_remove_vas_window(window->mm);
-				mmdrop(window->mm);
-			}
+			put_vas_user_win_ref(&window->task_ref);
+			mm_context_remove_vas_window(window->task_ref.mm);
 		}
 		put_rx_win(window->rxwin);
 	}
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index c2b1e12efca5..614db6a80c67 100644
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


