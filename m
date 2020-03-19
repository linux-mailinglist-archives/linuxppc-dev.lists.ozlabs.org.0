Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CF618ACC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 07:28:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jcRZ4WX0zDqyl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 17:28:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jcC21SyTzDr6x
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 17:17:33 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02J63c5D022325; Thu, 19 Mar 2020 02:17:19 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu7dadq8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 02:17:19 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02J64VUf025286;
 Thu, 19 Mar 2020 02:17:19 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu7dadq8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 02:17:19 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02J6GBHp016287;
 Thu, 19 Mar 2020 06:17:18 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 2yrpw780wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 06:17:18 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02J6HHbP40698220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 06:17:17 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF606112063;
 Thu, 19 Mar 2020 06:17:17 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5732112064;
 Thu, 19 Mar 2020 06:17:16 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Mar 2020 06:17:16 +0000 (GMT)
Subject: [PATCH v8 08/14] powerpc/vas: Take reference to PID and mm for
 user space windows
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1584598120.9256.15237.camel@hbabu-laptop>
References: <1584598120.9256.15237.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 18 Mar 2020 23:16:53 -0700
Message-ID: <1584598613.9256.15257.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_10:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxscore=0 suspectscore=3 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003190024
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


When process opens a window, its pid and tgid will be saved in vas_window
struct. This window will be closed when the process exits. Kernel handles
NX faults by updating CSB or send SEGV signal to pid if user space csb_addr
is invalid.

In multi-thread applications, a window can be opened by child thread, but
it will not be closed when this thread exits. Expects parent to clean up
all resources including NX windows. Child thread can send requests using
this window and can be killed before they are completed. But the pid
assigned to this thread can be reused for other task while requests are
pending. If the csb_addr passed in these requests is invalid, kernel will
end up sending signal to the wrong task.

To prevent reusing the pid, take references to pid and mm when the window
is opened and release them during window close.

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
index acb6a22..e7641a5 100644
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
 
@@ -1068,8 +1067,43 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
 			goto free_window;
 	}
 
-	set_vinst_win(vinst, txwin);
+	if (txwin->user_win) {
+		/*
+		 * Window opened by child thread may not be closed when
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
+		 * multithread application, child can open window and
+		 * can exit without closing it. Expects parent thread
+		 * to use and close the window. So do not need to take
+		 * pid reference for parent thread.
+		 */
+		txwin->tgid = find_get_pid(task_tgid_vnr(current));
+	}
+
+	set_vinst_win(vinst, txwin);
 	return txwin;
 
 free_window:
@@ -1266,8 +1300,17 @@ int vas_win_close(struct vas_window *window)
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
index 310b8a0..16aa8ec 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -353,7 +353,9 @@ struct vas_window {
 	bool user_win;		/* True if user space window */
 	void *hvwc_map;		/* HV window context */
 	void *uwc_map;		/* OS/User window context */
-	pid_t pid;		/* Linux process id of owner */
+	struct pid *pid;	/* Linux process id of owner */
+	struct pid *tgid;	/* Thread group ID of owner */
+	struct mm_struct *mm;	/* Linux process mm_struct */
 	int wcreds_max;		/* Window credits */
 
 	char *dbgname;
@@ -431,6 +433,11 @@ struct vas_winctx {
 extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 						uint32_t pswid);
 
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



