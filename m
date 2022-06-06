Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B84453E1C3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 10:47:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGnDZ0Jbnz3dQr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 18:47:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=mNWUkWHT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net; envelope-from=clement.leger@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=mNWUkWHT;
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGnCv5Y9yz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 18:46:48 +1000 (AEST)
Received: (Authenticated sender: clement.leger@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F32042000A;
	Mon,  6 Jun 2022 08:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654505199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75qgHKwIKgnIiICyryatdq8N2BG0ZYToQkeJFKYpOyQ=;
	b=mNWUkWHTOojrTe6HLV5mYj/qDyPD6Vjoj1Th6VxIj0hphRoWzffGlNykUXVPF6H2qtdv2x
	ZWZJvlotPhnOqS+XIidmjHGe5FlnuRprs++sr89G5cCNuleyoMKzZ4d2ak9ajaNdWx6PX6
	IR1Ne6HRAJXVFlXplfiU7z83IfU4d0HdTXDlNgdS+mdlHnw4z6/wdTgOE9UbvAC6O7BCBS
	cwAxCXdwozmZYTkHroRsjoradSXM9mog5qt7rSSZ2E8hkT13/hce1tI/r1jsu06ZqqsivV
	m+ufnT/aWk27MkbiBzwPIBhm8bmow8PpVH1RDlp2ZDA6xz4B5i7getTbRKJTgA==
Date: Mon, 6 Jun 2022 10:45:31 +0200
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/4] powerpc/pseries: use of_property_alloc/free()
 and of_node_alloc()
Message-ID: <20220606104531.6ec997ef@fixe.home>
In-Reply-To: <20220603201407.GA688883-robh@kernel.org>
References: <20220601081801.348571-1-clement.leger@bootlin.com>
	<20220601081801.348571-5-clement.leger@bootlin.com>
	<20220603201407.GA688883-robh@kernel.org>
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
Cc: David Hildenbrand <david@redhat.com>, Paul Mackerras <paulus@samba.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ohhoon Kwon <ohoono.kwon@samsung.com>, Frank Rowand <frowand.list@gmail.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Steen Hegelund <steen.hegelund@microchip.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, YueHaibing <yuehaibing@huawei.com>, Bjorn Helgaas <helgaas@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>, devicetree@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, Laurent Dufour <ldufour@linux.ibm.com>, David Gibson <david@gibson.dropbear.id.au>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Lizhi Hou <lizhi.hou@xilinx.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le Fri, 3 Jun 2022 15:14:07 -0500,
Rob Herring <robh@kernel.org> a =C3=A9crit :

