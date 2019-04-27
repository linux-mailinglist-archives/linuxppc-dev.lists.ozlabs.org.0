Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ADDB394
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:25:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rs9g4csZzDqNd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:25:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrT44Tn0zDqYV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:53:42 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MRTEr-1h6GLw2B53-00NPhG; Sat, 27 Apr 2019 14:52:53 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 23/41] drivers: tty: serial: cpm_uart: fix styling issues
Date: Sat, 27 Apr 2019 14:52:04 +0200
Message-Id: <1556369542-13247-24-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:CVjkYwcG+7onfHBaQNovKTeKpoTonT0f2mtSvxJbYPTQ5P27Qql
 bm2hXQ5MzYvytKmVHr96tZoyT9BsAx1aITPsx+ZQ/Y80RiEOEsBGghiwpDry3B7D80lietP
 S7LHY1RtNXEi1Xy8Uro7Qk9jPCLsxm3ZdGByAMoweKDddQrUFEn7/28rMNLjbN0MsTynh0q
 xc6fHl2PHk7s/7c2Apbdg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y/SKJieP6wk=:bE6j2ZEISFPH35gVY9aksP
 N2WtRYInPtHzA2XWQehhGr2AnSgWfI93EM/rid30NmbMVmjtGRgOitSGya8spg4IULwveNnx1
 FphAFz69Bsk5otla3jHKh3ZNA4oh+BEj4u11Wi/YpobC4dGf/W1F/vpJR2wBziUMxC1EVmtRb
 NaoGtiuJ4t9HAcJSIiJjSj3GVwGsdBEsZN/qw/NxSFDzXkl1Ho0cYbsazmA/w1I8qusKi254E
 pJbPQPlZhSUyNFg5n1xYupItzvLjE8oZJWJydmkVaixKN8K7Kv+olix2BqvrCgqjaQnbq+cKS
 7DOQUhOgnqmgV/hn6hyXZVMbGBh+MKLy8p2Fp6RrxU8UpVaxcjxbz2RmZkPLfvT+pgJ7iDTe4
 k09auReJyjD+OMypadPBmGhLT0EgSqsT2vLQRgAE+yicwLwhpSeOEsrpfyBsLdp0OyWY/f0Ot
 1IAHS6w9h/ILLep1wUxBtV5nkq2xE0oLlWNTkSoE+cDQVC1O2Vd7yceDGWYPFvyQjZcQ6+t0p
 MAlvuHRgCrNhlaLu17VUbMrH8Fv4zSi73kwNGIai/nKYW+Y56rgD8tpIvw4Ed+++TV9Y+3mIk
 k4sbza6StAlk5z9I0sIrKE1lK7yn9TbNVbCaHc/zgZTRNsxQsSZnbTRH7c//OPjeBIjbaY7cc
 hDA+C0CRLdNcOrslv8eUJoQHgVHPAHJ42Qo4ShPvkISRFRImnZcPmTMjqXoyQcPx98o7glHUx
 QRan2bO5p7yU7PrjrWty1zzXKHnjwouFf27a3A==
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix checkpatch errors:

    ERROR: else should follow close brace '}'
    #121: FILE: drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c:121:
    +	}
    +	else

    WARNING: line over 80 characters
    #150: FILE: drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c:150:
    +					 pinfo->tx_fifosize), (void __force *)pinfo->mem_addr,

    WARNING: Block comments should align the * on each line
    #66: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:66:
    + * Check, if transmit buffers are processed
    +*/

    WARNING: braces {} are not necessary for any arm of this statement
    #170: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:170:
    +		if (IS_SMC(pinfo)) {
    [...]
    +		} else {
    [...]

    WARNING: labels should not be indented
    #292: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:292:
    +		      error_return:

    ERROR: code indent should use tabs where possible
    #299: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:299:
    +^I^I                        BD_SC_OV | BD_SC_ID);$

    WARNING: labels should not be indented
    #319: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:319:
    +      handle_error:

    WARNING: line over 80 characters
    #423: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:423:
    +		setbits32(&pinfo->sccp->scc_gsmrl, (SCC_GSMRL_ENR | SCC_GSMRL_ENT));

    ERROR: space required before the open parenthesis '('
    #451: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:451:
    +		while(!cpm_uart_tx_empty(port)) {

    WARNING: Missing a blank line after declarations
    #462: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:462:
    +			smc_t __iomem *smcp = pinfo->smcp;
    +			clrbits16(&smcp->smc_smcmr, SMCMR_REN | SMCMR_TEN);

    WARNING: line over 80 characters
    #466: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:466:
    +			clrbits32(&sccp->scc_gsmrl, SCC_GSMRL_ENR | SCC_GSMRL_ENT);

    WARNING: Missing a blank line after declarations
    #466: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:466:
    +			scc_t __iomem *sccp = pinfo->sccp;
    +			clrbits32(&sccp->scc_gsmrl, SCC_GSMRL_ENR | SCC_GSMRL_ENT);

    ERROR: code indent should use tabs where possible
    #484: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:484:
    +                                 struct ktermios *termios,$

    WARNING: please, no spaces at the start of a line
    #484: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:484:
    +                                 struct ktermios *termios,$

    ERROR: code indent should use tabs where possible
    #485: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:485:
    +                                 struct ktermios *old)$

    WARNING: please, no spaces at the start of a line
    #485: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:485:
    +                                 struct ktermios *old)$

    WARNING: line over 80 characters
    #624: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:624:
    +		/* Output in *one* operation, so we don't interrupt RX/TX if they

    WARNING: Block comments use a trailing */ on a separate line
    #625: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:625:
    +		 * were already enabled. */

    WARNING: line over 80 characters
    #629: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:629:
    +		out_be16(&pinfo->sccup->scc_genscc.scc_mrblr, pinfo->rx_fifosize);

    WARNING: line over 80 characters
    #773: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:773:
    +	mem_addr = pinfo->mem_addr + L1_CACHE_ALIGN(pinfo->rx_nrfifos * pinfo->rx_fifosize);

    ERROR: code indent should use tabs where possible
    #797: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:797:
    +^I         (u8 __iomem *)pinfo->rx_bd_base - DPRAM_BASE);$

    ERROR: code indent should use tabs where possible
    #799: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:799:
    +^I         (u8 __iomem *)pinfo->tx_bd_base - DPRAM_BASE);$

    ERROR: code indent should use tabs where possible
    #836: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:836:
    +^I         SCC_GSMRL_MODE_UART | SCC_GSMRL_TDCR_16 | SCC_GSMRL_RDCR_16);$

    ERROR: code indent should use tabs where possible
    #859: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:859:
    +^I         (u8 __iomem *)pinfo->rx_bd_base - DPRAM_BASE);$

    ERROR: code indent should use tabs where possible
    #861: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:861:
    +^I         (u8 __iomem *)pinfo->tx_bd_base - DPRAM_BASE);$

    WARNING: space prohibited between function name and open parenthesis '('
    #866: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:866:
    +#if defined (CONFIG_I2C_SPI_SMC1_UCODE_PATCH)

    WARNING: line over 80 characters
    #921: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:921:
    +		clrbits32(&pinfo->sccp->scc_gsmrl, SCC_GSMRL_ENR | SCC_GSMRL_ENT);

    WARNING: Missing a blank line after declarations
    #462: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:462:
    +			smc_t __iomem *smcp = pinfo->smcp;
    +			clrbits16(&smcp->smc_smcmr,

    WARNING: Missing a blank line after declarations
    #467: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:467:
    +			scc_t __iomem *sccp = pinfo->sccp;
    +			clrbits32(&sccp->scc_gsmrl,

    ERROR: code indent should use tabs where possible
    #1151: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:1151:
    +                              struct uart_cpm_port *pinfo)$

    WARNING: please, no spaces at the start of a line
    #1151: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:1151:
    +                              struct uart_cpm_port *pinfo)$

    ERROR: "(foo*)" should be "(foo *)"
    #1161: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:1161:
    +		struct clk *clk = clk_get(NULL, (const char*)data);

    WARNING: Missing a blank line after declarations
    #1162: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:1162:
    +		struct clk *clk = clk_get(NULL, (const char*)data);
    +		if (!IS_ERR(clk))

    ERROR: code indent should use tabs where possible
    #1169: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:1169:
    +^I^I^I                "fsl,cpm-brg property.\n", np);$

    ERROR: code indent should use tabs where possible
    #1178: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:1178:
    +^I^I                "fsl,cpm-command property.\n", np);$

    ERROR: code indent should use tabs where possible
    #1192: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:1192:

    WARNING: braces {} are not necessary for any arm of this statement
    #1279: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:1279:
    +	if (unlikely(nolock)) {
    [...]
    +	} else {
    [...]

    WARNING: braces {} are not necessary for any arm of this statement
    #1287: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:1287:
    +	if (unlikely(nolock)) {
    [...]
    +	} else {
    [...]

    WARNING: line over 80 characters
    #1354: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:1354:
    +		clrbits32(&pinfo->sccp->scc_gsmrl, SCC_GSMRL_ENR | SCC_GSMRL_ENT);

    ERROR: Macros with complex values should be enclosed in parentheses
    #1394: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:1394:
    +#define CPM_UART_CONSOLE	&cpm_scc_uart_console

    WARNING: Missing a blank line after declarations
    #1437: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:1437:
    +	struct uart_cpm_port *pinfo = platform_get_drvdata(ofdev);
    +	return uart_remove_one_port(&cpm_reg, &pinfo->port);

    WARNING: please, no spaces at the start of a line
    #1464: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:1464:
    + };$

    WARNING: Missing a blank line after declarations
    #1469: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:1469:
    +	int ret = uart_register_driver(&cpm_reg);
    +	if (ret)

    WARNING: Missing a blank line after declarations
    #1062: FILE: drivers/tty/serial/cpm_uart/cpm_uart_core.c:1062:
    +	int		i;
    +	volatile cbd_t	*bdp;

    ERROR: "foo * bar" should be "foo *bar"
    #19: FILE: drivers/tty/serial/cpm_uart/cpm_uart_cpm1.h:19:
    +static inline void cpm_set_scc_fcr(scc_uart_t __iomem * sup)

    ERROR: "foo * bar" should be "foo *bar"
    #25: FILE: drivers/tty/serial/cpm_uart/cpm_uart_cpm1.h:25:
    +static inline void cpm_set_smc_fcr(smc_uart_t __iomem * up)

    WARNING: Improper SPDX comment style for 'drivers/tty/serial/cpm_uart/cpm_uart.h', please use '/*' instead
    #1: FILE: drivers/tty/serial/cpm_uart/cpm_uart.h:1:
    +// SPDX-License-Identifier: GPL-2.0

    WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
    #1: FILE: drivers/tty/serial/cpm_uart/cpm_uart.h:1:
    +// SPDX-License-Identifier: GPL-2.0

    WARNING: Block comments use * on subsequent lines
    #106: FILE: drivers/tty/serial/cpm_uart/cpm_uart.h:106:
    +/*
    +   virtual to phys transtalion

    ERROR: code indent should use tabs where possible
    #109: FILE: drivers/tty/serial/cpm_uart/cpm_uart.h:109:
    +                                         struct uart_cpm_port *pinfo)$

    WARNING: please, no spaces at the start of a line
    #109: FILE: drivers/tty/serial/cpm_uart/cpm_uart.h:109:
    +                                         struct uart_cpm_port *pinfo)$

    ERROR: code indent should use tabs where possible
    #125: FILE: drivers/tty/serial/cpm_uart/cpm_uart.h:125:
    +                                 struct uart_cpm_port *pinfo)$

    WARNING: please, no spaces at the start of a line
    #125: FILE: drivers/tty/serial/cpm_uart/cpm_uart.h:125:
    +                                 struct uart_cpm_port *pinfo)$

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/cpm_uart/cpm_uart.h      | 10 +--
 drivers/tty/serial/cpm_uart/cpm_uart_core.c | 95 ++++++++++++++++-------------
 drivers/tty/serial/cpm_uart/cpm_uart_cpm1.h |  4 +-
 drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c |  6 +-
 4 files changed, 64 insertions(+), 51 deletions(-)

diff --git a/drivers/tty/serial/cpm_uart/cpm_uart.h b/drivers/tty/serial/cpm_uart/cpm_uart.h
index 9f175a9..e7e225f 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart.h
+++ b/drivers/tty/serial/cpm_uart/cpm_uart.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  *  Driver for CPM (SCC/SMC) serial ports
  *
@@ -103,10 +103,10 @@ void __iomem *cpm_uart_map_pram(struct uart_cpm_port *port,
 void scc4_lineif(struct uart_cpm_port *pinfo);
 
 /*
-   virtual to phys transtalion
-*/
+ * virtual to phys transtalion
+ */
 static inline unsigned long cpu2cpm_addr(void *addr,
-                                         struct uart_cpm_port *pinfo)
+					 struct uart_cpm_port *pinfo)
 {
 	int offset;
 	u32 val = (u32)addr;
@@ -122,7 +122,7 @@ static inline unsigned long cpu2cpm_addr(void *addr,
 }
 
 static inline void *cpm2cpu_addr(unsigned long addr,
-                                 struct uart_cpm_port *pinfo)
+				 struct uart_cpm_port *pinfo)
 {
 	int offset;
 	u32 val = addr;
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
index c831d31..4d6cea9 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
@@ -63,7 +63,7 @@
 
 /*
  * Check, if transmit buffers are processed
-*/
+ */
 static unsigned int cpm_uart_tx_empty(struct uart_port *port)
 {
 	struct uart_cpm_port *pinfo =
@@ -167,11 +167,10 @@ static void cpm_uart_start_tx(struct uart_port *port)
 	}
 
 	if (cpm_uart_tx_pump(port) != 0) {
-		if (IS_SMC(pinfo)) {
+		if (IS_SMC(pinfo))
 			setbits8(&smcp->smc_smcm, SMCM_TX);
-		} else {
+		else
 			setbits16(&sccp->scc_sccm, UART_SCCM_TX);
-		}
 	}
 }
 
