Return-Path: <linuxppc-dev+bounces-2675-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 687EE9B43AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 09:03:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xd2nF1Brgz2yMP;
	Tue, 29 Oct 2024 19:03:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730188993;
	cv=none; b=D5Jx1tKl1XZmppl9/TGW21yX17q45EOf19TQZTJSVEbFPG3gZyJz2xh7Ll7dOPlLDIMz7ovGbWVebbMkdUzXPzR+k/ADbEKCadPNvpFKUr/mN18+O17gPcbvlQXLtuOgcv6jYSZ/WBKZiwVp0bU6eiiTxb0T/URTSwDL7QWGZlRQP8kvyke0KsOunvMl+PY6QTcLN8+cAfhUFmHUWdnYClm5rgqGzojIC+6EySc2foTvNEpBK5S0oMbP5HPqCsAulOa8n+S7XedGnBvjMG4JpBuOFbYJHl4jXMbscJKD6myGbQSlLu6p7fK6gr2T9oGKtpiVBrieL/oW6leQ2SxokA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730188993; c=relaxed/relaxed;
	bh=iFdAzUkd+0GcTyGkQ9/oIIo1dvmqpp5hrlTc3EhXZOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b6lNfTJXW8AKWBDJ64fOfk5XSVAzznDwvIJBca4MWX1wIZNWdK8+HfkFnxDmoTxQ7ol4x60AL50sxQ/u76eKT0T9WCLtmhC4ViTceJKo3jeaaOkF4XYjT4ZcSEnWVdtzB5STBtMsZIT9NV0Nc2JSjoRJF/TOTHBOXRCw8hevGQzJV/5WPiPcpFzz1qkvz9YjryTEPx/ig2oXvyBFKevZQhxLtJhH6OJ/tITO6sUR+sajYI3fN3eG2KaPLCj/Goip/juHT2THArV/tqByiawJJigLPiPcJxA0qkGcZQpJDAR0mwHgf/wx1XINuXQctORnUnb08i9VDHLLeI1o//+xQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sntech.de; dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=E9WrE7ko; dkim-atps=neutral; spf=pass (client-ip=185.11.138.130; helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=lists.ozlabs.org) smtp.mailfrom=sntech.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=E9WrE7ko;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sntech.de (client-ip=185.11.138.130; helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=lists.ozlabs.org)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xd2n941Ltz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 19:03:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iFdAzUkd+0GcTyGkQ9/oIIo1dvmqpp5hrlTc3EhXZOY=; b=E9WrE7kocNrMH0KBtISYyOsT32
	PSMSsRWWc5ttyuBz9k08bNtdV2pmnSIxLwf8TSavrfVanzPnFH+vFeWHa8X18XX4W7rs2HhWaEF39
	lMenGv8tWDu71gfI8++INuZmUySPZj8ECT1w4N5VRO5xYI/DzO+6lz3e6/1j5NgdinKJL8R+6sYWF
	eWDftBCWLy1wRDPEblOrOj+6ShySW3PiIVJ9DC83Ds6qlsvQRzdWknfrBAB0lg5znZL0QsVoR8zpi
	LB5SGxCh96C1CN9NxF/9ho2aS0Rb79rGDcq/QHH7rG9oiG32K6IP9wBS4BK0I3BhMQOOMdoFjeky8
	DpvOJkLg==;
Received: from [185.156.123.69] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t5hAk-0002ap-A3; Tue, 29 Oct 2024 09:01:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Huisong Li <lihuisong@huawei.com>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Karol Gugala <kgugala@antmicro.com>,
 Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>,
 Yinbo Zhu <zhuyinbo@loongson.cn>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Nishanth Menon <nm@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Duje =?utf-8?B?TWloYW5vdmnEhw==?= <duje.mihanovic@skole.hr>,
 Mark Brown <broonie@kernel.org>, David Wu <david.wu@rock-chips.com>,
 Jianqun Xu <jay.xu@rock-chips.com>,
 Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Izhar Ameer Shaikh <izhar.ameer.shaikh@amd.com>,
 Naman Trivedi Manojbhai <naman.trivedimanojbhai@amd.com>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH] soc: Switch back to struct platform_driver::remove()
Date: Tue, 29 Oct 2024 09:01:46 +0100
Message-ID: <5089490.31r3eYUQgx@phil>
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
References: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_PASS,T_SPF_HELO_TEMPERROR
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Am Dienstag, 29. Oktober 2024, 08:48:58 CET schrieb Uwe Kleine-K=F6nig:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>=20
> Convert all platform drivers below drivers/soc to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>=20
> On the way do a few whitespace changes to make indention consistent.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>


>  drivers/soc/rockchip/io-domain.c            | 8 ++++----

=46or the Rockchip part:
Acked-by: Heiko Stuebner <heiko@sntech.de>



