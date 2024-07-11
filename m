Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F8492F253
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 00:55:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p6+2Cwc3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKqn22LS8z3dd4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 08:55:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p6+2Cwc3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKZxq0XgFz3c47;
	Thu, 11 Jul 2024 23:16:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9831761A8E;
	Thu, 11 Jul 2024 13:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEA8C4AF07;
	Thu, 11 Jul 2024 13:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720703804;
	bh=r4dU6vqYjav3VvaXX3Sjsxc+xsxGdgu1+j2zgdtBir0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p6+2Cwc3E4O2uSx+DH2Km80jUBJZO8J64ERrKxq9KkUeFczRflG9OflmEO510OaXv
	 45jt2cHUGxBY/BUC0Z9hW6R8nyC6DamtRdsZkHJARIg7E3kp7GzysSngCujqlP3VWR
	 TPqx6sTZQOFskGr1UzbUnP1+s/mtIHMsYSvjvwH86bewjS89AL3t0A4IeTK4ozMmE9
	 VfQlqnSZYJdUae8LIwJEfllYADu4Q5SdM6BISkS88tS/ThyaimP+0SKo9mM2mVW7a1
	 WrZ7yUkx93n0H/pTz8Qc0943VkrKQagoUfasatX2jprIFXJOAYW6pqWFKD3Q2FcVk5
	 vMsq9BOw/f7RA==
Date: Thu, 11 Jul 2024 15:16:40 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 00/60] i2c: reword first drivers according to newest
 specification
Message-ID: <nbi3fngfcipt35gzguk2mh4zzh3vy5a5gsk7dti5smm2iimytl@drm7p2iqsinp>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
X-Mailman-Approved-At: Fri, 12 Jul 2024 08:54:28 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Baruch Siach <baruch@tkos.co.il>, Heiko Stuebner <heiko@sntech.de>, Ajay Gupta <ajayg@nvidia.com>, Viresh Kumar <viresh.kumar@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Eddie James <eajames@linux.ibm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Matthias Brugger <matthias.bgg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org, Kamal Dasu <kamal.dasu@broadcom.com>, Benson Leung <bleung@chromium.org>, Stefan Roese <sr@denx.de>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Peter Korsgaard <peter@korsgaard.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Binbin Zhou <zhoubinbin@loongson.cn>, Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Sven Peter <sven@svenpeter.dev>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Ray Jui <rjui@broadcom.com>, Alain Volmat <alain.volmat@foss.st.com>, linux-sunxi@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>, Masami Hiramatsu <mhiramat@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, Jean Delvare <jdelvare@suse.com>, Robert Richter <rric@kernel.org>, Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>, Gregory CLEMENT <gregory.clement@bootlin.com>, Hans Hu <hanshu@zhaoxin.com>, linux-actions@lists.infradead.org, virtualization@lists.linux.dev, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Vladimir Zapolskiy <vz@mleia.com>, Hans de Goede <hdegoede@redhat.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>, linux-tegra@vger.kernel.org, Yicong Yang <yangyicong@hisilicon.com>, Conghui Chen <conghui.chen@intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Scott Branden <sbranden@broadcom.com>, openbmc@lists.ozlabs.org, Thor Thayer <thor.thayer@linux.intel.com>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, Michael Shych <michaelsh@nvidia.com>, Patrice Chotard <patrice.chotard@foss.st.com>, linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, linuxppc-dev@lists.ozlabs.org, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Till Harbaum <till@harbaum.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Wolfram,

pushed in i2c/i2c-host.

Thanks for this big work, at the end it turned out quite nice and
I'm happy of the outcome!

Thanks
Andi

