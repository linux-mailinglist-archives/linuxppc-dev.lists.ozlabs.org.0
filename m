Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F379719EB30
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 14:23:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wCVw51flzDqcH
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 22:23:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=hqjagain@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hgkewgwL; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wCRw4BrMzDqd9
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Apr 2020 22:20:25 +1000 (AEST)
Received: by mail-il1-x144.google.com with SMTP id i75so11938020ild.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R6JUIvjpzPlO/CylALh6d2qFwDqIcytW6i19TRALkUw=;
 b=hgkewgwLG+H40zBE8TrLlml5d9v64hptp8pavEYfiMxq6a/6kqYkyiVxlzmw3HZw9k
 zTWyZzc5NtpPhlcLBfMK6PRjmRz5yR+lEiM9vvozLtynIKeKT06jd/WcmO9alx2pCzNy
 JE8GlVEL+zjdnQVFXcJ19LBxJZq0gtaHXoE2V8eezi3ySQQMPZ8N0G7pjIog92OFV2jY
 qi9y8dsUiejPx1qI4f/Qg7Xt2MBnHv4YGMRS8Vn+B23PazoWmHUjMDCQwgwl4SpMMFTW
 m8GJJBG4Yur7QL2rf11keafpd4l1G4UWy/8S1+PYA2bXjeNRr542b1QxO6PhSVSm7A+I
 mwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R6JUIvjpzPlO/CylALh6d2qFwDqIcytW6i19TRALkUw=;
 b=fbSkkYdUg0syauAGWctXKWU+QPm57OIXStQOHAVfPLOWMmd/QLPfNeSU0XlSN9HJ6P
 fl4RFx7nLbCxWI5h3iyjgMNPgTIju26+kQJli2K02cm4TLteRt0C+dpBesYSxJhNpvJM
 O9Fgf3+pu0q5cp2gB/XhC9JZIYBwS3WIbQH47AD1oyDYv5aHRpES1RjQTJIy2ooOF0CM
 Rv/+MVtOwUn+YdyqY8B54Aya/OQCbudczfAdZQo9eWkcqJ1Tt4qvSVOttn5U8SNZ0dGp
 MkosQPdsuVEcRg6JMFo1IbmUwNEovQkorCiMUEs1WIaNO/uZ8utgBopfN4ApJL1z3o7y
 R0gA==
X-Gm-Message-State: AGi0PuY6sd5mKIt8y9h64vBji1VifGWtM7gy1dJnAWf4JS7BN7qOJ+n/
 zq4pD33f4m54oscQgVbIZcZQWB9wSeEEcycAPLBA2uoV
X-Google-Smtp-Source: APiQypJxN49bx9bhG9DkL+BaHxpQ/iMyogY64Cv5xyge7/7qq+hv/NYDU9NjXe/FGaofmwPvrwaq8cdwew8sAvptrXk=
X-Received: by 2002:a92:83ca:: with SMTP id p71mr15793373ilk.278.1586089222451; 
 Sun, 05 Apr 2020 05:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200405103059.30769-1-hqjagain@gmail.com>
 <46e9dd45-c590-36c3-a60e-55750cde8935@c-s.fr>
In-Reply-To: <46e9dd45-c590-36c3-a60e-55750cde8935@c-s.fr>
From: Qiujun Huang <hqjagain@gmail.com>
Date: Sun, 5 Apr 2020 20:20:10 +0800
Message-ID: <CAJRQjocOZCqSq+R01ryCVASwdoE0z9+oCn0VupMeWfBiH-sZHw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/powernv: add NULL check after kzalloc in
 opal_add_one_export
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: LKML <linux-kernel@vger.kernel.org>, paulus@samba.org, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 5, 2020 at 8:12 PM Christophe Leroy <christophe.leroy@c-s.fr> w=
rote:
>
>
>
> Le 05/04/2020 =C3=A0 12:30, Qiujun Huang a =C3=A9crit :
> > Here needs a NULL check.
> >
> > Issue found by coccinelle.
> >
> > Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> > ---
> >   arch/powerpc/platforms/powernv/opal.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platf=
orms/powernv/opal.c
> > index 2b3dfd0b6cdd..5b98c98817aa 100644
> > --- a/arch/powerpc/platforms/powernv/opal.c
> > +++ b/arch/powerpc/platforms/powernv/opal.c
> > @@ -808,9 +808,12 @@ static int opal_add_one_export(struct kobject *par=
ent, const char *export_name,
> >
> >       rc =3D of_property_read_u64_array(np, prop_name, &vals[0], 2);
> >       if (rc)
> > -             goto out;
> > +             return rc;
>
> Nice you changed that too.
>
> Then there is no need the initialise attr and name to NULL in their
> declaration, as they won't be used before they are assigned.

So that's it.

>
> >
> >       attr =3D kzalloc(sizeof(*attr), GFP_KERNEL);
> > +     if (!attr)
> > +             return -ENOMEM;
> > +
> >       name =3D kstrdup(export_name, GFP_KERNEL);
> >       if (!name) {
> >               rc =3D -ENOMEM;
> >
>
> Christophe
