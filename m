Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C41D144D89
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 09:23:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482dhS0trlzDqKb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 19:23:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 482dV30pPqzDqKT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 19:14:18 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00M8DuEj063265; Wed, 22 Jan 2020 03:14:07 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xp95f6a29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 03:14:04 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00M8E3WD064024;
 Wed, 22 Jan 2020 03:14:03 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xp95f6985-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 03:14:02 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00M8AiAc001418;
 Wed, 22 Jan 2020 08:12:20 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 2xksn6k64j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 08:12:20 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00M8CJew48169468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jan 2020 08:12:19 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5C21112062;
 Wed, 22 Jan 2020 08:12:19 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2768C112061;
 Wed, 22 Jan 2020 08:12:19 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jan 2020 08:12:19 +0000 (GMT)
Subject: [PATCH V5 08/14] powerpc/vas: Take reference to PID and mm for
 user space windows
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1579679802.26081.6.camel@hbabu-laptop>
References: <1579679802.26081.6.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 22 Jan 2020 00:12:14 -0800
Message-ID: <1579680734.26081.35.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 mlxscore=0 spamscore=0 malwarescore=0 suspectscore=3 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 mlxlogscore=936 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001220074
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
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Process close windows after its requests are completed. In multi-thread
applications, child can open a window but release FD will not be called
upon its exit. Parent thread will be closing it later upon its exit.

The parent can also send NX requests with this window and NX can
generate page faults. After kernel handles the page fault, send
signal to process by using PID if CSB address is invalid. Parent
thread will not receive signal since its PID is different from the one
saved in vas_window. So use tgid in case if the task for the pid saved
in window is not running and send signal to its parent.

To prevent reusing the pid until the window closed, take reference to
pid and task mm.

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
index a45d81d..7587258 100644
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
+				mmdrop(window->mm);
+				mm_context_remove_copro(window->mm);
+			}
+		}
 		put_rx_win(window->rxwin);
+	}
 
 	vas_window_free(window);
 
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index 2621df1..af03aa0 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -340,7 +340,9 @@ struct vas_window {
 	bool user_win;		/* True if user space window */
 	void *hvwc_map;		/* HV window context */
 	void *uwc_map;		/* OS/User window context */
-	pid_t pid;		/* Linux process id of owner */
+	struct pid *pid;	/* Linux process id of owner */
+	struct pid *tgid;	/* Thread group ID of owner */
+	struct mm_struct *mm;	/* Linux process mm_struct */
 	int wcreds_max;		/* Window credits */
 
 	char *dbgname;
@@ -418,6 +420,11 @@ struct vas_winctx {
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



