Return-Path: <linuxppc-dev+bounces-4322-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 096DF9F6867
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 15:27:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCwxr5jnYz30VL;
	Thu, 19 Dec 2024 01:27:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734532064;
	cv=none; b=VUbzu0eJKP8tWKnGiikxpFR1y4elWqxWzXGoRgSOMsK0bWSD5OtbZNRjaEE5j7S50Nhz2RcnCIeeJ3GdTNddHJC/bCF4FtMBCgoBZglhwJs1FouGKuqTv26u3F8y13mzL5dEida/0/3pKp0XFsmZEchmIL2H3SHU8aw/INgcZqIfm7aRjkFZFCtS7YK/aQwLSDz+1YgHpu4jVKiHZjcZP4Jufl+hhShdP6fP4DlnGjEhR61wOCHRzF5PS7p4RoHIBnv3ct8EfzhWkMwSKGUkmf13aa5xWPELVsH4ohWk2OHweKvIGjZuHXorXy7BsmvGx8lM4r+c4siiD/0hsyuIkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734532064; c=relaxed/relaxed;
	bh=HHZAhcdXs0Hg1NP/pycwUKr3mXkGKuoLrl2acIx+2i8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGDCiiztRE/xnj59bMqyvbXIXXS3EaKJNiY/90mraGZwfzu/lwQVdVgvj+1cdrgyf55Lf+hiR1CW2h9YWRxjprRJK41pjicMaYgNk5us6gJsIByxaM0xEtvgjE3I6SVsyI5bBnxSSvdb43haZxo2dVBomTpfhwasTKRaHdSiCATKNDtBUf0bNU/FNpdWqC9ogGrcsWOam7U7unxYE5rlnwJ3zE7BccS4lHckrWNcTl1B790JceN0PLu7Vbp5WGKyObWdf5rSzZ78P6wkEz4ibAHQbS7OEgqyageFwYRI3ZcCDzTxIBmd37zyj00QD0tKhYbjpsJd4hhgI8u/og4MjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fqV9fW2u; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fqV9fW2u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCwxq0wHRz2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 01:27:42 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2efded08c79so4565378a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 06:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734532060; x=1735136860; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHZAhcdXs0Hg1NP/pycwUKr3mXkGKuoLrl2acIx+2i8=;
        b=fqV9fW2uGhlfLV/85hd5/uhOMyFYnpzcFfT6Ijbw+0nTBcO4iE4Bb7j23Z8rrXLtvi
         9cG+7LIlDaN9+w2DJ2RZj61tzKOCUGkN3AamzU1BdkBT0fD1Z5epMVmwW00PqUkJmc6B
         safRKzedSR9z6v5iT6rZA/q0gGa6OpwSSCySTp6WUj60R+vFD2KlSC5GwaSrnCr4RUoC
         LT53mmWFQH4q0fuQqp4GqVX/7Wd59Oq4KXXHrJmjZsGpBSQZ95OStbAO6Bofb3i2T6tC
         T+0IUCM7uVbb4FV7aO5OI1oM19WI1CgdAvmMIODntJ1F6XXzm4iIZR2q4fHq1kZGJmwo
         JRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734532060; x=1735136860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHZAhcdXs0Hg1NP/pycwUKr3mXkGKuoLrl2acIx+2i8=;
        b=Ws31DNViKICbcKECK9SJEpYK/Th+Kq1YeIZX0BBJNdMOgtxte6HT0JRCaWTACX+Zut
         vlzC9FYrqmqkpDSfLXj/CBPmzzt/rAIYqun9P4Mu9zoZbJUPj/+bktkFh+XSPrXKt6z1
         sp4ZGDNrc2VIX6WYtG+tQ+xMAeKMSDEXznttfyVp+4PX4tdeGNOGxRDKuhuS4eZJ9RrH
         G5XBP3cVv7Rc8wASQPRr6UCdr3WYXlChUsATk3ZjU6nTj+966U439Rn2/XgR1oIIDsOG
         zdIiGdmToxaNIpfJ0v7qsuPpJlUjCCAeIH9uC/x21jgmmAeBnISqfzRSPZAXzYVM9PzP
         23jw==
X-Forwarded-Encrypted: i=1; AJvYcCWuIuik/8NxcnjVfroRJEpA6RIbuBwlOiBninrKCYgJGGNOjbmYw3+iMDs8cSYwNrtodBsTyHmUEqrCEeY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1REeZ41e82bKcUMvtM38Km5PV0D3fPEcxzMbU0LtGzXKr/wFP
	pK4aLqJ3LnXqXJdF8yxaL0gpSWKSqJcAEETX8ByXXM9IGRgdWk3sXqcGDXAgnIPq7SbhIU2eDxH
	SA8CbsWjAuhNg5twqW3U0MpbOpQc=
