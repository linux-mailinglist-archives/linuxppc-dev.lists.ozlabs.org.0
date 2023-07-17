Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6FB756280
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 14:08:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PzSTLKrH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4LTM5F05z30hY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 22:08:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PzSTLKrH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4Jdx19c9z2yFL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 20:45:55 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-262ff3a4659so3042919a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 03:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689590752; x=1690195552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eUAGq1bjx/BPoBhYV0omfN6CI0tBdhKBqPXS2ABCy3U=;
        b=PzSTLKrH2RfSP9lTwgMp4OEStlvck4KdDxwL+snA8YZZhhfiG3kOoUSIf3LmAZAycp
         2lixdta+PIUNtE07nbyU0udH3/GOBElYFSh2wPLtCuqnQLi4VEWyTdNDM/rXamg2kNcA
         yDSLnBz9bVwYhSygn3odBX9KHbe15r5KwcZhSekQje07Q2M0j0srulU++aX6UexRmhoK
         Xn3VRQsWeGksMMZ/jQsOWlQ60/JLOUO3OZ6KzRtIXkGroae63XNUZ31DqCAOJayK5bHG
         J5GChlROMwTKuwuBj8Aa5SUZl/LXkjse+sNSi4i/p8VlJtsu3LVZh012BYEPTtNw7ZCM
         8l1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689590752; x=1690195552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUAGq1bjx/BPoBhYV0omfN6CI0tBdhKBqPXS2ABCy3U=;
        b=lGJ3F7P7tl+p05QopQ6umtID3QfNbw7ZqdbJbV1uGNibwGHeJHRlT5Xu+DIn+8Bzr+
         3qgQsETOcv5KZuLNuyoUCyyqockdNYus0ZNbtMNdKC9/d/tcIsvd94xiRCg7K+CdrEkg
         W30fO/pwSKd/E1zc8c2GSF2bocvthZHLzftfMl+G1ZQWYTMjRZev51qh/PNQerDj7w9V
         +ozQ+74o8sh1S/YvRJp9ykLFaQ+lBwb73t0Ko8DYjD9ZZ0ystvynxnymheA2Ol7I+S7Q
         eJM4MjU5r4TVK697qVtvjOAKaLKyBmr8UpRFaYgebkaqPaFdnM5KhUgC29uQnxx2xWMe
         Ub5A==
X-Gm-Message-State: ABy/qLZIsrSk0VCgjr9NEosyZx/5YcTJPmudpSm3sSE6MDYw/b9EibDl
	0sWS+72kjIQj8x6zo5+G7mNQerzZ20s6bwAr8lI=
X-Google-Smtp-Source: APBJJlHtEpAq0w+fiTyFHZYwHtUjXKpGutqItTzMX2S4gY+mUjtKAIeRPejvQTrDqeOQb12dwhV7URqBft+iPxx42Rw=
X-Received: by 2002:a17:90b:709:b0:260:fd64:a20 with SMTP id
 s9-20020a17090b070900b00260fd640a20mr11121947pjz.9.1689590752039; Mon, 17 Jul
 2023 03:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230712124934.32232-1-matuszpd@gmail.com>
In-Reply-To: <20230712124934.32232-1-matuszpd@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 17 Jul 2023 18:45:40 +0800
Message-ID: <CAA+D8AM0Pf02mC+vBkCi=jh5mcO0TBxEa20wogO=yrjtDDg0OA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Disable bit clock with transmitter
To: Matus Gajdos <matuszpd@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009756650600ac8025"
X-Mailman-Approved-At: Mon, 17 Jul 2023 22:06:13 +1000
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000009756650600ac8025
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 8:53=E2=80=AFPM Matus Gajdos <matuszpd@gmail.com> w=
rote:

> Otherwise bit clock remains running writing invalid data to the DAC.
>
> Signed-off-by: Matus Gajdos <matuszpd@gmail.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu


> ---
>  sound/soc/fsl/fsl_sai.c | 2 +-
>  sound/soc/fsl/fsl_sai.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 5e09f634c61b..dcc7fbe7acac 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -719,7 +719,7 @@ static void fsl_sai_config_disable(struct fsl_sai
> *sai, int dir)
>         u32 xcsr, count =3D 100;
>
>         regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
> -                          FSL_SAI_CSR_TERE, 0);
> +                          FSL_SAI_CSR_TERE | FSL_SAI_CSR_BCE, 0);
>
>         /* TERE will remain set till the end of current frame */
>         do {
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index 8254c3547b87..550df87b6a06 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -91,6 +91,7 @@
>  /* SAI Transmit/Receive Control Register */
>  #define FSL_SAI_CSR_TERE       BIT(31)
>  #define FSL_SAI_CSR_SE         BIT(30)
> +#define FSL_SAI_CSR_BCE                BIT(28)
>  #define FSL_SAI_CSR_FR         BIT(25)
>  #define FSL_SAI_CSR_SR         BIT(24)
>  #define FSL_SAI_CSR_xF_SHIFT   16
> --
> 2.25.1
>
>

--0000000000009756650600ac8025
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 12, 2023 at 8:53=E2=80=AF=
PM Matus Gajdos &lt;<a href=3D"mailto:matuszpd@gmail.com">matuszpd@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Otherwise bit clock remains running writing invalid data to the DAC.<br>
<br>
Signed-off-by: Matus Gajdos &lt;<a href=3D"mailto:matuszpd@gmail.com" targe=
t=3D"_blank">matuszpd@gmail.com</a>&gt;<br></blockquote><div><br></div><div=
>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">she=
ngjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards</div><di=
v>Wang Shengjiu</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
---<br>
=C2=A0sound/soc/fsl/fsl_sai.c | 2 +-<br>
=C2=A0sound/soc/fsl/fsl_sai.h | 1 +<br>
=C2=A02 files changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br>
index 5e09f634c61b..dcc7fbe7acac 100644<br>
--- a/sound/soc/fsl/fsl_sai.c<br>
+++ b/sound/soc/fsl/fsl_sai.c<br>
@@ -719,7 +719,7 @@ static void fsl_sai_config_disable(struct fsl_sai *sai,=
 int dir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 xcsr, count =3D 100;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 regmap_update_bits(sai-&gt;regmap, FSL_SAI_xCSR=
(tx, ofs),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 FSL_SAI_CSR_TERE, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 FSL_SAI_CSR_TERE | FSL_SAI_CSR_BCE, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* TERE will remain set till the end of current=
 frame */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 do {<br>
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h<br>
index 8254c3547b87..550df87b6a06 100644<br>
--- a/sound/soc/fsl/fsl_sai.h<br>
+++ b/sound/soc/fsl/fsl_sai.h<br>
@@ -91,6 +91,7 @@<br>
=C2=A0/* SAI Transmit/Receive Control Register */<br>
=C2=A0#define FSL_SAI_CSR_TERE=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(31)<br>
=C2=A0#define FSL_SAI_CSR_SE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(30)<br>
+#define FSL_SAI_CSR_BCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(28)<br>
=C2=A0#define FSL_SAI_CSR_FR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(25)<br>
=C2=A0#define FSL_SAI_CSR_SR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(24)<br>
=C2=A0#define FSL_SAI_CSR_xF_SHIFT=C2=A0 =C2=A016<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000009756650600ac8025--
