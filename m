Return-Path: <linuxppc-dev+bounces-14723-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D405BCB56E6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Dec 2025 10:59:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRp2k0xQQz2xNk;
	Thu, 11 Dec 2025 20:59:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765447149;
	cv=none; b=fHvefDojemp1CjSRDXfeFIb99It7u8etSzSx251bTg7i1W0hjcPf5OyQNC+9swyas4NFh6xWR3YYgSdCGFaV5+Yi7jWUwCDNIh+XPl5VugcZxyalPaEjfAUKzIqSBcGKHuHixZlAreymLS9B4srcyUNtjlVMltVL3y3J80vKy/yjhqOjnGgAbud3Bj5KujSrDWVaA9TD7F+DbjsExbZsRVObp2nhjLNzqHpqq24zNu//kbSGfzdJSgYLZGwJFhdBAaWCBWpDV+pMMzPGohV9j0pjHPu8wp9eJFKDYpKg6e3PuXNbY3CFjabgy9pl6kIGaY8eO3Bb+S9m6j5W9PHCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765447149; c=relaxed/relaxed;
	bh=sNyn85HrHsekSKS6qB8hQwTaMqNxQMINHyw04qloq3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzVgfJ4StaZBZH1oNgERyEjrxoGaMTcdwnq0errjG7XhsW0hfw+tSkrvclRQ6n5fDkMbRakWMFyDRVJ/tf33LHW6Ve7/TuT7ZISn69pLz6OlLDVj8i4YXighpTI1T2SNH3xI99Fvn+0INHRINvp1736Rb6UzhTK+cwgr4taXLPjtxXsbyuoCiWS84aWLRzMVqc7HbbHceq72vAdE/lrakxQAEhmc/IULX6Cwafz0uVAhYDlWSQnKeYgPAGEoMj9zFraY3wk7MvYB9O5Vo0cvVY/rOq0HW+Ca838eBSaboslz0lPLLKczwiOAvWzG0+4MYztxWnQdJFcHxMtl6mRHUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TE54cZvx; dkim-atps=neutral; spf=pass (client-ip=209.85.216.45; helo=mail-pj1-f45.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TE54cZvx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.45; helo=mail-pj1-f45.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRp2h5QMKz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Dec 2025 20:59:07 +1100 (AEDT)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-343806688c5so728638a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Dec 2025 01:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765447086; x=1766051886; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNyn85HrHsekSKS6qB8hQwTaMqNxQMINHyw04qloq3c=;
        b=TE54cZvxfSO4niKYvRsr+DRxfnmJw+6DBrdTOoIaO8dp5vfb+3j2dpdyk7BCG9jgxF
         AS4ARZgUXCa9pl0oXWMJZtD/pYj8TQFQ/Hkz4JQ2opqS4SLo5oc26Jq+DJN+vo/ksU5T
         LdoKDIcmM35BxcdftaJpkSE+D9+C967cV00TxTWA5JpZtmO5AjNz9/6krPRvHl5s4prK
         bk5Vsp90HUGs9PajB7cQdoS6BzsmKCJiGi6x8rnK4GzvsrP0KlmD8nkisljil/8kSQPn
         k/ePe1SRAdtd+VtUo+od8vauHAfJNYnz8NS7BG6Y8Pc8J9ZiYmgRwmGHGfk4c7FKd5vJ
         L+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765447086; x=1766051886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sNyn85HrHsekSKS6qB8hQwTaMqNxQMINHyw04qloq3c=;
        b=UZj2CgcvhBPxjI34X2rGIRVYWpoeqh4EdoZj0CG7O529M4TmyK2F99qXUWAwUwXpz0
         sapVXzqXgcwYwpFVmwOnoZ9pwkMmrhD9D+0Mr2jEoE1LlkxA68SoiUcScdxHLJW/hsUF
         Ht07RprYfNXzrG45mjPZ1bGWRtKYvh4GFLiYfy7BheFuLKpjVAfnnwU2PkVyzQOwyvEW
         AgBaI5PiP4UuMSnx7NtR9icXKpjTthbp9sPlTsbueqpMIozn8ThTpd7B1Een9zyGCmMW
         n4cu0GxzKt75XzCmtHKdNo0FRMTp0cX7DZZir5uk1TtF5gJd+fJyi0AjRm5CGdWvh/CY
         qLlg==
X-Forwarded-Encrypted: i=1; AJvYcCWHMx5ZcaPKDeecm7GrwJT661A0T3oEkDlOpuv3+32H4FTcGNPpsvJpyXHXzY4KL5/789oPfWZGdAEdxqM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw5jpYUmCQMY7bDK99R/OeUWfeqraqT1oOBDskL847L0uLnuU8R
	bbY/ctbej0CcGtykEaob+NA0oWh1JHMYatRErCCxfbkj710DVIvx1hICpdnZ+tztAeiXvICSWqa
	BnTi5DDceBqyz2zRwMpU7IJMaxBQcBfs=
X-Gm-Gg: AY/fxX6FWKDJeaFXa40u0U4f2BsTT7+7gjaFcttAuGM2s7d/xrvCrbBsop79hRwp1wW
	MCovyRRsBzZRPoI2IE2fNpUOGnsxqlug38igTGWr5Tk3+j0cJSoCvbadFMkTyGYQSvNsdaxn9gp
	pt+Ue9IHwHNJLDr4WEM69NHByPyiQaezwqvA5rqJXDgpbATU/lWsd1xFMxTotGxyjQcrw9MSgJK
	gbVQRdzQ9VO1C+mB13tXkyzSXjBYPLIZTLl/rXj9wZaoJDMD1oPjl8oIGsHKffQ77V4iqk=
X-Google-Smtp-Source: AGHT+IEPAez3qFaiu86XfuGUlJ09om+vEZUN3OHHINJOMWyOHJrmK5BgG+nV4ll7eif6AQOdoUJeVXNmsvHcSg/da2I=
X-Received: by 2002:a17:90b:3d0a:b0:340:bb5c:7dd7 with SMTP id
 98e67ed59e1d1-34a72808b46mr4444610a91.5.1765447085709; Thu, 11 Dec 2025
 01:58:05 -0800 (PST)
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
Precedence: list
MIME-Version: 1.0
References: <20251210062109.2577735-1-chancel.liu@nxp.com>
In-Reply-To: <20251210062109.2577735-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 11 Dec 2025 17:57:53 +0800
X-Gm-Features: AQt7F2qVkg95kvsYnRruHeVoiRu6n_5hGKsx1QSuPHUDHP41AdIiLfw6-a86lEE
Message-ID: <CAA+D8AMfBL9qQR028iQGMSiMVB__NAiyE_DQ1qiJG=xABZhWdA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Constrain sample rates from audio PLLs
 only in master mode
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Dec 10, 2025 at 2:21=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> If SAI works in master mode it will generate clocks for external codec
> from audio PLLs. Thus sample rates should be constrained according to
> audio PLL clocks. While SAI works in slave mode which means clocks are
> generated externally then constraints are independent of audio PLLs.
>
> Fixes: 4edc98598be4 ("ASoC: fsl_sai: Add sample rate constraint")
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 72bfc91e21b9..86730c214914 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -917,8 +917,14 @@ static int fsl_sai_startup(struct snd_pcm_substream =
*substream,
>                                            tx ? sai->dma_params_tx.maxbur=
st :
>                                            sai->dma_params_rx.maxburst);
>
> -       ret =3D snd_pcm_hw_constraint_list(substream->runtime, 0,
> -                                        SNDRV_PCM_HW_PARAM_RATE, &sai->c=
onstraint_rates);
> +       if (sai->is_consumer_mode[tx])

The sai->is_consumer_mode[tx] can be changed after startup(),
then there may be an issue for the constraint.

It looks like there is no perfect solution here.

Best regards
Shengjiu Wang

> +               ret =3D snd_pcm_hw_constraint_list(substream->runtime, 0,
> +                                                SNDRV_PCM_HW_PARAM_RATE,
> +                                                &fsl_sai_rate_constraint=
s);
> +       else
> +               ret =3D snd_pcm_hw_constraint_list(substream->runtime, 0,
> +                                                SNDRV_PCM_HW_PARAM_RATE,
> +                                                &sai->constraint_rates);
>
>         return ret;
>  }
> --
> 2.50.1
>

