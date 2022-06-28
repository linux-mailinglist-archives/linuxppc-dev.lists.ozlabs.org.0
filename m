Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9DA55BEEB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 09:01:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXFrQ2pvnz3f3T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 17:01:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HI/Mpzhe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HI/Mpzhe;
	dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX7gy6dXDz3c7H
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 12:23:58 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id y32so19785500lfa.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 19:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dB8dhmVX1CwoFsrikItOoVuCqHYJQooSwxGeDKLgNT8=;
        b=HI/MpzheOO9DP7JyzGl+a3bFkcCKHo9eJPYaBisaK2S3Fn1+vKOWsg3egyhpj4t+X9
         Ly8V293IFYftR/AAlBeN8H9KAD9y6KCgtQMAUnYUe28Dc8vM6igE7FXTlTi9PVRbVRHY
         /OZO5DXqKIXo6Cyn6fQuvi35s3H9dzGaAASC0c/sKd5x7BR9GBn8chU7pAwDGDTwFUb/
         JSRO8+fqFxOOhRDy03Uz/Un3n5q9iY7e7pmnkB4KUqqzZnNgnKxbsDd0DnSXAXgQkGZB
         1SD405ytXODk1lf1KctejXodNqpiGHftSF4wPsmPnr+kAWBCE+p3az2KFA6I2/8Ea6hz
         Ir9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dB8dhmVX1CwoFsrikItOoVuCqHYJQooSwxGeDKLgNT8=;
        b=1/b6LgG/cfZjtWzOs8FFq5CO7coBzV6Yt4dRK2MEkxj1IX8kOh3g7bBN0idYGgFBeg
         a593RBt9OhX5FFtR8rYLtJSZjkztBX48nHy8cJgOIeEFqEynpeU2Pw2bOjzvEkzw03Qr
         1iM1VpCO3MygIr6glq+WY7fSJN7ah+mQF8J4tkSiIxKS1BIWRPraypVW8f6xHzet9FC+
         6YTdsIZCQyJugxDVtU0YTznTMk5bnO39Ljp1kMxtyt97Tt52Gg0qGCZWDm7VWFe+txZi
         bbNC3ewo5JmMftI2WMg+pwlLJqo20cmMKeFlHkuKHW6evzYnvqyy65Wn7FeTbpXTKQNe
         LrPQ==
X-Gm-Message-State: AJIora9k24Un5o10VecWNneyB8tkEu6OB7g6GhbfYu01V47hlaIyIANH
	b9BbBSTgtmxdPedZoMfJE4sOiNIHuI1cE14rtqI=
X-Google-Smtp-Source: AGRyM1syY2dmaaVRNUkd92rc/WKV+t3bEdWPEIjpTq4DEE+vBn3CEoNLNHFJUDvccvB2BWZBas+iOknsVfcuCT6oFQY=
X-Received: by 2002:ac2:4e0f:0:b0:481:df0:94a with SMTP id e15-20020ac24e0f000000b004810df0094amr7365079lfr.655.1656383035352;
 Mon, 27 Jun 2022 19:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
 <1655451877-16382-7-git-send-email-shengjiu.wang@nxp.com> <20220627230012.GA3122063-robh@kernel.org>
In-Reply-To: <20220627230012.GA3122063-robh@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 28 Jun 2022 10:23:43 +0800
Message-ID: <CAA+D8AOHu4Wvt4gkUCu7NaT_aNcwWbp1c2KNy7WTLnKvtzZ4jA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] ASoC: dt-bindings: fsl-sai: Add new property to
 configure dataline
To: Rob Herring <robh@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000006f2a6a05e278bafa"
X-Mailman-Approved-At: Tue, 28 Jun 2022 16:58:59 +1000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000006f2a6a05e278bafa
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 28, 2022 at 7:00 AM Rob Herring <robh@kernel.org> wrote:

