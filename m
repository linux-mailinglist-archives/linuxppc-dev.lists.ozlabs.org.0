Return-Path: <linuxppc-dev+bounces-3859-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ABB9E8C74
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 08:42:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6DNV0sp0z2y66;
	Mon,  9 Dec 2024 18:42:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=1.95.21.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733730154;
	cv=none; b=CvFHZiu43gx1CCtmkjROY2NVihix3OIy2GWgI3lGdKpjtYvuUke8QuUhxaQIwvNUoWNjAK0xhhZlDwQw7/MtrerFdyRy76ckgTt+a8QY/atC8MZaIH3/zWPsjMUG4x0J1X4ssRz5zsxLikBKAroEpcsLP+yDjZHXR0qckwFotirY65FTI/MlTX1Jl6Tegjlm9AGbGD3/aAwewq5ejZQc30WMRH9uLwEFNqy/kM+x/U2crEqVzOoOftL9KFGj1nPaa16K6vRu2N2QnN1RmyDoeQSIVb6fS688L/a0lfaIVEtDrXQOC+dzWbs/GmtIOcnC89r/tgNt69p9hhX4Onha9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733730154; c=relaxed/relaxed;
	bh=/kuYzy4TvOvrW5Ysb7raR4QcHn1lxSFVuvD5F5LoL8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNYRGZVq+ACOHtOdlXi8UXoBigMwnSmBuErKYaz9z8YhXi6o98McUbwuVOHf7y3qsaGvIz2LPYjBua4aux3PzbQsEca8Z6tkKlYSZw04mCa/nHOiFUr/a2hTHikvvh/L6vdlBieUj0KkhPZpPuHUmmvSGkAAmJZyLWUgoCtfyAn7DoG9W2NNLPoCR+l2kBfgzRICVDlCrQhJJGu+ofwQbmkIhKQTbRMexinJTJAvIAuQN064RvHQOOH5r9kl/J2S3wo7LLgq9xHDQZ04sx0WM/qddk1pRLevrpE/F463A2GRRWqH8BgE8zJLhbMJmHbE0yRnlN/lfzDjpM7AWIO8ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=yeah.net; dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b=N97k7Cry; dkim-atps=neutral; spf=pass (client-ip=1.95.21.14; helo=mail-m16.yeah.net; envelope-from=shawnguo2@yeah.net; receiver=lists.ozlabs.org) smtp.mailfrom=yeah.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b=N97k7Cry;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yeah.net (client-ip=1.95.21.14; helo=mail-m16.yeah.net; envelope-from=shawnguo2@yeah.net; receiver=lists.ozlabs.org)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6DNS37VJz2xt7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2024 18:42:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/kuYzy4TvOvrW5Ysb7raR4QcHn1lxSFVuvD5F5LoL8s=;
	b=N97k7CryICfX9jh86hJTeBgEADIbl2Lo29RYU94PkaJvrZv89euFfIkA+t8m7E
	4sFUhL9EKlkhDetYq+lXjqDHhehecPNcCMscua1nbfV9cUrYp0s75prWk5006qpI
	EuKiOPQXYyTPxhfdREhNVONR9ejRz9VYvu3+9sJopUgX4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCHe+ZOnFZnMep5BA--.46497S3;
	Mon, 09 Dec 2024 15:29:20 +0800 (CST)
Date: Mon, 9 Dec 2024 15:29:18 +0800
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
Subject: Re: [PATCH treewide 04/11] arm64: dts: freescale: imx: Switch to
 simple-audio-card,hp-det-gpios
Message-ID: <Z1acTq/JV/JTHllY@dragon>
References: <cover.1727438777.git.geert+renesas@glider.be>
 <b38545c29d6cbf0b394ddb4747ce810c679f95d1.1727438777.git.geert+renesas@glider.be>
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
In-Reply-To: <b38545c29d6cbf0b394ddb4747ce810c679f95d1.1727438777.git.geert+renesas@glider.be>
X-CM-TRANSID:Mc8vCgCHe+ZOnFZnMep5BA--.46497S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUodgAUUUUU
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERiwZWdWZpHlSgAAs1
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Sep 27, 2024 at 02:42:19PM +0200, Geert Uytterhoeven wrote:
> Replace the deprecated "simple-audio-card,hp-det-gpio" property by
> "simple-audio-card,hp-det-gpios" in Simple Audio Card device nodes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks!


