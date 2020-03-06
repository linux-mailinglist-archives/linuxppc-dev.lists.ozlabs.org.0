Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8122617C70C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 21:29:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YzjV0rdXzF3HT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 07:29:02 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YzV038hrzF0d5
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 07:19:04 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026K0WtK121389; Fri, 6 Mar 2020 15:18:54 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj6nn7j7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 15:18:54 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 026K0jhN129226;
 Fri, 6 Mar 2020 15:18:53 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj6nn7j7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 15:18:53 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 026K1LBG017632;
 Fri, 6 Mar 2020 20:18:53 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 2yffk8bjnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 20:18:53 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 026KIqg514090806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Mar 2020 20:18:52 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6204CAE063;
 Fri,  6 Mar 2020 20:18:52 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97760AE05C;
 Fri,  6 Mar 2020 20:18:51 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  6 Mar 2020 20:18:51 +0000 (GMT)
Subject: [PATCH V7 12/14] powerpc/vas: Return credits after handling fault
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1583525239.9256.5.camel@hbabu-laptop>
References: <1583525239.9256.5.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 Mar 2020 12:18:49 -0800
Message-ID: <1583525929.9256.17.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_07:2020-03-06,
 2020-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=767 suspectscore=3
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003060121
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


NX expects OS to return credit for send window after processing each
fault. Also credit has to be returned even for fault window.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c  |  9 +++++++++
 arch/powerpc/platforms/powernv/vas-window.c | 17 +++++++++++++++++
 arch/powerpc/platforms/powernv/vas.h        |  1 +
 3 files changed, 27 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 940adc5..cb8c51d 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -237,6 +237,10 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
 		memcpy(crb, fifo, CRB_SIZE);
 		entry->stamp.nx.pswid = cpu_to_be32(FIFO_INVALID_ENTRY);
 		entry->ccw |= cpu_to_be32(CCW0_INVALID);
+		/*
+		 * Return credit for the fault window.
+		 */
+		vas_return_credit(vinst->fault_win, 0);
 		mutex_unlock(&vinst->mutex);
 
 		pr_devel("VAS[%d] fault_fifo %p, fifo %p, fault_crbs %d\n",
@@ -266,6 +270,11 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
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
index 427a884..1439a6f 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1318,6 +1318,23 @@ int vas_win_close(struct vas_window *window)
 }
 EXPORT_SYMBOL_GPL(vas_win_close);
 
+/*
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
+}
+
 struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 		uint32_t pswid)
 {
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index bc728d7..8c39a7d 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -428,6 +428,7 @@ struct vas_winctx {
 extern void vas_window_free_dbgdir(struct vas_window *win);
 extern int vas_setup_fault_window(struct vas_instance *vinst);
 extern irqreturn_t vas_fault_thread_fn(int irq, void *data);
+extern void vas_return_credit(struct vas_window *window, bool tx);
 extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 						uint32_t pswid);
 
-- 
1.8.3.1



