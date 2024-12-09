Return-Path: <linuxppc-dev+bounces-3858-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1209E8C65
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 08:41:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6DMT4BYdz2xtp;
	Mon,  9 Dec 2024 18:41:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=1.95.21.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733730101;
	cv=none; b=deMC8AZQiciXdjcZCIeEFoJk0zTaPmk6HPGmH0hyQVD1Vd/WIoBhxP93LMIaa+cJ0MvhVZPXq2USQjJjdy6R9O712+I9MEynJos+yYRm/8N0bX08PHFmw3dYWGlb69KumumvLBd2p4ZUv7vppfFPUSPBI5VxVehRKubYtXwk7awn/xFCF/hWR2epdQsczlkSpyPK42lSzokrBpBC7wB5VnBE05xRQFEDuSukBfg23b0G4jjLBeTe6Lk7lgVSYfAMmBQWUvh0cttwckZw8DbCqTstFxlko0aCFi6bgXrF3vjj6GmLAP5/abvn/W5ffi9WvQrhFGhsmZpynpusjSTsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733730101; c=relaxed/relaxed;
	bh=F+/1F5usZGU4xwFJCSgL70wM6kK3SGbjvRaZHVo0Zx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0VC83ojG78F2nEtJc0PCDZxgpdJ0Iwyh+qQWjFQTv8dlq7nLCuOL3xdrNvGiTeJ2pobldABETYCWUkrX9TZItjZgACArdf9P5NnN/eXRXDy6YeW5SaBl6ylSco+f0NQZ5Ak3ps+Gcf3ntpRRICTzwXo3v++trfhvcR5LixpL10xlA9j6tirEZyQOxdzlQtlLPpCbYZrpLhdrdCn80q7OgB9muBjZ95vy3HJz5fqS7I/YfdpgqkXOPCyWH5ipTtuxcLzVLMSmwmZ2UyEkRe4gKSTKubylSjjLTpuQCGmO7Uv+k9br1CWwU8dBNLjuhHr7lqeFFZ93Mm8yQG89uQg+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=yeah.net; dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b=m0B7CQyj; dkim-atps=neutral; spf=pass (client-ip=1.95.21.14; helo=mail-m16.yeah.net; envelope-from=shawnguo2@yeah.net; receiver=lists.ozlabs.org) smtp.mailfrom=yeah.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b=m0B7CQyj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yeah.net (client-ip=1.95.21.14; helo=mail-m16.yeah.net; envelope-from=shawnguo2@yeah.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 657 seconds by postgrey-1.37 at boromir; Mon, 09 Dec 2024 18:41:37 AEDT
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6DMP5x0Hz2xt7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2024 18:41:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=F+/1F5usZGU4xwFJCSgL70wM6kK3SGbjvRaZHVo0Zx0=;
	b=m0B7CQyjdSflcO4FEyoQ1bz1xXtz2aaBneveM0wWc38aRp5vbeDz7ctDwIsbGo
	UpqW1iwusxzg7XkDGBClLBth7ICBRKhCwevETCuxrhblIgjkao37+jwTiBu7SfBf
	aC9mJ7KN6axnCTQ6cuhvoNhlZUkd9iCPaxh/9g5n3Ctew=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgA3fxoBnFZnkeV5BA--.46779S3;
	Mon, 09 Dec 2024 15:28:03 +0800 (CST)
Date: Mon, 9 Dec 2024 15:28:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Adam Ford <aford173@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 10/11] ARM: dts: nxp: imx: Switch to
 {hp,mic}-det-gpios
Message-ID: <Z1acAA7gbxH7QfhT@dragon>
References: <cover.1727438777.git.geert+renesas@glider.be>
 <7ff1bfb73a6d6fc71f3d751dbb7133b045853f64.1727438777.git.geert+renesas@glider.be>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ff1bfb73a6d6fc71f3d751dbb7133b045853f64.1727438777.git.geert+renesas@glider.be>
X-CM-TRANSID:Mc8vCgA3fxoBnFZnkeV5BA--.46779S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUoGQ6UUUUU
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQ6wZWdWeNqUcwAAsm
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Sep 27, 2024 at 02:42:25PM +0200, Geert Uytterhoeven wrote:
> Replace the deprecated "hp-det-gpio" and "mic-det-gpio" properties by
> "hp-det-gpios" resp. "mic-det-gpios" in Freescale Generic ASoC Sound
> Card device nodes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks!


