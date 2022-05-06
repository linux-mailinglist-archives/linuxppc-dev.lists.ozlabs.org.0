Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD351D5EB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 12:45:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvnKG5WnGz3c8c
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 20:45:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=BWZ9TvS5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=clement.leger@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BWZ9TvS5; dkim-atps=neutral
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvnJh52bpz2xBv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 20:45:06 +1000 (AEST)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7862AC000E;
 Fri,  6 May 2022 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651833901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGQDY12wXijcoD4wVlIl8GRaAeVSN1VXTWLT8MFX0sY=;
 b=BWZ9TvS5I2P+CsVnRy3GTaTxbed2YCuizlO9DVt7xjLsa1wbjLJfkk2Per51Q8scCAULM1
 6qaLwEtegTL5lDf+ApWcPZCiFNczIenzAHbHUZDe+ZamGFEmL6lv17FXRnUnvYV3qFpnr/
 2iBYMOhBGTVDOaRfNf/R3vktAEPB14JDOO38aMNYZ6XQ3BU7lgUgLKPhLeDABc5oRpscXJ
 oYV7askBk05jakApkWgW86E7GTFeI1mPyyGC+CTqnBn+VvoH4f2GpucadX5e66P/pRX+XU
 cM4E+vDjAi4wNdY7+/gSHbeZ/qeWHeEtZQNia8bcJMcUze7GLHbYAZBmoM+7bQ==
Date: Fri, 6 May 2022 12:43:39 +0200
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] of: dynamic: add of_node_alloc() and of_node_free()
Message-ID: <20220506124339.2c772fa0@fixe.home>
In-Reply-To: <YnQo+mdDBuoKA6Fq@robh.at.kernel.org>
References: <20220504154033.750511-1-clement.leger@bootlin.com>
 <20220504154033.750511-3-clement.leger@bootlin.com>
 <YnQo+mdDBuoKA6Fq@robh.at.kernel.org>
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

Le Thu, 5 May 2022 14:43:54 -0500,
Rob Herring <robh@kernel.org> a =C3=A9crit :

> On Wed, May 04, 2022 at 05:40:32PM +0200, Cl=C3=A9ment L=C3=A9ger wrote:
> > Add functions which allows to create and free nodes.
> >=20
> > Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> > ---
> >  drivers/of/dynamic.c | 59 ++++++++++++++++++++++++++++++++++++--------
> >  include/linux/of.h   |  9 +++++++
> >  2 files changed, 58 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> > index e8700e509d2e..ec28e5ba2969 100644
> > --- a/drivers/of/dynamic.c
> > +++ b/drivers/of/dynamic.c
> > @@ -455,6 +455,54 @@ struct property *__of_prop_dup(const struct proper=
ty *prop, gfp_t allocflags)
> >  				 prop->length, allocflags);
> >  }
> > =20
> > +/**
> > + * of_node_free - Free a node allocated dynamically.
> > + * @node:	Node to be freed
> > + */
> > +void of_node_free(const struct device_node *node)
> > +{
> > +	kfree(node->full_name);
> > +	kfree(node->data);
> > +	kfree(node);
> > +}
> > +EXPORT_SYMBOL(of_node_free); =20
>=20
> This shouldn't be needed. Nodes are refcounted, so any caller should=20
> just do a put.

Acked. Do you want the name to be allocated as part of the node
allocation also ?

>=20
> Rob



--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com
