Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7902B929381
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 14:16:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=CpjSu7bD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGTrn1zN9z30T3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 22:16:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=CpjSu7bD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGSdF38Pxz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2024 21:21:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=4xGv2GdsCln4go
	c80LSZXUrBL6qxxalWNHk5CsLBJ1w=; b=CpjSu7bDPwZrTYB4DnXqHNJrzzOV0i
	ll8uIcabyZjRJJv8IN4yPeOtXpO4cU3QOhP76TyKvJMMzxzWe7wr6Y8Gfi1EOJAl
	eYaKXSKfSh434zAyHAlKzS3YiYx+9JKmXA5Z4dH8SJCoxnqURGaAyztFVBvyi1yd
	2c/2c5x2P3YnhmZAJ159dGcqaiJS0bS6wqjht7xK0Bj8rjBLCVh+cZ/DSRHm9TfF
	wR6Q+GUBV9AvnC5iTsch/LEkT1PCX7RbFkTTasFpYCXqwNoLS7gYY0t9kNWTlFrw
	SSpGB+37KfH9i4bF3oug8fwFzqzeaLHCrle0xWnEiN2tyJJ+LMS5P9kQ==
Received: (qmail 3809341 invoked from network); 6 Jul 2024 13:21:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:21 +0200
X-UD-Smtp-Session: l3s3148p1@BOAqYZIcotJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH v2 00/60] i2c: reword first drivers according to newest specification
Date: Sat,  6 Jul 2024 13:20:00 +0200
Message-ID: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Jul 2024 22:16:07 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Baruch Siach <baruch@tkos.co.il>, Heiko Stuebner <heiko@sntech.de>, Ajay Gupta <ajayg@nvidia.com>, Viresh Kumar <viresh.kumar@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Eddie James <eajames@linux.ibm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Chris Brandt <chris.brandt@renesas.com>, Thierry Reding <thierry.reding@gmail.com>, Till Harbaum <till@harbaum.org>, Kamal Dasu <kamal.dasu@broadcom.com>, Benson Leung <bleung@chromium.org>, Stefan Roese <sr@denx.de>, linux-stm32@st-md-mailman.stormreply.com, =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>, chrome-platform@lists.linux.dev, Peter Korsgaard <peter@korsgaard.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Binbin Zhou <zhoubinbin@loongson.cn>, Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Sven Peter <sven@svenpeter.dev>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Matthias Brugger <matthias.bgg@gmail.com>, Ray Jui <rjui@broadcom.com>, Alain Volmat <alain.volmat@foss.st.com>, linux-sunxi@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>, Masami Hiramatsu <mhiramat@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, Jean Delvare <jdelvare@suse.com>, Robert Richter <rric@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Hans Hu <hanshu@zhaoxin.com>, linux-actions@lists.infradead.org, virtualization@lists.linux.dev, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Vladimir Zapolskiy <vz@mleia.com>, Hans de Goede <hdegoede@redhat.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>, linux-tegra@vger.kernel.org, Yicong Yang <yangyicong@hisilicon.com>, Conghui Chen <conghui.chen@intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Scott Branden <sbranden@broadcom.com>, openbmc@lists.ozlabs.org, Thor Thayer <thor.thayer@linux.intel.com>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, Michael Shych <michaelsh@nvidia.com>, Patrice Chotard <patrice.chotard@foss.st.com>, linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Start changing the wording of the I2C main header wrt. the newest I2C
v7 and SMBus 3.2 specifications and replace "master/slave" with more
appropriate terms. This first step renames the members of struct
i2c_algorithm. Once all in-tree users are converted, the anonymous union
will go away again. All this work will also pave the way for finally
seperating the monolithic header into more fine-grained headers like
"i2c/clients.h" etc. So, this is not a simple renaming-excercise but
also a chance to update the I2C core to recent Linux standards.

Changes since v1:

* changed wording according to the terminology we agreed on and defined
  upstream. That means consistent use of "controller/target", and no
  more "host/client". I added "local/remote target" where necessary.
* added tags which I kept despite some changes in wording. The approach
  and code changes (if necessary) did not change.
* rebased to Andi's for-next branch
* this series only contains patches which convert the drivers fully. If
  all goes well, no more updates for them are needed. The previous
  series converted all users of "master_xfer". But to avoid tons of
  incremental patches to one driver, I will incrementally improve i2c.h
  and see which drivers can be fully converted step-by-step.
