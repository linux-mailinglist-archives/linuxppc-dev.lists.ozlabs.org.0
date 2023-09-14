Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 965D97A1170
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 01:10:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Z8UeMKj4;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6i/Rykkl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmtMZ3gW3z3dV0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 09:10:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Z8UeMKj4;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6i/Rykkl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 373 seconds by postgrey-1.37 at boromir; Fri, 15 Sep 2023 04:44:57 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmmTP66Dvz3c9S;
	Fri, 15 Sep 2023 04:44:57 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694716719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aQcu0Tj+ffJBWZVQ9fNZPj8/IhtyreTS7DJJKIPF900=;
	b=Z8UeMKj4Fav9MLhk6d+JmpTi5nJHEpVJNO1ur5Ad3vBiVWCnoe9Eog0Qg33XlH6id3FWbz
	S8l2Lt2jSbU2XHwf8xi9UIitF4+b8K7paGx1bjjYr5t2rdTDVV0Fim6UAKFi2CtuZ1mb3L
	E0TJN4HYA+tWtKTLOiVDx3F+jVsGlfsYYAnFZvFt3iKUUrP7SkGJJcZ1UIkJ/UqIQ0831V
	SMEuLB8ZIcl+FG04i7hT9/QWq5F02SyOTdFIc9j7ps1+LHHwMSHMPuADoGutw3ZHkUAICp
	RXxdloN+Gh4cSEl07/GwEgsU+m8aqlGccQ2NbBYv7A5wSEzPoJaqC36jkiHDjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694716719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aQcu0Tj+ffJBWZVQ9fNZPj8/IhtyreTS7DJJKIPF900=;
	b=6i/Rykkl4Rl5SBtIHP9RIQNQNOB8Crkkj2AcFISLN8Dmxq51odZMyUMI6Usmo7xHPgkuGu
	8OGeRMSrDoYZsqCg==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH tty v1 00/74] serial: wrappers for uart port lock
Date: Thu, 14 Sep 2023 20:43:17 +0206
Message-Id: <20230914183831.587273-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 15 Sep 2023 09:07:30 +1000
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Hammer Hsieh <hammerh0314@gmail.com>, Jiamei Xie <jiamei.xie@arm.com>, NXP Linux Team <linux-imx@nxp.com>, Vineet Gupta <vgupta@kernel.org>, Thierry Reding <treding@nvidia.com>, Petr Mladek <pmladek@suse.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>, linux-unisoc@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Richard Genoud <richard.genoud@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Andrew Morton <akpm@linux-founda
 tion.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, Xiongfeng Wang <wangxiongfeng2@huawei.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, delisun <delisun@pateo.com.cn>, Fabio Estevam <festevam@gmail.com>, Ruan Jinjie <ruanjinjie@huawei.com>, Matthew Howell <matthew.howell@sealevel.com>, Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>, Hongyu Xie <xiehongyu1@kylinos.cn>, Tobias Klauser <tklauser@distanz.ch>, Yangtao Li <frank.li@vivo.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>, Sherry Sun <sherry.sun@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, Lukas Wunner <lukas@wunner.de>, Sergey Organov <sorganov@gmail.com>, Mukesh Ojha <quic_mojha@quicinc.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, Lino Sanfilippo <l.sanfilippo@kunbus.com>, Tom Rix <trix@redhat.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>, Yuan Can <yuancan@huawei.com>, Isaac True <isaac.true@canonical.com>, linux-tegra@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Mateusz Holenko <mholenko@antmicro.com>, Kevin Cernekee <cernekee@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo
 .jarvinen@linux.intel.com>, linux-snps-arc@lists.infradead.org, Patrice Chotard <patrice.chotard@foss.st.com>, Jacky Huang <ychuang3@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Timur Tabi <timur@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Konrad Dybcio <konrad.dybcio@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Baruch Siach <baruch@tkos.co.il>, Valentin Caron <valentin.caron@foss.st.com>, Tony Lindgren <tony@atomide.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue
 @foss.st.com>, sparclinux@vger.kernel.org, Shan-Chun Hung <schung@nuvoton.com>, linux-riscv@lists.infradead.org, Marek Vasut <marex@denx.de>, Lech Perczak <lech.perczak@camlingroup.com>, Russell King <linux@armlinux.org.uk>, Nick Hu <nick.hu@sifive.com>, Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Johan Hovold <johan@kernel.org>, linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, Taichi Sugaya <sugaya.taichi@socionext.com>, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lucas Tanure <tanure@linux.com>, Andrew Davis <afd@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Ta
 kao Orito <orito.takao@socionext.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a serial port is used for kernel console output, then all
