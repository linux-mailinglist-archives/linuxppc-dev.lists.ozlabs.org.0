Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE51219B7BD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 23:38:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t01h30FNzDqS4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 08:38:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48szq86kfVzDqVC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 08:29:24 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031L3nTR033749; Wed, 1 Apr 2020 17:29:06 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 303uj4t9qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 17:29:06 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 031LRWqx020548;
 Wed, 1 Apr 2020 17:29:06 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 303uj4t9qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 17:29:05 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 031LPnUK001216;
 Wed, 1 Apr 2020 21:29:05 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 301x77cysn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 21:29:05 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031LT4Dn44630426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 21:29:04 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BAE5AC05E;
 Wed,  1 Apr 2020 21:29:04 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27FACAC059;
 Wed,  1 Apr 2020 21:29:03 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 21:29:03 +0000 (GMT)
Subject: [PATCH 06/13] powerpc/vas: Take reference to PID and mm for user
 space windows
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1585775978.10664.438.camel@hbabu-laptop>
References: <1585775978.10664.438.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Apr 2020 14:28:17 -0700
Message-ID: <1585776497.10664.448.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 impostorscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010170
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
Cc: mikey@neuling.org, srikar@linux.vnet.ibm.com, frederic.barrat@fr.ibm.com,
 ajd@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, clg@kaod.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, herbert@gondor.apana.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


When process opens a window, its pid and tgid will be saved in the
vas_window struct. This window will be closed when the process exits.
The kernel handles NX faults by updating CSB or send SEGV signal to pid
of the process if the userspace csb addr is invalid.

In multi-thread applications, a window can be opened by a child thread,
but it will not be closed when this thread exits. It is expected that
the parent will clean up all resources including NX windows opened by
child threads. A child thread can send NX requests using this window
and could be killed before completion is reported. If the pid assigned
to this thread is reused while requests are pending, a failure SEGV
would be directed to the wrong place.

To prevent reusing the pid, take references to pid and mm when the window
is opened and release them when when the window is closed. Then if child
thread is not running, SEGV signal will be sent to thread group leader
(tgd).

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-debug.c  |  2 +-
 arch/powerpc/platforms/powernv/vas-window.c | 53 ++++++++++++++++++++++++++---
 arch/powerpc/platforms/powernv/vas.h        |  9 ++++-
 3 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/vas-debug.c b/arch/powerpc/platforms/powernv/vas-debug.c
index 09e63df..ef9a717 100644
--- a/arch/powerpc/platforms/powernv/vas-debug.c
+++ b/arch/powerpc/platforms/powernv/vas-debug.c
@@ -38,7 +38,7 @@ static int info_show(struct seq_file *s, void *private)
 
 	seq_printf(s, "Type: %s, %s\n", cop_to_str(window->cop),
 					window->tx_win ? "Send" : "Receive");
-	seq_printf(s, "Pid : %d\n", window->pid);
+	seq_printf(s, "Pid : %d\n", vas_window_pid(window));
 
 unlock:
 	mutex_unlock(&vas_mutex);
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index dc46bf6..7054cd4 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -12,6 +12,8 @@
 #include <linux/log2.h>
 #include <linux/rcupdate.h>
 #include <linux/cred.h>
+#include <linux/sched/mm.h>
+#include <linux/mmu_context.h>
 #include <asm/switch_to.h>
 #include <asm/ppc-opcode.h>
 #include "vas.h"
@@ -876,8 +878,6 @@ struct vas_window *vas_rx_win_open(int vasid, enum vas_cop_type cop,
 	rxwin->user_win = rxattr->user_win;
 	rxwin->cop = cop;
 	rxwin->wcreds_max = rxattr->wcreds_max ?: VAS_WCREDS_DEFAULT;
-	if (rxattr->user_win)
-		rxwin->pid = task_pid_vnr(current);
 
 	init_winctx_for_rxwin(rxwin, rxattr, &winctx);
 	init_winctx_regs(rxwin, &winctx);
@@ -1027,7 +1027,6 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
 	txwin->tx_win = 1;
 	txwin->rxwin = rxwin;
 	txwin->nx_win = txwin->rxwin->nx_win;
-	txwin->pid = attr->pid;
 	txwin->user_win = attr->user_win;
 	txwin->wcreds_max = attr->wcreds_max ?: VAS_WCREDS_DEFAULT;
 
@@ -1059,8 +1058,43 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
 			goto free_window;
 	}
 
-	set_vinst_win(vinst, txwin);
+	if (txwin->user_win) {
+		/*
+		 * Window opened by a child thread may not be closed when
+		 * it exits. So take reference to its pid and release it
+		 * when the window is free by parent thread.
+		 * Acquire a reference to the task's pid to make sure
+		 * pid will not be re-used - needed only for multithread
+		 * applications.
+		 */
+		txwin->pid = get_task_pid(current, PIDTYPE_PID);
+		/*
+		 * Acquire a reference to the task's mm.
+		 */
+		txwin->mm = get_task_mm(current);
 
+		if (!txwin->mm) {
+			put_pid(txwin->pid);
+			pr_err("VAS: pid(%d): mm_struct is not found\n",
+					current->pid);
+			rc = -EPERM;
+			goto free_window;
+		}
+
+		mmgrab(txwin->mm);
+		mmput(txwin->mm);
+		mm_context_add_copro(txwin->mm);
+		/*
+		 * Process closes window during exit. In the case of
+		 * multithread application, the child thread can open
+		 * window and can exit without closing it. Expects parent
+		 * thread to use and close the window. So do not need
+		 * to take pid reference for parent thread.
+		 */
+		txwin->tgid = find_get_pid(task_tgid_vnr(current));
+	}
+
+	set_vinst_win(vinst, txwin);
 	return txwin;
 
 free_window:
@@ -1257,8 +1291,17 @@ int vas_win_close(struct vas_window *window)
 	poll_window_castout(window);
 
 	/* if send window, drop reference to matching receive window */
-	if (window->tx_win)
+	if (window->tx_win) {
+		if (window->user_win) {
+			/* Drop references to pid and mm */
+			put_pid(window->pid);
+			if (window->mm) {
+				mm_context_remove_copro(window->mm);
+				mmdrop(window->mm);
+			}
+		}
 		put_rx_win(window->rxwin);
+	}
 
 	vas_window_free(window);
 
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index 88d084d..2a04072 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -355,7 +355,9 @@ struct vas_window {
 	bool user_win;		/* True if user space window */
 	void *hvwc_map;		/* HV window context */
 	void *uwc_map;		/* OS/User window context */
-	pid_t pid;		/* Linux process id of owner */
+	struct pid *pid;	/* Linux process id of owner */
+	struct pid *tgid;	/* Thread group ID of owner */
+	struct mm_struct *mm;	/* Linux process mm_struct */
 	int wcreds_max;		/* Window credits */
 
 	char *dbgname;
@@ -430,6 +432,11 @@ struct vas_winctx {
 extern void vas_window_free_dbgdir(struct vas_window *win);
 extern int vas_setup_fault_window(struct vas_instance *vinst);
 
+static inline int vas_window_pid(struct vas_window *window)
+{
+	return pid_vnr(window->pid);
+}
+
 static inline void vas_log_write(struct vas_window *win, char *name,
 			void *regptr, u64 val)
 {
-- 
1.8.3.1



