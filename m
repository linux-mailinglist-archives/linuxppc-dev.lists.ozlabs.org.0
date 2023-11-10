Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C087E88E7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 04:15:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SS15l3Xm9z3cFw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 14:15:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRjTc2wKwz3cVT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Nov 2023 02:31:16 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TT0-00065Q-GG; Fri, 10 Nov 2023 16:30:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TSx-0083Id-UM; Fri, 10 Nov 2023 16:30:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r1TSx-00Gnuj-JI; Fri, 10 Nov 2023 16:30:39 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 00/52] serial: Convert to platform remove callback returning void
Date: Fri, 10 Nov 2023 16:29:28 +0100
Message-ID: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8575; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=uSjGK//3oFZ52v8CbMudZ2zWDpIf+rV/Bz06fMr6GWo=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlQ/nwgpw9SOtCV6v+pmM2qvy30b4Lq49LLWF9d7/DeVZ WUfT6vrZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAit63Y/3DeWbXNbsaN6owD v7zeKjbpJWlH1DLLuAtpXzizckMmx203llrb1/+nvTIsPrdq+5X595O9r7k579Bw9+82qJzub57 xYRLnlnOf3z5I0jkjI3+hnSlh3u7CZtWj17OsTwtF9Zh1VPec575QJnDf2cNMZ92auiNbfa0U1I K4NMS4nGKWL9M2r8plO87j5ygYa/6+RbEk4fm2VxMXr107Q7gswU3y947dArnBDXHf36sIsmiEc f/g4GZMEG/dF80S1BrAt/VW0ITwlZUaT7adCHP/6ih/oXzv47Wsk5b57sm0tYvXmXys/bGln80K A/VHR2RlH3V3/5h2e8W6Lbt3hnOZavQfU+68c0/+U304AA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Sat, 11 Nov 2023 14:14:16 +1100
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
Cc: Fabio Estevam <festevam@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Pavel Krasavin <pkrasavin@imaqliq.com>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Hammer Hsieh <hammerh0314@gmail.com>, Jiamei Xie <jiamei.xie@arm.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, NXP Linux Team <linux-imx@nxp.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Petr Mladek <pmladek@suse.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, linux-serial@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>, Richard GENOUD <richard.genoud@gmail.com>, Samuel Holland <samuel.holland@sifive.com>, Masami Hiramatsu <mhiramat
 @kernel.org>, kernel@pengutronix.de, "Maciej W. Rozycki" <macro@orcam.me.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, delisun <delisun@pateo.com.cn>, Chunyan Zhang <zhang.lyra@gmail.com>, Ruan Jinjie <ruanjinjie@huawei.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mateusz Holenko <mholenko@antmicro.com>, Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>, Hongyu Xie <xiehongyu1@kylinos.cn>, Tobias Klauser <tklauser@distanz.ch>, =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, John Ogness <john.ogness@linutronix.de>, Yangtao Li <frank.li@vivo.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lis
 ts.infradead.org, Michal Simek <michal.simek@amd.com>, Sherry Sun <sherry.sun@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, Thomas Richard <thomas.richard@bootlin.com>, "David S. Miller" <davem@davemloft.net>, Sergey Organov <sorganov@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-mediatek@lists.infradead.org, Lino Sanfilippo <l.sanfilippo@kunbus.com>, Erwan Le Ray <erwan.leray@foss.st.com>, Tom Rix <trix@redhat.com>, Al Cooper <alcooperx@gmail.com>, Yuan Can <yuancan@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>, Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, linux-aspeed@lists.ozlabs.org, Bernhard Seibold <mail@bernhard-seibold.de>, Shenwei Wang <shenwei.wang@nxp.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, Chen-Yu Tsai <wenst@chromium.org>, Jacob Keller <jacob.e.keller@intel.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Patrice Chotard
  <patrice.chotard@foss.st.com>, Jacky Huang <ychuang3@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>, Thierry Reding <treding@nvidia.com>, Timur Tabi <timur@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Julien Malik <julien.malik@unseenlabs.fr>, Konrad Dybcio <konrad.dybcio@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Shawn Guo <shawnguo@kernel.org>, =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Baruch Siach <baruch@tkos.co.il>, Valentin Caron <valentin.caron@foss.st.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, sparclinux@vger.kernel.org, Shan-Chun Hung <schung@nuvoton.com>, linux-riscv@lists.infradead.org, Zhang Shurong <zhang_shurong@foxmail.com>, Marek Vasut <marex@denx.de>, Florian Fainelli <f
 lorian.fainelli@broadcom.com>, Russell King <linux@armlinux.org.uk>, Nick Hu <nick.hu@sifive.com>, Andy Gross <agross@kernel.org>, Martin Fuzzey <martin.fuzzey@flowbird.group>, Manivannan Sadhasivam <mani@kernel.org>, Takao Orito <orito.takao@socionext.com>, Johan Hovold <johan@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, Taichi Sugaya <sugaya.taichi@socionext.com>, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lucas Tanure <tanure@linux.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andi Shyti <andi.shyti@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

