Return-Path: <linuxppc-dev+bounces-9285-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8875AD50CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 12:04:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHLpW4Dn0z30MZ;
	Wed, 11 Jun 2025 20:03:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749636227;
	cv=none; b=AN2mAJWBcL+OmEXTzY9Z462fGe31YaBVuRdSkxZb0mdxCmjAU9P5oIzRtBxoSiJ2s4uDZW3jjX0AXeVXXjRyvdp8phF8BnGmXHzqXpYFDn/53E1Wx4DYRc3KwEuOIU6okULf05dVEcBIQAGsU4B9/eTcW/QoPrxZKGupJWGHY9X+itIjikJQLGUvnOiupPu+3bb4j1ZRx9OBXFHd37cngCKnJez3+sV0AR2BzPaaoxjiFWRVnspaP1KXp/WvUANPGDb+Jh2FjK0my5V4HBLpqTm82V/9xYMyrWA0qLg6YZLLhG2O9uaVV6oNgRR7DR4dZJSbdHDXKCDfj+mx2WRdkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749636227; c=relaxed/relaxed;
	bh=KKrTP5lp3Unbr1wREdJDcVDZ5eTpzdD9nIeamPRMUDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ErzbV9rzyipCh9nAggdxeNx8QycKZJijQ0GP6x/XDIA98+B9eRBlRt0SCuEC4Qv20uQGhR3Kwv0mdZ98y4Z8yOQ1eKLSRniyacjc+wosgeaqEpaKFpw6kULgaO1fwuQSVYW+XBADN+B/CxMS1Rh4Fm3jmZ4KTOlIJKwtBPY7Y8dmPwknLulgD3fSCeIVb7VABjiG/tggVXKn8eVG8/J/fmLIg4KEHuhpXZprTI3s6ltVacgKW1BYfsgjGPwN92HIE9QpMFq4L4GmxvIxXMkD2UhHR8etMqIm947bld43/++Aw+LXmLbkcDr8TVoMlwygRjlrHTKl3UUjQPyIj5Jsig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gSHzIZMV; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gSHzIZMV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHLpV1VtSz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 20:03:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86486629EC;
	Wed, 11 Jun 2025 10:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB90C4CEF2;
	Wed, 11 Jun 2025 10:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749636223;
	bh=WnNh6Rm9Jg/5QW7kY8rxY/asPnz6gmr/Wc6rb4KEVVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gSHzIZMVLV69bRYINCRFNUMLUTYDU0vxl6UqXKftZ/QTsTnzxo/aO5jQhccphsJOg
	 Cv0pVQAf4rsYJq/ATeNFZ6C3MDdu+0RtwXwHFr9o2gFMg3EYEVLvgjZ7aLYINPVmXi
	 JwYCSpcY4yEwRLB6HMif7MihNAipdZiaUfLsduDnMzeurlLmXvNAJGxu5W3u46Htni
	 sdBolxL+Z7eDSPM6ijoUZmqYPKbrXwMiy2vvnC5yvZQ3XO2hfyjgTnuXvyOX1beo61
	 0TdqK5YHneN6JW2SQF8z+Bdt3v3Y8DfxPQTcNBSsvHzO1oVtTVJnpL1mjhz/4zwsfu
	 SavGm0vQjveew==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/33] serial: 8250: sanitize uart_port::serial_{in,out}() types
Date: Wed, 11 Jun 2025 12:02:54 +0200
Message-ID: <20250611100319.186924-9-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611100319.186924-1-jirislaby@kernel.org>
References: <20250611100319.186924-1-jirislaby@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

uart_port::{serial_in,serial_out} (and plat_serial8250_port::* likewise)
historically use:
* 'unsigned int' for 32-bit register values in reads and writes, and
* 'int' for offsets.

Make them sane such that:
* 'u32' is used for register values, and
* 'unsigned int' is used for offsets.

