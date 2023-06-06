Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BAA724E46
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 22:42:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbMqg3bV8z3fl1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 06:42:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=X3+kl1sT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=dje.gcc@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=X3+kl1sT;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbHdT44K2z3bnP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 03:33:47 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-977d0ee1736so449423866b.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686072823; x=1688664823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6GEO8lpvX/2tJUWSIe8jA/199X71Q33YZFyKiSiCM9U=;
        b=X3+kl1sTvnPHLjZNMU4XVJfob3un7xQfeBw5gHTPfHrw0WXO5dgCUJwTRc85o3rV1k
         UAraCR4wbQWakJSa6NtXQD5fnTfPJRCSmBwDH6F7UtQY1vei167xjBkfGr+nKZsqawQv
         QApxarwU1iUpwlMB+jqY8tZT24Xs7umMChBcb9zBLH67u/kcqfqxL7Qeoh1QRnRxPgxn
         a1K3C8EIQY5rXU7ZdZ55bGh5IfhLGbP6Hiaj/YgJm2hQgWD4ZtpO2NBc25mLsOl1sfu7
         OiqZgifKExjJRg7BO55Gp5AukHtf7CLKtt4Fzt49X5eE5oEZVQ6jkO0bJ+U+wrixs5eW
         Nzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686072823; x=1688664823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6GEO8lpvX/2tJUWSIe8jA/199X71Q33YZFyKiSiCM9U=;
        b=IRXbNM29+UZh/qJEJjRCPuPLWaJzvWphAASIL69X9HoanTQXtdxCrIZdbxGHI/JHFl
         GsLLdiqoz/KeW3cup+OMaLJiTo8UlrSchS8t2G8TLBp1giMDiFlXyXV7jv8TSHF41p5d
         E7i+voQBjsqFIHoQWdTlNGsXQpeycO/y7JkmgOqkv0DfG0DcUxTY5tmXOsXpWogM/qjo
         EVnFGNj7AqisAz8gTVOdCE5qyTpG2gWwag/pEU2BXxTJ6u0R5CW/2umWrWTVI503Eer6
         QY1mDl60Xhsduw7KzHVzfwePPzS+HSh3vNoNt7D84lJK8/AZ4WIa6wV3+v6DhSkWzE2K
         R3pg==
X-Gm-Message-State: AC+VfDwQBS9xPJp+fTr8n3ikFOeWWmioc+610qi96bAyiJvS7GdfcQcr
	mNut/nVnz4+MbCXqy2Fbn8+Es3f5V+RtuXz7x7w=
X-Google-Smtp-Source: ACHHUZ6Sxgfj5Ayc8TElxXq41LxV1S3Tx2UHcj8M215oC6rvgx3sj4Pe/8TRYOJsB6vyR4dzaeKSV0+DQ9X2bbuortQ=
X-Received: by 2002:a17:907:2da9:b0:96a:4f89:3916 with SMTP id
 gt41-20020a1709072da900b0096a4f893916mr2743992ejc.58.1686072823366; Tue, 06
 Jun 2023 10:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220524093828.505575-1-npiggin@gmail.com> <CAGfacvTu_8tZnndLqbRJeU4UJrnq+tCchiZyFFqOE-hXM0=wCA@mail.gmail.com>
 <CA+=Sn1=gt-nf4T3vfWDKQLRNKkuBXh98nLbTtiCGDSPhMxyRiQ@mail.gmail.com>
 <CAGfacvQ84ZexaH3Wgdz-vL3Y2MkKEtqqMg_jOZ15++rhNvZuXA@mail.gmail.com>
 <20230606164256.GQ19790@gate.crashing.org> <CAGfacvQ7qE4S-U=XLVRdZmitWJiCcppWH+VscpKz4piDYWwp=w@mail.gmail.com>
In-Reply-To: <CAGfacvQ7qE4S-U=XLVRdZmitWJiCcppWH+VscpKz4piDYWwp=w@mail.gmail.com>
From: David Edelsohn <dje.gcc@gmail.com>
Date: Tue, 6 Jun 2023 13:33:30 -0400
Message-ID: <CAGWvnymQGdjBgmsSnLYZaoapPeO8HTM5xe6bPZCqT03hmgaJ6w@mail.gmail.com>
Subject: Re: Passing the complex args in the GPR's
To: Umesh Kalappa <umesh.kalappa0@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b3ca5505fd796bc4"
X-Mailman-Approved-At: Wed, 07 Jun 2023 06:39:51 +1000
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org, Andrew Pinski <pinskia@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Paul E Murphy <murphyp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000b3ca5505fd796bc4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 6, 2023 at 1:08=E2=80=AFPM Umesh Kalappa via Gcc <gcc@gcc.gnu.o=
rg>
wrote:

