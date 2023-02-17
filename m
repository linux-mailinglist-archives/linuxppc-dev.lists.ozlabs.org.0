Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FDF69B3EE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 21:28:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJNgk0Md6z3fQZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 07:28:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Qy+krOUJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::230; helo=relay10.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Qy+krOUJ;
	dkim-atps=neutral
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJNfr1lJZz3cgT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 07:28:03 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 060A3240007;
	Fri, 17 Feb 2023 20:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676665678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OvDZ7Ve+5FFvR/CqSfvy5MV7TZP0j51A/S+5V2+9/OI=;
	b=Qy+krOUJ44tvEiFjWe9YQkjR8tcp8Y98DemShkj0+2SlPQOzy5NE0xuVLPS61xJTSIdP/7
	iw6n/SwXTgLhW+RSZE3Tt6+2g1bnqECHxbwmXJ+ySh35qcuowJTP+LrvtUVWUNBZh/YVMt
	nf+0XG9cifw3v0NDHbgNuy5w8DycFBSOz5GuNu/ukZM7G86Wzz+0EX6XkzRQsJOnmWXCE4
	T/cT4XK2iP6mL4UzaOVGQ7ZN2TI3sANGJ1HlxGa9pSBiktAzZDmpw4MYkt5/7ef5vn6ehC
	6s5n98W01n0UVjigYqwCmFnQAnxpjis5ScbOK6w7dqwf6OParTyU9GbzWsHeRQ==
Date: Fri, 17 Feb 2023 21:27:54 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 00/10] Add the PowerQUICC audio support using the QMC
Message-ID: <20230217212754.4fba0b78@bootlin.com>
In-Reply-To: <20230217211820.39fb47a7@bootlin.com>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
	<87mt5dyxph.fsf@mpe.ellerman.id.au>
	<0606f44f-bdbb-055c-6fff-440007222ce3@csgroup.eu>
	<Y+/SStm9ifszrYA1@sirena.org.uk>
	<20230217211820.39fb47a7@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 Feb 2023 21:18:20 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> On Fri, 17 Feb 2023 19:15:22 +0000
> Mark Brown <broonie@kernel.org> wrote:
>=20
> > On Fri, Feb 17, 2023 at 06:32:03AM +0000, Christophe Leroy wrote:
> >=20
> > > Mark, is that ok for you or do you expect this series to go via soc t=
ree ?
> >=20
> > Sure, that sounds good to me.  I'll give it another check and
> > then assuming everything is fine apply for -rc1.
>=20
> Thanks a lot,
> Herv=C3=A9
>=20

And note that the v6 series is available.
  https://lore.kernel.org/linux-kernel/20230217145645.1768659-1-herve.codin=
a@bootlin.com/
with the v5 feedbacks from Krzysztof taken into account.

Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
