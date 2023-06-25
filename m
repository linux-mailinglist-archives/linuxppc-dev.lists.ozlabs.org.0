Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A44973D502
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 00:13:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DIu9Ny/7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qq4xZ6pvCz3bX8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 08:13:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DIu9Ny/7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qpsgg3mfMz2ydd
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jun 2023 23:45:50 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-54fb3c168fcso2097279a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jun 2023 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687700745; x=1690292745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9um6ptaOKAi61nB5XO7Dl3qnm1zJlbhB7/bYZ4qz2kM=;
        b=DIu9Ny/7jaoTNLkGF8/WA5PPNK+jRdr7UQ0oUK8gpDleZDBYKkEZTRWvV3q0WCVDkr
         GT9WGDqQAd6NM3Hv1OBgtl8/K9UJmgSuJRLqsWXBXFXz9xRKraV4dO1gJ8knuWzH89FD
         5ZBp0RxbEzte21jPDl7kMB+sxKGvhF7PqHUrgXYtdti8GcQuUInbzrjXCOqFFOZDBhMO
         IMo7/KqAaRWozkJvnoh0Iekll7VhVmEMiZQsJ3TqFXKC1y0eUPCjoaPqTzuR0cjVbcs2
         xJTlHHmr8A6MBvUO6sq0WtDEOTraSRGzMEPDoZJ5FSgONJaq67twdWxH0KwyA7EKLbZm
         hw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687700745; x=1690292745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9um6ptaOKAi61nB5XO7Dl3qnm1zJlbhB7/bYZ4qz2kM=;
        b=Yp7/MZp6UioUZvO1JyRVpRRpRubwnTB/GcZw6hAEaJJTPsuc6RDCCcexlDlPQ1G2qa
         anJgyIBSVAFNL85b+NBhWidOoj2k4lfT09bgY4h/2sf4idAAkQA7qSE9If9vX4N8MaUo
         LMcMVsUvub9+kO+DVY0spp89RtSRuXf9j6OSn4+6s6DEPtT/scD6jZADeWCV/m+Xo1Fl
         WGz1VmtImEZTNT6v2lonWZxKf4vRGQ07VpBDN2dAdANsLvhWueJcqj64eg21tstefjZH
         pryWM4gv9f/hBNGSv7Z1pGVoBmihCLGFsuIKkFH76cqAwj0hs/BcJTla8nJMy2bThE1h
         5L7g==
X-Gm-Message-State: AC+VfDyrJF8/rXINP+oe0+vDICvYYCxGEybS+0JJGkMRaAboYr35MQUE
	u9LQiwoGLW5pnbUkmfz8YCpjVtIviRa1pSkfJqs=
X-Google-Smtp-Source: ACHHUZ7vkizBq3N3yfXSjDuGR6Zka/LKQnjrdgn0dMXOeeTF+VYjwYV4P6nmFxHwa1+WFqaETkla1uT7JKiYDkyc20I=
X-Received: by 2002:a17:90b:3714:b0:261:685:95b6 with SMTP id
 mg20-20020a17090b371400b00261068595b6mr11812001pjb.13.1687700745344; Sun, 25
 Jun 2023 06:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230521225702.1608-1-rdunlap@infradead.org>
In-Reply-To: <20230521225702.1608-1-rdunlap@infradead.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 25 Jun 2023 21:45:34 +0800
Message-ID: <CAA+D8AMArTYodVhJuLfptvUDKUw4o7miPXYdaAsi_O=UdMKbpQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] ASoC: fsl MPC52xx drivers require PPC_BESTCOMM
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: multipart/alternative; boundary="00000000000069dbfb05fef4732d"
X-Mailman-Approved-At: Mon, 26 Jun 2023 08:12:51 +1000
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000069dbfb05fef4732d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 6:57=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:

