Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B8C55F8FE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 09:32:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXtT31wsKz3dvL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 17:32:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=p5bFqL6o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=clement.leger@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=p5bFqL6o;
	dkim-atps=neutral
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXtSS3HXDz2yxF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 17:31:34 +1000 (AEST)
Received: (Authenticated sender: clement.leger@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0BB991BF211;
	Wed, 29 Jun 2022 07:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656487889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MUAlH3rFjhmrOjOV0b6OevGjDLJyfHSl54JsM43oRMk=;
	b=p5bFqL6oNfEebvGBqtMtdm1HT21o/xzkez1UFN6wxRpJGJVWOxQcWCQa2jc/i2szAnFZBU
	sGFhEf45OvZwJWJVGXnUQDPikRmrUDczEus2xt0y9Vg3h9BHZJ4nPVPcM68xTUlHcyKJEe
	VOGhqI+5JLkp33wLRCRZ3yT9tWdMRld3sf5/lqfkxHxb+DBz3zD4D2uaOyj7UwgqXwZLbc
	VERzbiasLFtYMgm+kI083AnEdL005NQ3dTe5Y/YG8Yo3k7mrwS2sRxsSAPQL4fuFJmm3kY
	B02Sn4UxRxbw75XP3KIDBIcZDhxrRQIc1t9U50jZdlcr1+RiriO5QreQJaU4Vg==
Date: Wed, 29 Jun 2022 09:30:35 +0200
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 5/5] powerpc/pseries: use of_property_alloc/free()
 and of_node_alloc()
Message-ID: <20220629093035.281c8cd6@fixe.home>
In-Reply-To: <a6068e53-80ea-600b-0b54-0a1d0c784c54@csgroup.eu>
References: <20220620104123.341054-1-clement.leger@bootlin.com>
	<20220620104123.341054-6-clement.leger@bootlin.com>
	<a6068e53-80ea-600b-0b54-0a1d0c784c54@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
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
Cc: David Hildenbrand <david@redhat.com>, Paul Mackerras <paulus@samba.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ohhoon Kwon <ohoono.kwon@samsung.com>, Frank Rowand <frowand.list@gmail.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Steen Hegelund <steen.hegelund@microchip.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, YueHaibing <yuehaibing@huawei.com>, Bjorn Helgaas <helgaas@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Allan Nielsen <allan.nielsen@microchip.com>, Laurent Dufour <ldufour@linux.ibm.com>, David Gibson <david@gibson.dropbear.id.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Lizhi Hou <lizhi.hou@xilinx.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le Tue, 28 Jun 2022 17:00:45 +0000,
Christophe Leroy <christophe.leroy@csgroup.eu> a =C3=A9crit :

> > -static int pSeries_reconfig_add_node(const char *path, struct property=
 *proplist)
> > +static struct device_node *pSeries_reconfig_add_node(const char *path)
> >   {
> > -	struct device_node *np;
> > -	int err =3D -ENOMEM;
> > -
> > -	np =3D kzalloc(sizeof(*np), GFP_KERNEL);
> > -	if (!np)
> > -		goto out_err;
> > -
> > -	np->full_name =3D kstrdup(kbasename(path), GFP_KERNEL);
> > -	if (!np->full_name)
> > -		goto out_err;
> > -
> > -	np->properties =3D proplist;
> > -	of_node_set_flag(np, OF_DYNAMIC);
> > -	of_node_init(np);
> > +	struct device_node *np, *parent;
> >  =20
> > -	np->parent =3D pseries_of_derive_parent(path);
> > -	if (IS_ERR(np->parent)) {
> > -		err =3D PTR_ERR(np->parent);
> > -		goto out_err;
> > +	np =3D of_find_node_by_path(path) =20
>=20
> Missing ;
>=20
> Did you test build ?

I generally test build for powerpc but it seems like I forgot to rebuild
my powerpc kernel build after this modification. It seems like only
this error did not pass through the test build. I'll try to be more
careful next time.

Sorry for that.

--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com
