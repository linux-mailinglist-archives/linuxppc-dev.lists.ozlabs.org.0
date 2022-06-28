Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E42B155BEE6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 09:00:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXFpQ6LzDz3c8Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 16:59:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=XSa6BG9j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--saravanak.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3wgg6ygkkdcep7o7s7k7hdlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--saravanak.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=XSa6BG9j;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX7Cz6GQ6z3bY8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 12:03:09 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id r6-20020a5b06c6000000b006693f6a6d67so9702577ybq.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 19:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=/OuahP8oPHDxIXADrtMOHzHvbE6HS+PoE4WDHegn+rY=;
        b=XSa6BG9j+Us6qSO6vPHqc2TVfQxumnU0pAOfjBJHFlWcIck0At2n2mfq5tAA7z3Bx5
         PD0vlBv1k9Q/E/30MAFFG1P5OxPr5/WK6+axB0HoavtP7KnHzjHkg1qUFmVSky1XYmCE
         keKg7zc6YYKZDYEnwk3qbSxvFO3Xk4Y8/tdDX97msFctgpLZBdPkJDnH5LbWzXx7pTZH
         CgzyIamG5okMqCh9aY8wAvuFixrOfwL/UhwfbnX/7paM2krnQNZDjv67WdvSzvvMWo7D
         m5fFpT4ZoMrA6AasD66OkuDUwH3oHEeuCSo5kX9VLcSW8/gQ+X2898P5YGyQhyrYIK8G
         Aulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=/OuahP8oPHDxIXADrtMOHzHvbE6HS+PoE4WDHegn+rY=;
        b=idLQP5uySdl7hL2lwlPBstesF0EZIuTN4owyI5olijr/GClg028IMucXEeeePUbw1H
         DZYNeATsS0RyVtljgJcKZXenwhaVOMy9ylHrzBeN+hN1jLD8nahUvP1R7i3HhvAnCdFs
         x3fsPAQAkwbDvgWzPeGC6XQk7brtBuLmT++z9jGJu3ECIQL1D271n1yRpWPEw/P+wC+9
         rTrTkQK86MMeZvi+yB4XkQ/O2SH3byZ3+TGokWTBT9DKqdSYTPMDUIZgcwja9R25efTi
         mpziKg159i2XisvvPlRKLqCJTGSlbBJpzJOk17npEToOpVUl3R6CGpYHGfdrNnYIs3cz
         PdZg==
X-Gm-Message-State: AJIora/DwlUm8eLihVdpV0xZx9zZ4KeFnHrHASeowE7qByP0cBik6Oef
	3nZAGHEIt+A7WVEC5EIMU4tn3qmQiDbVG2o=
X-Google-Smtp-Source: AGRyM1s6TFssoICBD8dW4KaHJ9QFnbGLouWSVAgJ1icUDVgZq5pRLN92A6h2ACkaFVoX2i0qb9ktR7y39ECy36c=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:1f27:a302:2101:1c82])
 (user=saravanak job=sendgmr) by 2002:a81:9292:0:b0:317:dd64:5adc with SMTP id
 j140-20020a819292000000b00317dd645adcmr19123629ywg.145.1656381784427; Mon, 27
 Jun 2022 19:03:04 -0700 (PDT)