> >  static struct device_node *dlpar_parse_cc_node(struct cc_workarea *ccw=
a)
> >  {
> > -	struct device_node *dn;
> >  	const char *name;
> > =20
> > -	dn =3D kzalloc(sizeof(*dn), GFP_KERNEL);
> > -	if (!dn)
> > -		return NULL;
> > -
> >  	name =3D (const char *)ccwa + be32_to_cpu(ccwa->name_offset);
> > -	dn->full_name =3D kstrdup(name, GFP_KERNEL);
> > -	if (!dn->full_name) {
> > -		kfree(dn);
> > -		return NULL;
> > -	}
> > =20
> > -	of_node_set_flag(dn, OF_DYNAMIC);
> > -	of_node_init(dn);
> > -
> > -	return dn;
> > +	return of_node_alloc(name, GFP_KERNEL); =20
>=20
> Do you have any need for different flags? I can't really see a need for=20
> atomic or dma allocs or ???, so drop it I think.

Hum no, i copied this behavior from an existing function. I'll remove
that.

>=20
> >  }
> > =20
> >  static void dlpar_free_one_cc_node(struct device_node *dn)
> > @@ -102,11 +66,10 @@ static void dlpar_free_one_cc_node(struct device_n=
ode *dn)
> >  	while (dn->properties) {
> >  		prop =3D dn->properties;
> >  		dn->properties =3D prop->next;
> > -		dlpar_free_cc_property(prop);
> > +		of_property_free(prop); =20
>=20
> We should be able to just put the node and all the properties already=20
> attached will be freed.

Indeed !

>=20
> Looking at the history of this code, it originally did the kref_init=20
> much later in dlpar_attach_node(). So there was a window of allocating=20
> the node and adding properties where you'd need to manually free=20
> everything. Now that the node is referenced from the start, a put should=
=20
> free everything.
>=20
> > @@ -91,9 +82,7 @@ static void release_prop_list(const struct property *=
prop)
> >  	struct property *next;
> >  	for (; prop; prop =3D next) {
> >  		next =3D prop->next;
> > -		kfree(prop->name);
> > -		kfree(prop->value);
> > -		kfree(prop);
> > +		of_property_free(prop); =20
>=20
> Looks like you need this because code does: alloc properties, alloc=20
> node, add properties, attach node. It would need to be refactored to=20
> alloc the node first, but that's a bit more complex needing someone to=20
> test on pSeries.

Acked.

>=20
> >  	}
> > =20
> >  }
> > @@ -167,27 +156,17 @@ static char * parse_next_property(char *buf, char=
 *end, char **name, int *length
> >  static struct property *new_property(const char *name, const int lengt=
h,
> >  				     const unsigned char *value, struct property *last)
> >  {
> > -	struct property *new =3D kzalloc(sizeof(*new), GFP_KERNEL);
> > +	struct property *prop;
> > =20
> > -	if (!new)
> > +	prop =3D of_property_alloc(name, NULL, length + 1, GFP_KERNEL);
> > +	if (!prop)
> >  		return NULL;
> > =20
> > -	if (!(new->name =3D kstrdup(name, GFP_KERNEL)))
> > -		goto cleanup;
> > -	if (!(new->value =3D kmalloc(length + 1, GFP_KERNEL)))
> > -		goto cleanup;
> > -
> > -	memcpy(new->value, value, length);
> > -	*(((char *)new->value) + length) =3D 0;
> > -	new->length =3D length;
> > -	new->next =3D last;
> > -	return new;
> > -
> > -cleanup:
> > -	kfree(new->name);
> > -	kfree(new->value);
> > -	kfree(new);
> > -	return NULL;
> > +	memcpy(prop->value, value, length);
> > +	*(((char *)prop->value) + length) =3D 0; =20
>=20
> Looks to me like this could be avoided with this change:
>=20
> diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/pla=
tforms/pseries/reconfig.c
> index cad7a0c93117..614753fc5f27 100644
> --- a/arch/powerpc/platforms/pseries/reconfig.c
> +++ b/arch/powerpc/platforms/pseries/reconfig.c
> @@ -148,7 +148,7 @@ static char * parse_next_property(char *buf, char *en=
d, char **name, int *length
>         /* now we're on the value */
>         *value =3D tmp;
>         tmp +=3D *length;
> -       if (tmp > end) {
> +       if (tmp >=3D end) {
>                 printk(KERN_ERR "property parse failed in %s at line %d\n=
",
>                        __func__, __LINE__);
>                 return NULL;
> @@ -158,6 +158,7 @@ static char * parse_next_property(char *buf, char *en=
d, char **name, int *length
>                        __func__, __LINE__);
>                 return NULL;
>         }
> +       *tmp =3D '\0';
>         tmp++;
> =20
>         /* and now we should be on the next name, or the end */
>=20
>=20
> Based on the comments, 'buf' should be nul terminated, so I would think=20
> that tmp =3D=3D end would be an error. But I really don't know.
>=20
> Really need some pSeries people to comment on all this.
>=20
> Another option is if value is NULL, then of_property_alloc() should=20
> ensure the buffer is zeroed. Then you just need the memcpy.

Probably looks like a safe behavior anyway to zero the value buffer.
I'll add that.

Thanks,

Cl=C3=A9ment

>=20
> Rob



--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com
