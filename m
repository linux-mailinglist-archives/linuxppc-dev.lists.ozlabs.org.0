Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA3F4E2512
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 12:14:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMX7m1tSVz3bWq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 22:14:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BhteqGXg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BhteqGXg; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMS6845Q4z2xBk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:12:47 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id i8so11309891qtx.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 01:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w8WxpDi03iWCNVX/uFr39maVmxk/vSYYBrdnUfsRbk0=;
 b=BhteqGXg+Pn7xpMyGo516M8LYiHW9USQsdfdHYcgg01Az4565sFCdXsXTkpAXDlwrs
 M4Jpb/zofdtQwxCE3qgmgsTAqF0fYnEz5FeAr4eQZO4H1Y1Rkn44qEdHYX47FpZSK54m
 nq6IcZIJg9NcRCCcieOKukFmRQUvsw4nq7MwVLtHqrRV/KQY3UfaKVoi2kRYP4eBEq32
 uObt0MK8gfYT+pxQQbkAIlGE/rtUhbPt57W0z39r6rAZbp2BKxPd5ss7G37yPQKtu6R+
 HzbxT2vqI4ee3+m7jQ7HbfWA0C3CbPqA8u4fH9QdTWph5mEzP2kKGNZA8kV1q2PSEfai
 3dCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w8WxpDi03iWCNVX/uFr39maVmxk/vSYYBrdnUfsRbk0=;
 b=XWD3idW7XHG0AHCxIiGIuPVst7OVIq1C/Aw93waVAdOaQSl7daITx4h+/F2DDhf6gf
 xGOM2qLKo+dUD7cCvuTcwoybqDXcLmoX0EoMaCrjW8gna3fwlBafbJhmbVVuA419+zla
 CbxDOMPPmsDz2t49E5mr/PABWh0456ZJKZSF8QyCugg3YwJmD/wGlcnVU6oPHkCKQ8Pq
 r6KA0ZLqsOp6w/koCT90usnhxF3AhbfDWS/6wQnI4eXD65CM8eZshfnsKS7KKXCrsllY
 gYUtoihq1oetVKKVVcFZ5ea3bM35QVn7vptIAkI//wrOZd1JLYQAMbkmVjRjaoTGApuO
 Sw6g==
X-Gm-Message-State: AOAM533S1Wj5SfN4nGcFxpMY+63yM37VYW8UInRIk45kmth9uuZ6lqXj
 QugsjSHQ83M7dUEetjQtaRXD8dypqQeVBFea85g=
X-Google-Smtp-Source: ABdhPJxZs050Ub4KULZ6aBWxvddTPid/SWEhORqtQwEbpEyPlqgGXMQLeDI11jwN2qQEtF7PT8eZdU9S6bWV0FXm2OI=
X-Received: by 2002:ac8:5bd6:0:b0:2e1:c841:35f6 with SMTP id
 b22-20020ac85bd6000000b002e1c84135f6mr15379502qtb.120.1647850363792; Mon, 21
 Mar 2022 01:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220321065754.18307-1-tangmeng@uniontech.com>
In-Reply-To: <20220321065754.18307-1-tangmeng@uniontech.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 21 Mar 2022 16:12:32 +0800
Message-ID: <CAA+D8AME8Ojc-Cfr0VEeqSk6_Jb+EB1S9NtNzTM3JpKR2TySzA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl-asoc-card: Fix jack_event() always return 0
To: Meng Tang <tangmeng@uniontech.com>
Content-Type: multipart/alternative; boundary="00000000000093adbd05dab60f88"
X-Mailman-Approved-At: Mon, 21 Mar 2022 22:13:56 +1100
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000093adbd05dab60f88
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 21, 2022 at 2:58 PM Meng Tang <tangmeng@uniontech.com> wrote:

> Today, hp_jack_event and mic_jack_event always return 0. However,
> snd_soc_dapm_disable_pin and snd_soc_dapm_enable_pin may return a
> non-zero value, this will cause the user who calling hp_jack_event
> and mic_jack_event don't know whether the operation was really
> successfully.
>
> Signed-off-by: Meng Tang <tangmeng@uniontech.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl-asoc-card.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 370bc790c6ba..d9a0d4768c4d 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -462,11 +462,9 @@ static int hp_jack_event(struct notifier_block *nb,
> unsigned long event,
>
>         if (event & SND_JACK_HEADPHONE)
>                 /* Disable speaker if headphone is plugged in */
> -               snd_soc_dapm_disable_pin(dapm, "Ext Spk");
> +               return snd_soc_dapm_disable_pin(dapm, "Ext Spk");
>         else
> -               snd_soc_dapm_enable_pin(dapm, "Ext Spk");
> -
> -       return 0;
> +               return snd_soc_dapm_enable_pin(dapm, "Ext Spk");
>  }
>
>  static struct notifier_block hp_jack_nb = {
> @@ -481,11 +479,9 @@ static int mic_jack_event(struct notifier_block *nb,
> unsigned long event,
>
>         if (event & SND_JACK_MICROPHONE)
>                 /* Disable dmic if microphone is plugged in */
> -               snd_soc_dapm_disable_pin(dapm, "DMIC");
> +               return snd_soc_dapm_disable_pin(dapm, "DMIC");
>         else
> -               snd_soc_dapm_enable_pin(dapm, "DMIC");
> -
> -       return 0;
> +               return snd_soc_dapm_enable_pin(dapm, "DMIC");
>  }
>
>  static struct notifier_block mic_jack_nb = {
> --
> 2.20.1
>
>
>
>

--00000000000093adbd05dab60f88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 21, 2022 at 2:58 PM Meng =
Tang &lt;<a href=3D"mailto:tangmeng@uniontech.com">tangmeng@uniontech.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">To=
day, hp_jack_event and mic_jack_event always return 0. However,<br>
snd_soc_dapm_disable_pin and snd_soc_dapm_enable_pin may return a<br>
non-zero value, this will cause the user who calling hp_jack_event<br>
and mic_jack_event don&#39;t know whether the operation was really<br>
successfully.<br>
<br>
Signed-off-by: Meng Tang &lt;<a href=3D"mailto:tangmeng@uniontech.com" targ=
et=3D"_blank">tangmeng@uniontech.com</a>&gt;<br></blockquote><div><br></div=
><div>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com=
">shengjiu.wang@gmail.com</a>&gt;</div><div>=C2=A0</div><div>Best regards</=
div><div>Wang Shengjiu</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/fsl-asoc-card.c | 12 ++++--------<br>
=C2=A01 file changed, 4 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c<=
br>
index 370bc790c6ba..d9a0d4768c4d 100644<br>
--- a/sound/soc/fsl/fsl-asoc-card.c<br>
+++ b/sound/soc/fsl/fsl-asoc-card.c<br>
@@ -462,11 +462,9 @@ static int hp_jack_event(struct notifier_block *nb, un=
signed long event,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (event &amp; SND_JACK_HEADPHONE)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Disable speaker =
if headphone is plugged in */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snd_soc_dapm_disabl=
e_pin(dapm, &quot;Ext Spk&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return snd_soc_dapm=
_disable_pin(dapm, &quot;Ext Spk&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snd_soc_dapm_enable=
_pin(dapm, &quot;Ext Spk&quot;);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return snd_soc_dapm=
_enable_pin(dapm, &quot;Ext Spk&quot;);<br>
=C2=A0}<br>
<br>
=C2=A0static struct notifier_block hp_jack_nb =3D {<br>
@@ -481,11 +479,9 @@ static int mic_jack_event(struct notifier_block *nb, u=
nsigned long event,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (event &amp; SND_JACK_MICROPHONE)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Disable dmic if =
microphone is plugged in */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snd_soc_dapm_disabl=
e_pin(dapm, &quot;DMIC&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return snd_soc_dapm=
_disable_pin(dapm, &quot;DMIC&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snd_soc_dapm_enable=
_pin(dapm, &quot;DMIC&quot;);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return snd_soc_dapm=
_enable_pin(dapm, &quot;DMIC&quot;);<br>
=C2=A0}<br>
<br>
=C2=A0static struct notifier_block mic_jack_nb =3D {<br>
-- <br>
2.20.1<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000093adbd05dab60f88--
