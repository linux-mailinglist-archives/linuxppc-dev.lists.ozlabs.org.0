Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6CE2CAE14
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 22:12:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClvvW0csmzDqD9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 08:12:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=carlosedp.com
 (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com;
 envelope-from=me@carlosedp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=carlosedp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=carlosedp-com.20150623.gappssmtp.com
 header.i=@carlosedp-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=emFKREiw; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClvlK4bChzDqcX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 08:05:46 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id l4so710036oii.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 13:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=carlosedp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K8O1M2L3sDkrVCXKW+JdqBQVnuUmsP+OCruMnh2bV5E=;
 b=emFKREiwdx/NcVnCXonRvpEdXStnEMgneI30VbZJ5z1MmpydY7FeIVuJezS+TsKcnf
 jU3nglVkbIx3IJBgXnwVRmOPdamFffYFWU/mSYR8q+vf8RfwW/yFZ8ECTejRmOXp6CuC
 3Kd8Jj0WtpaI9K17LvmDLPbgoe7hNROxL3g+eGYHs3aoiOudh/o7bXuNsp39RSZpgANA
 GCPFfkiCn/QHki43ogBfReTw2Ji0qWjtFhkKYUEYRjv7M6X5op2zNt3mhZCbA0S2B3Ec
 xKA2DsirOXWI7PS0WMIB3wibFroBDZt+koB+cWk6Q8IFszbpKtUQtnTUjudahd2uJQx6
 +Yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K8O1M2L3sDkrVCXKW+JdqBQVnuUmsP+OCruMnh2bV5E=;
 b=aRdpv/xpYvX4fV6lQ1aAqDS0wxjFfBw4isueBFozCEZ7yL4UTd+ojP/uAl09SuW91D
 xYi5xvqkuyGePKzPCp9jzkbxelriHqQYI1wSRMA3LfN6j+nR3BQ257z+hb/SpyRZrurO
 sjLWsIBmup5/JCaYTc4Nje/kY5+qf2wdLQ1+Svcd7OuI4mdO/NLQdKYhr7wu440vSyB9
 cIZ2vQjGXJ0YI9aqCkil9Zt+E+wGLyFQZoGxzU5dAUt6ml1SSprHDY/OtNb2MmAot0S5
 hhud4DBPT43QwvpxOZljeszH5GO9thhrUvRuzmG/c4CyEkn/9LINOTNEkuxgq+4TcahZ
 1w1A==
X-Gm-Message-State: AOAM533EPpj5sm8rBFjN7fXsxaCnCuor95xM+LAL8ZzT5bovvfpLbDnb
 XeewHx5eVJt1zpbF1mj91ARzR3Uspde3GvTA
X-Google-Smtp-Source: ABdhPJyGJ8aYXkqW7wGmkNT8MBMiiqN3ec+unHfBOtlhQlJEk3cTd0A1TkXtj7ruOLW4YaCi4CLzvQ==
X-Received: by 2002:aca:5286:: with SMTP id g128mr3080526oib.91.1606856742886; 
 Tue, 01 Dec 2020 13:05:42 -0800 (PST)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
 [209.85.210.52])
 by smtp.gmail.com with ESMTPSA id e47sm223534ote.50.2020.12.01.13.05.41
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 13:05:42 -0800 (PST)
Received: by mail-ot1-f52.google.com with SMTP id h19so3101291otr.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 13:05:41 -0800 (PST)
X-Received: by 2002:a9d:7c8c:: with SMTP id q12mr3268639otn.266.1606856740334; 
 Tue, 01 Dec 2020 13:05:40 -0800 (PST)
MIME-Version: 1.0
References: <7171078.EvYhyI6sBW@sheen>
 <2b234a7e-e9f6-d02b-a20f-74c0cc1df8d3@csgroup.eu>
 <20201201055228.GA2213889@us.ibm.com>
