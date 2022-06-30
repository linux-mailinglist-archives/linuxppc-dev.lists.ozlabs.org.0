Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F347561A8E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 14:42:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYdK41WFcz3drx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 22:42:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kVsu10QZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kVsu10QZ;
	dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYckD6Llgz3bk0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 22:16:02 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id k15so4175693lfv.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 05:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8FTw4MCFfuFSADhvkdsMGjKiW6HgFhQqoFSBrJRkTFE=;
        b=kVsu10QZCU5mvSFcGpiSud2USeqH+Dqt6dhIHOHhGvbJy2YfSZmU9KDI+xQ1rS/RsB
         eEi7cDf7UU+Ba1AwC07gIreMH6OygAOcZsBERjt2MRl/usw39NgOQrQX4rBF4FI1qeWW
         UaXOyQEbeIIQUV5CMuusKGl6Qh7kf1ZRvvP8gnj0Xtf5Jj2H8io8IprG6u3gitySF0fH
         iU9xLAhrCRDrUt3x9lHE94+AGq49dZSNiS+CuRYtLuLXgXCGErmTFvzx4t7T5XhRa1mR
         qW808mAVs3XtRYUza9GIFi7rJsqBpM/XTJEbwxhF42StMx5QVRT1M5sYQ2BCOykGUhxm
         QhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8FTw4MCFfuFSADhvkdsMGjKiW6HgFhQqoFSBrJRkTFE=;
        b=KceTe8xFqRcEDobx5rjlbzcsuUB/ze0751pG0LfmP17eXTrJXS1ppCsn/IcF9PLzQQ
         Hz/fCUnVhSQartkMJDqhJGy0BWkd3Eo900z3Bg01dNnzHNCpbrFMcVQd1SbPhw98tr6f
         YmSQwSnojgCBalZxvl/cSQjTZbu1Vgadk1i9m/b7tfV9rJnCIPrCn3+HISt77Wffj6M5
         28a9Byo5iBjzGPICydkYJfmWe07GoGJOdOHQfgMSPKOPo99CCzbvCakvSq9um3XJRMil
         GH2HTH+GjWhDdyZhz+t7UCxWygrIUh1WfPRZEmSzilgNh6clYKF8G4hdtsnOLNgC9WzP
         Hb0A==
X-Gm-Message-State: AJIora/Z9q+5dgkQpMAjHHnYF9BMBJ+kt8LwlUOJLB0p6sg9MFGyEQTL
	UW9NHVYwEgmh0qIZEfAVIX8XH0F5aD4zCtxNL8U=
X-Google-Smtp-Source: AGRyM1vLC0PK4De5akrcRg8Y89ZcrUEGDelsIiW0sTj+BvMXfejNuwEHaX+9OjHUW5D9Z2I1M5RDPGENDDMXDYmeSxw=
X-Received: by 2002:a05:6512:3e05:b0:481:2bf2:db06 with SMTP id
 i5-20020a0565123e0500b004812bf2db06mr5236304lfv.408.1656591356116; Thu, 30
 Jun 2022 05:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <1656567554-32122-1-git-send-email-shengjiu.wang@nxp.com>
 <1656567554-32122-4-git-send-email-shengjiu.wang@nxp.com> <Yr1842e42P4piYnE@sirena.org.uk>
In-Reply-To: <Yr1842e42P4piYnE@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 30 Jun 2022 20:15:44 +0800
Message-ID: <CAA+D8AMuOWgPooXGMUqtQOdzVZ60b0ud=wXkO+XYa-BD98o_+A@mail.gmail.com>
Subject: Re: [PATCH 3/6] ASoC: fsl_micfil: Add support for PLL switch at runtime
To: Mark Brown <broonie@kernel.org>
Content-Type: multipart/alternative; boundary="00000000000051c08805e2a93b57"
X-Mailman-Approved-At: Thu, 30 Jun 2022 22:42:17 +1000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000051c08805e2a93b57
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 30, 2022 at 6:37 PM Mark Brown <broonie@kernel.org> wrote:

> On Thu, Jun 30, 2022 at 01:39:11PM +0800, Shengjiu Wang wrote:
>
> > +static int fsl_micfil_reparent_rootclk(struct fsl_micfil *micfil,
> unsigned int sample_rate)
> > +{
> > +     struct device *dev = &micfil->pdev->dev;
> > +     u64 ratio = sample_rate;
> > +     struct clk *clk;
> > +     int ret;
> > +
> > +     /* Reparent clock if required condition is true */
> > +     if (!micfil->pll8k_clk || !micfil->pll11k_clk)
> > +             return 0;
> > +
> > +     ratio = do_div(ratio, 8000) ? CLK_11K_FREQ : CLK_8K_FREQ;
> > +
> > +     /* Get root clock */
> > +     clk = micfil->mclk;
> > +     if (IS_ERR_OR_NULL(clk)) {
> > +             dev_err(dev, "no mclk clock in devicetree\n");
> > +             return PTR_ERR(clk);
> > +     }
> > +
> > +     /* Disable clock first, for it was enabled by pm_runtime */
> > +     clk_disable_unprepare(clk);
> > +     fsl_asoc_reparent_pll_clocks(dev, clk, micfil->pll8k_clk,
> > +                                  micfil->pll11k_clk, ratio);
> > +     ret = clk_prepare_enable(clk);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
> > +}
>
> Seems like more of this logic could be factored out into the reparent
> function if the target sample rate is passed in?
>

Yes, let me update.

Best regards
Wang Shengjiu

--00000000000051c08805e2a93b57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 30, 2022 at 6:37 PM Mark =
Brown &lt;<a href=3D"mailto:broonie@kernel.org">broonie@kernel.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, J=
un 30, 2022 at 01:39:11PM +0800, Shengjiu Wang wrote:<br>
<br>
&gt; +static int fsl_micfil_reparent_rootclk(struct fsl_micfil *micfil, uns=
igned int sample_rate)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;micfil-&gt;pdev-&gt;d=
ev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u64 ratio =3D sample_rate;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct clk *clk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Reparent clock if required condition is true *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!micfil-&gt;pll8k_clk || !micfil-&gt;pll11k_c=
lk)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ratio =3D do_div(ratio, 8000) ? CLK_11K_FREQ : CL=
K_8K_FREQ;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Get root clock */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clk =3D micfil-&gt;mclk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR_OR_NULL(clk)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;no=
 mclk clock in devicetree\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(clk);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Disable clock first, for it was enabled by pm_=
runtime */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fsl_asoc_reparent_pll_clocks(dev, clk, micfil-&gt=
;pll8k_clk,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 micfil-&gt;pll11k_clk, ra=
tio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
<br>
Seems like more of this logic could be factored out into the reparent<br>
function if the target sample rate is passed in?<br></blockquote><div><br><=
/div><div>Yes, let me update.=C2=A0</div><div><br></div><div>Best regards</=
div><div>Wang Shengjiu</div></div></div>

--00000000000051c08805e2a93b57--
