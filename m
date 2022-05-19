Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4441652DFEA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 00:17:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L443s0VShz3dp2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 08:17:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MIZxC16q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MIZxC16q; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3rc21F18z2xt3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 23:41:20 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id l14so5375903pjk.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KxYwSx6y+x9fI4ECFbVQikUh9lZgIve5uIAAey7MnwE=;
 b=MIZxC16q0VSU0b43u7W+CLYxPfvPz1+WzHV3Y885LYlyxzsl8w1dzb4yowWbDil9FO
 qcLrrpYa76H3KZCWVf0czGg+YtGLiCNVY/TiBopbJKWIU5T1+zcNd/JGyosw7qPrAxZ/
 gSv5eFDjLN1YWgNFs/qLj9lC2YzJ+0KMdexFHfRsvPda9tnHbd0Cnl+gQXBtspCtGoJf
 nVYhMvZJF5e+gy1Is1V4UVZaQbjGz+G/wZpGhgEs66XTmPtfIbxQaKnIZ0Aqf7XPVUrG
 By+GaWIEsaCLIxTW6j2iPsSZ9o7+c+cDFpuWssP5KOoVDfiFvTt1UgBoQudniepkNkNK
 +WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KxYwSx6y+x9fI4ECFbVQikUh9lZgIve5uIAAey7MnwE=;
 b=kPq5ytrXejTpUZbDyP9W7oWlDxu/nB7/z6UiQ8WexiC3j97Ef1L21sMTkH9rZXKuA7
 fmEiWSHc9fT9wc5myDIzwxBpChUAsX3C3otVaC/ib/4DSDINKftpikmBKFsrYKJQFRRY
 hj64HzvHmF2xeHCC5rtdmw9GoDH9JawQBV/I9K88f9SHXVxupB45sDOxZsgr5Bf4G6aE
 VYdaMuQCHLlad0J/EGzcz7nffmGC77gPPr33f+qrUZilSIZLyReiiOdTKR/E+6t5QAp0
 T+V+899jRqM5GiDrOJFmDOzQZKj8SMcFTpPg/Jeu8EVy2/GgujwYc6vpJSPPy2u1Nn3f
 TxfQ==
X-Gm-Message-State: AOAM531yXzIX6d0wOncp2N0kW6Zppo9z4qs+iCNMZGcxqz0Dv07kZc58
 ymYHRpe3mYFi5H0fBSNaiksKNz8IDlYF6FGSy2w=
X-Google-Smtp-Source: ABdhPJwN938ux3fm5gzJLBtrYIriAnpPWyMjwWJI5wVfv18y6DyL30G7BSWkmIfhyqf4W/oQVIhbkGKg821ZgIO5w/Q=
X-Received: by 2002:a17:90a:6f06:b0:1df:c19b:627d with SMTP id
 d6-20020a17090a6f0600b001dfc19b627dmr5305839pjk.95.1652967677567; Thu, 19 May
 2022 06:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
In-Reply-To: <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 19 May 2022 21:41:06 +0800
Message-ID: <CAA+D8AOp+rNdzXUD+MomS5H87Kv5whMLpCqUrha15Xpbm2Mu2w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
To: Fabio Estevam <festevam@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003f249805df5d87b8"
X-Mailman-Approved-At: Fri, 20 May 2022 08:15:30 +1000
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000003f249805df5d87b8
Content-Type: text/plain; charset="UTF-8"

On Thu, May 19, 2022 at 9:23 PM Fabio Estevam <festevam@gmail.com> wrote:

> Hi Shengjiu,
>
> On Thu, May 19, 2022 at 9:49 AM Shengjiu Wang <shengjiu.wang@nxp.com>
> wrote:
>
> > diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> > index fa950dde5310..dae16a14f177 100644
> > --- a/sound/soc/fsl/fsl_sai.c
> > +++ b/sound/soc/fsl/fsl_sai.c
> > @@ -437,6 +437,12 @@ static int fsl_sai_set_bclk(struct snd_soc_dai
> *dai, bool tx, u32 freq)
> >                                    FSL_SAI_CR2_DIV_MASK |
> FSL_SAI_CR2_BYP,
> >                                    savediv / 2 - 1);
> >
> > +       if (sai->soc_data->max_register >= FSL_SAI_MCTL) {
>
> Isn't it a bit fragile to take this decision based on the number of
> SAI registers in the SoC?
>
> What about adding a specific field in soc_data for such a purpose?
>

'max_register' is one field in the soc_data,  until now in our internal
usage it seems ok for using this condition.

Thanks.

Best regards
Wang shengjiu

--0000000000003f249805df5d87b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 19, 2022 at 9:23 PM Fabio=
 Estevam &lt;<a href=3D"mailto:festevam@gmail.com">festevam@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi She=
ngjiu,<br>
<br>
On Thu, May 19, 2022 at 9:49 AM Shengjiu Wang &lt;<a href=3D"mailto:shengji=
u.wang@nxp.com" target=3D"_blank">shengjiu.wang@nxp.com</a>&gt; wrote:<br>
<br>
&gt; diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br>
&gt; index fa950dde5310..dae16a14f177 100644<br>
&gt; --- a/sound/soc/fsl/fsl_sai.c<br>
&gt; +++ b/sound/soc/fsl/fsl_sai.c<br>
&gt; @@ -437,6 +437,12 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *d=
ai, bool tx, u32 freq)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FSL_SAI_CR2_DIV_MAS=
K | FSL_SAI_CR2_BYP,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 savediv / 2 - 1);<b=
r>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sai-&gt;soc_data-&gt;max_register &gt;=
=3D FSL_SAI_MCTL) {<br>
<br>
Isn&#39;t it a bit fragile to take this decision based on the number of<br>
SAI registers in the SoC?<br>
<br>
What about adding a specific field in soc_data for such a purpose?<br></blo=
ckquote><div><br></div><div>&#39;max_register&#39; is one field in the soc_=
data,=C2=A0 until=C2=A0now in our internal</div><div>usage it seems ok for =
using this condition.</div><div><br></div><div>Thanks.</div><div><br></div>=
<div>Best regards</div><div>Wang shengjiu</div><div>=C2=A0</div></div></div=
>

--0000000000003f249805df5d87b8--
