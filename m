Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 891BEDD6E1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 08:13:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46wCJF65cqzDqRC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 17:13:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46wC252L2qzDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 17:01:01 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9J5HiR3151924; Sat, 19 Oct 2019 02:00:56 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vqv3t0ub8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2019 02:00:55 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9J5JPRh007462;
 Sat, 19 Oct 2019 06:00:55 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 2vqt46gygc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2019 06:00:55 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9J60sOj54460796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Oct 2019 06:00:54 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0C2DAE05F;
 Sat, 19 Oct 2019 06:00:53 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 721EEAE063;
 Sat, 19 Oct 2019 06:00:53 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 19 Oct 2019 06:00:53 +0000 (GMT)
Subject: [RFC PATCH 11/13] powerpc/vas: Return credits after handling fault
From: Haren Myneni <haren@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Oct 2019 23:00:38 -0700
Message-ID: <1571464838.24387.37.camel@hbabu-laptop>
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
 mlxlogscore=536 adultscore=0 classifier=spam adjust=0 reason=mlx
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


NX expects OS to return credit for send window after processing each
fault. Also credit has to be returned even for fault window.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c  | 10 ++++++++++
 arch/powerpc/platforms/powernv/vas-window.c | 19 +++++++++++++++++++
 arch/powerpc/platforms/powernv/vas.h        |  1 +
 3 files changed, 30 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 98100c7..dff61ea 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -253,6 +253,11 @@ static void process_fault_crbs(struct vas_instance *vinst)
 		memset(fifo, 0, CRB_SIZE);
 		mutex_unlock(&vinst->mutex);
 
+		/*
+		 *
+		 * Return credit for the fault window.
+		 */
+		vas_return_credit(vinst->fault_win, 0);
 		pr_devel("VAS[%d] fault_fifo %p, fifo %p, fault_crbs %d "
 				"pending %d\n", vinst->vas_id,
 				vinst->fault_fifo, fifo, vinst->fault_crbs,
@@ -281,6 +286,11 @@ static void process_fault_crbs(struct vas_instance *vinst)
 		}
 
 		update_csb(window, crb);
+		/*
+		 * Return credit for send window after processing
+		 * fault CRB.
+		 */
+		vas_return_credit(window, 1);
 	} while (true);
 }
 
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 9d32d97..85a60ac 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1284,6 +1284,25 @@ int vas_win_close(struct vas_window *window)
 EXPORT_SYMBOL_GPL(vas_win_close);
 
 /*
+ * Return credit for the given window.
+ */
+void vas_return_credit(struct vas_window *window, bool tx)
+{
+	uint64_t val;
+
+	val = 0ULL;
+	if (tx) { /* send window */
+		val = SET_FIELD(VAS_TX_WCRED, val, 1);
+		write_hvwc_reg(window, VREG(TX_WCRED_ADDER), val);
+	} else {
+		val = SET_FIELD(VAS_LRX_WCRED, val, 1);
+		write_hvwc_reg(window, VREG(LRX_WCRED_ADDER), val);
+	}
+
+	return;
+}
+
+/*
  * Return a system-wide unique window id for the window @win.
  */
 u32 vas_win_id(struct vas_window *win)
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index d1e32a0..a8c9741 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -420,6 +420,7 @@ struct vas_winctx {
 extern void vas_wakeup_fault_handler(int virq, void *arg);
 extern int vas_setup_fault_handler(struct vas_instance *vinst);
 extern void vas_cleanup_fault_handler(struct vas_instance *vinst);
+extern void vas_return_credit(struct vas_window *window, bool tx);
 extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 						uint32_t pswid);
 
-- 
1.8.3.1



