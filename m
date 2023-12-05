Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EE7805673
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 14:50:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sl2444P4Fz3dLl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 00:50:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
X-Greylist: delayed 1987 seconds by postgrey-1.37 at boromir; Wed, 06 Dec 2023 00:50:14 AEDT
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sl23V2ScDz3cSH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 00:50:12 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Sl1K76KdLz9v7D;
	Tue,  5 Dec 2023 14:16:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSTOM1woJZj9; Tue,  5 Dec 2023 14:16:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Sl1K75h5sz9v73;
	Tue,  5 Dec 2023 14:16:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BEF238B773;
	Tue,  5 Dec 2023 14:16:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ZmudtaQvGfeJ; Tue,  5 Dec 2023 14:16:59 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.140])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 435AE8B763;
	Tue,  5 Dec 2023 14:16:59 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Timur Tabi <timur@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH] serial: ucc_uart: Fix multiple address space type errors
Date: Tue,  5 Dec 2023 14:16:43 +0100
Message-ID: <e49deeb079391ff7273ec32f5563df94cf70bc95.1701781976.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701782202; l=4378; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=7BbyDEsSN9lKWutzAJVNg1p+8y1zmI8jKsAum4TfjD4=; b=/415lG8SKvaAfW7b6eXqylnoXLy2KmYateqRHnTPn7UHwcQHwh+OrBjzFBzzGRrcVvbVNC5B8 AGNFI4BZiltDqxeBEOXRfCxMK/1KN6/dn7E9ypsAwcT4yUIMnfPW7ng
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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
Cc: kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

sparse reports multiple problems with address space type.

Most problems are linked to missing __iomem qualifier.

Others are caused by dereferencing __iomem addresses.

Fix all this by adding missing __iomem and using ioread32be().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312050412.zN2PKArS-lkp@intel.com/
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/tty/serial/ucc_uart.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index ed7a6bb5596a..25903d492023 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -189,10 +189,10 @@ struct uart_qe_port {
 	u16 tx_fifosize;
 	int wait_closing;
 	u32 flags;
-	struct qe_bd *rx_bd_base;
-	struct qe_bd *rx_cur;
-	struct qe_bd *tx_bd_base;
-	struct qe_bd *tx_cur;
+	struct qe_bd __iomem *rx_bd_base;
+	struct qe_bd __iomem *rx_cur;
+	struct qe_bd __iomem *tx_bd_base;
+	struct qe_bd __iomem *tx_cur;
 	unsigned char *tx_buf;
 	unsigned char *rx_buf;
 	void *bd_virt;  	/* virtual address of the BD buffers */
@@ -258,7 +258,7 @@ static unsigned int qe_uart_tx_empty(struct uart_port *port)
 {
 	struct uart_qe_port *qe_port =
 		container_of(port, struct uart_qe_port, port);
-	struct qe_bd *bdp = qe_port->tx_bd_base;
+	struct qe_bd __iomem *bdp = qe_port->tx_bd_base;
 
 	while (1) {
 		if (ioread16be(&bdp->status) & BD_SC_READY)
@@ -330,7 +330,7 @@ static void qe_uart_stop_tx(struct uart_port *port)
  */
 static int qe_uart_tx_pump(struct uart_qe_port *qe_port)
 {
-	struct qe_bd *bdp;
+	struct qe_bd __iomem *bdp;
 	unsigned char *p;
 	unsigned int count;
 	struct uart_port *port = &qe_port->port;
@@ -341,7 +341,7 @@ static int qe_uart_tx_pump(struct uart_qe_port *qe_port)
 		/* Pick next descriptor and fill from buffer */
 		bdp = qe_port->tx_cur;
 
-		p = qe2cpu_addr(be32_to_cpu(bdp->buf), qe_port);
+		p = qe2cpu_addr(ioread32be(&bdp->buf), qe_port);
 
 		*p++ = port->x_char;
 		iowrite16be(1, &bdp->length);
@@ -368,7 +368,7 @@ static int qe_uart_tx_pump(struct uart_qe_port *qe_port)
 
 	while (!(ioread16be(&bdp->status) & BD_SC_READY) && !uart_circ_empty(xmit)) {
 		count = 0;
-		p = qe2cpu_addr(be32_to_cpu(bdp->buf), qe_port);
+		p = qe2cpu_addr(ioread32be(&bdp->buf), qe_port);
 		while (count < qe_port->tx_fifosize) {
 			*p++ = xmit->buf[xmit->tail];
 			uart_xmit_advance(port, 1);
@@ -460,7 +460,7 @@ static void qe_uart_int_rx(struct uart_qe_port *qe_port)
 	unsigned char ch, *cp;
 	struct uart_port *port = &qe_port->port;
 	struct tty_port *tport = &port->state->port;
-	struct qe_bd *bdp;
+	struct qe_bd __iomem *bdp;
 	u16 status;
 	unsigned int flg;
 
@@ -487,7 +487,7 @@ static void qe_uart_int_rx(struct uart_qe_port *qe_port)
 		}
 
 		/* get pointer */
-		cp = qe2cpu_addr(be32_to_cpu(bdp->buf), qe_port);
+		cp = qe2cpu_addr(ioread32be(&bdp->buf), qe_port);
 
 		/* loop through the buffer */
 		while (i-- > 0) {
@@ -590,7 +590,7 @@ static void qe_uart_initbd(struct uart_qe_port *qe_port)
 {
 	int i;
 	void *bd_virt;
-	struct qe_bd *bdp;
+	struct qe_bd __iomem *bdp;
 
 	/* Set the physical address of the host memory buffers in the buffer
 	 * descriptors, and the virtual address for us to work with.
@@ -648,7 +648,7 @@ static void qe_uart_init_ucc(struct uart_qe_port *qe_port)
 {
 	u32 cecr_subblock;
 	struct ucc_slow __iomem *uccp = qe_port->uccp;
-	struct ucc_uart_pram *uccup = qe_port->uccup;
+	struct ucc_uart_pram __iomem *uccup = qe_port->uccup;
 
 	unsigned int i;
 
@@ -983,7 +983,7 @@ static int qe_uart_request_port(struct uart_port *port)
 
 	qe_port->us_private = uccs;
 	qe_port->uccp = uccs->us_regs;
-	qe_port->uccup = (struct ucc_uart_pram *) uccs->us_pram;
+	qe_port->uccup = (struct ucc_uart_pram __iomem *)uccs->us_pram;
 	qe_port->rx_bd_base = uccs->rx_bd;
 	qe_port->tx_bd_base = uccs->tx_bd;
 
@@ -1156,7 +1156,7 @@ static void uart_firmware_cont(const struct firmware *fw, void *context)
 
 	firmware = (struct qe_firmware *) fw->data;
 
-	if (firmware->header.length != fw->size) {
+	if (be32_to_cpu(firmware->header.length) != fw->size) {
 		dev_err(dev, "invalid firmware\n");
 		goto out;
 	}
-- 
2.41.0

