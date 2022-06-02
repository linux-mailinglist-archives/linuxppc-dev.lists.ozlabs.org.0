Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D78C53BA76
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 16:07:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDSX609FVz3bry
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 00:07:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OOchDHWq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OOchDHWq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDSWS5q16z3086
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 00:07:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 12A42617E7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 14:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AE6C341C4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 14:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654178830;
	bh=rB+YEXLdG8XR0jkFRsKEAAXdE/xxi88ksXM3E3VLNGI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OOchDHWqDeJSwdEJ0OFUICz7EVpy8+a6PzEHNaVwzhhb7yXArDr3I1+saKcmY5FN+
	 7yBvyHoAHsFVJttYXdLzSYJCEqHb+xvBJHUmJ6awBoZg+/yH8qlO/WepKCj9qgRGwg
	 svEJ3DKROsXWNwfeQxnzyfTCtcnT/zBjsOdL/gaxw8s702hDJsT3ElBHSu8gCifCZW
	 esNJcYoQrwhRXbvj8QP6bi8e/CAS89eq65MoFUWxnjJOvHSSaWFro4r0qwz1Tb9EPW
	 5KlVq+1ozcn2lDHcRRcAd8Yzpcq+dQxbTl436RpXqDxHNdunxoRgAISz69yNSljxaf
	 rrCnEa0eOGjOw==
Received: by mail-vk1-f177.google.com with SMTP id b144so2201046vkb.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jun 2022 07:07:10 -0700 (PDT)
X-Gm-Message-State: AOAM533ZNEykdkFz9hsXRya9azPrxd51obrUna4N+N2oV6+qtQn7bHyt
	CvsFjNWNW6mr9CpbczJ9Xm6tBrUcbQgpKhHPJg==
X-Google-Smtp-Source: ABdhPJwRNoz2C7RL2wBdZjkbgLcfDaoy6nUrpLPMM2awPnoD3rVJht7Sxldc2+z8b/G9dI0W092u4lHsCiLWVbmni+o=
X-Received: by 2002:a1f:2a4e:0:b0:357:a4af:25e1 with SMTP id
 q75-20020a1f2a4e000000b00357a4af25e1mr20990221vkq.14.1654178829492; Thu, 02
 Jun 2022 07:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220504154033.750511-1-clement.leger@bootlin.com>
 <20220504154033.750511-2-clement.leger@bootlin.com> <YnQnayouXw9/jp/E@robh.at.kernel.org>
 <42d9e1af-5576-ed8a-be3a-9dfea6ce1041@linux.ibm.com>
