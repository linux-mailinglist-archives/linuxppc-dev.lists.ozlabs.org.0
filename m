Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA1B2DEB3B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 22:44:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyMnd5Cc4zDqY2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 08:44:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a30;
 helo=mail-vk1-xa30.google.com; envelope-from=arielmarcovitch@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H5C7Iz9S; dkim-atps=neutral
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyLGt2pbszDqVl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 07:35:49 +1100 (AEDT)
Received: by mail-vk1-xa30.google.com with SMTP id d68so839635vka.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 12:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y9T1y0frm/LCcJYCyzeLwGC49Vl7q5bA3z2YLXic4DU=;
 b=H5C7Iz9SNxKfs1J7tP264/GPplCwlKPDIUl+A67qSKRCyT7MkdsqIftpIMIskLe34U
 tmE6WS0N0TcN+zn5U9UVMdknukU5JpdsgR15hSgwwvrMLl2fS/G222qCDpZyNnWmS3Mm
 pWzw42MuWD7BuMFF1Ltk4XC672v7Fx+be8QdpKxDg/odfe/Dfk3rBkA/eF9X8X0z3G8u
 PsrFWhN4JNjBFhbMrlFkiJfwKqRcRC/iaexZdG++wwjbEO6xZlMwY2+zFag4CindJoEE
 upCs97vDK55Fo31Y+rD44JIfZXjyDPmpRrrt6XZV90EcfmL2ptxMKGz8kvX818hpkFE7
 hHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y9T1y0frm/LCcJYCyzeLwGC49Vl7q5bA3z2YLXic4DU=;
 b=cvZ2LKpXoZCIOFijgKzWvY5vGICDJZLN6FeKgopVlwSJU0/ZGdr4XnuXFo0v4bJzCJ
 TzJnAc/+JCe2LnHQJrJ10vr5Sa2rYRF2s4g42xyABP++rNJgeHB1Wu+DJJ3MTJWcqSko
 KIkNN4VO0QIG9IWBqndbCguwsK1qrcOZoMXUb3FdD+zXQW6kYLJLOH8avmRkRq4w+dDn
 ANM1wMgdAOaO0cbA4DR1s6MIUuyMTkDz4JAwzmzipTWl/1MiHDhVSNNFRpV9GTHHQLTP
 ITs2DMeKplxGgSheLa+BltfX2+Qgx2rtIQTR7nS2yoWBcGf7Uj1AsbeTlCSD+kS7MA7b
 K7Nw==
X-Gm-Message-State: AOAM532USvUdc0+0E3j3tNt/36ev6ICTRR6kRMLtNRY0Ppsamfr4fMNs
 k+f/UfK97Y2Ou+vJbKU4asR3E7BcyPiuZt69648=
X-Google-Smtp-Source: ABdhPJyuvroUaJup2mKjjSt9hmHAuoOdcr1m07Vbmh17vUVgyP0hFsiwmz07p+t2Dl5OIeprZTeqWhu8mAU7a/56euw=
X-Received: by 2002:a1f:2956:: with SMTP id p83mr6835014vkp.22.1608323744479; 
 Fri, 18 Dec 2020 12:35:44 -0800 (PST)
MIME-Version: 1.0
References: <20201213183556.16976-1-ariel.marcovitch@gmail.com>
 <4716e80b-db6f-7669-684f-398971ed5f2e@csgroup.eu>
In-Reply-To: <4716e80b-db6f-7669-684f-398971ed5f2e@csgroup.eu>
From: ariel marcovitch <arielmarcovitch@gmail.com>
Date: Fri, 18 Dec 2020 22:35:33 +0200
Message-ID: <CAFGKuwoD9NQqa1iYBiVi-zt_xD9gqhEfGCmTopOukQF4=xxBKA@mail.gmail.com>
Subject: Re: [PATCH] powerpc: fix alignment bug whithin the init sections
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: multipart/alternative; boundary="000000000000793dc605b6c30dd1"
X-Mailman-Approved-At: Sat, 19 Dec 2020 08:42:47 +1100
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000793dc605b6c30dd1
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 18, 2020 at 5:39 PM Christophe Leroy <
christophe.leroy@csgroup.eu> wrote:

> It can cause, or it causes ? Did you encounter the issue ?
>
Yes, in configs that result in the section layout I described, the crush is
consistent.

>
> > The init sections are ordered like this:
> >       .init.text
> >       .exit.text
> >       .init.data
> >
> > Currently, these sections aren't page aligned.
> >
> > Because the init code is mapped read-only at runtime and because the
> > .init.text section can potentially reside on the same physical page as
> > .init.data, the beginning of .init.data might be mapped read-only along
> > with .init.text.
>
> init code is mapped PAGE_KERNEL_TEXT.
>
> Whether PAGE_KERNEL_TEXT is read-only or not depends on the selected
> options.
>
You are right, of course. Should I change the commit message to 'might be
mapped' or something?

>
> > Then when the kernel tries to modify a variable in .init.data (like
> > kthreadd_done, used in kernel_init()) the kernel panics.
> >
> > To avoid this, I made these sections page aligned.
>
> Should write this unpersonal, something like "To avoid this, make these
> sections page aligned"
>
Noted, thanks.


>
> >
> > Fixes: 060ef9d89d18 ("powerpc32: PAGE_EXEC required for inittext")
> > Signed-off-by: Ariel Marcovitch <ariel.marcovitch@gmail.com>
> > ---
> >   arch/powerpc/kernel/vmlinux.lds.S | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/powerpc/kernel/vmlinux.lds.S
> b/arch/powerpc/kernel/vmlinux.lds.S
> > index 326e113d2e45..e3a7c90c03f4 100644
> > --- a/arch/powerpc/kernel/vmlinux.lds.S
> > +++ b/arch/powerpc/kernel/vmlinux.lds.S
> > @@ -179,6 +179,11 @@ SECTIONS
> >   #endif
> >       } :text
> >
> > +     /* .init.text is made RO and .exit.text is not, so we must
> > +      * ensure these sections reside in separate physical pages.
> > +      */
> > +     . = ALIGN(PAGE_SIZE);
> > +
>
> In principle, as it is text, it should be made RO as well. But what
> happens at the begining doesn't
> really matter, anyway .exit.text should never be executed and is discarded
> together with init text.
> So, I think it is OK the live with it as is for the time being.


> Making it page aligned makes sense anyway.
>
> Should we make _einittext page aligned instead, just like _etext ?

Yes, this will probably be better (because when _einittext is not aligned,
the part of the page after _einittext is mapped RO implicitly, and it's
hard to notice from the code). I suppose you mean something like this:
                _sinittext = .;
                INIT_TEXT
+
+               . = ALIGN(.);
                _einittext = .;

>       /* .exit.text is discarded at runtime, not link time,
> >        * to deal with references from __bug_table
> >        */
> > @@ -186,6 +191,8 @@ SECTIONS
> >               EXIT_TEXT
> >       }
> >
> > +     . = ALIGN(PAGE_SIZE);
> > +
>
> Here for sure, as you explain in the coming log, this needs to be
> separated from init text. So
> making it aligned is a must.


> >       .init.data : AT(ADDR(.init.data) - LOAD_OFFSET) {
> >               INIT_DATA
> >       }
> >
> > base-commit: 1398820fee515873379809a6415930ad0764b2f6
> >
>
> Christophe
>
Thanks for your time,
        Ariel Marcovitch