> Hi Segher ,
>
> >>What did you expect, what happened instead?
> For example the complex args are passed in GPR's for  cexp in the case
> GCC and Clang uses  caller memory .
>
> for reference : https://godbolt.org/z/MfMz3cTe7
>
> We have cross tools  like some of libraries built  using  the GCC and
> some use Clang .
>
> We approached Clang developers on this behaviour (Why stack , not the
> FPR's registers like PPC64)  and they are not going to change this
> behaviour, and asked us to refer back to GCC ,hence this email thread.
>
> Question is : Why does GCC choose to use GPR's here and have any
> reference to support this decision  ?
>

The use of GPRs to pass complex floating point arguments was an early
implementation mistake -- the parameter passing code missed the
enumeration of a type.  The behavior cannot be changed and corrected
without breaking the ABI.

I don't know what you mean by "support this decision".  It was not
intentionally chosen through careful performance analysis or type system
design as the preferred method to pass complex floating point values.  The
initial implementation was wrong and not discovered until it was too late.
The reference to support this is that one cannot break the ABI without
causing chaos in the ecosystem.

Thanks, David


>
> Thank you
> ~Umesh
>
>
>
> On Tue, Jun 6, 2023 at 10:16=E2=80=AFPM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> >
> > Hi!
> >
> > On Tue, Jun 06, 2023 at 08:35:22PM +0530, Umesh Kalappa wrote:
> > > Hi Adnrew,
> > > Thank you for the quick response and for PPC64 too ,we do have
> > > mismatches in ABI b/w complex operations like
> > > https://godbolt.org/z/bjsYovx4c .
> > >
> > > Any reason why GCC chose to use GPR 's here ?
> >
> > What did you expect, what happened instead?  Why did you expect that,
> > and why then is it an error what did happen?
> >
> > You used -O0.  As long as the code works, all is fine.  But unoptimised
> > code frequently is hard to read, please use -O2 instead?
> >
> > As Andrew says, why did you use -m32 for GCC but -m64 for LLVM?  It is
> > hard to compare those at all!  32-bit PowerPC Linux ABI (based on 32-bi=
t
> > PowerPC ELF ABI from 1995, BE version) vs. 64-bit ELFv2 ABI from 2015
> > (LE version).
> >
> >
> > Segher
>

--000000000000b3ca5505fd796bc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jun 6, 2023 at 1:08=E2=80=AFPM Um=
esh Kalappa via Gcc &lt;<a href=3D"mailto:gcc@gcc.gnu.org">gcc@gcc.gnu.org<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi Segher ,<br>
<br>
&gt;&gt;What did you expect, what happened instead?<br>
For example the complex args are passed in GPR&#39;s for=C2=A0 cexp in the =
case<br>
GCC and Clang uses=C2=A0 caller memory .<br>
<br>
for reference : <a href=3D"https://godbolt.org/z/MfMz3cTe7" rel=3D"noreferr=
er" target=3D"_blank">https://godbolt.org/z/MfMz3cTe7</a><br>
<br>
We have cross tools=C2=A0 like some of libraries built=C2=A0 using=C2=A0 th=
e GCC and<br>
some use Clang .<br>
<br>
We approached Clang developers on this behaviour (Why stack , not the<br>
FPR&#39;s registers like PPC64)=C2=A0 and they are not going to change this=
<br>
behaviour, and asked us to refer back to GCC ,hence this email thread.<br>
<br>
Question is : Why does GCC choose to use GPR&#39;s here and have any<br>
reference to support this decision=C2=A0 ?<br></blockquote><div><br></div><=
div>The use of GPRs to pass complex floating point arguments was an early i=
mplementation=C2=A0mistake -- the parameter passing code missed the enumera=
tion=C2=A0of a type.=C2=A0 The behavior cannot be changed and corrected wit=
hout breaking the ABI.</div><div><br></div><div>I don&#39;t know what you m=
ean by &quot;support this decision&quot;.=C2=A0 It was not intentionally ch=
osen through careful=C2=A0performance analysis or type system design as the=
 preferred method to pass complex floating point values.=C2=A0 The initial =
implementation was wrong and not discovered until it was too late.=C2=A0 Th=
e reference to support this is that one cannot break the ABI without causin=
g chaos in the ecosystem.</div><div><br></div><div>Thanks, David</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thank you<br>
~Umesh<br>
<br>
<br>
<br>
On Tue, Jun 6, 2023 at 10:16=E2=80=AFPM Segher Boessenkool<br>
&lt;<a href=3D"mailto:segher@kernel.crashing.org" target=3D"_blank">segher@=
kernel.crashing.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi!<br>
&gt;<br>
&gt; On Tue, Jun 06, 2023 at 08:35:22PM +0530, Umesh Kalappa wrote:<br>
&gt; &gt; Hi Adnrew,<br>
&gt; &gt; Thank you for the quick response and for PPC64 too ,we do have<br=
>
&gt; &gt; mismatches in ABI b/w complex operations like<br>
&gt; &gt; <a href=3D"https://godbolt.org/z/bjsYovx4c" rel=3D"noreferrer" ta=
rget=3D"_blank">https://godbolt.org/z/bjsYovx4c</a> .<br>
&gt; &gt;<br>
&gt; &gt; Any reason why GCC chose to use GPR &#39;s here ?<br>
&gt;<br>
&gt; What did you expect, what happened instead?=C2=A0 Why did you expect t=
hat,<br>
&gt; and why then is it an error what did happen?<br>
&gt;<br>
&gt; You used -O0.=C2=A0 As long as the code works, all is fine.=C2=A0 But =
unoptimised<br>
&gt; code frequently is hard to read, please use -O2 instead?<br>
&gt;<br>
&gt; As Andrew says, why did you use -m32 for GCC but -m64 for LLVM?=C2=A0 =
It is<br>
&gt; hard to compare those at all!=C2=A0 32-bit PowerPC Linux ABI (based on=
 32-bit<br>
&gt; PowerPC ELF ABI from 1995, BE version) vs. 64-bit ELFv2 ABI from 2015<=
br>
&gt; (LE version).<br>
&gt;<br>
&gt;<br>
&gt; Segher<br>
</blockquote></div></div>

--000000000000b3ca5505fd796bc4--
