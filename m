Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB91A3596F8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 09:57:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGr885FQZz3c0v
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 17:57:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=T4ScMsCh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633;
 helo=mail-ej1-x633.google.com; envelope-from=syl.loop@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=T4ScMsCh; dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGqgs0SPWz2yyr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 17:36:22 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id v6so5861639ejo.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Apr 2021 00:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aYu6DCXGfSXXaBL74AFXRcLOIQDKPV51FufAhX07leY=;
 b=T4ScMsChUxxk3O+/alt0eCvRHhpSfTZyAdYZcC8g/ecgEo2ePtiFgNeOrlpwvado50
 Bw6Yl9fwOItPaM7GZLIfS3wf9hFEFFWgnReku6XdqO7k26LOlnS1dGHbfRsLZEkjapZ1
 nqUPKM2rmw2UuL9Trfp+SGwYRuszYEvV7I5CvdB9hJq6a3hovVrZADan8Jpdjf126wj0
 idl9AEnst7grkkXAyppPpRcL3/jX/4wF7CRYX7+2qWcdsYFVzfDf5kcWSvPdXTV3g//I
 owt9Z1ofEA4UYXIn8aQrUgJajYPr7De6F5q4TYTo6nmQ0ZpLhP1EpLZpudPG5sKZ+Wvd
 yTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aYu6DCXGfSXXaBL74AFXRcLOIQDKPV51FufAhX07leY=;
 b=Ii6Yov28e8Hjode8z3UejTIHHcumtpumBYRkslFV9RnV6v2q/SMPpE4zcta5pHLJ0M
 Y6qA9bPCqWurLhCJPuip9hW4JOaawtxh21EWWdPpeSW/oU0JIH7SeehGcE0T3SsuQZru
 a/l/LRvEeTN9wZ7NYWt9qm65QiNHvBGtfAypRKMbCehP3HIVb69sd9Yq2yG80TYuG+wO
 Nu3RPZJiy1YH8IlizmzVn0C0XA4xsf8KA/7gSqumHK5m1WNz98Gb1YVKFA8yHJuNJzdA
 +YcRLnSl4GM4IIFdIjJrk9JtbZ8xg2J9FYLqomxXbe9v1hZhxTQ+rgkf9eZRrK3Qo6Mt
 RFtA==
X-Gm-Message-State: AOAM530pwWks0ruzNcys1iLivFec6myDAjdjsobLA/+RXCDriN25zZSe
 0a1KilLLQQCSmbwebCFC1UqNXEJ7E4E3QPZPOk4=
X-Google-Smtp-Source: ABdhPJyS9Td4/gQngpUPSne6PlGiqzgscs62wnb5KfgJo61mwzKDDvI9a5iwAIojHFByexOhp1TIa0PpLot13qgM//s=
X-Received: by 2002:a17:906:a155:: with SMTP id
 bu21mr14801293ejb.400.1617953778383; 
 Fri, 09 Apr 2021 00:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210403020423.85278-1-syl.loop@gmail.com>
 <87y2due3mt.fsf@mpe.ellerman.id.au>
In-Reply-To: <87y2due3mt.fsf@mpe.ellerman.id.au>
From: Sam Song <syl.loop@gmail.com>
Date: Fri, 9 Apr 2021 15:36:06 +0800
Message-ID: <CA+DfQ-JjpFNdpB=D9AqJ75zFrpg504xOeCDD=cb-qnR2mYrgQw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/dts: fix not include DTC_FLAGS
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: multipart/alternative; boundary="000000000000393c0705bf853846"
X-Mailman-Approved-At: Fri, 09 Apr 2021 17:57:06 +1000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000393c0705bf853846
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 In my test, DTC_FLAGS in arch/powerpc/boot/Makefile is not to work,I will
send V2 to removing it.

Michael Ellerman <mpe@ellerman.id.au> =E4=BA=8E2021=E5=B9=B44=E6=9C=887=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=887:27=E5=86=99=E9=81=93=EF=BC=9A

> Youlin Song <syl.loop@gmail.com> writes:
> > I wanted to build the fsl dts in my machine and found that
> > the dtb have not extra space,so uboot will cause about
> > FDT_ERR_NOSPACE issue.
> >
> > Signed-off-by: Youlin Song <syl.loop@gmail.com>
> > ---
> >  arch/powerpc/boot/dts/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/powerpc/boot/dts/Makefile
> b/arch/powerpc/boot/dts/Makefile
> > index fb335d05aae8..c21165c0cd76 100644
> > --- a/arch/powerpc/boot/dts/Makefile
> > +++ b/arch/powerpc/boot/dts/Makefile
> > @@ -2,5 +2,6 @@
> >
> >  subdir-y +=3D fsl
> >
> > +DTC_FLAGS   ?=3D -p 1024
> >  dtstree              :=3D $(srctree)/$(src)
> >  dtb-$(CONFIG_OF_ALL_DTBS) :=3D $(patsubst $(dtstree)/%.dts,%.dtb,
> $(wildcard $(dtstree)/*.dts))
>
> I guess that was missed in 1acf1cf8638a ("powerpc: build .dtb files in dt=
s
> directory").
>
> Which I think means the assignment to DTC_FLAGS in
> arch/powerpc/boot/Makefile is not needed anymore.
>
> Can you send a v2 removing that assignment and explaining that's what
> happened?
>
> cheers
>

--000000000000393c0705bf853846
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
In my test,=20
DTC_FLAGS in arch/powerpc/boot/Makefile is not to work,I will send V2 to re=
moving it.

</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au">mpe@ellerman.id.=
au</a>&gt; =E4=BA=8E2021=E5=B9=B44=E6=9C=887=E6=97=A5=E5=91=A8=E4=B8=89 =E4=
=B8=8B=E5=8D=887:27=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Youlin Song &lt;<a href=3D"mailto:syl.loop=
@gmail.com" target=3D"_blank">syl.loop@gmail.com</a>&gt; writes:<br>
&gt; I wanted to build the fsl dts in my machine and found that<br>
&gt; the dtb have not extra space,so uboot will cause about<br>
&gt; FDT_ERR_NOSPACE issue.<br>
&gt;<br>
&gt; Signed-off-by: Youlin Song &lt;<a href=3D"mailto:syl.loop@gmail.com" t=
arget=3D"_blank">syl.loop@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/powerpc/boot/dts/Makefile | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Ma=
kefile<br>
&gt; index fb335d05aae8..c21165c0cd76 100644<br>
&gt; --- a/arch/powerpc/boot/dts/Makefile<br>
&gt; +++ b/arch/powerpc/boot/dts/Makefile<br>
&gt; @@ -2,5 +2,6 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 subdir-y +=3D fsl<br>
&gt;=C2=A0 <br>
&gt; +DTC_FLAGS=C2=A0 =C2=A0?=3D -p 1024<br>
&gt;=C2=A0 dtstree=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(s=
rctree)/$(src)<br>
&gt;=C2=A0 dtb-$(CONFIG_OF_ALL_DTBS) :=3D $(patsubst $(dtstree)/%.dts,%.dtb=
, $(wildcard $(dtstree)/*.dts))<br>
<br>
I guess that was missed in 1acf1cf8638a (&quot;powerpc: build .dtb files in=
 dts directory&quot;).<br>
<br>
Which I think means the assignment to DTC_FLAGS in<br>
arch/powerpc/boot/Makefile is not needed anymore.<br>
<br>
Can you send a v2 removing that assignment and explaining that&#39;s what<b=
r>
happened?<br>
<br>
cheers<br>
</blockquote></div>

--000000000000393c0705bf853846--