On Sat, Jul 06, 2024 at 01:20:00PM GMT, Wolfram Sang wrote:
> Start changing the wording of the I2C main header wrt. the newest I2C
> v7 and SMBus 3.2 specifications and replace "master/slave" with more
> appropriate terms. This first step renames the members of struct
> i2c_algorithm. Once all in-tree users are converted, the anonymous union
> will go away again. All this work will also pave the way for finally
> seperating the monolithic header into more fine-grained headers like
> "i2c/clients.h" etc. So, this is not a simple renaming-excercise but
> also a chance to update the I2C core to recent Linux standards.
> 
> Changes since v1:
> 
> * changed wording according to the terminology we agreed on and defined
>   upstream. That means consistent use of "controller/target", and no
>   more "host/client". I added "local/remote target" where necessary.
> * added tags which I kept despite some changes in wording. The approach
>   and code changes (if necessary) did not change.
> * rebased to Andi's for-next branch
> * this series only contains patches which convert the drivers fully. If
>   all goes well, no more updates for them are needed. The previous
>   series converted all users of "master_xfer". But to avoid tons of
>   incremental patches to one driver, I will incrementally improve i2c.h
>   and see which drivers can be fully converted step-by-step.
> * do not mention I3C specs in commit messages, not really relevant here
> 
> Please note that I am not super strict with the 80 char limit. And, as
> agreed, I did not convert occasions where old terminology is used in
> register names or bits etc. or in function names outside of the I2C
> realm.
> 
> The outcome is that before this series 115 drivers use old terminology,
> after this only 54. Hooray.
> 
> And a comment to all janitors: Do not convert I2C drivers outside of
> drivers/i2c yet. Let us first gain experience here and present the
> well-tested results of what we figured out to other maintainers then.
> This ensures they have to deal with way less patch revisions.
> 
> Thanks and happy hacking!
> 
> 
> Wolfram Sang (60):
>   i2c: reword i2c_algorithm according to newest specification
>   i2c: ali15x3: reword according to newest specification
>   i2c: altera: reword according to newest specification
>   i2c: au1550: reword according to newest specification
>   i2c: bcm-kona: reword according to newest specification
>   i2c: bcm2835: reword according to newest specification
>   i2c: brcmstb: reword according to newest specification
>   i2c: cht-wc: reword according to newest specification
>   i2c: cp2615: reword according to newest specification
>   i2c: cros-ec-tunnel: reword according to newest specification
>   i2c: davinci: reword according to newest specification
>   i2c: digicolor: reword according to newest specification
>   i2c: diolan-u2c: reword according to newest specification
>   i2c: dln2: reword according to newest specification
>   i2c: fsi: reword according to newest specification
>   i2c: gpio: reword according to newest specification
>   i2c: highlander: reword according to newest specification
>   i2c: hisi: reword according to newest specification
>   i2c: hix5hd2: reword according to newest specification
>   i2c: i801: reword according to newest specification
>   i2c: ibm_iic: reword according to newest specification
>   i2c: iop3xx: reword according to newest specification
>   i2c: isch: reword according to newest specification
>   i2c: jz4780: reword according to newest specification
>   i2c: kempld: reword according to newest specification
>   i2c: ljca: reword according to newest specification
>   i2c: lpc2k: reword according to newest specification
>   i2c: ls2x: reword according to newest specification
>   i2c: mlxcpld: reword according to newest specification
>   i2c: mpc: reword according to newest specification
>   i2c: mt7621: reword according to newest specification
>   i2c: mv64xxx: reword according to newest specification
>   i2c: ocores: reword according to newest specification
>   i2c: octeon: reword according to newest specification
>   i2c: opal: reword according to newest specification
>   i2c: owl: reword according to newest specification
>   i2c: pasemi: reword according to newest specification
>   i2c: piix4: reword according to newest specification
>   i2c: powermac: reword according to newest specification
>   i2c: pxa-pci: reword according to newest specification
>   i2c: riic: reword according to newest specification
>   i2c: rk3x: reword according to newest specification
>   i2c: robotfuzz-osif: reword according to newest specification
>   i2c: rzv2m: reword according to newest specification
>   i2c: sis5595: reword according to newest specification
>   i2c: sprd: reword according to newest specification
>   i2c: stm32f4: reword according to newest specification
>   i2c: sun6i-p2wi: reword according to newest specification
>   i2c: taos-evm: reword according to newest specification
>   i2c: tegra-bpmp: reword according to newest specification
>   i2c: thunderx-pcidrv: reword according to newest specification
>   i2c: tiny-usb: reword according to newest specification
>   i2c: uniphier-f: reword according to newest specification
>   i2c: uniphier: reword according to newest specification
>   i2c: viperboard: reword according to newest specification
>   i2c: viai2c: reword according to newest specification
>   i2c: nvidia-gpu: reword according to newest specification
>   i2c: virtio: reword according to newest specification
>   i2c: cpm: reword according to newest specification
>   i2c: st: reword according to newest specification
> 
>  drivers/i2c/busses/i2c-ali15x3.c         |  2 +-
>  drivers/i2c/busses/i2c-altera.c          |  4 +-
>  drivers/i2c/busses/i2c-au1550.c          | 15 +++----
>  drivers/i2c/busses/i2c-bcm-kona.c        | 13 +++---
>  drivers/i2c/busses/i2c-bcm2835.c         | 10 ++---
>  drivers/i2c/busses/i2c-brcmstb.c         | 11 +++--
>  drivers/i2c/busses/i2c-cht-wc.c          |  8 ++--
>  drivers/i2c/busses/i2c-cp2615.c          |  8 ++--
>  drivers/i2c/busses/i2c-cpm.c             |  4 +-
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c  |  4 +-
>  drivers/i2c/busses/i2c-davinci.c         | 17 ++++---
>  drivers/i2c/busses/i2c-digicolor.c       |  6 +--
>  drivers/i2c/busses/i2c-diolan-u2c.c      |  2 +-
>  drivers/i2c/busses/i2c-dln2.c            |  4 +-
>  drivers/i2c/busses/i2c-fsi.c             | 56 ++++++++++++------------
>  drivers/i2c/busses/i2c-gpio.c            |  8 ++--
>  drivers/i2c/busses/i2c-highlander.c      |  2 +-
>  drivers/i2c/busses/i2c-hisi.c            |  8 ++--
>  drivers/i2c/busses/i2c-hix5hd2.c         |  6 +--
>  drivers/i2c/busses/i2c-i801.c            | 12 ++---
>  drivers/i2c/busses/i2c-ibm_iic.c         | 27 +++++-------
>  drivers/i2c/busses/i2c-iop3xx.c          | 15 +++----
>  drivers/i2c/busses/i2c-isch.c            |  2 +-
>  drivers/i2c/busses/i2c-jz4780.c          |  4 +-
>  drivers/i2c/busses/i2c-kempld.c          |  4 +-
>  drivers/i2c/busses/i2c-ljca.c            | 20 ++++-----
>  drivers/i2c/busses/i2c-lpc2k.c           | 10 ++---
>  drivers/i2c/busses/i2c-ls2x.c            | 11 +++--
>  drivers/i2c/busses/i2c-mlxcpld.c         | 14 +++---
>  drivers/i2c/busses/i2c-mpc.c             |  4 +-
>  drivers/i2c/busses/i2c-mt7621.c          | 26 +++++------
>  drivers/i2c/busses/i2c-mv64xxx.c         | 12 ++---
>  drivers/i2c/busses/i2c-nvidia-gpu.c      |  7 ++-
>  drivers/i2c/busses/i2c-ocores.c          |  8 ++--
>  drivers/i2c/busses/i2c-octeon-core.c     |  6 +--
>  drivers/i2c/busses/i2c-octeon-core.h     |  4 +-
>  drivers/i2c/busses/i2c-octeon-platdrv.c  |  2 +-
>  drivers/i2c/busses/i2c-opal.c            | 10 ++---
>  drivers/i2c/busses/i2c-owl.c             | 12 ++---
>  drivers/i2c/busses/i2c-pasemi-core.c     |  6 +--
>  drivers/i2c/busses/i2c-piix4.c           |  2 +-
>  drivers/i2c/busses/i2c-powermac.c        | 14 +++---
>  drivers/i2c/busses/i2c-pxa-pci.c         |  2 +-
>  drivers/i2c/busses/i2c-riic.c            |  8 ++--
>  drivers/i2c/busses/i2c-rk3x.c            | 20 ++++-----
>  drivers/i2c/busses/i2c-robotfuzz-osif.c  |  4 +-
>  drivers/i2c/busses/i2c-rzv2m.c           | 12 ++---
>  drivers/i2c/busses/i2c-sis5595.c         |  2 +-
>  drivers/i2c/busses/i2c-sprd.c            | 16 +++----
>  drivers/i2c/busses/i2c-st.c              |  8 ++--
>  drivers/i2c/busses/i2c-stm32f4.c         |  8 ++--
>  drivers/i2c/busses/i2c-sun6i-p2wi.c      | 20 ++++-----
>  drivers/i2c/busses/i2c-taos-evm.c        |  2 +-
>  drivers/i2c/busses/i2c-tegra-bpmp.c      |  4 +-
>  drivers/i2c/busses/i2c-thunderx-pcidrv.c |  2 +-
>  drivers/i2c/busses/i2c-tiny-usb.c        |  6 +--
>  drivers/i2c/busses/i2c-uniphier-f.c      | 26 +++++------
>  drivers/i2c/busses/i2c-uniphier.c        | 15 +++----
>  drivers/i2c/busses/i2c-viai2c-common.c   |  2 +-
>  drivers/i2c/busses/i2c-viai2c-wmt.c      |  8 ++--
>  drivers/i2c/busses/i2c-viai2c-zhaoxin.c  | 12 ++---
>  drivers/i2c/busses/i2c-viperboard.c      | 10 ++---
>  drivers/i2c/busses/i2c-virtio.c          |  2 +-
>  include/linux/i2c.h                      | 24 +++++++---
>  64 files changed, 313 insertions(+), 320 deletions(-)
> 
> -- 
> 2.43.0
> 
