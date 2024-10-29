Return-Path: <linuxppc-dev+bounces-2677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9C39B4534
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 10:04:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xd47c0Kwvz2yD8;
	Tue, 29 Oct 2024 20:04:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730192651;
	cv=none; b=fem7/vX5PwqKq0oZgAuVtkztSOAOKSb3qCLiO1QY5OETi7qE8fKpHGggp79I17a/B1XzYqLo3kvEtsD8MJFs5OjNKG6WSxtgdzqGLMl18AifpBFEyVIf9Fe9oEs5mcwvXKERAlkjYUEbrxF+bwVJ+tUoRMV61zb+ZZG+3OAQLrHwo5NTsSooqJ5eKFuBbvHmlzCZcyZnNwwFZjMtIBhInZhRnlWiJ9vEjSfgeAxEfd1Rmr85ktuTvNvPHqxL4KdPqHEnIJzuYi84fqoOFEMqoQj0iLDgeC/cBpZXXVXljCzjieDfb3y2lRuJkfesRT1mf/06282CNxOtnbBH8A2Dug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730192651; c=relaxed/relaxed;
	bh=hpAfK6tyrvwMS8L2PbzrGqnbfuzjHJrlMvInkHIHnZI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYmnCVtORdwI2DPvHXfScpO9k7axmwInIHptdB/S28sT7vTb9PzUtjWEWsnVvbbfB36zzxBRO0Fo2K3YSDqnqfGm0sTp5UEmayOws+m2QZ/+fxzGCGSpqA3VL++s0mG4zVK3YtFoA4xK27H5rdUP1mMg7rXrJWfMqUMRlUYGTZWDbYo/DDecgzZJiKo79ACH28ZcNqPZ2c960+SyUZLceixNG7gewCPkYsD2WZRSahB3UEuVxyB4pVazSwnz2kGEK39o4N5sRwgzlZPm4IJWITVlShUZNjBqjVG28U8/uYq1kQSWyox2LVadLRoPp0t/bY7v8ZRBwGYfiJgZbbJrAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=WkhI/DVq; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=WkhI/DVq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xd47Y54wVz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 20:04:05 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C68791BF204;
	Tue, 29 Oct 2024 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730192635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hpAfK6tyrvwMS8L2PbzrGqnbfuzjHJrlMvInkHIHnZI=;
	b=WkhI/DVqn/dDgEGXg5ze24s00SnuWWK8bmgYFAQaSQSgHS/3+b0O5sNNKTStjAxR/jf+4h
	0o6b25F5CM6hzS4ApkL7rjJteF/3WsvIXr9Is7v7RNPDr1hM6SgZtytzIUP4gZ5dtlEpLg
	COgrRCbWe5DTxWzSVRzksGVJyb597rnqQCl5AJLLhtHIb4htqmGNuaCLmKvnbildk9oQPe
	IqjYlYEsv6PJq4Tpe9bBIT7sk8n1gJbWFWN3kIUiX2Dd+Sk2UHidAD1P51iPnXfsSARzVl
	nu+FDRAug3FdoWJxDLz5FVgjrXmtG+m82/IUNQdOKDRvvPwaBoAqjYk9s9Gx2w==
Date: Tue, 29 Oct 2024 10:03:47 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Qiang Zhao
 <qiang.zhao@nxp.com>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Huisong Li <lihuisong@huawei.com>, Linus Walleij <linusw@kernel.org>, Imre
 Kaloz <kaloz@openwrt.org>, Karol Gugala <kgugala@antmicro.com>, Mateusz
 Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>, Yinbo
 Zhu <zhuyinbo@loongson.cn>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor
 Dooley <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alim Akhtar <alim.akhtar@samsung.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Michal
 Simek <michal.simek@amd.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Duje =?UTF-8?B?TWloYW5vdmnEhw==?=
 <duje.mihanovic@skole.hr>, Mark Brown <broonie@kernel.org>, David Wu
 <david.wu@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, Jay
 Buddhabhatti <jay.buddhabhatti@amd.com>, Radhey Shyam Pandey
 <radhey.shyam.pandey@amd.com>, Izhar Ameer Shaikh
 <izhar.ameer.shaikh@amd.com>, Naman Trivedi Manojbhai
 <naman.trivedimanojbhai@amd.com>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] soc: Switch back to struct platform_driver::remove()
Message-ID: <20241029100347.542b56d4@bootlin.com>
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
References: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Uwe,

On Tue, 29 Oct 2024 08:48:58 +0100
Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:

> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/soc to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> On the way do a few whitespace changes to make indention consistent.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
...
>  drivers/soc/fsl/qe/qmc.c                    | 2 +-
>  drivers/soc/fsl/qe/tsa.c                    | 2 +-

Acked-by: Herve Codina <herve.codina@bootlin.com> # for fsl/qe/{qmc,tsa}.c

Best regards,
Hervé

