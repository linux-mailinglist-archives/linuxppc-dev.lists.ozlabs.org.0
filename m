Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2787B0F2A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 00:58:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BghfInz1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwsV56MV8z3c9x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 08:58:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BghfInz1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=andersson@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwsTF08v4z2y1j;
	Thu, 28 Sep 2023 08:57:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0A5BAB818F7;
	Wed, 27 Sep 2023 22:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53C9C433C7;
	Wed, 27 Sep 2023 22:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695855467;
	bh=U6mvGN6IUsN3aQ3Mg+rtFDHole4TLUqxeXU4RuqCc9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BghfInz1dtGj+a0NwGrQpQyiHTPQFE7pGKytrpsBClpu9NX2eDcjSChVYZmAF6XDB
	 owkxfj0jdteMSoWlG/cGItYI7rwQRUHp8gvgTfu6LqVuG2Ju3NmaLW+PzihWROGETC
	 8im2c1V6bhHXdTgg2FyeVqoOoGl2C9rGCm7cO+QnD4KASaYNOMS1b5kWe3RD3hlBwa
	 8K94UVok49+wD2jCK35a7ooWNY6CyXEsRolTaaTlHbmMq6gapMGZ2q5sD3ePlXHOQS
	 huIRK9HVFU8DWh9mV8DVS8hYOkca+rRCVDtybY9i3VxzNc3SAJ8sCy+Qm1xR/Ceo4m
	 4kcCfJF20jzJQ==
Date: Wed, 27 Sep 2023 16:01:58 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/40] soc: Convert to platform remove callback returning
 void
Message-ID: <f4hvrslynlgmxu4a2gogc5idvumskhaalxgwildy56yqk2wz7d@lkh4swkv52mi>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
 <CACPK8XeROYz_XaB3TvUhdXm7Vm8fjC8yU+mfvA58=_FiDrBy-g@mail.gmail.com>
 <1b2fddf8-c0a6-4afa-8ad0-f280dea1607f@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b2fddf8-c0a6-4afa-8ad0-f280dea1607f@app.fastmail.com>
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
Cc: Nishanth Menon <nm@ti.com>, Herve Codina <herve.codina@bootlin.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Mateusz Holenko <mholenko@antmicro.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-tegra@vger.kernel.org, "Conor.Dooley" <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, linux-riscv@lists.infradead.org, Karol Gugala <kgugala@antmicro.com>, Qiang Zhao <qiang.zhao@nxp.com>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Rob Herring <robh@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Ruan Jinjie <ruanjinjie@huawei.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, Jon Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Gabriel Somlo <gsomlo@gmail.com>, Andy Gross <agross@kernel.org>, Huisong Li <lihuisong@huawei.com>, Joel Stanley <joel@jms.id.au>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Sumit Gupta <sumitg@nvidia.com>, "zhang
 .songyi" <zhang.songyi@zte.com.cn>, Zev Weiss <zev@bewilderbeest.net>, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>, Lubomir Rintel <lkundrak@v3.sk>, Krzysztof Halasa <khalasa@piap.pl>, loongarch@lists.linux.dev, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org, Shang XiaoJing <shangxiaojing@huawei.com>, Leo Li <leoyang.li@nxp.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mediatek@lists.infradead.org, Nick Alcock <nick.alcock@oracle.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 27, 2023 at 10:43:16AM +0200, Arnd Bergmann wrote:
> On Wed, Sep 27, 2023, at 04:25, Joel Stanley wrote:
> > On Mon, 25 Sept 2023 at 09:55, Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:
> >>
> >> this series converts all platform drivers below drivers/soc to use
> >> .remove_new(). The motivation is to get rid of an integer return code
> >> that is (mostly) ignored by the platform driver core and error prone on
> >> the driver side.
> >>
> >> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> >> returns no value") for an extended explanation and the eventual goal.
> >>
> >> As there is no single maintainer team for drivers/soc, I suggest the
> >> individual maintainers to pick up "their" patches.
> >
> > I'd be happy if Arnd merged the lot at once. Arnd, what do you think?
> >
> > If that will be too messy then I understand. I have queued the aspeed
> > ones locally and will push that out if we decide that's the best way
> > to go.
> 
> The main downside of merging it all at once through the soc tree
> is that there may be patches that conflict with other work going on
> in individual drivers.
> 
> What I'd suggest doing here is:
> 
> - have platform maintainers pick up patches for their drivers
>   if that is their preference for any reason
> 

I'd prefer this for the qcom drivers at least, please let me know if you
would like me to proceed.

Regards,
Bjorn

> - get a pull request from Uwe for the soc tree for anything that has
>   not been picked up in one or two weeks from now
> 
>       Arnd
