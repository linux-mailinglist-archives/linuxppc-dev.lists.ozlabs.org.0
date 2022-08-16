Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E905964EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 23:50:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6lFk42qGz3f24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 07:50:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nXP9fV56;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nXP9fV56;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6V6l3GD4z3bbQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 21:58:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660651135; x=1692187135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1bh+UGysoUhStctNsjINRe0spSsNdt49PHyq4TTPmPY=;
  b=nXP9fV56+uWRlRde8ysqDql1gwIcziRLZu7jfXP/gNXDEBbScRnZWlSv
   skUgKsO+1QWEflYawmvitLVGs5YSwwm12S7XJVOjACjWt9Dt1BBjF6zwg
   w0ESkZzw+CUnQoZy7uBnX5tnYTnTsUv4lXjTixeH+R3yeV0ov7GYu2Z/4
   cGKLxG2iIRTpD1mpKesvbtqCXBI+7ehfK0Sj0U5/054zbs6ZpIqkHq6Cl
   +2UQp0SODXmhiEPnUON8c9Hp6fFEGKpoHetbn43K07bivrGFD0JEpx0Hf
   3QgAvfR54xPX6oc2xVwDvz7vXOL9hzblu7q7DjshFdmjEVaUylqRyLfqO
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="279159445"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="279159445"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 04:58:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="667080831"
Received: from tturcu-mobl1.ger.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.252.51.153])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 04:58:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Al Cooper <alcooperx@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Tobias Klauser <tklauser@distanz.ch>,
	Russell King <linux@armlinux.org.uk>,
	Vineet Gupta <vgupta@kernel.org>,
	Richard Genoud <richard.genoud@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Alexander Shiyan <shc_work@mail.ru>,
	Baruch Siach <baruch@tkos.co.il>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Gabriel Somlo <gsomlo@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Kevin Cernekee <cernekee@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"David S. Miller" <davem@davemloft.net>,
	Hammer Hsieh <hammerh0314@gmail.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Timur Tabi <timur@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-snps-arc@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-unisoc@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	sparclinux@vger.kernel.org
Subject: [PATCH 6/8] serial: Make ->set_termios() old ktermios const
Date: Tue, 16 Aug 2022 14:57:37 +0300
Message-Id: <20220816115739.10928-7-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220816115739.10928-1-ilpo.jarvinen@linux.intel.com>
References: <20220816115739.10928-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 Aug 2022 07:48:41 +1000
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
Cc: Johan Hovold <johan@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There should be no reason to adjust old ktermios which is going to get
discarded anyway.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/tty/serial/21285.c                  |  2 +-
 drivers/tty/serial/8250/8250_bcm7271.c      |  2 +-
 drivers/tty/serial/8250/8250_dw.c           |  2 +-
 drivers/tty/serial/8250/8250_dwlib.c        |  3 ++-
 drivers/tty/serial/8250/8250_dwlib.h        |  2 +-
 drivers/tty/serial/8250/8250_fintek.c       |  2 +-
 drivers/tty/serial/8250/8250_lpss.c         |  2 +-
 drivers/tty/serial/8250/8250_mid.c          |  5 ++---
 drivers/tty/serial/8250/8250_mtk.c          |  2 +-
 drivers/tty/serial/8250/8250_omap.c         |  2 +-
 drivers/tty/serial/8250/8250_port.c         |  6 +++---
 drivers/tty/serial/altera_jtaguart.c        |  4 ++--
 drivers/tty/serial/altera_uart.c            |  2 +-
 drivers/tty/serial/amba-pl010.c             |  2 +-
 drivers/tty/serial/amba-pl011.c             |  4 ++--
 drivers/tty/serial/apbuart.c                |  2 +-
 drivers/tty/serial/ar933x_uart.c            |  2 +-
 drivers/tty/serial/arc_uart.c               |  2 +-
 drivers/tty/serial/atmel_serial.c           |  5 +++--
 drivers/tty/serial/bcm63xx_uart.c           |  5 ++---
 drivers/tty/serial/clps711x.c               |  2 +-
 drivers/tty/serial/cpm_uart/cpm_uart_core.c |  2 +-
 drivers/tty/serial/digicolor-usart.c        |  2 +-
 drivers/tty/serial/dz.c                     |  2 +-
 drivers/tty/serial/fsl_linflexuart.c        |  2 +-
 drivers/tty/serial/fsl_lpuart.c             |  4 ++--
 drivers/tty/serial/icom.c                   |  5 ++---
 drivers/tty/serial/imx.c                    |  2 +-
 drivers/tty/serial/ip22zilog.c              |  2 +-
 drivers/tty/serial/jsm/jsm_tty.c            |  4 ++--
 drivers/tty/serial/lantiq.c                 |  4 ++--
 drivers/tty/serial/liteuart.c               |  2 +-
 drivers/tty/serial/lpc32xx_hs.c             |  2 +-
 drivers/tty/serial/max3100.c                |  2 +-
 drivers/tty/serial/max310x.c                |  2 +-
 drivers/tty/serial/mcf.c                    |  2 +-
 drivers/tty/serial/men_z135_uart.c          |  4 ++--
 drivers/tty/serial/meson_uart.c             |  2 +-
 drivers/tty/serial/milbeaut_usio.c          |  3 ++-
 drivers/tty/serial/mpc52xx_uart.c           | 12 ++++++------
 drivers/tty/serial/mps2-uart.c              |  2 +-
 drivers/tty/serial/msm_serial.c             |  2 +-
 drivers/tty/serial/mux.c                    |  2 +-
 drivers/tty/serial/mvebu-uart.c             |  2 +-
 drivers/tty/serial/mxs-auart.c              |  2 +-
 drivers/tty/serial/omap-serial.c            |  2 +-
 drivers/tty/serial/owl-uart.c               |  2 +-
 drivers/tty/serial/pch_uart.c               |  3 ++-
 drivers/tty/serial/pic32_uart.c             |  2 +-
 drivers/tty/serial/pmac_zilog.c             |  4 ++--
 drivers/tty/serial/pxa.c                    |  2 +-
 drivers/tty/serial/qcom_geni_serial.c       |  3 ++-
 drivers/tty/serial/rda-uart.c               |  2 +-
 drivers/tty/serial/rp2.c                    |  5 ++---
 drivers/tty/serial/sa1100.c                 |  2 +-
 drivers/tty/serial/samsung_tty.c            |  2 +-
 drivers/tty/serial/sb1250-duart.c           |  2 +-
 drivers/tty/serial/sc16is7xx.c              |  2 +-
 drivers/tty/serial/sccnxp.c                 |  3 ++-
 drivers/tty/serial/serial-tegra.c           |  3 ++-
 drivers/tty/serial/serial_core.c            |  2 +-
 drivers/tty/serial/serial_txx9.c            |  2 +-
 drivers/tty/serial/sh-sci.c                 |  2 +-
 drivers/tty/serial/sifive.c                 |  2 +-
 drivers/tty/serial/sprd_serial.c            |  5 ++---
 drivers/tty/serial/st-asc.c                 |  2 +-
 drivers/tty/serial/stm32-usart.c            |  2 +-
 drivers/tty/serial/sunhv.c                  |  2 +-
 drivers/tty/serial/sunplus-uart.c           |  2 +-
 drivers/tty/serial/sunsab.c                 |  2 +-
 drivers/tty/serial/sunsu.c                  |  2 +-
 drivers/tty/serial/sunzilog.c               |  2 +-
 drivers/tty/serial/tegra-tcu.c              |  2 +-
 drivers/tty/serial/timbuart.c               |  4 ++--
 drivers/tty/serial/uartlite.c               |  5 +++--
 drivers/tty/serial/ucc_uart.c               |  3 ++-
 drivers/tty/serial/vt8500_serial.c          |  2 +-
 drivers/tty/serial/xilinx_uartps.c          |  3 ++-
 drivers/tty/serial/zs.c                     |  2 +-
 drivers/tty/tty_ioctl.c                     |  2 +-
 include/linux/serial_8250.h                 |  4 ++--
 include/linux/serial_core.h                 |  6 +++---
 82 files changed, 117 insertions(+), 112 deletions(-)

