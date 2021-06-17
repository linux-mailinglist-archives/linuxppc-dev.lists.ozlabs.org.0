Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB3E3ABD80
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 22:34:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5YgL5B4dz3cp0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:34:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aNweyGQq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aNweyGQq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5Yfr4GNgz3btn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 06:33:40 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HK43pQ138160; Thu, 17 Jun 2021 16:33:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=/rLC3z/Ht0GQNderYbJjgIwjXsGAQAl9x5EIdWb/im8=;
 b=aNweyGQq5LpCMWTfcRaQi1p0U3KR/j5CCmiMyA4yGO3ZXA+QMU6fa+2AjderKZtmE3mC
 OGN+Re5FvHR16z6nsHEEU0zeODIFLitsf50ABz5PWuTOG3kYK/XbHGwK8pHBDfHGi2Q5
 GbGWp+t88AdRuMNnF84SsVwVebQT0nbBB77x4MZ/YDslrXOBcyEfb5kuIzc9qMeCS9dA
 hwqTmBzeZuTVcxOd4co6t9g0p6ow9X0KuOgRd5D38CrNEiuT0NSk2kgm/Rsa9WzRjJTe
 vseujoEeyiBb0e9zmXRravCXwCScuastvZqm8fhYM/BIWgkpoqcxVoIiTC6r53+WlbTW Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398cxc8w6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:33:33 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HKCLqn190665;
 Thu, 17 Jun 2021 16:33:33 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398cxc8w64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:33:33 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HKICQT023913;
 Thu, 17 Jun 2021 20:33:32 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 394mjabvff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 20:33:32 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HKXVJk32833922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 20:33:31 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCEB3112062;
 Thu, 17 Jun 2021 20:33:31 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABF2A112063;
 Thu, 17 Jun 2021 20:33:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 20:33:30 +0000 (GMT)
Message-ID: <1698c35c158dfe52c6d2166667823d3d4a463353.camel@linux.ibm.com>
Subject: [PATCH v6 07/17] powerpc/vas:  Define and use common vas_window struct
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Thu, 17 Jun 2021 13:33:28 -0700
In-Reply-To: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cGi_9YUvT7WeLH9XlRz1R-BtQ8Ht-zWR
X-Proofpoint-GUID: qH5QYq4iJiNWvGuxR3yf0Qkz9NytIhqZ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_16:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 clxscore=1015 phishscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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


Many elements in vas_struct are used on PowerNV and PowerVM
platforms. vas_window is used for both TX and RX windows on
PowerNV and for TX windows on PowerVM. So some elements are
specific to these platforms.

So this patch defines common vas_window and platform
specific window structs (pnv_vas_window on PowerNV). Also adds
the corresponding changes in PowerNV vas code.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/vas.h              |  14 +-
 arch/powerpc/platforms/powernv/vas-debug.c  |  27 ++--
 arch/powerpc/platforms/powernv/vas-fault.c  |  20 +--
 arch/powerpc/platforms/powernv/vas-trace.h  |   4 +-
 arch/powerpc/platforms/powernv/vas-window.c | 161 +++++++++++---------
 arch/powerpc/platforms/powernv/vas.h        |  44 +++---
 6 files changed, 144 insertions(+), 126 deletions(-)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 6b41c0818958..14ad7982874c 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -10,8 +10,6 @@
 #include <asm/icswx.h>
 #include <uapi/asm/vas-api.h>
 
-struct vas_window;
-
 /*
  * Min and max FIFO sizes are based on Version 1.05 Section 3.1.4.25
  * (Local FIFO Size Register) of the VAS workbook.
@@ -63,6 +61,18 @@ struct vas_user_win_ref {
 	struct mm_struct *mm;	/* Linux process mm_struct */
 };
 
+/*
+ * Common VAS window struct on PowerNV and PowerVM
+ */
+struct vas_window {
+	u32 winid;
+	u32 wcreds_max;	/* Window credits */
+	enum vas_cop_type cop;
+	struct vas_user_win_ref task_ref;
+	char *dbgname;
+	struct dentry *dbgdir;
+};
+
 /*
  * User space window operations used for powernv and powerVM
  */
diff --git a/arch/powerpc/platforms/powernv/vas-debug.c b/arch/powerpc/platforms/powernv/vas-debug.c
index 41fa90d2f4ab..3ce89a4b54be 100644
--- a/arch/powerpc/platforms/powernv/vas-debug.c
+++ b/arch/powerpc/platforms/powernv/vas-debug.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
+#include <asm/vas.h>
 #include "vas.h"
 
 static struct dentry *vas_debugfs;
