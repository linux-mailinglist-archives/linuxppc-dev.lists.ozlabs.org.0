Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 168356C2710
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 02:12:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgYVy4lc2z3cM6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 12:12:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TDLldTic;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TDLldTic;
	dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pg5c805s5z3c6V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 18:15:35 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id t15so9298004wrz.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 00:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679296530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dY92vEzHOiV+rG421ld252/xmXBkyzgS2OHqebmaw2Y=;
        b=TDLldTicqspc9s1Psp4WFXM8D1A71UjYcc3DBGVJ8aJLJVzaffglVufgUdf93s0Lcq
         6Mhyjsg5miExtKZtuIXP6xYILZ5YBNWrhnVHD7bkfnWQxZ9/e0x0tvlf96KppEpGhIQB
         wJJBRoDGe9Pptc+dbY6caRmGejyJJJHlS/kVnGxP7enYui5mONkTHqWllfUKE0Yij/EY
         tmB6j3vxRwi2kwYT4D+QokKuGoMFIYi4yxJb0OjxDxfxeFUF1wfkpY13HnCqwPgA7pd1
         rcGg/ADwMUPM+hXSaYQC+loTBcAtI7ak+FmdwpmxHDPhJUjFyPkNirlQRKtcX7rAPv0W
         OXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679296530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dY92vEzHOiV+rG421ld252/xmXBkyzgS2OHqebmaw2Y=;
        b=hm+JNz0PdT8yJTaVzeEsmCStXsLDqQjXPrsg/9cbSkRnm7leVN5dBpflTqxqB+/Oo9
         ZeJA/gaMy6E+Pey2d56yNSeeuJMp7yn560/rw4FUfJk0ofyzTI3KtZl+HTiP7IbZDMLE
         eZl22GyQv+bdsbc9IqvX83XBu2c9WmMzqf2n56GxgVDYyRBzQrs+o1LByrDacUv4/Vj4
         eESt8QwOTwinAuRxOwSWQn+pksmY7dSBHTejpFp1GpC2PWp8Wu5qU+cnp9pYGi6jmEEi
         cdtjc9mhOzXdkQoc7cv8N3uTVrPGRrma2Gku2K0g0VeswhFs/1lK/RKeAVzAizj5rLti
         pVHA==
X-Gm-Message-State: AO0yUKVTFDSef6RwBAjBmEfLDTOx89yiwMECIBs/CbKlkurn2jEmv1lD
	0i0yDXqqFZ5k6n7GGFxDdEVoDg4fAy8h6dyXC+s=
X-Google-Smtp-Source: AK7set8bjiLJmu3eUzsHxI8KBE9iHVveKhlY4rBBQM8zc10nf1T3fnhAqGB41UEVlQTJakshmB93LPsWh9KA8n+x5Vs=
X-Received: by 2002:a5d:588c:0:b0:2cf:e75a:eaf0 with SMTP id
 n12-20020a5d588c000000b002cfe75aeaf0mr3099156wrf.0.1679296530304; Mon, 20 Mar
 2023 00:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 20 Mar 2023 15:15:18 +0800
Message-ID: <CAA+D8AMrzi7_ZBV57emtosfRVUTXzmu3KtiMaxXBRtY3G66O4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: fsl: define a common DRIVER_NAME
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Content-Type: multipart/alternative; boundary="00000000000029534405f74fb180"
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

--00000000000029534405f74fb180
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2023 at 8:36=E2=80=AFPM Alexander Stein <
alexander.stein@ew.tq-group.com> wrote:

> Instead of copying the driver name manually, use a common define.
> No functional change.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
wang shengjiu

