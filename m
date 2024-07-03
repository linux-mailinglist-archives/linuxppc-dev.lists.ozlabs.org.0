Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D6092562F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 11:13:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DdGbdUJH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDYwn6sddz3fSQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 19:13:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DdGbdUJH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDYw46qzHz30T1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 19:12:52 +1000 (AEST)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-375f713a099so18914935ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2024 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719997970; x=1720602770; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jI0rslYrv6mUgs3l1hovuzLhd9gfH1CvVqaU89w3P0=;
        b=DdGbdUJHlJ0DpSm5l1OtZWOvUCWNcZ6Vkyqvql2k1DMMzsWCJci1kuAFMOTYt1mgsC
         L0IQfI5EkC09kP7j4GcwXw7TBbLGuWlyhAIZQ8+9jnf8VJ2NalCmdYsS5IWAbr838XH9
         7F+J0PlM7CFJ9lgu6KJVgd9yKRv/+jexyHkf7ta1GxbHm3elLR+4sDAmIg/fkcLgF9ex
         wS+qbp9fXg9m74kZ2ZyrOX1I7FZmNAO1me09y+2G760F4lnLWiiqjfxjmVaBfmL+z2Ni
         jI/wDJcGiXp1eWl4GBK2B9VSn7EElkHg3MWyS8r5Wu1NPH9pvlktn7rpM+OFpGGXkXOv
         4MtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719997970; x=1720602770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jI0rslYrv6mUgs3l1hovuzLhd9gfH1CvVqaU89w3P0=;
        b=HHXl6SSq+URK6vguhG/Tjw5S2xl0UV9VJf9NFYskyHpnWU14Dfo4eFCgyDdv5GKcSl
         utg2zIL1WMG7hwduMHgmorBpjTEOxUATdn20Y0HCl0zHhXhnujnmwZpjxgF4EHbT+8rF
         DoPLyKWaosJP0Shdbfcw2NmDQW5YruHi6XIGdg/M3mOMe5Rn719LbT+a8fjqmmom+ymT
         2xg81FDUit2oXmomKTwtDB1gEfk68nxp2fNjQVnQiN1/JyUmkU00000bvYCRW3/YL1IS
         q0iL0Sk6rxrOn0nvsvNdKAmVSMAudmpORCcDGSywhet642UO1CX5/F4IY2oYP93brd6+
         hU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxl4cuHV2bdCnazlI+P19kiYOKIAnootM7Aimxa9fnWpQYTD5VRoJefLk7uqI7b7xdX7BeXnng3hQ1Qz5jsxVksE/3U7DxDYQqXJl4gA==
X-Gm-Message-State: AOJu0YxeZRmMRfTT8wZzixrxPZFupmQ8/rGm+pepc8utPtF4EZpFIteo
	4sITTA5VWdteSxm4RPxItFrcym4amC2EFcM4cNTxVZNsLgHSFguGkMlNrjpMxcmaBA3nD29P+U6
	3C8xQPzjYtKHKMOYwH3FGRp3Om/E=
X-Google-Smtp-Source: AGHT+IG1ehcAilYAWAvfE7/9RzOn+5jnvezYCw9DkZlXjjrBfIA432A0Ksubc/kan0xqgCTbvKnpweLKFvy1Sc7lLho=
X-Received: by 2002:a05:6e02:1c2c:b0:374:b0d8:6c4 with SMTP id
 e9e14a558f8ab-37cd0afefdfmr127007475ab.3.1719997969760; Wed, 03 Jul 2024
 02:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240628094354.780720-1-chancel.liu@nxp.com>
