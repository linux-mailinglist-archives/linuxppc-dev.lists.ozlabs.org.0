Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 075A2713937
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 13:34:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QTc4t6tYrz3fGX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 21:34:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fnTknatG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com; envelope-from=mirimmad17@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fnTknatG;
	dkim-atps=neutral
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QTWTk0pDrz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 18:07:05 +1000 (AEST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-19f0ccea0e1so1518893fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 01:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685261219; x=1687853219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=by1yE0hynhTEDRPpbpoTodUbxmdRljE7mPKm8U9QdFk=;
        b=fnTknatGPlQhQ15a1CyvW4dQecmFS+BWg52YKqkX8guDcxb9WCaGhqFA+nFTZ2/3cm
         PabxmsBuusqR/df9thBzjAIbAgMMtjqbra3BSfxzu7vqOgfEw+LO0wR3gYGJyDHpX0v7
         7s+1NUDCxT1wUrTFZuYBLb1D0m9o0yMLhMaxW4KvK2FXUVsjAOgu6VwJOEx1qQ9yVGDU
         iA5Ew0F71Rw7/2wQO0sjWoi8GxQCve7hIclRfJNiYwc+zI361uwbZyI3rGIvqKY/lBRj
         mhsUjoux3Qx2olgbECcgQ9znE/oyDC3mmURX6vJRPvK/ML/q6xZe9OWWeOnguzA9AtB+
         u1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685261219; x=1687853219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=by1yE0hynhTEDRPpbpoTodUbxmdRljE7mPKm8U9QdFk=;
        b=g1n/2uWH2Bzw+eGBGtTchOaWmPU+09tSQz5KMwUz4DTbKZmATGrbJk1po69qZMsnur
         QycUAM0d/k3wi16D8HFeO6hdrV5Zx/v9nNAuKQR/GdNeXReZzeuscCwE+fugnIQKTj9C
         ZupqD8BZygcY64NgP2SECRydB+8xVEDW6RLax1caDyTmORA7Z9ZO6ZmxilVjRe5ILXRl
         0wqXKfNQso0ql/tmFHmGAgIqz1XEWX0sCZYWQwKsEOP7ObyLh4bqkq52iAxIupdBYtu+
         Zyw5UXRI/ABfO59c115RpomWI42x5T9YSdr7XrQBnHnV7Df6GJw9gE8XTNaxZlzfa231
         90Fw==
X-Gm-Message-State: AC+VfDygALdVwtU4ZYWJe4jkygdAnlRYX50qGH3HinUDhGIXCSQVp9e5
	ZJ7buwruTq/5lSmn8Alw+Ut777SXPVdnVZ/vKAE=
X-Google-Smtp-Source: ACHHUZ4DORFcubWv1tk/1REM7gV35BbLfs9sYcicBOzXg9amXUcfGX1a3E4PR9KGiCqPSOErmk0gIJH5lpRfKf9h/Bw=
X-Received: by 2002:a05:6870:73d5:b0:19a:7bd0:e260 with SMTP id
 a21-20020a05687073d500b0019a7bd0e260mr3630174oan.0.1685261219452; Sun, 28 May
 2023 01:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <CY5PR12MB64553EE96EBB3927311DB598C6459@CY5PR12MB6455.namprd12.prod.outlook.com>
 <2023052835-oxidant-doily-404f@gregkh>
In-Reply-To: <2023052835-oxidant-doily-404f@gregkh>
From: Immad Mir <mirimmad17@gmail.com>
Date: Sun, 28 May 2023 13:36:48 +0530
Message-ID: <CAJfv2=BV7GGrtG6SfRRfBaVBfdmC7cPOhH4ha0GJ_MfBka3F+Q@mail.gmail.com>
Subject: Re: [PATCH] powerpc: fix debugfs_create_dir error checking
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000056dcd105fcbc74f0"
X-Mailman-Approved-At: Sun, 28 May 2023 21:33:40 +1000
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
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, mirimmad@outlook.com, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000056dcd105fcbc74f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Why is this driver caring if debugfs is working or not at all?  It
> should just ignore the error and keep moving forward.

I do not know. But, if the authors of the driver have decided to check for
the error, maybe use the more appropriate way?

Thanks.
Immad.

On Sun, May 28, 2023 at 1:27=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:

> On Sun, May 28, 2023 at 01:16:44PM +0530, mirimmad@outlook.com wrote:
> > From: Immad Mir <mirimmad17@gmail.com>
> >
> > The debugfs_create_dir returns ERR_PTR incase of an error and the
> > correct way of checking it by using the IS_ERR inline function, and
> > not the simple null comparision. This patch fixes this.
> >
> > Suggested-By: Ivan Orlov <ivan.orlov0322@gmail.com>
> > Signed-off-by: Immad Mir <mirimmad17@gmail.com>
> > ---
> >  arch/powerpc/platforms/powernv/opal-xscom.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c
> b/arch/powerpc/platforms/powernv/opal-xscom.c
> > index 6b4eed2ef..262cd6fac 100644
> > --- a/arch/powerpc/platforms/powernv/opal-xscom.c
> > +++ b/arch/powerpc/platforms/powernv/opal-xscom.c
> > @@ -168,7 +168,7 @@ static int scom_debug_init_one(struct dentry *root,
> struct device_node *dn,
> >       ent->path.size =3D strlen((char *)ent->path.data);
> >
> >       dir =3D debugfs_create_dir(ent->name, root);
> > -     if (!dir) {
> > +     if (IS_ERR(dir)) {
> >               kfree(ent->path.data);
> >               kfree(ent);
> >               return -1;
>
> Why is this driver caring if debugfs is working or not at all?  It
> should just ignore the error and keep moving forward.
>
> And -1 is not a valid error number :(
>
> Have you hit this error on this driver?
>
> thanks,
>
> greg k-h
>

--00000000000056dcd105fcbc74f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; Why is this driver caring if debugfs is working or no=
t at all?=C2=A0 It<br><div>
&gt; should just ignore the error and keep moving forward.</div><div><br></=
div><div>I do not know. But, if the authors of the driver have decided to c=
heck for the error, maybe use the more appropriate way?</div><div><br></div=
><div>Thanks.</div><div>Immad.<br></div>
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Sun, May 28, 2023 at 1:27=E2=80=AFPM Greg KH &lt;<a href=3D"mailto:gregk=
h@linuxfoundation.org">gregkh@linuxfoundation.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Sun, May 28, 2023 at 01=
:16:44PM +0530, <a href=3D"mailto:mirimmad@outlook.com" target=3D"_blank">m=
irimmad@outlook.com</a> wrote:<br>
&gt; From: Immad Mir &lt;<a href=3D"mailto:mirimmad17@gmail.com" target=3D"=
_blank">mirimmad17@gmail.com</a>&gt;<br>
&gt; <br>
&gt; The debugfs_create_dir returns ERR_PTR incase of an error and the<br>
&gt; correct way of checking it by using the IS_ERR inline function, and<br=
>
&gt; not the simple null comparision. This patch fixes this.<br>
&gt; <br>
&gt; Suggested-By: Ivan Orlov &lt;<a href=3D"mailto:ivan.orlov0322@gmail.co=
m" target=3D"_blank">ivan.orlov0322@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Immad Mir &lt;<a href=3D"mailto:mirimmad17@gmail.com" t=
arget=3D"_blank">mirimmad17@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/powerpc/platforms/powernv/opal-xscom.c | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c b/arch/powerp=
c/platforms/powernv/opal-xscom.c<br>
&gt; index 6b4eed2ef..262cd6fac 100644<br>
&gt; --- a/arch/powerpc/platforms/powernv/opal-xscom.c<br>
&gt; +++ b/arch/powerpc/platforms/powernv/opal-xscom.c<br>
&gt; @@ -168,7 +168,7 @@ static int scom_debug_init_one(struct dentry *root=
, struct device_node *dn,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ent-&gt;path.size =3D strlen((char *)ent-&gt=
;path.data);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dir =3D debugfs_create_dir(ent-&gt;name, roo=
t);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!dir) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(dir)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(ent-&gt;pa=
th.data);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(ent);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
<br>
Why is this driver caring if debugfs is working or not at all?=C2=A0 It<br>
should just ignore the error and keep moving forward.<br>
<br>
And -1 is not a valid error number :(<br>
<br>
Have you hit this error on this driver?<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div>

--00000000000056dcd105fcbc74f0--