> ---
>  sound/soc/fsl/fsl-asoc-card.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
> index cdfca9fd1eb0..e956abfd50f8 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -28,6 +28,8 @@
>  #include "../codecs/wm8994.h"
>  #include "../codecs/tlv320aic31xx.h"
>
> +#define DRIVER_NAME "fsl-asoc-card"
> +
>  #define CS427x_SYSCLK_MCLK 0
>
>  #define RX 0
> @@ -915,7 +917,7 @@ MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
>  static struct platform_driver fsl_asoc_card_driver =3D {
>         .probe =3D fsl_asoc_card_probe,
>         .driver =3D {
> -               .name =3D "fsl-asoc-card",
> +               .name =3D DRIVER_NAME,
>                 .pm =3D &snd_soc_pm_ops,
>                 .of_match_table =3D fsl_asoc_card_dt_ids,
>         },
> @@ -924,5 +926,5 @@ module_platform_driver(fsl_asoc_card_driver);
>
>  MODULE_DESCRIPTION("Freescale Generic ASoC Sound Card driver with ASRC")=
;
>  MODULE_AUTHOR("Nicolin Chen <nicoleotsuka@gmail.com>");
> -MODULE_ALIAS("platform:fsl-asoc-card");
> +MODULE_ALIAS("platform:" DRIVER_NAME);
>  MODULE_LICENSE("GPL");
> --
> 2.34.1
>
>

--00000000000029534405f74fb180
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 16, 2023 at 8:36=E2=80=AF=
PM Alexander Stein &lt;<a href=3D"mailto:alexander.stein@ew.tq-group.com">a=
lexander.stein@ew.tq-group.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Instead of copying the driver name manually, =
use a common define.<br>
No functional change.<br>
<br>
Signed-off-by: Alexander Stein &lt;<a href=3D"mailto:alexander.stein@ew.tq-=
group.com" target=3D"_blank">alexander.stein@ew.tq-group.com</a>&gt;<br></b=
lockquote><div><br></div><div>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto=
:shengjiu.wang@gmail.com">shengjiu.wang@gmail.com</a>&gt;</div><div><br></d=
iv><div>Best regards</div><div>wang shengjiu=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
---<br>
=C2=A0sound/soc/fsl/fsl-asoc-card.c | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c<=
br>
index cdfca9fd1eb0..e956abfd50f8 100644<br>
--- a/sound/soc/fsl/fsl-asoc-card.c<br>
+++ b/sound/soc/fsl/fsl-asoc-card.c<br>
@@ -28,6 +28,8 @@<br>
=C2=A0#include &quot;../codecs/wm8994.h&quot;<br>
=C2=A0#include &quot;../codecs/tlv320aic31xx.h&quot;<br>
<br>
+#define DRIVER_NAME &quot;fsl-asoc-card&quot;<br>
+<br>
=C2=A0#define CS427x_SYSCLK_MCLK 0<br>
<br>
=C2=A0#define RX 0<br>
@@ -915,7 +917,7 @@ MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);<br>
=C2=A0static struct platform_driver fsl_asoc_card_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe =3D fsl_asoc_card_probe,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;fsl=
-asoc-card&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D DRIVER_NA=
ME,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pm =3D &amp;snd_so=
c_pm_ops,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .of_match_table =3D=
 fsl_asoc_card_dt_ids,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
@@ -924,5 +926,5 @@ module_platform_driver(fsl_asoc_card_driver);<br>
<br>
=C2=A0MODULE_DESCRIPTION(&quot;Freescale Generic ASoC Sound Card driver wit=
h ASRC&quot;);<br>
=C2=A0MODULE_AUTHOR(&quot;Nicolin Chen &lt;<a href=3D"mailto:nicoleotsuka@g=
mail.com" target=3D"_blank">nicoleotsuka@gmail.com</a>&gt;&quot;);<br>
-MODULE_ALIAS(&quot;platform:fsl-asoc-card&quot;);<br>
+MODULE_ALIAS(&quot;platform:&quot; DRIVER_NAME);<br>
=C2=A0MODULE_LICENSE(&quot;GPL&quot;);<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--00000000000029534405f74fb180--
