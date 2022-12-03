Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C355A6416CE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 14:10:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NPVXV4LCmz3brQ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Dec 2022 00:10:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IpTDWkg/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IpTDWkg/;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NPVWV1TGzz2xCj
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Dec 2022 00:09:08 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id f18so11903920wrj.5
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Dec 2022 05:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=he4pvbcj9k7gldXO1AUh5F+PmpcqjQDOE40QJU9PQgY=;
        b=IpTDWkg/+W6qtb6/BO+Rextf9MvVMSlQQo2APxxM4BQDnn7qkZcjkB9FFMGn9O0vXJ
         xmbYFo0ZqKzC+reWi5Ui9m8ZE1DJ75WQ/bFAPBwaB3yh9eWT2bus6awgqTyx7PNgfhCI
         BIvAAuR9hVxe/O2K+n3uaJUi0elOaR19s/Wse5pkabhXyOshgLmtSwZzqtvZqzXN08Qn
         kDzAwrurvkG00GxtgVAhvrZdg82nMPvqvv+CKvcporDHyn64rgrQ7nLeu1tWshBlJ8TS
         GDHMfMYnKweZp0ELa2PUHmSv5lLnkW7A+qy+Wew81JoaPQynn0ljjylNO17zoxC18jz1
         TURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=he4pvbcj9k7gldXO1AUh5F+PmpcqjQDOE40QJU9PQgY=;
        b=s5CFr5DNdXPxqa4DqxewpTm0G40bGF4LBgcRQQDX3262cEiD0bYKMBdvZRVOFBkJXK
         rytyBVCaPD4xZ2rMCDOdQ7aDxHwF2rhq3aWuZaeMR3AJXP551L+VonXt/znW7And0Wx3
         xKQzQ7fSuIEodXKbIptzMmZYll0joaWjZxC+g/lHO8k8dLneXBkyyiq0Uj5BEME7XiQW
         GQExaCyFbgv5KxD7CX0Z/rQyGM9F1LWpJfdkUFYhmL1HEhP1LsmYM+tg2y6l5xTXoWJf
         LuoZMWGEN2c50eT06JQXgw08QzaCCk1O1YEK4Pn7OQ1D7lH05x0cn/ufAvyRZiPfNyGB
         NJUQ==
X-Gm-Message-State: ANoB5plrwdhH9svYdm0ZM4eGYehl9jYU9G+YE5ernvfK5cf+HLgOlv+P
	a0X+6RX5+3kwTijqDEr7aAsB0g==
X-Google-Smtp-Source: AA0mqf7FEFUrgBHbSYwX9vCImy4IPfSr1vGLJ8MA6ZSfnzZGkyWh6DJhnsHrk4VGpak6bs/xb0bb7g==
X-Received: by 2002:adf:eb92:0:b0:236:80a8:485e with SMTP id t18-20020adfeb92000000b0023680a8485emr38696645wrn.362.1670072944015;
        Sat, 03 Dec 2022 05:09:04 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id n3-20020a05600c3b8300b003cfbbd54178sm19062878wms.2.2022.12.03.05.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Dec 2022 05:09:03 -0800 (PST)
Message-ID: <9bd630af-6f88-baa7-7bd4-e99d818fb977@linaro.org>
Date: Sat, 3 Dec 2022 14:09:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 00/11] Fix pca954x i2c-mux node names
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 UNGLinuxDriver@microchip.com, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <cover.1669999298.git.geert+renesas@glider.be>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cover.1669999298.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/12/22 17:49, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> According to the I2C bus multiplexer/switch DT bindings, i2c-mux nodes
> should be named "i2c-mux" (or something similar).
> This patch series renames nodes for pca954x i2c-muxes that are flagged
> by
> 
>      make dtbs_checK DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> 
> Please apply where appropriate.
> Thanks!
> 
> Geert Uytterhoeven (11):
>    ARM: dts: ti: Fix pca954x i2c-mux node names
>    ARM: dts: aspeed: Fix pca954x i2c-mux node names
>    ARM: dts: imx: Fix pca9547 i2c-mux node name
>    ARM: dts: nuvoton: Fix pca954x i2c-mux node names
>    ARM: dts: socfpga: Fix pca9548 i2c-mux node name
>    ARM: dts: vf610: Fix pca9548 i2c-mux node names
>    arm64: dts: freescale: Fix pca954x i2c-mux node names
>    arm64: dts: marvell: Fix pca954x i2c-mux node names
>    arm64: dts: renesas: ulcb-kf: Fix pca9548 i2c-mux node names
>    MIPS: mscc: jaguar2: Fix pca9545 i2c-mux node names
>    powerpc: dts: fsl: Fix pca954x i2c-mux node names

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

