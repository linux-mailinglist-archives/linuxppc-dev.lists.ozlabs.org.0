Return-Path: <linuxppc-dev+bounces-1371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC94978EFE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 10:01:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X5Nst6wQdz2xsM;
	Sat, 14 Sep 2024 18:01:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726300882;
	cv=none; b=C9T+r/hHFFWTJuR9w2i9+da9L7KOmijv/72cyJigVNvcVsnkgOHCpRQ6m1oo6Zp0jezZS6xpC4N2+/pAjkQpWl+4Jy0KTquWR1Vw3Myb7OG0BeDYaRO0HWAd6YbXG8zLFVtkS7xe7H6ME32U22Ul2SNFXqJbMLSOfzveTF2iI5JlMhDa0GwlXwT1BQxmSI5cjojHYnLcbzTy1GZ8rFLG0tQm/WtFpQ7F0BO2Ha9ZzOyGYp2V8DMUQdihV+ixvCz7BjjPA9UmnO2ej31IAQJg//MR/FnBzCo7QzL7XSWDl5+w/00D7ppgI1Ytetz8pwTDET1+yTiOAjv8tnqtf9sbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726300882; c=relaxed/relaxed;
	bh=1UTzwRfMDy5HUNy5t2BEx5nu4xKFJUQAXBDNug6N3+I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AtXOP2vB7SXJoHs5VtOUSwVp06F6lKa9u6mk4dyGKvvibagTGRxP38ztrBar4bx165e4YP3C4sH5BAsXlS8HpzzJXi2msCq2eZnCNsc8FYgKG0mx9d+hoMlnoYeAK0tCxINIZVQVw68/GfYnOdK3TqOIZCvMnKaB74UDxegq2UIPl6H5SQ9Hka5obq2jOxnzi9JpfCLUP+FTc/FzvHF0sAVUSeN2o5v6TAkJJqGO/b+BFjuoj7yrpryY8iCUZLDkpkEuJZ+qgbw+OICS6PMGWTWKflZQ3qijuJ8j9Ctidf+b9uulgmZjJ4fenlsgZYORaQo8/73s4HvaGdXIIaUeIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=E11eIdHm; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=E11eIdHm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X5Nss1gyqz2xsK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 18:01:17 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C0BF1BF204;
	Sat, 14 Sep 2024 08:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726300866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1UTzwRfMDy5HUNy5t2BEx5nu4xKFJUQAXBDNug6N3+I=;
	b=E11eIdHm8uer8IY6NePNlmJm3NGTsjxqY6GGUbB9EAf+cI248nxxM7A1Fm7uafMUF5py8s
	4vmc4RMyl+1XQFnRUF2g+DFJqckPPeNA8ErIn4WZNqHi3NotlJg7fozFB+3uRPhhI2uTBc
	GePcRZUoddDQ00M80cSJXDCWFEPlD+OREATmKZWkHEUcDbyphuMznihlPA0L6YlOnJd3dE
	hoAFHk/Stu53BxfZM+QQQ7OmikgjpwoxGFeT+89iG5t6EBmG7Jy2sEkdhBT0jLPPxZKZjm
	UC0BxC3sUWpha4hHYy2lMGYwxjgJuOe5VfnQQh+AvC02nnShzT2VJHq8wL4Hgw==
Date: Sat, 14 Sep 2024 10:01:03 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, Herve Codina
 <herve.codina@bootlin.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v3 7/8] net: ethernet: fs_enet: simplify clock
 handling with devm accessors
Message-ID: <20240914100103.37970b03@fedora.home>
In-Reply-To: <4e4defa9-ef2f-4ff1-95ca-6627c24db20c@wanadoo.fr>
References: <20240904171822.64652-1-maxime.chevallier@bootlin.com>
	<20240904171822.64652-8-maxime.chevallier@bootlin.com>
	<4e4defa9-ef2f-4ff1-95ca-6627c24db20c@wanadoo.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: maxime.chevallier@bootlin.com

Hello Christophe,

On Fri, 13 Sep 2024 22:24:28 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Le 04/09/2024 =C3=A0 19:18, Maxime Chevallier a =C3=A9crit=C2=A0:
> > devm_clock_get_enabled() can be used to simplify clock handling for the
> > PER register clock.
> >=20
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> >   .../ethernet/freescale/fs_enet/fs_enet-main.c    | 16 ++++------------
> >   drivers/net/ethernet/freescale/fs_enet/fs_enet.h |  2 --
> >   2 files changed, 4 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/dr=
ivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> > index c96a6b9e1445..ec43b71c0eba 100644
> > --- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> > +++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> > @@ -900,14 +900,9 @@ static int fs_enet_probe(struct platform_device *o=
fdev)
> >   	 * but require enable to succeed when a clock was specified/found,
> >   	 * keep a reference to the clock upon successful acquisition
> >   	 */
> > -	clk =3D devm_clk_get(&ofdev->dev, "per");
> > -	if (!IS_ERR(clk)) {
> > -		ret =3D clk_prepare_enable(clk);
> > -		if (ret)
> > -			goto out_deregister_fixed_link;
> > -
> > -		fpi->clk_per =3D clk;
> > -	}
> > +	clk =3D devm_clk_get_enabled(&ofdev->dev, "per");
> > +	if (IS_ERR(clk))
> > +		goto out_deregister_fixed_link; =20
>=20
> Hi,
>=20
> I don't know if this can lead to the same issue, but a similar change=20
> broke a use case in another driver. See the discussion at[1].
>=20
> It ended to using devm_clk_get_optional_enabled() to keep the same=20
> behavior as before.

After digging around, there appears to be some platforms that don't
have this clock indeed. Thanks for catching this, the optional is the
way to go.

Thanks,

Maxime

