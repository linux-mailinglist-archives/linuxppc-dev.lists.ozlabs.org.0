Return-Path: <linuxppc-dev+bounces-14536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACB9C910F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Nov 2025 08:44:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHlgg3R3Zz2yG5;
	Fri, 28 Nov 2025 18:44:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764315887;
	cv=none; b=WQTlTAZ3owUquqihkQUvve0Ff9znE7E/PBX3YfyldFpmRrOfHxVANhaT/+K2yeVEky4Xa2gnTic0XyZP5lSzngUNyQrbhSUIY/TqpdcZBrMA22JXEGIamtHMtCUKkm8UgxSgbt3pegNpYrWACks2idiMp+kD4xuJpv2Y9XxL93KjNOsj6c0uEfDIYGE6gv6Zyjh5qJDsgsOuBN85FIOUmg7qOLxCRWQBJVqyg+OwVgRxabM41FYGv5XIxE7jH3OaY9wlQgB5ivPhjr7fGNdtHpVa9U4Px4hTh/jVIxaBtisZMO+OeDINFOig2b7uhjKAq/u/h6F6Oofm6puFjQex8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764315887; c=relaxed/relaxed;
	bh=APcKIriRF2y6sXpDwx+oMCC81Q13RwzisOJwdH+1RDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=niWQtpW7OTwvbkS/cRwgw3RaS1+refLbPrP4BDG0DmtJYaKTsWWwd7U21HT61lM4bR2H1OUjYJ9Ts6SpochlJ+4OCLP0Y1YMf4Jx2tqzdrvJ9BcA068IEHt6cfOD7T+IL2V2ZU0zUauG3JWWpH6J+fHDKJqB01G3vSE7QnPI7Y6EVSBiOz10Iv3DWuUiVycfACGXNx76/TowluHtZ8fS2WA2ANRDXFdndGiqKeViIzPH9JLSqvLnO2hpqOzPoqzkkVAaG7RuILH13K+kL8vU8v7N4Q0C+LAkcChUc67/3sTug38dhpr9+TdDT9uyj2x744QMtYNtMrTpidFfZoCA1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NDgqDoWz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NDgqDoWz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHlgf4QVdz2yFs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 18:44:46 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-29853ec5b8cso19458115ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 23:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764315884; x=1764920684; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APcKIriRF2y6sXpDwx+oMCC81Q13RwzisOJwdH+1RDY=;
        b=NDgqDoWzr7r96Re9Tj3xdInjJNVQMUBaCE5HvCr2lnIiEBabvEZgbSIbpBoP+eIyOG
         9L0K4Nwif4aZ+eMnfcSXOYLNbVf8uHsktZ47NTc4gQemafKAzcelEyuodYG1J8nZ4tHo
         4s8fRgLCGXZe11r3u7VTIP3FnQWpJ23ml1i6IGFNoSQ0P43XtBlZI3/gYTr3lbJob0zz
         TsT8WCSNQfE09WKJhodEbNe0gFiSWF3vyUGhrb9F7YSOhzdOTgVoa5gA4W/PAOcyEYKd
         blK8gIxO0Fem/nyKMg5eLY5ToE4P8q3goI4XF+oyomDTbEZZDJUxD5TtDzags3sF453M
         ZZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764315884; x=1764920684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=APcKIriRF2y6sXpDwx+oMCC81Q13RwzisOJwdH+1RDY=;
        b=UGxdAuYCMJUhRfP+lTxtRKgoWj0ornkWG7Vm9xPwaxC6wLG4AJykG47U7agn6CldmZ
         vnhhw/ANK7LGW6nZrOp1jl2fpUjF+5AB5haTInzBml0mKEk9sAbMcOIilQ8WWYOBL/mv
         LsiboEQufnFEfgWswfyo/89WOnUdGTr6X7WYdGH1vlpn8+gIvyfSJzpH9XgKKs2eEKwL
         BA8V7Oup0CfvJiBv88NBSN387nzo4mdEP3NbLaPzJ3AeKJp2e2aAdOCyAYwpXnfHCNUM
         cwhuembdri+hKGtr7ZHa+LThpX4zxxXiPB78x8JxIDEibYEAIAtJA4IhnSSd4aY/Gokk
         TUIA==
