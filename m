Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1970E53B3FE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 09:00:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDH2q2YXdz3bt2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 17:00:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=TYqxujkm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::232; helo=relay12.mail.gandi.net; envelope-from=clement.leger@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=TYqxujkm;
	dkim-atps=neutral
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDH2H2LSKz2xCB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 16:59:47 +1000 (AEST)
Received: (Authenticated sender: clement.leger@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9314B20000E;
	Thu,  2 Jun 2022 06:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654153179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ukpk2PhTNgnldCy67ZFRAl2tgnnTsdT1m3HaHzQ3lmU=;
	b=TYqxujkmVKqU+VxmpJpCxk7SVMB0b6DXFe4sKxtH/hD3Y6fko286gmLEAZcAm0LAxOqAr9
	QU/anKOonLufbm7E7DrcnjBPEBndSVbmWnIZ2BU139vl3nTPZTvbw/tIEF9bE0ct07L5rI
	cIDmpAf5jb/u5Lf2CK4P4tlfxeBleDMUTq2Fl76cYxKMeHFs1iVjjlZA8hHGGc7ODs0Qez
	jaJJCZYfh7HVUfzvn6mdn3P+lS4z7uGPvluCC1EnkBAG7ThHvgqIlLHgG6+xBzUrzyCNe6
	1ng6MwmFwcb2t8vxMvZBtOrNAxgrdyYl/THFP5oKy3eWirnPxkHjKQxNM86MHg==
Date: Thu, 2 Jun 2022 08:58:28 +0200
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH v2 2/4] of: dynamic: add of_property_alloc() and
 of_property_free()
Message-ID: <20220602085828.2138554a@fixe.home>
In-Reply-To: <4b92277e-5133-2362-8d3a-fa82b0c7a045@linux.ibm.com>
References: <20220601081801.348571-1-clement.leger@bootlin.com>
	<20220601081801.348571-3-clement.leger@bootlin.com>
	<4b92277e-5133-2362-8d3a-fa82b0c7a045@linux.ibm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-pc-linux-gnu)
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
Cc: David Hildenbrand <david@redhat.com>, Paul Mackerras <paulus@samba.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ohhoon Kwon <ohoono.kwon@samsung.com>, Frank Rowand <frowand.list@gmail.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Steen Hegelund <steen.hegelund@microchip.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, YueHaibing <yuehaibing@huawei.com>, Bjorn Helgaas <helgaas@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Allan Nielsen <allan.nielsen@microchip.com>, Laurent Dufour <ldufour@linux.ibm.com>, David Gibson <david@gibson.dropbear.id.au>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Lizhi Hou <lizhi.hou@xilinx.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le Wed, 1 Jun 2022 15:32:29 -0700,
Tyrel Datwyler <tyreld@linux.ibm.com> a =C3=A9crit :

> >  /**
> > - * __of_prop_dup - Copy a property dynamically.
> > - * @prop:	Property to copy
> > + * of_property_free - Free a property allocated dynamically.
> > + * @prop:	Property to be freed
> > + */
> > +void of_property_free(const struct property *prop)
> > +{
> > +	if (!of_property_check_flag(prop, OF_DYNAMIC))
> > +		return;
> > + =20
>=20
> This looks wrong to me. From what I understand the value data is allocate=
d as
> trailing memory that is part of the property allocation itself. (ie. prop=
 =3D
> kzalloc(sizeof(*prop) + len, allocflags)). So, kfree(prop) should also ta=
ke care
> of the trailing value data. Calling kfree(prop->value) is bogus since
> prop->value wasn't dynamically allocated on its own.

kfree(prop->value) is only called if the value is not the trailing data
of the property so I don't see what is wrong there. In that case, only
kfree(prop) is called.

>=20
> Also, this condition will always fail. You explicitly set prop->value =3D=
 prop + 1
> in alloc.

The user that did allocated the property might want to provide its own
"value". In that case, prop->value would be overwritten by the user
allocated value and thus the check would be true, hence calling
kfree(prop->value).

>=20
> Maybe I need to go back and look at v1 again.
>=20
> -Tyrel
>=20
> > +	if (prop->value !=3D prop + 1)
> > +		kfree(prop->value);
> > +
> > +	kfree(prop->name);
> > +	kfree(prop);
> > +}
> > +EXPORT_SYMBOL(of_property_free);
> > +


--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com