* do not mention I3C specs in commit messages, not really relevant here

Please note that I am not super strict with the 80 char limit. And, as
agreed, I did not convert occasions where old terminology is used in
register names or bits etc. or in function names outside of the I2C
realm.

The outcome is that before this series 115 drivers use old terminology,
after this only 54. Hooray.

And a comment to all janitors: Do not convert I2C drivers outside of
drivers/i2c yet. Let us first gain experience here and present the
well-tested results of what we figured out to other maintainers then.
This ensures they have to deal with way less patch revisions.

Thanks and happy hacking!


Wolfram Sang (60):
  i2c: reword i2c_algorithm according to newest specification
  i2c: ali15x3: reword according to newest specification
  i2c: altera: reword according to newest specification
  i2c: au1550: reword according to newest specification
  i2c: bcm-kona: reword according to newest specification
  i2c: bcm2835: reword according to newest specification
  i2c: brcmstb: reword according to newest specification
  i2c: cht-wc: reword according to newest specification
  i2c: cp2615: reword according to newest specification
  i2c: cros-ec-tunnel: reword according to newest specification
  i2c: davinci: reword according to newest specification
  i2c: digicolor: reword according to newest specification
  i2c: diolan-u2c: reword according to newest specification
  i2c: dln2: reword according to newest specification
  i2c: fsi: reword according to newest specification
  i2c: gpio: reword according to newest specification
  i2c: highlander: reword according to newest specification
  i2c: hisi: reword according to newest specification
  i2c: hix5hd2: reword according to newest specification
  i2c: i801: reword according to newest specification
  i2c: ibm_iic: reword according to newest specification
  i2c: iop3xx: reword according to newest specification
  i2c: isch: reword according to newest specification
  i2c: jz4780: reword according to newest specification
  i2c: kempld: reword according to newest specification
  i2c: ljca: reword according to newest specification
  i2c: lpc2k: reword according to newest specification
  i2c: ls2x: reword according to newest specification
  i2c: mlxcpld: reword according to newest specification
  i2c: mpc: reword according to newest specification
  i2c: mt7621: reword according to newest specification
  i2c: mv64xxx: reword according to newest specification
  i2c: ocores: reword according to newest specification
  i2c: octeon: reword according to newest specification
  i2c: opal: reword according to newest specification
  i2c: owl: reword according to newest specification
  i2c: pasemi: reword according to newest specification
  i2c: piix4: reword according to newest specification
  i2c: powermac: reword according to newest specification
  i2c: pxa-pci: reword according to newest specification
  i2c: riic: reword according to newest specification
  i2c: rk3x: reword according to newest specification
  i2c: robotfuzz-osif: reword according to newest specification
  i2c: rzv2m: reword according to newest specification
  i2c: sis5595: reword according to newest specification
  i2c: sprd: reword according to newest specification
  i2c: stm32f4: reword according to newest specification
  i2c: sun6i-p2wi: reword according to newest specification
  i2c: taos-evm: reword according to newest specification
  i2c: tegra-bpmp: reword according to newest specification
  i2c: thunderx-pcidrv: reword according to newest specification
  i2c: tiny-usb: reword according to newest specification
  i2c: uniphier-f: reword according to newest specification
  i2c: uniphier: reword according to newest specification
  i2c: viperboard: reword according to newest specification
  i2c: viai2c: reword according to newest specification
  i2c: nvidia-gpu: reword according to newest specification
  i2c: virtio: reword according to newest specification
  i2c: cpm: reword according to newest specification
  i2c: st: reword according to newest specification

 drivers/i2c/busses/i2c-ali15x3.c         |  2 +-
 drivers/i2c/busses/i2c-altera.c          |  4 +-
 drivers/i2c/busses/i2c-au1550.c          | 15 +++----
 drivers/i2c/busses/i2c-bcm-kona.c        | 13 +++---
 drivers/i2c/busses/i2c-bcm2835.c         | 10 ++---
 drivers/i2c/busses/i2c-brcmstb.c         | 11 +++--
 drivers/i2c/busses/i2c-cht-wc.c          |  8 ++--
 drivers/i2c/busses/i2c-cp2615.c          |  8 ++--
 drivers/i2c/busses/i2c-cpm.c             |  4 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c  |  4 +-
 drivers/i2c/busses/i2c-davinci.c         | 17 ++++---
 drivers/i2c/busses/i2c-digicolor.c       |  6 +--
 drivers/i2c/busses/i2c-diolan-u2c.c      |  2 +-
 drivers/i2c/busses/i2c-dln2.c            |  4 +-
 drivers/i2c/busses/i2c-fsi.c             | 56 ++++++++++++------------
 drivers/i2c/busses/i2c-gpio.c            |  8 ++--
 drivers/i2c/busses/i2c-highlander.c      |  2 +-
 drivers/i2c/busses/i2c-hisi.c            |  8 ++--
 drivers/i2c/busses/i2c-hix5hd2.c         |  6 +--
 drivers/i2c/busses/i2c-i801.c            | 12 ++---
 drivers/i2c/busses/i2c-ibm_iic.c         | 27 +++++-------
 drivers/i2c/busses/i2c-iop3xx.c          | 15 +++----
 drivers/i2c/busses/i2c-isch.c            |  2 +-
 drivers/i2c/busses/i2c-jz4780.c          |  4 +-
 drivers/i2c/busses/i2c-kempld.c          |  4 +-
 drivers/i2c/busses/i2c-ljca.c            | 20 ++++-----
 drivers/i2c/busses/i2c-lpc2k.c           | 10 ++---
 drivers/i2c/busses/i2c-ls2x.c            | 11 +++--
 drivers/i2c/busses/i2c-mlxcpld.c         | 14 +++---
 drivers/i2c/busses/i2c-mpc.c             |  4 +-
 drivers/i2c/busses/i2c-mt7621.c          | 26 +++++------
 drivers/i2c/busses/i2c-mv64xxx.c         | 12 ++---
 drivers/i2c/busses/i2c-nvidia-gpu.c      |  7 ++-
 drivers/i2c/busses/i2c-ocores.c          |  8 ++--
 drivers/i2c/busses/i2c-octeon-core.c     |  6 +--
 drivers/i2c/busses/i2c-octeon-core.h     |  4 +-
 drivers/i2c/busses/i2c-octeon-platdrv.c  |  2 +-
 drivers/i2c/busses/i2c-opal.c            | 10 ++---
 drivers/i2c/busses/i2c-owl.c             | 12 ++---
 drivers/i2c/busses/i2c-pasemi-core.c     |  6 +--
 drivers/i2c/busses/i2c-piix4.c           |  2 +-
 drivers/i2c/busses/i2c-powermac.c        | 14 +++---
 drivers/i2c/busses/i2c-pxa-pci.c         |  2 +-
 drivers/i2c/busses/i2c-riic.c            |  8 ++--
 drivers/i2c/busses/i2c-rk3x.c            | 20 ++++-----
 drivers/i2c/busses/i2c-robotfuzz-osif.c  |  4 +-
 drivers/i2c/busses/i2c-rzv2m.c           | 12 ++---
 drivers/i2c/busses/i2c-sis5595.c         |  2 +-
 drivers/i2c/busses/i2c-sprd.c            | 16 +++----
 drivers/i2c/busses/i2c-st.c              |  8 ++--
 drivers/i2c/busses/i2c-stm32f4.c         |  8 ++--
 drivers/i2c/busses/i2c-sun6i-p2wi.c      | 20 ++++-----
 drivers/i2c/busses/i2c-taos-evm.c        |  2 +-
 drivers/i2c/busses/i2c-tegra-bpmp.c      |  4 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  2 +-
 drivers/i2c/busses/i2c-tiny-usb.c        |  6 +--
 drivers/i2c/busses/i2c-uniphier-f.c      | 26 +++++------
 drivers/i2c/busses/i2c-uniphier.c        | 15 +++----
 drivers/i2c/busses/i2c-viai2c-common.c   |  2 +-
 drivers/i2c/busses/i2c-viai2c-wmt.c      |  8 ++--
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c  | 12 ++---
 drivers/i2c/busses/i2c-viperboard.c      | 10 ++---
 drivers/i2c/busses/i2c-virtio.c          |  2 +-
 include/linux/i2c.h                      | 24 +++++++---
 64 files changed, 313 insertions(+), 320 deletions(-)

-- 
2.43.0