X-Forwarded-Encrypted: i=1; AJvYcCUzUjAZExeymiazFajXGRwJhrHOgR0W2w/gfiNw995atuGW8yIPi6IsmZtgiMlRNJHsVhN4NQTlgbxCQ0g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz6EACGA/ahJKEhKPLOOk/40tDPPv3OmkTL4QkLPqi8PzFefUwt
	VPy88wjjUI53wL9YrXvmSyKiGAhqfljx1M7w7cBjHTjKtlTP4LF56gM9j9D9AQgC38OBscDs5ie
	0/2mIUnecwbK5FYStVbIHGMD3qX1cEhwKVpyQ
X-Gm-Gg: ASbGncuPTkoA6cr3WPVJ69KAmTc3vWMfyxB4SM7Za7TTkNLvv7qbMJ1t3BHtamuD3Tx
	DfTB73XlRuEZ7v6SKBY00ACG9ajLWaNGXbrRZwwf+jpojSck42/edyNeJfw6V/DVTiUBSeyRSDK
	j8blUvtOOAPKBF5FTEZb/6Dkci6PHCLzcwKc89xWbj/JPCzFLInMTyl18NnQMAGJ6I+cPBiVvUR
	+AmMXzMvFt3jN4kjPbE5ORy6GZMQbKyCfRazl1qs75vgMir1agxX2g4yyXXr5fvlI9y28Q=