X-Gm-Gg: ASbGnctP1WcAdxVoUIAL/24XR29rpJrhfzTuGkkl6x4onkJkz50yvzSPGRv5WzTgrEU
	g1AYk0GKnYUzxtVpXiHtaSliKKDbe9Py6fA==
X-Google-Smtp-Source: AGHT+IGx1BX/NBGR0bn2XRM/2u89UX23yPc8oKOfco6hOhCYehGChJ121D815qbMSClQurVhlifry+CfZ/jLDB0Dseg=
X-Received: by 2002:a17:90b:5287:b0:2ee:ba0c:1718 with SMTP id
 98e67ed59e1d1-2f2e93792d0mr4653201a91.37.1734532060281; Wed, 18 Dec 2024
 06:27:40 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241218024358.3022635-1-shengjiu.wang@nxp.com>
In-Reply-To: <20241218024358.3022635-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 18 Dec 2024 16:28:57 +0200
Message-ID: <CAEnQRZA2OzYRC-JZECXkz1q5PPKCx=0zOCep_QjKvq02k5gGFA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_m2m: force cast for snd_pcm_format_t type
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 18, 2024 at 4:46=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Fix sparse warnings:
>
> fsl_asrc_m2m.c:360:45: sparse: warning: incorrect type in argument 1 (dif=
ferent base types)
> fsl_asrc_m2m.c:360:45: sparse:    expected restricted snd_pcm_format_t [u=
sertype] pcm_forma
> fsl_asrc_m2m.c:360:45: sparse:    got unsigned int [usertype] format
> fsl_asrc_m2m.c:361:41: sparse: warning: incorrect type in assignment (dif=
ferent base types)
> fsl_asrc_m2m.c:361:41: sparse:    expected restricted snd_pcm_format_t
> fsl_asrc_m2m.c:361:41: sparse:    got unsigned int [usertype] format
> fsl_asrc_m2m.c:365:45: sparse: warning: incorrect type in argument 1 (dif=
ferent base types)
> fsl_asrc_m2m.c:365:45: sparse:    expected restricted snd_pcm_format_t [u=
sertype] pcm_forma
> fsl_asrc_m2m.c:365:45: sparse:    got unsigned int [usertype] pcm_format
> fsl_asrc_m2m.c:366:42: sparse: warning: incorrect type in assignment (dif=
ferent base types)
> fsl_asrc_m2m.c:366:42: sparse:    expected restricted snd_pcm_format_t
> fsl_asrc_m2m.c:366:42: sparse:    got unsigned int [usertype] pcm_format
> fsl_asrc_m2m.c:595:54: sparse: warning: incorrect type in assignment (dif=
ferent base types)
> fsl_asrc_m2m.c:595:54: sparse:    expected unsigned int [usertype] format=
s
> fsl_asrc_m2m.c:595:54: sparse:    got restricted snd_pcm_format_t [assign=
ed] [usertype] k
>
> Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412180043.PAA4t4sQ-lkp@i=
ntel.com/
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc_m2m.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index f266a3f5fd48..4906843e2a8f 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -357,13 +357,13 @@ static int fsl_asrc_m2m_comp_set_params(struct snd_=
compr_stream *stream,
>         if (ret)
>                 return -EINVAL;
>
> -       if (pcm_format_to_bits(params->codec.format) & cap.fmt_in)
> -               pair->sample_format[IN] =3D params->codec.format;
> +       if (pcm_format_to_bits((__force snd_pcm_format_t)params->codec.fo=
rmat) & cap.fmt_in)
> +               pair->sample_format[IN] =3D (__force snd_pcm_format_t)par=
ams->codec.format;
>         else
>                 return -EINVAL;
>
> -       if (pcm_format_to_bits(params->codec.pcm_format) & cap.fmt_out)
> -               pair->sample_format[OUT] =3D params->codec.pcm_format;
> +       if (pcm_format_to_bits((__force snd_pcm_format_t)params->codec.pc=
m_format) & cap.fmt_out)
> +               pair->sample_format[OUT] =3D (__force snd_pcm_format_t)pa=
rams->codec.pcm_format;
>         else
>                 return -EINVAL;
>
> @@ -592,7 +592,7 @@ static int fsl_asrc_m2m_fill_codec_caps(struct fsl_as=
rc *asrc,
>                                cap.rate_in,
>                                cap.rate_in_count * sizeof(__u32));
>                         codec->descriptor[j].num_sample_rates =3D cap.rat=
e_in_count;
> -                       codec->descriptor[j].formats =3D k;
> +                       codec->descriptor[j].formats =3D (__force __u32)k=
;
>                         codec->descriptor[j].pcm_formats =3D cap.fmt_out;
>                         codec->descriptor[j].src.out_sample_rate_min =3D =
cap.rate_out[0];
>                         codec->descriptor[j].src.out_sample_rate_max =3D
> --
> 2.34.1
>
>

