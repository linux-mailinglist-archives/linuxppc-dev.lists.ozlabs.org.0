Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3C391E22E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 16:18:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCSnP2hwhz3fn2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 00:18:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=m.felsch@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCSkL1RLMz3fnY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 00:15:38 +1000 (AEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1sOHTW-0001LY-Vb; Mon, 01 Jul 2024 15:53:46 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/9] AT24 EEPROM MTD Support
Date: Mon, 01 Jul 2024 15:53:39 +0200
Message-Id: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOO0gmYC/x3MQQqEMAxG4atI1hNIpTjoVcTF9DeO2WhpVQTx7
 haX3+K9i7Im00xddVHSw7KtS4H7VIT5t/yVbSymWmovX3EcPB8NO+FtjQbecwBviDCGD2gDoI1
 4Kn1MOtn5vvvhvh826v1ZawAAAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
X-Mailer: b4 0.15-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: Marco Felsch <m.felsch@pengutronix.de>, imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, loongarch@lists.linux.dev, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series adds the intial support to handle EEPROMs via the MTD layer
as well. This allow the user-space to have separate paritions since
EEPROMs can become quite large nowadays.

With this patchset applied EEPROMs can be accessed via:
  - legacy 'eeprom' device
  - nvmem device
  - mtd device(s)

The patchset targets only the AT24 (I2C) EEPROMs since I have no access
to AT25 (SPI) EEPROMs nor to one of the other misc/eeprom/* devices.

Note: I'm not familiar with Kconfig symbol migration so I don't know if
the last patch is required at the moment. Please be notified that the
list of recipients is quite large due to the defconfig changes.

Regards,
  Marco

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Marco Felsch (9):
      mtd: core: add nvmem_write support
      mtd: add mtd_is_master helper
      mtd: add support to handle EEPROM devices
      mtd: devices: add AT24 eeprom support
      ARM: defconfig: convert to MTD_EEPROM_AT24
      powerpc: convert to MTD_EEPROM_AT24
      MIPS: configs: convert to MTD_EEPROM_AT24
      LoongArch: convert to MTD_EEPROM_AT24
      eeprom: at24: remove deprecated Kconfig symbol

 MAINTAINERS                                 |   2 +-
 arch/arm/configs/aspeed_g4_defconfig        |   2 +-
 arch/arm/configs/aspeed_g5_defconfig        |   2 +-
 arch/arm/configs/at91_dt_defconfig          |   2 +-
 arch/arm/configs/axm55xx_defconfig          |   2 +-
 arch/arm/configs/davinci_all_defconfig      |   2 +-
 arch/arm/configs/imx_v4_v5_defconfig        |   2 +-
 arch/arm/configs/imx_v6_v7_defconfig        |   2 +-
 arch/arm/configs/ixp4xx_defconfig           |   2 +-
 arch/arm/configs/keystone_defconfig         |   2 +-
 arch/arm/configs/lpc18xx_defconfig          |   2 +-
 arch/arm/configs/lpc32xx_defconfig          |   2 +-
 arch/arm/configs/multi_v5_defconfig         |   2 +-
 arch/arm/configs/multi_v7_defconfig         |   2 +-
 arch/arm/configs/mvebu_v5_defconfig         |   2 +-
 arch/arm/configs/mvebu_v7_defconfig         |   2 +-
 arch/arm/configs/mxs_defconfig              |   2 +-
 arch/arm/configs/omap2plus_defconfig        |   2 +-
 arch/arm/configs/pxa_defconfig              |   2 +-
 arch/arm/configs/s3c6400_defconfig          |   2 +-
 arch/arm/configs/sama5_defconfig            |   2 +-
 arch/arm/configs/sama7_defconfig            |   2 +-
 arch/arm/configs/shmobile_defconfig         |   2 +-
 arch/arm/configs/socfpga_defconfig          |   2 +-
 arch/arm/configs/tegra_defconfig            |   2 +-
 arch/arm/configs/wpcm450_defconfig          |   2 +-
 arch/loongarch/configs/loongson3_defconfig  |   2 +-
 arch/mips/configs/cavium_octeon_defconfig   |   2 +-
 arch/mips/configs/db1xxx_defconfig          |   2 +-
 arch/powerpc/configs/44x/warp_defconfig     |   2 +-
 arch/powerpc/configs/mpc512x_defconfig      |   2 +-
 arch/powerpc/configs/mpc5200_defconfig      |   2 +-
 arch/powerpc/configs/ppc6xx_defconfig       |   2 +-
 arch/powerpc/configs/skiroot_defconfig      |   2 +-
 drivers/misc/eeprom/Kconfig                 |  31 -------
 drivers/misc/eeprom/Makefile                |   1 -
 drivers/mtd/devices/Kconfig                 |  31 +++++++
 drivers/mtd/devices/Makefile                |   1 +
 drivers/{misc/eeprom => mtd/devices}/at24.c | 122 +++++++++++++++-------------
 drivers/mtd/mtdcore.c                       |  49 ++++++++++-
 include/linux/mtd/mtd.h                     |   5 ++
 include/uapi/mtd/mtd-abi.h                  |   2 +
 42 files changed, 187 insertions(+), 123 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240701-b4-v6-10-topic-usbc-tcpci-c4bc9bcce604

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>