@@ -289,14 +288,14 @@ static void cpm_uart_int_rx(struct uart_port *port)
 				return;
 			}
 #endif
-		      error_return:
+error_return:
 			tty_insert_flip_char(tport, ch, flg);
 
 		}		/* End while (i--) */
 
 		/* This BD is ready to be used again. Clear status. get next */
 		clrbits16(&bdp->cbd_sc, BD_SC_BR | BD_SC_FR | BD_SC_PR |
-		                        BD_SC_OV | BD_SC_ID);
+					BD_SC_OV | BD_SC_ID);
 		setbits16(&bdp->cbd_sc, BD_SC_EMPTY);
 
 		if (in_be16(&bdp->cbd_sc) & BD_SC_WRAP)
@@ -316,7 +315,7 @@ static void cpm_uart_int_rx(struct uart_port *port)
 
 	/* Error processing */
 
-      handle_error:
+handle_error:
 	/* Statistics */
 	if (status & BD_SC_BR)
 		port->icount.brk++;
@@ -420,7 +419,8 @@ static int cpm_uart_startup(struct uart_port *port)
 		setbits16(&pinfo->smcp->smc_smcmr, (SMCMR_REN | SMCMR_TEN));
 	} else {
 		setbits16(&pinfo->sccp->scc_sccm, UART_SCCM_RX);
-		setbits32(&pinfo->sccp->scc_gsmrl, (SCC_GSMRL_ENR | SCC_GSMRL_ENT));
+		setbits32(&pinfo->sccp->scc_gsmrl,
+			  (SCC_GSMRL_ENR | SCC_GSMRL_ENT));
 	}
 
 	return 0;