In-Reply-To: <20201201055228.GA2213889@us.ibm.com>
From: Carlos Eduardo de Paula <me@carlosedp.com>
Date: Tue, 1 Dec 2020 18:05:29 -0300
X-Gmail-Original-Message-ID: <CADnnUqdz8uUfW_fMBwhGEYyZZwz=s4iTuAVGCJVsicxXiNS6PQ@mail.gmail.com>
Message-ID: <CADnnUqdz8uUfW_fMBwhGEYyZZwz=s4iTuAVGCJVsicxXiNS6PQ@mail.gmail.com>
Subject: Re: CONFIG_PPC_VAS depends on 64k pages...?
To: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000036732005b56d7d63"
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:09:07 +1100
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
Cc: daniel@octaforge.org, haren@linux.ibm.com,
 Will Springer <skirmisher@protonmail.com>, abali@us.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000036732005b56d7d63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 1, 2020 at 2:54 AM Sukadev Bhattiprolu <sukadev@linux.ibm.com>
wrote:

>
> Christophe Leroy [christophe.leroy@csgroup.eu] wrote:
> > Hi,
> >
> > Le 19/11/2020 =C3=A0 11:58, Will Springer a =C3=A9crit :
> > > I learned about the POWER9 gzip accelerator a few months ago when the
> > > support hit upstream Linux 5.8. However, for some reason the Kconfig
> > > dictates that VAS depends on a 64k page size, which is problematic as=
 I
> > > run Void Linux, which uses a 4k-page kernel.
> > >
> > > Some early poking by others indicated there wasn't an obvious page si=
ze
> > > dependency in the code, and suggested I try modifying the config to
> switch
> > > it on. I did so, but was stopped by a minor complaint of an
> "unexpected DT
> > > configuration" by the VAS code. I wasn't equipped to figure out
> exactly what
> > > this meant, even after finding the offending condition, so after
> writing a
> > > very drawn-out forum post asking for help, I dropped the subject.
> > >
> > > Fast forward to today, when I was reminded of the whole thing again,
> and
> > > decided to debug a bit further. Apparently the VAS platform device
> > > (derived from the DT node) has 5 resources on my 4k kernel, instead o=
f
> 4
> > > (which evidently works for others who have had success on 64k
> kernels). I
> > > have no idea what this means in practice (I don't know how to
> introspect
> > > it), but after making a tiny patch[1], everything came up smoothly an=
d
> I
> > > was doing blazing-fast gzip (de)compression in no time.
> > >
> > > Everything seems to work fine on 4k pages. So, what's up? Are there
> > > pitfalls lurking around that I've yet to stumble over? More reasonabl=
y,
> > > I'm curious as to why the feature supposedly depends on 64k pages, or
> if
> > > there's anything else I should be concerned about.
>
> Will,
>
> The reason I put in that config check is because we were only able to
> test 64K pages at that point.
>
> It is interesting that it is working for you. Following code in skiboot
> https://github.com/open-power/skiboot/blob/master/hw/vas.c should restric=
t
> it to 64K pages. IIRC there is also a corresponding change in some NX
> registers that should also be configured to allow 4K pages.
>
>
>         static int init_north_ctl(struct proc_chip *chip)
>         {
>                 uint64_t val =3D 0ULL;
>
>                 val =3D SETFIELD(VAS_64K_MODE_MASK, val, true);
>                 val =3D SETFIELD(VAS_ACCEPT_PASTE_MASK, val, true);
>                 val =3D SETFIELD(VAS_ENABLE_WC_MMIO_BAR, val, true);
>                 val =3D SETFIELD(VAS_ENABLE_UWC_MMIO_BAR, val, true);
>                 val =3D SETFIELD(VAS_ENABLE_RMA_MMIO_BAR, val, true);
>
>                 return vas_scom_write(chip, VAS_MISC_N_CTL, val);
>         }
>
> I am copying Bulent Albali and Haren Myneni who have been working with
> VAS/NX for their thoughts/experience.
>
> > >
> >
> > Maybe ask Sukadev who did the implementation and is maintaining it ?
> >
> > > I do have to say I'm quite satisfied with the results of the NX
> > > accelerator, though. Being able to shuffle data to a RaptorCS box ove=
r
> gigE
> > > and get compressed data back faster than most software gzip could eve=
r
> > > hope to achieve is no small feat, let alone the instantaneous results
> locally.
> > > :)
> > >
> > > Cheers,
> > > Will Springer [she/her]
> > >
> > > [1]:
> https://github.com/Skirmisher/void-packages/blob/vas-4k-pages/srcpkgs/lin=
ux5.9/patches/ppc-vas-on-4k.patch
> > >
> >
> >
> > Christophe
>

