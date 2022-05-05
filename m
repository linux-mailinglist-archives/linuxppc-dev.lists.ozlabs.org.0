Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB16751BD94
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 12:58:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv9fM58XYz3bxY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 20:58:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=J7jAKmhc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::230;
 helo=relay10.mail.gandi.net; envelope-from=clement.leger@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J7jAKmhc; dkim-atps=neutral
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv86Q2m7Lz2ypD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 19:48:59 +1000 (AEST)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 48466240011;
 Thu,  5 May 2022 09:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651744130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dz9x7hjALAYRR1gzE0vRrtltM7FrhiyILR91Rd0tJPA=;
 b=J7jAKmhcgDJCHrO7ALoOQwG8k12UJRZJ8RSrEmyRLi/ATbqoN8r/E31uF01Is2wbZTjKfs
 Qde9j+3NYsdvMR61MBMwOhcQoNPcogEq4U0B0QHFS3nb+bG3b3etfxUa2BG9Jz70ocP+z4
 akXu5tMH7e4iHNG5ZdbRP2dKcdP6L6JIv5KkZ88ayUyoN8JDg1q/B8WwlwLRyknYSz2u6+
 ifth7DXaMUp7qZar3f0n9pwi3WyHO5AtPBboFt589pV4tYOQ0b2Nm5PzLI9bVL/UpwJWHW
 XkRa8iedTPVbdbINhI3EPb+vpclOSkojjT92UNbpIfIODzOXzpeUlIe8fhGJAA==
Date: Thu, 5 May 2022 11:47:28 +0200
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] of: dynamic: add of_property_alloc() and
 of_property_free()
Message-ID: <20220505114728.4b2de3a5@fixe.home>
In-Reply-To: <9e470414-67a5-10ce-95eb-f8093fde70d4@csgroup.eu>
References: <20220504154033.750511-1-clement.leger@bootlin.com>
 <20220504154033.750511-2-clement.leger@bootlin.com>
 <9e470414-67a5-10ce-95eb-f8093fde70d4@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 05 May 2022 20:57:52 +1000
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Ohhoon Kwon <ohoono.kwon@samsung.com>, David Hildenbrand <david@redhat.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 YueHaibing <yuehaibing@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Allan Nielsen <allan.nielsen@microchip.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Laurent Dufour <ldufour@linux.ibm.com>, Frank Rowand <frowand.list@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le Thu, 5 May 2022 07:30:47 +0000,
Christophe Leroy <christophe.leroy@csgroup.eu> a =C3=A9crit :

> >   	/*
> > -	 * NOTE: There is no check for zero length value.
> > -	 * In case of a boolean property, this will allocate a value
> > -	 * of zero bytes. We do this to work around the use
> > -	 * of of_get_property() calls on boolean values.
> > +	 * Even if the property has no value, it must be set to a
> > +	 * non-null value since of_get_property() is used to check
> > +	 * some values that might or not have a values (ranges for
> > +	 * instance). Moreover, when the node is released, prop->value
> > +	 * is kfreed so the memory must come from kmalloc.
> >   	 */
> > -	new->name =3D kstrdup(prop->name, allocflags);
> > -	new->value =3D kmemdup(prop->value, prop->length, allocflags);
> > -	new->length =3D prop->length;
> > -	if (!new->name || !new->value)
> > -		goto err_free;
> > +	if (!alloc_len)
> > +		alloc_len =3D 1;
> >  =20
> > -	/* mark the property as dynamic */
> > -	of_property_set_flag(new, OF_DYNAMIC);
> > +	prop->value =3D kzalloc(alloc_len, allocflags);
> > +	if (!prop->value)
> > +		goto out_err;
> >  =20
> > -	return new;
> > +	if (value)
> > +		memcpy(prop->value, value, value_len); =20
>=20
> Could you use kmemdup() instead of kzalloc+memcpy ?

I could but then, we won't be able to allocate a property value that is
larger than the original one. This is used by the powerpc code to
recopy an existing value and add some extra space after it.

> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index 04971e85fbc9..6b345eb71c19 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -1463,6 +1463,11 @@ enum of_reconfig_change {
> >   };
> >  =20
> >   #ifdef CONFIG_OF_DYNAMIC
> > +extern struct property *of_property_alloc(const char *name, const void=
 *value,
> > +					  int value_len, int len,
> > +					  gfp_t allocflags);
> > +extern void of_property_free(const struct property *prop);
> > + =20
>=20
> 'extern' is pointless for function prototypes, you should not add new=20
> ones. Checkpatch complain about it:

I did so that, but I kept that since the existing code is full of them.
Since you mention it, I'll remove the extern.

>=20
> CHECK: extern prototypes should be avoided in .h files
> #172: FILE: include/linux/of.h:1466:
> +extern struct property *of_property_alloc(const char *name, const void=20
> *value,
>=20
> CHECK: extern prototypes should be avoided in .h files
> #175: FILE: include/linux/of.h:1469:
> +extern void of_property_free(const struct property *prop);
>=20
>=20
>=20
>=20
> >   extern int of_reconfig_notifier_register(struct notifier_block *);
> >   extern int of_reconfig_notifier_unregister(struct notifier_block *);
> >   extern int of_reconfig_notify(unsigned long, struct of_reconfig_data =
*rd);
> > @@ -1507,6 +1512,17 @@ static inline int of_changeset_update_property(s=
truct of_changeset *ocs,
> >   	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, pro=
p);
> >   }
> >   #else /* CONFIG_OF_DYNAMIC */
> > +
> > +static inline struct property *of_property_alloc(const char *name,
> > +						 const void *value,
> > +						 int value_len, int len,
> > +						 gfp_t allocflags) =20
>=20
> Can that fit on less lines ?
>=20
> May be:
>=20
> static inline struct property
> *of_property_alloc(const char *name, const void *value, int value_len,
> 		   int len, gfp_t allocflags)

Yes, that seems a better split.

Thanks,


--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com