> Both SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA select
> SND_SOC_MPC5200_AC97. The latter symbol depends on PPC_BESTCOMM,
> so the 2 former symbols should also depend on PPC_BESTCOMM since
> "select" does not follow any dependency chains.
>
> This prevents a kconfig warning and build errors:
>
> WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
>   Depends on [n]: SOUND [=3Dy] && !UML && SND [=3Dm] && SND_SOC [=3Dm] &&
> SND_POWERPC_SOC [=3Dm] && PPC_MPC52xx [=3Dy] && PPC_BESTCOMM [=3Dn]
>   Selected by [m]:
>   - SND_MPC52xx_SOC_PCM030 [=3Dm] && SOUND [=3Dy] && !UML && SND [=3Dm] &=
&
> SND_SOC [=3Dm] && SND_POWERPC_SOC [=3Dm] && PPC_MPC5200_SIMPLE [=3Dy]
>   - SND_MPC52xx_SOC_EFIKA [=3Dm] && SOUND [=3Dy] && !UML && SND [=3Dm] &&
> SND_SOC [=3Dm] && SND_POWERPC_SOC [=3Dm] && PPC_EFIKA [=3Dy]
>
> ERROR: modpost: "mpc5200_audio_dma_destroy"
> [sound/soc/fsl/mpc5200_psc_ac97.ko] undefined!
> ERROR: modpost: "mpc5200_audio_dma_create"
> [sound/soc/fsl/mpc5200_psc_ac97.ko] undefined!
>
> Fixes: 40d9ec14e7e1 ("ASoC: remove BROKEN from Efika and pcm030 fabric
> drivers")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Xiubo Li <Xiubo.Lee@gmail.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu

> ---
> v2: use correct email address for Mark Brown.
>
>  sound/soc/fsl/Kconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff -- a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
> --- a/sound/soc/fsl/Kconfig
> +++ b/sound/soc/fsl/Kconfig
> @@ -243,7 +243,7 @@ config SND_SOC_MPC5200_AC97
>
>  config SND_MPC52xx_SOC_PCM030
>         tristate "SoC AC97 Audio support for Phytec pcm030 and WM9712"
> -       depends on PPC_MPC5200_SIMPLE
> +       depends on PPC_MPC5200_SIMPLE && PPC_BESTCOMM
>         select SND_SOC_MPC5200_AC97
>         select SND_SOC_WM9712
>         help
> @@ -252,7 +252,7 @@ config SND_MPC52xx_SOC_PCM030
>
>  config SND_MPC52xx_SOC_EFIKA
>         tristate "SoC AC97 Audio support for bbplan Efika and STAC9766"
> -       depends on PPC_EFIKA
> +       depends on PPC_EFIKA && PPC_BESTCOMM
>         select SND_SOC_MPC5200_AC97
>         select SND_SOC_STAC9766
>         help
>

--00000000000069dbfb05fef4732d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 22, 2023 at 6:57=E2=80=AF=
AM Randy Dunlap &lt;<a href=3D"mailto:rdunlap@infradead.org">rdunlap@infrad=
ead.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Both SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA select<br>
SND_SOC_MPC5200_AC97. The latter symbol depends on PPC_BESTCOMM,<br>
so the 2 former symbols should also depend on PPC_BESTCOMM since<br>
&quot;select&quot; does not follow any dependency chains.<br>
<br>
This prevents a kconfig warning and build errors:<br>
<br>
WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97<br>
=C2=A0 Depends on [n]: SOUND [=3Dy] &amp;&amp; !UML &amp;&amp; SND [=3Dm] &=
amp;&amp; SND_SOC [=3Dm] &amp;&amp; SND_POWERPC_SOC [=3Dm] &amp;&amp; PPC_M=
PC52xx [=3Dy] &amp;&amp; PPC_BESTCOMM [=3Dn]<br>
=C2=A0 Selected by [m]:<br>
=C2=A0 - SND_MPC52xx_SOC_PCM030 [=3Dm] &amp;&amp; SOUND [=3Dy] &amp;&amp; !=
UML &amp;&amp; SND [=3Dm] &amp;&amp; SND_SOC [=3Dm] &amp;&amp; SND_POWERPC_=
SOC [=3Dm] &amp;&amp; PPC_MPC5200_SIMPLE [=3Dy]<br>
=C2=A0 - SND_MPC52xx_SOC_EFIKA [=3Dm] &amp;&amp; SOUND [=3Dy] &amp;&amp; !U=
ML &amp;&amp; SND [=3Dm] &amp;&amp; SND_SOC [=3Dm] &amp;&amp; SND_POWERPC_S=
OC [=3Dm] &amp;&amp; PPC_EFIKA [=3Dy]<br>
<br>
ERROR: modpost: &quot;mpc5200_audio_dma_destroy&quot; [sound/soc/fsl/mpc520=
0_psc_ac97.ko] undefined!<br>
ERROR: modpost: &quot;mpc5200_audio_dma_create&quot; [sound/soc/fsl/mpc5200=
_psc_ac97.ko] undefined!<br>
<br>
Fixes: 40d9ec14e7e1 (&quot;ASoC: remove BROKEN from Efika and pcm030 fabric=
 drivers&quot;)<br>
Signed-off-by: Randy Dunlap &lt;<a href=3D"mailto:rdunlap@infradead.org" ta=
rget=3D"_blank">rdunlap@infradead.org</a>&gt;<br>
Cc: Grant Likely &lt;<a href=3D"mailto:grant.likely@secretlab.ca" target=3D=
"_blank">grant.likely@secretlab.ca</a>&gt;<br>
Cc: Mark Brown &lt;<a href=3D"mailto:broonie@kernel.org" target=3D"_blank">=
broonie@kernel.org</a>&gt;<br>
Cc: Liam Girdwood &lt;<a href=3D"mailto:lgirdwood@gmail.com" target=3D"_bla=
nk">lgirdwood@gmail.com</a>&gt;<br>
Cc: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com" target=3D"=
_blank">shengjiu.wang@gmail.com</a>&gt;<br>
Cc: Xiubo Li &lt;<a href=3D"mailto:Xiubo.Lee@gmail.com" target=3D"_blank">X=
iubo.Lee@gmail.com</a>&gt;<br>
Cc: <a href=3D"mailto:alsa-devel@alsa-project.org" target=3D"_blank">alsa-d=
evel@alsa-project.org</a><br>
Cc: <a href=3D"mailto:linuxppc-dev@lists.ozlabs.org" target=3D"_blank">linu=
xppc-dev@lists.ozlabs.org</a><br>
Cc: Jaroslav Kysela &lt;<a href=3D"mailto:perex@perex.cz" target=3D"_blank"=
>perex@perex.cz</a>&gt;<br>
Cc: Takashi Iwai &lt;<a href=3D"mailto:tiwai@suse.com" target=3D"_blank">ti=
wai@suse.com</a>&gt;<br></blockquote><div><br></div><div>Acked-by: Shengjiu=
 Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">shengjiu.wang@gmail.co=
m</a>&gt;</div><div><br></div><div>Best regards</div><div>Wang shengjiu=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
v2: use correct email address for Mark Brown.<br>
<br>
=C2=A0sound/soc/fsl/Kconfig |=C2=A0 =C2=A0 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff -- a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig<br>
--- a/sound/soc/fsl/Kconfig<br>
+++ b/sound/soc/fsl/Kconfig<br>
@@ -243,7 +243,7 @@ config SND_SOC_MPC5200_AC97<br>
<br>
=C2=A0config SND_MPC52xx_SOC_PCM030<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;SoC AC97 Audio support for Phyte=
c pcm030 and WM9712&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on PPC_MPC5200_SIMPLE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on PPC_MPC5200_SIMPLE &amp;&amp; PPC_BE=
STCOMM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select SND_SOC_MPC5200_AC97<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select SND_SOC_WM9712<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
@@ -252,7 +252,7 @@ config SND_MPC52xx_SOC_PCM030<br>
<br>
=C2=A0config SND_MPC52xx_SOC_EFIKA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;SoC AC97 Audio support for bbpla=
n Efika and STAC9766&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on PPC_EFIKA<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on PPC_EFIKA &amp;&amp; PPC_BESTCOMM<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select SND_SOC_MPC5200_AC97<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select SND_SOC_STAC9766<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
</blockquote></div></div>

--00000000000069dbfb05fef4732d--