@@ -448,7 +448,7 @@ static void cpm_uart_shutdown(struct uart_port *port)
 	/* If the port is not the console, disable Rx and Tx. */
 	if (!(pinfo->flags & FLAG_CONSOLE)) {
 		/* Wait for all the BDs marked sent */
-		while(!cpm_uart_tx_empty(port)) {
+		while (!cpm_uart_tx_empty(port)) {
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			schedule_timeout(2);
 		}
@@ -459,12 +459,17 @@ static void cpm_uart_shutdown(struct uart_port *port)
 		/* Stop uarts */
 		if (IS_SMC(pinfo)) {
 			smc_t __iomem *smcp = pinfo->smcp;
-			clrbits16(&smcp->smc_smcmr, SMCMR_REN | SMCMR_TEN);
+
+			clrbits16(&smcp->smc_smcmr,
+				  SMCMR_REN | SMCMR_TEN);
 			clrbits8(&smcp->smc_smcm, SMCM_RX | SMCM_TX);
 		} else {
 			scc_t __iomem *sccp = pinfo->sccp;
-			clrbits32(&sccp->scc_gsmrl, SCC_GSMRL_ENR | SCC_GSMRL_ENT);
-			clrbits16(&sccp->scc_sccm, UART_SCCM_TX | UART_SCCM_RX);
+
+			clrbits32(&sccp->scc_gsmrl,
+				  SCC_GSMRL_ENR | SCC_GSMRL_ENT);
+			clrbits16(&sccp->scc_sccm,
+				  UART_SCCM_TX | UART_SCCM_RX);
 		}
 
 		/* Shut them really down and reinit buffer descriptors */
@@ -481,8 +486,8 @@ static void cpm_uart_shutdown(struct uart_port *port)
 }
 
 static void cpm_uart_set_termios(struct uart_port *port,
-                                 struct ktermios *termios,
-                                 struct ktermios *old)
+				 struct ktermios *termios,
+				 struct ktermios *old)
 {
 	int baud;
 	unsigned long flags;
@@ -621,12 +626,14 @@ static void cpm_uart_set_termios(struct uart_port *port,
 		 * present.
 		 */
 		prev_mode = in_be16(&smcp->smc_smcmr) & (SMCMR_REN | SMCMR_TEN);
-		/* Output in *one* operation, so we don't interrupt RX/TX if they
-		 * were already enabled. */
+		/* Output in *one* operation, so we don't interrupt RX/TX if
+		 * they were already enabled.
+		 */
 		out_be16(&smcp->smc_smcmr, smcr_mk_clen(bits) | cval |
 		    SMCMR_SM_UART | prev_mode);
 	} else {
-		out_be16(&pinfo->sccup->scc_genscc.scc_mrblr, pinfo->rx_fifosize);
+		out_be16(&pinfo->sccup->scc_genscc.scc_mrblr,
+			 pinfo->rx_fifosize);
 		out_be16(&pinfo->sccup->scc_maxidl, maxidl);
 		out_be16(&sccp->scc_psmr, (sbits << 12) | scval);
 	}
@@ -770,7 +777,8 @@ static void cpm_uart_initbd(struct uart_cpm_port *pinfo)
 	 * buffers in the buffer descriptors, and the
 	 * virtual address for us to work with.
 	 */
-	mem_addr = pinfo->mem_addr + L1_CACHE_ALIGN(pinfo->rx_nrfifos * pinfo->rx_fifosize);
+	mem_addr = pinfo->mem_addr +
+		   L1_CACHE_ALIGN(pinfo->rx_nrfifos * pinfo->rx_fifosize);
 	bdp = pinfo->tx_cur = pinfo->tx_bd_base;
 	for (i = 0; i < (pinfo->tx_nrfifos - 1); i++, bdp++) {
 		out_be32(&bdp->cbd_bufaddr, cpu2cpm_addr(mem_addr, pinfo));
@@ -794,9 +802,9 @@ static void cpm_uart_init_scc(struct uart_cpm_port *pinfo)
 
 	/* Store address */
 	out_be16(&pinfo->sccup->scc_genscc.scc_rbase,
-	         (u8 __iomem *)pinfo->rx_bd_base - DPRAM_BASE);
+		 (u8 __iomem *)pinfo->rx_bd_base - DPRAM_BASE);
 	out_be16(&pinfo->sccup->scc_genscc.scc_tbase,
-	         (u8 __iomem *)pinfo->tx_bd_base - DPRAM_BASE);
+		 (u8 __iomem *)pinfo->tx_bd_base - DPRAM_BASE);
 
 	/* Set up the uart parameters in the
 	 * parameter ram.
@@ -833,7 +841,7 @@ static void cpm_uart_init_scc(struct uart_cpm_port *pinfo)
 	 */
 	out_be32(&scp->scc_gsmrh, 0);
 	out_be32(&scp->scc_gsmrl,
-	         SCC_GSMRL_MODE_UART | SCC_GSMRL_TDCR_16 | SCC_GSMRL_RDCR_16);
+		 SCC_GSMRL_MODE_UART | SCC_GSMRL_TDCR_16 | SCC_GSMRL_RDCR_16);
 
 	/* Enable rx interrupts  and clear all pending events.  */
 	out_be16(&scp->scc_sccm, 0);
