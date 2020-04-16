Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC201AB7E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 08:22:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492pzW23PyzDqpB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 16:22:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 492pcQ11ZwzDrN0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 16:05:41 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03G63WNX104312; Thu, 16 Apr 2020 02:05:26 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30eh1hs2ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 02:05:26 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03G64HAD106424;
 Thu, 16 Apr 2020 02:05:25 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30eh1hs22g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 02:05:25 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03G60X1E013484;
 Thu, 16 Apr 2020 06:04:46 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 30b5h6r0d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 06:04:46 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03G64jCB52953562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Apr 2020 06:04:45 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21EA96E04C;
 Thu, 16 Apr 2020 06:04:45 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61B586E054;
 Thu, 16 Apr 2020 06:04:44 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 16 Apr 2020 06:04:44 +0000 (GMT)
Subject: [PATCH v11 09/14] powerpc/vas: Return credits after handling fault
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1587016214.2275.1036.camel@hbabu-laptop>
References: <1587016214.2275.1036.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Apr 2020 23:04:19 -0700
Message-ID: <1587017059.2275.1064.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_01:2020-04-14,
 2020-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=982 impostorscore=0
 suspectscore=1 mlxscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160033
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


NX uses credit mechanism to control the number of requests issued on
a specific window at any point of time. Only send windows and fault
window are used credits. When the request is issued on a given window,
a credit is taken. This credit will be returned after that request is
processed. If credits are not available, returns RMA_Busy for send
window and RMA_Reject for fault window.

NX expects OS to return credit for send window after processing fault
CRB. Also credit has to be returned for fault window after handling
the fault.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c  |  9 ++++++++
 arch/powerpc/platforms/powernv/vas-window.c | 36 +++++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas.h        |  1 +
 3 files changed, 46 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 354577d..b6bec64 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -224,6 +224,10 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
 		memcpy(crb, fifo, CRB_SIZE);
 		entry->stamp.nx.pswid = cpu_to_be32(FIFO_INVALID_ENTRY);
 		entry->ccw |= cpu_to_be32(CCW0_INVALID);
+		/*
+		 * Return credit for the fault window.
+		 */
+		vas_return_credit(vinst->fault_win, false);
 
 		pr_devel("VAS[%d] fault_fifo %p, fifo %p, fault_crbs %d\n",
 				vinst->vas_id, vinst->fault_fifo, fifo,
@@ -249,6 +253,11 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
 			WARN_ON_ONCE(1);
 		} else {
 			update_csb(window, crb);
+			/*
+			 * Return credit for send window after processing
+			 * fault CRB.
+			 */
+			vas_return_credit(window, true);
 		}
 	}
 }
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index f12f7eb..3ef7120 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1317,6 +1317,42 @@ int vas_win_close(struct vas_window *window)
 }
 EXPORT_SYMBOL_GPL(vas_win_close);
 
+/*
+ * Return credit for the given window.
+ * Send windows and fault window uses credit mechanism as follows:
+ *
+ * Send windows:
+ * - The default number of credits available for each send window is
+ *   1024. It means 1024 requests can be issued asynchronously at the
+ *   same time. If the credit is not available, that request will be
+ *   returned with RMA_Busy.
+ * - One credit is taken when NX request is issued.
+ * - This credit is returned after NX processed that request.
+ * - If NX encounters translation error, kernel will return the
+ *   credit on the specific send window after processing the fault CRB.
+ *
+ * Fault window:
+ * - The total number credits available is FIFO_SIZE/CRB_SIZE.
+ *   Means 4MB/128 in the current implementation. If credit is not
+ *   available, RMA_Reject is returned.
+ * - A credit is taken when NX pastes CRB in fault FIFO.
+ * - The kernel with return credit on fault window after reading entry
+ *   from fault FIFO.
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
+}
+
 struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 		uint32_t pswid)
 {
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index cd165c8..60bdda6 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -436,6 +436,7 @@ struct vas_winctx {
 extern int vas_setup_fault_window(struct vas_instance *vinst);
 extern irqreturn_t vas_fault_thread_fn(int irq, void *data);
 extern irqreturn_t vas_fault_handler(int irq, void *dev_id);
+extern void vas_return_credit(struct vas_window *window, bool tx);
 extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 						uint32_t pswid);
 
-- 
1.8.3.1



