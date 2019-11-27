Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9025910A7E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 02:23:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47N31L6P8KzDqhD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 12:23:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47N2m60HdGzDqGv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 12:11:33 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAR17SVo065353; Tue, 26 Nov 2019 20:11:27 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxq3vay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 20:11:27 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAR17rSF070605;
 Tue, 26 Nov 2019 20:11:26 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxq3van-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 20:11:26 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAR1A3Pb029477;
 Wed, 27 Nov 2019 01:11:25 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 2wevd6rbyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 01:11:25 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAR1BPEO11338298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 01:11:25 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BEE2AE060;
 Wed, 27 Nov 2019 01:11:25 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D17AAE05F;
 Wed, 27 Nov 2019 01:11:24 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 27 Nov 2019 01:11:24 +0000 (GMT)
Subject: [PATCH 08/14] powerpc/vas: Take reference to PID and mm for user
 space windows
From: Haren Myneni <haren@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
 herbert@gondor.apana.org.au
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Nov 2019 17:10:05 -0800
Message-ID: <1574817005.13250.14.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_08:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=916 suspectscore=2 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270007
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

Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-debug.c  |  2 +-
 arch/powerpc/platforms/powernv/vas-window.c | 44 ++++++++++++++++++++++++++---
 arch/powerpc/platforms/powernv/vas.h        | 14 ++++++++-
 3 files changed, 54 insertions(+), 6 deletions(-)

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
index 7fc1542..ad3104c 100644
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
@@ -887,8 +889,6 @@ struct vas_window *vas_rx_win_open(int vasid, enum vas_cop_type cop,
 	rxwin->user_win = rxattr->user_win;
 	rxwin->cop = cop;
 	rxwin->wcreds_max = rxattr->wcreds_max ?: VAS_WCREDS_DEFAULT;
-	if (rxattr->user_win)
-		rxwin->pid = task_pid_vnr(current);
 
 	init_winctx_for_rxwin(rxwin, rxattr, &winctx);
 	init_winctx_regs(rxwin, &winctx);
@@ -1037,7 +1037,6 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
 	txwin->tx_win = 1;
 	txwin->rxwin = rxwin;
 	txwin->nx_win = txwin->rxwin->nx_win;
-	txwin->pid = attr->pid;
 	txwin->user_win = attr->user_win;
 	txwin->wcreds_max = attr->wcreds_max ?: VAS_WCREDS_DEFAULT;
 
@@ -1079,6 +1078,34 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
 			goto free_window;
 	}
 
+	if (txwin->user_win) {
+		/*
+		 * Window opened by child thread may not be closed when
+		 * it exits. So take reference to its pid and release it
+		 * when the window is free by parent thread.
+		 * Acquire a reference to the task's pid to make sure
+		 * pid will not be re-used.
+		 */
+		txwin->pid = get_task_pid(current, PIDTYPE_PID);
+		/*
+		 * Acquire a reference to the task's mm.
+		 */
+		txwin->mm = get_task_mm(current);
+
+		if (txwin->mm) {
+			mmput(txwin->mm);
+			mmgrab(txwin->mm);
+			mm_context_add_copro(txwin->mm);
+		} else {
+			put_pid(txwin->pid);
+			pr_err("VAS: pid(%d): mm_struct is not found\n",
+					current->pid);
+			rc = -EPERM;
+			goto free_window;
+		}
+		txwin->tgid = task_tgid_vnr(current);
+	}
+
 	set_vinst_win(vinst, txwin);
 
 	return txwin;
@@ -1277,8 +1304,17 @@ int vas_win_close(struct vas_window *window)
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
index eb929c7..03a1c9f 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -343,7 +343,9 @@ struct vas_window {
 	bool user_win;		/* True if user space window */
 	void *hvwc_map;		/* HV window context */
 	void *uwc_map;		/* OS/User window context */
-	pid_t pid;		/* Linux process id of owner */
+	struct pid *pid;	/* Linux process id of owner */
+	pid_t tgid;		/* Thread group ID of owner */
+	struct mm_struct *mm;	/* Linux process mm_struct */
 	int wcreds_max;		/* Window credits */
 
 	char *dbgname;
@@ -424,6 +426,16 @@ struct vas_winctx {
 extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 						uint32_t pswid);
 
+static inline int vas_window_pid(struct vas_window *window)
+{
+	return pid_vnr(window->pid);
+}
+
+static inline int vas_window_tgid(struct vas_window *window)
+{
+	return window->tgid;
+}
+
 static inline void vas_log_write(struct vas_window *win, char *name,
 			void *regptr, u64 val)
 {
-- 
1.8.3.1