diff --git a/drivers/tty/serial/21285.c b/drivers/tty/serial/21285.c
index 7520cc02fd4d..2f17bf4b221e 100644
--- a/drivers/tty/serial/21285.c
+++ b/drivers/tty/serial/21285.c
@@ -243,7 +243,7 @@ static void serial21285_shutdown(struct uart_port *port)
 
 static void
 serial21285_set_termios(struct uart_port *port, struct ktermios *termios,
-			struct ktermios *old)
+			const struct ktermios *old)
 {
 	unsigned long flags;
 	unsigned int baud, quot, h_lcr, b;
diff --git a/drivers/tty/serial/8250/8250_bcm7271.c b/drivers/tty/serial/8250/8250_bcm7271.c
index 8efdc271eb75..fa8ccf204d86 100644
--- a/drivers/tty/serial/8250/8250_bcm7271.c
+++ b/drivers/tty/serial/8250/8250_bcm7271.c
@@ -755,7 +755,7 @@ static void set_clock_mux(struct uart_port *up, struct brcmuart_priv *priv,
 
 static void brcmstb_set_termios(struct uart_port *up,
 				struct ktermios *termios,
-				struct ktermios *old)
+				const struct ktermios *old)
 {
 	struct uart_8250_port *p8250 = up_to_u8250p(up);
 	struct brcmuart_priv *priv = up->private_data;
diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index a604b42e4458..7db51781289e 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -350,7 +350,7 @@ dw8250_do_pm(struct uart_port *port, unsigned int state, unsigned int old)
 }
 
 static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
-			       struct ktermios *old)
+			       const struct ktermios *old)
 {
 	unsigned long newrate = tty_termios_baud_rate(termios) * 16;
 	struct dw8250_data *d = to_dw8250_data(p->private_data);
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index dbe4d44f60d4..75f32f054ebb 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -92,7 +92,8 @@ static void dw8250_set_divisor(struct uart_port *p, unsigned int baud,
 	serial8250_do_set_divisor(p, baud, quot, quot_frac);
 }
 
-void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, struct ktermios *old)
+void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios,
+			   const struct ktermios *old)
 {
 	p->status &= ~UPSTAT_AUTOCTS;
 	if (termios->c_cflag & CRTSCTS)
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 055bfdc87985..f13e91f2cace 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -47,7 +47,7 @@ struct dw8250_data {
 	unsigned int		uart_16550_compatible:1;
 };
 
-void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, struct ktermios *old);
+void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, const struct ktermios *old);
 void dw8250_setup_port(struct uart_port *p);
 
 static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