While at it, name hooks' parameters, so it is clear what is what.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
---
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mips@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/powerpc/kernel/legacy_serial.c     |  7 ++---
 drivers/tty/serial/8250/8250_dw.c       | 34 ++++++++++++-------------
 drivers/tty/serial/8250/8250_em.c       |  4 +--
 drivers/tty/serial/8250/8250_ingenic.c  |  8 +++---
 drivers/tty/serial/8250/8250_ioc3.c     |  4 +--
 drivers/tty/serial/8250/8250_lpc18xx.c  |  2 +-
 drivers/tty/serial/8250/8250_pci.c      |  6 ++---
 drivers/tty/serial/8250/8250_port.c     | 30 +++++++++++-----------
 drivers/tty/serial/8250/8250_rt288x.c   |  4 +--
 drivers/tty/serial/8250/8250_uniphier.c |  4 +--
 include/linux/serial_8250.h             |  4 +--
 include/linux/serial_core.h             |  4 +--
 12 files changed, 56 insertions(+), 55 deletions(-)

diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index a874eb8e000b..ae1906bfe8a5 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -54,9 +54,10 @@ static int legacy_serial_console = -1;
 static const upf_t legacy_port_flags = UPF_BOOT_AUTOCONF | UPF_SKIP_TEST |
 	UPF_SHARE_IRQ | UPF_FIXED_PORT;
 
