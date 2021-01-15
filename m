Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C65E82F8FBE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 23:40:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DJCfr0fHkzDsmP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jan 2021 09:40:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=carlosedp.com
 (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=me@carlosedp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=carlosedp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=carlosedp-com.20150623.gappssmtp.com
 header.i=@carlosedp-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=hLXTFvx6; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHN3Q0SBdzDsgW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 00:54:45 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id j20so8554783otq.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 05:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=carlosedp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HMhTJwlAQMeEGqgpDfVfyFv21oibbJCUoIgV8jCTZUo=;
 b=hLXTFvx6BlQ0uRW6QdiM+DHf5iJV7M4OciuGTDqihnH9LRLVaaf2VVEcZ62oHsbucQ
 k/gYQl0yW437McslPkxLo91PGyPzMGbwWwoRl4bitSnK5MKyfHt2G4dC0O+FlUwS+ZYz
 /1/0W4zrnoA/AB4Ate9MuySkplO6YdQOfOcMYr0+pcuf6ZcDIPnCM49XyNEeZemln1rC
 Lf/X6Rq2dmry0GX9Qb3LZFdVlPRUhLLkyGPXAr3iB07trBOYQJB168ARvJEgOlKrXdGL
 o6Rv5AsYsdhFkJFV6McjZZNX2fYZfkWhe0afulGKzneDlI3bNr1dRlP8IBN3e/u1psxE
 0hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HMhTJwlAQMeEGqgpDfVfyFv21oibbJCUoIgV8jCTZUo=;
 b=WnSmYPU1VoxqQ8QykSo+9jCnv9c8Tk0DvRYl7/Mmga1IHTZoDqStB7nwK+GQExDAhs
 sqS6JwJXTUGR8P5YWLeXugq4anDdm2Lg48JsxV1/diA4rcjzZPuOJxz1JrIvRX6OAWzU
 e5961fFYVhMiaDXJ6dfhd1SO78mQNtTgM1nIQv7G6ty+OdW2V7ZhWCOFM1JC4qPnkA4Z
 S9lKpRSS4S5TnulBBlM9fRdswLM4+58poUz98KSUPSHJQTOc/iaO7cMsD7i3J8Iv+VCb
 PMtOrFkt3x9RKLHf6spkQZcuQ8AiRSfrnAed4RE1+SLYiqL1uzpjhJg3XuTHPENUei0D
 3NpQ==
X-Gm-Message-State: AOAM531XEDvd8sl9yCakqj+FzkaZu9EC/s1penj7G/zgQEZApciKud5k
 m5G8guI21OrsuYL3qNwUR+E610nV12nqq0No
X-Google-Smtp-Source: ABdhPJzrDPrD5ADjlDJ3M8PApG3MF/WxtHcRX8yrf2EboEozVpdcTKMLuQ71LLMnzryW7HYpe1P+hQ==
X-Received: by 2002:a05:6830:2376:: with SMTP id
 r22mr8343580oth.274.1610718880865; 
 Fri, 15 Jan 2021 05:54:40 -0800 (PST)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com.
 [209.85.210.47])
 by smtp.gmail.com with ESMTPSA id q1sm1776607oij.9.2021.01.15.05.54.39
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 05:54:39 -0800 (PST)
Received: by mail-ot1-f47.google.com with SMTP id q25so8546256otn.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 05:54:39 -0800 (PST)
X-Received: by 2002:a05:6830:578:: with SMTP id
 f24mr7959362otc.36.1610718878800; 
 Fri, 15 Jan 2021 05:54:38 -0800 (PST)
MIME-Version: 1.0
References: <7171078.EvYhyI6sBW@sheen>
 <2b234a7e-e9f6-d02b-a20f-74c0cc1df8d3@csgroup.eu>
 <20201201055228.GA2213889@us.ibm.com>
 <OF66F86744.2ADAED9E-ON85258631.0047CAC6-85258631.0048F494@notes.na.collabserv.com>
 <7176054.EvYhyI6sBW@sheen>