diff --git a/drivers/tty/serial/8250/8250_fintek.c b/drivers/tty/serial/8250/8250_fintek.c
index 65b6b3cbaff6..e2aa2a1a02dd 100644
--- a/drivers/tty/serial/8250/8250_fintek.c
+++ b/drivers/tty/serial/8250/8250_fintek.c
@@ -278,7 +278,7 @@ static void fintek_8250_set_max_fifo(struct fintek_8250 *pdata)
 
 static void fintek_8250_set_termios(struct uart_port *port,
 				    struct ktermios *termios,
-				    struct ktermios *old)
+				    const struct ktermios *old)
 {
 	struct fintek_8250 *pdata = port->private_data;
 	unsigned int baud = tty_termios_baud_rate(termios);
diff --git a/drivers/tty/serial/8250/8250_lpss.c b/drivers/tty/serial/8250/8250_lpss.c
index 4ba43bef9933..44cc755b1a29 100644
--- a/drivers/tty/serial/8250/8250_lpss.c
+++ b/drivers/tty/serial/8250/8250_lpss.c
@@ -70,7 +70,7 @@ static inline struct lpss8250 *to_lpss8250(struct dw8250_port_data *data)
 }
 
 static void byt_set_termios(struct uart_port *p, struct ktermios *termios,
-			    struct ktermios *old)
+			    const struct ktermios *old)
 {
 	unsigned int baud = tty_termios_baud_rate(termios);
 	struct lpss8250 *lpss = to_lpss8250(p->private_data);
diff --git a/drivers/tty/serial/8250/8250_mid.c b/drivers/tty/serial/8250/8250_mid.c
index a2a03acb04ad..2cc78a4bf7a1 100644
--- a/drivers/tty/serial/8250/8250_mid.c
+++ b/drivers/tty/serial/8250/8250_mid.c
@@ -206,9 +206,8 @@ static void dnv_exit(struct mid8250 *mid)
 
 /*****************************************************************************/
 
-static void mid8250_set_termios(struct uart_port *p,
-				struct ktermios *termios,
-				struct ktermios *old)
+static void mid8250_set_termios(struct uart_port *p, struct ktermios *termios,
+				const struct ktermios *old)
 {
 	unsigned int baud = tty_termios_baud_rate(termios);
 	struct mid8250 *mid = p->private_data;
diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index 54051ec7b499..fb1d5ec0940e 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -291,7 +291,7 @@ static void mtk8250_set_flow_ctrl(struct uart_8250_port *up, int mode)
 
 static void
 mtk8250_set_termios(struct uart_port *port, struct ktermios *termios,
-			struct ktermios *old)
+		    const struct ktermios *old)
 {
 	static const unsigned short fraction_L_mapping[] = {
 		0, 1, 0x5, 0x15, 0x55, 0x57, 0x57, 0x77, 0x7F, 0xFF, 0xFF
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 0dcecbbc3967..b43894e15b07 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -350,7 +350,7 @@ static void omap8250_restore_regs(struct uart_8250_port *up)
  */
 static void omap_8250_set_termios(struct uart_port *port,
 				  struct ktermios *termios,
-				  struct ktermios *old)
+				  const struct ktermios *old)
 {
 	struct uart_8250_port *up = up_to_u8250p(port);
 	struct omap8250_priv *priv = up->port.private_data;
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 39b35a61958c..bd3207611f64 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2651,7 +2651,7 @@ static void serial8250_set_divisor(struct uart_port *port, unsigned int baud,
 
 static unsigned int serial8250_get_baud_rate(struct uart_port *port,
 					     struct ktermios *termios,
-					     struct ktermios *old)
+					     const struct ktermios *old)
 {
 	unsigned int tolerance = port->uartclk / 100;
 	unsigned int min;
@@ -2737,7 +2737,7 @@ EXPORT_SYMBOL_GPL(serial8250_update_uartclk);
 
 void
 serial8250_do_set_termios(struct uart_port *port, struct ktermios *termios,
-			  struct ktermios *old)
+		          const struct ktermios *old)
 {
 	struct uart_8250_port *up = up_to_u8250p(port);
 	unsigned char cval;
@@ -2875,7 +2875,7 @@ EXPORT_SYMBOL(serial8250_do_set_termios);
 
 static void
 serial8250_set_termios(struct uart_port *port, struct ktermios *termios,
-		       struct ktermios *old)
+		       const struct ktermios *old)
 {
 	if (port->set_termios)
 		port->set_termios(port, termios, old);
diff --git a/drivers/tty/serial/altera_jtaguart.c b/drivers/tty/serial/altera_jtaguart.c
index cb791c5149a3..23f339757894 100644
--- a/drivers/tty/serial/altera_jtaguart.c
+++ b/drivers/tty/serial/altera_jtaguart.c
@@ -106,8 +106,8 @@ static void altera_jtaguart_break_ctl(struct uart_port *port, int break_state)
 }
 
 static void altera_jtaguart_set_termios(struct uart_port *port,
-					struct ktermios *termios,
-					struct ktermios *old)
+				        struct ktermios *termios,
+				        const struct ktermios *old)
 {
 	/* Just copy the old termios settings back */
 	if (old)
diff --git a/drivers/tty/serial/altera_uart.c b/drivers/tty/serial/altera_uart.c
index 8b749ed557c6..a38db2cb8dc1 100644
--- a/drivers/tty/serial/altera_uart.c
+++ b/drivers/tty/serial/altera_uart.c
@@ -175,7 +175,7 @@ static void altera_uart_break_ctl(struct uart_port *port, int break_state)
 
 static void altera_uart_set_termios(struct uart_port *port,
 				    struct ktermios *termios,
-				    struct ktermios *old)
+				    const struct ktermios *old)
 {
 	unsigned long flags;
 	unsigned int baud, baudclk;
diff --git a/drivers/tty/serial/amba-pl010.c b/drivers/tty/serial/amba-pl010.c
index fae0b581ff42..af27fb8ec145 100644
--- a/drivers/tty/serial/amba-pl010.c
+++ b/drivers/tty/serial/amba-pl010.c
@@ -370,7 +370,7 @@ static void pl010_shutdown(struct uart_port *port)
 
 static void
 pl010_set_termios(struct uart_port *port, struct ktermios *termios,
-		     struct ktermios *old)
+		  const struct ktermios *old)
 {
 	unsigned int lcr_h, old_cr;
 	unsigned long flags;
diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 15f0e4d88c5a..39f79bc5aba1 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -2030,7 +2030,7 @@ pl011_setup_status_masks(struct uart_port *port, struct ktermios *termios)
 
 static void
 pl011_set_termios(struct uart_port *port, struct ktermios *termios,
-		     struct ktermios *old)
+		  const struct ktermios *old)
 {
 	struct uart_amba_port *uap =
 	    container_of(port, struct uart_amba_port, port);
@@ -2162,7 +2162,7 @@ pl011_set_termios(struct uart_port *port, struct ktermios *termios,
 
 static void
 sbsa_uart_set_termios(struct uart_port *port, struct ktermios *termios,
-		      struct ktermios *old)
+		      const struct ktermios *old)
 {
 	struct uart_amba_port *uap =
 	    container_of(port, struct uart_amba_port, port);
diff --git a/drivers/tty/serial/apbuart.c b/drivers/tty/serial/apbuart.c
index 9ef82d870ff2..450f4edfda0f 100644
--- a/drivers/tty/serial/apbuart.c
+++ b/drivers/tty/serial/apbuart.c
@@ -228,7 +228,7 @@ static void apbuart_shutdown(struct uart_port *port)
 }
 
 static void apbuart_set_termios(struct uart_port *port,
-				struct ktermios *termios, struct ktermios *old)
+				struct ktermios *termios, const struct ktermios *old)
 {
 	unsigned int cr;
 	unsigned long flags;
diff --git a/drivers/tty/serial/ar933x_uart.c b/drivers/tty/serial/ar933x_uart.c
index 32caeac12985..0a4020dba165 100644
--- a/drivers/tty/serial/ar933x_uart.c
+++ b/drivers/tty/serial/ar933x_uart.c
@@ -283,7 +283,7 @@ static void ar933x_uart_get_scale_step(unsigned int clk,
 
 static void ar933x_uart_set_termios(struct uart_port *port,
 				    struct ktermios *new,
-				    struct ktermios *old)
+				    const struct ktermios *old)
 {
 	struct ar933x_uart_port *up =
 		container_of(port, struct ar933x_uart_port, port);
diff --git a/drivers/tty/serial/arc_uart.c b/drivers/tty/serial/arc_uart.c
index 2a09e92ef9ed..2a65ea2660e1 100644
--- a/drivers/tty/serial/arc_uart.c
+++ b/drivers/tty/serial/arc_uart.c
@@ -351,7 +351,7 @@ static void arc_serial_shutdown(struct uart_port *port)
 
 static void
 arc_serial_set_termios(struct uart_port *port, struct ktermios *new,
-		       struct ktermios *old)
+		       const struct ktermios *old)
 {
 	struct arc_uart_port *uart = to_arc_port(port);
 	unsigned int baud, uartl, uarth, hw_val;
diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 30ba9eef7b39..a85169aa839d 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -2124,8 +2124,9 @@ static void atmel_serial_pm(struct uart_port *port, unsigned int state,
 /*
  * Change the port parameters
  */
-static void atmel_set_termios(struct uart_port *port, struct ktermios *termios,
-			      struct ktermios *old)
+static void atmel_set_termios(struct uart_port *port,
+			      struct ktermios *termios,
+			      const struct ktermios *old)
 {
 	struct atmel_uart_port *atmel_port = to_atmel_uart_port(port);
 	unsigned long flags;
diff --git a/drivers/tty/serial/bcm63xx_uart.c b/drivers/tty/serial/bcm63xx_uart.c
index 53b43174aa40..5d9737c2d1f2 100644
--- a/drivers/tty/serial/bcm63xx_uart.c
+++ b/drivers/tty/serial/bcm63xx_uart.c
@@ -492,9 +492,8 @@ static void bcm_uart_shutdown(struct uart_port *port)
 /*
  * serial core request to change current uart setting
  */
-static void bcm_uart_set_termios(struct uart_port *port,
-				 struct ktermios *new,
-				 struct ktermios *old)
+static void bcm_uart_set_termios(struct uart_port *port, struct ktermios *new,
+				 const struct ktermios *old)
 {
 	unsigned int ctl, baud, quot, ier;
 	unsigned long flags;
diff --git a/drivers/tty/serial/clps711x.c b/drivers/tty/serial/clps711x.c
index b9b66ad31a08..404b43a5ae33 100644
--- a/drivers/tty/serial/clps711x.c
+++ b/drivers/tty/serial/clps711x.c
@@ -251,7 +251,7 @@ static void uart_clps711x_shutdown(struct uart_port *port)
 
 static void uart_clps711x_set_termios(struct uart_port *port,
 				      struct ktermios *termios,
-				      struct ktermios *old)
+				      const struct ktermios *old)
 {
 	u32 ubrlcr;
 	unsigned int baud, quot;
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
index db07d6a5d764..a4713cb0304d 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
@@ -484,7 +484,7 @@ static void cpm_uart_shutdown(struct uart_port *port)
 
 static void cpm_uart_set_termios(struct uart_port *port,
                                  struct ktermios *termios,
-                                 struct ktermios *old)
+                                 const struct ktermios *old)
 {
 	int baud;
 	unsigned long flags;
diff --git a/drivers/tty/serial/digicolor-usart.c b/drivers/tty/serial/digicolor-usart.c
index af951e6a2ef4..0c0a62346f23 100644
--- a/drivers/tty/serial/digicolor-usart.c
+++ b/drivers/tty/serial/digicolor-usart.c
@@ -287,7 +287,7 @@ static void digicolor_uart_shutdown(struct uart_port *port)
 
 static void digicolor_uart_set_termios(struct uart_port *port,
 				       struct ktermios *termios,
-				       struct ktermios *old)
+				       const struct ktermios *old)
 {
 	unsigned int baud, divisor;
 	u8 config = 0;
diff --git a/drivers/tty/serial/dz.c b/drivers/tty/serial/dz.c
index 3eaf4e85bfdd..829b452daee9 100644
--- a/drivers/tty/serial/dz.c
+++ b/drivers/tty/serial/dz.c
@@ -559,7 +559,7 @@ static void dz_reset(struct dz_port *dport)
 }
 
 static void dz_set_termios(struct uart_port *uport, struct ktermios *termios,
-			   struct ktermios *old_termios)
+			   const struct ktermios *old_termios)
 {
 	struct dz_port *dport = to_dport(uport);
 	unsigned long flags;
diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
index 98bb0c315e13..84e8153e5420 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -401,7 +401,7 @@ static void linflex_shutdown(struct uart_port *port)
 
 static void
 linflex_set_termios(struct uart_port *port, struct ktermios *termios,
-		    struct ktermios *old)
+		    const struct ktermios *old)
 {
 	unsigned long flags;
 	unsigned long cr, old_cr, cr1;
diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index f6c33cd228c8..71539802f5a9 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -1833,7 +1833,7 @@ static void lpuart32_shutdown(struct uart_port *port)
 
 static void
 lpuart_set_termios(struct uart_port *port, struct ktermios *termios,
-		   struct ktermios *old)
+		   const struct ktermios *old)
 {
 	struct lpuart_port *sport = container_of(port, struct lpuart_port, port);
 	unsigned long flags;
@@ -2073,7 +2073,7 @@ static void lpuart32_serial_setbrg(struct lpuart_port *sport,
 
 static void
 lpuart32_set_termios(struct uart_port *port, struct ktermios *termios,
-		   struct ktermios *old)
+		     const struct ktermios *old)
 {
 	struct lpuart_port *sport = container_of(port, struct lpuart_port, port);
 	unsigned long flags;
diff --git a/drivers/tty/serial/icom.c b/drivers/tty/serial/icom.c
index 45df29947fe8..819f957b6b84 100644
--- a/drivers/tty/serial/icom.c
+++ b/drivers/tty/serial/icom.c
@@ -1351,9 +1351,8 @@ static void icom_close(struct uart_port *port)
 	kref_put(&icom_port->adapter->kref, icom_kref_release);
 }
 
-static void icom_set_termios(struct uart_port *port,
-			     struct ktermios *termios,
-			     struct ktermios *old_termios)
+static void icom_set_termios(struct uart_port *port, struct ktermios *termios,
+			     const struct ktermios *old_termios)
 {
 	struct icom_port *icom_port = to_icom_port(port);
 	int baud;
diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 522445a8f666..5875ee66492b 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -1620,7 +1620,7 @@ static void imx_uart_flush_buffer(struct uart_port *port)
 
 static void
 imx_uart_set_termios(struct uart_port *port, struct ktermios *termios,
-		     struct ktermios *old)
+		     const struct ktermios *old)
 {
 	struct imx_port *sport = (struct imx_port *)port;
 	unsigned long flags;
diff --git a/drivers/tty/serial/ip22zilog.c b/drivers/tty/serial/ip22zilog.c
index 655e64b26852..dd0a8915ce4f 100644
--- a/drivers/tty/serial/ip22zilog.c
+++ b/drivers/tty/serial/ip22zilog.c
@@ -873,7 +873,7 @@ ip22zilog_convert_to_zs(struct uart_ip22zilog_port *up, unsigned int cflag,
 /* The port lock is not held.  */
 static void
 ip22zilog_set_termios(struct uart_port *port, struct ktermios *termios,
-		      struct ktermios *old)
+		      const struct ktermios *old)
 {
 	struct uart_ip22zilog_port *up =
 		container_of(port, struct uart_ip22zilog_port, port);
diff --git a/drivers/tty/serial/jsm/jsm_tty.c b/drivers/tty/serial/jsm/jsm_tty.c
index cb58bdec2f43..222afc270c88 100644
--- a/drivers/tty/serial/jsm/jsm_tty.c
+++ b/drivers/tty/serial/jsm/jsm_tty.c
@@ -300,8 +300,8 @@ static void jsm_tty_close(struct uart_port *port)
 }
 
 static void jsm_tty_set_termios(struct uart_port *port,
-				 struct ktermios *termios,
-				 struct ktermios *old_termios)
+				struct ktermios *termios,
+				const struct ktermios *old_termios)
 {
 	unsigned long lock_flags;
 	struct jsm_channel *channel =
diff --git a/drivers/tty/serial/lantiq.c b/drivers/tty/serial/lantiq.c
index a3120c3347dd..6637b3caa6b7 100644
--- a/drivers/tty/serial/lantiq.c
+++ b/drivers/tty/serial/lantiq.c
@@ -405,8 +405,8 @@ lqasc_shutdown(struct uart_port *port)
 }
 
 static void
-lqasc_set_termios(struct uart_port *port,
-	struct ktermios *new, struct ktermios *old)
+lqasc_set_termios(struct uart_port *port, struct ktermios *new,
+		  const struct ktermios *old)
 {
 	unsigned int cflag;
 	unsigned int iflag;
diff --git a/drivers/tty/serial/liteuart.c b/drivers/tty/serial/liteuart.c
index 328b50521f14..4c0604325ee9 100644
--- a/drivers/tty/serial/liteuart.c
+++ b/drivers/tty/serial/liteuart.c
@@ -178,7 +178,7 @@ static void liteuart_shutdown(struct uart_port *port)
 }
 
 static void liteuart_set_termios(struct uart_port *port, struct ktermios *new,
-				 struct ktermios *old)
+				 const struct ktermios *old)
 {
 	unsigned int baud;
 	unsigned long flags;
diff --git a/drivers/tty/serial/lpc32xx_hs.c b/drivers/tty/serial/lpc32xx_hs.c
index 93140cac1ca1..0d5ef7df27d0 100644
--- a/drivers/tty/serial/lpc32xx_hs.c
+++ b/drivers/tty/serial/lpc32xx_hs.c
@@ -493,7 +493,7 @@ static void serial_lpc32xx_shutdown(struct uart_port *port)
 /* port->lock is not held.  */
 static void serial_lpc32xx_set_termios(struct uart_port *port,
 				       struct ktermios *termios,
-				       struct ktermios *old)
+				       const struct ktermios *old)
 {
 	unsigned long flags;
 	unsigned int baud, quot;
diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index 0b5f21fbb53d..c69602f356fd 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -418,7 +418,7 @@ static void max3100_set_mctrl(struct uart_port *port, unsigned int mctrl)
 
 static void
 max3100_set_termios(struct uart_port *port, struct ktermios *termios,
-		    struct ktermios *old)
+		    const struct ktermios *old)
 {
 	struct max3100_port *s = container_of(port,
 					      struct max3100_port,
diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
index ab10ca4a45b5..724049a7a97d 100644
--- a/drivers/tty/serial/max310x.c
+++ b/drivers/tty/serial/max310x.c
@@ -906,7 +906,7 @@ static void max310x_break_ctl(struct uart_port *port, int break_state)
 
 static void max310x_set_termios(struct uart_port *port,
 				struct ktermios *termios,
-				struct ktermios *old)
+				const struct ktermios *old)
 {
 	unsigned int lcr = 0, flow = 0;
 	int baud;
diff --git a/drivers/tty/serial/mcf.c b/drivers/tty/serial/mcf.c
index f4aaaadd0742..b1cd9a76dd93 100644
--- a/drivers/tty/serial/mcf.c
+++ b/drivers/tty/serial/mcf.c
@@ -192,7 +192,7 @@ static void mcf_shutdown(struct uart_port *port)
 /****************************************************************************/
 
 static void mcf_set_termios(struct uart_port *port, struct ktermios *termios,
-	struct ktermios *old)
+			    const struct ktermios *old)
 {
 	unsigned long flags;
 	unsigned int baud, baudclk;
diff --git a/drivers/tty/serial/men_z135_uart.c b/drivers/tty/serial/men_z135_uart.c
index 12117b596e73..3690f5cf0f43 100644
--- a/drivers/tty/serial/men_z135_uart.c
+++ b/drivers/tty/serial/men_z135_uart.c
@@ -646,8 +646,8 @@ static void men_z135_shutdown(struct uart_port *port)
 }
 
 static void men_z135_set_termios(struct uart_port *port,
-				struct ktermios *termios,
-				struct ktermios *old)
+				 struct ktermios *termios,
+				 const struct ktermios *old)
 {
 	struct men_z135_port *uart = to_men_z135(port);
 	unsigned int baud;
diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 6c8db19fd572..f52534141b5a 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -335,7 +335,7 @@ static void meson_uart_change_speed(struct uart_port *port, unsigned long baud)
 
 static void meson_uart_set_termios(struct uart_port *port,
 				   struct ktermios *termios,
-				   struct ktermios *old)
+				   const struct ktermios *old)
 {
 	unsigned int cflags, iflags, baud;
 	unsigned long flags;
diff --git a/drivers/tty/serial/milbeaut_usio.c b/drivers/tty/serial/milbeaut_usio.c
index 347088bb380e..c15e0d84dc7e 100644
--- a/drivers/tty/serial/milbeaut_usio.c
+++ b/drivers/tty/serial/milbeaut_usio.c
@@ -298,7 +298,8 @@ static void mlb_usio_shutdown(struct uart_port *port)
 }
 
 static void mlb_usio_set_termios(struct uart_port *port,
-			struct ktermios *termios, struct ktermios *old)
+				 struct ktermios *termios,
+				 const struct ktermios *old)
 {
 	unsigned int escr, smr = MLB_USIO_SMR_SOE;
 	unsigned long flags, baud, quot;
diff --git a/drivers/tty/serial/mpc52xx_uart.c b/drivers/tty/serial/mpc52xx_uart.c
index 3f1986c89694..6f09b1cb3e1c 100644
--- a/drivers/tty/serial/mpc52xx_uart.c
+++ b/drivers/tty/serial/mpc52xx_uart.c
@@ -101,7 +101,7 @@ struct psc_ops {
 	void		(*cw_restore_ints)(struct uart_port *port);
 	unsigned int	(*set_baudrate)(struct uart_port *port,
 					struct ktermios *new,
-					struct ktermios *old);
+					const struct ktermios *old);
 	int		(*clock_alloc)(struct uart_port *port);
 	void		(*clock_relse)(struct uart_port *port);
 	int		(*clock)(struct uart_port *port, int enable);
@@ -287,7 +287,7 @@ static void mpc52xx_psc_cw_restore_ints(struct uart_port *port)
 
 static unsigned int mpc5200_psc_set_baudrate(struct uart_port *port,
 					     struct ktermios *new,
-					     struct ktermios *old)
+					     const struct ktermios *old)
 {
 	unsigned int baud;
 	unsigned int divisor;
@@ -305,7 +305,7 @@ static unsigned int mpc5200_psc_set_baudrate(struct uart_port *port,
 
 static unsigned int mpc5200b_psc_set_baudrate(struct uart_port *port,
 					      struct ktermios *new,
-					      struct ktermios *old)
+					      const struct ktermios *old)
 {
 	unsigned int baud;
 	unsigned int divisor;
@@ -533,7 +533,7 @@ static void mpc512x_psc_cw_restore_ints(struct uart_port *port)
 
 static unsigned int mpc512x_psc_set_baudrate(struct uart_port *port,
 					     struct ktermios *new,
-					     struct ktermios *old)
+					     const struct ktermios *old)
 {
 	unsigned int baud;
 	unsigned int divisor;
@@ -880,7 +880,7 @@ static inline void mpc5125_set_divisor(struct mpc5125_psc __iomem *psc,
 
 static unsigned int mpc5125_psc_set_baudrate(struct uart_port *port,
 					     struct ktermios *new,
-					     struct ktermios *old)
+					     const struct ktermios *old)
 {
 	unsigned int baud;
 	unsigned int divisor;
@@ -1167,7 +1167,7 @@ mpc52xx_uart_shutdown(struct uart_port *port)
 
 static void
 mpc52xx_uart_set_termios(struct uart_port *port, struct ktermios *new,
-			 struct ktermios *old)
+			 const struct ktermios *old)
 {
 	unsigned long flags;
 	unsigned char mr1, mr2;
diff --git a/drivers/tty/serial/mps2-uart.c b/drivers/tty/serial/mps2-uart.c
index 5e9429dcc51f..2e3e6cf16817 100644
--- a/drivers/tty/serial/mps2-uart.c
+++ b/drivers/tty/serial/mps2-uart.c
@@ -358,7 +358,7 @@ static void mps2_uart_shutdown(struct uart_port *port)
 
 static void
 mps2_uart_set_termios(struct uart_port *port, struct ktermios *termios,
-		      struct ktermios *old)
+		      const struct ktermios *old)
 {
 	unsigned long flags;
 	unsigned int baud, bauddiv;
diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 3159889ddae1..7dd19a281579 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -1263,7 +1263,7 @@ static void msm_shutdown(struct uart_port *port)
 }
 
 static void msm_set_termios(struct uart_port *port, struct ktermios *termios,
-			    struct ktermios *old)
+			    const struct ktermios *old)
 {
 	struct msm_port *msm_port = to_msm_port(port);
 	struct msm_dma *dma = &msm_port->rx_dma;
diff --git a/drivers/tty/serial/mux.c b/drivers/tty/serial/mux.c
index 0ba0f4d9459d..ed0e763f622a 100644
--- a/drivers/tty/serial/mux.c
+++ b/drivers/tty/serial/mux.c
@@ -289,7 +289,7 @@ static void mux_shutdown(struct uart_port *port)
  */
 static void
 mux_set_termios(struct uart_port *port, struct ktermios *termios,
-	        struct ktermios *old)
+	        const struct ktermios *old)
 {
 }
 
diff --git a/drivers/tty/serial/mvebu-uart.c b/drivers/tty/serial/mvebu-uart.c
index 65eaecd10b7c..ba16e1da6bd3 100644
--- a/drivers/tty/serial/mvebu-uart.c
+++ b/drivers/tty/serial/mvebu-uart.c
@@ -564,7 +564,7 @@ static unsigned int mvebu_uart_baud_rate_set(struct uart_port *port, unsigned in
 
 static void mvebu_uart_set_termios(struct uart_port *port,
 				   struct ktermios *termios,
-				   struct ktermios *old)
+				   const struct ktermios *old)
 {
 	unsigned long flags;
 	unsigned int baud, min_baud, max_baud;
diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 1944daf8593a..d21a4f3ef2fe 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -959,7 +959,7 @@ static int mxs_auart_dma_init(struct mxs_auart_port *s)
 #define CTS_AT_AUART()	!mctrl_gpio_to_gpiod(s->gpios, UART_GPIO_CTS)
 static void mxs_auart_settermios(struct uart_port *u,
 				 struct ktermios *termios,
-				 struct ktermios *old)
+				 const struct ktermios *old)
 {
 	struct mxs_auart_port *s = to_auart_port(u);
 	u32 ctrl, ctrl2, div;
diff --git a/drivers/tty/serial/omap-serial.c b/drivers/tty/serial/omap-serial.c
index 0aa666e247d5..c87d85b901a7 100644
--- a/drivers/tty/serial/omap-serial.c
+++ b/drivers/tty/serial/omap-serial.c
@@ -802,7 +802,7 @@ static void serial_omap_uart_qos_work(struct work_struct *work)
 
 static void
 serial_omap_set_termios(struct uart_port *port, struct ktermios *termios,
-			struct ktermios *old)
+			const struct ktermios *old)
 {
 	struct uart_omap_port *up = to_uart_omap_port(port);
 	unsigned char cval = 0;
diff --git a/drivers/tty/serial/owl-uart.c b/drivers/tty/serial/owl-uart.c
index 888e17e3f25f..fde39cc1145d 100644
--- a/drivers/tty/serial/owl-uart.c
+++ b/drivers/tty/serial/owl-uart.c
@@ -328,7 +328,7 @@ static void owl_uart_change_baudrate(struct owl_uart_port *owl_port,
 
 static void owl_uart_set_termios(struct uart_port *port,
 				 struct ktermios *termios,
-				 struct ktermios *old)
+				 const struct ktermios *old)
 {
 	struct owl_uart_port *owl_port = to_owl_uart_port(port);
 	unsigned int baud;
diff --git a/drivers/tty/serial/pch_uart.c b/drivers/tty/serial/pch_uart.c
index 8a9065e4a903..11ba5df0618f 100644
--- a/drivers/tty/serial/pch_uart.c
+++ b/drivers/tty/serial/pch_uart.c
@@ -1301,7 +1301,8 @@ static void pch_uart_shutdown(struct uart_port *port)
  *bits.  Update read_status_mask and ignore_status_mask to indicate
  *the types of events we are interested in receiving.  */
 static void pch_uart_set_termios(struct uart_port *port,
-				 struct ktermios *termios, struct ktermios *old)
+				 struct ktermios *termios,
+				 const struct ktermios *old)
 {
 	int rtn;
 	unsigned int baud, parity, bits, stb;
diff --git a/drivers/tty/serial/pic32_uart.c b/drivers/tty/serial/pic32_uart.c
index f418f1de66b3..2b8ba0702b70 100644
--- a/drivers/tty/serial/pic32_uart.c
+++ b/drivers/tty/serial/pic32_uart.c
@@ -609,7 +609,7 @@ static void pic32_uart_shutdown(struct uart_port *port)
 /* serial core request to change current uart setting */
 static void pic32_uart_set_termios(struct uart_port *port,
 				   struct ktermios *new,
-				   struct ktermios *old)
+				   const struct ktermios *old)
 {
 	struct pic32_sport *sport = to_pic32_sport(port);
 	unsigned int baud;
diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
index f63257b8e872..fe2e4ec423f7 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -1202,7 +1202,7 @@ static void pmz_irda_setup(struct uart_pmac_port *uap, unsigned long *baud)
 
 
 static void __pmz_set_termios(struct uart_port *port, struct ktermios *termios,
-			      struct ktermios *old)
+			      const struct ktermios *old)
 {
 	struct uart_pmac_port *uap = to_pmz(port);
 	unsigned long baud;
@@ -1244,7 +1244,7 @@ static void __pmz_set_termios(struct uart_port *port, struct ktermios *termios,
 
 /* The port lock is not held.  */
 static void pmz_set_termios(struct uart_port *port, struct ktermios *termios,
-			    struct ktermios *old)
+			    const struct ktermios *old)
 {
 	struct uart_pmac_port *uap = to_pmz(port);
 	unsigned long flags;
diff --git a/drivers/tty/serial/pxa.c b/drivers/tty/serial/pxa.c
index 9309ffd87c8e..2d25231fad84 100644
--- a/drivers/tty/serial/pxa.c
+++ b/drivers/tty/serial/pxa.c
@@ -423,7 +423,7 @@ static void serial_pxa_shutdown(struct uart_port *port)
 
 static void
 serial_pxa_set_termios(struct uart_port *port, struct ktermios *termios,
-		       struct ktermios *old)
+		       const struct ktermios *old)
 {
 	struct uart_pxa_port *up = (struct uart_pxa_port *)port;
 	unsigned char cval, fcr = 0;
diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index f4698a064a4d..52182f6a5444 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1005,7 +1005,8 @@ static unsigned long get_clk_div_rate(struct clk *clk, unsigned int baud,
 }
 
 static void qcom_geni_serial_set_termios(struct uart_port *uport,
-				struct ktermios *termios, struct ktermios *old)
+					 struct ktermios *termios,
+					 const struct ktermios *old)
 {
 	unsigned int baud;
 	u32 bits_per_char;
diff --git a/drivers/tty/serial/rda-uart.c b/drivers/tty/serial/rda-uart.c
index feb2054aba37..0e387e2144fa 100644
--- a/drivers/tty/serial/rda-uart.c
+++ b/drivers/tty/serial/rda-uart.c
@@ -238,7 +238,7 @@ static void rda_uart_change_baudrate(struct rda_uart_port *rda_port,
 
 static void rda_uart_set_termios(struct uart_port *port,
 				 struct ktermios *termios,
-				 struct ktermios *old)
+				 const struct ktermios *old)
 {
 	struct rda_uart_port *rda_port = to_rda_uart_port(port);
 	unsigned long flags;
diff --git a/drivers/tty/serial/rp2.c b/drivers/tty/serial/rp2.c
index 6689d8add8f7..b81afb06f1f4 100644
--- a/drivers/tty/serial/rp2.c
+++ b/drivers/tty/serial/rp2.c
@@ -370,9 +370,8 @@ static void __rp2_uart_set_termios(struct rp2_uart_port *up,
 	       up->ucode + RP2_RX_SWFLOW);
 }
 
-static void rp2_uart_set_termios(struct uart_port *port,
-				 struct ktermios *new,
-				 struct ktermios *old)
+static void rp2_uart_set_termios(struct uart_port *port, struct ktermios *new,
+				 const struct ktermios *old)
 {
 	struct rp2_uart_port *up = port_to_up(port);
 	unsigned long flags;
diff --git a/drivers/tty/serial/sa1100.c b/drivers/tty/serial/sa1100.c
index e64e42a19d1a..dd9e3253cab4 100644
--- a/drivers/tty/serial/sa1100.c
+++ b/drivers/tty/serial/sa1100.c
@@ -409,7 +409,7 @@ static void sa1100_shutdown(struct uart_port *port)
 
 static void
 sa1100_set_termios(struct uart_port *port, struct ktermios *termios,
-		   struct ktermios *old)
+		   const struct ktermios *old)
 {
 	struct sa1100_port *sport =
 		container_of(port, struct sa1100_port, port);
diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index b7a4b47ce74e..77d1363029f5 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1530,7 +1530,7 @@ static const u16 udivslot_table[16] = {
 
 static void s3c24xx_serial_set_termios(struct uart_port *port,
 				       struct ktermios *termios,
-				       struct ktermios *old)
+				       const struct ktermios *old)
 {
 	const struct s3c2410_uartcfg *cfg = s3c24xx_port_to_cfg(port);
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
index 2cf8533ef760..c5d2b6cdcb4a 100644
--- a/drivers/tty/serial/sb1250-duart.c
+++ b/drivers/tty/serial/sb1250-duart.c
@@ -531,7 +531,7 @@ static void sbd_init_port(struct sbd_port *sport)
 }
 
 static void sbd_set_termios(struct uart_port *uport, struct ktermios *termios,
-			    struct ktermios *old_termios)
+			    const struct ktermios *old_termios)
 {
 	struct sbd_port *sport = to_sport(uport);
 	unsigned int mode1 = 0, mode2 = 0, aux = 0;
diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16is7xx.c
index 259e08cc347c..5ecf8f90eb5c 100644
--- a/drivers/tty/serial/sc16is7xx.c
+++ b/drivers/tty/serial/sc16is7xx.c
@@ -1015,7 +1015,7 @@ static void sc16is7xx_break_ctl(struct uart_port *port, int break_state)
 
 static void sc16is7xx_set_termios(struct uart_port *port,
 				  struct ktermios *termios,
-				  struct ktermios *old)
+				  const struct ktermios *old)
 {
 	struct sc16is7xx_port *s = dev_get_drvdata(port->dev);
 	struct sc16is7xx_one *one = to_sc16is7xx_one(port, port);
diff --git a/drivers/tty/serial/sccnxp.c b/drivers/tty/serial/sccnxp.c
index c56de2e104d4..dd98509f52e5 100644
--- a/drivers/tty/serial/sccnxp.c
+++ b/drivers/tty/serial/sccnxp.c
@@ -636,7 +636,8 @@ static void sccnxp_break_ctl(struct uart_port *port, int break_state)
 }
 
 static void sccnxp_set_termios(struct uart_port *port,
-			       struct ktermios *termios, struct ktermios *old)
+			       struct ktermios *termios,
+			       const struct ktermios *old)
 {
 	struct sccnxp_port *s = dev_get_drvdata(port->dev);
 	unsigned long flags;
diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index ad4f3567ff90..da2993fc2f04 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -1271,7 +1271,8 @@ static void tegra_uart_enable_ms(struct uart_port *u)
 }
 
 static void tegra_uart_set_termios(struct uart_port *u,
-		struct ktermios *termios, struct ktermios *oldtermios)
+				   struct ktermios *termios,
+				   const struct ktermios *oldtermios)
 {
 	struct tegra_uart_port *tup = to_tegra_uport(u);
 	unsigned int baud;
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 12c87cd201a7..c8295904b331 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -380,7 +380,7 @@ EXPORT_SYMBOL(uart_update_timeout);
  */
 unsigned int
 uart_get_baud_rate(struct uart_port *port, struct ktermios *termios,
-		   struct ktermios *old, unsigned int min, unsigned int max)
+		   const struct ktermios *old, unsigned int min, unsigned int max)
 {
 	unsigned int try;
 	unsigned int baud;
diff --git a/drivers/tty/serial/serial_txx9.c b/drivers/tty/serial/serial_txx9.c
index 228e380db080..e12f1dc18c38 100644
--- a/drivers/tty/serial/serial_txx9.c
+++ b/drivers/tty/serial/serial_txx9.c
@@ -594,7 +594,7 @@ static void serial_txx9_shutdown(struct uart_port *up)
 
 static void
 serial_txx9_set_termios(struct uart_port *up, struct ktermios *termios,
-		       struct ktermios *old)
+			const struct ktermios *old)
 {
 	unsigned int cval, fcr = 0;
 	unsigned long flags;
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 0075a1420005..9ad3663b5152 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2367,7 +2367,7 @@ static void sci_reset(struct uart_port *port)
 }
 
 static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
-			    struct ktermios *old)
+		            const struct ktermios *old)
 {
 	unsigned int baud, smr_val = SCSMR_ASYNC, scr_val = 0, i, bits;
 	unsigned int brr = 255, cks = 0, srr = 15, dl = 0, sccks = 0;
diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 5c3a07546a58..4761f172103a 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -646,7 +646,7 @@ static int sifive_serial_clk_notifier(struct notifier_block *nb,
 
 static void sifive_serial_set_termios(struct uart_port *port,
 				      struct ktermios *termios,
-				      struct ktermios *old)
+				      const struct ktermios *old)
 {
 	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
 	unsigned long flags;
diff --git a/drivers/tty/serial/sprd_serial.c b/drivers/tty/serial/sprd_serial.c
index 4329b9c9cbf0..342a87967631 100644
--- a/drivers/tty/serial/sprd_serial.c
+++ b/drivers/tty/serial/sprd_serial.c
@@ -771,9 +771,8 @@ static void sprd_shutdown(struct uart_port *port)
 	devm_free_irq(port->dev, port->irq, port);
 }
 
-static void sprd_set_termios(struct uart_port *port,
-			     struct ktermios *termios,
-			     struct ktermios *old)
+static void sprd_set_termios(struct uart_port *port, struct ktermios *termios,
+		             const struct ktermios *old)
 {
 	unsigned int baud, quot;
 	unsigned int lcr = 0, fc;
diff --git a/drivers/tty/serial/st-asc.c b/drivers/tty/serial/st-asc.c
index cce42f4c9bc2..fcecea689a0d 100644
--- a/drivers/tty/serial/st-asc.c
+++ b/drivers/tty/serial/st-asc.c
@@ -500,7 +500,7 @@ static void asc_pm(struct uart_port *port, unsigned int state,
 }
 
 static void asc_set_termios(struct uart_port *port, struct ktermios *termios,
-			    struct ktermios *old)
+			    const struct ktermios *old)
 {
 	struct asc_port *ascport = to_asc_port(port);
 	struct gpio_desc *gpiod;
diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 2c85dbf165c4..0b18615b2ca4 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1089,7 +1089,7 @@ static void stm32_usart_shutdown(struct uart_port *port)
 
 static void stm32_usart_set_termios(struct uart_port *port,
 				    struct ktermios *termios,
-				    struct ktermios *old)
+				    const struct ktermios *old)
 {
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
diff --git a/drivers/tty/serial/sunhv.c b/drivers/tty/serial/sunhv.c
index eafada8fb6fa..1938ba5e98c0 100644
--- a/drivers/tty/serial/sunhv.c
+++ b/drivers/tty/serial/sunhv.c
@@ -323,7 +323,7 @@ static void sunhv_shutdown(struct uart_port *port)
 
 /* port->lock is not held.  */
 static void sunhv_set_termios(struct uart_port *port, struct ktermios *termios,
-			      struct ktermios *old)
+			      const struct ktermios *old)
 {
 	unsigned int baud = uart_get_baud_rate(port, termios, old, 0, 4000000);
 	unsigned int quot = uart_get_divisor(port, baud);
diff --git a/drivers/tty/serial/sunplus-uart.c b/drivers/tty/serial/sunplus-uart.c
index 60c73662f955..7afe61a0e72e 100644
--- a/drivers/tty/serial/sunplus-uart.c
+++ b/drivers/tty/serial/sunplus-uart.c
@@ -333,7 +333,7 @@ static void sunplus_shutdown(struct uart_port *port)
 
 static void sunplus_set_termios(struct uart_port *port,
 				struct ktermios *termios,
-				struct ktermios *oldtermios)
+				const struct ktermios *oldtermios)
 {
 	u32 ext, div, div_l, div_h, baud, lcr;
 	u32 clk = port->uartclk;
diff --git a/drivers/tty/serial/sunsab.c b/drivers/tty/serial/sunsab.c
index 6ea52293d9f3..b5498229b147 100644
--- a/drivers/tty/serial/sunsab.c
+++ b/drivers/tty/serial/sunsab.c
@@ -776,7 +776,7 @@ static void sunsab_convert_to_sab(struct uart_sunsab_port *up, unsigned int cfla
 
 /* port->lock is not held.  */
 static void sunsab_set_termios(struct uart_port *port, struct ktermios *termios,
-			       struct ktermios *old)
+			       const struct ktermios *old)
 {
 	struct uart_sunsab_port *up =
 		container_of(port, struct uart_sunsab_port, port);
diff --git a/drivers/tty/serial/sunsu.c b/drivers/tty/serial/sunsu.c
index 84d545e5a8c7..1656efab343e 100644
--- a/drivers/tty/serial/sunsu.c
+++ b/drivers/tty/serial/sunsu.c
@@ -897,7 +897,7 @@ sunsu_change_speed(struct uart_port *port, unsigned int cflag,
 
 static void
 sunsu_set_termios(struct uart_port *port, struct ktermios *termios,
-		  struct ktermios *old)
+		  const struct ktermios *old)
 {
 	unsigned int baud, quot;
 
diff --git a/drivers/tty/serial/sunzilog.c b/drivers/tty/serial/sunzilog.c
index c14275d83b0b..a38d213ca7ac 100644
--- a/drivers/tty/serial/sunzilog.c
+++ b/drivers/tty/serial/sunzilog.c
@@ -938,7 +938,7 @@ sunzilog_convert_to_zs(struct uart_sunzilog_port *up, unsigned int cflag,
 /* The port lock is not held.  */
 static void
 sunzilog_set_termios(struct uart_port *port, struct ktermios *termios,
-		     struct ktermios *old)
+		     const struct ktermios *old)
 {
 	struct uart_sunzilog_port *up =
 		container_of(port, struct uart_sunzilog_port, port);
diff --git a/drivers/tty/serial/tegra-tcu.c b/drivers/tty/serial/tegra-tcu.c
index 4877c54c613d..366dc94118bc 100644
--- a/drivers/tty/serial/tegra-tcu.c
+++ b/drivers/tty/serial/tegra-tcu.c
@@ -126,7 +126,7 @@ static void tegra_tcu_uart_shutdown(struct uart_port *port)
 
 static void tegra_tcu_uart_set_termios(struct uart_port *port,
 				       struct ktermios *new,
-				       struct ktermios *old)
+				       const struct ktermios *old)
 {
 }
 
diff --git a/drivers/tty/serial/timbuart.c b/drivers/tty/serial/timbuart.c
index 08941eabe7b1..bb19ed012def 100644
--- a/drivers/tty/serial/timbuart.c
+++ b/drivers/tty/serial/timbuart.c
@@ -275,8 +275,8 @@ static int get_bindex(int baud)
 }
 
 static void timbuart_set_termios(struct uart_port *port,
-	struct ktermios *termios,
-	struct ktermios *old)
+				 struct ktermios *termios,
+				 const struct ktermios *old)
 {
 	unsigned int baud;
 	short bindex;
diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index 880e2afbb97b..eca41ac5477c 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -314,8 +314,9 @@ static void ulite_shutdown(struct uart_port *port)
 	clk_disable(pdata->clk);
 }
 
-static void ulite_set_termios(struct uart_port *port, struct ktermios *termios,
-			      struct ktermios *old)
+static void ulite_set_termios(struct uart_port *port,
+			      struct ktermios *termios,
+			      const struct ktermios *old)
 {
 	unsigned long flags;
 	struct uartlite_data *pdata = port->private_data;
diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index 3cc9ef08455c..0c7768b8e136 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -843,7 +843,8 @@ static void qe_uart_shutdown(struct uart_port *port)
  * Set the serial port parameters.
  */
 static void qe_uart_set_termios(struct uart_port *port,
-				struct ktermios *termios, struct ktermios *old)
+				struct ktermios *termios,
+				const struct ktermios *old)
 {
 	struct uart_qe_port *qe_port =
 		container_of(port, struct uart_qe_port, port);
diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt8500_serial.c
index 6f08136ce78a..508ad7afa6de 100644
--- a/drivers/tty/serial/vt8500_serial.c
+++ b/drivers/tty/serial/vt8500_serial.c
@@ -355,7 +355,7 @@ static void vt8500_shutdown(struct uart_port *port)
 
 static void vt8500_set_termios(struct uart_port *port,
 			       struct ktermios *termios,
-			       struct ktermios *old)
+			       const struct ktermios *old)
 {
 	struct vt8500_port *vt8500_port =
 			container_of(port, struct vt8500_port, uart);
diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index 9e01fe6c0ab8..d7c7131c7258 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -675,7 +675,8 @@ static void cdns_uart_break_ctl(struct uart_port *port, int ctl)
  * @old: Values of the previously saved termios structure
  */
 static void cdns_uart_set_termios(struct uart_port *port,
-				struct ktermios *termios, struct ktermios *old)
+				  struct ktermios *termios,
+				  const struct ktermios *old)
 {
 	u32 cval = 0;
 	unsigned int baud, minbaud, maxbaud;
diff --git a/drivers/tty/serial/zs.c b/drivers/tty/serial/zs.c
index 5bc58591665a..688db7d8b748 100644
--- a/drivers/tty/serial/zs.c
+++ b/drivers/tty/serial/zs.c
@@ -846,7 +846,7 @@ static void zs_reset(struct zs_port *zport)
 }
 
 static void zs_set_termios(struct uart_port *uport, struct ktermios *termios,
-			   struct ktermios *old_termios)
+			   const struct ktermios *old_termios)
 {
 	struct zs_port *zport = to_zport(uport);
 	struct zs_scc *scc = zport->scc;
diff --git a/drivers/tty/tty_ioctl.c b/drivers/tty/tty_ioctl.c
index fc94988f0283..31d11230e778 100644
--- a/drivers/tty/tty_ioctl.c
+++ b/drivers/tty/tty_ioctl.c
@@ -219,7 +219,7 @@ EXPORT_SYMBOL(tty_wait_until_sent);
  *		Termios Helper Methods
  */
 
-static void unset_locked_termios(struct tty_struct *tty, struct ktermios *old)
+static void unset_locked_termios(struct tty_struct *tty, const struct ktermios *old)
 {
 	struct ktermios *termios = &tty->termios;
 	struct ktermios *locked  = &tty->termios_locked;
diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
index 8c7b793aa4d7..43edd10e8c96 100644
--- a/include/linux/serial_8250.h
+++ b/include/linux/serial_8250.h
@@ -32,7 +32,7 @@ struct plat_serial8250_port {
 	void		(*serial_out)(struct uart_port *, int, int);
 	void		(*set_termios)(struct uart_port *,
 			               struct ktermios *new,
-			               struct ktermios *old);
+			               const struct ktermios *old);
 	void		(*set_ldisc)(struct uart_port *,
 				     struct ktermios *);
 	unsigned int	(*get_mctrl)(struct uart_port *);
@@ -157,7 +157,7 @@ extern int early_serial8250_setup(struct earlycon_device *device,
 extern void serial8250_update_uartclk(struct uart_port *port,
 				      unsigned int uartclk);
 extern void serial8250_do_set_termios(struct uart_port *port,
-		struct ktermios *termios, struct ktermios *old);
+		struct ktermios *termios, const struct ktermios *old);
 extern void serial8250_do_set_ldisc(struct uart_port *port,
 				    struct ktermios *termios);
 extern unsigned int serial8250_do_get_mctrl(struct uart_port *port);
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index aef3145f2032..0e9bc943bfa8 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -379,7 +379,7 @@ struct uart_ops {
 	void		(*shutdown)(struct uart_port *);
 	void		(*flush_buffer)(struct uart_port *);
 	void		(*set_termios)(struct uart_port *, struct ktermios *new,
-				       struct ktermios *old);
+				       const struct ktermios *old);
 	void		(*set_ldisc)(struct uart_port *, struct ktermios *);
 	void		(*pm)(struct uart_port *, unsigned int state,
 			      unsigned int oldstate);
@@ -425,7 +425,7 @@ struct uart_port {
 	void			(*serial_out)(struct uart_port *, int, int);
 	void			(*set_termios)(struct uart_port *,
 				               struct ktermios *new,
-				               struct ktermios *old);
+				               const struct ktermios *old);
 	void			(*set_ldisc)(struct uart_port *,
 					     struct ktermios *);
 	unsigned int		(*get_mctrl)(struct uart_port *);
@@ -644,7 +644,7 @@ void uart_write_wakeup(struct uart_port *port);
 void uart_update_timeout(struct uart_port *port, unsigned int cflag,
 			 unsigned int baud);
 unsigned int uart_get_baud_rate(struct uart_port *port, struct ktermios *termios,
-				struct ktermios *old, unsigned int min,
+				const struct ktermios *old, unsigned int min,
 				unsigned int max);
 unsigned int uart_get_divisor(struct uart_port *port, unsigned int baud);
 
-- 
2.30.2

