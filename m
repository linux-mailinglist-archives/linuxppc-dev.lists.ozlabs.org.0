Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E529E804ACE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 07:59:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=HzwMXPNm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkrxM2QLGz3cft
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 17:59:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=HzwMXPNm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkrwT3hcHz2yjD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 17:58:33 +1100 (AEDT)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 565AFC09B7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 06:51:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6524CC0006;
	Tue,  5 Dec 2023 06:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701759080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HmV/ix9amwJ7r86i5eKjinKKZ2rsJiuszC6Rdqdxvkc=;
	b=HzwMXPNmz6whc7Lpk85Qn6zY/OATY25BeMWTJQcAXyjnM7VJJ2VXeAX+YWpdVRQT5Vur3R
	QhFZ7m94EhMmFpc68Pu+TvXUbkN3AaCfoqMJ0YM3jNWfTv11ZKeKS7C84B6FNIcMZ89Qdd
	f89dxnTRE9h3fG5NI+WkwypaPQVKVGnFiIr48c7zyn6ybn2r/QuBMHWvDYFzi6znO8Y3qN
	XPXYuxTqDh3Xqrxv3JjU1Am74IpMqk2rwYgmjR25xwAIZbpmMtvveNvFwlEljiCzPDcsKq
	xIkKhTMqxIgnw5KCI9gpuOxkCqGDN40qtrKms0AhQXax6Bc4/UCoa1hw6m14cg==
Date: Tue, 5 Dec 2023 07:51:10 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH net-next v2 0/9] net*: Convert to platform remove
 callback returning void
Message-ID: <20231205075110.795b88d2@xps-13>
In-Reply-To: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, Eric Dumazet <edumazet@google.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Zhao Qiang <qiang.zhao@nxp.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Russell King <linux@armlinux.org.uk>, linux-wpan@vger.kernel.org, Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Christian Marangi <ansuelsmth@gmail.com>, Nick Child <nnac123@linux.ibm.com>, Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>, Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Alex Elder <elder@kernel.org>, netdev@vger.kernel.org, Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de, Johannes Berg <johannes@sipsolutions.net>, Imr
 e Kaloz <kaloz@openwrt.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Uwe,

u.kleine-koenig@pengutronix.de wrote on Mon,  4 Dec 2023 19:30:40 +0100:

> Hello,
>=20
> (implicit) v1 of this series can be found at
> https://lore.kernel.org/netdev/20231117095922.876489-1-u.kleine-koenig@pe=
ngutronix.de.
> Changes since then:
>=20
>  - Dropped patch #1 as Alex objected. Patch #1 (was #2 before) now
>    converts ipa to remove_new() and introduces an error message in the
>    error path that failed before.
>=20
>  - Rebased to today's next
>=20
>  - Add the tags received in the previous round.
>=20
> Uwe Kleine-K=C3=B6nig (9):
>   net: ipa: Convert to platform remove callback returning void
>   net: fjes: Convert to platform remove callback returning void
>   net: pcs: rzn1-miic: Convert to platform remove callback returning
>     void
>   net: sfp: Convert to platform remove callback returning void
>   net: wan/fsl_ucc_hdlc: Convert to platform remove callback returning
>     void
>   net: wan/ixp4xx_hss: Convert to platform remove callback returning
>     void
>   net: wwan: qcom_bam_dmux: Convert to platform remove callback
>     returning void
>   ieee802154: fakelb: Convert to platform remove callback returning void
>   ieee802154: hwsim: Convert to platform remove callback returning void

FYI, I plan on taking patches 8 and 9 through wpan-next.

Thanks,
Miqu=C3=A8l
