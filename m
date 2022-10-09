Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 963055F89B2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 08:29:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlXFQ3ZbPz3f1r
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 17:29:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HTs0JXol;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HTs0JXol;
	dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlX3303Lcz3bjj
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 17:20:14 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id y5so12520867lfl.4
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Oct 2022 23:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CYVzGBZakWG9d944sIFmE1Um+lw85LRPOYMdx05jQf0=;
        b=HTs0JXolMOFf1NCo7bSwEKMRc5FQjFbYrlESC1Me81oA31Q0IN4P2YOHdSd3WH1wcq
         6MAXkyCyJbKdIBzlgzlX9PJFrv7q/ecDL7eBG+7/d7ZKOio5/Oe6W6BxarXqmT0drNOq
         6OsrQy7Q9oCETG4sNQfBG60OaEwmaEMEihgShHMrNWZ+iY2V5RW7AjvZTL7TnDuutDWS
         0bXBBsnZiso8NqB9jF3dbYEKA5SQ5TSgQNESNxT9YcOKMx2xcSU5DERT21q1muqLH5em
         ynsGQ0+3Y4SwKDS7DCA5aXdIJ0Byon4LcJj5WxMOFQaVoX++48n8QVS/gMeuQIyYZqRo
         4Lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYVzGBZakWG9d944sIFmE1Um+lw85LRPOYMdx05jQf0=;
        b=XzELR4MikY8Kj5fDn+D1OURVyEPcjUfg+qirXBkgdhphyvBsOaXWOPLFdTYDXdxKSI
         QlDrQbg8Xlz/T5qb2mqNofTLDwhDfLpUOVi3W6HOOLFz5EWyVUr8biwm7f7IdKvd9Iy0
         lLS5lhnrMDNV/iXqFAWrgtsCXF7ufNVTbB6u31l/wxKzW9eIcIXCC9JkPXsSl1X2OClM
         yOJpUkMZhMmPc4vCyFVIZxQCbEZLIIGyISzRi2y06xDiHlnHBCsV2nG6wlgN8q1R79CW
         4eLBb+kZoBdg5Gla2m7foAp71GtIyWLNiT0fDBXzvz/I5RRY9gJXHOvCdLzkupBw/qse
         ZJFQ==
X-Gm-Message-State: ACrzQf3BpaoZmL95J+uBYGbmJheEe7FDH0mBYQl7abCRcX4Mfzx7kOr1
	PjLOL0kBY9CcEgU/rJpFAp0YgFjiES9qcmlIrFc=
X-Google-Smtp-Source: AMsMyM43EKQc0A3gEi6Srb+0JZUb2qESuXVFgLo4VX4Ys0e9RlkHmCC5gePHFp+U5k/LBvJScniUbU6y3FQPZUYPTos=
X-Received: by 2002:a19:4350:0:b0:4a2:7523:9c6f with SMTP id
 m16-20020a194350000000b004a275239c6fmr4435771lfj.577.1665296410639; Sat, 08
 Oct 2022 23:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220930064441.2548505-1-chancel.liu@nxp.com> <20220930064441.2548505-8-chancel.liu@nxp.com>
In-Reply-To: <20220930064441.2548505-8-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 9 Oct 2022 14:19:59 +0800
Message-ID: <CAA+D8AO4_npR6Tm=Dph_E151=NFY+XjZjWth7Y8s6=v7aF+qEQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] ASoC: imx-rpmsg: Assign platform driver used by
 machine driver to link with
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="0000000000000081bc05ea9409ac"
X-Mailman-Approved-At: Sun, 09 Oct 2022 17:24:03 +1100
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000000081bc05ea9409ac
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 30, 2022 at 2:46 PM Chancel Liu <chancel.liu@nxp.com> wrote:

> Each ASoC platform driver is named by rpmsg channel. ASoC machine
> driver can parse "fsl,rpmsg-channel-name" property to figure out which
> ASoC platform driver it should link with.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/imx-rpmsg.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
> index 2e117311e582..57684064c9da 100644
> --- a/sound/soc/fsl/imx-rpmsg.c
> +++ b/sound/soc/fsl/imx-rpmsg.c
> @@ -36,6 +36,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
>         struct platform_device *rpmsg_pdev = to_platform_device(dev);
>         struct device_node *np = rpmsg_pdev->dev.of_node;
>         struct of_phandle_args args;
> +       const char *platform_name;
>         struct imx_rpmsg *data;
>         int ret = 0;
>
> @@ -81,7 +82,10 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
>         }
>
>         data->dai.cpus->dai_name = dev_name(&rpmsg_pdev->dev);
> -       data->dai.platforms->name = IMX_PCM_DRV_NAME;
> +       if (!of_property_read_string(np, "fsl,rpmsg-channel-name",
> &platform_name))
> +               data->dai.platforms->name = platform_name;
> +       else
> +               data->dai.platforms->name = "rpmsg-audio-channel";
>         data->dai.playback_only = true;
>         data->dai.capture_only = true;
>         data->card.num_links = 1;
> --
> 2.25.1
>
>

--0000000000000081bc05ea9409ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 30, 2022 at 2:46 PM Chanc=
el Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nxp.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Each A=
SoC platform driver is named by rpmsg channel. ASoC machine<br>
driver can parse &quot;fsl,rpmsg-channel-name&quot; property to figure out =
which<br>
ASoC platform driver it should link with.<br>
<br>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br></blockquote><div><br></div><di=
v>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">sh=
engjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards</div><d=
iv>Wang Shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/imx-rpmsg.c | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c<br>
index 2e117311e582..57684064c9da 100644<br>
--- a/sound/soc/fsl/imx-rpmsg.c<br>
+++ b/sound/soc/fsl/imx-rpmsg.c<br>
@@ -36,6 +36,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct platform_device *rpmsg_pdev =3D to_platf=
orm_device(dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_node *np =3D rpmsg_pdev-&gt;dev.o=
f_node;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct of_phandle_args args;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *platform_name;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct imx_rpmsg *data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
<br>
@@ -81,7 +82,10 @@ static int imx_rpmsg_probe(struct platform_device *pdev)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 data-&gt;dai.cpus-&gt;dai_name =3D dev_name(&am=
p;rpmsg_pdev-&gt;dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;dai.platforms-&gt;name =3D IMX_PCM_DRV=
_NAME;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!of_property_read_string(np, &quot;fsl,rpms=
g-channel-name&quot;, &amp;platform_name))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;dai.platfo=
rms-&gt;name =3D platform_name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;dai.platfo=
rms-&gt;name =3D &quot;rpmsg-audio-channel&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 data-&gt;dai.playback_only =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 data-&gt;dai.capture_only =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 data-&gt;card.num_links =3D 1;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000000081bc05ea9409ac--
