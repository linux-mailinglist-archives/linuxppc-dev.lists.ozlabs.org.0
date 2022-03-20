Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4384E1E21
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Mar 2022 23:12:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMBn46bcmz3bfs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:12:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FfWmFrmG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FfWmFrmG; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KLyZT0JYKz3050
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 00:02:08 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id kl29so3457531qvb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Mar 2022 06:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gcqW7UEzOxBVIMD41+JK63ucodStg12ZivivGDJ0W6o=;
 b=FfWmFrmGHALDvL4MH8F2YLXXFyioPrRSCqFEqBQHOFAe1GzMRkzG1+kC1Vt3P7CdL/
 f9FVI4HECemmhYuoC3PQsfex8TnvaDby54wpfVE4i/jfbjnjL6h7LPkMA+36gv2Enk0Q
 OVgKseA+QBk8b5UIWQzcpS2zNfEeZJUO5+OrNGHR277cK57nzRBhhbb1sNa7Gsw11JaT
 4h1YYnEgKQ/ChwYoRTxRck98XrF/gPQvNa+Dh89ecjljCl/Tux5bHKhtBjDKxy8CnXuM
 tDwD90eIHq1YpUUFgdcp1CT7JHlRWYwcGlofNmtxoYiJroCR0eFYZ29ALG4lBoHXnhPK
 89xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gcqW7UEzOxBVIMD41+JK63ucodStg12ZivivGDJ0W6o=;
 b=MsasZv9aUNuUlkgTDrxKZ3XfNp1zBs8YY8Kp4AX4lSu71AsembmrdL7ii/OPusy7cH
 Pbh4J9T9bqb6JeaOtpg+mquxrnctE3YVX+/vWXHLJEMRtnEfkkwB95nqYmHQF+ofiZ92
 VtKWJ+nOu9nE1OnM3BK//Cz5J2V9FvkCz6vYofAQyGUu1i2srjTmMqpNhqjNswnxsBdV
 f98/3xlNoebATupi5z+JYJz5DKnujlRxPAr4Il8XRuWXRtnOEZzIWq52F3/BaN+dSVkD
 wWWEI4YHbaJ+w2wyf91Ygo4MafRRzSZddG1ZJG476YsPqVO9kANDUCBhx1JPR08YnE/6
 /uoA==
X-Gm-Message-State: AOAM531EqWOPmR21U3WDohdkziMooV1zoB2bv6WOhiMekO6tGaDlf1cn
 C8gg5qctUWlR2G7lCShWrURvSPZ3w8Koz9n9lvs=
X-Google-Smtp-Source: ABdhPJz9f2B/NfP6ZH1mQTpSC0rxnf2LlpHCnhNEJPE/jjb3sXdjiEJXss/Q+Y+2AwHgvuArm3fA/P++Ur+6HqS0BOA=
X-Received: by 2002:a05:6214:c67:b0:435:bbb2:5c40 with SMTP id
 t7-20020a0562140c6700b00435bbb25c40mr12738681qvj.21.1647781323142; Sun, 20
 Mar 2022 06:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220318093536.15385-1-tangmeng@uniontech.com>
In-Reply-To: <20220318093536.15385-1-tangmeng@uniontech.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 20 Mar 2022 21:01:52 +0800
Message-ID: <CAA+D8APyyp1j=kSsTxYQFHqqajU6KbdAYmenkFtfxBPaBMO2uA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Fix jack_event() always return 0
To: Meng Tang <tangmeng@uniontech.com>
Content-Type: multipart/alternative; boundary="0000000000006efa2005daa5fc11"
X-Mailman-Approved-At: Mon, 21 Mar 2022 09:10:59 +1100
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

--0000000000006efa2005daa5fc11
Content-Type: text/plain; charset="UTF-8"

Hi

On Fri, Mar 18, 2022 at 5:35 PM Meng Tang <tangmeng@uniontech.com> wrote:

> Today, hp_jack_event and mic_jack_event always return 0. However,
> snd_soc_dapm_disable_pin and snd_soc_dapm_enable_pin may return a
> non-zero value, this will cause the user who calling hp_jack_event
> and mic_jack_event don't know whether the operation was really
> successfully.
>
> This patch corrects the behavior by properly returning 1 when the
> value gets updated.
>
> Signed-off-by: Meng Tang <tangmeng@uniontech.com>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 370bc790c6ba..f2641c2cb047 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -457,16 +457,18 @@ static int fsl_asoc_card_audmux_init(struct
> device_node *np,
>  static int hp_jack_event(struct notifier_block *nb, unsigned long event,
>                          void *data)
>  {
> +       int ret;
> +
>         struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
>         struct snd_soc_dapm_context *dapm = &jack->card->dapm;

The "int ret" should be here.
The variables have order, the short one should be behind the long one.


>




>         if (event & SND_JACK_HEADPHONE)
>                 /* Disable speaker if headphone is plugged in */
> -               snd_soc_dapm_disable_pin(dapm, "Ext Spk");
> +               ret = snd_soc_dapm_disable_pin(dapm, "Ext Spk");
>         else
> -               snd_soc_dapm_enable_pin(dapm, "Ext Spk");
> +               ret = snd_soc_dapm_enable_pin(dapm, "Ext Spk");
>
> -       return 0;
> +       return ret;
>  }
>
>  static struct notifier_block hp_jack_nb = {
> @@ -476,16 +478,18 @@ static struct notifier_block hp_jack_nb = {
>  static int mic_jack_event(struct notifier_block *nb, unsigned long event,
>                           void *data)
>  {
> +       int ret;
> +
>         struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
>         struct snd_soc_dapm_context *dapm = &jack->card->dapm;
>
ditto.

>
>         if (event & SND_JACK_MICROPHONE)
>                 /* Disable dmic if microphone is plugged in */
> -               snd_soc_dapm_disable_pin(dapm, "DMIC");
> +               ret = snd_soc_dapm_disable_pin(dapm, "DMIC");
>         else
> -               snd_soc_dapm_enable_pin(dapm, "DMIC");
> +               ret = snd_soc_dapm_enable_pin(dapm, "DMIC");
>
> -       return 0;
> +       return ret;
>  }
>
>  static struct notifier_block mic_jack_nb = {
> --
> 2.20.1
>
>
>
>

--0000000000006efa2005daa5fc11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Mar 18, 2022 at 5:35 PM Meng Tang &lt;<a hr=
ef=3D"mailto:tangmeng@uniontech.com">tangmeng@uniontech.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Today, hp_jack_e=
vent and mic_jack_event always return 0. However,<br>
snd_soc_dapm_disable_pin and snd_soc_dapm_enable_pin may return a<br>
non-zero value, this will cause the user who calling hp_jack_event<br>
and mic_jack_event don&#39;t know whether the operation was really<br>
successfully.<br>
<br>
This patch corrects the behavior by properly returning 1 when the<br>
value gets updated.<br>
<br>
Signed-off-by: Meng Tang &lt;<a href=3D"mailto:tangmeng@uniontech.com" targ=
et=3D"_blank">tangmeng@uniontech.com</a>&gt;<br>
---<br>
=C2=A0sound/soc/fsl/fsl-asoc-card.c | 16 ++++++++++------<br>
=C2=A01 file changed, 10 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c<=
br>
index 370bc790c6ba..f2641c2cb047 100644<br>
--- a/sound/soc/fsl/fsl-asoc-card.c<br>
+++ b/sound/soc/fsl/fsl-asoc-card.c<br>
@@ -457,16 +457,18 @@ static int fsl_asoc_card_audmux_init(struct device_no=
de *np,<br>
=C2=A0static int hp_jack_event(struct notifier_block *nb, unsigned long eve=
nt,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0void *data)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct snd_soc_jack *jack =3D (struct snd_soc_j=
ack *)data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct snd_soc_dapm_context *dapm =3D &amp;jack=
-&gt;card-&gt;dapm;</blockquote><div>The &quot;int ret&quot; should be here=
.</div><div>The variables have order, the short one should be behind the lo=
ng one.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (event &amp; SND_JACK_HEADPHONE)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Disable speaker =
if headphone is plugged in */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snd_soc_dapm_disabl=
e_pin(dapm, &quot;Ext Spk&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D snd_soc_dap=
m_disable_pin(dapm, &quot;Ext Spk&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snd_soc_dapm_enable=
_pin(dapm, &quot;Ext Spk&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D snd_soc_dap=
m_enable_pin(dapm, &quot;Ext Spk&quot;);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
=C2=A0static struct notifier_block hp_jack_nb =3D {<br>
@@ -476,16 +478,18 @@ static struct notifier_block hp_jack_nb =3D {<br>
=C2=A0static int mic_jack_event(struct notifier_block *nb, unsigned long ev=
ent,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 void *data)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct snd_soc_jack *jack =3D (struct snd_soc_j=
ack *)data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct snd_soc_dapm_context *dapm =3D &amp;jack=
-&gt;card-&gt;dapm;<br></blockquote><div>ditto.=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (event &amp; SND_JACK_MICROPHONE)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Disable dmic if =
microphone is plugged in */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snd_soc_dapm_disabl=
e_pin(dapm, &quot;DMIC&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D snd_soc_dap=
m_disable_pin(dapm, &quot;DMIC&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snd_soc_dapm_enable=
_pin(dapm, &quot;DMIC&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D snd_soc_dap=
m_enable_pin(dapm, &quot;DMIC&quot;);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
=C2=A0static struct notifier_block mic_jack_nb =3D {<br>
-- <br>
2.20.1<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000006efa2005daa5fc11--
