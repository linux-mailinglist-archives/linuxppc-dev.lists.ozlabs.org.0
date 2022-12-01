Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 803BA63F679
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:45:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNNkp2M23z3fB7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 04:45:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XMDViV6C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNCLw2flwz2xCj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 21:42:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XMDViV6C;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NNCLc4QCXz4xFy;
	Thu,  1 Dec 2022 21:42:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669891334;
	bh=4hif7EODqPU9RIQoNSM7f4kViT96m8PqRMy1FOSRqmw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XMDViV6CFDY+O8nTTE8IlEWWvY7H8YPqwD0Tn3KS84kUAblouGGNC2+Nia8sW2MYv
	 qiQITUGJnoNf2rF8FqcIgIFTtKJlyIpcKBWiNrEakO5NLQ+ickTPEjtr01+GlyanLx
	 mzZ9YX/t1jp5UON6rpZmvdKzHLeuceJXW2c99G//FjEB6EQyCPN8TlRw5ClPGntYn1
	 1lstUDxUIwXt5rogz0qwgKe9XH3/+5CPLNT6DZ3ksaq4/yXNeIe6xOWsdnc3/9h44G
	 yfuCxdwdv4chZHzuDDmEcJxiTEJT36pr3DPrHlRrFjnXSjff4fqmP4a9zPs8OfNA43
	 pIMyXosyZ93DA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [PATCH 0/5] remove label = "cpu" from DSA dt-binding
In-Reply-To: <32638470-b074-3b14-bfb2-10b49307b9e3@arinc9.com>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <Y4d9B7VSHvqJn0iS@lunn.ch>
 <32638470-b074-3b14-bfb2-10b49307b9e3@arinc9.com>
Date: Thu, 01 Dec 2022 21:42:00 +1100
Message-ID: <877czbs8w7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 02 Dec 2022 04:43:21 +1100
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Tim Harvey <tharvey@gateworks.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Oleksij Rempel <linux@rempel-privat.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-rockchip@lists.infradead.org, Gregory Clement <gregory.clement@bootlin.com>, =?utf-8?Q?Rafa?= =?utf-8?Q?=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Sergio Paracuellos <sergio.parac
 uellos@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, Ray Jui <rjui@broadcom.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Frank Wunderlich <frank-w@public-files.de>, Hauke Mehrtens <hauke@hauke-m.de>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Scott Branden <sbranden@broadcom.com>, netdev@vger.kernel.org, Bjorn A
 ndersson <andersson@kernel.org>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com> writes:
> On 30.11.2022 18:55, Andrew Lunn wrote:
>> On Wed, Nov 30, 2022 at 05:10:35PM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrot=
e:
>>> Hello folks,
>>>
>>> With this patch series, we're completely getting rid of 'label =3D "cpu=
";'
>>> which is not used by the DSA dt-binding at all.
>>>
>>> Information for taking the patches for maintainers:
>>> Patch 1: netdev maintainers (based off netdev/net-next.git main)
>>> Patch 2-3: SoC maintainers (based off soc/soc.git soc/dt)
>>> Patch 4: MIPS maintainers (based off mips/linux.git mips-next)
>>> Patch 5: PowerPC maintainers (based off powerpc/linux.git next-test)
>>=20
>> Hi Ar=C4=B1n=C3=A7
>>=20
>> So your plan is that each architecture maintainer merges one patch?
>
> Initially, I sent this series to soc@kernel.org to take it all but Rob=20
> said it must be this way instead.
>
>>=20
>> That is fine, but it is good to be explicit, otherwise patches will
>> fall through the cracks because nobody picks them up. I generally use
>> To: to indicate who i expect to merge a patch, and everybody else in
>> the Cc:
>
> Thanks for this, I'll follow suit if I don't see any activity for a few=20
> weeks.

IMHO the best solution if the patches are truly independent is to send
them independantly to each maintainer. That way there's no confusion
about whether someone else will take the series.

It's also simpler for maintainers to apply a single standalone patch vs
pick a single patch from a larger series.

cheers
