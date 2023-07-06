Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F465749D4B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 15:20:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NrP8Egbo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxcbF6rw5z3c3t
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 23:20:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NrP8Egbo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxYdZ5Mbxz307K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 21:07:12 +1000 (AEST)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3a3373211a1so564110b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 04:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688641626; x=1691233626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MzqPcSN9Vd/IVbG/fo+eCKrJ2YfhdLWxRg+A86chNIU=;
        b=NrP8Egbocfe9AgUNxDfkSVZepuPfzyVv/jcqn/KHDj476LVJhLge8vr9/QSW3yjQL9
         SjWMqjszbkDULukgu/9IhRSBsJFl44H0PnikLSIpunIm53Ywf7kfll5mUsMYUXvzaOIR
         B/ES0hbPscGpLDecn07cM20J8ZTOTm2lSGalOahptBXWztzEm9QTjT2iY5ufSR1FNNh6
         +B2L4ZI4iYhZJfM8YpHpGS4dMoNCvjpIIke7iOKu+PLYdTy5WAboPgAj0AKvOAk3Sg/g
         WjL82VFdjp35R2TCa6dvJdjKowN+brZcPR/fQ2ptdIxcHU5m+vU96dcuPsFFz6U3UR+G
         Kuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688641626; x=1691233626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzqPcSN9Vd/IVbG/fo+eCKrJ2YfhdLWxRg+A86chNIU=;
        b=JjtaiuVwuzN0CjyFoAzu7Dm5AM/+K+dCh9XMLILTXePBDAQXgo60SgQliWiqQLR+bT
         0DE4nOWsQKbu4INdt4oB5a+o+zefuDn1MmWKKsS3P2FZCPz9d8+DXM8qkQ4+punoJi7S
         0i2wNK5t7yQQ4OoCFOyUPHpEqxZ9bF2ebwTGshXPbbBl3XOwtjclEE4IR0qEzCL+3Da1
         1QzIWVFft5itNtJDw26uXwGfr4fpPmE3uVlTQl6iW24mOViUR3D/8ehpTmmQ8Qa+de9e
         9EpdFq657eWjrGdfXcCHnHdvThkvPSIoBl0fl0wabw+X89I9PR+QB+c9lxr/AnruESaG
         6Cvg==
X-Gm-Message-State: ABy/qLa25qhutLyCw2ymgzLndiZJl+NyMujo4SAh+OL9lKS4Euo6MUsT
	ZTj1oNndRq0SxLJuszcvZE7pIBP3ZaAH55kDVvM=
X-Google-Smtp-Source: APBJJlF3SHs+c9jEMdQvPZlDR7xI7csftfEEm7tj+Vf0/seQLrNI1/AWHwr/2vYyp9l5ePgk8H8xDwVCZ+04mRCaRIU=
X-Received: by 2002:a05:6808:23c4:b0:3a1:b2d4:5f64 with SMTP id
 bq4-20020a05680823c400b003a1b2d45f64mr1255855oib.54.1688641626501; Thu, 06
 Jul 2023 04:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com> <20230706084706.bzwsbi3zisx5m5rl@fatal.se>
In-Reply-To: <20230706084706.bzwsbi3zisx5m5rl@fatal.se>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 6 Jul 2023 19:06:55 +0800
Message-ID: <CAA+D8AO0LMLqvV2WQuKS=524-ct+qyPcm-916tU7M+ejHSVpwg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
To: Andreas Henriksson <andreas@fatal.se>
Content-Type: multipart/alternative; boundary="0000000000004cf88e05ffcf84de"
X-Mailman-Approved-At: Thu, 06 Jul 2023 23:17:34 +1000
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Hans_S=C3=B6derlund?= <hans.soderlund@realbit.se>, Fabio Estevam <festevam@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000004cf88e05ffcf84de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 6, 2023 at 4:47=E2=80=AFPM Andreas Henriksson <andreas@fatal.se=
> wrote:

> Hello Shengjiu, Fabio,
>
> On Thu, May 19, 2022 at 10:23:06AM -0300, Fabio Estevam wrote:
> > Hi Shengjiu,
> >
> > On Thu, May 19, 2022 at 9:49 AM Shengjiu Wang <shengjiu.wang@nxp.com>
> wrote:
> >
> > > diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> > > index fa950dde5310..dae16a14f177 100644
> > > --- a/sound/soc/fsl/fsl_sai.c
> > > +++ b/sound/soc/fsl/fsl_sai.c
> > > @@ -437,6 +437,12 @@ static int fsl_sai_set_bclk(struct snd_soc_dai
> *dai, bool tx, u32 freq)
> > >                                    FSL_SAI_CR2_DIV_MASK |
> FSL_SAI_CR2_BYP,
> > >                                    savediv / 2 - 1);
> > >
> > > +       if (sai->soc_data->max_register >=3D FSL_SAI_MCTL) {
> >
> > Isn't it a bit fragile to take this decision based on the number of
> > SAI registers in the SoC?
> >
> > What about adding a specific field in soc_data for such a purpose?
>
> We've been working on an i.MX8MP where MCLK needs to be input and found
> that this enables the MCLK as output despite not having set the
> `fsl,sai-mclk-direction-output;` devicetree property in our DT.
> Reverting the patch fixes the issues for us.
>
> Good catch. seems there is an issue here.

best regards
wang shengjiu

I have to say that the code comment made me a bit confused, but once
> I found the commit message I understood why this code existed.
> If this is really i.MX8MM specific maybe mention that in the code
> comment and please make the code actually only trigger on i.MX8MM.
> It seems to me like these all fulfill the current criteria:
> imx7ulp, imx8mq, imx8mm, imx8mp, imx8ulp, imx93
>
> Should I report this in bugzilla.kernel.org ?
>
> Regards,
> Andreas Henriksson
>

--0000000000004cf88e05ffcf84de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 6, 2023 at 4:47=E2=80=AFP=
M Andreas Henriksson &lt;<a href=3D"mailto:andreas@fatal.se">andreas@fatal.=
se</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hello Shengjiu, Fabio,<br>
<br>
On Thu, May 19, 2022 at 10:23:06AM -0300, Fabio Estevam wrote:<br>
&gt; Hi Shengjiu,<br>
&gt; <br>
&gt; On Thu, May 19, 2022 at 9:49 AM Shengjiu Wang &lt;<a href=3D"mailto:sh=
engjiu.wang@nxp.com" target=3D"_blank">shengjiu.wang@nxp.com</a>&gt; wrote:=
<br>
&gt; <br>
&gt; &gt; diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br=
>
&gt; &gt; index fa950dde5310..dae16a14f177 100644<br>
&gt; &gt; --- a/sound/soc/fsl/fsl_sai.c<br>
&gt; &gt; +++ b/sound/soc/fsl/fsl_sai.c<br>
&gt; &gt; @@ -437,6 +437,12 @@ static int fsl_sai_set_bclk(struct snd_soc_d=
ai *dai, bool tx, u32 freq)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FSL_SAI_CR2_DIV=
_MASK | FSL_SAI_CR2_BYP,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 savediv / 2 - 1=
);<br>
&gt; &gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sai-&gt;soc_data-&gt;max_register=
 &gt;=3D FSL_SAI_MCTL) {<br>
&gt; <br>
&gt; Isn&#39;t it a bit fragile to take this decision based on the number o=
f<br>
&gt; SAI registers in the SoC?<br>
&gt; <br>
&gt; What about adding a specific field in soc_data for such a purpose?<br>
<br>
We&#39;ve been working on an i.MX8MP where MCLK needs to be input and found=
<br>
that this enables the MCLK as output despite not having set the<br>
`fsl,sai-mclk-direction-output;` devicetree property in our DT.<br>
Reverting the patch fixes the issues for us.<br>
<br></blockquote><div>Good catch. seems there is an issue here.</div><div><=
br></div><div>best regards</div><div>wang shengjiu=C2=A0</div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
I have to say that the code comment made me a bit confused, but once<br>
I found the commit message I understood why this code existed.<br>
If this is really i.MX8MM specific maybe mention that in the code<br>
comment and please make the code actually only trigger on i.MX8MM.<br>
It seems to me like these all fulfill the current criteria:<br>
imx7ulp, imx8mq, imx8mm, imx8mp, imx8ulp, imx93<br>
<br>
Should I report this in <a href=3D"http://bugzilla.kernel.org" rel=3D"noref=
errer" target=3D"_blank">bugzilla.kernel.org</a> ?<br>
<br>
Regards,<br>
Andreas Henriksson<br>
</blockquote></div></div>

--0000000000004cf88e05ffcf84de--