Date: Mon, 27 Jun 2022 19:01:01 -0700
Message-Id: <20220628020110.1601693-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v1 0/2] Fix console probe delay when stdout-path isn't set
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Al Cooper <alcooperx@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Tobias Klauser <tklauser@distanz.ch>, Russell King <linux@armlinux.org.uk>, 
	Vineet Gupta <vgupta@kernel.org>, Richard Genoud <richard.genoud@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Alexander Shiyan <shc_work@mail.ru>, 
	Baruch Siach <baruch@tkos.co.il>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, 
	Gabriel Somlo <gsomlo@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Pali Rohar <pali@kernel.org>, 
	Andreas Farber <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, "David S. Miller" <davem@davemloft.net>, 
	Hammer Hsieh <hammerh0314@gmail.com>, Peter Korsgaard <jacmet@sunsite.dk>, Timur Tabi <timur@kernel.org>, 
	Michal Simek <michal.simek@xilinx.com>, Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 28 Jun 2022 16:58:59 +1000
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
Cc: andrew lunn <andrew@lunn.ch>, peng fan <peng.fan@nxp.com>, linux-aspeed@lists.ozlabs.org, linus walleij <linus.walleij@linaro.org>, ulf hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org, eric dumazet <edumazet@google.com>, pavel machek <pavel@ucw.cz>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, will deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com, sascha hauer <sha@pengutronix.de>, Rob Herring <robh@kernel.org>, linux-samsung-soc@vger.kernel.org, kevin hilman <khilman@kernel.org>, joerg roedel <joro@8bytes.org>, linux-serial@vger.kernel.org, jakub kicinski <kuba@kernel.org>, paolo abeni <pabeni@redhat.com>, kernel-team@android.com, len brown <len.brown@intel.com>, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel
 @lists.infradead.org, linux-snps-arc@lists.infradead.org, linux-unisoc@lists.infradead.org, hideaki yoshifuji <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org, david ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org, heiner kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since the series that fixes console probe delay based on stdout-path[1] got
pulled into driver-core-next, I made these patches on top of them.

Even if stdout-path isn't set in DT, this patch should take console
probe times back to how they were before the deferred_probe_timeout
clean up series[2].

Fabio/Ahmad/Sascha,

Can you give this a shot please?

[1] - https://lore.kernel.org/lkml/20220623080344.783549-1-saravanak@google.com/
[2] - https://lore.kernel.org/lkml/20220601070707.3946847-1-saravanak@google.com/

Thanks,
Saravana

cc: Rob Herring <robh@kernel.org>
cc: sascha hauer <sha@pengutronix.de>
cc: peng fan <peng.fan@nxp.com>
cc: kevin hilman <khilman@kernel.org>
cc: ulf hansson <ulf.hansson@linaro.org>
cc: len brown <len.brown@intel.com>
cc: pavel machek <pavel@ucw.cz>
cc: joerg roedel <joro@8bytes.org>
cc: will deacon <will@kernel.org>
cc: andrew lunn <andrew@lunn.ch>
cc: heiner kallweit <hkallweit1@gmail.com>
cc: russell king <linux@armlinux.org.uk>
cc: "david s. miller" <davem@davemloft.net>
cc: eric dumazet <edumazet@google.com>
cc: jakub kicinski <kuba@kernel.org>
cc: paolo abeni <pabeni@redhat.com>
cc: linus walleij <linus.walleij@linaro.org>
cc: hideaki yoshifuji <yoshfuji@linux-ipv6.org>
cc: david ahern <dsahern@kernel.org>
cc: kernel-team@android.com
cc: linux-kernel@vger.kernel.org
cc: linux-pm@vger.kernel.org
cc: iommu@lists.linux-foundation.org
cc: netdev@vger.kernel.org
cc: linux-gpio@vger.kernel.org
Cc: kernel@pengutronix.de