In-Reply-To: <7176054.EvYhyI6sBW@sheen>
From: Carlos Eduardo de Paula <me@carlosedp.com>
Date: Fri, 15 Jan 2021 10:54:27 -0300
X-Gmail-Original-Message-ID: <CADnnUqf591W4CzHHJVmCnypw9tqo-bi46tJvzSVGxr0t+mwm4A@mail.gmail.com>
Message-ID: <CADnnUqf591W4CzHHJVmCnypw9tqo-bi46tJvzSVGxr0t+mwm4A@mail.gmail.com>
Subject: Re: CONFIG_PPC_VAS depends on 64k pages...?
To: Will Springer <skirmisher@protonmail.com>
Content-Type: multipart/alternative; boundary="0000000000009aa01005b8f0b69c"
X-Mailman-Approved-At: Sun, 17 Jan 2021 09:38:28 +1100
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
Cc: Tulio Magno Quites Machado Filho <tulioqm@br.ibm.com>, daniel@octaforge.org,
 haren@linux.ibm.com, Bulent Abali <abali@us.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Raphael M Zinsly <rzinsly@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000009aa01005b8f0b69c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all, any news on this matter?

Can a patch be submitted for evaluation?

Thanks,
Carlos

On Wed, Dec 2, 2020 at 4:19 AM Will Springer <skirmisher@protonmail.com>
wrote:

> On Tuesday, December 1, 2020 5:16:51 AM PST Bulent Abali wrote:
> > I don't know anything about VAS page size requirements in the kernel.  =
I
> > checked the user compression library and saw that we do a sysconf to
> > get the page size; so the library should be immune to page size by
> > design. But it wouldn't surprise me if a 64KB constant is inadvertently
> > hardcoded somewhere else in the library.  Giving heads up to Tulio and
> > Raphael who are owners of the github repo.
> >
> > https://github.com/libnxz/power-gzip/blob/master/lib/nx_zlib.c#L922
> >
> > If we got this wrong in the library it might manifest itself as an erro=
r
> > message of the sort "excessive page faults".  The library must touch
> > pages ahead to make them present in the memory; occasional page faults
> > is acceptable. It will retry.
>
> Hm, good to know. As I said I haven't noticed any problems so far, over a
> few different days of testing. My change is now in the Void Linux kernel
> package, and is working for others as well (including the Void maintainer
> Daniel/q66 who I CC'd initially).
>
> >
> > Bulent
> >
> >
> >
> >
> > From:        "Sukadev Bhattiprolu" <sukadev@linux.ibm.com>
> > To:        "Christophe Leroy" <christophe.leroy@csgroup.eu>
> > Cc:        "Will Springer" <skirmisher@protonmail.com>,
> > linuxppc-dev@lists.ozlabs.org, daniel@octaforge.org, Bulent
> > Abali/Watson/IBM@IBM, haren@linux.ibm.com Date:        12/01/2020 12:53
> > AM
> > Subject:        Re: CONFIG_PPC_VAS depends on 64k pages...?
> >
> > Christophe Leroy [christophe.leroy@csgroup.eu] wrote:
> > > Hi,
> > >
> > > Le 19/11/2020 =C3=A0 11:58, Will Springer a =C3=A9crit :
> > > > I learned about the POWER9 gzip accelerator a few months ago when
> > > > the
> > > > support hit upstream Linux 5.8. However, for some reason the Kconfi=
g
> > > > dictates that VAS depends on a 64k page size, which is problematic
> > > > as I
> > > > run Void Linux, which uses a 4k-page kernel.
> > > >
> > > > Some early poking by others indicated there wasn't an obvious page
> > > > size
> > > > dependency in the code, and suggested I try modifying the config to
> > > > switch it on. I did so, but was stopped by a minor complaint of an
> > > > "unexpected DT configuration" by the VAS code. I wasn't equipped to
> > > > figure out exactly what this meant, even after finding the
> > > > offending condition, so after writing a very drawn-out forum post
> > > > asking for help, I dropped the subject.
> > > >
> > > > Fast forward to today, when I was reminded of the whole thing again=
,
> > > > and decided to debug a bit further. Apparently the VAS platform
> > > > device (derived from the DT node) has 5 resources on my 4k kernel,
> > > > instead of 4 (which evidently works for others who have had success
> > > > on 64k kernels). I have no idea what this means in practice (I
> > > > don't know how to introspect it), but after making a tiny patch[1],
> > > > everything came up smoothly and I was doing blazing-fast gzip
> > > > (de)compression in no time.
> > > >
> > > > Everything seems to work fine on 4k pages. So, what's up? Are there
> > > > pitfalls lurking around that I've yet to stumble over? More
> > > > reasonably,
> > > > I'm curious as to why the feature supposedly depends on 64k pages,
> > > > or if there's anything else I should be concerned about.
> >
> > Will,
> >
> > The reason I put in that config check is because we were only able to
> > test 64K pages at that point.
> >
> > It is interesting that it is working for you. Following code in skiboot
> > https://github.com/open-power/skiboot/blob/master/hw/vas.cshould
> > restrict it to 64K pages. IIRC there is also a corresponding change in
> > some NX registers that should also be configured to allow 4K pages.
>
> Huh, that is interesting indeed. As far as the kernel code, the only thin=
g
> specific to 64k pages I could find was in [1], where
> VAS_XLATE_LPCR_PAGE_SIZE is set. There is also NX_PAGE_SIZE in drivers/
> crypto/nx/nx.h, which is set to 4096, but I don't know if that's related
> to
> kernel page size at all. Without a better idea of the code base, I didn't
> examine more thoroughly.
>
> [1]:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arc=
h/powerpc/platforms/powernv/vas-window.c#n293
>
> >                 static int init_north_ctl(struct proc_chip *chip)
> >                 {
> >                                  uint64_t val =3D 0ULL;
> >
> >                                  val =3D SETFIELD(VAS_64K_MODE_MASK, va=
l,
> > true); val =3D SETFIELD(VAS_ACCEPT_PASTE_MASK, val, true); val =3D
> > SETFIELD(VAS_ENABLE_WC_MMIO_BAR, val, true); val =3D
> > SETFIELD(VAS_ENABLE_UWC_MMIO_BAR, val, true); val =3D
> > SETFIELD(VAS_ENABLE_RMA_MMIO_BAR, val, true);
> >
> >                                  return vas_scom_write(chip,
> > VAS_MISC_N_CTL, val); }
> >
> > I am copying Bulent Albali and Haren Myneni who have been working with
> > VAS/NX for their thoughts/experience.
>
> Thanks for this and for your input, by the way.
>
> >
> > > Maybe ask Sukadev who did the implementation and is maintaining it ?
> > >
> > > > I do have to say I'm quite satisfied with the results of the NX
> > > > accelerator, though. Being able to shuffle data to a RaptorCS box
> > > > over gigE and get compressed data back faster than most software
> > > > gzip could ever hope to achieve is no small feat, let alone the
> > > > instantaneous results locally.> >
> > > > :)
> > > >
> > > > Cheers,
> > > > Will Springer [she/her]
> > > >
> > > > [1]:
> > > >
> https://github.com/Skirmisher/void-packages/blob/vas-4k-pages/srcpkgs/lin=
ux5.9/patches/ppc-vas-on-4k.patch
> > > Christophe
>
> Will [she/her]
>
>
>
>
>

--=20
________________________________________
Carlos Eduardo de Paula
me@carlosedp.com
http://carlosedp.com
https://twitter.com/carlosedp
https://www.linkedin.com/in/carlosedp/
________________________________________

--0000000000009aa01005b8f0b69c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:trebuche=
t ms,sans-serif;font-size:small">Hi all, any news on this matter?</div><div=
 class=3D"gmail_default" style=3D"font-family:trebuchet ms,sans-serif;font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-family:tre=
buchet ms,sans-serif;font-size:small">Can a patch be submitted for evaluati=
on?<br></div><div class=3D"gmail_default" style=3D"font-family:trebuchet ms=
,sans-serif;font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-family:trebuchet ms,sans-serif;font-size:small">Thanks,</div><div =
class=3D"gmail_default" style=3D"font-family:trebuchet ms,sans-serif;font-s=
ize:small">Carlos<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 4:19 AM Will Springer &lt=
;<a href=3D"mailto:skirmisher@protonmail.com">skirmisher@protonmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
uesday, December 1, 2020 5:16:51 AM PST Bulent Abali wrote:<br>
&gt; I don&#39;t know anything about VAS page size requirements in the kern=
el.=C2=A0 I<br>
&gt; checked the user compression library and saw that we do a sysconf to<b=
r>
&gt; get the page size; so the library should be immune to page size by<br>
&gt; design. But it wouldn&#39;t surprise me if a 64KB constant is inadvert=
ently<br>
&gt; hardcoded somewhere else in the library.=C2=A0 Giving heads up to Tuli=
o and<br>
&gt; Raphael who are owners of the github repo.<br>
&gt; <br>
&gt; <a href=3D"https://github.com/libnxz/power-gzip/blob/master/lib/nx_zli=
b.c#L922" rel=3D"noreferrer" target=3D"_blank">https://github.com/libnxz/po=
wer-gzip/blob/master/lib/nx_zlib.c#L922</a><br>
&gt; <br>
&gt; If we got this wrong in the library it might manifest itself as an err=
or<br>
&gt; message of the sort &quot;excessive page faults&quot;.=C2=A0 The libra=
ry must touch<br>
&gt; pages ahead to make them present in the memory; occasional page faults=
<br>
&gt; is acceptable. It will retry.<br>
<br>
Hm, good to know. As I said I haven&#39;t noticed any problems so far, over=
 a <br>
few different days of testing. My change is now in the Void Linux kernel <b=
r>
package, and is working for others as well (including the Void maintainer <=
br>
Daniel/q66 who I CC&#39;d initially).<br>
<br>
&gt; <br>
&gt; Bulent<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; From:=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Sukadev Bhattiprolu&quot; &lt;<=
a href=3D"mailto:sukadev@linux.ibm.com" target=3D"_blank">sukadev@linux.ibm=
.com</a>&gt;<br>
&gt; To:=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Christophe Leroy&quot; &lt;<a hre=
f=3D"mailto:christophe.leroy@csgroup.eu" target=3D"_blank">christophe.leroy=
@csgroup.eu</a>&gt;<br>
&gt; Cc:=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Will Springer&quot; &lt;<a href=
=3D"mailto:skirmisher@protonmail.com" target=3D"_blank">skirmisher@protonma=
il.com</a>&gt;,<br>
&gt; <a href=3D"mailto:linuxppc-dev@lists.ozlabs.org" target=3D"_blank">lin=
uxppc-dev@lists.ozlabs.org</a>, <a href=3D"mailto:daniel@octaforge.org" tar=
get=3D"_blank">daniel@octaforge.org</a>, Bulent<br>
&gt; Abali/Watson/IBM@IBM, <a href=3D"mailto:haren@linux.ibm.com" target=3D=
"_blank">haren@linux.ibm.com</a> Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 12/01/202=
0 12:53<br>
&gt; AM<br>
&gt; Subject:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Re: CONFIG_PPC_VAS depends on 64k =
pages...?<br>
&gt; <br>
&gt; Christophe Leroy [<a href=3D"mailto:christophe.leroy@csgroup.eu" targe=
t=3D"_blank">christophe.leroy@csgroup.eu</a>] wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt; <br>
&gt; &gt; Le 19/11/2020 =C3=A0 11:58, Will Springer a =C3=A9crit :<br>
&gt; &gt; &gt; I learned about the POWER9 gzip accelerator a few months ago=
 when<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; support hit upstream Linux 5.8. However, for some reason the=
 Kconfig<br>
&gt; &gt; &gt; dictates that VAS depends on a 64k page size, which is probl=
ematic<br>
&gt; &gt; &gt; as I<br>
&gt; &gt; &gt; run Void Linux, which uses a 4k-page kernel.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Some early poking by others indicated there wasn&#39;t an ob=
vious page<br>
&gt; &gt; &gt; size<br>
&gt; &gt; &gt; dependency in the code, and suggested I try modifying the co=
nfig to<br>
&gt; &gt; &gt; switch it on. I did so, but was stopped by a minor complaint=
 of an<br>
&gt; &gt; &gt; &quot;unexpected DT configuration&quot; by the VAS code. I w=
asn&#39;t equipped to<br>
&gt; &gt; &gt; figure out exactly what this meant, even after finding the<b=
r>
&gt; &gt; &gt; offending condition, so after writing a very drawn-out forum=
 post<br>
&gt; &gt; &gt; asking for help, I dropped the subject.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Fast forward to today, when I was reminded of the whole thin=
g again,<br>
&gt; &gt; &gt; and decided to debug a bit further. Apparently the VAS platf=
orm<br>
&gt; &gt; &gt; device (derived from the DT node) has 5 resources on my 4k k=
ernel,<br>
&gt; &gt; &gt; instead of 4 (which evidently works for others who have had =
success<br>
&gt; &gt; &gt; on 64k kernels). I have no idea what this means in practice =
(I<br>
&gt; &gt; &gt; don&#39;t know how to introspect it), but after making a tin=
y patch[1],<br>
&gt; &gt; &gt; everything came up smoothly and I was doing blazing-fast gzi=
p<br>
&gt; &gt; &gt; (de)compression in no time.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Everything seems to work fine on 4k pages. So, what&#39;s up=
? Are there<br>
&gt; &gt; &gt; pitfalls lurking around that I&#39;ve yet to stumble over? M=
ore<br>
&gt; &gt; &gt; reasonably,<br>
&gt; &gt; &gt; I&#39;m curious as to why the feature supposedly depends on =
64k pages,<br>
&gt; &gt; &gt; or if there&#39;s anything else I should be concerned about.=
<br>
&gt; <br>
&gt; Will,<br>
&gt; <br>
&gt; The reason I put in that config check is because we were only able to<=
br>
&gt; test 64K pages at that point.<br>
&gt; <br>
&gt; It is interesting that it is working for you. Following code in skiboo=
t<br>
&gt; <a href=3D"https://github.com/open-power/skiboot/blob/master/hw/vas.cs=
hould" rel=3D"noreferrer" target=3D"_blank">https://github.com/open-power/s=
kiboot/blob/master/hw/vas.cshould</a><br>
&gt; restrict it to 64K pages. IIRC there is also a corresponding change in=
<br>
&gt; some NX registers that should also be configured to allow 4K pages. <b=
r>
<br>
Huh, that is interesting indeed. As far as the kernel code, the only thing =
<br>
specific to 64k pages I could find was in [1], where <br>
VAS_XLATE_LPCR_PAGE_SIZE is set. There is also NX_PAGE_SIZE in drivers/<br>
crypto/nx/nx.h, which is set to 4096, but I don&#39;t know if that&#39;s re=
lated to <br>
kernel page size at all. Without a better idea of the code base, I didn&#39=
;t<br>
examine more thoroughly.<br>
<br>
[1]: <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linu=
x.git/tree/arch/powerpc/platforms/powernv/vas-window.c#n293" rel=3D"norefer=
rer" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/stab=
le/linux.git/tree/arch/powerpc/platforms/powernv/vas-window.c#n293</a><br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static in=
t init_north_ctl(struct proc_chip *chip)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t val =3D 0ULL;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D SETFIELD(VAS_64K_M=
ODE_MASK, val,<br>
&gt; true); val =3D SETFIELD(VAS_ACCEPT_PASTE_MASK, val, true); val =3D<br>
&gt; SETFIELD(VAS_ENABLE_WC_MMIO_BAR, val, true); val =3D<br>
&gt; SETFIELD(VAS_ENABLE_UWC_MMIO_BAR, val, true); val =3D<br>
&gt; SETFIELD(VAS_ENABLE_RMA_MMIO_BAR, val, true);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return vas_scom_write(chip=
,<br>
&gt; VAS_MISC_N_CTL, val); }<br>
&gt; <br>
&gt; I am copying Bulent Albali and Haren Myneni who have been working with=
<br>
&gt; VAS/NX for their thoughts/experience.<br>
<br>
Thanks for this and for your input, by the way.<br>
<br>
&gt; <br>
&gt; &gt; Maybe ask Sukadev who did the implementation and is maintaining i=
t ?<br>
&gt; &gt; <br>
&gt; &gt; &gt; I do have to say I&#39;m quite satisfied with the results of=
 the NX<br>
&gt; &gt; &gt; accelerator, though. Being able to shuffle data to a RaptorC=
S box<br>
&gt; &gt; &gt; over gigE and get compressed data back faster than most soft=
ware<br>
&gt; &gt; &gt; gzip could ever hope to achieve is no small feat, let alone =
the<br>
&gt; &gt; &gt; instantaneous results locally.&gt; &gt; <br>
&gt; &gt; &gt; :)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt; Will Springer [she/her]<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; [1]:<br>
&gt; &gt; &gt; <a href=3D"https://github.com/Skirmisher/void-packages/blob/=
vas-4k-pages/srcpkgs/linux5.9/patches/ppc-vas-on-4k.patch" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/Skirmisher/void-packages/blob/vas-4=
k-pages/srcpkgs/linux5.9/patches/ppc-vas-on-4k.patch</a><br>
&gt; &gt; Christophe<br>
<br>
Will [she/her]<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">________________________________________<br>Carlos Eduardo =
de Paula<br><a href=3D"mailto:me@carlosedp.com" target=3D"_blank">me@carlos=
edp.com</a><br><a href=3D"http://carlosedp.com" target=3D"_blank">http://ca=
rlosedp.com</a><br><a href=3D"https://twitter.com/carlosedp" target=3D"_bla=
nk">https://twitter.com/carlosedp</a><br><a href=3D"https://www.linkedin.co=
m/in/carlosedp/" target=3D"_blank">https://www.linkedin.com/in/carlosedp/</=
a><br>________________________________________</div>

--0000000000009aa01005b8f0b69c--