In-Reply-To: <42d9e1af-5576-ed8a-be3a-9dfea6ce1041@linux.ibm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 2 Jun 2022 09:06:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ5MN9VGMFiDQx-1dod_=n=6HP4pvizpZ6qbcz89+hyXQ@mail.gmail.com>
Message-ID: <CAL_JsqJ5MN9VGMFiDQx-1dod_=n=6HP4pvizpZ6qbcz89+hyXQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] of: dynamic: add of_property_alloc() and of_property_free()
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, David Hildenbrand <david@redhat.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Steen Hegelund <steen.hegelund@microchip.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, YueHaibing <yuehaibing@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ohhoon Kwon <ohoono.kwon@samsung.com>, Allan Nielsen <allan.nielsen@microchip.com>, Andrew Morton <akpm@linux-foundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 1, 2022 at 5:31 PM Tyrel Datwyler <tyreld@linux.ibm.com> wrote:
>
> On 5/5/22 12:37, Rob Herring wrote:
> > On Wed, May 04, 2022 at 05:40:31PM +0200, Cl=C3=A9ment L=C3=A9ger wrote=
:
> >> Add function which allows to dynamically allocate and free properties.
> >> Use this function internally for all code that used the same logic
> >> (mainly __of_prop_dup()).
> >>
> >> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> >> ---
> >>  drivers/of/dynamic.c | 101 ++++++++++++++++++++++++++++++------------=
-
> >>  include/linux/of.h   |  16 +++++++
> >>  2 files changed, 88 insertions(+), 29 deletions(-)
> >>
> >> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> >> index cd3821a6444f..e8700e509d2e 100644
> >> --- a/drivers/of/dynamic.c
> >> +++ b/drivers/of/dynamic.c
> >> @@ -313,9 +313,7 @@ static void property_list_free(struct property *pr=
op_list)
> >>
> >>      for (prop =3D prop_list; prop !=3D NULL; prop =3D next) {
> >>              next =3D prop->next;
> >> -            kfree(prop->name);
> >> -            kfree(prop->value);
> >> -            kfree(prop);
> >> +            of_property_free(prop);
> >>      }
> >>  }
> >>
> >> @@ -367,48 +365,95 @@ void of_node_release(struct kobject *kobj)
> >>  }
> >>
> >>  /**
> >> - * __of_prop_dup - Copy a property dynamically.
> >> - * @prop:   Property to copy
> >> + * of_property_free - Free a property allocated dynamically.
> >> + * @prop:   Property to be freed
> >> + */
> >> +void of_property_free(const struct property *prop)
> >> +{
> >> +    kfree(prop->value);
> >> +    kfree(prop->name);
> >> +    kfree(prop);
> >> +}
> >> +EXPORT_SYMBOL(of_property_free);
> >> +
> >> +/**
> >> + * of_property_alloc - Allocate a property dynamically.
> >> + * @name:   Name of the new property
> >> + * @value:  Value that will be copied into the new property value
> >> + * @value_len:      length of @value to be copied into the new proper=
ty value
> >> + * @len:    Length of new property value, must be greater than @value=
_len
> >
> > What's the usecase for the lengths being different? That doesn't seem
> > like a common case, so perhaps handle it with a NULL value and
> > non-zero length. Then the caller has to deal with populating
> > prop->value.
> >
> >>   * @allocflags:     Allocation flags (typically pass GFP_KERNEL)
> >>   *
> >> - * Copy a property by dynamically allocating the memory of both the
> >> + * Create a property by dynamically allocating the memory of both the
> >>   * property structure and the property name & contents. The property'=
s
> >>   * flags have the OF_DYNAMIC bit set so that we can differentiate bet=
ween
> >>   * dynamically allocated properties and not.
> >>   *
> >>   * Return: The newly allocated property or NULL on out of memory erro=
r.
> >>   */
> >> -struct property *__of_prop_dup(const struct property *prop, gfp_t all=
ocflags)
> >> +struct property *of_property_alloc(const char *name, const void *valu=
e,
> >> +                               int value_len, int len, gfp_t allocfla=
gs)
> >>  {
> >> -    struct property *new;
> >> +    int alloc_len =3D len;
> >> +    struct property *prop;
> >> +
> >> +    if (len < value_len)
> >> +            return NULL;
> >>
> >> -    new =3D kzalloc(sizeof(*new), allocflags);
> >> -    if (!new)
> >> +    prop =3D kzalloc(sizeof(*prop), allocflags);
> >> +    if (!prop)
> >>              return NULL;
> >>
> >> +    prop->name =3D kstrdup(name, allocflags);
> >> +    if (!prop->name)
> >> +            goto out_err;
> >> +
> >>      /*
> >> -     * NOTE: There is no check for zero length value.
> >> -     * In case of a boolean property, this will allocate a value
> >> -     * of zero bytes. We do this to work around the use
> >> -     * of of_get_property() calls on boolean values.
> >> +     * Even if the property has no value, it must be set to a
> >> +     * non-null value since of_get_property() is used to check
> >> +     * some values that might or not have a values (ranges for
> >> +     * instance). Moreover, when the node is released, prop->value
> >> +     * is kfreed so the memory must come from kmalloc.
> >
> > Allowing for NULL value didn't turn out well...
> >
> > We know that we can do the kfree because OF_DYNAMIC is set IIRC...
> >
> > If we do 1 allocation for prop and value, then we can test
> > for "prop->value =3D=3D prop + 1" to determine if we need to free or no=
t.
>
> If its a single allocation do we even need a test? Doesn't kfree(prop) ta=
ke care
> of the property and the trailing memory allocated for the value?

Yes, it does when it's a single alloc, but it's testing for when
prop->value is not a single allocation because we could have either.

Rob
