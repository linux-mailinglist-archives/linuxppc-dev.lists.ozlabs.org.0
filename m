Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C43643602
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 21:48:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQwd06LkQz3bgb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 07:48:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b6Jb2v7W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=jernej.skrabec@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b6Jb2v7W;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQvnP1qjtz30QX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 07:11:04 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id n21so1159009ejb.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Dec 2022 12:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sp/bNT5Sth10xITvOq6/Mc90creRR8yZ/shLGt2Fjbo=;
        b=b6Jb2v7WFhoSvR0qnQE049/t4BrlMrHARODr4SKR7Xn1FQa9HrOT4fkLVGvEHA9Y1j
         1aehg61bR85KIrd2yJzQDQujMLuCNIt+emvdW9fTMhx/4U1IfjkR3nnqFTKD2foaT9Ui
         956X6MJskqO817oItJy60eJ/aPD436SYiI8CtZcVVtFSrPoeWakNB2ZLOP0F+i4StkUL
         nsRQewGeP0UsRkxnq3KtMkx7OiRgubdtkydVEQYG6jK5ZHZmbx0yNK/c8JcyYjD3JIAC
         Ut3m1P+iv3Z6OSkGBM5RkqV2YJSAbtOAlIPpS5aYllY3p4QAyiook36M6HlT+zHtjfwv
         isQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sp/bNT5Sth10xITvOq6/Mc90creRR8yZ/shLGt2Fjbo=;
        b=rSoDtO/FY5HNJJiZDH21ZoidnzzKnM4wAuDXB2B0Fy77Kv0X72fDvnXwbPC4DmQA+1
         aWBsT8rm2QaNVNTeR6TlT4tikRxSWik1dYIe9Lnea3/u7AaZCZms9gPoj2YdMwYv6UaY
         A/3ix/hH1BGbMdL3K0Y5Xgyi4WO+JRZMNjcIofM3r6Pfn7ZRF6AlObAgU/m/yGkmpc3Y
         COQ+E56545fldnqPy5FTaUv2PBsgKLO0rJmazKOUg6mZ9dOBe3gLgfHLwa5kowLHhpcH
         vetOekfhX5hqVAWarwH6l0rsTCLRDRugo54OZAUagTQ5WqUCI/9s8PTiORbBCTtGwLMX
         tn0A==
X-Gm-Message-State: ANoB5plBOSVZnCkxDsqAy/qJI4fiDDqzGJbX9qqBpjbxfGhLCPc5CbGQ
	gy1l+dimay8vzn/Jc+zXRvQ=
X-Google-Smtp-Source: AA0mqf7z2/lysFZiqxK7ulKcSDgTYuqAgvTjsjwNu9269MsuvY9zIMkwT4vKR3jmOkwgiNV/Sr+dWg==
X-Received: by 2002:a17:906:6c93:b0:7c0:ff76:7866 with SMTP id s19-20020a1709066c9300b007c0ff767866mr2992853ejr.272.1670271058311;
        Mon, 05 Dec 2022 12:10:58 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id d21-20020a170906305500b007838e332d78sm6558596ejd.128.2022.12.05.12.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:10:57 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, soc@kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, Heiko Stuebner <heiko@sntech.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Tim Harvey <tharvey@gateworks.com>, Peng Fan <peng.fan@nxp.com>, 
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Frank Wunderlich <frank-w@public-files.de>, 
	Michael Riesch <michael.riesch@wolfvision.net>, Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH 2/5] arm: dts: remove label = "cpu" from DSA dt-binding
