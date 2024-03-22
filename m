Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 138A3886D28
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 14:33:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=a6wbfcte;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1NZf5w8Lz3vss
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 00:33:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=a6wbfcte;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1NYs2TFMz3vqd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 00:33:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=bOf4HkOrzle/Fy
	JG8mZHPOABnHhQv51u3vi0fpeyQ5Q=; b=a6wbfcte3+iXXCHibc+JrZzTin6dRv
	R/KSB8hp01+LD2eYy9sHlg2rk631UWOsn12Y+n+kLseFY+llqMyTkAsXsa6SiRwh
	MWm4LoN2zRJucl7AcBuXiztmbKc/EIBM7mZDtMCuyBPr9HgJZmeZ/QrbcrtglWHS
	XN+P7gn2zQD/Lze6LmCDGEGHL9G2ujuVTWCU21W3oIUiV/btIhr/tqNO2UzK6c7u
	GiqtIoKlD88U2nMoYFxi6SLiCaIBiXxhRRTMJxL3pZ9O0lWnbgR868o+Ty13YBXb
	C70pYVUa6DcFGd/ysTyvqG2U7fdTnfOcmCXLvQLbrSiCtbkj8qjVIAVA==
Received: (qmail 3869988 invoked from network); 22 Mar 2024 14:26:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:20 +0100
X-UD-Smtp-Session: l3s3148p1@LoLvxD8UMpNehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 00/64] i2c: reword i2c_algorithm according to newest specification
Date: Fri, 22 Mar 2024 14:24:53 +0100
Message-ID: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, linux-mips@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, virtualization@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Okay, we need to begin somewhere...

Start changing the wording of the I2C main header wrt. the newest I2C
v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
appropriate terms. This first step renames the members of struct
i2c_algorithm. Once all in-tree users are converted, the anonymous union
will go away again. All this work will also pave the way for finally
seperating the monolithic header into more fine-grained headers like
"i2c/clients.h" etc. So, this is not a simple renaming-excercise but
also a chance to update the I2C core to recent Linux standards.

My motivation is to improve the I2C core API, in general. My motivation
is not to clean each and every driver. I think this is impossible
because register names based on official documentation will need to stay
as they are. But the Linux-internal names should be updated IMO.

That being said, I worked on 62 drivers in this series beyond plain
renames inside 'struct i2c_algorithm' because the fruits were so
low-hanging. Before this series, 112 files in the 'busses/' directory
contained 'master' and/or 'slave'. After the series, only 57. Why not?

Next step is updating the drivers outside the 'i2c'-folder regarding
'struct i2c_algorithm' so we can remove the anonymous union ASAP. To be
able to work on this with minimal dependencies, I'd like to apply this
series between -rc1 and -rc2.

I hope this will work for you guys. The changes are really minimal. If
you are not comfortable with changes to your driver or need more time to
review, please NACK the patch and I will drop the patch and/or address
the issues separeately.

@Andi: are you okay with this approach? It means you'd need to merge
-rc2 into your for-next branch. Or rebase if all fails.

Speaking of Andi, thanks a lot to him taking care of the controller
drivers these days. His work really gives me the freedom to work on I2C
core issues again. Also, Renesas deserves a honorable mention here for
increased support of my I2C activities. Thank you!

If you have comments, hints, etc, please let me know.

Happy hacking,

   Wolfram


