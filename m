Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CAE18ACC1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 07:26:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jcPg3hH7zDqw6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 17:26:47 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jcBG2sYMzDqnD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 17:16:54 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02J63bUd094189; Thu, 19 Mar 2020 02:16:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yu96ftt3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 02:16:43 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02J65Obm099213;
 Thu, 19 Mar 2020 02:16:42 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yu96ftt3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 02:16:42 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02J6EwPZ018870;
 Thu, 19 Mar 2020 06:16:42 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 2yrpw6pdd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 06:16:42 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02J6Gfft46465356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 06:16:41 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A807F112061;
 Thu, 19 Mar 2020 06:16:41 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8202112065;
 Thu, 19 Mar 2020 06:16:40 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Mar 2020 06:16:40 +0000 (GMT)
Subject: [PATCH v8 07/14] powerpc/vas: Register NX with fault window ID and
 IRQ port value
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1584598120.9256.15237.camel@hbabu-laptop>
References: <1584598120.9256.15237.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 18 Mar 2020 23:16:17 -0700
Message-ID: <1584598577.9256.15254.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_10:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=926 bulkscore=0
 malwarescore=0 suspectscore=1 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
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
index 1f31c18..acb6a22 100644
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
index ecae7cd..310b8a0 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -468,6 +468,21 @@ static inline u64 read_hvwc_reg(struct vas_window *win,
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



