Return-Path: <linuxppc-dev+bounces-6363-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E536FA3D40A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2025 10:01:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yz6gH4SbBz30Gq;
	Thu, 20 Feb 2025 20:00:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::130"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740042059;
	cv=none; b=m3wDsOHoHyTMXhEUYWq2M/IhtWJoXg3LtkeKXfulH1x5W1elOsxc47ryGFFLDYXADW+W1mUZK3lbjInXCAyGoL1lN5I36XMBkMohr4QSyQrNyESwgvATBV8aPc7YL24J1CV4M/BXHOaFclw2F+AQiJ6jym7WCImr0BT8xqRF4xHyMsPnnfaJHXXz1lHNBiZsilb+fdRxoJ2XU8Qam3E4LiP9V62yR+ntewnmYwofXxwO4IZPoNbWk14xGBVL4Gn5jcfZdo8dLJDl1qgAxWdfDR1hkY3Gtgvzo0Kanzt+KP/XAjYXyEmmQBi4nirqYo2f/tTVcFngYIHEM4OMS9garQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740042059; c=relaxed/relaxed;
	bh=pBGc9kjWvcTT8TmY8LuieFVJI4yuvG9ph/k+PfRmzSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OwH8enyergsBiYAALxjQW3DaLgqVqELmzA7PQHaMX+9jDeJggEtwyAGQ1KLJ0KSDozKdTCo6WKldZN87SRZP6hBucZ3fEspJE8ffqJ8cc9/ZglI0/ogR8apSWTjxEDXO+jJih9gT4ZntnR5qxorqnf/sgz8K5T6MTm7cumG3ZX1MHVFohUElD7uX5h8Z+scG8T2OIYXVyIYyTTCGwBfwUqoIr5AkVnJCLDenl8/rqw1eYibweoXxckKJOA2azETU1ah4+ArxmeiPs+zAhHni3sNtVPeSU80mCadEsBJ7nT/mGrwzsyB3R7guUFQWNpsHbSXdv1CZBZKKssaccO5vxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lR3SHEGN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lR3SHEGN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yz6gG0YDfz2y92
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2025 20:00:56 +1100 (AEDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3d284b9734fso6171125ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2025 01:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740042053; x=1740646853; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBGc9kjWvcTT8TmY8LuieFVJI4yuvG9ph/k+PfRmzSM=;
        b=lR3SHEGNg8HFSm+wiSdDKIWQjZLpn0j3GENJu3BFzC6GUg+aw6a8m8f6EGbs5N0o4b
         bkHNT2MRKp6UEIvGrxL8R5yfcUcEhvXXUSERIhGrYnJqGJDMiPSg2CfOy1zTXaOQzdRI
         PtLH4WbxAmahCrSYvLowgOUBryxBRcvI1JDH6cmJvD1uFW2OI+GhubH6zT8xzYApDaoe
         oDxfxwodx94yElPoAEj3HJbKeQFPiTwLJ/PliF3DBJtKg2fZl4LcHQAj2Kz23DBAPwCb
         uEQ/oVgb/5lTs3wCghdnKsCOhZyYdt9cwnq2ecQ3Wmo7xIOfjDLn9FH7lteMSDJsbY4o
         34Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740042053; x=1740646853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBGc9kjWvcTT8TmY8LuieFVJI4yuvG9ph/k+PfRmzSM=;
        b=Xw5dHutj98h1VlO/CSK5ORZ7/EziL/wykUTkxQ8pMysHqWFwEcbo6HvjkNNzTGjVXm
         UnhLK0jXZlXX4Kqn2yZPghf4vetvJZmLFnQ6LxsL/ns3MwXraara7RKvAZ6bR+jnXF+4
         0EiI1tfzTrbn8IHroORgrFm+q98nngnAY6+D8ajkwH2LEk++n1kqFRrgJNZp0B0VuVb2
         pI1Wwft9+rm5nDDRJLNPIh6L2x4/vSxOMcfzxHZSHn8XZvEtogi6MSdCj8wvJXH4CvtR
         HWBqTyhb8YiIxdNj5QuLwh4YKteBuYn1RZt2oehAfbHrAecqZMUg492XS1swZ8ORzRbk
         Yi1g==
X-Forwarded-Encrypted: i=1; AJvYcCVAiy5GyRcvA5qvYOO7/vP+H/5btjePIxG31OF/g3E38YUfk9S/bRavh3kMmSgt4tHKfQS3YZuiYJETAa4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz1GOLxw5qoRKMjqahVuYRWjdVE4W2k+nV5LspmVNQkPOaWHHw4
	xPAQW8ubbO3CFm5UMzUSv6RxqPCeCXJZW/fRxyfwzggMrqP6tiOs9KJ1VCf51Faxkv5tQf8+bel
	7k6IqGbET1qv08yPgdxUGnx9VwTE=
X-Gm-Gg: ASbGnctVx4iuwxTXp2+bTivyJIpBP29ip5K0va8cp4gAbaAesLMC9f71tD5Xo+z9m5b
	moP3iER+uwwZGhSovq4NZtOP0z+T3M/F2CUlEjLVk2wGV9i4MqqSm1mUBAET4sipCC33nqOrj
X-Google-Smtp-Source: AGHT+IG7gp55gI6T7N19LupIXyNXuZGTOg7Z9WUU+BixH82XpixCePwY1tGVPmmyOmTvSK8jIL5m5WxoGCqGVuGTA9A=
X-Received: by 2002:a92:c26c:0:b0:3d2:b72d:a507 with SMTP id
 e9e14a558f8ab-3d2c25f4dcbmr17357385ab.19.1740042053529; Thu, 20 Feb 2025
 01:00:53 -0800 (PST)
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
References: <20250217010437.258621-1-chancel.liu@nxp.com>
In-Reply-To: <20250217010437.258621-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 20 Feb 2025 17:00:40 +0800
X-Gm-Features: AWEUYZnC1Oj7Zc6v49m8gK1mM0DpiY64mpQR7L7KBjSe2s7uidTWDyh3xmP5pP0
Message-ID: <CAA+D8ANJR7rVo5e8jA5wk=rZmoPpJS-=9qZw9s2aSWadzWPEmg@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: fsl: Rename stream name of SAI DAI driver
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

On Mon, Feb 17, 2025 at 9:05=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> If stream names of DAI driver are duplicated there'll be warnings when
> machine driver tries to add widgets on a route:
>
> [    8.831335] fsl-asoc-card sound-wm8960: ASoC: sink widget CPU-Playback=
 overwritten
> [    8.839917] fsl-asoc-card sound-wm8960: ASoC: source widget CPU-Captur=
e overwritten
>
> Use different stream names to avoid such warnings.
> DAI names in AUDMIX are also updated accordingly.
>
> Fixes: 15c958390460 ("ASoC: fsl_sai: Add separate DAI for transmitter and=
 receiver")
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
> - changes in v3
> Squash two fix patches in one commit
>
>  sound/soc/fsl/fsl_sai.c    | 6 +++---
>  sound/soc/fsl/imx-audmix.c | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
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
> diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
> index 50ecc5f51100..dac5d4ddacd6 100644
> --- a/sound/soc/fsl/imx-audmix.c
> +++ b/sound/soc/fsl/imx-audmix.c
> @@ -119,8 +119,8 @@ static const struct snd_soc_ops imx_audmix_be_ops =3D=
 {
>  static const char *name[][3] =3D {
>         {"HiFi-AUDMIX-FE-0", "HiFi-AUDMIX-FE-1", "HiFi-AUDMIX-FE-2"},
>         {"sai-tx", "sai-tx", "sai-rx"},
> -       {"AUDMIX-Playback-0", "AUDMIX-Playback-1", "CPU-Capture"},
> -       {"CPU-Playback", "CPU-Playback", "AUDMIX-Capture-0"},
> +       {"AUDMIX-Playback-0", "AUDMIX-Playback-1", "SAI-Capture"},
> +       {"SAI-Playback", "SAI-Playback", "AUDMIX-Capture-0"},
>  };
>
>  static int imx_audmix_probe(struct platform_device *pdev)
> --
> 2.47.1
>

