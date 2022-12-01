Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B046F63FE38
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 03:39:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNcbP4rqdz3bcN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 13:39:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.41; helo=mail-ot1-f41.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNXls3gdjz30RN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 10:46:33 +1100 (AEDT)
Received: by mail-ot1-f41.google.com with SMTP id db10-20020a0568306b0a00b0066d43e80118so2001554otb.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Dec 2022 15:46:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kku18D3Y88MWUX/tUqbmMS28F2KQx7nmZY37oV7FZwE=;
        b=OSFCiFm0WvsdApXJZxvnCtJny2dOJJdFhF5gCfjKkbIM02OoPXATsBa+tZpYGRgagD
         i197iCKWBJQUcp2KtjwVB5sEo8TnU20RDdMT2rFvcRAWPxjVOVegoQE8uFQf2Ph6AhtT
         MDZyGONmkxQlRm4rkxLQ14oOsUzznyZTo1KLUlw5yA5LIM9+wlVK9Wa8FIrM4bngJ102
         Fklezfrx+2YdHPtfzbWZLza5Oh4Er7Wngs8HdYTKFBFhRUFrDRKoNY+PIAQmmIdABafx
         n07hIaLvso3KMuLMs76lyA14LW4fF6kAlt8dvd5/SCXWjy7QV/OQey2n8YmXgQiBn1qs
         ec9A==
X-Gm-Message-State: ANoB5pkErdqLcYSvHxu+sR3E+qwFbgVjW8Sek0ZZqCpy9subtIy09aYc
	0u8m8nHb6+9EoWHj1krzPg==
X-Google-Smtp-Source: AA0mqf5ZGQasomoBdeMHUbWi+cUm7mHzdtQUSRq09o1u9VxkbZV92Lxt3/8ZuyZgJD7FgCKGDpaDTA==
X-Received: by 2002:a05:6830:1e63:b0:661:9030:6480 with SMTP id m3-20020a0568301e6300b0066190306480mr24758975otr.147.1669938390899;
        Thu, 01 Dec 2022 15:46:30 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y2-20020a4ae702000000b0049427725e62sm2292185oou.19.2022.12.01.15.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 15:46:30 -0800 (PST)
Received: (nullmailer pid 1704103 invoked by uid 1000);
	Thu, 01 Dec 2022 23:46:28 -0000
Date: Thu, 1 Dec 2022 17:46:28 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar71xx: remove label = "cpu"
 from examples
Message-ID: <166993831623.1702506.4546645219900752750.robh@kernel.org>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <20221130141040.32447-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221130141040.32447-2-arinc.unal@arinc9.com>
X-Mailman-Approved-At: Fri, 02 Dec 2022 13:39:03 +1100
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
Cc: ", Andrew Lunn" <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Vladimir Oltean <vladimir.oltean@nxp.com>, linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Agner <stefan@agner.ch>, linux-mips@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Michael Riesch <michael.riesch@wolfvision.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Peng Fan <peng.fan@nxp.com>, Oleksij Rempel <linux@rempel-privat.de>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>, Gregory Clement <gregory.clement@boot
 lin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, Hauke Mehrtens <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Tim Harvey <tharvey@gateworks.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Frank Wunderlich <frank-w@public-files.de>, Ray Jui <rjui@broadcom.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Nicholas Piggin <npiggin@gmail.com>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Scott Branden <sbranden@broadcom.com>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Wed, 30 Nov 2022 17:10:36 +0300, Arınç ÜNAL wrote:
> This is not used by the DSA dt-binding, so remove it from the examples.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  Documentation/devicetree/bindings/net/qca,ar71xx.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