this series starts with two fixes. The first one fixes a resource leak
and use after free. The second only improves error reporting. I added a
Fixes: marker to these. I let you decide if you want to drop them (or
the second only) or add a Cc: stable (to both or only the first one).

After that all drivers below drivers/tty/serial are converted to struct
platform_driver::remove_new. See commit 5c5a7680e67b ("platform: Provide
a remove callback that returns no value") for an extended explanation
and the eventual goal. The TL;DR; is to prevent bugs like the two fixed
here.

After these two fixes all conversations are trivial, because all
.remove() callbacks returned zero unconditionally.

The conversion patches are merge window material. The two fixes might go
in also before v6.7, but given the fixed problems are already old
(v6.1-rc6 + v3.10-rc1) there is probably no urge.

Best regards
Uwe

Uwe Kleine-König (52):
  serial: 8250: omap: Don't skip resource freeing if
    pm_runtime_resume_and_get() failed
  serial: sccnxp: Improve error message if regulator_disable() fails
  serial: 8250: Convert to platform remove callback returning void
  serial: altera_jtaguart: Convert to platform remove callback returning
    void
  serial: altera: Convert to platform remove callback returning void
  serial: amba-pl011: Convert to platform remove callback returning void
  serial: ar933x: Convert to platform remove callback returning void
  serial: atmel: Convert to platform remove callback returning void
  serial: bcm63xx: Convert to platform remove callback returning void
  serial: clps711x: Convert to platform remove callback returning void
  serial: cpm: Convert to platform remove callback returning void
  serial: digicolor: Convert to platform remove callback returning void
  serial: esp32_acm: Convert to platform remove callback returning void
  serial: esp32: Convert to platform remove callback returning void
  serial: fsl_linflexuart: Convert to platform remove callback returning
    void
  serial: fsl_lpuart: Convert to platform remove callback returning void
  serial: imx: Convert to platform remove callback returning void
  serial: lantiq: Convert to platform remove callback returning void
  serial: liteuart: Convert to platform remove callback returning void
  serial: lpc32xx_hs: Convert to platform remove callback returning void
  serial: ma35d1: Convert to platform remove callback returning void
  serial: mcf: Convert to platform remove callback returning void
  serial: meson: Convert to platform remove callback returning void
  serial: milbeaut_usio: Convert to platform remove callback returning
    void
  serial: mpc52xx: Convert to platform remove callback returning void
  serial: msm: Convert to platform remove callback returning void
  serial: mxs-auart: Convert to platform remove callback returning void
  serial: omap: Convert to platform remove callback returning void
  serial: owl: Convert to platform remove callback returning void
  serial: pic32: Convert to platform remove callback returning void
  serial: qcom_geni: Convert to platform remove callback returning void
  serial: rda: Convert to platform remove callback returning void
  serial: sa1100: Convert to platform remove callback returning void
  serial: samsung: Convert to platform remove callback returning void
  serial: sccnxp: Convert to platform remove callback returning void
  serial: tegra: Convert to platform remove callback returning void
  serial: txx9: Convert to platform remove callback returning void
  serial: sh-sci: Convert to platform remove callback returning void
  serial: sifive: Convert to platform remove callback returning void
  serial: sprd: Convert to platform remove callback returning void
  serial: st-asc: Convert to platform remove callback returning void
  serial: stm32: Convert to platform remove callback returning void
  serial: sunhv: Convert to platform remove callback returning void
  serial: sunplus: Convert to platform remove callback returning void
  serial: sunsab: Convert to platform remove callback returning void
  serial: sunsu: Convert to platform remove callback returning void
  serial: sunzilog: Convert to platform remove callback returning void
  serial: tegra-tcu: Convert to platform remove callback returning void
  serial: timbuart: Convert to platform remove callback returning void
  serial: uartlite: Convert to platform remove callback returning void
  serial: ucc: Convert to platform remove callback returning void
  serial: xilinx_uartps: Convert to platform remove callback returning
    void

 drivers/tty/serial/8250/8250_aspeed_vuart.c |  6 ++----
 drivers/tty/serial/8250/8250_bcm2835aux.c   |  6 ++----
 drivers/tty/serial/8250/8250_bcm7271.c      |  5 ++---
 drivers/tty/serial/8250/8250_core.c         |  5 ++---
 drivers/tty/serial/8250/8250_dw.c           |  6 ++----
 drivers/tty/serial/8250/8250_em.c           |  5 ++---
 drivers/tty/serial/8250/8250_fsl.c          |  5 ++---
 drivers/tty/serial/8250/8250_ingenic.c      |  5 ++---
 drivers/tty/serial/8250/8250_ioc3.c         |  5 ++---
 drivers/tty/serial/8250/8250_lpc18xx.c      |  6 ++----
 drivers/tty/serial/8250/8250_mtk.c          |  6 ++----
 drivers/tty/serial/8250/8250_of.c           |  5 ++---
 drivers/tty/serial/8250/8250_omap.c         |  7 +++----
 drivers/tty/serial/8250/8250_pxa.c          |  6 ++----
 drivers/tty/serial/8250/8250_tegra.c        |  6 ++----
 drivers/tty/serial/8250/8250_uniphier.c     |  6 ++----
 drivers/tty/serial/altera_jtaguart.c        |  6 ++----
 drivers/tty/serial/altera_uart.c            |  6 ++----
 drivers/tty/serial/amba-pl011.c             |  5 ++---
 drivers/tty/serial/ar933x_uart.c            |  6 ++----
 drivers/tty/serial/atmel_serial.c           |  6 ++----
 drivers/tty/serial/bcm63xx_uart.c           |  5 ++---
 drivers/tty/serial/clps711x.c               |  6 ++----
 drivers/tty/serial/cpm_uart.c               |  6 ++----
 drivers/tty/serial/digicolor-usart.c        |  6 ++----
 drivers/tty/serial/esp32_acm.c              |  5 ++---
 drivers/tty/serial/esp32_uart.c             |  6 ++----
 drivers/tty/serial/fsl_linflexuart.c        |  6 ++----
 drivers/tty/serial/fsl_lpuart.c             |  5 ++---
 drivers/tty/serial/imx.c                    |  6 ++----
 drivers/tty/serial/lantiq.c                 |  6 ++----
 drivers/tty/serial/liteuart.c               |  6 ++----
 drivers/tty/serial/lpc32xx_hs.c             |  6 ++----
 drivers/tty/serial/ma35d1_serial.c          |  5 ++---
 drivers/tty/serial/mcf.c                    |  6 ++----
 drivers/tty/serial/meson_uart.c             |  8 +++-----
 drivers/tty/serial/milbeaut_usio.c          |  6 ++----
 drivers/tty/serial/mpc52xx_uart.c           |  7 ++-----
 drivers/tty/serial/msm_serial.c             |  6 ++----
 drivers/tty/serial/mxs-auart.c              |  6 ++----
 drivers/tty/serial/omap-serial.c            |  6 ++----
 drivers/tty/serial/owl-uart.c               |  6 ++----
 drivers/tty/serial/pic32_uart.c             |  7 ++-----
 drivers/tty/serial/qcom_geni_serial.c       |  6 ++----
 drivers/tty/serial/rda-uart.c               |  6 ++----
 drivers/tty/serial/sa1100.c                 |  6 ++----
 drivers/tty/serial/samsung_tty.c            |  6 ++----
 drivers/tty/serial/sccnxp.c                 | 13 +++++++------
 drivers/tty/serial/serial-tegra.c           |  5 ++---
 drivers/tty/serial/serial_txx9.c            |  5 ++---
 drivers/tty/serial/sh-sci.c                 |  6 ++----
 drivers/tty/serial/sifive.c                 |  6 ++----
 drivers/tty/serial/sprd_serial.c            |  6 ++----
 drivers/tty/serial/st-asc.c                 |  6 ++----
 drivers/tty/serial/stm32-usart.c            |  6 ++----
 drivers/tty/serial/sunhv.c                  |  6 ++----
 drivers/tty/serial/sunplus-uart.c           |  6 ++----
 drivers/tty/serial/sunsab.c                 |  6 ++----
 drivers/tty/serial/sunsu.c                  |  6 ++----
 drivers/tty/serial/sunzilog.c               |  6 ++----
 drivers/tty/serial/tegra-tcu.c              |  6 ++----
 drivers/tty/serial/timbuart.c               |  6 ++----
 drivers/tty/serial/uartlite.c               |  5 ++---
 drivers/tty/serial/ucc_uart.c               |  6 ++----
 drivers/tty/serial/xilinx_uartps.c          |  5 ++---
 65 files changed, 137 insertions(+), 249 deletions(-)


base-commit: 8728c14129df7a6e29188a2e737b4774fb200953
-- 
2.42.0