> On Fri, Jun 17, 2022 at 03:44:36PM +0800, Shengjiu Wang wrote:
> > "fsl,dataline" is added to configure the dataline of SAI.
> > It has 3 value for each configuration, first one means the type:
> > I2S(1) or PDM(2), second one is dataline mask for 'rx', third one is
> > dataline mask for 'tx'. for example:
> >
> > fsl,dataline = <1 0xff 0xff 2 0xff 0x11>,
> >
> > it means I2S type rx mask is 0xff, tx mask is 0xff, PDM type
> > rx mask is 0xff, tx mask is 0x11 (dataline 1 and 4 enabled).
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl-sai.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > index c71c5861d787..4c66e6a1a533 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > @@ -49,6 +49,14 @@ Required properties:
> >                         receive data by following their own bit clocks
> and
> >                         frame sync clocks separately.
> >
> > +  - fsl,dataline        : configure the dataline. it has 3 value for
> each configuration
> > +                          first one means the type: I2S(1) or PDM(2)
> > +                          second one is dataline mask for 'rx'
> > +                          third one is dataline mask for 'tx'.
> > +                          for example: fsl,dataline = <1 0xff 0xff 2
> 0xff 0x11>;
> > +                          it means I2S type rx mask is 0xff, tx mask is
> 0xff, PDM type
> > +                          rx mask is 0xff, tx mask is 0x11 (dataline 1
> and 4 enabled).
>
> You mean 0 and 4 enabled? Or 1 and 4?
>

Should be 'dataline 1 and 5 enabled, index start from 1'.  I will fix it.

>
> How many 3 cell entries can you have?
>

There is no limitation for entries,  the code in the driver will query the
length first
by of_property_count_u32_elems() then read the values.

best regards
wang shengjiu

--0000000000006f2a6a05e278bafa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 28, 2022 at 7:00 AM Rob H=
erring &lt;<a href=3D"mailto:robh@kernel.org">robh@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Jun 17=
, 2022 at 03:44:36PM +0800, Shengjiu Wang wrote:<br>
&gt; &quot;fsl,dataline&quot; is added to configure the dataline of SAI.<br=
>
&gt; It has 3 value for each configuration, first one means the type:<br>
&gt; I2S(1) or PDM(2), second one is dataline mask for &#39;rx&#39;, third =
one is<br>
&gt; dataline mask for &#39;tx&#39;. for example:<br>
&gt; <br>
&gt; fsl,dataline =3D &lt;1 0xff 0xff 2 0xff 0x11&gt;,<br>
&gt; <br>
&gt; it means I2S type rx mask is 0xff, tx mask is 0xff, PDM type<br>
&gt; rx mask is 0xff, tx mask is 0x11 (dataline 1 and 4 enabled).<br>
&gt; <br>
&gt; Signed-off-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@nxp.c=
om" target=3D"_blank">shengjiu.wang@nxp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/devicetree/bindings/sound/fsl-sai.txt | 8 ++++++++=
<br>
&gt;=C2=A0 1 file changed, 8 insertions(+)<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Doc=
umentation/devicetree/bindings/sound/fsl-sai.txt<br>
&gt; index c71c5861d787..4c66e6a1a533 100644<br>
&gt; --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt<br>
&gt; +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt<br>
&gt; @@ -49,6 +49,14 @@ Required properties:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0receive data by following their own bit clocks and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0frame sync clocks separately.<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 - fsl,dataline=C2=A0 =C2=A0 =C2=A0 =C2=A0 : configure the data=
line. it has 3 value for each configuration<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 first one means the type: I2S(1) or PDM(2)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 second one is dataline mask for &#39;rx&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 third one is dataline mask for &#39;tx&#39;.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 for example: fsl,dataline =3D &lt;1 0xff 0xff 2 0xff =
0x11&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 it means I2S type rx mask is 0xff, tx mask is 0xff, P=
DM type<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 rx mask is 0xff, tx mask is 0x11 (dataline 1 and 4 en=
abled).<br>
<br>
You mean 0 and 4 enabled? Or 1 and 4?<br></blockquote><div><br></div><div>S=
hould be &#39;dataline 1 and 5 enabled, index start from 1&#39;.=C2=A0 I wi=
ll fix it.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
How many 3 cell entries can you have?<br></blockquote><div>=C2=A0<br></div>=
<div>There is no limitation for entries,=C2=A0 the code in the driver will =
query the length first</div><div>by of_property_count_u32_elems() then read=
 the values.</div><div><br></div><div>best regards</div><div>wang shengjiu<=
/div></div></div>

--0000000000006f2a6a05e278bafa--
