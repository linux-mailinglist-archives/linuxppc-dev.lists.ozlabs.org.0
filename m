Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBB0DD6DD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 08:09:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46wCD96XzgzDqRD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 17:09:45 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46wC0J4FjszDqSJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 16:59:28 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9J5w7oL058744; Sat, 19 Oct 2019 01:59:24 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vqvtbg0ph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2019 01:59:23 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9J5JSMl011137;
 Sat, 19 Oct 2019 05:59:23 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 2vqt46170c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2019 05:59:23 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9J5xLff60621230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Oct 2019 05:59:21 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 936D7C6055;
 Sat, 19 Oct 2019 05:59:21 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53DA5C6057;
 Sat, 19 Oct 2019 05:59:21 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 19 Oct 2019 05:59:21 +0000 (GMT)
Subject: [RFC PATCH 09/13] powerpc/vas: Add and use tgid in vas_window to
 close window
From: Haren Myneni <haren@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Oct 2019 22:59:06 -0700
Message-ID: <1571464746.24387.35.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-19_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910190051
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


In multi-thread applications, child can open a window but release FD
will not be called upon its exit. NX Send window will be closed with
release function. Parent thread will be closing it later upon its exit.

The parent can also send NX requests with this window and NX can
generate page faults. After kernel handles the page fault, send
signal to process by using PID if CRB is invalid. So parent thread
will not receive signal since its PID is different from the one saved
in vas_window.

So use tgid in case if the task which has the same pid as in window
is not running and sends signal to the parent.

Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c  | 14 ++++++++++++--
 arch/powerpc/platforms/powernv/vas-window.c |  6 +++++-
 arch/powerpc/platforms/powernv/vas.h        |  6 ++++++
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 1ce85b5..98100c7 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -109,12 +109,14 @@ static void notify_process(pid_t pid, u64 fault_addr)
  * Remaining settings in the CSB are based on wait_for_csb() of
  * NX-GZIP.
 */
-static void update_csb(int pid, struct coprocessor_request_block *crb)
+static void update_csb(struct vas_window *window,
+			struct coprocessor_request_block *crb)
 {
 	int rc;
 	void __user *csb_addr;
 	struct task_struct *tsk;
 	struct coprocessor_status_block csb;
+	pid_t pid = vas_window_pid(window);
 
 	if (fault_in_csb(crb))
 		goto notify;
@@ -137,6 +139,14 @@ static void update_csb(int pid, struct coprocessor_request_block *crb)
 
 	rcu_read_lock();
 	tsk = find_task_by_vpid(pid);
+
+	/*
+	 * Thread may not exists, but does not close FD (means send window)
+	 * upon exit. Expects parent (tgid) to use and close the window.
+	 */
+	if (!tsk && window->user_win)
+		tsk = find_task_by_vpid(vas_window_tgid(window));
+
 	if (!tsk) {
 		/*
 		 * vas_win_close() waits for any pending CRBs and pending
@@ -270,7 +280,7 @@ static void process_fault_crbs(struct vas_instance *vinst)
 			return;
 		}
 
-		update_csb(vas_window_pid(window), crb);
+		update_csb(window, crb);
 	} while (true);
 }
 
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 77871c1..2946dd6 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -886,8 +886,10 @@ struct vas_window *vas_rx_win_open(int vasid, enum vas_cop_type cop,
 	rxwin->user_win = rxattr->user_win;
 	rxwin->cop = cop;
 	rxwin->wcreds_max = rxattr->wcreds_max ?: VAS_WCREDS_DEFAULT;
-	if (rxattr->user_win)
+	if (rxattr->user_win) {
 		rxwin->pid = task_pid_vnr(current);
+		rxwin->tgid = task_tgid_vnr(current);
+	}
 
 	init_winctx_for_rxwin(rxwin, rxattr, &winctx);
 	init_winctx_regs(rxwin, &winctx);
@@ -1033,6 +1035,8 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
 	txwin->pid = attr->pid;
 	txwin->user_win = attr->user_win;
 	txwin->wcreds_max = attr->wcreds_max ?: VAS_WCREDS_DEFAULT;
+	if (attr->user_win)
+		txwin->tgid = task_tgid_vnr(current);
 
 	init_winctx_for_txwin(txwin, attr, &winctx);
 
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index be1aefa..1812c59 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -344,6 +344,7 @@ struct vas_window {
 	void *hvwc_map;		/* HV window context */
 	void *uwc_map;		/* OS/User window context */
 	pid_t pid;		/* Linux process id of owner */
+	pid_t tgid;		/* Thread group ID of owner */
 	int wcreds_max;		/* Window credits */
 
 	char *dbgname;
@@ -429,6 +430,11 @@ static inline int vas_window_pid(struct vas_window *window)
 	return window->pid;
 }
 
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



