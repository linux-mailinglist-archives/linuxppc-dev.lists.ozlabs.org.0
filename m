Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA976EB52
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 15:58:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGr6D1S7Sz3dFL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 23:58:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGr4s3g04z3cGW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 23:57:17 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RGr4d1yS9z9t3p;
	Thu,  3 Aug 2023 15:57:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rqY3Rxt---OG; Thu,  3 Aug 2023 15:57:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RGr4b1Zl6z9t3X;
	Thu,  3 Aug 2023 15:57:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3123E8B763;
	Thu,  3 Aug 2023 15:57:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fj89w-MMInYw; Thu,  3 Aug 2023 15:57:03 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.144])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D0E1D8B773;
	Thu,  3 Aug 2023 15:57:02 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 373DuvPq494165
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 3 Aug 2023 15:56:57 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 373DuvXQ494164;
	Thu, 3 Aug 2023 15:56:57 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Timur Tabi <timur@kernel.org>
Subject: [PATCH v1 02/12] serial: cpm_uart: Remove stale prototypes and table and macros
Date: Thu,  3 Aug 2023 15:56:43 +0200
Message-ID: <96ef20ae1df056d1b7967871ba6e27e5b5aaeea6.1691068700.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691068700.git.christophe.leroy@csgroup.eu>
References: <cover.1691068700.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691071000; l=3831; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=oiNGC6eHSN+sfiKHeY488a9l1XS8iu6dN8mXSfaWcE0=; b=wY2eIuYJkPizF1edM948UtQ6Qd7myJYrzVef6C+O4j/+Gfa/tgcVABTQURU046iiG/6oabTA3 jSNMGXSDUjFB3GJuq7Ri+Yz7Nfsc57yhbb1tikDO1RQ+wKWysfKbZvo
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cpm_uart_init_portdesc()
smc1_lineif()
smc2_lineif()
scc1_lineif()
scc2_lineif()
scc3_lineif()
scc4_lineif()

Those functions were removed by commit 0b2a2e5b7747 ("cpm_uart: Remove
!CONFIG_PPC_CPM_NEW_BINDING code"). Remove stale prototypes.

UART_SMC{1..2} and UART_SCC{1..4} and SCC_WAIT_CLOSING macros are not
used anymore since the above commit.

cpm_uart_ports[] isn't used outside cpm_uart_core.c since the
same commit, so make it static.

cpm_uart_init_smc() and cpm_uart_init_scc() don't need a forward
declaration.

FLAG_DISCARDING and IS_DISCARDING have never been used since at
least 2.6.12 and the start of git repository for kernel.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/tty/serial/cpm_uart/cpm_uart.h      | 21 ---------------------
 drivers/tty/serial/cpm_uart/cpm_uart_core.c |  4 +---
 2 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/tty/serial/cpm_uart/cpm_uart.h b/drivers/tty/serial/cpm_uart/cpm_uart.h
index 46c03ed71c31..687b48fc6fb6 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart.h
+++ b/drivers/tty/serial/cpm_uart/cpm_uart.h
@@ -25,18 +25,9 @@ struct gpio_desc;
 #define SERIAL_CPM_MINOR	46
 
 #define IS_SMC(pinfo)		(pinfo->flags & FLAG_SMC)
-#define IS_DISCARDING(pinfo)	(pinfo->flags & FLAG_DISCARDING)
-#define FLAG_DISCARDING	0x00000004	/* when set, don't discard */
 #define FLAG_SMC	0x00000002
 #define FLAG_CONSOLE	0x00000001
 
-#define UART_SMC1	fsid_smc1_uart
-#define UART_SMC2	fsid_smc2_uart
-#define UART_SCC1	fsid_scc1_uart
-#define UART_SCC2	fsid_scc2_uart
-#define UART_SCC3	fsid_scc3_uart
-#define UART_SCC4	fsid_scc4_uart
-
 #define UART_NR		fs_uart_nr
 
 #define RX_NUM_FIFO	4
@@ -44,8 +35,6 @@ struct gpio_desc;
 #define TX_NUM_FIFO	4
 #define TX_BUF_SIZE	32
 
-#define SCC_WAIT_CLOSING 100
-
 #define GPIO_CTS	0
 #define GPIO_RTS	1
 #define GPIO_DCD	2
@@ -85,24 +74,14 @@ struct uart_cpm_port {
 	struct gpio_desc	*gpios[NUM_GPIOS];
 };
 
-extern struct uart_cpm_port cpm_uart_ports[UART_NR];
-
 /* these are located in their respective files */
 void cpm_line_cr_cmd(struct uart_cpm_port *port, int cmd);
 void __iomem *cpm_uart_map_pram(struct uart_cpm_port *port,
 				struct device_node *np);
 void cpm_uart_unmap_pram(struct uart_cpm_port *port, void __iomem *pram);
-int cpm_uart_init_portdesc(void);
 int cpm_uart_allocbuf(struct uart_cpm_port *pinfo, unsigned int is_con);
 void cpm_uart_freebuf(struct uart_cpm_port *pinfo);
 
-void smc1_lineif(struct uart_cpm_port *pinfo);
-void smc2_lineif(struct uart_cpm_port *pinfo);
-void scc1_lineif(struct uart_cpm_port *pinfo);
-void scc2_lineif(struct uart_cpm_port *pinfo);
-void scc3_lineif(struct uart_cpm_port *pinfo);
-void scc4_lineif(struct uart_cpm_port *pinfo);
-
 /*
    virtual to phys transtalion
 */
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
index 71366a4cea22..d804dd4019c0 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
@@ -48,8 +48,6 @@
 /**************************************************************/
 
 static int  cpm_uart_tx_pump(struct uart_port *port);
-static void cpm_uart_init_smc(struct uart_cpm_port *pinfo);
-static void cpm_uart_init_scc(struct uart_cpm_port *pinfo);
 static void cpm_uart_initbd(struct uart_cpm_port *pinfo);
 
 /**************************************************************/
@@ -1128,7 +1126,7 @@ static const struct uart_ops cpm_uart_pops = {
 #endif
 };
 
-struct uart_cpm_port cpm_uart_ports[UART_NR];
+static struct uart_cpm_port cpm_uart_ports[UART_NR];
 
 static int cpm_uart_init_port(struct device_node *np,
                               struct uart_cpm_port *pinfo)
-- 
2.41.0