Wolfram Sang (64):
  i2c: reword i2c_algorithm according to newest specification
  i2c: ali15x3: reword according to newest specification
  i2c: altera: reword according to newest specification
  i2c: amd-mp2-pci: reword according to newest specification
  i2c: aspeed: reword according to newest specification
  i2c: au1550: reword according to newest specification
  i2c: bcm-iproc: reword according to newest specification
  i2c: bcm-kona: reword according to newest specification
  i2c: bcm2835: reword according to newest specification
  i2c: brcmstb: reword according to newest specification
  i2c: cadence: reword according to newest specification
  i2c: cht-wc: reword according to newest specification
  i2c: cp2615: reword according to newest specification
  i2c: cpm: reword according to newest specification
  i2c: davinci: reword according to newest specification
  i2c: digicolor: reword according to newest specification
  i2c: dln2: reword according to newest specification
  i2c: eg20t: reword according to newest specification
  i2c: emev2: reword according to newest specification
  i2c: fsi: reword according to newest specification
  i2c: gpio: reword according to newest specification
  i2c: highlander: reword according to newest specification
  i2c: hix5hd2: reword according to newest specification
  i2c: i801: reword according to newest specification
  i2c: ibm_iic: reword according to newest specification
  i2c: imx-lpi2c: reword according to newest specification
  i2c: iop3xx: reword according to newest specification
  i2c: isch: reword according to newest specification
  i2c: ismt: reword according to newest specification
  i2c: ljca: reword according to newest specification
  i2c: lpc2k: reword according to newest specification
  i2c: ls2x: reword according to newest specification
  i2c: mchp-pci1xxxx: reword according to newest specification
  i2c: microchip-corei2c: reword according to newest specification
  i2c: mlxcpld: reword according to newest specification
  i2c: mpc: reword according to newest specification
  i2c: mt7621: reword according to newest specification
  i2c: mv64xxx: reword according to newest specification
  i2c: octeon-core: reword according to newest specification
  i2c: owl: reword according to newest specification
  i2c: piix4: reword according to newest specification
  i2c: powermac: reword according to newest specification
  i2c: pxa-pci: reword according to newest specification
  i2c: qup: reword according to newest specification
  i2c: rcar: reword according to newest specification
  i2c: riic: reword according to newest specification
  i2c: rk3x: reword according to newest specification
  i2c: sh7760: reword according to newest specification
  i2c: sh_mobile: reword according to newest specification
  i2c: sis5595: reword according to newest specification
  i2c: sis630: reword according to newest specification
  i2c: sprd: reword according to newest specification
  i2c: st: reword according to newest specification
  i2c: stm32f4: reword according to newest specification
  i2c: sun6i-p2wi: reword according to newest specification
  i2c: synquacer: reword according to newest specification
  i2c: taos-evm: reword according to newest specification
  i2c: tiny-usb: reword according to newest specification
  i2c: uniphier-f: reword according to newest specification
  i2c: uniphier: reword according to newest specification
  i2c: viperboard: reword according to newest specification
  i2c: xlp9xx: reword according to newest specification
  i2c: scx200_acb: reword according to newest specification
  i2c: reword i2c_algorithm in drivers according to newest specification

 drivers/i2c/busses/i2c-ali15x3.c           |  2 +-
 drivers/i2c/busses/i2c-altera.c            |  4 +-
 drivers/i2c/busses/i2c-amd-mp2-pci.c       |  8 ++--
 drivers/i2c/busses/i2c-amd-mp2-plat.c      |  2 +-
 drivers/i2c/busses/i2c-aspeed.c            | 26 +++++-----
 drivers/i2c/busses/i2c-at91-master.c       |  2 +-
 drivers/i2c/busses/i2c-at91-slave.c        |  8 ++--
 drivers/i2c/busses/i2c-au1550.c            | 14 +++---
 drivers/i2c/busses/i2c-axxia.c             | 10 ++--
 drivers/i2c/busses/i2c-bcm-iproc.c         | 20 ++++----
 drivers/i2c/busses/i2c-bcm-kona.c          | 14 +++---
 drivers/i2c/busses/i2c-bcm2835.c           |  8 ++--
 drivers/i2c/busses/i2c-brcmstb.c           | 12 ++---
 drivers/i2c/busses/i2c-cadence.c           | 14 +++---
 drivers/i2c/busses/i2c-cht-wc.c            |  8 ++--
 drivers/i2c/busses/i2c-cp2615.c            |  6 +--
 drivers/i2c/busses/i2c-cpm.c               |  4 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c    |  2 +-
 drivers/i2c/busses/i2c-davinci.c           | 13 +++--
 drivers/i2c/busses/i2c-designware-master.c |  2 +-
 drivers/i2c/busses/i2c-designware-slave.c  |  8 ++--
 drivers/i2c/busses/i2c-digicolor.c         |  4 +-
 drivers/i2c/busses/i2c-diolan-u2c.c        |  2 +-
 drivers/i2c/busses/i2c-dln2.c              |  4 +-
 drivers/i2c/busses/i2c-eg20t.c             | 10 ++--
 drivers/i2c/busses/i2c-emev2.c             | 10 ++--
 drivers/i2c/busses/i2c-exynos5.c           |  4 +-
 drivers/i2c/busses/i2c-fsi.c               | 56 +++++++++++-----------
 drivers/i2c/busses/i2c-gpio.c              |  8 ++--
 drivers/i2c/busses/i2c-gxp.c               | 12 ++---
 drivers/i2c/busses/i2c-highlander.c        |  2 +-
 drivers/i2c/busses/i2c-hisi.c              |  4 +-
 drivers/i2c/busses/i2c-hix5hd2.c           |  4 +-
 drivers/i2c/busses/i2c-i801.c              | 12 ++---
 drivers/i2c/busses/i2c-ibm_iic.c           | 26 +++++-----
 drivers/i2c/busses/i2c-img-scb.c           |  2 +-
 drivers/i2c/busses/i2c-imx-lpi2c.c         | 10 ++--
 drivers/i2c/busses/i2c-imx.c               | 12 ++---
 drivers/i2c/busses/i2c-iop3xx.c            | 10 ++--
 drivers/i2c/busses/i2c-isch.c              |  2 +-
 drivers/i2c/busses/i2c-ismt.c              |  2 +-
 drivers/i2c/busses/i2c-jz4780.c            |  2 +-
 drivers/i2c/busses/i2c-kempld.c            |  2 +-
 drivers/i2c/busses/i2c-ljca.c              | 20 ++++----
 drivers/i2c/busses/i2c-lpc2k.c             |  8 ++--
 drivers/i2c/busses/i2c-ls2x.c              |  8 ++--
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c     | 40 ++++++++--------
 drivers/i2c/busses/i2c-meson.c             |  4 +-
 drivers/i2c/busses/i2c-microchip-corei2c.c |  4 +-
 drivers/i2c/busses/i2c-mlxbf.c             |  8 ++--
 drivers/i2c/busses/i2c-mlxcpld.c           | 12 ++---
 drivers/i2c/busses/i2c-mpc.c               |  4 +-
 drivers/i2c/busses/i2c-mt65xx.c            |  2 +-
 drivers/i2c/busses/i2c-mt7621.c            | 22 ++++-----
 drivers/i2c/busses/i2c-mv64xxx.c           | 12 ++---
 drivers/i2c/busses/i2c-mxs.c               |  2 +-
 drivers/i2c/busses/i2c-nomadik.c           |  2 +-
 drivers/i2c/busses/i2c-npcm7xx.c           | 12 ++---
 drivers/i2c/busses/i2c-nvidia-gpu.c        |  4 +-
 drivers/i2c/busses/i2c-ocores.c            |  8 ++--
 drivers/i2c/busses/i2c-octeon-core.c       |  6 +--
 drivers/i2c/busses/i2c-octeon-platdrv.c    |  2 +-
 drivers/i2c/busses/i2c-omap.c              |  4 +-
 drivers/i2c/busses/i2c-opal.c              |  4 +-
 drivers/i2c/busses/i2c-owl.c               | 10 ++--
 drivers/i2c/busses/i2c-pasemi-core.c       |  2 +-
 drivers/i2c/busses/i2c-piix4.c             |  2 +-
 drivers/i2c/busses/i2c-pnx.c               |  2 +-
 drivers/i2c/busses/i2c-powermac.c          |  8 ++--
 drivers/i2c/busses/i2c-pxa-pci.c           |  2 +-
 drivers/i2c/busses/i2c-pxa.c               | 12 ++---
 drivers/i2c/busses/i2c-qcom-cci.c          |  2 +-
 drivers/i2c/busses/i2c-qcom-geni.c         |  2 +-
 drivers/i2c/busses/i2c-qup.c               |  6 +--
 drivers/i2c/busses/i2c-rcar.c              | 16 +++----
 drivers/i2c/busses/i2c-riic.c              |  6 +--
 drivers/i2c/busses/i2c-rk3x.c              | 18 +++----
 drivers/i2c/busses/i2c-robotfuzz-osif.c    |  2 +-
 drivers/i2c/busses/i2c-rzv2m.c             |  8 ++--
 drivers/i2c/busses/i2c-s3c2410.c           |  4 +-
 drivers/i2c/busses/i2c-sh7760.c            | 18 +++----
 drivers/i2c/busses/i2c-sh_mobile.c         | 12 ++---
 drivers/i2c/busses/i2c-sis5595.c           |  2 +-
 drivers/i2c/busses/i2c-sis630.c            | 16 +++----
 drivers/i2c/busses/i2c-sprd.c              | 14 +++---
 drivers/i2c/busses/i2c-st.c                | 17 +++----
 drivers/i2c/busses/i2c-stm32f4.c           |  8 ++--
 drivers/i2c/busses/i2c-stm32f7.c           | 14 +++---
 drivers/i2c/busses/i2c-sun6i-p2wi.c        | 20 ++++----
 drivers/i2c/busses/i2c-synquacer.c         | 30 ++++++------
 drivers/i2c/busses/i2c-taos-evm.c          |  2 +-
 drivers/i2c/busses/i2c-tegra-bpmp.c        |  4 +-
 drivers/i2c/busses/i2c-tegra.c             |  4 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c   |  2 +-
 drivers/i2c/busses/i2c-tiny-usb.c          |  4 +-
 drivers/i2c/busses/i2c-uniphier-f.c        | 22 ++++-----
 drivers/i2c/busses/i2c-uniphier.c          | 12 ++---
 drivers/i2c/busses/i2c-viperboard.c        |  8 ++--
 drivers/i2c/busses/i2c-virtio.c            |  2 +-
 drivers/i2c/busses/i2c-wmt.c               |  2 +-
 drivers/i2c/busses/i2c-xiic.c              |  2 +-
 drivers/i2c/busses/i2c-xlp9xx.c            |  4 +-
 drivers/i2c/busses/scx200_acb.c            |  4 +-
 include/linux/i2c.h                        | 24 ++++++++--
 104 files changed, 460 insertions(+), 464 deletions(-)

-- 
2.43.0

