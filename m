Return-Path: <linuxppc-dev+bounces-6179-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CB0A3582D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 08:48:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvPLd3nYjz30TG;
	Fri, 14 Feb 2025 18:48:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::12b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739519321;
	cv=none; b=hsfYITlMarW8GyJKfxHbjN1aXl/dxgWMmTuFz8ZuT3uSk2VktW8HJJVkOOm7wczlKBD6hRFxa8icAIXCXTwrxJBiufOXM8hmxwhpRXyMHDZLPbwN0Ra2caoplZZqo1dRRXAFasohBztNIrzyBeF4sovk1V04G3M971Sy7vdN2o9az+8a1ozL0LHtcIvJl/I8UHEkziKTCMACyo2P8jk7BTC/XDktBPl7kci75Wb+TBt1ikCOqEXhtYo6K/pov1oUScjljh2Fg5Kc4fQmFwLyeoCeeWk6+61nO5k2/hADUYzJweGquDkoX5pS3vUcBKfRhzpqJc2B+mms8gSzca2mfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739519321; c=relaxed/relaxed;
	bh=731rFs0ET7FwAGuOR3hr8cPMl7QFrpHqNeXFCTqMoFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJEQ4rtqdIhx0W4phh7XNQR+pD0UTEexM1nuZ3NgOSChe2UJbPWcTv2S+0PvY7LFzzqmsxyApAv7oJoqLoiJ4ZkqaBnKZrjQlK5H0qAe2fdgxKOCuCqQt4bNPpjWrRsXgtQkQvZQOH6gPZItdkQyuRBCHh6SdfQIdWfwZyhp8RxyDsr7CAuWzQuEv9DvPkHenZOcVl0ucCLbd6fPWGMZnYSGoSCvDLdTPKuLieJmY2uhdnKpbQ6qnhjPFLo90iuj8a6K6mFJELuRqPqTWb/oAjFrMQobdLtYTfpECYdthhHoisARG0DtWR6zfbN6PUBT21snET9x/QTteHX1b4rzlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Pao9xUMs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Pao9xUMs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvPLb4zrZz30Gq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 18:48:38 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3d18f97e98aso11243425ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 23:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739519316; x=1740124116; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=731rFs0ET7FwAGuOR3hr8cPMl7QFrpHqNeXFCTqMoFY=;
        b=Pao9xUMskpReAKqrvh9cpKVMh8xyvi+QatSWRJVNU4Y4BHGNa/SFvC27gdDONRa+/K
         LSG3PMrbUILkBxsh4vF57uglAfcQdF/4hgaTSTak/EHKpQcGt8DHNFQB0xrlY8D0ppwk
         pJN9Lmkb6tBgepAFi2WYbBJzzL37dTCMKoVxoO3T7/TMvnt9DtDTw1Y7d03Zwzw7aQOo
         VxcMGC5MoLhuByyVxD4O+8uVNPk4I4UUaQ1oeCGfmuGPkkRdjAIRzSnIcHFumEFpKYar
         vNKpEJaKnwOqjT+gmSaY44nsxETG8mxJYh4g8XTgY2KHafB1VIlMwqz4VV8EzmDdzGY2
         sNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739519316; x=1740124116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=731rFs0ET7FwAGuOR3hr8cPMl7QFrpHqNeXFCTqMoFY=;
        b=CdL6H/aaTGASK/hvhOPHh5jkdHc4LciO+GjVzxIv7bJvctQRMkmWNvqhrf2u7pYLSI
         7kdZ3AG8ffq4YxN7MV2CZusflKdxPE6/w6+izpppEdNmr0ISfwrSKZ7Y59L29KVHxWpX
         7up1O/AwWPRl7ePQNbSOgiV+xfCmYX5lDa5pBs4t9Y+YawkpWBIvxP1NxGk02jDUBdsw
         Ec9jv5tDIeLVmllX+LRevpO6no2sCe7fesLycEPq/dD1o97LY0fo63RNNIZJiHulBUsS
         DZG3N7zIaHoSJWyM5fXQ5iwaBM6luGZu/p4Ze0PzYJ5uFrBEx2ueRjMUuIwqVitHYZPB
         6toQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0l2QmRi3/YWrIqvMuUrLtRc1Ffx3bYnNRmlQBFvM0ZwwrNzircIV4HXzNO9o0U22Kp8m1GqLMrjhUf+s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyR0k/PimX9hiQWJSHie9q4ic/RLZqVCHTjNa1wtB5YqurIQZGp
	LI166DBYZbT3SQfYHiMl5yE7cs+R4jMq1YKFUvSeU+tOiQBpnT/V+4XlJb9OQC+cu4ILXu60QXX
	/9JhVH//vB2QsVzpeuHUvL+V5Wlk=