Saravana Kannan (2):
  driver core: Add probe_no_timeout flag for drivers
  serial: Set probe_no_timeout for all DT based drivers

 drivers/base/base.h                         |  1 +
 drivers/base/core.c                         |  7 +++++++
 drivers/base/dd.c                           |  3 +++
 drivers/tty/ehv_bytechan.c                  |  1 +
 drivers/tty/goldfish.c                      |  1 +
 drivers/tty/hvc/hvc_opal.c                  |  1 +
 drivers/tty/serial/8250/8250_acorn.c        |  1 -
 drivers/tty/serial/8250/8250_aspeed_vuart.c |  1 +
 drivers/tty/serial/8250/8250_bcm2835aux.c   |  1 +
 drivers/tty/serial/8250/8250_bcm7271.c      |  1 +
 drivers/tty/serial/8250/8250_dw.c           |  1 +
 drivers/tty/serial/8250/8250_em.c           |  1 +
 drivers/tty/serial/8250/8250_ingenic.c      |  1 +
 drivers/tty/serial/8250/8250_lpc18xx.c      |  1 +
 drivers/tty/serial/8250/8250_mtk.c          |  1 +
 drivers/tty/serial/8250/8250_of.c           |  1 +
 drivers/tty/serial/8250/8250_omap.c         |  1 +
 drivers/tty/serial/8250/8250_pxa.c          |  1 +
 drivers/tty/serial/8250/8250_tegra.c        |  1 +
 drivers/tty/serial/8250/8250_uniphier.c     |  1 +
 drivers/tty/serial/altera_jtaguart.c        |  1 +
 drivers/tty/serial/altera_uart.c            |  1 +
 drivers/tty/serial/amba-pl011.c             |  1 +
 drivers/tty/serial/apbuart.c                |  1 +
 drivers/tty/serial/ar933x_uart.c            |  1 +
 drivers/tty/serial/arc_uart.c               |  1 +
 drivers/tty/serial/atmel_serial.c           |  1 +
 drivers/tty/serial/bcm63xx_uart.c           |  1 +
 drivers/tty/serial/clps711x.c               |  1 +
 drivers/tty/serial/cpm_uart/cpm_uart_core.c |  1 +
 drivers/tty/serial/digicolor-usart.c        |  1 +
 drivers/tty/serial/fsl_linflexuart.c        |  1 +
 drivers/tty/serial/fsl_lpuart.c             |  1 +
 drivers/tty/serial/imx.c                    |  1 +
 drivers/tty/serial/lantiq.c                 |  1 +
 drivers/tty/serial/liteuart.c               |  1 +
 drivers/tty/serial/lpc32xx_hs.c             |  1 +
 drivers/tty/serial/max310x.c                |  1 +
 drivers/tty/serial/meson_uart.c             |  1 +
 drivers/tty/serial/milbeaut_usio.c          |  1 +
 drivers/tty/serial/mpc52xx_uart.c           |  1 +
 drivers/tty/serial/mps2-uart.c              |  1 +
 drivers/tty/serial/msm_serial.c             |  1 +
 drivers/tty/serial/mvebu-uart.c             |  1 +
 drivers/tty/serial/mxs-auart.c              |  1 +
 drivers/tty/serial/omap-serial.c            |  1 +
 drivers/tty/serial/owl-uart.c               |  1 +
 drivers/tty/serial/pic32_uart.c             |  1 +
 drivers/tty/serial/pmac_zilog.c             |  1 +
 drivers/tty/serial/pxa.c                    |  1 +
 drivers/tty/serial/qcom_geni_serial.c       |  1 +
 drivers/tty/serial/rda-uart.c               |  1 +
 drivers/tty/serial/samsung_tty.c            |  1 +
 drivers/tty/serial/sc16is7xx.c              |  1 +
 drivers/tty/serial/serial-tegra.c           |  1 +
 drivers/tty/serial/sh-sci.c                 |  1 +
 drivers/tty/serial/sifive.c                 |  1 +
 drivers/tty/serial/sprd_serial.c            |  1 +
 drivers/tty/serial/st-asc.c                 |  1 +
 drivers/tty/serial/stm32-usart.c            |  1 +
 drivers/tty/serial/sunhv.c                  |  1 +
 drivers/tty/serial/sunplus-uart.c           |  1 +
 drivers/tty/serial/sunsab.c                 |  1 +
 drivers/tty/serial/sunsu.c                  |  1 +
 drivers/tty/serial/sunzilog.c               |  1 +
 drivers/tty/serial/tegra-tcu.c              |  1 +
 drivers/tty/serial/uartlite.c               |  1 +
 drivers/tty/serial/ucc_uart.c               |  1 +
 drivers/tty/serial/vt8500_serial.c          |  1 +
 drivers/tty/serial/xilinx_uartps.c          |  1 +
 include/linux/device.h                      |  7 +++++++
 include/linux/device/driver.h               | 11 +++++++++++
 72 files changed, 95 insertions(+), 1 deletion(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog

