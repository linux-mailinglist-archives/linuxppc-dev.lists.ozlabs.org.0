Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 507DF17EB18
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 22:21:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48brkb0B6NzDq5b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 08:21:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.214.195;
 helo=mail-pl1-f195.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48brhJ0cYrzDqNx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 08:19:27 +1100 (AEDT)
Received: by mail-pl1-f195.google.com with SMTP id a23so1810126plm.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2020 14:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=75BMaXcAmO4F5Wh+UkrqpyAJEuiai75tQOLAGLzUruc=;
 b=Mc3f2TGua+mzWZqhqcBFy8xGR4f62bMfkZ533/dtz8uiLUdJhj/KUeALKn1cfWNrgL
 fIQti2Sr9jF85Y+rnxx4+60P16SUP3noRF2AljLUI1D2TFMmP1bonRiTwzjx4xNJ9Qwe
 5ZwVhdVsIL82iYY0GFFZP9ck6Ccro9zA/NCVMYqPyiZzOtN5c7Gv+TLxZguS9lB7Xon4
 hDadFff6ReYzd5WneH3sHbliE6rYSdrwuC0imPmRhArAKnt1MskwGQAGVLXRnAlhKQtL
 kwBImHlUMMDcum7ZL8MZBJ/YPV3RAGp0y3mQHGzC9a7UWHTJnrktv2CJw6iWWZrfotr5
 SlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=75BMaXcAmO4F5Wh+UkrqpyAJEuiai75tQOLAGLzUruc=;
 b=aZaXYW6EK5njP43jG7JgU0G/Af+GuWZTGOWuOpH0MSjuqxzvPOxkKKKlKRagW8S63t
 6jyjFhy7oiM45rTCruu646A/q2WaNT4amFm04vK/EgChwaF4w0jlX4p9h3uULhx8YqcU
 zvK4cZZbUMsEmd9LfC8CDrGeQyqQ+iV7wPz2tkin0tMht9DB7NaGoiUcYoyebNsBnzbA
 xEj88ZkB/VGWEsAmvOhOKJOCXj3CPOTPtHoqR6b8U+VxKQuqadhPvWCIpMGRzkmmXTdr
 YekIOCvJcgnupOZwO4cpHh7/wiN9uzk4YZkux0z3cN65bH2tYPARRpPzV7Znrejflrv6
 V54g==
X-Gm-Message-State: ANhLgQ1vaylZWBNw9hT1HqkCFvBpF9DDNmv5UipN+ICcwUXW6VgJk2oL
 fwQclaW+KRaLnTkPYmIuQsU=
X-Google-Smtp-Source: ADFU+vt2yYWX7gJknQLuNcwuQzhGdS8aInh7+JZ9Mbaq0Z7M0IITbFjuVTv3VCNQfp0cXyneROITtg==
X-Received: by 2002:a17:902:864a:: with SMTP id
 y10mr17943042plt.2.1583788704865; 
 Mon, 09 Mar 2020 14:18:24 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id u24sm44614851pgo.83.2020.03.09.14.18.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Mar 2020 14:18:24 -0700 (PDT)
Date: Mon, 9 Mar 2020 14:18:32 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v5 2/7] ASoC: fsl-asoc-card: Support new property
 fsl,asrc-format
Message-ID: <20200309211831.GA11333@Asurada-Nvidia.nvidia.com>
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <266dccc836c11165ad91a301f24fe4f7ad2557be.1583725533.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <266dccc836c11165ad91a301f24fe4f7ad2557be.1583725533.git.shengjiu.wang@nxp.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 09, 2020 at 11:58:29AM +0800, Shengjiu Wang wrote:
> In order to align with new ESARC, we add new property fsl,asrc-format.
> The fsl,asrc-format can replace the fsl,asrc-width, driver
> can accept format from devicetree, don't need to convert it to
> format through width.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 9ce55feaac22..32101b9a37b9 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -680,17 +680,19 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  			goto asrc_fail;
>  		}
>  
> -		ret = of_property_read_u32(asrc_np, "fsl,asrc-width", &width);
> +		ret = of_property_read_u32(asrc_np, "fsl,asrc-format", &priv->asrc_format);
>  		if (ret) {
> -			dev_err(&pdev->dev, "failed to get output rate\n");

Nice that your patch fixed my copy-n-paste typo here :)

> -			ret = -EINVAL;
> -			goto asrc_fail;
> -		}

It'd be nicer to have a line of comments:
			/* Fallback to old binding; translate to asrc_format */

> +			ret = of_property_read_u32(asrc_np, "fsl,asrc-width", &width);
> +			if (ret) {
> +				dev_err(&pdev->dev, "failed to get output width\n");
> +				return ret;
> +			}
>  
> -		if (width == 24)
> -			priv->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
> -		else
> -			priv->asrc_format = SNDRV_PCM_FORMAT_S16_LE;
> +			if (width == 24)
> +				priv->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
> +			else
> +				priv->asrc_format = SNDRV_PCM_FORMAT_S16_LE;
> +		}
