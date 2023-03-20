Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A688D6C2719
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 02:13:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgYWz3Rlzz3f89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 12:13:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PMXRutyh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PMXRutyh;
	dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pg5f30HNBz2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 18:17:14 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id p13-20020a05600c358d00b003ed346d4522so6825081wmq.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 00:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679296630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CPfksq9HcHZfOW713EHJPP4EqV5hzLLqhdQlnIpNQ4w=;
        b=PMXRutyhQFx1KU9gPiiDMqyuz2dvA92bTRqogWM4OB4usYcokfKFO13vIDzfzAXNeU
         qKHvl5c1d9tk4TCbPT3R/zca2Dhle0sxmuYyCp8h52n1LZWspQQQbmeYX0xpFI0Pm7r2
         ebxxMqKSwc9xGFdUQvyx7eepNit6IMhsjRx3rC9AquJbcIgRMbgj7fTli8FnKhMALz9a
         HBKHMRMaf9lBufOCNRkVQ+Lp+g9ELub7Pq52voEkfp13ainxAk6BdejDKUKHEHdwE8Nq
         IZXgulMujh932zf7F+uOS4gh2iT8rL2R5X5NJ/QBxkyjGU6KmL8akyuGNLPcjecTU3rz
         lFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679296630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPfksq9HcHZfOW713EHJPP4EqV5hzLLqhdQlnIpNQ4w=;
        b=LPwUiKF/WxNVWfI/kSrBQ/GLg10Woc4JDYj1XZttIcoJIdT8PqhaGvoW1tTnYhrbTQ
         np0Q1LS9gRTnE1LzNn0Cz6CXHWuwzxvTKJo5zwG2QgIAdWDrUf7QPF0gluYEdVxfmnXO
         GlPZfT8MbFL1au/7Q4mhzZvzegADS+6dVptAcSyeCKlcfCtNl/fm8W79QlCzMv/hlw2B
         pEH+9TL6ZjAmP6LUEfGMb/F2d2kZfp/zdkXtHsZLPkNJXyqceUjoK5k31Ttt4KlFe5oR
         ome4gGczE9AaCrZXqM8XIDSn+o93E0DIpdwlbcfLbMiTu/MViqo2qy5W5NhevIqr8tYU
         S7vA==
X-Gm-Message-State: AO0yUKU5i7FliQW2t/73vWgVfBp6o7MkaElISrpnyqqW0oGBk2lBxLoc
	L9X/id9+ftMoCBo3+45nHDRuctGrufvhFOLGnbM=
X-Google-Smtp-Source: AK7set/OBiFs7Xg2IWUgP/EwAtFtEoS5w1aGmFF2v9Tj2CD2CdHIr6sfWK/qn/FwI6ulg5h/4/qGKVw4GVQbr7pNspc=
X-Received: by 2002:a7b:c398:0:b0:3ed:f221:9a49 with SMTP id
 s24-20020a7bc398000000b003edf2219a49mr549201wmj.7.1679296630506; Mon, 20 Mar
 2023 00:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com> <20230316123611.3495597-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230316123611.3495597-2-alexander.stein@ew.tq-group.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 20 Mar 2023 15:16:59 +0800
Message-ID: <CAA+D8AMUd0JSKipzY+7tc4ihpYApg0yrLHjYgeAn0gVL11phKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl: Specify driver name in ASoC card
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Content-Type: multipart/alternative; boundary="000000000000224a0805f74fb7ce"
X-Mailman-Approved-At: Tue, 21 Mar 2023 12:11:57 +1100
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000224a0805f74fb7ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2023 at 8:36=E2=80=AFPM Alexander Stein <
alexander.stein@ew.tq-group.com> wrote:

> Set the snd_soc_card driver name which fixes the warning:
> fsl-asoc-card sound: ASoC: driver name too long 'imx-audio-tlv320aic32x4'
> -> 'imx-audio-tlv32'
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
wang shengjiu

> ---
> These patches could be squashed, but I opted for separation this patch
> is the actual functional change. Patch 1 is just preparation.
>
>  sound/soc/fsl/fsl-asoc-card.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
> index e956abfd50f8..bffa1048d31e 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -609,6 +609,7 @@ static int fsl_asoc_card_probe(struct platform_device
> *pdev)
>
>         priv->card.dapm_routes =3D audio_map;
>         priv->card.num_dapm_routes =3D ARRAY_SIZE(audio_map);
> +       priv->card.driver_name =3D DRIVER_NAME;
>         /* Diversify the card configurations */
>         if (of_device_is_compatible(np, "fsl,imx-audio-cs42888")) {
>                 codec_dai_name =3D "cs42888";
> --
> 2.34.1
>
>

--000000000000224a0805f74fb7ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 16, 2023 at 8:36=E2=80=AF=
PM Alexander Stein &lt;<a href=3D"mailto:alexander.stein@ew.tq-group.com">a=
lexander.stein@ew.tq-group.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Set the snd_soc_card driver name which fixes =
the warning:<br>
fsl-asoc-card sound: ASoC: driver name too long &#39;imx-audio-tlv320aic32x=
4&#39;<br>
-&gt; &#39;imx-audio-tlv32&#39;<br>
<br>
Signed-off-by: Alexander Stein &lt;<a href=3D"mailto:alexander.stein@ew.tq-=
group.com" target=3D"_blank">alexander.stein@ew.tq-group.com</a>&gt;<br></b=
lockquote><div><br></div><div>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto=
:shengjiu.wang@gmail.com">shengjiu.wang@gmail.com</a>&gt;</div><div><br></d=
iv><div>Best regards</div><div>wang shengjiu=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
---<br>
These patches could be squashed, but I opted for separation this patch<br>
is the actual functional change. Patch 1 is just preparation.<br>
<br>
=C2=A0sound/soc/fsl/fsl-asoc-card.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c<=
br>
index e956abfd50f8..bffa1048d31e 100644<br>
--- a/sound/soc/fsl/fsl-asoc-card.c<br>
+++ b/sound/soc/fsl/fsl-asoc-card.c<br>
@@ -609,6 +609,7 @@ static int fsl_asoc_card_probe(struct platform_device *=
pdev)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;card.dapm_routes =3D audio_map;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;card.num_dapm_routes =3D ARRAY_SIZE(au=
dio_map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;card.driver_name =3D DRIVER_NAME;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Diversify the card configurations */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (of_device_is_compatible(np, &quot;fsl,imx-a=
udio-cs42888&quot;)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 codec_dai_name =3D =
&quot;cs42888&quot;;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000224a0805f74fb7ce--
