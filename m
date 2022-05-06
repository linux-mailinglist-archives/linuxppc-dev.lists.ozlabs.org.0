Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A251D281
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 09:45:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvjKZ1CJPz3c9y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 17:45:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=JEfgnl+V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=clement.leger@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JEfgnl+V; dkim-atps=neutral
X-Greylist: delayed 144179 seconds by postgrey-1.36 at boromir;
 Fri, 06 May 2022 17:45:08 AEST
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvjK05sQzz2xF8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 17:45:05 +1000 (AEST)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7B0FE240010;
 Fri,  6 May 2022 07:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651823100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PGzNB4W4WfGK9PIJGUcSrH2CG36WKRbfkNH89DZr2pM=;
 b=JEfgnl+VgeNXkCi9WmNelq7MqYYGqUqE3V8lLJ1ouTRKtV4ZB+l7Y+vuBy9sONaFi/4Tss
 TpNmuLn+7xCOsMnTcXpQp1TdMztRBXLDwUtfL8Dx3WvdHairjaIGwDjd03qf61hDvOYOPW
 3RsFKkZrQ8O7/c4fviwabahTxavVQ4NGYV990U6lWeMHvqUY12Xd0XqvXr0HutdQ7f818m
 dUq4rLktDIy/KAhfqcn+z7ZwkcgRDZUJmfeKxinV0HLx/aO0hkBoR5fG8lUSmX3a+uOYpL
 kB0dkTCQE4coldMuQ5k4HA2OuH3CMNo8/V1HkFe2rUkGwHhbSEWoKk2Bnq8FWQ==
Date: Fri, 6 May 2022 09:43:39 +0200
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] of: dynamic: add of_property_alloc() and
 of_property_free()
Message-ID: <20220506094339.55b8aa63@fixe.home>
In-Reply-To: <YnQLYjcIc0PjvWYR@robh.at.kernel.org>
References: <20220504154033.750511-1-clement.leger@bootlin.com>
 <20220504154033.750511-2-clement.leger@bootlin.com>
 <9e470414-67a5-10ce-95eb-f8093fde70d4@csgroup.eu>
 <YnQLYjcIc0PjvWYR@robh.at.kernel.org>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Ohhoon Kwon <ohoono.kwon@samsung.com>, David Hildenbrand <david@redhat.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 YueHaibing <yuehaibing@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
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

Le Thu, 5 May 2022 12:37:38 -0500,
Rob Herring <robh@kernel.org> a =C3=A9crit :

> > >  =20
> > > -	/* mark the property as dynamic */
> > > -	of_property_set_flag(new, OF_DYNAMIC);
> > > +	prop->value =3D kzalloc(alloc_len, allocflags);
> > > +	if (!prop->value)
> > > +		goto out_err;
> > >  =20
> > > -	return new;
> > > +	if (value)
> > > +		memcpy(prop->value, value, value_len); =20
> >=20
> > Could you use kmemdup() instead of kzalloc+memcpy ? =20
>=20
> I'd prefer there be 1 alloc for struct property and value instead of 2.=20
> And maybe 'name' gets rolled into it too, but that gets a bit more=20
> complicated to manage I think.=20

At least for value it should be easy indeed. i'll check what I can do
for the name.

>=20
> With memcpy, note this series[1].

Ok, good to know, should I base my series on that one ?

>=20
> Rob
>=20
> [1] https://lore.kernel.org/all/20220504014440.3697851-30-keescook@chromi=
um.org/


--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com