-static unsigned int tsi_serial_in(struct uart_port *p, int offset)
+static u32 tsi_serial_in(struct uart_port *p, unsigned int offset)
 {
-	unsigned int tmp;
+	u32 tmp;
+
 	offset = offset << p->regshift;
 	if (offset == UART_IIR) {
 		tmp = readl(p->membase + (UART_IIR & ~3));
@@ -65,7 +66,7 @@ static unsigned int tsi_serial_in(struct uart_port *p, int offset)
 		return readb(p->membase + offset);
 }
 
-static void tsi_serial_out(struct uart_port *p, int offset, int value)
+static void tsi_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
 	offset = offset << p->regshift;
 	if (!((offset == UART_IER) && (value & UART_IER_UUE)))
diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 1902f29444a1..0a22f0cb8896 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -67,8 +67,8 @@ struct dw8250_data {
 	struct dw8250_port_data	data;
 	const struct dw8250_platform_data *pdata;
 
-	int			msr_mask_on;
-	int			msr_mask_off;
+	u32			msr_mask_on;
+	u32			msr_mask_off;
 	struct clk		*clk;
 	struct clk		*pclk;
 	struct notifier_block	clk_notifier;
@@ -94,7 +94,7 @@ static inline struct dw8250_data *work_to_dw8250_data(struct work_struct *work)
 	return container_of(work, struct dw8250_data, clk_work);
 }
 
-static inline int dw8250_modify_msr(struct uart_port *p, int offset, int value)
+static inline u32 dw8250_modify_msr(struct uart_port *p, unsigned int offset, u32 value)
 {
 	struct dw8250_data *d = to_dw8250_data(p->private_data);
 
@@ -145,7 +145,7 @@ static void dw8250_force_idle(struct uart_port *p)
  * routine. Hence, it must not call serial_port_out() or serial_out()
  * against the modified registers here, i.e. LCR.
  */
-static void dw8250_check_lcr(struct uart_port *p, int offset, int value)
+static void dw8250_check_lcr(struct uart_port *p, unsigned int offset, u32 value)
 {
 	struct dw8250_data *d = to_dw8250_data(p->private_data);
 	void __iomem *addr = p->membase + (offset << p->regshift);
@@ -156,7 +156,7 @@ static void dw8250_check_lcr(struct uart_port *p, int offset, int value)
 
 	/* Make sure LCR write wasn't ignored */
 	while (tries--) {
-		unsigned int lcr = serial_port_in(p, offset);
+		u32 lcr = serial_port_in(p, offset);
 
 		if ((value & ~UART_LCR_SPAR) == (lcr & ~UART_LCR_SPAR))
 			return;
@@ -205,13 +205,13 @@ static void dw8250_tx_wait_empty(struct uart_port *p)
 	}
 }
 
-static void dw8250_serial_out(struct uart_port *p, int offset, int value)
+static void dw8250_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
 	writeb(value, p->membase + (offset << p->regshift));
 	dw8250_check_lcr(p, offset, value);
 }
 
-static void dw8250_serial_out38x(struct uart_port *p, int offset, int value)
+static void dw8250_serial_out38x(struct uart_port *p, unsigned int offset, u32 value)
 {
 	/* Allow the TX to drain before we reconfigure */
 	if (offset == UART_LCR)
@@ -220,22 +220,22 @@ static void dw8250_serial_out38x(struct uart_port *p, int offset, int value)
 	dw8250_serial_out(p, offset, value);
 }
 
-static unsigned int dw8250_serial_in(struct uart_port *p, int offset)
+static u32 dw8250_serial_in(struct uart_port *p, unsigned int offset)
 {
-	unsigned int value = readb(p->membase + (offset << p->regshift));
+	u32 value = readb(p->membase + (offset << p->regshift));
 
 	return dw8250_modify_msr(p, offset, value);
 }
 
 #ifdef CONFIG_64BIT
-static unsigned int dw8250_serial_inq(struct uart_port *p, int offset)
+static u32 dw8250_serial_inq(struct uart_port *p, unsigned int offset)
 {
 	u8 value = __raw_readq(p->membase + (offset << p->regshift));
 
 	return dw8250_modify_msr(p, offset, value);
 }
 
-static void dw8250_serial_outq(struct uart_port *p, int offset, int value)
+static void dw8250_serial_outq(struct uart_port *p, unsigned int offset, u32 value)
 {
 	value &= 0xff;
 	__raw_writeq(value, p->membase + (offset << p->regshift));
@@ -246,28 +246,28 @@ static void dw8250_serial_outq(struct uart_port *p, int offset, int value)
 }
 #endif /* CONFIG_64BIT */
 
-static void dw8250_serial_out32(struct uart_port *p, int offset, int value)
+static void dw8250_serial_out32(struct uart_port *p, unsigned int offset, u32 value)
 {
 	writel(value, p->membase + (offset << p->regshift));
 	dw8250_check_lcr(p, offset, value);
 }
 
-static unsigned int dw8250_serial_in32(struct uart_port *p, int offset)
+static u32 dw8250_serial_in32(struct uart_port *p, unsigned int offset)
 {
-	unsigned int value = readl(p->membase + (offset << p->regshift));
+	u32 value = readl(p->membase + (offset << p->regshift));
 
 	return dw8250_modify_msr(p, offset, value);
 }
 
-static void dw8250_serial_out32be(struct uart_port *p, int offset, int value)
+static void dw8250_serial_out32be(struct uart_port *p, unsigned int offset, u32 value)
 {
 	iowrite32be(value, p->membase + (offset << p->regshift));
 	dw8250_check_lcr(p, offset, value);
 }
 
-static unsigned int dw8250_serial_in32be(struct uart_port *p, int offset)
+static u32 dw8250_serial_in32be(struct uart_port *p, unsigned int offset)
 {
-       unsigned int value = ioread32be(p->membase + (offset << p->regshift));
+       u32 value = ioread32be(p->membase + (offset << p->regshift));
 
        return dw8250_modify_msr(p, offset, value);
 }
diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
index 35094f884492..e90c71494944 100644
--- a/drivers/tty/serial/8250/8250_em.c
+++ b/drivers/tty/serial/8250/8250_em.c
@@ -59,7 +59,7 @@ static void serial8250_em_serial_out_helper(struct uart_port *p, int offset,
 	}
 }
 
