Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D4734A4F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 04:35:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qL6SLh1l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qkv4Z0RGhz3bNj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 12:35:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qL6SLh1l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qktd73LPyz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 12:14:50 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-666eba6f3d6so687810b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jun 2023 19:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687140885; x=1689732885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w0uvLTYVJ3T8cSG1TwSPs0VLhCp5ZmVWs5OHrwQBj5I=;
        b=qL6SLh1l2LBqXHCU8V1cfuypozqvTQSDxG4vhGTYQ8bbgGJgIrX4fx4GwxkMyXYs2F
         EZGgjSpoXSdk5PtW6Zh7mpkLHlaFa3iYjRq1CAq0/Gmj9PUpe5TFUk3+auHsOtnEUa5X
         rSjMjlHj0MIvkeph5j1AJrUvXd7aq97hTVf1f/qksrR5ofKe33zu4Wrt0sVS5jb4Uu0D
         igPQbZRTowdtv7pBn61WJAEnVH1ictkAjNcbzQKLWst/oqCUsvLlvG/EsmQqWB52ZlXf
         nq+DvNzeNlGN4i3QkG5FfPvtIV4C2iXtt4oX/cLU7Hoh3OUr4hKEgehLuNLFLC+WaLzh
         NArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687140885; x=1689732885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0uvLTYVJ3T8cSG1TwSPs0VLhCp5ZmVWs5OHrwQBj5I=;
        b=ZqnYs9n9hv6EBY+l+Vqb5Jui08Zre3gI3A6bQPXBqkgk8pjRvkFn4qFvQKfqobeJl4
         25pOZYjp/iWgB5bMPGJx2+xDTH0tr8wPHKTwuMelrdXqHRnsLELHFsqev8P0Bf6AhuxG
         oBja0P0b4PiRghrQWcGgX1fhS5RPY473uYVLS7s33d/B/Jinay2DUMzA/v0cx74p4Qzi
         6mgNs2Dr9N2afexC5dKp8qNwdxHECgFth9oxTc+uihLxCQPZ7zJvi+jXkSWeohPIH4SK
         OLKjfHofS76eYNduDXRQgNzHzFyTJ9nCUUprC9k+EC5wrL3B2j0WsL81CANBVkDHcH3m
         Aucw==
X-Gm-Message-State: AC+VfDxe9027JXebtwqpY8PEXmao3jrYL8kzO6Mnfbizh+ejZDJ/hwMs
	ek7GMM59mcVzRowRYgzm0b3AfxloyF4iuvFu768=
X-Google-Smtp-Source: ACHHUZ6mqbsOaVJDJQRBG23wENKFPy4oTQXM31UIqXXsp/G2AcP0kHvV25mS5byRqp1s8A9Br6UgyBR2rBWepPkkmyg=
X-Received: by 2002:a05:6a21:6d88:b0:11d:5b5d:ddf0 with SMTP id
 wl8-20020a056a216d8800b0011d5b5dddf0mr6206344pzb.49.1687140884957; Sun, 18
 Jun 2023 19:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230614121509.443926-1-claudiu.beznea@microchip.com>
In-Reply-To: <20230614121509.443926-1-claudiu.beznea@microchip.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 19 Jun 2023 10:14:33 +0800
Message-ID: <CAA+D8APLC5jk2jFmeT6HEP84Hr8XdL5gqiopZDUrz0sSB+7JOw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-audmix: check return value of devm_kasprintf()
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: multipart/alternative; boundary="00000000000022504805fe7219c1"
X-Mailman-Approved-At: Mon, 19 Jun 2023 12:34:24 +1000
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, viorel.suman@nxp.com, Xiubo.Lee@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000022504805fe7219c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 8:15=E2=80=AFPM Claudiu Beznea <claudiu.beznea@micr=
ochip.com>
wrote:

> devm_kasprintf() returns a pointer to dynamically allocated memory.
> Pointer could be NULL in case allocation fails. Check pointer validity.
> Identified with coccinelle (kmerr.cocci script).
>
> Fixes: b86ef5367761 ("ASoC: fsl: Add Audio Mixer machine driver")
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu

