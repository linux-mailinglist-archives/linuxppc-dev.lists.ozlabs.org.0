Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D83AD51D291
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 09:51:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvjRs5G3wz3cBw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 17:51:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=AK/nPydJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=clement.leger@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AK/nPydJ; dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvjRL0DhLz3bdF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 17:50:36 +1000 (AEST)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 98185E000D;
 Fri,  6 May 2022 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651823429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mL7sWko/zEY1GKDqcFPw+UFI+rxOeH7QwJrlHZfz4xY=;
 b=AK/nPydJipqNR7/LTq0Oh0NBKO5Xpwgy2vPit48NwT+fXefQVBBFNbZBGu4uzLX8zh+R8E
 l98COuBzajZ62Ma6Yr5qHS/RX4ZT8dZi/0iPa8gISwhl1IOLq0wDl7vPK5+S5tBrSfRS3S
 Vv2WvRTuOMcQTvHJypbz5lwne8EUK1namBL6Gs2g4GaZFwUhWTnlfdYmUIUcoflzQpL7cL
 khQVgoVMxc2hCLixlzDABxy8HT9C5JOVX6lPD9DPuYSjZBuRY034T15iZ/T3TDzEpc+dz8
 rvQLkCKD31v8tVr0jpiVApbQ24Az7LAY0Df5s4RFgvRx4l6bBKQoM1j2DTRUfw==
Date: Fri, 6 May 2022 09:49:05 +0200
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] of: dynamic: add of_property_alloc() and
 of_property_free()
Message-ID: <20220506094905.27bc99aa@fixe.home>
In-Reply-To: <YnQnayouXw9/jp/E@robh.at.kernel.org>
References: <20220504154033.750511-1-clement.leger@bootlin.com>
 <20220504154033.750511-2-clement.leger@bootlin.com>
 <YnQnayouXw9/jp/E@robh.at.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, devicetree@vger.kernel.org,
 Ohhoon Kwon <ohoono.kwon@samsung.com>, David Hildenbrand <david@redhat.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
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

Le Thu, 5 May 2022 14:37:15 -0500,
Rob Herring <robh@kernel.org> a =C3=A9crit :


> > +
> > +/**
> > + * of_property_alloc - Allocate a property dynamically.
> > + * @name:	Name of the new property
> > + * @value:	Value that will be copied into the new property value
> > + * @value_len:	length of @value to be copied into the new property val=
ue
> > + * @len:	Length of new property value, must be greater than @value_len=
 =20
>=20
> What's the usecase for the lengths being different? That doesn't seem=20
> like a common case, so perhaps handle it with a NULL value and=20
> non-zero length. Then the caller has to deal with populating=20
> prop->value.

That was actually something used by powerpc code but agreed, letting
the user recopy it's values seems fine to me and the usage will be more
clear.

> >  	/*
> > -	 * NOTE: There is no check for zero length value.
> > -	 * In case of a boolean property, this will allocate a value
> > -	 * of zero bytes. We do this to work around the use
> > -	 * of of_get_property() calls on boolean values.
> > +	 * Even if the property has no value, it must be set to a
> > +	 * non-null value since of_get_property() is used to check
> > +	 * some values that might or not have a values (ranges for
> > +	 * instance). Moreover, when the node is released, prop->value
> > +	 * is kfreed so the memory must come from kmalloc. =20
>=20
> Allowing for NULL value didn't turn out well...
>=20
> We know that we can do the kfree because OF_DYNAMIC is set IIRC...
>=20
> If we do 1 allocation for prop and value, then we can test=20
> for "prop->value =3D=3D prop + 1" to determine if we need to free or not.

Sounds like a good idea.

--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com
