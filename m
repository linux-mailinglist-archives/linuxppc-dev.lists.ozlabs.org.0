Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9591163E5B1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:44:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwlZ3nySz3gBJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:44:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.178; helo=mail-qt1-f178.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMhwz5wxzz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 01:51:29 +1100 (AEDT)
Received: by mail-qt1-f178.google.com with SMTP id c15so11242114qtw.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 06:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbewHNiIDPrh2vDJAS18QQyUgoqR1U2XFbW+RCOiyVY=;
        b=foQk6w+7+9YDPyqJ7At+e7d74vtPxQ25qd/TXiz6815vxHrBXqcK4w0ZgO2idaOnbK
         LdnwmQ2OgnmoOpVN8v+MHq4k+UHL5/YGixxSnuykQc5eLxsBNQyE/rHdMaxkUVoR8V0q
         xTPtnlljCFjqnhefnUETbokceSlePB65rztm9cC+qUeSlQcs93ZHajK+coHE2FnF/2xK
         2rAg30I2bKkoM4gREjnP7oj1MCfg89Q92vawVP1vWvCLSLaSeSmwWsPpvWQqcuxlpCyl
         LtdWnfOSb6bWw+p1ADscYBXStu+MjA0GK3vYNs7hMT+fjvQUEulcEFo/Q8QukNeCA9ZX
         8hOw==
X-Gm-Message-State: ANoB5pn+zX7TTHs9npP9KDaC2bxhbs9xf3vFFC3Zak9ED/YXBI18oaif
	Rg3YJooWz9c2Gh2AUcaOkxyizLkfbHQXcQ==
X-Google-Smtp-Source: AA0mqf5vhdynF322xfo3PfOqcUlYdQdZimtmsD46EE6suE48M8hO6R/VpZZ9DOE+SSuBrovLQDZO+g==
X-Received: by 2002:ac8:70c1:0:b0:3a6:68cb:cabe with SMTP id g1-20020ac870c1000000b003a668cbcabemr26066089qtp.248.1669819885659;
        Wed, 30 Nov 2022 06:51:25 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id k17-20020ac84791000000b003a50c9993e1sm960898qtq.16.2022.11.30.06.51.23
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 06:51:24 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-3bf4ade3364so123327427b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 06:51:23 -0800 (PST)
X-Received: by 2002:a81:f80f:0:b0:38e:e541:d8ca with SMTP id
 z15-20020a81f80f000000b0038ee541d8camr55824371ywm.283.1669819872327; Wed, 30
 Nov 2022 06:51:12 -0800 (PST)
MIME-Version: 1.0
References: <20221130141040.32447-1-arinc.unal@arinc9.com> <20221130141040.32447-3-arinc.unal@arinc9.com>
In-Reply-To: <20221130141040.32447-3-arinc.unal@arinc9.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Nov 2022 15:51:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBZiWxORfb2hd0hn_En6yFEwm8uJXr553YfB8gv1sOFw@mail.gmail.com>
Message-ID: <CAMuHMdVBZiWxORfb2hd0hn_En6yFEwm8uJXr553YfB8gv1sOFw@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm: dts: remove label = "cpu" from DSA dt-binding
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 01 Dec 2022 10:32:49 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Tim Harvey <tharvey@gateworks.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Oleksij Rempel <linux@rempel-privat.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>, Gregory Clement <gregory.clement@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Che
 n-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, Ray Jui <rjui@broadcom.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Frank Wunderlich <frank-w@public-files.de>, Hauke Mehrtens <hauke@hauke-m.de>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken
 .de>, Scott Branden <sbranden@broadcom.com>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CC cleger

On Wed, Nov 30, 2022 at 3:33 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
> This is not used by the DSA dt-binding, so remove it from all devicetrees=
.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>

>  arch/arm/boot/dts/r9a06g032.dtsi                          | 1 -

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> @@ -401,7 +401,6 @@ switch_port3: port@3 {
>                                 switch_port4: port@4 {
>                                         reg =3D <4>;
>                                         ethernet =3D <&gmac2>;
> -                                       label =3D "cpu";
>                                         phy-mode =3D "internal";
>                                         status =3D "disabled";
>                                         fixed-link {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