> ---
>
> Hi,
>
> This has been addressed using kmerr.cocci script proposed for update
> at [1].
>
> Thank you,
> Claudiu Beznea
>
> [1]
> https://lore.kernel.org/all/20230530074044.1603426-1-claudiu.beznea@micro=
chip.com/
>
>  sound/soc/fsl/imx-audmix.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
> index 2c57fe9d2d08..af06268ee57b 100644
> --- a/sound/soc/fsl/imx-audmix.c
> +++ b/sound/soc/fsl/imx-audmix.c
> @@ -228,6 +228,8 @@ static int imx_audmix_probe(struct platform_device
> *pdev)
>
>                 dai_name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s%s=
",
>                                           fe_name_pref, args.np->full_nam=
e
> + 1);
> +               if (!dai_name)
> +                       return -ENOMEM;
>
>                 dev_info(pdev->dev.parent, "DAI FE name:%s\n", dai_name);
>
> @@ -236,6 +238,8 @@ static int imx_audmix_probe(struct platform_device
> *pdev)
>                         capture_dai_name =3D
>                                 devm_kasprintf(&pdev->dev, GFP_KERNEL, "%=
s
> %s",
>                                                dai_name, "CPU-Capture");
> +                       if (!capture_dai_name)
> +                               return -ENOMEM;
>                 }
>
>                 priv->dai[i].cpus =3D &dlc[0];
> @@ -263,6 +267,8 @@ static int imx_audmix_probe(struct platform_device
> *pdev)
>                                        "AUDMIX-Playback-%d", i);
>                 be_cp =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
>                                        "AUDMIX-Capture-%d", i);
> +               if (!be_name || !be_pb || !be_cp)
> +                       return -ENOMEM;
>
>                 priv->dai[num_dai + i].cpus =3D &dlc[2];
>                 priv->dai[num_dai + i].codecs =3D &dlc[3];
> @@ -287,6 +293,9 @@ static int imx_audmix_probe(struct platform_device
> *pdev)
>                 priv->dapm_routes[i].source =3D
>                         devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s %s",
>                                        dai_name, "CPU-Playback");
> +               if (!priv->dapm_routes[i].source)
> +                       return -ENOMEM;
> +
>                 priv->dapm_routes[i].sink =3D be_pb;
>                 priv->dapm_routes[num_dai + i].source   =3D be_pb;
>                 priv->dapm_routes[num_dai + i].sink     =3D be_cp;
> --
> 2.34.1
>
>

--00000000000022504805fe7219c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 14, 2023 at 8:15=E2=80=AF=
PM Claudiu Beznea &lt;<a href=3D"mailto:claudiu.beznea@microchip.com">claud=
iu.beznea@microchip.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">devm_kasprintf() returns a pointer to dynamically al=
located memory.<br>
Pointer could be NULL in case allocation fails. Check pointer validity.<br>
Identified with coccinelle (kmerr.cocci script).<br>
<br>
Fixes: b86ef5367761 (&quot;ASoC: fsl: Add Audio Mixer machine driver&quot;)=
<br>
Signed-off-by: Claudiu Beznea &lt;<a href=3D"mailto:claudiu.beznea@microchi=
p.com" target=3D"_blank">claudiu.beznea@microchip.com</a>&gt;<br></blockquo=
te><div><br></div><div>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengj=
iu.wang@gmail.com">shengjiu.wang@gmail.com</a>&gt;</div><div><br></div><div=
>Best regards</div><div>Wang shengjiu=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
---<br>
<br>
Hi,<br>
<br>
This has been addressed using kmerr.cocci script proposed for update<br>
at [1].<br>
<br>
Thank you,<br>
Claudiu Beznea<br>
<br>
[1] <a href=3D"https://lore.kernel.org/all/20230530074044.1603426-1-claudiu=
.beznea@microchip.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.k=
ernel.org/all/20230530074044.1603426-1-claudiu.beznea@microchip.com/</a><br=
>
<br>
=C2=A0sound/soc/fsl/imx-audmix.c | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c<br>
index 2c57fe9d2d08..af06268ee57b 100644<br>
--- a/sound/soc/fsl/imx-audmix.c<br>
+++ b/sound/soc/fsl/imx-audmix.c<br>
@@ -228,6 +228,8 @@ static int imx_audmix_probe(struct platform_device *pde=
v)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dai_name =3D devm_k=
asprintf(&amp;pdev-&gt;dev, GFP_KERNEL, &quot;%s%s&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
e_name_pref, args.np-&gt;full_name + 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dai_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -ENOMEM;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_info(pdev-&gt;d=
ev.parent, &quot;DAI FE name:%s\n&quot;, dai_name);<br>
<br>
@@ -236,6 +238,8 @@ static int imx_audmix_probe(struct platform_device *pde=
v)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 capture_dai_name =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 devm_kasprintf(&amp;pdev-&gt;dev, GF=
P_KERNEL, &quot;%s %s&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0dai_name, &quot;CPU-Capture&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!capture_dai_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;dai[i].cpu=
s =3D &amp;dlc[0];<br>
@@ -263,6 +267,8 @@ static int imx_audmix_probe(struct platform_device *pde=
v)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;AUD=
MIX-Playback-%d&quot;, i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be_cp =3D devm_kasp=
rintf(&amp;pdev-&gt;dev, GFP_KERNEL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;AUD=
MIX-Capture-%d&quot;, i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!be_name || !be=
_pb || !be_cp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -ENOMEM;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;dai[num_da=
i + i].cpus =3D &amp;dlc[2];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;dai[num_da=
i + i].codecs =3D &amp;dlc[3];<br>
@@ -287,6 +293,9 @@ static int imx_audmix_probe(struct platform_device *pde=
v)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;dapm_route=
s[i].source =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 devm_kasprintf(&amp;pdev-&gt;dev, GFP_KERNEL, &quot;%s %s&quot;,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dai_name,=
 &quot;CPU-Playback&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!priv-&gt;dapm_=
routes[i].source)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -ENOMEM;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;dapm_route=
s[i].sink =3D be_pb;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;dapm_route=
s[num_dai + i].source=C2=A0 =C2=A0=3D be_pb;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;dapm_route=
s[num_dai + i].sink=C2=A0 =C2=A0 =C2=A0=3D be_cp;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--00000000000022504805fe7219c1--