Hi all, I'd like to report that with Will's patch, I'm using NX-Gzip
perfectly on Linux 5.9.10 built with 4K pages and no changes on firmware in
a Raptor Computing Blackbird workstation.

I'm using Debian 10 distro.

Ref. https://twitter.com/carlosedp/status/1328424799216021511

Carlos


--=20
________________________________________
Carlos Eduardo de Paula
me@carlosedp.com
http://carlosedp.com
https://twitter.com/carlosedp
https://www.linkedin.com/in/carlosedp/
________________________________________

--00000000000036732005b56d7d63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:trebuchet ms,sans-serif;font-size:small"><br></div></div><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 1, 2020=
 at 2:54 AM Sukadev Bhattiprolu &lt;<a href=3D"mailto:sukadev@linux.ibm.com=
">sukadev@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><br>
Christophe Leroy [<a href=3D"mailto:christophe.leroy@csgroup.eu" target=3D"=
_blank">christophe.leroy@csgroup.eu</a>] wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Le 19/11/2020 =C3=A0 11:58, Will Springer a =C3=A9crit=C2=A0:<br>
&gt; &gt; I learned about the POWER9 gzip accelerator a few months ago when=
 the<br>
&gt; &gt; support hit upstream Linux 5.8. However, for some reason the Kcon=
fig<br>
&gt; &gt; dictates that VAS depends on a 64k page size, which is problemati=
c as I<br>
&gt; &gt; run Void Linux, which uses a 4k-page kernel.<br>
&gt; &gt; <br>
&gt; &gt; Some early poking by others indicated there wasn&#39;t an obvious=
 page size<br>
&gt; &gt; dependency in the code, and suggested I try modifying the config =
to switch<br>
&gt; &gt; it on. I did so, but was stopped by a minor complaint of an &quot=
;unexpected DT<br>
&gt; &gt; configuration&quot; by the VAS code. I wasn&#39;t equipped to fig=
ure out exactly what<br>
&gt; &gt; this meant, even after finding the offending condition, so after =
writing a<br>
&gt; &gt; very drawn-out forum post asking for help, I dropped the subject.=
<br>
&gt; &gt; <br>
&gt; &gt; Fast forward to today, when I was reminded of the whole thing aga=
in, and<br>
&gt; &gt; decided to debug a bit further. Apparently the VAS platform devic=
e<br>
&gt; &gt; (derived from the DT node) has 5 resources on my 4k kernel, inste=
ad of 4<br>
&gt; &gt; (which evidently works for others who have had success on 64k ker=
nels). I<br>
&gt; &gt; have no idea what this means in practice (I don&#39;t know how to=
 introspect<br>
&gt; &gt; it), but after making a tiny patch[1], everything came up smoothl=
y and I<br>
&gt; &gt; was doing blazing-fast gzip (de)compression in no time.<br>
&gt; &gt; <br>
&gt; &gt; Everything seems to work fine on 4k pages. So, what&#39;s up? Are=
 there<br>
&gt; &gt; pitfalls lurking around that I&#39;ve yet to stumble over? More r=
easonably,<br>
&gt; &gt; I&#39;m curious as to why the feature supposedly depends on 64k p=
ages, or if<br>
&gt; &gt; there&#39;s anything else I should be concerned about.<br>
<br>
Will,<br>
<br>
The reason I put in that config check is because we were only able to<br>
test 64K pages at that point.<br>
<br>
It is interesting that it is working for you. Following code in skiboot<br>
<a href=3D"https://github.com/open-power/skiboot/blob/master/hw/vas.c" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/open-power/skiboot/blo=
b/master/hw/vas.c</a> should restrict<br>
it to 64K pages. IIRC there is also a corresponding change in some NX <br>
registers that should also be configured to allow 4K pages.<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 static int init_north_ctl(struct proc_chip *chi=
p)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t val =3D 0U=
LL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D SETFIELD(VA=
S_64K_MODE_MASK, val, true);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D SETFIELD(VA=
S_ACCEPT_PASTE_MASK, val, true);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D SETFIELD(VA=
S_ENABLE_WC_MMIO_BAR, val, true);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D SETFIELD(VA=
S_ENABLE_UWC_MMIO_BAR, val, true);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D SETFIELD(VA=
S_ENABLE_RMA_MMIO_BAR, val, true);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return vas_scom_wri=
te(chip, VAS_MISC_N_CTL, val);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
I am copying Bulent Albali and Haren Myneni who have been working with<br>
VAS/NX for their thoughts/experience.<br>
<br>
&gt; &gt; <br>
&gt; <br>
&gt; Maybe ask Sukadev who did the implementation and is maintaining it ?<b=
r>
&gt; <br>
&gt; &gt; I do have to say I&#39;m quite satisfied with the results of the =
NX<br>
&gt; &gt; accelerator, though. Being able to shuffle data to a RaptorCS box=
 over gigE<br>
&gt; &gt; and get compressed data back faster than most software gzip could=
 ever<br>
&gt; &gt; hope to achieve is no small feat, let alone the instantaneous res=
ults locally.<br>
&gt; &gt; :)<br>
&gt; &gt; <br>
&gt; &gt; Cheers,<br>
&gt; &gt; Will Springer [she/her]<br>
&gt; &gt; <br>
&gt; &gt; [1]: <a href=3D"https://github.com/Skirmisher/void-packages/blob/=
vas-4k-pages/srcpkgs/linux5.9/patches/ppc-vas-on-4k.patch" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/Skirmisher/void-packages/blob/vas-4=
k-pages/srcpkgs/linux5.9/patches/ppc-vas-on-4k.patch</a><br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Christophe<br>
</blockquote></div><div><br></div><div><div style=3D"font-family:trebuchet =
ms,sans-serif;font-size:small" class=3D"gmail_default">Hi all, I&#39;d like=
 to report that with Will&#39;s patch, I&#39;m using NX-Gzip perfectly on L=
