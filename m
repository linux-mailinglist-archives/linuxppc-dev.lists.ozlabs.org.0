Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5C57568AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 18:03:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u9qcGdu2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4Rhj35pxz2ywt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 02:03:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u9qcGdu2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4Rgt0s6Zz2yF9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 02:03:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 43AE56105A
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 16:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD67AC433C9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689609783;
	bh=aZICCOVfKf1PqTHgRCOupCS9EkykRJONrhoP14RlBbY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u9qcGdu2hQm4MUz7+RSnzRd6HW4caA+Q8n7HyFS6wT9cyGnC7rtzLwKrRzMH8GBaB
	 0ltb480a8fpNIUjcQb0t6f4BzCIUQqGFko0ozptmlOIlQd0aPhSCDzl7fML/jE8eao
	 DvHqaE4NHpxdEVvix8NLdokkVt/NutsW3eFTLa4xP/ja3cqSHqFZj4RA6J5fRTw+mN
	 M5YONYDw1e52hiAIwhF5YkPUzbXIm+w2V5k5YjRLXlbT4jMhM+KWHo2BzfzW35bF2Q
	 oZXj9j4D2MROP+j69VpFb0pPlf7cXuNHnSe99U4Aam5XsqG6w0lbYMMuhENIRLnSqb
	 YYlZN94wG13jg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fbbfaacfc1so7480180e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 09:03:03 -0700 (PDT)
X-Gm-Message-State: ABy/qLYNqrZasf1s5epp5KeSEgYmTKtciG0A9mN+Trkt0pzykjJCu6a4
	kTAv9xAsDhr/N9oxbxmVe6PAqTHZ7RkMquCH2g==
X-Google-Smtp-Source: APBJJlGT3Z4OwG+5PD2iOuBmukBKYkwOVI4cYi2ZBHphRuP2mDYunFyhxEBn+UEFg93NJOzQaxqKN1Nt2m8NdZz6Fm0=
X-Received: by 2002:a2e:9455:0:b0:2b4:6f0c:4760 with SMTP id
 o21-20020a2e9455000000b002b46f0c4760mr8630130ljh.11.1689609761393; Mon, 17
 Jul 2023 09:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174430.4054533-1-robh@kernel.org>
In-Reply-To: <20230714174430.4054533-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 10:02:28 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+qcoFd7_wWUZeHgqWpB0JfdE0j4qLCxfJwD_Cqkz-HgA@mail.gmail.com>
Message-ID: <CAL_Jsq+qcoFd7_wWUZeHgqWpB0JfdE0j4qLCxfJwD_Cqkz-HgA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: Explicitly include correct DT includes
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Vinod Koul <vkoul@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Paul Cercueil <paul@crapouillou.net>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Sinan Kaya <okaya@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, asahi@lists.linux.dev, dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 14, 2023 at 11:44=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/dma/apple-admac.c                      | 3 ++-
>  drivers/dma/at_hdmac.c                         | 2 +-
>  drivers/dma/bcm-sba-raid.c                     | 4 +++-
>  drivers/dma/bestcomm/bestcomm.c                | 4 +---

v2 coming for this:

>> drivers/dma/bestcomm/bestcomm.
c:80:13: error: call to undeclared function 'irq_of_parse_and_map';
ISO C99 and later do not support implicit function declarations
[-Wimplicit-function-declaration]
      80 |         tsk->irq =3D irq_of_parse_and_map(bcom_eng->ofnode,
tsk->tasknum);
         |                    ^
>> drivers/dma/bestcomm/bestcomm.c:105:4: error: call to undeclared functio=
n 'irq_dispose_mapping'; ISO C99 and later do not support implicit function=
 declarations [-Wimplicit-function-declaration]
     105 |                         irq_dispose_mapping(tsk->irq);
         |                         ^
   drivers/dma/bestcomm/bestcomm.c:128:2: error: call to undeclared
function 'irq_dispose_mapping'; ISO C99 and later do not support
implicit function declarations [-Wimplicit-function-declaration]
     128 |         irq_dispose_mapping(tsk->irq);
         |         ^
   3 errors generated.
