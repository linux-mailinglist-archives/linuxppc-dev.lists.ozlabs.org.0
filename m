Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 068C94F6F5D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 02:56:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYjd26c1rz3bqs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 10:56:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LxwYZdZS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LxwYZdZS; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYN5z58mGz2xmZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 21:47:01 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id j21so3888988qta.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Apr 2022 04:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S2Nl3JdFZ9VubeYR4Ev6cWdmlBon32kGwXYpk8+f+RA=;
 b=LxwYZdZSrG1ZSZvC2j8L0ROB7bO/fcPauFWQzgzYZkcS1eg/uCAijF+Joo4OwntqkZ
 rcQivVbZym4PiF+XPOFaO7G4FmTEXfTaIg1XLwJaK2twNfyDERqLyUXxKA4D1EErbPuO
 gs+g70xOC/wdqS/6HPYswjFO708psNS+GggSWheX30ynHPJ77IRxM5I7Kue97yGG+JYs
 6lyngVmzcaJwS8UpWoU38j2aPBaTtWKTD7S7JQ5ZOSGSLCLcBAOSXUdp47MK8g7fRLtc
 9DwmSfGTKb9eki9cE0gE/6S+6SNNfVf0CF5WaLlw3iEdZHX+el5CS6zGiiFkbChDq5RV
 FEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S2Nl3JdFZ9VubeYR4Ev6cWdmlBon32kGwXYpk8+f+RA=;
 b=YIYJgGxe8BL33BJU+CkaC6AT0CDHbMBIuglrJStXctOl7YgDH2Hzvm0QRdSk2m3anl
 VT+sxvnZQAt2gMufsi0z2gr2f4WBz+v1ibTo+mIsgPOY8ioAfGEKAvFKHw0aQa91TUeP
 9sSjhLuYTCWOe/ICukgcYPVgnibWbgUk8AlsoY3hGO8rhcl987tNSytMPifRteXTlvZe
 Xk/gNPNZkhG7AUOmQ6D9fwmeJCEb9ymTQ+li2QinsMLcJQ5N+pMj/zqhSbHyXmBc7OG6
 TPt7fCUnNyA+cM5roUFIUYHZNL/8o3ts94JaIARdHUjrMPZ1zHFvTS+fwyVTe1S8N6y+
 YkKg==
X-Gm-Message-State: AOAM530JOMy/A6XuWE17t9PdckOcI2XEBXCb4evbtT85lkU++yxBo3v6
 DNN6M6et8hTUDl5TRBsvyHZNr+yRwzzi1SiBVps=
X-Google-Smtp-Source: ABdhPJwudmIThBJ67fOrCNhkhLGMOleJ/iIuMroubZ2D8FO7Q+AKvzRxzMScGMUrHG1Tyju1bTr6aH3JI8PdykEuT0M=
X-Received: by 2002:a37:a28e:0:b0:67b:eac:e839 with SMTP id
 l136-20020a37a28e000000b0067b0eace839mr5275153qke.80.1649245617996; Wed, 06
 Apr 2022 04:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220405155731.745413-1-a.fatoum@pengutronix.de>
In-Reply-To: <20220405155731.745413-1-a.fatoum@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 6 Apr 2022 19:46:47 +0800
Message-ID: <CAA+D8AMapYEGiiXjM84U90WcRwu3nMjXuZKPn3sQh9-y+AXg4w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: fix 1:1 bclk:mclk ratio support
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: multipart/alternative; boundary="00000000000035485305dbfaeb6b"
X-Mailman-Approved-At: Thu, 07 Apr 2022 10:55:27 +1000
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
Cc: alsa-devel@alsa-project.org, Sascha Hauer <kernel@pengutronix.de>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Viorel Suman <viorel.suman@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000035485305dbfaeb6b
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 5, 2022 at 11:58 PM Ahmad Fatoum <a.fatoum@pengutronix.de>
wrote:

> Refactoring in commit a50b7926d015 ("ASoC: fsl_sai: implement 1:1
> bclk:mclk ratio support") led to the bypass never happening
> as (ratio = 1) was caught in the existing if (ratio & 1) continue;
> check. The correct check sequence instead is:
>
>  - skip all ratios lower than one and higher than 512
>  - skip all odd ratios except for 1:1
>  - skip 1:1 ratio if and only if !support_1_1_ratio
>
> And for all others, calculate the appropriate divider. Adjust the
> code to facilitate this.
>
> Fixes: a50b7926d015 ("ASoC: fsl_sai: implement 1:1 bclk:mclk ratio
> support")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu


> ---
>  sound/soc/fsl/fsl_sai.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index a992d51568cc..50c377f16097 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -372,7 +372,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai,
> bool tx, u32 freq)
>                         continue;
>                 if (ratio == 1 && !support_1_1_ratio)
>                         continue;
> -               else if (ratio & 1)
> +               if ((ratio & 1) && ratio > 1)
>                         continue;
>
>                 diff = abs((long)clk_rate - ratio * freq);
> --
> 2.30.2
>
>

--00000000000035485305dbfaeb6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 5, 2022 at 11:58 PM Ahmad=
 Fatoum &lt;<a href=3D"mailto:a.fatoum@pengutronix.de">a.fatoum@pengutronix=
.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Refactoring in commit a50b7926d015 (&quot;ASoC: fsl_sai: implement 1:1<b=
r>
bclk:mclk ratio support&quot;) led to the bypass never happening<br>
as (ratio =3D 1) was caught in the existing if (ratio &amp; 1) continue;<br=
>
check. The correct check sequence instead is:<br>
<br>
=C2=A0- skip all ratios lower than one and higher than 512<br>
=C2=A0- skip all odd ratios except for 1:1<br>
=C2=A0- skip 1:1 ratio if and only if !support_1_1_ratio<br>
<br>
And for all others, calculate the appropriate divider. Adjust the<br>
code to facilitate this.<br>
<br>
Fixes: a50b7926d015 (&quot;ASoC: fsl_sai: implement 1:1 bclk:mclk ratio sup=
port&quot;)<br>
Signed-off-by: Ahmad Fatoum &lt;<a href=3D"mailto:a.fatoum@pengutronix.de" =
target=3D"_blank">a.fatoum@pengutronix.de</a>&gt;<br></blockquote><div><br>=
</div><div>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmai=
l.com">shengjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regard=
s</div><div>Wang shengjiu</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
---<br>
=C2=A0sound/soc/fsl/fsl_sai.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br>
index a992d51568cc..50c377f16097 100644<br>
--- a/sound/soc/fsl/fsl_sai.c<br>
+++ b/sound/soc/fsl/fsl_sai.c<br>
@@ -372,7 +372,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bo=
ol tx, u32 freq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ratio =3D=3D 1 =
&amp;&amp; !support_1_1_ratio)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (ratio &amp=
; 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((ratio &amp; 1)=
 &amp;&amp; ratio &gt; 1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diff =3D abs((long)=
clk_rate - ratio * freq);<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--00000000000035485305dbfaeb6b--
