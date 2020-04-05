Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BB319EA5B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 12:23:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48w8rz5H5czDqgd
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 20:23:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=hqjagain@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IkXSasLQ; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48w8qQ3gcszDqCw
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Apr 2020 20:22:07 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id o3so12597974ioh.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 03:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CcpZ55sIaW80vBf2IOXi5oS4UvwpWuI+r7GfFf/L5RY=;
 b=IkXSasLQ9grTa++au/Z5hXPOKZ3ZYi+1JzuViyhA0HLbYf0TxrRQXTwA9oh8IWSDi8
 dzdpEl2smjGu27eIT7o5v8nOu8XP0B0lJr4jqEisaOuLgNSJsaJnx/WVlQjQCTzZliM1
 ED+serjzQZUw9NU+mOG7b8c/g0O5j4V+5G5QaGdwVPxPzaEN7h9TMFRIa6Xwf3ReS/d8
 1IIjeLFvSMjo2NJUER3BzVCwPsjIDncOnhahCE+euDnJ5TBQFxPAJZfYZsgtQiCvaIpG
 873oPWRQQLsu0YKt0vGP6KcE++U77GXyZCJAytUJ+zFCYr076Qn6O8D1ToIHLPQAmyPr
 RsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CcpZ55sIaW80vBf2IOXi5oS4UvwpWuI+r7GfFf/L5RY=;
 b=T/FFToBxVCBKJOog8pbnxLMU1xYH2vlX/OLblm2jrWx+pIWZ4Z40Eql8M1cvB7y6eh
 cy/9mZWBYSzDHcHdK+eaD8nbqybxucyrlTtKep+Wc1awSZAkdmvV5gLFJwydB0o+0Ppi
 I3VWEHU29gs/8l9j3mXqv57/306c03gC5alGHFF5ORPIyg+LbbWQQxtpf6KOeLByxhJ/
 mvEu0T+CXUYDhWs36+jOUKifw8ASLncNEPKB4UCftm7wFTBp5bWmR6mO9F3urrhzBisn
 xFWqsecOxTuefVrJuKqT7WcukglbLW1sCYwUI3lizPb/4EkD8YjXStkol7NcCLDIyUQV
 yFjQ==
X-Gm-Message-State: AGi0PuZwOZgnUZhYgocCsMo4JFj38MQaIngBRkk+K9shPAihlmHFPQvB
 gCaCsmIm77IkeGR8Q3LSG3nQIULrFOwnhP+xIAw=
X-Google-Smtp-Source: APiQypJKgTx8bihiWHOKmKlabLFQky52UBaqKhm6wL/tZQaMqBSjHPcL7tDK7R6WOyDjxMi2q/21LfluYWWijQp29OE=
X-Received: by 2002:a5d:984b:: with SMTP id p11mr15046520ios.175.1586082122447; 
 Sun, 05 Apr 2020 03:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200405075123.28756-1-hqjagain@gmail.com>
 <99de2220-5a64-e81e-6886-447296431548@c-s.fr>
In-Reply-To: <99de2220-5a64-e81e-6886-447296431548@c-s.fr>
From: Qiujun Huang <hqjagain@gmail.com>
Date: Sun, 5 Apr 2020 18:21:49 +0800
Message-ID: <CAJRQjodoHMn+XA+iYkM2D8OiEWk1rF+trZbB9GvKF_=2Rv2g1w@mail.gmail.com>
Subject: Re: [PATCH] powerpc/powernv: add NULL check after kzalloc in
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
Cc: tglx@linutronix.de, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 5, 2020 at 6:13 PM Christophe Leroy <christophe.leroy@c-s.fr> w=
rote:
>
>
>
> Le 05/04/2020 =C3=A0 09:51, Qiujun Huang a =C3=A9crit :
> > Here needs a NULL check.
> >
> > Issue found by coccinelle.
> >
> > Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> > ---
> >   arch/powerpc/platforms/powernv/opal.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platf=
orms/powernv/opal.c
> > index 2b3dfd0b6cdd..09443ae3a86e 100644
> > --- a/arch/powerpc/platforms/powernv/opal.c
> > +++ b/arch/powerpc/platforms/powernv/opal.c
> > @@ -811,6 +811,11 @@ static int opal_add_one_export(struct kobject *par=
ent, const char *export_name,
> >               goto out;
> >
> >       attr =3D kzalloc(sizeof(*attr), GFP_KERNEL);
> > +     if (!attr) {
> > +             rc =3D -ENOMEM;
> > +             goto out;
>
> You don't need to go to out:, there is nothing to do. You should do:
>
>         if (!attr)
>                 return -ENOMEM;

Yeah, I get that. Thanks.

>
> > +     }
> > +
> >       name =3D kstrdup(export_name, GFP_KERNEL);
> >       if (!name) {
> >               rc =3D -ENOMEM;
> >
>
> Christophe