X-Gm-Gg: ASbGnctnLYZJCIGsjaG3d+eYfWBpoezunRmG35yw4VkEJ0tNXXpgntYF6JCZTk7Uzp5
	wUM3gNjb63VRv+PBSthUmoMBHoePRz8FZj6Huk2fc+6CcpX9I8tYOeH1AnOaP6tLjCJQXjzPW
X-Google-Smtp-Source: AGHT+IE22ipUxc6uvPnQnBkwGLFiXLKEtvMmYd7z3k09O1lrpjChkZ/Hbhfrn7x//qqetG+GUnCsfUC8k47APTHaH6M=
X-Received: by 2002:a05:6e02:3689:b0:3d0:11ff:a782 with SMTP id
 e9e14a558f8ab-3d18c231101mr54357335ab.9.1739519315915; Thu, 13 Feb 2025
 23:48:35 -0800 (PST)
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
References: <20250214071747.229719-1-chancel.liu@nxp.com>
In-Reply-To: <20250214071747.229719-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 14 Feb 2025 15:48:24 +0800
X-Gm-Features: AWEUYZm_evk9kNSA0Rf-nfbp1PH6GJ4BxmVu1WRP18sINX7eFOA6CuSK3yph-h8
Message-ID: <CAA+D8AMbW=iWZ1VCWuZvE2u4EHy9FeEMgDBxpTO9XupZeyUzCA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Rename stream name of dai driver
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 14, 2025 at 3:18=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> If stream names of dai driver are duplicated there'll be warnings when
> machine driver tries to add widgets on a route:
>
> [    8.831335] fsl-asoc-card sound-wm8960: ASoC: sink widget CPU-Playback=
 overwritten
> [    8.839917] fsl-asoc-card sound-wm8960: ASoC: source widget CPU-Captur=
e overwritten
>
> Use different stream names to avoid such warnings.

Only this change should cause issue for imx-audmix driver.

Best regards
Shengjiu Wang

>
> Fixes: 15c958390460 ("ASoC: fsl_sai: Add separate DAI for transmitter and=
 receiver")
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index c4eb87c5d39e..9f33dd11d47f 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -994,10 +994,10 @@ static struct snd_soc_dai_driver fsl_sai_dai_templa=
te[] =3D {
>         {
>                 .name =3D "sai-tx",
>                 .playback =3D {
> -                       .stream_name =3D "CPU-Playback",
> +                       .stream_name =3D "SAI-Playback",
>                         .channels_min =3D 1,
>                         .channels_max =3D 32,
> -                               .rate_min =3D 8000,
> +                       .rate_min =3D 8000,
>                         .rate_max =3D 2822400,
>                         .rates =3D SNDRV_PCM_RATE_KNOT,
>                         .formats =3D FSL_SAI_FORMATS,
> @@ -1007,7 +1007,7 @@ static struct snd_soc_dai_driver fsl_sai_dai_templa=
te[] =3D {
>         {
>                 .name =3D "sai-rx",
>                 .capture =3D {
> -                       .stream_name =3D "CPU-Capture",
> +                       .stream_name =3D "SAI-Capture",
>                         .channels_min =3D 1,
>                         .channels_max =3D 32,
>                         .rate_min =3D 8000,
> --
> 2.47.1
>