inux 5.9.10 built with 4K pages and no changes on firmware in a Raptor Comp=
uting Blackbird workstation.</div><div style=3D"font-family:trebuchet ms,sa=
ns-serif;font-size:small" class=3D"gmail_default"><br></div><div style=3D"f=
ont-family:trebuchet ms,sans-serif;font-size:small" class=3D"gmail_default"=
>I&#39;m using Debian 10 distro.</div><div style=3D"font-family:trebuchet m=
s,sans-serif;font-size:small" class=3D"gmail_default"><br></div><div style=
=3D"font-family:trebuchet ms,sans-serif;font-size:small" class=3D"gmail_def=
ault">Ref. <a href=3D"https://twitter.com/carlosedp/status/1328424799216021=
511">https://twitter.com/carlosedp/status/1328424799216021511</a><br></div>=
<div style=3D"font-family:trebuchet ms,sans-serif;font-size:small" class=3D=
"gmail_default"><br></div><div style=3D"font-family:trebuchet ms,sans-serif=
;font-size:small" class=3D"gmail_default">Carlos<br></div><br></div><br>-- =
<br><div dir=3D"ltr" class=3D"gmail_signature">____________________________=
____________<br>Carlos Eduardo de Paula<br><a href=3D"mailto:me@carlosedp.c=
om" target=3D"_blank">me@carlosedp.com</a><br><a href=3D"http://carlosedp.c=
om" target=3D"_blank">http://carlosedp.com</a><br><a href=3D"https://twitte=
r.com/carlosedp" target=3D"_blank">https://twitter.com/carlosedp</a><br><a =
href=3D"https://www.linkedin.com/in/carlosedp/" target=3D"_blank">https://w=
ww.linkedin.com/in/carlosedp/</a><br>______________________________________=
__</div></div>

--00000000000036732005b56d7d63--