modifications to the UART registers which are done from other contexts,
e.g. getty, termios, are interference points for the kernel console.

So far this has been ignored and the printk output is based on the
principle of hope. The rework of the console infrastructure which aims to
support threaded and atomic consoles, requires to mark sections which
modify the UART registers as unsafe. This allows the atomic write function
to make informed decisions and eventually to restore operational state. It
also allows to prevent the regular UART code from modifying UART registers
while printk output is in progress.

All modifications of UART registers are guarded by the UART port lock,
which provides an obvious synchronization point with the console
infrastructure.

Provide and use wrapper functions for spin_[un]lock*(port->lock)
invocations so that the console mechanics can be applied later on at a
single place and does not require to copy the same logic all over the
drivers.

Patch 1 adds the wrapper functions.

Patches 2-74 switch all uart port locking call sites to use the new
wrappers. These patches were automatically generated using coccinelle.
The 2 used coccinelle scripts are included below and executed as
follows:

$ spatch --sp-file uartlock-1.cocci $FILE
$ spatch --sp-file uartlock-2.cocci --recursive-includes $FILE

This series brings no functional change.

Patches 2-74 contain identical commit message bodies. Feel free to
fold them into a single commit if that seems more reasonable.

Thomas Gleixner (74):
  serial: core: Provide port lock wrappers
  serial: core: Use lock wrappers
  serial: 21285: Use port lock wrappers
  serial: 8250_aspeed_vuart: Use port lock wrappers
  serial: 8250_bcm7271: Use port lock wrappers
  serial: 8250: Use port lock wrappers
  serial: 8250_dma: Use port lock wrappers
  serial: 8250_dw: Use port lock wrappers
  serial: 8250_exar: Use port lock wrappers
  serial: 8250_fsl: Use port lock wrappers
  serial: 8250_mtk: Use port lock wrappers
  serial: 8250_omap: Use port lock wrappers
  serial: 8250_pci1xxxx: Use port lock wrappers
  serial: altera_jtaguart: Use port lock wrappers
  serial: altera_uart: Use port lock wrappers
  serial: amba-pl010: Use port lock wrappers
  serial: amba-pl011: Use port lock wrappers
  serial: apb: Use port lock wrappers
  serial: ar933x: Use port lock wrappers
  serial: arc_uart: Use port lock wrappers
  serial: atmel: Use port lock wrappers
  serial: bcm63xx-uart: Use port lock wrappers
  serial: cpm_uart: Use port lock wrappers
  serial: digicolor: Use port lock wrappers
  serial: dz: Use port lock wrappers
  serial: linflexuart: Use port lock wrappers
  serial: fsl_lpuart: Use port lock wrappers
  serial: icom: Use port lock wrappers
  serial: imx: Use port lock wrappers
  serial: ip22zilog: Use port lock wrappers
  serial: jsm: Use port lock wrappers
  serial: liteuart: Use port lock wrappers
  serial: lpc32xx_hs: Use port lock wrappers
  serial: ma35d1: Use port lock wrappers
  serial: mcf: Use port lock wrappers
  serial: men_z135_uart: Use port lock wrappers
  serial: meson: Use port lock wrappers
  serial: milbeaut_usio: Use port lock wrappers
  serial: mpc52xx: Use port lock wrappers
  serial: mps2-uart: Use port lock wrappers
  serial: msm: Use port lock wrappers
  serial: mvebu-uart: Use port lock wrappers
  serial: omap: Use port lock wrappers
  serial: owl: Use port lock wrappers
  serial: pch: Use port lock wrappers
  serial: pic32: Use port lock wrappers
  serial: pmac_zilog: Use port lock wrappers
  serial: pxa: Use port lock wrappers
  serial: qcom-geni: Use port lock wrappers
  serial: rda: Use port lock wrappers
  serial: rp2: Use port lock wrappers
  serial: sa1100: Use port lock wrappers
  serial: samsung_tty: Use port lock wrappers
  serial: sb1250-duart: Use port lock wrappers
  serial: sc16is7xx: Use port lock wrappers
  serial: tegra: Use port lock wrappers
  serial: core: Use port lock wrappers
  serial: mctrl_gpio: Use port lock wrappers
  serial: txx9: Use port lock wrappers
  serial: sh-sci: Use port lock wrappers
  serial: sifive: Use port lock wrappers
  serial: sprd: Use port lock wrappers
  serial: st-asc: Use port lock wrappers
  serial: stm32: Use port lock wrappers
  serial: sunhv: Use port lock wrappers
  serial: sunplus-uart: Use port lock wrappers
  serial: sunsab: Use port lock wrappers
  serial: sunsu: Use port lock wrappers
  serial: sunzilog: Use port lock wrappers
  serial: timbuart: Use port lock wrappers
  serial: uartlite: Use port lock wrappers
  serial: ucc_uart: Use port lock wrappers
  serial: vt8500: Use port lock wrappers
  serial: xilinx_uartps: Use port lock wrappers

 drivers/tty/serial/21285.c                  |   8 +-
 drivers/tty/serial/8250/8250_aspeed_vuart.c |   6 +-
 drivers/tty/serial/8250/8250_bcm7271.c      |  28 +++---
 drivers/tty/serial/8250/8250_core.c         |  12 +--
 drivers/tty/serial/8250/8250_dma.c          |   8 +-
 drivers/tty/serial/8250/8250_dw.c           |   8 +-
 drivers/tty/serial/8250/8250_exar.c         |   4 +-
 drivers/tty/serial/8250/8250_fsl.c          |   6 +-
 drivers/tty/serial/8250/8250_mtk.c          |   8 +-
 drivers/tty/serial/8250/8250_omap.c         |  52 +++++-----
 drivers/tty/serial/8250/8250_pci1xxxx.c     |   8 +-
 drivers/tty/serial/8250/8250_port.c         | 100 ++++++++++----------
 drivers/tty/serial/altera_jtaguart.c        |  28 +++---
 drivers/tty/serial/altera_uart.c            |  20 ++--
 drivers/tty/serial/amba-pl010.c             |  20 ++--
 drivers/tty/serial/amba-pl011.c             |  72 +++++++-------
 drivers/tty/serial/apbuart.c                |   8 +-
 drivers/tty/serial/ar933x_uart.c            |  26 ++---
 drivers/tty/serial/arc_uart.c               |  16 ++--
 drivers/tty/serial/atmel_serial.c           |  24 ++---
 drivers/tty/serial/bcm63xx_uart.c           |  22 ++---
 drivers/tty/serial/cpm_uart.c               |   8 +-
 drivers/tty/serial/digicolor-usart.c        |  18 ++--
 drivers/tty/serial/dz.c                     |  32 +++----
 drivers/tty/serial/fsl_linflexuart.c        |  26 ++---
 drivers/tty/serial/fsl_lpuart.c             |  88 ++++++++---------
 drivers/tty/serial/icom.c                   |  26 ++---
 drivers/tty/serial/imx.c                    |  84 ++++++++--------
 drivers/tty/serial/ip22zilog.c              |  36 +++----
 drivers/tty/serial/jsm/jsm_neo.c            |   4 +-
 drivers/tty/serial/jsm/jsm_tty.c            |  16 ++--
 drivers/tty/serial/liteuart.c               |  20 ++--
 drivers/tty/serial/lpc32xx_hs.c             |  26 ++---
 drivers/tty/serial/ma35d1_serial.c          |  22 ++---
 drivers/tty/serial/mcf.c                    |  20 ++--
 drivers/tty/serial/men_z135_uart.c          |   8 +-
 drivers/tty/serial/meson_uart.c             |  30 +++---
 drivers/tty/serial/milbeaut_usio.c          |  16 ++--
 drivers/tty/serial/mpc52xx_uart.c           |  12 +--
 drivers/tty/serial/mps2-uart.c              |  16 ++--
 drivers/tty/serial/msm_serial.c             |  38 ++++----
 drivers/tty/serial/mvebu-uart.c             |  18 ++--
 drivers/tty/serial/omap-serial.c            |  38 ++++----
 drivers/tty/serial/owl-uart.c               |  26 ++---
 drivers/tty/serial/pch_uart.c               |  10 +-
 drivers/tty/serial/pic32_uart.c             |  20 ++--
 drivers/tty/serial/pmac_zilog.c             |  52 +++++-----
 drivers/tty/serial/pxa.c                    |  30 +++---
 drivers/tty/serial/qcom_geni_serial.c       |   8 +-
 drivers/tty/serial/rda-uart.c               |  34 +++----
 drivers/tty/serial/rp2.c                    |  20 ++--
 drivers/tty/serial/sa1100.c                 |  20 ++--
 drivers/tty/serial/samsung_tty.c            |  50 +++++-----
 drivers/tty/serial/sb1250-duart.c           |  12 +--
 drivers/tty/serial/sc16is7xx.c              |  40 ++++----
 drivers/tty/serial/serial-tegra.c           |  32 +++----
 drivers/tty/serial/serial_core.c            |  88 ++++++++---------
 drivers/tty/serial/serial_mctrl_gpio.c      |   4 +-
 drivers/tty/serial/serial_port.c            |   4 +-
 drivers/tty/serial/serial_txx9.c            |  26 ++---
 drivers/tty/serial/sh-sci.c                 |  68 ++++++-------
 drivers/tty/serial/sifive.c                 |  16 ++--
 drivers/tty/serial/sprd_serial.c            |  30 +++---
 drivers/tty/serial/st-asc.c                 |  18 ++--
 drivers/tty/serial/stm32-usart.c            |  38 ++++----
 drivers/tty/serial/sunhv.c                  |  28 +++---
 drivers/tty/serial/sunplus-uart.c           |  26 ++---
 drivers/tty/serial/sunsab.c                 |  34 +++----
 drivers/tty/serial/sunsu.c                  |  46 ++++-----
 drivers/tty/serial/sunzilog.c               |  42 ++++----
 drivers/tty/serial/timbuart.c               |   8 +-
 drivers/tty/serial/uartlite.c               |  18 ++--
 drivers/tty/serial/ucc_uart.c               |   4 +-
 drivers/tty/serial/vt8500_serial.c          |   8 +-
 drivers/tty/serial/xilinx_uartps.c          |  56 +++++------
 include/linux/serial_core.h                 |  91 ++++++++++++++++--
 76 files changed, 1086 insertions(+), 1007 deletions(-)


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.39.2

