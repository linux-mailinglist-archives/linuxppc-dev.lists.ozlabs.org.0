Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FC663E9E1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 07:23:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NN5cg4nZ2z30hw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 17:23:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PvHY6dBE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=sergio.paracuellos@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PvHY6dBE;
	dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NN5C506L6z30Qq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 17:05:02 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id e205so988895oif.11
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 22:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQ6eCCvP2RIqVFnGOfA4yG/2BtjQTMpdxc/JWs/IikY=;
        b=PvHY6dBEyebJE6QNI6Wjq2MneXIl4rTpGS7fBC7Qv6R/Yiga7OIh4/Pj4BgHnrpndG
         GrmgooNZOVFverQjG/PwQwa+jNTTeu5eaofi0fQ6sUgKspL/GgqiAAoT7DsAPA/bcNeL
         CuuBxemNVt9HiH103qegQcLdL8byYtx9q2Sy8nfwvxBZulJQ2g5EAZZ4I/KTXdccwea1
         xayFiXCzBGxNpmCBPyhigLfeSVQaNBWPI/KTZtc4+CqnxGM8xxSJGEpvpTJVaXAoUIMI
         LhDFRKO2nzxUjEipEZonE2WghJNoafzVk4PIFC+1xTm7vj4OLlTNuK0dUH2dye1MdJio
         EOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQ6eCCvP2RIqVFnGOfA4yG/2BtjQTMpdxc/JWs/IikY=;
        b=wkT1UzsnKP5mhywV60tR+Epn3vNTUgfdCzNBO16EiQbvErUClfIb7Z+1d5Q21EZCuc
         pDPv2Uj/okszf9UyDkDWISdklheErvELcEGJIpOEF4qfMj6e7llM8kdLpFIgV+Pore9q
         sOrAMHUaPxjlWadqIouC5yKCmFsWjQeAdJz2RD/R6l+abvKOk44KT1B+2TIZSBlKIlQC
         tN9Vw88QPGJG8kuUaLY1ZSa99lx7uGjAbxNHbS3stZXK+KnmJoBVw482SdUKNKE2t0WP
         xpys0iL98d7RRQ8ttm1zg+fqh+X3hiiUtAS/Av2YA7Rx52y4NFG2d4k7GOrP/tnJQj4T
         8NeQ==
X-Gm-Message-State: ANoB5pl14brahfb7h/aORb0rkFAPFZKcfEW8CdUuuQsNgU6PvL7h5he9
	B3L+1yQX9XGvpdvp48qvdOglE/ZdnAXtzDlmdGQ=
X-Google-Smtp-Source: AA0mqf5l2e4XTILLZHTH7QTRBPvz28RAyHNavvCrAHgTBlylFcIYKmUFvkgoGR7uLixlsP/mcB3a5GSDsiHvA3KSd08=
X-Received: by 2002:aca:60c6:0:b0:35a:51fc:2134 with SMTP id
 u189-20020aca60c6000000b0035a51fc2134mr22358640oib.144.1669874698405; Wed, 30
 Nov 2022 22:04:58 -0800 (PST)
MIME-Version: 1.0
References: <20221130141040.32447-1-arinc.unal@arinc9.com> <20221130141040.32447-5-arinc.unal@arinc9.com>
In-Reply-To: <20221130141040.32447-5-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 1 Dec 2022 07:04:47 +0100
Message-ID: <CAMhs-H_yk4_ieChz9ZaMgZiQNSO7RxhAXPN0nHWWxbox=qY_mw@mail.gmail.com>
Subject: Re: [PATCH 4/5] mips: dts: remove label = "cpu" from DSA dt-binding
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 01 Dec 2022 17:22:05 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Tim Harvey <tharvey@gateworks.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Oleksij Rempel <linux@rempel-privat.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>, Gregory Clement <gregory.clement@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens
 @csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, Ray Jui <rjui@broadcom.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Frank Wunderlich <frank-w@public-files.de>, Hauke Mehrtens <hauke@hauke-m.de>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Scott Branden <sbranden@broadcom.com>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Rasm
 us Villemoes <rasmus.villemoes@prevas.dk>, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 30, 2022 at 3:14 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> This is not used by the DSA dt-binding, so remove it from all devicetrees=
.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 1 -

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos
