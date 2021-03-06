Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E7232FC6A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 19:10:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DtCMT4LbHz3dTB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Mar 2021 05:10:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DtCLB3VmMz3cK8
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Mar 2021 05:09:34 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DtCL06fKnz9v088;
 Sat,  6 Mar 2021 19:09:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rsDzGnRLNusk; Sat,  6 Mar 2021 19:09:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DtCL05ncxz9v085;
 Sat,  6 Mar 2021 19:09:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB5818B768;
 Sat,  6 Mar 2021 19:09:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NlqWJYYaJtKA; Sat,  6 Mar 2021 19:09:30 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F6388B75B;
 Sat,  6 Mar 2021 19:09:30 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 42650674E3; Sat,  6 Mar 2021 18:09:30 +0000 (UTC)
Message-Id: <479e57158ed85c041e4c32ef17b55024f8a784ce.1615053848.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615053848.git.christophe.leroy@csgroup.eu>
References: <cover.1615053848.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 2/3] tty: serial: ucc_uart: replace qe_io{read,write}*
 wrappers by generic io{read,write}*
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Timur Tabi <timur@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Date: Sat,  6 Mar 2021 18:09:30 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 6ac9b61786cc ("soc: fsl: qe: introduce qe_io{read,write}*
wrappers") added specific I/O accessors for qe because at that
time ioread/iowrite functions were sub-optimal on powerpc/32
compared to the architecture specific in_/out_ IO accessors.

But as ioread/iowrite accessors are now equivalent since
commit 894fa235eb4c ("powerpc: inline iomap accessors"),
use them in order to allow removal of the qe specific ones.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/tty/serial/ucc_uart.c | 124 +++++++++++++++++-----------------
 1 file changed, 62 insertions(+), 62 deletions(-)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index d6a8604157ab..f81261cb52b8 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -261,11 +261,11 @@ static unsigned int qe_uart_tx_empty(struct uart_port *port)
 	struct qe_bd *bdp = qe_port->tx_bd_base;
 
 	while (1) {
-		if (qe_ioread16be(&bdp->status) & BD_SC_READY)
+		if (ioread16be(&bdp->status) & BD_SC_READY)
 			/* This BD is not done, so return "not done" */
 			return 0;
 
-		if (qe_ioread16be(&bdp->status) & BD_SC_WRAP)
+		if (ioread16be(&bdp->status) & BD_SC_WRAP)
 			/*
 			 * This BD is done and it's the last one, so return
 			 * "done"
@@ -344,10 +344,10 @@ static int qe_uart_tx_pump(struct uart_qe_port *qe_port)
 		p = qe2cpu_addr(be32_to_cpu(bdp->buf), qe_port);
 
 		*p++ = port->x_char;
-		qe_iowrite16be(1, &bdp->length);
+		iowrite16be(1, &bdp->length);
 		qe_setbits_be16(&bdp->status, BD_SC_READY);
 		/* Get next BD. */
-		if (qe_ioread16be(&bdp->status) & BD_SC_WRAP)
+		if (ioread16be(&bdp->status) & BD_SC_WRAP)
 			bdp = qe_port->tx_bd_base;
 		else
 			bdp++;
@@ -366,7 +366,7 @@ static int qe_uart_tx_pump(struct uart_qe_port *qe_port)
 	/* Pick next descriptor and fill from buffer */
 	bdp = qe_port->tx_cur;
 
-	while (!(qe_ioread16be(&bdp->status) & BD_SC_READY) &&
+	while (!(ioread16be(&bdp->status) & BD_SC_READY) &&
 	       (xmit->tail != xmit->head)) {
 		count = 0;
 		p = qe2cpu_addr(be32_to_cpu(bdp->buf), qe_port);
@@ -379,11 +379,11 @@ static int qe_uart_tx_pump(struct uart_qe_port *qe_port)
 				break;
 		}
 
-		qe_iowrite16be(count, &bdp->length);
+		iowrite16be(count, &bdp->length);
 		qe_setbits_be16(&bdp->status, BD_SC_READY);
 
 		/* Get next BD. */
-		if (qe_ioread16be(&bdp->status) & BD_SC_WRAP)
+		if (ioread16be(&bdp->status) & BD_SC_WRAP)
 			bdp = qe_port->tx_bd_base;
 		else
 			bdp++;
@@ -416,7 +416,7 @@ static void qe_uart_start_tx(struct uart_port *port)
 		container_of(port, struct uart_qe_port, port);
 
 	/* If we currently are transmitting, then just return */
-	if (qe_ioread16be(&qe_port->uccp->uccm) & UCC_UART_UCCE_TX)
+	if (ioread16be(&qe_port->uccp->uccm) & UCC_UART_UCCE_TX)
 		return;
 
 	/* Otherwise, pump the port and start transmission */
@@ -471,14 +471,14 @@ static void qe_uart_int_rx(struct uart_qe_port *qe_port)
 	 */
 	bdp = qe_port->rx_cur;
 	while (1) {
-		status = qe_ioread16be(&bdp->status);
+		status = ioread16be(&bdp->status);
 
 		/* If this one is empty, then we assume we've read them all */
 		if (status & BD_SC_EMPTY)
 			break;
 
 		/* get number of characters, and check space in RX buffer */
-		i = qe_ioread16be(&bdp->length);
+		i = ioread16be(&bdp->length);
 
 		/* If we don't have enough room in RX buffer for the entire BD,
 		 * then we try later, which will be the next RX interrupt.
@@ -512,7 +512,7 @@ static void qe_uart_int_rx(struct uart_qe_port *qe_port)
 		qe_clrsetbits_be16(&bdp->status,
 				   BD_SC_BR | BD_SC_FR | BD_SC_PR | BD_SC_OV | BD_SC_ID,
 				   BD_SC_EMPTY);
-		if (qe_ioread16be(&bdp->status) & BD_SC_WRAP)
+		if (ioread16be(&bdp->status) & BD_SC_WRAP)
 			bdp = qe_port->rx_bd_base;
 		else
 			bdp++;
@@ -569,8 +569,8 @@ static irqreturn_t qe_uart_int(int irq, void *data)
 	u16 events;
 
 	/* Clear the interrupts */
-	events = qe_ioread16be(&uccp->ucce);
-	qe_iowrite16be(events, &uccp->ucce);
+	events = ioread16be(&uccp->ucce);
+	iowrite16be(events, &uccp->ucce);
 
 	if (events & UCC_UART_UCCE_BRKE)
 		uart_handle_break(&qe_port->port);
@@ -601,17 +601,17 @@ static void qe_uart_initbd(struct uart_qe_port *qe_port)
 	bdp = qe_port->rx_bd_base;
 	qe_port->rx_cur = qe_port->rx_bd_base;
 	for (i = 0; i < (qe_port->rx_nrfifos - 1); i++) {
-		qe_iowrite16be(BD_SC_EMPTY | BD_SC_INTRPT, &bdp->status);
-		qe_iowrite32be(cpu2qe_addr(bd_virt, qe_port), &bdp->buf);
-		qe_iowrite16be(0, &bdp->length);
+		iowrite16be(BD_SC_EMPTY | BD_SC_INTRPT, &bdp->status);
+		iowrite32be(cpu2qe_addr(bd_virt, qe_port), &bdp->buf);
+		iowrite16be(0, &bdp->length);
 		bd_virt += qe_port->rx_fifosize;
 		bdp++;
 	}
 
 	/* */
-	qe_iowrite16be(BD_SC_WRAP | BD_SC_EMPTY | BD_SC_INTRPT, &bdp->status);
-	qe_iowrite32be(cpu2qe_addr(bd_virt, qe_port), &bdp->buf);
-	qe_iowrite16be(0, &bdp->length);
+	iowrite16be(BD_SC_WRAP | BD_SC_EMPTY | BD_SC_INTRPT, &bdp->status);
+	iowrite32be(cpu2qe_addr(bd_virt, qe_port), &bdp->buf);
+	iowrite16be(0, &bdp->length);
 
 	/* Set the physical address of the host memory
 	 * buffers in the buffer descriptors, and the
@@ -622,9 +622,9 @@ static void qe_uart_initbd(struct uart_qe_port *qe_port)
 	qe_port->tx_cur = qe_port->tx_bd_base;
 	bdp = qe_port->tx_bd_base;
 	for (i = 0; i < (qe_port->tx_nrfifos - 1); i++) {
-		qe_iowrite16be(BD_SC_INTRPT, &bdp->status);
-		qe_iowrite32be(cpu2qe_addr(bd_virt, qe_port), &bdp->buf);
-		qe_iowrite16be(0, &bdp->length);
+		iowrite16be(BD_SC_INTRPT, &bdp->status);
+		iowrite32be(cpu2qe_addr(bd_virt, qe_port), &bdp->buf);
+		iowrite16be(0, &bdp->length);
 		bd_virt += qe_port->tx_fifosize;
 		bdp++;
 	}
@@ -634,9 +634,9 @@ static void qe_uart_initbd(struct uart_qe_port *qe_port)
 	qe_setbits_be16(&qe_port->tx_cur->status, BD_SC_P);
 #endif
 
-	qe_iowrite16be(BD_SC_WRAP | BD_SC_INTRPT, &bdp->status);
-	qe_iowrite32be(cpu2qe_addr(bd_virt, qe_port), &bdp->buf);
-	qe_iowrite16be(0, &bdp->length);
+	iowrite16be(BD_SC_WRAP | BD_SC_INTRPT, &bdp->status);
+	iowrite32be(cpu2qe_addr(bd_virt, qe_port), &bdp->buf);
+	iowrite16be(0, &bdp->length);
 }
 
 /*
@@ -658,21 +658,21 @@ static void qe_uart_init_ucc(struct uart_qe_port *qe_port)
 	ucc_slow_disable(qe_port->us_private, COMM_DIR_RX_AND_TX);
 
 	/* Program the UCC UART parameter RAM */
-	qe_iowrite8(UCC_BMR_GBL | UCC_BMR_BO_BE, &uccup->common.rbmr);
-	qe_iowrite8(UCC_BMR_GBL | UCC_BMR_BO_BE, &uccup->common.tbmr);
-	qe_iowrite16be(qe_port->rx_fifosize, &uccup->common.mrblr);
-	qe_iowrite16be(0x10, &uccup->maxidl);
-	qe_iowrite16be(1, &uccup->brkcr);
-	qe_iowrite16be(0, &uccup->parec);
-	qe_iowrite16be(0, &uccup->frmec);
-	qe_iowrite16be(0, &uccup->nosec);
-	qe_iowrite16be(0, &uccup->brkec);
-	qe_iowrite16be(0, &uccup->uaddr[0]);
-	qe_iowrite16be(0, &uccup->uaddr[1]);
-	qe_iowrite16be(0, &uccup->toseq);
+	iowrite8(UCC_BMR_GBL | UCC_BMR_BO_BE, &uccup->common.rbmr);
+	iowrite8(UCC_BMR_GBL | UCC_BMR_BO_BE, &uccup->common.tbmr);
+	iowrite16be(qe_port->rx_fifosize, &uccup->common.mrblr);
+	iowrite16be(0x10, &uccup->maxidl);
+	iowrite16be(1, &uccup->brkcr);
+	iowrite16be(0, &uccup->parec);
+	iowrite16be(0, &uccup->frmec);
+	iowrite16be(0, &uccup->nosec);
+	iowrite16be(0, &uccup->brkec);
+	iowrite16be(0, &uccup->uaddr[0]);
+	iowrite16be(0, &uccup->uaddr[1]);
+	iowrite16be(0, &uccup->toseq);
 	for (i = 0; i < 8; i++)
-		qe_iowrite16be(0xC000, &uccup->cchars[i]);
-	qe_iowrite16be(0xc0ff, &uccup->rccm);
+		iowrite16be(0xC000, &uccup->cchars[i]);
+	iowrite16be(0xc0ff, &uccup->rccm);
 
 	/* Configure the GUMR registers for UART */
 	if (soft_uart) {
@@ -702,30 +702,30 @@ static void qe_uart_init_ucc(struct uart_qe_port *qe_port)
 #endif
 
 	/* Disable rx interrupts  and clear all pending events.  */
-	qe_iowrite16be(0, &uccp->uccm);
-	qe_iowrite16be(0xffff, &uccp->ucce);
-	qe_iowrite16be(0x7e7e, &uccp->udsr);
+	iowrite16be(0, &uccp->uccm);
+	iowrite16be(0xffff, &uccp->ucce);
+	iowrite16be(0x7e7e, &uccp->udsr);
 
 	/* Initialize UPSMR */
-	qe_iowrite16be(0, &uccp->upsmr);
+	iowrite16be(0, &uccp->upsmr);
 
 	if (soft_uart) {
-		qe_iowrite16be(0x30, &uccup->supsmr);
-		qe_iowrite16be(0, &uccup->res92);
-		qe_iowrite32be(0, &uccup->rx_state);
-		qe_iowrite32be(0, &uccup->rx_cnt);
-		qe_iowrite8(0, &uccup->rx_bitmark);
-		qe_iowrite8(10, &uccup->rx_length);
-		qe_iowrite32be(0x4000, &uccup->dump_ptr);
-		qe_iowrite8(0, &uccup->rx_temp_dlst_qe);
-		qe_iowrite32be(0, &uccup->rx_frame_rem);
-		qe_iowrite8(0, &uccup->rx_frame_rem_size);
+		iowrite16be(0x30, &uccup->supsmr);
+		iowrite16be(0, &uccup->res92);
+		iowrite32be(0, &uccup->rx_state);
+		iowrite32be(0, &uccup->rx_cnt);
+		iowrite8(0, &uccup->rx_bitmark);
+		iowrite8(10, &uccup->rx_length);
+		iowrite32be(0x4000, &uccup->dump_ptr);
+		iowrite8(0, &uccup->rx_temp_dlst_qe);
+		iowrite32be(0, &uccup->rx_frame_rem);
+		iowrite8(0, &uccup->rx_frame_rem_size);
 		/* Soft-UART requires TX to be 1X */
-		qe_iowrite8(UCC_UART_TX_STATE_UART | UCC_UART_TX_STATE_X1,
+		iowrite8(UCC_UART_TX_STATE_UART | UCC_UART_TX_STATE_X1,
 			    &uccup->tx_mode);
-		qe_iowrite16be(0, &uccup->tx_state);
-		qe_iowrite8(0, &uccup->resD4);
-		qe_iowrite16be(0, &uccup->resD5);
+		iowrite16be(0, &uccup->tx_state);
+		iowrite8(0, &uccup->resD4);
+		iowrite16be(0, &uccup->resD5);
 
 		/* Set UART mode.
 		 * Enable receive and transmit.
@@ -850,9 +850,9 @@ static void qe_uart_set_termios(struct uart_port *port,
 	struct ucc_slow __iomem *uccp = qe_port->uccp;
 	unsigned int baud;
 	unsigned long flags;
-	u16 upsmr = qe_ioread16be(&uccp->upsmr);
+	u16 upsmr = ioread16be(&uccp->upsmr);
 	struct ucc_uart_pram __iomem *uccup = qe_port->uccup;
-	u16 supsmr = qe_ioread16be(&uccup->supsmr);
+	u16 supsmr = ioread16be(&uccup->supsmr);
 	u8 char_length = 2; /* 1 + CL + PEN + 1 + SL */
 
 	/* Character length programmed into the mode register is the
@@ -950,10 +950,10 @@ static void qe_uart_set_termios(struct uart_port *port,
 	/* Update the per-port timeout. */
 	uart_update_timeout(port, termios->c_cflag, baud);
 
-	qe_iowrite16be(upsmr, &uccp->upsmr);
+	iowrite16be(upsmr, &uccp->upsmr);
 	if (soft_uart) {
-		qe_iowrite16be(supsmr, &uccup->supsmr);
-		qe_iowrite8(char_length, &uccup->rx_length);
+		iowrite16be(supsmr, &uccup->supsmr);
+		iowrite8(char_length, &uccup->rx_length);
 
 		/* Soft-UART requires a 1X multiplier for TX */
 		qe_setbrg(qe_port->us_info.rx_clock, baud, 16);
-- 
2.25.0