Date: Mon, 05 Dec 2022 21:10:54 +0100
Message-ID: <5625120.DvuYhMxLoT@kista>
In-Reply-To: <20221130141040.32447-3-arinc.unal@arinc9.com>
References: <20221130141040.32447-1-arinc.unal@arinc9.com> <20221130141040.32447-3-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 06 Dec 2022 07:48:07 +1100
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dne sreda, 30. november 2022 ob 15:10:37 CET je Ar=C4=B1n=C3=A7 =C3=9CNAL n=
apisal(a):
> This is not used by the DSA dt-binding, so remove it from all devicetrees.
>=20
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  arch/arm/boot/dts/armada-370-rd.dts                       | 1 -
>  arch/arm/boot/dts/armada-381-netgear-gs110emx.dts         | 1 -
>  arch/arm/boot/dts/armada-385-clearfog-gtr-l8.dts          | 1 -
>  arch/arm/boot/dts/armada-385-clearfog-gtr-s4.dts          | 1 -
>  arch/arm/boot/dts/armada-385-linksys.dtsi                 | 1 -
>  arch/arm/boot/dts/armada-385-turris-omnia.dts             | 1 -
>  arch/arm/boot/dts/armada-388-clearfog.dts                 | 1 -
>  arch/arm/boot/dts/armada-xp-linksys-mamba.dts             | 1 -
>  arch/arm/boot/dts/at91-sama5d2_icp.dts                    | 1 -
>  arch/arm/boot/dts/at91-sama5d3_ksz9477_evb.dts            | 1 -
>  arch/arm/boot/dts/bcm-cygnus.dtsi                         | 1 -
>  arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp-common.dtsi | 1 -
>  arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts              | 1 -
>  arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts              | 1 -
>  arch/arm/boot/dts/bcm4708-netgear-r6250.dts               | 1 -
>  arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts             | 1 -
>  arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts        | 1 -
>  arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts             | 1 -
>  arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts             | 1 -
>  arch/arm/boot/dts/bcm4709-netgear-r8000.dts               | 1 -
>  arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts              | 3 ---
>  arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts             | 1 -
>  arch/arm/boot/dts/bcm47094-linksys-panamera.dts           | 4 ----
>  arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts             | 1 -
>  arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts             | 1 -
>  arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts             | 1 -
>  arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts             | 1 -
>  arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts             | 1 -
>  arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts          | 1 -
>  arch/arm/boot/dts/bcm47189-tenda-ac9.dts                  | 1 -
>  arch/arm/boot/dts/bcm53015-meraki-mr26.dts                | 1 -
>  arch/arm/boot/dts/bcm53016-meraki-mr32.dts                | 1 -
>  arch/arm/boot/dts/bcm953012er.dts                         | 1 -
>  arch/arm/boot/dts/bcm958622hr.dts                         | 1 -
>  arch/arm/boot/dts/bcm958623hr.dts                         | 1 -
>  arch/arm/boot/dts/bcm958625hr.dts                         | 1 -
>  arch/arm/boot/dts/bcm958625k.dts                          | 1 -
>  arch/arm/boot/dts/bcm988312hr.dts                         | 1 -
>  arch/arm/boot/dts/gemini-dlink-dir-685.dts                | 1 -
>  arch/arm/boot/dts/gemini-sl93512r.dts                     | 1 -
>  arch/arm/boot/dts/gemini-sq201.dts                        | 1 -
>  arch/arm/boot/dts/imx51-zii-rdu1.dts                      | 1 -
>  arch/arm/boot/dts/imx51-zii-scu2-mezz.dts                 | 1 -
>  arch/arm/boot/dts/imx51-zii-scu3-esb.dts                  | 1 -
>  arch/arm/boot/dts/imx53-kp-hsc.dts                        | 1 -
>  arch/arm/boot/dts/imx6dl-yapp4-common.dtsi                | 1 -
>  arch/arm/boot/dts/imx6q-b450v3.dts                        | 1 -
>  arch/arm/boot/dts/imx6q-b650v3.dts                        | 1 -
>  arch/arm/boot/dts/imx6q-b850v3.dts                        | 1 -
>  arch/arm/boot/dts/imx6qdl-gw5904.dtsi                     | 1 -
>  arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi                   | 1 -
>  arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi                   | 1 -
>  arch/arm/boot/dts/imx6qp-prtwd3.dts                       | 1 -
>  arch/arm/boot/dts/imx7d-zii-rpu2.dts                      | 1 -
>  arch/arm/boot/dts/kirkwood-dir665.dts                     | 1 -
>  arch/arm/boot/dts/kirkwood-l-50.dts                       | 1 -
>  arch/arm/boot/dts/kirkwood-linksys-viper.dts              | 1 -
>  arch/arm/boot/dts/kirkwood-mv88f6281gtw-ge.dts            | 1 -
>  arch/arm/boot/dts/kirkwood-rd88f6281.dtsi                 | 1 -
>  arch/arm/boot/dts/mt7623a-rfb-emmc.dts                    | 1 -
>  arch/arm/boot/dts/mt7623a-rfb-nand.dts                    | 1 -
>  arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts             | 1 -
>  arch/arm/boot/dts/mt7623n-rfb-emmc.dts                    | 1 -
>  arch/arm/boot/dts/orion5x-netgear-wnr854t.dts             | 1 -
>  arch/arm/boot/dts/qcom-ipq8064-rb3011.dts                 | 2 --
>  arch/arm/boot/dts/r9a06g032.dtsi                          | 1 -
>  arch/arm/boot/dts/stm32mp151a-prtt1c.dts                  | 1 -
>  arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts                 | 1 -

=46or sun7i:

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  arch/arm/boot/dts/vf610-zii-cfu1.dts                      | 1 -
>  arch/arm/boot/dts/vf610-zii-dev-rev-b.dts                 | 1 -
>  arch/arm/boot/dts/vf610-zii-dev-rev-c.dts                 | 1 -
>  arch/arm/boot/dts/vf610-zii-scu4-aib.dts                  | 1 -
>  arch/arm/boot/dts/vf610-zii-spb4.dts                      | 1 -
>  arch/arm/boot/dts/vf610-zii-ssmb-dtu.dts                  | 1 -
>  arch/arm/boot/dts/vf610-zii-ssmb-spu3.dts                 | 1 -
>  75 files changed, 81 deletions(-)