--------------8<--------------
// uartlock-1.cocci

@r1@
struct uart_port *U;
@@

-spin_lock(&U->lock)
+uart_port_lock(U)

@r2@
struct uart_port *U;
@@

-spin_lock_irq(&U->lock)
+uart_port_lock_irq(U)

@r3@
struct uart_port *U;
identifier F;
@@

-spin_lock_irqsave(&U->lock, F)
+uart_port_lock_irqsave(U, &F)

@r4@
struct uart_port *U;
@@

-spin_unlock(&U->lock)
+uart_port_unlock(U)

@r5@
struct uart_port *U;
@@

-spin_unlock_irq(&U->lock)
+uart_port_unlock_irq(U)

@r6@
struct uart_port *U;
identifier F;
@@

-spin_unlock_irqrestore(&U->lock, F)
+uart_port_unlock_irqrestore(U, F)

@r7@
struct uart_port *U;
@@

-spin_trylock(&U->lock)
+uart_port_trylock(U)

@r8@
struct uart_port *U;
identifier F;
@@

-spin_trylock_irqsave(&U->lock, F)
+uart_port_trylock_irqsave(U, &F)

--------------8<--------------
// uartlock-2.cocci

@r10@
type T1;
identifier U;
@@

T1 {
   ...
   struct uart_port U;
   ...
};