-static unsigned int serial8250_em_serial_in(struct uart_port *p, int offset)
+static u32 serial8250_em_serial_in(struct uart_port *p, unsigned int offset)
 {
 	switch (offset) {
 	case UART_RX: /* RX @ 0x00 */
@@ -119,7 +119,7 @@ static void serial8250_em_reg_update(struct uart_port *p, int off, int value)
 	serial8250_em_serial_out_helper(p, UART_HCR0_EM, hcr0);
 }
 
-static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
+static void serial8250_em_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
 	switch (offset) {
 	case UART_TX:
diff --git a/drivers/tty/serial/8250/8250_ingenic.c b/drivers/tty/serial/8250/8250_ingenic.c
index a73dd3773640..94542fc143c2 100644
--- a/drivers/tty/serial/8250/8250_ingenic.c
+++ b/drivers/tty/serial/8250/8250_ingenic.c
@@ -168,9 +168,9 @@ OF_EARLYCON_DECLARE(jz4780_uart, "ingenic,jz4780-uart",
 OF_EARLYCON_DECLARE(x1000_uart, "ingenic,x1000-uart",
 		    ingenic_early_console_setup);
 
-static void ingenic_uart_serial_out(struct uart_port *p, int offset, int value)
+static void ingenic_uart_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
-	int ier;
+	u32 ier;
 
 	switch (offset) {
 	case UART_FCR:
@@ -206,9 +206,9 @@ static void ingenic_uart_serial_out(struct uart_port *p, int offset, int value)
 	writeb(value, p->membase + (offset << p->regshift));
 }
 
-static unsigned int ingenic_uart_serial_in(struct uart_port *p, int offset)
+static u32 ingenic_uart_serial_in(struct uart_port *p, unsigned int offset)
 {
-	unsigned int value;
+	u8 value;
 
 	value = readb(p->membase + (offset << p->regshift));
 
diff --git a/drivers/tty/serial/8250/8250_ioc3.c b/drivers/tty/serial/8250/8250_ioc3.c
index 499e80aa4cf9..3ebda9a5d07d 100644
--- a/drivers/tty/serial/8250/8250_ioc3.c
+++ b/drivers/tty/serial/8250/8250_ioc3.c
@@ -21,12 +21,12 @@ struct ioc3_8250_data {
 	int line;
 };
 
-static unsigned int ioc3_serial_in(struct uart_port *p, int offset)
+static u32 ioc3_serial_in(struct uart_port *p, unsigned int offset)
 {
 	return readb(p->membase + (offset ^ 3));
 }
 
-static void ioc3_serial_out(struct uart_port *p, int offset, int value)
+static void ioc3_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
 	writeb(value, p->membase + (offset ^ 3));
 }
diff --git a/drivers/tty/serial/8250/8250_lpc18xx.c b/drivers/tty/serial/8250/8250_lpc18xx.c
index d52445948da0..6c0489c9c253 100644
--- a/drivers/tty/serial/8250/8250_lpc18xx.c
+++ b/drivers/tty/serial/8250/8250_lpc18xx.c
@@ -67,7 +67,7 @@ static int lpc18xx_rs485_config(struct uart_port *port, struct ktermios *termios
 	return 0;
 }
 
-static void lpc18xx_uart_serial_out(struct uart_port *p, int offset, int value)
+static void lpc18xx_uart_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
 	/*
 	 * For DMA mode one must ensure that the UART_FCR_DMA_SELECT
diff --git a/drivers/tty/serial/8250/8250_pci.c b/drivers/tty/serial/8250/8250_pci.c
index 73c200127b08..152f914c599d 100644
--- a/drivers/tty/serial/8250/8250_pci.c
+++ b/drivers/tty/serial/8250/8250_pci.c
@@ -1751,7 +1751,7 @@ static int pci_fintek_init(struct pci_dev *dev)
 	return max_port;
 }
 
-static void f815xxa_mem_serial_out(struct uart_port *p, int offset, int value)
+static void f815xxa_mem_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
 	struct f815xxa_data *data = p->private_data;
 	unsigned long flags;
@@ -1846,10 +1846,10 @@ static void kt_handle_break(struct uart_port *p)
 	serial8250_clear_and_reinit_fifos(up);
 }
 
-static unsigned int kt_serial_in(struct uart_port *p, int offset)
+static u32 kt_serial_in(struct uart_port *p, unsigned int offset)
 {
 	struct uart_8250_port *up = up_to_u8250p(p);
-	unsigned int val;
+	u32 val;
 
 	/*
 	 * When the Intel ME (management engine) gets reset its serial
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 6d7b8c4667c9..f5407832e8a7 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -339,14 +339,14 @@ static void default_serial_dl_write(struct uart_8250_port *up, u32 value)
 }
 
 #ifdef CONFIG_HAS_IOPORT
-static unsigned int hub6_serial_in(struct uart_port *p, int offset)
+static u32 hub6_serial_in(struct uart_port *p, unsigned int offset)
 {
 	offset = offset << p->regshift;
 	outb(p->hub6 - 1 + offset, p->iobase);
 	return inb(p->iobase + 1);
 }
 
-static void hub6_serial_out(struct uart_port *p, int offset, int value)
+static void hub6_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
 	offset = offset << p->regshift;
 	outb(p->hub6 - 1 + offset, p->iobase);
@@ -354,73 +354,73 @@ static void hub6_serial_out(struct uart_port *p, int offset, int value)
 }
 #endif /* CONFIG_HAS_IOPORT */
 
-static unsigned int mem_serial_in(struct uart_port *p, int offset)
+static u32 mem_serial_in(struct uart_port *p, unsigned int offset)
 {
 	offset = offset << p->regshift;
 	return readb(p->membase + offset);
 }
 
-static void mem_serial_out(struct uart_port *p, int offset, int value)
+static void mem_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
 	offset = offset << p->regshift;
 	writeb(value, p->membase + offset);
 }
 
-static void mem16_serial_out(struct uart_port *p, int offset, int value)
+static void mem16_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
 	offset = offset << p->regshift;
 	writew(value, p->membase + offset);
 }
 
-static unsigned int mem16_serial_in(struct uart_port *p, int offset)
+static u32 mem16_serial_in(struct uart_port *p, unsigned int offset)
 {
 	offset = offset << p->regshift;
 	return readw(p->membase + offset);
 }
 
-static void mem32_serial_out(struct uart_port *p, int offset, int value)
+static void mem32_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
 	offset = offset << p->regshift;
 	writel(value, p->membase + offset);
 }
 