--000000000000793dc605b6c30dd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 18, 2020 at 5:39 PM Chris=
tophe Leroy &lt;<a href=3D"mailto:christophe.leroy@csgroup.eu">christophe.l=
eroy@csgroup.eu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">It can cause, or it causes ? Did you encounter the issue ?<b=
r></blockquote><div>Yes, in configs that result in the section layout I des=
cribed, the crush is consistent.</div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
&gt; <br>
&gt; The init sections are ordered like this:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.init.text<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.exit.text<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.init.data<br>
&gt; <br>
&gt; Currently, these sections aren&#39;t page aligned.<br>
&gt; <br>
&gt; Because the init code is mapped read-only at runtime and because the<b=
r>
&gt; .init.text section can potentially reside on the same physical page as=
<br>
&gt; .init.data, the beginning of .init.data might be mapped read-only alon=
g<br>
&gt; with .init.text.<br>
<br>
init code is mapped PAGE_KERNEL_TEXT.<br>
<br>
Whether PAGE_KERNEL_TEXT is read-only or not depends on the selected option=
s.<br></blockquote><div>You are right, of course. Should I change the commi=
t message to &#39;might be mapped&#39; or something?</div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Then when the kernel tries to modify a variable in .init.data (like<br=
>
&gt; kthreadd_done, used in kernel_init()) the kernel panics.<br>
&gt; <br>
&gt; To avoid this, I made these sections page aligned.<br>
<br>
Should write this unpersonal, something like &quot;To avoid this, make thes=
e sections page aligned&quot;<br></blockquote><div>Noted, thanks.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; Fixes: 060ef9d89d18 (&quot;powerpc32: PAGE_EXEC required for inittext&=
quot;)<br>
&gt; Signed-off-by: Ariel Marcovitch &lt;<a href=3D"mailto:ariel.marcovitch=
@gmail.com" target=3D"_blank">ariel.marcovitch@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0arch/powerpc/kernel/vmlinux.lds.S | 7 +++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+)<br>
&gt; <br>
&gt; diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/v=
mlinux.lds.S<br>
&gt; index 326e113d2e45..e3a7c90c03f4 100644<br>
&gt; --- a/arch/powerpc/kernel/vmlinux.lds.S<br>
&gt; +++ b/arch/powerpc/kernel/vmlinux.lds.S<br>
&gt; @@ -179,6 +179,11 @@ SECTIONS<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} :text<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* .init.text is made RO and .exit.text is not, s=
o we must<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * ensure these sections reside in separate physi=
cal pages.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0. =3D ALIGN(PAGE_SIZE);<br>
&gt; +<br>
<br>
In principle, as it is text, it should be made RO as well. But what happens=
 at the begining doesn&#39;t <br>
really matter, anyway .exit.text should never be executed and is discarded =
together with init text.<br>
So, I think it is OK the live with it as is for the time being.</blockquote=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Making it page aligned makes sense anyway.<br>
<br>
Should we make _einittext page aligned instead, just like _etext ?</blockqu=
ote><div>Yes, this will probably be better (because when=C2=A0_einittext is=
 not aligned,</div><div>the part of the page after _einittext is mapped RO =
implicitly, and it&#39;s</div><div>hard to notice from the code). I suppose=
 you mean something like this:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 _sinittext =3D .;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 INIT_TEXT<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 . =3D ALIGN(.);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 _einittext =3D .;</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* .exit.text is discarded at runtime, not l=
ink time,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to deal with references from __bug_table<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; @@ -186,6 +191,8 @@ SECTIONS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXIT_TEXT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0. =3D ALIGN(PAGE_SIZE);<br>
&gt; +<br>
<br>
Here for sure, as you explain in the coming log, this needs to be separated=
 from init text. So <br>
making it aligned is a must.=C2=A0</blockquote><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.init.data : AT(ADDR(.init.data) - LOAD_OFFS=
ET) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_DATA<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt; base-commit: 1398820fee515873379809a6415930ad0764b2f6<br>
&gt; <br>
<br>
Christophe<br></blockquote><div>Thanks for your time,</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Ariel Marcovitch</div></div></div>

--000000000000793dc605b6c30dd1--