@@ -856,14 +864,14 @@ static void cpm_uart_init_smc(struct uart_cpm_port *pinfo)
 
 	/* Store address */
 	out_be16(&pinfo->smcup->smc_rbase,
-	         (u8 __iomem *)pinfo->rx_bd_base - DPRAM_BASE);
+		 (u8 __iomem *)pinfo->rx_bd_base - DPRAM_BASE);
 	out_be16(&pinfo->smcup->smc_tbase,
-	         (u8 __iomem *)pinfo->tx_bd_base - DPRAM_BASE);
+		 (u8 __iomem *)pinfo->tx_bd_base - DPRAM_BASE);
 
 /*
  *  In case SMC1 is being relocated...
  */
-#if defined (CONFIG_I2C_SPI_SMC1_UCODE_PATCH)
+#if defined(CONFIG_I2C_SPI_SMC1_UCODE_PATCH)
 	out_be16(&up->smc_rbptr, in_be16(&pinfo->smcup->smc_rbase));
 	out_be16(&up->smc_tbptr, in_be16(&pinfo->smcup->smc_tbase));
 	out_be32(&up->smc_rstate, 0);
@@ -917,8 +925,10 @@ static int cpm_uart_request_port(struct uart_port *port)
 		clrbits8(&pinfo->smcp->smc_smcm, SMCM_RX | SMCM_TX);
 		clrbits16(&pinfo->smcp->smc_smcmr, SMCMR_REN | SMCMR_TEN);
 	} else {
-		clrbits16(&pinfo->sccp->scc_sccm, UART_SCCM_TX | UART_SCCM_RX);
-		clrbits32(&pinfo->sccp->scc_gsmrl, SCC_GSMRL_ENR | SCC_GSMRL_ENT);
+		clrbits16(&pinfo->sccp->scc_sccm,
+			  UART_SCCM_TX | UART_SCCM_RX);
+		clrbits32(&pinfo->sccp->scc_gsmrl,
+			  SCC_GSMRL_ENR | SCC_GSMRL_ENT);
 	}
 
 	ret = cpm_uart_allocbuf(pinfo, 0);