-static unsigned int mem32_serial_in(struct uart_port *p, int offset)
+static u32 mem32_serial_in(struct uart_port *p, unsigned int offset)
 {
 	offset = offset << p->regshift;
 	return readl(p->membase + offset);
 }
 
-static void mem32be_serial_out(struct uart_port *p, int offset, int value)
+static void mem32be_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
 	offset = offset << p->regshift;
 	iowrite32be(value, p->membase + offset);
 }
 
-static unsigned int mem32be_serial_in(struct uart_port *p, int offset)
+static u32 mem32be_serial_in(struct uart_port *p, unsigned int offset)
 {
 	offset = offset << p->regshift;
 	return ioread32be(p->membase + offset);
 }
 
 #ifdef CONFIG_HAS_IOPORT
-static unsigned int io_serial_in(struct uart_port *p, int offset)
+static u32 io_serial_in(struct uart_port *p, unsigned int offset)
 {
 	offset = offset << p->regshift;
 	return inb(p->iobase + offset);
 }
 
-static void io_serial_out(struct uart_port *p, int offset, int value)
+static void io_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
 	offset = offset << p->regshift;
 	outb(value, p->iobase + offset);
 }
 #endif
-static unsigned int no_serial_in(struct uart_port *p, int offset)
+static u32 no_serial_in(struct uart_port *p, unsigned int offset)
 {
-	return (unsigned int)-1;
+	return ~0U;
 }
 
-static void no_serial_out(struct uart_port *p, int offset, int value)
+static void no_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
 }
 