@@ -28,7 +29,7 @@ static char *cop_to_str(int cop)
 
 static int info_show(struct seq_file *s, void *private)
 {
-	struct vas_window *window = s->private;
+	struct pnv_vas_window *window = s->private;
 
 	mutex_lock(&vas_mutex);
 
@@ -36,9 +37,9 @@ static int info_show(struct seq_file *s, void *private)
 	if (!window->hvwc_map)
 		goto unlock;
 
-	seq_printf(s, "Type: %s, %s\n", cop_to_str(window->cop),
+	seq_printf(s, "Type: %s, %s\n", cop_to_str(window->vas_win.cop),
 					window->tx_win ? "Send" : "Receive");
-	seq_printf(s, "Pid : %d\n", vas_window_pid(window));
+	seq_printf(s, "Pid : %d\n", vas_window_pid(&window->vas_win));
 
 unlock:
 	mutex_unlock(&vas_mutex);
@@ -47,7 +48,7 @@ static int info_show(struct seq_file *s, void *private)
 
 DEFINE_SHOW_ATTRIBUTE(info);
 
-static inline void print_reg(struct seq_file *s, struct vas_window *win,
+static inline void print_reg(struct seq_file *s, struct pnv_vas_window *win,
 			char *name, u32 reg)
 {
 	seq_printf(s, "0x%016llx %s\n", read_hvwc_reg(win, name, reg), name);
@@ -55,7 +56,7 @@ static inline void print_reg(struct seq_file *s, struct vas_window *win,
 
 static int hvwc_show(struct seq_file *s, void *private)
 {
-	struct vas_window *window = s->private;
+	struct pnv_vas_window *window = s->private;
 
 	mutex_lock(&vas_mutex);
 
@@ -103,8 +104,10 @@ static int hvwc_show(struct seq_file *s, void *private)
 
 DEFINE_SHOW_ATTRIBUTE(hvwc);
 
-void vas_window_free_dbgdir(struct vas_window *window)
+void vas_window_free_dbgdir(struct pnv_vas_window *pnv_win)
 {
+	struct vas_window *window =  &pnv_win->vas_win;
+
 	if (window->dbgdir) {
 		debugfs_remove_recursive(window->dbgdir);
 		kfree(window->dbgname);
@@ -113,21 +116,21 @@ void vas_window_free_dbgdir(struct vas_window *window)
 	}
 }
 
-void vas_window_init_dbgdir(struct vas_window *window)
+void vas_window_init_dbgdir(struct pnv_vas_window *window)
 {
 	struct dentry *d;
 
 	if (!window->vinst->dbgdir)
 		return;
 
-	window->dbgname = kzalloc(16, GFP_KERNEL);
-	if (!window->dbgname)
+	window->vas_win.dbgname = kzalloc(16, GFP_KERNEL);
+	if (!window->vas_win.dbgname)
 		return;
 
-	snprintf(window->dbgname, 16, "w%d", window->winid);
+	snprintf(window->vas_win.dbgname, 16, "w%d", window->vas_win.winid);
 
-	d = debugfs_create_dir(window->dbgname, window->vinst->dbgdir);
-	window->dbgdir = d;
+	d = debugfs_create_dir(window->vas_win.dbgname, window->vinst->dbgdir);
+	window->vas_win.dbgdir = d;
 
 	debugfs_create_file("info", 0444, d, window, &info_fops);
 	debugfs_create_file("hvwc", 0444, d, window, &hvwc_fops);
diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 2729ac541fb3..a7aabc18039e 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -68,7 +68,7 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
 	struct vas_instance *vinst = data;
 	struct coprocessor_request_block *crb, *entry;
 	struct coprocessor_request_block buf;
-	struct vas_window *window;
+	struct pnv_vas_window *window;
 	unsigned long flags;
 	void *fifo;
 
@@ -153,7 +153,7 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
 			 * NX sees faults only with user space windows.
 			 */
 			if (window->user_win)
-				vas_update_csb(crb, &window->task_ref);
+				vas_update_csb(crb, &window->vas_win.task_ref);
 			else
 				WARN_ON_ONCE(!window->user_win);
 
@@ -199,6 +199,7 @@ irqreturn_t vas_fault_handler(int irq, void *dev_id)
 int vas_setup_fault_window(struct vas_instance *vinst)
 {
 	struct vas_rx_win_attr attr;
+	struct vas_window *win;
 
 	vinst->fault_fifo_size = VAS_FAULT_WIN_FIFO_SIZE;
 	vinst->fault_fifo = kzalloc(vinst->fault_fifo_size, GFP_KERNEL);
@@ -227,18 +228,17 @@ int vas_setup_fault_window(struct vas_instance *vinst)
 	attr.lnotify_pid = mfspr(SPRN_PID);
 	attr.lnotify_tid = mfspr(SPRN_PID);
 
-	vinst->fault_win = vas_rx_win_open(vinst->vas_id, VAS_COP_TYPE_FAULT,
-					&attr);
-
-	if (IS_ERR(vinst->fault_win)) {
-		pr_err("VAS: Error %ld opening FaultWin\n",
-			PTR_ERR(vinst->fault_win));
+	win = vas_rx_win_open(vinst->vas_id, VAS_COP_TYPE_FAULT, &attr);
+	if (IS_ERR(win)) {
+		pr_err("VAS: Error %ld opening FaultWin\n", PTR_ERR(win));
 		kfree(vinst->fault_fifo);
-		return PTR_ERR(vinst->fault_win);
+		return PTR_ERR(win);
 	}
 
+	vinst->fault_win = container_of(win, struct pnv_vas_window, vas_win);
+
 	pr_devel("VAS: Created FaultWin %d, LPID/PID/TID [%d/%d/%d]\n",
-			vinst->fault_win->winid, attr.lnotify_lpid,
+			vinst->fault_win->vas_win.winid, attr.lnotify_lpid,
 			attr.lnotify_pid, attr.lnotify_tid);
 
 	return 0;
diff --git a/arch/powerpc/platforms/powernv/vas-trace.h b/arch/powerpc/platforms/powernv/vas-trace.h
index a449b9f0c12e..ca2e08f2ddc0 100644
--- a/arch/powerpc/platforms/powernv/vas-trace.h
+++ b/arch/powerpc/platforms/powernv/vas-trace.h
@@ -80,7 +80,7 @@ TRACE_EVENT(	vas_tx_win_open,
 TRACE_EVENT(	vas_paste_crb,
 
 		TP_PROTO(struct task_struct *tsk,
-			struct vas_window *win),
+			struct pnv_vas_window *win),
 
 		TP_ARGS(tsk, win),
 
@@ -96,7 +96,7 @@ TRACE_EVENT(	vas_paste_crb,
 		TP_fast_assign(
 			__entry->pid = tsk->pid;
 			__entry->vasid = win->vinst->vas_id;
-			__entry->winid = win->winid;
+			__entry->winid = win->vas_win.winid;
 			__entry->paste_kaddr = (unsigned long)win->paste_kaddr
 		),
 
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 6489e29085be..0f8d39fbf2b2 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -27,14 +27,14 @@
  * Compute the paste address region for the window @window using the
  * ->paste_base_addr and ->paste_win_id_shift we got from device tree.
  */
-void vas_win_paste_addr(struct vas_window *window, u64 *addr, int *len)
+void vas_win_paste_addr(struct pnv_vas_window *window, u64 *addr, int *len)
 {
 	int winid;
 	u64 base, shift;
 
 	base = window->vinst->paste_base_addr;
 	shift = window->vinst->paste_win_id_shift;
-	winid = window->winid;
+	winid = window->vas_win.winid;
 
 	*addr  = base + (winid << shift);
 	if (len)
@@ -43,23 +43,23 @@ void vas_win_paste_addr(struct vas_window *window, u64 *addr, int *len)
 	pr_debug("Txwin #%d: Paste addr 0x%llx\n", winid, *addr);
 }
 
-static inline void get_hvwc_mmio_bar(struct vas_window *window,
+static inline void get_hvwc_mmio_bar(struct pnv_vas_window *window,
 			u64 *start, int *len)
 {
 	u64 pbaddr;
 
 	pbaddr = window->vinst->hvwc_bar_start;
-	*start = pbaddr + window->winid * VAS_HVWC_SIZE;
+	*start = pbaddr + window->vas_win.winid * VAS_HVWC_SIZE;
 	*len = VAS_HVWC_SIZE;
 }
 
-static inline void get_uwc_mmio_bar(struct vas_window *window,
+static inline void get_uwc_mmio_bar(struct pnv_vas_window *window,
 			u64 *start, int *len)
 {
 	u64 pbaddr;
 
 	pbaddr = window->vinst->uwc_bar_start;
-	*start = pbaddr + window->winid * VAS_UWC_SIZE;
+	*start = pbaddr + window->vas_win.winid * VAS_UWC_SIZE;
 	*len = VAS_UWC_SIZE;
 }
 
@@ -68,7 +68,7 @@ static inline void get_uwc_mmio_bar(struct vas_window *window,
  * space. Unlike MMIO regions (map_mmio_region() below), paste region must
  * be mapped cache-able and is only applicable to send windows.
  */
-static void *map_paste_region(struct vas_window *txwin)
+static void *map_paste_region(struct pnv_vas_window *txwin)
 {
 	int len;
 	void *map;
@@ -76,7 +76,7 @@ static void *map_paste_region(struct vas_window *txwin)
 	u64 start;
 
 	name = kasprintf(GFP_KERNEL, "window-v%d-w%d", txwin->vinst->vas_id,
-				txwin->winid);
+				txwin->vas_win.winid);
 	if (!name)
 		goto free_name;
 
@@ -133,7 +133,7 @@ static void unmap_region(void *addr, u64 start, int len)
 /*
  * Unmap the paste address region for a window.
  */
-static void unmap_paste_region(struct vas_window *window)
+static void unmap_paste_region(struct pnv_vas_window *window)
 {
 	int len;
 	u64 busaddr_start;
@@ -154,7 +154,7 @@ static void unmap_paste_region(struct vas_window *window)
  * path, just minimize the time we hold the mutex for now. We can add
  * a per-instance mutex later if necessary.
  */
-static void unmap_winctx_mmio_bars(struct vas_window *window)
+static void unmap_winctx_mmio_bars(struct pnv_vas_window *window)
 {
 	int len;
 	void *uwc_map;
@@ -187,7 +187,7 @@ static void unmap_winctx_mmio_bars(struct vas_window *window)
  * OS/User Window Context (UWC) MMIO Base Address Region for the given window.
  * Map these bus addresses and save the mapped kernel addresses in @window.
  */
-static int map_winctx_mmio_bars(struct vas_window *window)
+static int map_winctx_mmio_bars(struct pnv_vas_window *window)
 {
 	int len;
 	u64 start;
@@ -215,7 +215,7 @@ static int map_winctx_mmio_bars(struct vas_window *window)
  *	 registers are not sequential. And, we can only write to offsets
  *	 with valid registers.
  */
-static void reset_window_regs(struct vas_window *window)
+static void reset_window_regs(struct pnv_vas_window *window)
 {
 	write_hvwc_reg(window, VREG(LPID), 0ULL);
 	write_hvwc_reg(window, VREG(PID), 0ULL);
@@ -271,7 +271,7 @@ static void reset_window_regs(struct vas_window *window)
  * want to add fields to vas_winctx and move the initialization to
  * init_vas_winctx_regs().
  */
-static void init_xlate_regs(struct vas_window *window, bool user_win)
+static void init_xlate_regs(struct pnv_vas_window *window, bool user_win)
 {
 	u64 lpcr, val;
 
@@ -336,7 +336,7 @@ static void init_xlate_regs(struct vas_window *window, bool user_win)
  *
  * TODO: Reserved (aka dedicated) send buffers are not supported yet.
  */
-static void init_rsvd_tx_buf_count(struct vas_window *txwin,
+static void init_rsvd_tx_buf_count(struct pnv_vas_window *txwin,
 				struct vas_winctx *winctx)
 {
 	write_hvwc_reg(txwin, VREG(TX_RSVD_BUF_COUNT), 0ULL);
@@ -358,7 +358,7 @@ static void init_rsvd_tx_buf_count(struct vas_window *txwin,
  *	as a one-time task? That could work for NX but what about other
  *	receivers?  Let the receivers tell us the rx-fifo buffers for now.
  */
-static void init_winctx_regs(struct vas_window *window,
+static void init_winctx_regs(struct pnv_vas_window *window,
 			     struct vas_winctx *winctx)
 {
 	u64 val;
@@ -520,10 +520,10 @@ static int vas_assign_window_id(struct ida *ida)
 	return winid;
 }
 
-static void vas_window_free(struct vas_window *window)
+static void vas_window_free(struct pnv_vas_window *window)
 {
-	int winid = window->winid;
 	struct vas_instance *vinst = window->vinst;
+	int winid = window->vas_win.winid;
 
 	unmap_winctx_mmio_bars(window);
 
@@ -534,10 +534,10 @@ static void vas_window_free(struct vas_window *window)
 	vas_release_window_id(&vinst->ida, winid);
 }
 
-static struct vas_window *vas_window_alloc(struct vas_instance *vinst)
+static struct pnv_vas_window *vas_window_alloc(struct vas_instance *vinst)
 {
 	int winid;
-	struct vas_window *window;
+	struct pnv_vas_window *window;
 
 	winid = vas_assign_window_id(&vinst->ida);
 	if (winid < 0)
@@ -548,7 +548,7 @@ static struct vas_window *vas_window_alloc(struct vas_instance *vinst)
 		goto out_free;
 
 	window->vinst = vinst;
-	window->winid = winid;
+	window->vas_win.winid = winid;
 
 	if (map_winctx_mmio_bars(window))
 		goto out_free;
@@ -563,7 +563,7 @@ static struct vas_window *vas_window_alloc(struct vas_instance *vinst)
 	return ERR_PTR(-ENOMEM);
 }
 
-static void put_rx_win(struct vas_window *rxwin)
+static void put_rx_win(struct pnv_vas_window *rxwin)
 {
 	/* Better not be a send window! */
 	WARN_ON_ONCE(rxwin->tx_win);
@@ -579,10 +579,11 @@ static void put_rx_win(struct vas_window *rxwin)
  *
  * NOTE: We access ->windows[] table and assume that vinst->mutex is held.
  */
-static struct vas_window *get_user_rxwin(struct vas_instance *vinst, u32 pswid)
+static struct pnv_vas_window *get_user_rxwin(struct vas_instance *vinst,
+					     u32 pswid)
 {
 	int vasid, winid;
-	struct vas_window *rxwin;
+	struct pnv_vas_window *rxwin;
 
 	decode_pswid(pswid, &vasid, &winid);
 
@@ -591,7 +592,7 @@ static struct vas_window *get_user_rxwin(struct vas_instance *vinst, u32 pswid)
 
 	rxwin = vinst->windows[winid];
 
-	if (!rxwin || rxwin->tx_win || rxwin->cop != VAS_COP_TYPE_FTW)
+	if (!rxwin || rxwin->tx_win || rxwin->vas_win.cop != VAS_COP_TYPE_FTW)
 		return ERR_PTR(-EINVAL);
 
 	return rxwin;
@@ -603,10 +604,10 @@ static struct vas_window *get_user_rxwin(struct vas_instance *vinst, u32 pswid)
  *
  * See also function header of set_vinst_win().
  */
-static struct vas_window *get_vinst_rxwin(struct vas_instance *vinst,
+static struct pnv_vas_window *get_vinst_rxwin(struct vas_instance *vinst,
 			enum vas_cop_type cop, u32 pswid)
 {
-	struct vas_window *rxwin;
+	struct pnv_vas_window *rxwin;
 
 	mutex_lock(&vinst->mutex);
 
@@ -639,9 +640,9 @@ static struct vas_window *get_vinst_rxwin(struct vas_instance *vinst,
  * window, we also save the window in the ->rxwin[] table.
  */
 static void set_vinst_win(struct vas_instance *vinst,
-			struct vas_window *window)
+			struct pnv_vas_window *window)
 {
-	int id = window->winid;
+	int id = window->vas_win.winid;
 
 	mutex_lock(&vinst->mutex);
 
@@ -650,8 +651,8 @@ static void set_vinst_win(struct vas_instance *vinst,
 	 * unless its a user (FTW) window.
 	 */
 	if (!window->user_win && !window->tx_win) {
-		WARN_ON_ONCE(vinst->rxwin[window->cop]);
-		vinst->rxwin[window->cop] = window;
+		WARN_ON_ONCE(vinst->rxwin[window->vas_win.cop]);
+		vinst->rxwin[window->vas_win.cop] = window;
 	}
 
 	WARN_ON_ONCE(vinst->windows[id] != NULL);
@@ -664,16 +665,16 @@ static void set_vinst_win(struct vas_instance *vinst,
  * Clear this window from the table(s) of windows for this VAS instance.
  * See also function header of set_vinst_win().
  */
-static void clear_vinst_win(struct vas_window *window)
+static void clear_vinst_win(struct pnv_vas_window *window)
 {
-	int id = window->winid;
+	int id = window->vas_win.winid;
 	struct vas_instance *vinst = window->vinst;
 
 	mutex_lock(&vinst->mutex);
 
 	if (!window->user_win && !window->tx_win) {
-		WARN_ON_ONCE(!vinst->rxwin[window->cop]);
-		vinst->rxwin[window->cop] = NULL;
+		WARN_ON_ONCE(!vinst->rxwin[window->vas_win.cop]);
+		vinst->rxwin[window->vas_win.cop] = NULL;
 	}
 
 	WARN_ON_ONCE(vinst->windows[id] != window);
@@ -682,7 +683,7 @@ static void clear_vinst_win(struct vas_window *window)
 	mutex_unlock(&vinst->mutex);
 }
 
-static void init_winctx_for_rxwin(struct vas_window *rxwin,
+static void init_winctx_for_rxwin(struct pnv_vas_window *rxwin,
 			struct vas_rx_win_attr *rxattr,
 			struct vas_winctx *winctx)
 {
@@ -703,7 +704,7 @@ static void init_winctx_for_rxwin(struct vas_window *rxwin,
 
 	winctx->rx_fifo = rxattr->rx_fifo;
 	winctx->rx_fifo_size = rxattr->rx_fifo_size;
-	winctx->wcreds_max = rxwin->wcreds_max;
+	winctx->wcreds_max = rxwin->vas_win.wcreds_max;
 	winctx->pin_win = rxattr->pin_win;
 
 	winctx->nx_win = rxattr->nx_win;
@@ -852,7 +853,7 @@ EXPORT_SYMBOL_GPL(vas_init_rx_win_attr);
 struct vas_window *vas_rx_win_open(int vasid, enum vas_cop_type cop,
 			struct vas_rx_win_attr *rxattr)
 {
-	struct vas_window *rxwin;
+	struct pnv_vas_window *rxwin;
 	struct vas_winctx winctx;
 	struct vas_instance *vinst;
 
@@ -871,21 +872,21 @@ struct vas_window *vas_rx_win_open(int vasid, enum vas_cop_type cop,
 	rxwin = vas_window_alloc(vinst);
 	if (IS_ERR(rxwin)) {
 		pr_devel("Unable to allocate memory for Rx window\n");
-		return rxwin;
+		return (struct vas_window *)rxwin;
 	}
 
 	rxwin->tx_win = false;
 	rxwin->nx_win = rxattr->nx_win;
 	rxwin->user_win = rxattr->user_win;
-	rxwin->cop = cop;
-	rxwin->wcreds_max = rxattr->wcreds_max;
+	rxwin->vas_win.cop = cop;
+	rxwin->vas_win.wcreds_max = rxattr->wcreds_max;
 
 	init_winctx_for_rxwin(rxwin, rxattr, &winctx);
 	init_winctx_regs(rxwin, &winctx);
 
 	set_vinst_win(vinst, rxwin);
 
-	return rxwin;
+	return &rxwin->vas_win;
 }
 EXPORT_SYMBOL_GPL(vas_rx_win_open);
 
@@ -906,7 +907,7 @@ void vas_init_tx_win_attr(struct vas_tx_win_attr *txattr, enum vas_cop_type cop)
 }
 EXPORT_SYMBOL_GPL(vas_init_tx_win_attr);
 
-static void init_winctx_for_txwin(struct vas_window *txwin,
+static void init_winctx_for_txwin(struct pnv_vas_window *txwin,
 			struct vas_tx_win_attr *txattr,
 			struct vas_winctx *winctx)
 {
@@ -927,7 +928,7 @@ static void init_winctx_for_txwin(struct vas_window *txwin,
 	 */
 	memset(winctx, 0, sizeof(struct vas_winctx));
 
-	winctx->wcreds_max = txwin->wcreds_max;
+	winctx->wcreds_max = txwin->vas_win.wcreds_max;
 
 	winctx->user_win = txattr->user_win;
 	winctx->nx_win = txwin->rxwin->nx_win;
@@ -947,13 +948,13 @@ static void init_winctx_for_txwin(struct vas_window *txwin,
 
 	winctx->lpid = txattr->lpid;
 	winctx->pidr = txattr->pidr;
-	winctx->rx_win_id = txwin->rxwin->winid;
+	winctx->rx_win_id = txwin->rxwin->vas_win.winid;
 	/*
 	 * IRQ and fault window setup is successful. Set fault window
 	 * for the send window so that ready to handle faults.
 	 */
 	if (txwin->vinst->virq)
-		winctx->fault_win_id = txwin->vinst->fault_win->winid;
+		winctx->fault_win_id = txwin->vinst->fault_win->vas_win.winid;
 
 	winctx->dma_type = VAS_DMA_TYPE_INJECT;
 	winctx->tc_mode = txattr->tc_mode;
@@ -963,7 +964,8 @@ static void init_winctx_for_txwin(struct vas_window *txwin,
 		winctx->irq_port = txwin->vinst->irq_port;
 
 	winctx->pswid = txattr->pswid ? txattr->pswid :
-			encode_pswid(txwin->vinst->vas_id, txwin->winid);
+			encode_pswid(txwin->vinst->vas_id,
+			txwin->vas_win.winid);
 }
 
 static bool tx_win_args_valid(enum vas_cop_type cop,
@@ -994,8 +996,8 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
 			struct vas_tx_win_attr *attr)
 {
 	int rc;
-	struct vas_window *txwin;
-	struct vas_window *rxwin;
+	struct pnv_vas_window *txwin;
+	struct pnv_vas_window *rxwin;
 	struct vas_winctx winctx;
 	struct vas_instance *vinst;
 
@@ -1021,7 +1023,7 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
 	rxwin = get_vinst_rxwin(vinst, cop, attr->pswid);
 	if (IS_ERR(rxwin)) {
 		pr_devel("No RxWin for vasid %d, cop %d\n", vasid, cop);
-		return rxwin;
+		return (struct vas_window *)rxwin;
 	}
 
 	txwin = vas_window_alloc(vinst);
@@ -1030,12 +1032,12 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
 		goto put_rxwin;
 	}
 
-	txwin->cop = cop;
+	txwin->vas_win.cop = cop;
 	txwin->tx_win = 1;
 	txwin->rxwin = rxwin;
 	txwin->nx_win = txwin->rxwin->nx_win;
 	txwin->user_win = attr->user_win;
-	txwin->wcreds_max = attr->wcreds_max ?: VAS_WCREDS_DEFAULT;
+	txwin->vas_win.wcreds_max = attr->wcreds_max ?: VAS_WCREDS_DEFAULT;
 
 	init_winctx_for_txwin(txwin, attr, &winctx);
 
@@ -1065,16 +1067,16 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
 			rc = -ENODEV;
 			goto free_window;
 		}
-		rc = get_vas_user_win_ref(&txwin->task_ref);
+		rc = get_vas_user_win_ref(&txwin->vas_win.task_ref);
 		if (rc)
 			goto free_window;
 
-		vas_user_win_add_mm_context(&txwin->task_ref);
+		vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
 	}
 
 	set_vinst_win(vinst, txwin);
 
-	return txwin;
+	return &txwin->vas_win;
 
 free_window:
 	vas_window_free(txwin);
@@ -1093,12 +1095,14 @@ int vas_copy_crb(void *crb, int offset)
 EXPORT_SYMBOL_GPL(vas_copy_crb);
 
 #define RMA_LSMP_REPORT_ENABLE PPC_BIT(53)
-int vas_paste_crb(struct vas_window *txwin, int offset, bool re)
+int vas_paste_crb(struct vas_window *vwin, int offset, bool re)
 {
+	struct pnv_vas_window *txwin;
 	int rc;
 	void *addr;
 	uint64_t val;
 
+	txwin = container_of(vwin, struct pnv_vas_window, vas_win);
 	trace_vas_paste_crb(current, txwin);
 
 	/*
@@ -1128,7 +1132,7 @@ int vas_paste_crb(struct vas_window *txwin, int offset, bool re)
 	else
 		rc = -EINVAL;
 
-	pr_debug("Txwin #%d: Msg count %llu\n", txwin->winid,
+	pr_debug("Txwin #%d: Msg count %llu\n", txwin->vas_win.winid,
 			read_hvwc_reg(txwin, VREG(LRFIFO_PUSH)));
 
 	return rc;
@@ -1148,7 +1152,7 @@ EXPORT_SYMBOL_GPL(vas_paste_crb);
  *	user space. (NX-842 driver waits for CSB and Fast thread-wakeup
  *	doesn't use credit checking).
  */
-static void poll_window_credits(struct vas_window *window)
+static void poll_window_credits(struct pnv_vas_window *window)
 {
 	u64 val;
 	int creds, mode;
@@ -1178,7 +1182,7 @@ static void poll_window_credits(struct vas_window *window)
 	 *       and issue CRB Kill to stop all pending requests. Need only
 	 *       if there is a bug in NX or fault handling in kernel.
 	 */
-	if (creds < window->wcreds_max) {
+	if (creds < window->vas_win.wcreds_max) {
 		val = 0;
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		schedule_timeout(msecs_to_jiffies(10));
@@ -1189,7 +1193,8 @@ static void poll_window_credits(struct vas_window *window)
 		 */
 		if (!(count % 1000))
 			pr_warn_ratelimited("VAS: pid %d stuck. Waiting for credits returned for Window(%d). creds %d, Retries %d\n",
-				vas_window_pid(window), window->winid,
+				vas_window_pid(&window->vas_win),
+				window->vas_win.winid,
 				creds, count);
 
 		goto retry;
@@ -1201,7 +1206,7 @@ static void poll_window_credits(struct vas_window *window)
  * short time to queue a CRB, so window should not be busy for too long.
  * Trying 5ms intervals.
  */
-static void poll_window_busy_state(struct vas_window *window)
+static void poll_window_busy_state(struct pnv_vas_window *window)
 {
 	int busy;
 	u64 val;
@@ -1221,7 +1226,8 @@ static void poll_window_busy_state(struct vas_window *window)
 		 */
 		if (!(count % 1000))
 			pr_warn_ratelimited("VAS: pid %d stuck. Window (ID=%d) is in busy state. Retries %d\n",
-				vas_window_pid(window), window->winid, count);
+				vas_window_pid(&window->vas_win),
+				window->vas_win.winid, count);
 
 		goto retry;
 	}
@@ -1243,7 +1249,7 @@ static void poll_window_busy_state(struct vas_window *window)
  *	casting out becomes necessary we should consider offloading the
  *	job to a worker thread, so the window close can proceed quickly.
  */
-static void poll_window_castout(struct vas_window *window)
+static void poll_window_castout(struct pnv_vas_window *window)
 {
 	/* stub for now */
 }
@@ -1252,7 +1258,7 @@ static void poll_window_castout(struct vas_window *window)
  * Unpin and close a window so no new requests are accepted and the
  * hardware can evict this window from cache if necessary.
  */
-static void unpin_close_window(struct vas_window *window)
+static void unpin_close_window(struct pnv_vas_window *window)
 {
 	u64 val;
 
@@ -1274,11 +1280,15 @@ static void unpin_close_window(struct vas_window *window)
  *
  * Besides the hardware, kernel has some bookkeeping of course.
  */
-int vas_win_close(struct vas_window *window)
+int vas_win_close(struct vas_window *vwin)
 {
-	if (!window)
+	struct pnv_vas_window *window;
+
+	if (!vwin)
 		return 0;
 
+	window = container_of(vwin, struct pnv_vas_window, vas_win);
+
 	if (!window->tx_win && atomic_read(&window->num_txwins) != 0) {
 		pr_devel("Attempting to close an active Rx window!\n");
 		WARN_ON_ONCE(1);
@@ -1300,8 +1310,8 @@ int vas_win_close(struct vas_window *window)
 	/* if send window, drop reference to matching receive window */
 	if (window->tx_win) {
 		if (window->user_win) {
-			put_vas_user_win_ref(&window->task_ref);
-			mm_context_remove_vas_window(window->task_ref.mm);
+			put_vas_user_win_ref(&vwin->task_ref);
+			mm_context_remove_vas_window(vwin->task_ref.mm);
 		}
 		put_rx_win(window->rxwin);
 	}
@@ -1334,7 +1344,7 @@ EXPORT_SYMBOL_GPL(vas_win_close);
  * - The kernel with return credit on fault window after reading entry
  *   from fault FIFO.
  */
-void vas_return_credit(struct vas_window *window, bool tx)
+void vas_return_credit(struct pnv_vas_window *window, bool tx)
 {
 	uint64_t val;
 
@@ -1348,10 +1358,10 @@ void vas_return_credit(struct vas_window *window, bool tx)
 	}
 }
 
-struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
+struct pnv_vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 		uint32_t pswid)
 {
-	struct vas_window *window;
+	struct pnv_vas_window *window;
 	int winid;
 
 	if (!pswid) {
@@ -1388,11 +1398,11 @@ struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 	 * by NX).
 	 */
 	if (!window->tx_win || !window->user_win || !window->nx_win ||
-			window->cop == VAS_COP_TYPE_FAULT ||
-			window->cop == VAS_COP_TYPE_FTW) {
+			window->vas_win.cop == VAS_COP_TYPE_FAULT ||
+			window->vas_win.cop == VAS_COP_TYPE_FTW) {
 		pr_err("PSWID decode: id %d, tx %d, user %d, nx %d, cop %d\n",
 			winid, window->tx_win, window->user_win,
-			window->nx_win, window->cop);
+			window->nx_win, window->vas_win.cop);
 		WARN_ON(1);
 	}
 
@@ -1418,10 +1428,12 @@ static struct vas_window *vas_user_win_open(int vas_id, u64 flags,
 	return vas_tx_win_open(vas_id, cop_type, &txattr);
 }
 
-static u64 vas_user_win_paste_addr(struct vas_window *win)
+static u64 vas_user_win_paste_addr(struct vas_window *txwin)
 {
+	struct pnv_vas_window *win;
 	u64 paste_addr;
 
+	win = container_of(txwin, struct pnv_vas_window, vas_win);
 	vas_win_paste_addr(win, &paste_addr, NULL);
 
 	return paste_addr;
@@ -1429,7 +1441,6 @@ static u64 vas_user_win_paste_addr(struct vas_window *win)
 
 static int vas_user_win_close(struct vas_window *txwin)
 {
-
 	vas_win_close(txwin);
 
 	return 0;
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index 614db6a80c67..8bb08e395de0 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -334,11 +334,11 @@ struct vas_instance {
 	int fifo_in_progress;	/* To wake up thread or return IRQ_HANDLED */
 	spinlock_t fault_lock;	/* Protects fifo_in_progress update */
 	void *fault_fifo;
-	struct vas_window *fault_win; /* Fault window */
+	struct pnv_vas_window *fault_win; /* Fault window */
 
 	struct mutex mutex;
-	struct vas_window *rxwin[VAS_COP_TYPE_MAX];
-	struct vas_window *windows[VAS_WINDOWS_PER_CHIP];
+	struct pnv_vas_window *rxwin[VAS_COP_TYPE_MAX];
+	struct pnv_vas_window *windows[VAS_WINDOWS_PER_CHIP];
 
 	char *name;
 	char *dbgname;
@@ -346,30 +346,24 @@ struct vas_instance {
 };
 
 /*
- * In-kernel state a VAS window. One per window.
+ * In-kernel state a VAS window on PowerNV. One per window.
  */
-struct vas_window {
+struct pnv_vas_window {
+	struct vas_window vas_win;
 	/* Fields common to send and receive windows */
 	struct vas_instance *vinst;
-	int winid;
 	bool tx_win;		/* True if send window */
 	bool nx_win;		/* True if NX window */
 	bool user_win;		/* True if user space window */
 	void *hvwc_map;		/* HV window context */
 	void *uwc_map;		/* OS/User window context */
-	int wcreds_max;		/* Window credits */
-
-	struct vas_user_win_ref task_ref;
-	char *dbgname;
-	struct dentry *dbgdir;
 
 	/* Fields applicable only to send windows */
 	void *paste_kaddr;
 	char *paste_addr_name;
-	struct vas_window *rxwin;
+	struct pnv_vas_window *rxwin;
 
-	/* Feilds applicable only to receive windows */
-	enum vas_cop_type cop;
+	/* Fields applicable only to receive windows */
 	atomic_t num_txwins;
 };
 
@@ -428,15 +422,15 @@ extern struct mutex vas_mutex;
 extern struct vas_instance *find_vas_instance(int vasid);
 extern void vas_init_dbgdir(void);
 extern void vas_instance_init_dbgdir(struct vas_instance *vinst);
-extern void vas_window_init_dbgdir(struct vas_window *win);
-extern void vas_window_free_dbgdir(struct vas_window *win);
+extern void vas_window_init_dbgdir(struct pnv_vas_window *win);
+extern void vas_window_free_dbgdir(struct pnv_vas_window *win);
 extern int vas_setup_fault_window(struct vas_instance *vinst);
 extern irqreturn_t vas_fault_thread_fn(int irq, void *data);
 extern irqreturn_t vas_fault_handler(int irq, void *dev_id);
-extern void vas_return_credit(struct vas_window *window, bool tx);
-extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
+extern void vas_return_credit(struct pnv_vas_window *window, bool tx);
+extern struct pnv_vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 						uint32_t pswid);
-extern void vas_win_paste_addr(struct vas_window *window, u64 *addr,
+extern void vas_win_paste_addr(struct pnv_vas_window *window, u64 *addr,
 				int *len);
 
 static inline int vas_window_pid(struct vas_window *window)
@@ -444,16 +438,16 @@ static inline int vas_window_pid(struct vas_window *window)
 	return pid_vnr(window->task_ref.pid);
 }
 
-static inline void vas_log_write(struct vas_window *win, char *name,
+static inline void vas_log_write(struct pnv_vas_window *win, char *name,
 			void *regptr, u64 val)
 {
 	if (val)
 		pr_debug("%swin #%d: %s reg %p, val 0x%016llx\n",
-				win->tx_win ? "Tx" : "Rx", win->winid, name,
-				regptr, val);
+				win->tx_win ? "Tx" : "Rx", win->vas_win.winid,
+				name, regptr, val);
 }
 
-static inline void write_uwc_reg(struct vas_window *win, char *name,
+static inline void write_uwc_reg(struct pnv_vas_window *win, char *name,
 			s32 reg, u64 val)
 {
 	void *regptr;
@@ -464,7 +458,7 @@ static inline void write_uwc_reg(struct vas_window *win, char *name,
 	out_be64(regptr, val);
 }
 
-static inline void write_hvwc_reg(struct vas_window *win, char *name,
+static inline void write_hvwc_reg(struct pnv_vas_window *win, char *name,
 			s32 reg, u64 val)
 {
 	void *regptr;
@@ -475,7 +469,7 @@ static inline void write_hvwc_reg(struct vas_window *win, char *name,
 	out_be64(regptr, val);
 }
 
-static inline u64 read_hvwc_reg(struct vas_window *win,
+static inline u64 read_hvwc_reg(struct pnv_vas_window *win,
 			char *name __maybe_unused, s32 reg)
 {
 	return in_be64(win->hvwc_map+reg);
-- 
2.18.2