@r11@
r10.T1 *E;
identifier r10.U;
@@

-spin_lock(&E->U.lock)
+uart_port_lock(&E->U)

@r12@
r10.T1 *E;
identifier r10.U;
@@

-spin_lock_irq(&E->U.lock)
+uart_port_lock_irq(&E->U)

@r13@
r10.T1 *E;
identifier r10.U;
identifier F;
@@

-spin_lock_irqsave(&E->U.lock, F)
+uart_port_lock_irqsave(&E->U, &F)

@r14@
r10.T1 *E;
identifier r10.U;
@@

-spin_unlock(&E->U.lock)
+uart_port_unlock(&E->U)

@r15@
r10.T1 *E;
identifier r10.U;
@@

-spin_unlock_irq(&E->U.lock)
+uart_port_unlock_irq(&E->U)

@r16@
r10.T1 *E;
identifier r10.U;
identifier F;
@@

-spin_unlock_irqrestore(&E->U.lock, F)
+uart_port_unlock_irqrestore(&E->U, F)

@r17@
r10.T1 *E;
identifier r10.U;
@@

-spin_trylock(&E->U.lock)
+uart_port_trylock(&E->U)

@r18@
r10.T1 *E;
identifier r10.U;
identifier F;
@@

-spin_trylock_irqsave(&E->U.lock, F)
+uart_port_trylock_irqsave(&E->U, &F)