diff --git a/drivers/tty/serial/8250/8250_rt288x.c b/drivers/tty/serial/8250/8250_rt288x.c
index 6415ca8d3adf..bf28b8a9a710 100644
--- a/drivers/tty/serial/8250/8250_rt288x.c
+++ b/drivers/tty/serial/8250/8250_rt288x.c
@@ -33,7 +33,7 @@ static const u8 au_io_out_map[5] = {
 	[UART_MCR]	= 6,
 };
 
-static unsigned int au_serial_in(struct uart_port *p, int offset)
+static u32 au_serial_in(struct uart_port *p, unsigned int offset)
 {
 	if (offset >= ARRAY_SIZE(au_io_in_map))
 		return UINT_MAX;
@@ -42,7 +42,7 @@ static unsigned int au_serial_in(struct uart_port *p, int offset)
 	return __raw_readl(p->membase + (offset << p->regshift));
 }
 
-static void au_serial_out(struct uart_port *p, int offset, int value)
+static void au_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
 	if (offset >= ARRAY_SIZE(au_io_out_map))
 		return;
diff --git a/drivers/tty/serial/8250/8250_uniphier.c b/drivers/tty/serial/8250/8250_uniphier.c
index 4874a9632db3..e3db60bf50c9 100644
--- a/drivers/tty/serial/8250/8250_uniphier.c
+++ b/drivers/tty/serial/8250/8250_uniphier.c
@@ -63,7 +63,7 @@ OF_EARLYCON_DECLARE(uniphier, "socionext,uniphier-uart",
  * The register map is slightly different from that of 8250.
  * IO callbacks must be overridden for correct access to FCR, LCR, MCR and SCR.
  */
-static unsigned int uniphier_serial_in(struct uart_port *p, int offset)
+static u32 uniphier_serial_in(struct uart_port *p, unsigned int offset)
 {
 	unsigned int valshift = 0;
 
@@ -92,7 +92,7 @@ static unsigned int uniphier_serial_in(struct uart_port *p, int offset)
 	return (readl(p->membase + offset) >> valshift) & 0xff;
 }
 
-static void uniphier_serial_out(struct uart_port *p, int offset, int value)
+static void uniphier_serial_out(struct uart_port *p, unsigned int offset, u32 value)
 {
 	unsigned int valshift = 0;
 	bool normal = false;
diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
index 144de7a7948d..01efdce0fda0 100644
--- a/include/linux/serial_8250.h
+++ b/include/linux/serial_8250.h
@@ -46,8 +46,8 @@ struct plat_serial8250_port {
 	unsigned int	type;		/* If UPF_FIXED_TYPE */
 	upf_t		flags;		/* UPF_* flags */
 	u16		bugs;		/* port bugs */
-	unsigned int	(*serial_in)(struct uart_port *, int);
-	void		(*serial_out)(struct uart_port *, int, int);
+	u32		(*serial_in)(struct uart_port *, unsigned int offset);
+	void		(*serial_out)(struct uart_port *, unsigned int offset, u32 val);
 	u32		(*dl_read)(struct uart_8250_port *up);
 	void		(*dl_write)(struct uart_8250_port *up, u32 value);
 	void		(*set_termios)(struct uart_port *,
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 914b5e97e056..d65b15449cfe 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -443,8 +443,8 @@ struct uart_port {
 	spinlock_t		lock;			/* port lock */
 	unsigned long		iobase;			/* in/out[bwl] */
 	unsigned char __iomem	*membase;		/* read/write[bwl] */
-	unsigned int		(*serial_in)(struct uart_port *, int);
-	void			(*serial_out)(struct uart_port *, int, int);
+	u32			(*serial_in)(struct uart_port *, unsigned int offset);
+	void			(*serial_out)(struct uart_port *, unsigned int offset, u32 val);
 	void			(*set_termios)(struct uart_port *,
 				               struct ktermios *new,
 				               const struct ktermios *old);
-- 
2.49.0


