Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E31E61A019F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 01:22:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x64x1rTgzDqs8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 09:22:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Wh907092; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48x62B1Sk0zDqpp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 09:19:45 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id k3so583634pjj.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 16:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qiEMQ3MnZPBtfcN59NTsvK6kDONkxcqt/LljkK1BS58=;
 b=Wh9070924djEGtjlOfMWm3UFGyjc2B4vmxZxdcBAFkiAc1QiSjxqTx9d0m8DBopdP7
 HuDT/VhNJC+8tM727HYCqdlOtJZVUQ8xhLKP2twBf5CUd4KQ15FMv7A9rkzcX3JPOUpe
 MV6It+FIRA2BIRSbq/bI6iw3+sXW8cqRPbwa7Y9KrRro2K3Nv0TiNBsKtmLZ2SErQfJl
 YJcpMjKVh/0EVzznKwspgZgcDJLvG/D4bnd9eBi1I62eZKe5iKtbub4+5EnPwyRRTtC5
 TIZskK/zQ/mhyIhM7l8BYnFwGJTpp6KELsy9FFTvN0Uq67B2kLRPOSKlceAnBHUE/iAw
 sPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qiEMQ3MnZPBtfcN59NTsvK6kDONkxcqt/LljkK1BS58=;
 b=a6vJ8P6qto7+vgrmtPTPCYsCoDiVadNIDOxblkVl02GImWj2MLtt4sT/NlUd9mHc+u
 BH2FTMQEJjZaQxlXWAIrWMuhcyU5nFOoM4/6Szl75Syf0v41S8JSIhQS1AGIxHAGQKUO
 qnZw1FHUIyWJ9Qha9xbR/2d65MrlOaDkmzkI0Kf5ixowbiJa7MIcVgL3SHdaEXGJuJAP
 hk8EE4Au+0DDLwUehew71nJ723pm0BkCME6FTFMbSFGDlDs3UN1H7vb4ViKIuGE5iUxb
 rfw4dOJHwc4vayQO5i1Sl4SreL6z6uAF51WJIoincK2W/fhjo/6f3U7Ambvu7q25AJsT
 vzUg==
X-Gm-Message-State: AGi0PuZEQNYUUjUPEKu9pJ7mAC+V0EdL5uhWHSB7+P7kCypony4Lbl7r
 cxH/xJKmlC8dCfzaHI2MkkGYCwn8
X-Google-Smtp-Source: APiQypKNp8VZ9mr4GVNmcAt4ce9e6kNxf3ZHvIuLkebI0RqZykks7BQ7hyl/mOXDC3laCG4n/sp25w==
X-Received: by 2002:a17:90a:324b:: with SMTP id
 k69mr1963136pjb.50.1586215183169; 
 Mon, 06 Apr 2020 16:19:43 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id c126sm12625459pfb.83.2020.04.06.16.19.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 16:19:43 -0700 (PDT)
Date: Mon, 6 Apr 2020 16:19:45 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v6 4/7] ASoC: fsl_asrc: Support new property
 fsl,asrc-format
Message-ID: <20200406231945.GA20945@Asurada-Nvidia.nvidia.com>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <496f49f1fe20b969f4456b591f62223d430c6d74.1585726761.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <496f49f1fe20b969f4456b591f62223d430c6d74.1585726761.git.shengjiu.wang@nxp.com>
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

Just some small comments.

On Wed, Apr 01, 2020 at 04:45:37PM +0800, Shengjiu Wang wrote:
> In order to align with new ESARC, we add new property fsl,asrc-format.
> The fsl,asrc-format can replace the fsl,asrc-width, driver
> can accept format from devicetree, don't need to convert it to
> format through width.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c     | 40 ++++++++++++++++++++++--------------
>  sound/soc/fsl/fsl_asrc.h     |  4 ++--
>  sound/soc/fsl/fsl_asrc_dma.c | 15 +++++++++++---
>  3 files changed, 39 insertions(+), 20 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 4d3e51bfa949..eea19e2b723b 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -1052,16 +1047,31 @@ static int fsl_asrc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = of_property_read_u32(np, "fsl,asrc-width",
> -				   &asrc->asrc_width);
> +	ret = of_property_read_u32(np, "fsl,asrc-format", &asrc->asrc_format);
>  	if (ret) {
> -		dev_err(&pdev->dev, "failed to get output width\n");
> -		return ret;
> +		ret = of_property_read_u32(np, "fsl,asrc-width", &width);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to get output width\n");

Similar to the comments against sound card driver:
"failed to decide output format"

> +			return ret;
> +		}
> +
> +		switch (width) {
> +		case 16:
> +			asrc->asrc_format = SNDRV_PCM_FORMAT_S16_LE;
> +			break;
> +		case 24:
> +			asrc->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
> +			break;
> +		default:
> +			dev_warn(&pdev->dev, "unsupported width, switching to 24bit\n");

Should match what the code does after the change:
+			dev_warn(&pdev->dev,
+				 "unsupported width, use default S24_LE\n");

> +			asrc->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
> +			break;
> +		}
>  	}
>  
> -	if (asrc->asrc_width != 16 && asrc->asrc_width != 24) {
> -		dev_warn(&pdev->dev, "unsupported width, switching to 24bit\n");
> -		asrc->asrc_width = 24;
> +	if (!(FSL_ASRC_FORMATS & (1ULL << asrc->asrc_format))) {
> +		dev_warn(&pdev->dev, "unsupported format, switching to S24_LE\n");

Could fit 80 characters:
+		dev_warn(&pdev->dev, "unsupported width, use default S24_LE\n");

> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 5fe83aece25b..b15946e03380 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -230,10 +230,19 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
>  		return -EINVAL;
>  	}
>  
> -	if (asrc->asrc_width == 16)
> +	bits = snd_pcm_format_physical_width(asrc->asrc_format);

Can we just use 'width' to match the function name?