X-Google-Smtp-Source: AGHT+IEpcOWd0k4JnVngO3b0eihgUsfuZG4/x8EcIDYrjUn8+ueadxUoPqF0QP3vDfHqGn3+fZTCh9BWOYCiFZqYeIY=
X-Received: by 2002:a17:90b:578c:b0:340:ad5e:ca with SMTP id
 98e67ed59e1d1-34733e726ecmr27689264a91.12.1764315884255; Thu, 27 Nov 2025
 23:44:44 -0800 (PST)
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
References: <20251127022652.674574-1-chancel.liu@nxp.com> <20251127022652.674574-3-chancel.liu@nxp.com>
In-Reply-To: <20251127022652.674574-3-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Nov 2025 15:44:31 +0800
X-Gm-Features: AWmQ_bmbkdAiETXBbYHF5WjEuqgKfNpFxQrLUUBSBm5poEGpAusHHJMBGLm6CIA
Message-ID: <CAA+D8AMvZK_OLgf+ocxZDDBXi-L1VYwHi-EoTBcC0_gcxoLmHQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl_micfil: Set channel range control
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 27, 2025 at 10:27=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> =
wrote:
>
> The range control register can't directly adjust volume gain according
> to specification. It's the dynamic range of the CIC filter. The range
> value should meet some conditions otherwise the channel data is not
> reliable. Add an array in soc data to store const value in formula
> with which range with all quality on different platforms can be
> calculated. If the value set to range control exceeds the max range
> there'll be warning logs.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu wang
> ---
>  sound/soc/fsl/fsl_micfil.c | 125 ++++++++++++++++++++++++++++++-------
>  1 file changed, 103 insertions(+), 22 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 86678fee7a57..d6cde2757c6d 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -17,6 +17,7 @@
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
>  #include <linux/dma/imx-dma.h>
> +#include <linux/log2.h>
>  #include <sound/dmaengine_pcm.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> @@ -93,6 +94,8 @@ struct fsl_micfil_soc_data {
>         u64  formats;
>         int  fifo_offset;
>         enum quality default_quality;
> +       /* stores const value in formula to calculate range */
> +       int rangeadj_const[3][2];
>  };
>
>  static struct fsl_micfil_soc_data fsl_micfil_imx8mm =3D {
> @@ -115,6 +118,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mp =
=3D {
>         .volume_sx =3D false,
>         .fifo_offset =3D 0,
>         .default_quality =3D QUALITY_MEDIUM,
> +       .rangeadj_const =3D {{27, 7}, {27, 7}, {26, 7}},
>  };
>
>  static struct fsl_micfil_soc_data fsl_micfil_imx93 =3D {
> @@ -128,6 +132,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 =
=3D {
>         .volume_sx =3D false,
>         .fifo_offset =3D 0,
>         .default_quality =3D QUALITY_MEDIUM,
> +       .rangeadj_const =3D {{30, 6}, {30, 6}, {29, 6}},
>  };
>
>  static struct fsl_micfil_soc_data fsl_micfil_imx943 =3D {
> @@ -141,6 +146,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx943 =
=3D {
>         .volume_sx =3D false,
>         .fifo_offset =3D -4,
>         .default_quality =3D QUALITY_MEDIUM,
> +       .rangeadj_const =3D {{34, 6}, {34, 6}, {33, 6}},
>  };
>
>  static const struct of_device_id fsl_micfil_dt_ids[] =3D {
> @@ -167,9 +173,69 @@ static const struct soc_enum fsl_micfil_quality_enum=
 =3D
>
>  static DECLARE_TLV_DB_SCALE(gain_tlv, 0, 100, 0);
>
> +static int micfil_get_max_range(struct fsl_micfil *micfil)
> +{
> +       int max_range;
> +
> +       switch (micfil->quality) {
> +       case QUALITY_HIGH:
> +       case QUALITY_VLOW0:
> +               max_range =3D micfil->soc->rangeadj_const[0][0] - micfil-=
>soc->rangeadj_const[0][1] *
> +                           ilog2(2 * MICFIL_OSR_DEFAULT);
> +               break;
> +       case QUALITY_MEDIUM:
> +       case QUALITY_VLOW1:
> +               max_range =3D micfil->soc->rangeadj_const[1][0] - micfil-=
>soc->rangeadj_const[1][1] *
> +                           ilog2(MICFIL_OSR_DEFAULT);
> +               break;
> +       case QUALITY_LOW:
> +       case QUALITY_VLOW2:
> +               max_range =3D micfil->soc->rangeadj_const[2][0] - micfil-=
>soc->rangeadj_const[2][1] *
> +                           ilog2(MICFIL_OSR_DEFAULT);
> +               break;
> +       default:
> +               return 0;
> +       }
> +       max_range =3D max_range < 0 ? 0 : max_range;
> +
> +       return max_range;
> +}
> +
> +static int micfil_range_set(struct snd_kcontrol *kcontrol,
> +                           struct snd_ctl_elem_value *ucontrol)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_kcontrol_chip(kcontrol);
> +       struct fsl_micfil *micfil =3D snd_soc_component_get_drvdata(cmpnt=
);
> +       struct soc_mixer_control *mc =3D
> +               (struct soc_mixer_control *)kcontrol->private_value;
> +       unsigned int shift =3D mc->shift;
> +       int max_range, new_range;
> +
> +       new_range =3D ucontrol->value.integer.value[0];
> +       max_range =3D micfil_get_max_range(micfil);
> +       if (new_range > max_range)
> +               dev_warn(&micfil->pdev->dev, "range makes channel %d data=
 unreliable\n", shift / 4);
> +
> +       regmap_update_bits(micfil->regmap, REG_MICFIL_OUT_CTRL, 0xF << sh=
ift, new_range << shift);
> +
> +       return 0;
> +}
> +
>  static int micfil_set_quality(struct fsl_micfil *micfil)
>  {
> -       u32 qsel;
> +       int range, max_range;
> +       u32 qsel, val;
> +       int i;
> +
> +       if (!micfil->soc->volume_sx) {
> +               regmap_read(micfil->regmap, REG_MICFIL_OUT_CTRL, &val);
> +               max_range =3D micfil_get_max_range(micfil);
> +               for (i =3D 0; i < micfil->soc->fifos; i++) {
> +                       range =3D (val >> MICFIL_OUTGAIN_CHX_SHIFT(i)) & =
0xF;
> +                       if (range > max_range)
> +                               dev_warn(&micfil->pdev->dev, "please rese=
t channel %d range\n", i);
> +               }
> +       }
>
>         switch (micfil->quality) {
>         case QUALITY_HIGH:
> @@ -367,23 +433,31 @@ static int hwvad_detected(struct snd_kcontrol *kcon=
trol,
>         return 0;
>  }
>
> -static const struct snd_kcontrol_new fsl_micfil_volume_controls[] =3D {
> -       SOC_SINGLE_TLV("CH0 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0, gain_tlv),
> -       SOC_SINGLE_TLV("CH1 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(1), 0xF, 0, gain_tlv),
> -       SOC_SINGLE_TLV("CH2 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(2), 0xF, 0, gain_tlv),
> -       SOC_SINGLE_TLV("CH3 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(3), 0xF, 0, gain_tlv),
> -       SOC_SINGLE_TLV("CH4 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(4), 0xF, 0, gain_tlv),
> -       SOC_SINGLE_TLV("CH5 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(5), 0xF, 0, gain_tlv),
> -       SOC_SINGLE_TLV("CH6 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(6), 0xF, 0, gain_tlv),
> -       SOC_SINGLE_TLV("CH7 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0, gain_tlv),
> +static const struct snd_kcontrol_new fsl_micfil_range_controls[] =3D {
> +       SOC_SINGLE_EXT("CH0 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
> +       SOC_SINGLE_EXT("CH1 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(1), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
> +       SOC_SINGLE_EXT("CH2 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(2), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
> +       SOC_SINGLE_EXT("CH3 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(3), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
> +       SOC_SINGLE_EXT("CH4 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(4), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
> +       SOC_SINGLE_EXT("CH5 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(5), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
> +       SOC_SINGLE_EXT("CH6 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(6), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
> +       SOC_SINGLE_EXT("CH7 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
>  };
>
>  static const struct snd_kcontrol_new fsl_micfil_volume_sx_controls[] =3D=
 {
> @@ -895,13 +969,20 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai =
*cpu_dai)
>         struct fsl_micfil *micfil =3D dev_get_drvdata(cpu_dai->dev);
>         struct device *dev =3D cpu_dai->dev;
>         unsigned int val =3D 0;
> -       int ret, i;
> +       int ret, i, max_range;
>
>         micfil->quality =3D micfil->soc->default_quality;
>         micfil->card =3D cpu_dai->component->card;
>
>         /* set default gain to 2 */
> -       regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x22222222);
> +       if (micfil->soc->volume_sx) {
> +               regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x22222=
222);
> +       } else {
> +               max_range =3D micfil_get_max_range(micfil);
> +               for (i =3D 1; i < micfil->soc->fifos; i++)
> +                       max_range |=3D max_range << 4;
> +               regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, max_ran=
ge);
> +       }
>
>         /* set DC Remover in bypass mode*/
>         for (i =3D 0; i < MICFIL_OUTPUT_CHANNELS; i++)
> @@ -935,8 +1016,8 @@ static int fsl_micfil_component_probe(struct snd_soc=
_component *component)
>                 snd_soc_add_component_controls(component, fsl_micfil_volu=
me_sx_controls,
>                                                ARRAY_SIZE(fsl_micfil_volu=
me_sx_controls));
>         else
> -               snd_soc_add_component_controls(component, fsl_micfil_volu=
me_controls,
> -                                              ARRAY_SIZE(fsl_micfil_volu=
me_controls));
> +               snd_soc_add_component_controls(component, fsl_micfil_rang=
e_controls,
> +                                              ARRAY_SIZE(fsl_micfil_rang=
e_controls));
>
>         return 0;
>  }
> --
> 2.50.1
>