@@ -1048,9 +1058,10 @@ static void cpm_uart_early_write(struct uart_cpm_port *pinfo,
 static int poll_wait_key(char *obuf, struct uart_cpm_port *pinfo)
 {
 	u_char		c, *cp;
-	volatile cbd_t	*bdp;
 	int		i;
 
+	volatile cbd_t	*bdp;
+
 	/* Get the address of the host memory buffer.
 	 */
 	bdp = pinfo->rx_cur;
@@ -1138,7 +1149,7 @@ static void cpm_put_poll_char(struct uart_port *port,
 struct uart_cpm_port cpm_uart_ports[UART_NR];
 
 static int cpm_uart_init_port(struct device_node *np,
-                              struct uart_cpm_port *pinfo)
+			      struct uart_cpm_port *pinfo)
 {
 	const u32 *data;
 	void __iomem *mem, *pram;
@@ -1148,7 +1159,8 @@ static int cpm_uart_init_port(struct device_node *np,
 
 	data = of_get_property(np, "clock", NULL);
 	if (data) {
-		struct clk *clk = clk_get(NULL, (const char*)data);
+		struct clk *clk = clk_get(NULL, (const char *)data);
+
 		if (!IS_ERR(clk))
 			pinfo->clk = clk;
 	}
@@ -1156,7 +1168,7 @@ static int cpm_uart_init_port(struct device_node *np,
 		data = of_get_property(np, "fsl,cpm-brg", &len);
 		if (!data || len != 4) {
 			dev_err(port->dev, "CPM UART %pOFn has no/invalid "
-			                "fsl,cpm-brg property.\n", np);
+					   "fsl,cpm-brg property.\n", np);
 			return -EINVAL;
 		}
 		pinfo->brg = *data;
@@ -1165,7 +1177,7 @@ static int cpm_uart_init_port(struct device_node *np,
 	data = of_get_property(np, "fsl,cpm-command", &len);
 	if (!data || len != 4) {
 		dev_err(port->dev, "CPM UART %pOFn has no/invalid "
-		                "fsl,cpm-command property.\n", np);
+				   "fsl,cpm-command property.\n", np);
 		return -EINVAL;
 	}
 	pinfo->command = *data;
@@ -1179,7 +1191,7 @@ static int cpm_uart_init_port(struct device_node *np,
 		pinfo->sccp = mem;
 		pinfo->sccup = pram = cpm_uart_map_pram(pinfo, np);
 	} else if (of_device_is_compatible(np, "fsl,cpm1-smc-uart") ||
-	           of_device_is_compatible(np, "fsl,cpm2-smc-uart")) {
+		   of_device_is_compatible(np, "fsl,cpm2-smc-uart")) {
 		pinfo->flags |= FLAG_SMC;
 		pinfo->smcp = mem;
 		pinfo->smcup = pram = cpm_uart_map_pram(pinfo, np);
@@ -1266,19 +1278,17 @@ static void cpm_uart_console_write(struct console *co, const char *s,
 	unsigned long flags;
 	int nolock = oops_in_progress;
 
-	if (unlikely(nolock)) {
+	if (unlikely(nolock))
 		local_irq_save(flags);
-	} else {
+	else
 		spin_lock_irqsave(&pinfo->port.lock, flags);
-	}
 
 	cpm_uart_early_write(pinfo, s, count, true);
 
-	if (unlikely(nolock)) {
+	if (unlikely(nolock))
 		local_irq_restore(flags);
-	} else {
+	else
 		spin_unlock_irqrestore(&pinfo->port.lock, flags);
-	}
 }
 
 
@@ -1341,7 +1351,8 @@ static int __init cpm_uart_console_setup(struct console *co, char *options)
 		out_be16(&pinfo->sccup->scc_brkcr, 0);
 		cpm_line_cr_cmd(pinfo, CPM_CR_GRA_STOP_TX);
 		clrbits16(&pinfo->sccp->scc_sccm, UART_SCCM_TX | UART_SCCM_RX);
-		clrbits32(&pinfo->sccp->scc_gsmrl, SCC_GSMRL_ENR | SCC_GSMRL_ENT);
+		clrbits32(&pinfo->sccp->scc_gsmrl,
+			  SCC_GSMRL_ENR | SCC_GSMRL_ENT);
 	}
 
 	ret = cpm_uart_allocbuf(pinfo, 1);
@@ -1381,7 +1392,7 @@ static int __init cpm_uart_console_init(void)
 
 console_initcall(cpm_uart_console_init);
 
-#define CPM_UART_CONSOLE	&cpm_scc_uart_console
+#define CPM_UART_CONSOLE	(&cpm_scc_uart_console)
 #else
 #define CPM_UART_CONSOLE	NULL
 #endif
@@ -1424,6 +1435,7 @@ static int cpm_uart_probe(struct platform_device *ofdev)
 static int cpm_uart_remove(struct platform_device *ofdev)
 {
 	struct uart_cpm_port *pinfo = platform_get_drvdata(ofdev);
+
 	return uart_remove_one_port(&cpm_reg, &pinfo->port);
 }
 
@@ -1451,11 +1463,12 @@ static int cpm_uart_remove(struct platform_device *ofdev)
 	},
 	.probe = cpm_uart_probe,
 	.remove = cpm_uart_remove,
- };
+};
 
 static int __init cpm_uart_init(void)
 {
 	int ret = uart_register_driver(&cpm_reg);
+
 	if (ret)
 		return ret;
 
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_cpm1.h b/drivers/tty/serial/cpm_uart/cpm_uart_cpm1.h
index 18ec084..eafff96 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_cpm1.h
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_cpm1.h
@@ -16,13 +16,13 @@ static inline void cpm_set_brg(int brg, int baud)
 	cpm_setbrg(brg, baud);
 }
 
-static inline void cpm_set_scc_fcr(scc_uart_t __iomem * sup)
+static inline void cpm_set_scc_fcr(scc_uart_t __iomem *sup)
 {
 	out_8(&sup->scc_genscc.scc_rfcr, SMC_EB);
 	out_8(&sup->scc_genscc.scc_tfcr, SMC_EB);
 }
 
-static inline void cpm_set_smc_fcr(smc_uart_t __iomem * up)
+static inline void cpm_set_smc_fcr(smc_uart_t __iomem *up)
 {
 	out_8(&up->smc_rfcr, SMC_EB);
 	out_8(&up->smc_tfcr, SMC_EB);
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
index a0fccda..154ac19 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
@@ -117,8 +117,7 @@ int cpm_uart_allocbuf(struct uart_cpm_port *pinfo, unsigned int is_con)
 	if (is_con) {
 		mem_addr = kzalloc(memsz, GFP_NOWAIT);
 		dma_addr = virt_to_bus(mem_addr);
-	}
-	else
+	} else
 		mem_addr = dma_alloc_coherent(pinfo->port.dev, memsz, &dma_addr,
 					      GFP_KERNEL);
 
@@ -148,7 +147,8 @@ void cpm_uart_freebuf(struct uart_cpm_port *pinfo)
 	dma_free_coherent(pinfo->port.dev, L1_CACHE_ALIGN(pinfo->rx_nrfifos *
 							  pinfo->rx_fifosize) +
 			  L1_CACHE_ALIGN(pinfo->tx_nrfifos *
-					 pinfo->tx_fifosize), (void __force *)pinfo->mem_addr,
+					 pinfo->tx_fifosize),
+			  (void __force *)pinfo->mem_addr,
 			  pinfo->dma_addr);
 
 	cpm_dpfree(pinfo->dp_addr);
-- 
1.9.1