In-Reply-To: <20240628094354.780720-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 3 Jul 2024 17:12:38 +0800
Message-ID: <CAA+D8APvL_wo_L62M-LD88B9EZ6Sg89jtJrCkt4vuCuH3q9p4A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: Improve suspend/resume flow in fsl_xcvr_trigger()
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 28, 2024 at 5:44=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> In the current flow all interrupts are disabled in runtime suspend
> phase. However interrupts enablement only exists in fsl_xcvr_prepare().
> After resume fsl_xcvr_prepare() may not be called so it will cause all
> interrupts still disabled even if resume from suspend. Interrupts
> should be explictily enabled after resume.
>
> Also, DPATH reset setting only exists in fsl_xcvr_prepare(). After
> resume from suspend DPATH should be reset otherwise there'll be channel
> swap issue.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_xcvr.c | 43 +++++++++++++++++++++-------------------
>  1 file changed, 23 insertions(+), 20 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index 337da46a2f90..bf9a4e90978e 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -529,16 +529,6 @@ static int fsl_xcvr_prepare(struct snd_pcm_substream=
 *substream,
>                 break;
>         }
>
> -       ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
> -                                FSL_XCVR_IRQ_EARC_ALL, FSL_XCVR_IRQ_EARC=
_ALL);
> -       if (ret < 0) {
> -               dev_err(dai->dev, "Error while setting IER0: %d\n", ret);
> -               return ret;
> -       }
> -
> -       /* set DPATH RESET */
> -       m_ctl |=3D FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
> -       v_ctl |=3D FSL_XCVR_EXT_CTRL_DPTH_RESET(tx);
>         ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL, m_ctl=
, v_ctl);
>         if (ret < 0) {
>                 dev_err(dai->dev, "Error while setting EXT_CTRL: %d\n", r=
et);
> @@ -679,6 +669,15 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream=
 *substream, int cmd,
>         case SNDRV_PCM_TRIGGER_START:
>         case SNDRV_PCM_TRIGGER_RESUME:
>         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +               /* set DPATH RESET */
> +               ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTR=
L,
> +                                        FSL_XCVR_EXT_CTRL_DPTH_RESET(tx)=
,
> +                                        FSL_XCVR_EXT_CTRL_DPTH_RESET(tx)=
);
> +               if (ret < 0) {
> +                       dev_err(dai->dev, "Failed to set DPATH RESET: %d\=
n", ret);
> +                       return ret;
> +               }
> +
>                 if (tx) {
>                         switch (xcvr->mode) {
>                         case FSL_XCVR_MODE_EARC:
> @@ -711,6 +710,13 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream=
 *substream, int cmd,
>                         return ret;
>                 }
>
> +               ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER=
0,
> +                                        FSL_XCVR_IRQ_EARC_ALL, FSL_XCVR_=
IRQ_EARC_ALL);
> +               if (ret < 0) {
> +                       dev_err(dai->dev, "Error while setting IER0: %d\n=
", ret);
> +                       return ret;
> +               }
> +
>                 /* clear DPATH RESET */
>                 ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTR=
L,
>                                          FSL_XCVR_EXT_CTRL_DPTH_RESET(tx)=
,
> @@ -733,6 +739,13 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream=
 *substream, int cmd,
>                         return ret;
>                 }
>
> +               ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER=
0,
> +                                        FSL_XCVR_IRQ_EARC_ALL, 0);
> +               if (ret < 0) {
> +                       dev_err(dai->dev, "Failed to clear IER0: %d\n", r=
et);
> +                       return ret;
> +               }
> +
>                 if (tx) {
>                         switch (xcvr->mode) {
>                         case FSL_XCVR_MODE_SPDIF:
> @@ -1411,16 +1424,6 @@ static int fsl_xcvr_runtime_suspend(struct device =
*dev)
>         struct fsl_xcvr *xcvr =3D dev_get_drvdata(dev);
>         int ret;
>
> -       /*
> -        * Clear interrupts, when streams starts or resumes after
> -        * suspend, interrupts are enabled in prepare(), so no need
> -        * to enable interrupts in resume().
> -        */
> -       ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
> -                                FSL_XCVR_IRQ_EARC_ALL, 0);
> -       if (ret < 0)
> -               dev_err(dev, "Failed to clear IER0: %d\n", ret);
> -
>         if (!xcvr->soc_data->spdif_only) {
>                 /* Assert M0+ reset */
>                 ret =3D regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTR=
L,
> --
> 2.43.0
>
