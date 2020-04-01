Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8929919B7AC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 23:36:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48szzB1PhbzDqQ8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 08:36:22 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48szpJ2gf2zDr4D
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 08:28:40 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031L3tuZ126018; Wed, 1 Apr 2020 17:28:28 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304g86secy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 17:28:28 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 031LHdnN055307;
 Wed, 1 Apr 2020 17:28:27 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304g86sect-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 17:28:27 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 031LPSV8023743;
 Wed, 1 Apr 2020 21:28:27 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 301x77vy0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 21:28:27 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031LSQV451315042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 21:28:26 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E140124053;
 Wed,  1 Apr 2020 21:28:26 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0847B12405A;
 Wed,  1 Apr 2020 21:28:25 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 21:28:24 +0000 (GMT)
Subject: [PATCH v9 05/13] powerpc/vas: Register NX with fault window ID and
 IRQ port value
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1585775978.10664.438.camel@hbabu-laptop>
References: <1585775978.10664.438.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Apr 2020 14:27:39 -0700
Message-ID: <1585776459.10664.447.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=898 bulkscore=0 suspectscore=1 adultscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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


For each user space send window, register NX with fault window ID
and port value so that NX paste CRBs in this fault FIFO when it
sees fault on the request buffer.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-window.c | 15 +++++++++++++--
 arch/powerpc/platforms/powernv/vas.h        | 15 +++++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 1783fa9..dc46bf6 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -373,7 +373,7 @@ int init_winctx_regs(struct vas_window *window, struct vas_winctx *winctx)
 	init_xlate_regs(window, winctx->user_win);
 
 	val = 0ULL;
-	val = SET_FIELD(VAS_FAULT_TX_WIN, val, 0);
+	val = SET_FIELD(VAS_FAULT_TX_WIN, val, winctx->fault_win_id);
 	write_hvwc_reg(window, VREG(FAULT_TX_WIN), val);
 
 	/* In PowerNV, interrupts go to HV. */
@@ -748,6 +748,8 @@ static void init_winctx_for_rxwin(struct vas_window *rxwin,
 
 	winctx->min_scope = VAS_SCOPE_LOCAL;
 	winctx->max_scope = VAS_SCOPE_VECTORED_GROUP;
+	if (rxwin->vinst->virq)
+		winctx->irq_port = rxwin->vinst->irq_port;
 }
 
 static bool rx_win_args_valid(enum vas_cop_type cop,
@@ -944,13 +946,22 @@ static void init_winctx_for_txwin(struct vas_window *txwin,
 	winctx->lpid = txattr->lpid;
 	winctx->pidr = txattr->pidr;
 	winctx->rx_win_id = txwin->rxwin->winid;
+	/*
+	 * IRQ and fault window setup is successful. Set fault window
+	 * for the send window so that ready to handle faults.
+	 */
+	if (txwin->vinst->virq)
+		winctx->fault_win_id = txwin->vinst->fault_win->winid;
 
 	winctx->dma_type = VAS_DMA_TYPE_INJECT;
 	winctx->tc_mode = txattr->tc_mode;
 	winctx->min_scope = VAS_SCOPE_LOCAL;
 	winctx->max_scope = VAS_SCOPE_VECTORED_GROUP;
+	if (txwin->vinst->virq)
+		winctx->irq_port = txwin->vinst->irq_port;
 
-	winctx->pswid = 0;
+	winctx->pswid = txattr->pswid ? txattr->pswid :
+			encode_pswid(txwin->vinst->vas_id, txwin->winid);
 }
 
 static bool tx_win_args_valid(enum vas_cop_type cop,
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index 9c8e3f5..88d084d 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -467,6 +467,21 @@ static inline u64 read_hvwc_reg(struct vas_window *win,
 	return in_be64(win->hvwc_map+reg);
 }
 
+/*
+ * Encode/decode the Partition Send Window ID (PSWID) for a window in
+ * a way that we can uniquely identify any window in the system. i.e.
+ * we should be able to locate the 'struct vas_window' given the PSWID.
+ *
+ *	Bits	Usage
+ *	0:7	VAS id (8 bits)
+ *	8:15	Unused, 0 (3 bits)
+ *	16:31	Window id (16 bits)
+ */
+static inline u32 encode_pswid(int vasid, int winid)
+{
+	return ((u32)winid | (vasid << (31 - 7)));
+}
+
 static inline void decode_pswid(u32 pswid, int *vasid, int *winid)
 {
 	if (vasid)
-- 
1.8.3.1



