Return-Path: <linuxppc-dev+bounces-2682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B589B4E12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 16:34:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdDnh3yd0z2xpk;
	Wed, 30 Oct 2024 02:34:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::733"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730216056;
	cv=none; b=Xuah2s7DmtYZymYh85EUFliAY3bhAHPlRTLqEouoqrtKdRQrp5k/anpBgCC7NXANGXk5nGTQ7C8ryRl405Mmwk7cmv3lkDm5f0MLe1gZPTwJi9wWOQNp1KSXH1WHhBSxUGzN5yN8+2kw7SsfzInUbOVGz1uOmwpbeU//Ttm56f6gv8NmwHW0QRykZO0dwxIMLx3tkOccdgqSf7ggKbi6yHBOkYPpEB5wgjB9Ra5u2jSS1I1Ys1wK1UsMfwDaRRkrY5bjodDJDgzS7FYkwxzxAvii69ot0tuAYCq/x5fKy6BcuqSmyVHkzWs7BrmBdgutZjw9IW4bnQSlgH0BMUP7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730216056; c=relaxed/relaxed;
	bh=NvKHclZp8wng408kUlr3zIB/tjSz9AoBIcuqjDo9UYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdFGszAb+3ByUMBz6/bGb9dcwDc/Fy6zxikF+9/m1oIp+V6q5EggVlK6NMft6SDKs4GgbF4r5W4J13NH6yPVSmkrxAhPceJLtb+tOgN5hycoMk0VZaWv9eW+/IgnNOwMZAVFTqovozdU7Bb/n5GfcJrEk+ESexHqWIeX7BA9rld/fu4dRu6vnKTOwWHYUFF9ty1nBCRZS2qHKqvVkXE4cWKHUvlOwIbyXNmNJksI7TzvAd4BCT1TQ45pIE9yAFpF459PwGxPJY3R8/nOQAUijyrWwtk41HoewACD9glKzXUmDSLBl79AoFt3mVP2tCXB6vQ3fmQZX8S+jUPUzGbRfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MBDJHbJC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com; envelope-from=gsomlo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MBDJHbJC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com; envelope-from=gsomlo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdDnf4jXrz2xGg;
	Wed, 30 Oct 2024 02:34:14 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7b153047b29so377449185a.3;
        Tue, 29 Oct 2024 08:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730216051; x=1730820851; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NvKHclZp8wng408kUlr3zIB/tjSz9AoBIcuqjDo9UYE=;
        b=MBDJHbJCzjtISzlOKny5xdTOkHejsA83fAwHwSYiB3djnyqLXFWCRp+2zYvKEODPb8
         Ic1LWpyVp+TrtFgAM3sRBL75SkJZ8M2PoH0w9KABUCWq1nhW5qFBkol8KOFXHEy8Y09J
         w5kiELxBmwRQIsTgNzBZZ5X4Unrw2U6UCHju3ID/ZFKSQvrZWZRqxeqVDibFF0Z8S9vL
         KifkrCrC3FtlX4xuReQt/L4QiTtUNdKcRPGX8sUKQY8kID48t5gjBORtWsT1Qpj6RjU3
         hYJCjXlkdsn47cKao5cx/VxxePgzvx1S1twfLGgNPO4VGkXm+Z5xXM4BizJwLyH+AIlM
         a9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730216051; x=1730820851;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvKHclZp8wng408kUlr3zIB/tjSz9AoBIcuqjDo9UYE=;
        b=To0i8i6s00G4zW3hwCKIshSjH6yRnBgEMN8RqGJu54y69bJtECvLxLOZjwQ/U83fHV
         SCPYUTP7liDYPykol6/E4WA9hvDbHMqQcBrWmKYXcPb+TUXGVTsIyuh3llLRifBEJaI4
         fBIlpjyhb9eg5Unoy7P6uTj9HILq1c4eOUQ8utowTyxSiK603OLMv7qqMC62I1GgtmsA
         6QlOWCzew7JSkZwDTwcgiPO8CY/94ZArSLbqfj5ObMgT7GlOU27YGrM/5nNEPgzZBD4W
         yalY+ETHF9bMe5R4QAROXAPDTGd6FA6HqP8AEEqK5YwjMGQMNcu3JJugccFJIluwcOmn
         1Tmg==
X-Forwarded-Encrypted: i=1; AJvYcCVI3cLj9hKfjHzMwltmsE0XlD+ALzpEsMGYewerFdpVau4gtUd/g1Pe1TTVNZYKwVJQdadWvluLGfM8lh4+@lists.ozlabs.org, AJvYcCW2MX280x5WGDzov+knFrb/pAYMPkZOKxN67jo6Q+VyRpPgqT2k1rI43ghrkxaqR0Oe0szH//m7/nfDVj4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz550JzoUt5p0B+x+aTZRwraUZMCNWbonI1zrVEqjx06o4+dlaQ
	/3dNm/FoUComKhjGIXdqiAuLidmHWVJ5Gw/dzEJSm9wbdjQIexUb
X-Google-Smtp-Source: AGHT+IFEK1Lj+KgPR7qF2SZIPbGWb1EluUys2IzUezoVVlhCBBeUjMF3gYTnyYnzfqeZ8MKMdnnF7w==
X-Received: by 2002:a05:620a:4456:b0:7a9:b8dd:eb96 with SMTP id af79cd13be357-7b193eff5camr1988254585a.30.1730216051027;
        Tue, 29 Oct 2024 08:34:11 -0700 (PDT)
Received: from crash.wifi.local.cmu.edu (cmu-device2.nat.cmu.net. [128.2.149.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d292c88sm429507285a.30.2024.10.29.08.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 08:34:10 -0700 (PDT)
Date: Tue, 29 Oct 2024 11:34:08 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Huisong Li <lihuisong@huawei.com>,
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
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
Message-ID: <ZyEAcHVC3gXujNa9@crash.wifi.local.cmu.edu>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
X-Clacks-Overhead: GNU Terry Pratchett
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 29, 2024 at 08:48:58AM +0100, Uwe Kleine-König wrote:
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

for LiteX,

Acked-by: Gabriel Somlo <gsomlo@gmail.com>

Thanks,
--Gabriel

