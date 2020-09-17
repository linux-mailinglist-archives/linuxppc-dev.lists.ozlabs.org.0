Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C8D26D006
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 02:38:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsJ3m5P10zDqvN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 10:38:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.195;
 helo=mail-vk1-f195.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JC1Ik0dT; dkim-atps=neutral
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
 [209.85.221.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsHj24146zDqmJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 10:22:12 +1000 (AEST)
Received: by mail-vk1-f195.google.com with SMTP id t189so22876vka.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 17:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+L8r3i/llwp2Lmso2SJhe/RRr10LqwB0/nAV4JJW3s0=;
 b=JC1Ik0dTH25FUvJr+6hQ7ANFLhd84ikfThn/lnDI9H6v+KmSh8y0R5+6RDmpkXDNoS
 jrGyTNd/bMGzTyUALXM20m2tIv1i0eg2jUdFyK5P1SP0X1eKadn1e53/JCTcczHht8Z8
 3SgmdZ3PDrm1nhNNjoy0+mbFThR122+YFS83dknywKFKv9eft48bVcHo97iDUnvKjQzR
 9mhS4X/C3QT5FAPN8Vu0N7pwTZrrKxsQucrlMVaMsKXNWbHHWnymjZPby2YiyH2JGA1k
 GqL1mt9mdVOg/XNUiV/CMMVIOl0qCHSxIAn2tPIQLJ8fcW/pLs6o8WW1cpDbaV85nNVI
 Qe4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+L8r3i/llwp2Lmso2SJhe/RRr10LqwB0/nAV4JJW3s0=;
 b=Cp2N4tri/p6mDTxRbTVFVUSQlkVk3SfTcvpnxJq/HtD+U+Ni9mxP22SYcRXzN7gRLB
 0ESNA/ZxjE9MELgsIIZvraU8nXjX8GFTy67ixSNzDeDyPmo1mQ8aA3ezWXXpxP3Mv9Tg
 UwPu1euZKhf6CQM5hoP9B2fu2VTb4qyFmsChshbplifqvzBor5uZlOD2L5iGxBJjf4U4
 QXs+KJGr5GvVK5zB+rrTkj3wOMMXdwZ+ocdCG5f8xn46ICUISrFoeuJA0j4KV9yGQ+Zq
 cdDTXiO2xOYDFr5r0pH/hzOejq9VdIZbJ8ssx2h0DwSrJY6fcoqztzta6o2ulju9FrtM
 TNyQ==
X-Gm-Message-State: AOAM5312/GFghCUPhmijbLPsw3dnkxjhIwdmqXnvjXqkipLaT9RiynPf
 pfIZ9GjLDziMJ4ug+Q16juMqd11wHHo=
X-Google-Smtp-Source: ABdhPJwyRANoUnW2/ZYlnK9c+pZ3xu+Veuc7MK+f2qzGVSCXe5EsIqJOkORlG6/DMUY0bn9nyBY02g==
X-Received: by 2002:a62:10a:0:b029:142:2501:39e1 with SMTP id
 10-20020a62010a0000b0290142250139e1mr8640542pfb.48.1600301600950; 
 Wed, 16 Sep 2020 17:13:20 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id z4sm18491615pfr.197.2020.09.16.17.13.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Sep 2020 17:13:20 -0700 (PDT)
Date: Wed, 16 Sep 2020 17:10:08 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [PATCH] ASoC: fsl_audmix: make clock and output src write only
Message-ID: <20200917001007.GA22566@Asurada-Nvidia>
References: <1600104274-13110-1-git-send-email-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600104274-13110-1-git-send-email-viorel.suman@oss.nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Viorel Suman <viorel.suman@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Viorel Suman <viorel.suman@nxp.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 14, 2020 at 08:24:34PM +0300, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> "alsactl -f state.conf store/restore" sequence fails because setting
> "mixing clock source" and "output source" requires active TDM clock
> being started for configuration propagation. Make these two controls
> write only so that their values are not stored at "alsactl store".
> 
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
>  sound/soc/fsl/fsl_audmix.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> index a447baf..7ad5925 100644
> --- a/sound/soc/fsl/fsl_audmix.c
> +++ b/sound/soc/fsl/fsl_audmix.c
> @@ -199,10 +199,18 @@ static int fsl_audmix_put_out_src(struct snd_kcontrol *kcontrol,
>  
>  static const struct snd_kcontrol_new fsl_audmix_snd_controls[] = {
>  	/* FSL_AUDMIX_CTR controls */
> -	SOC_ENUM_EXT("Mixing Clock Source", fsl_audmix_enum[0],
> -		     snd_soc_get_enum_double, fsl_audmix_put_mix_clk_src),
> -	SOC_ENUM_EXT("Output Source", fsl_audmix_enum[1],
> -		     snd_soc_get_enum_double, fsl_audmix_put_out_src),
> +	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
> +		.name = "Mixing Clock Source",
> +		.info = snd_soc_info_enum_double,
> +		.access = SNDRV_CTL_ELEM_ACCESS_WRITE,
> +		.put = fsl_audmix_put_mix_clk_src,
> +		.private_value = (unsigned long)&fsl_audmix_enum[0] },
> +	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
> +		.name = "Output Source",
> +		.info = snd_soc_info_enum_double,
> +		.access = SNDRV_CTL_ELEM_ACCESS_WRITE,
> +		.put = fsl_audmix_put_out_src,
> +		.private_value = (unsigned long)&fsl_audmix_enum[1] },
>  	SOC_ENUM("Output Width", fsl_audmix_enum[2]),
>  	SOC_ENUM("Frame Rate Diff Error", fsl_audmix_enum[3]),
>  	SOC_ENUM("Clock Freq Diff Error", fsl_audmix_enum[4]),
> -- 
> 2.7.4
> 
