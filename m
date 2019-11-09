Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1944F5D17
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 03:49:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4791mx4fL6zF7L3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 13:49:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BHLDbjp2"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4791kq4drmzF7h1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 13:47:12 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id v19so6393892pfm.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 18:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cq4ckbPSNxVgpRvUOo2jxu08YcSsyOPv7EiFLNFV+wY=;
 b=BHLDbjp2/rjicvCl9Y6Pk/ehYvuXqPBXedtlwLQJ6829OC8HZwQ967is0orJ2YDroL
 HldAwgVrojmuko3zckLESNvoKOwgmP/HsWZVX7T8/ZDhtHij+BgfUJXCM1gWHTjxToas
 f8Xsbu71sf7NSixiLXUTZ2/i/1NCF61PFr8DOI91U8Mri732IefQkVCYXJLhovCFTgvM
 XL+kC0wSm1LX0crJx6yNQNTUDsqh3Y4zycOSS5BVxpjzVPLyaxqztoc/U6kaoiv8upxP
 aGNVu4M6PMMFMA41rZKciCsvXqgN90bXWvHb7lUfm7xPfMGJJGNqdi/zhgqfhaFxN/v1
 GfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cq4ckbPSNxVgpRvUOo2jxu08YcSsyOPv7EiFLNFV+wY=;
 b=HBIlTCljavDjYlmSyN//4RtKDqcdaP6IUHHVuf7qP8r0WgxVyBoBIrzVxuSMe7RHsL
 eoayzwpfTkBwuqgwBx74HbtxGebFnsVOLsuyb2b2JAkBOYOKwwi3RjRYzAQBswyTCtl3
 0f1QDzY696AD+J16SHvc7iPSJQyljp7pG3KhL4KPhXXR/nZMyxdiX7v7p3kDkwhtwCVD
 Hkaj7WcFFbHRsKebBX6xxS2xqheromiSCbW3/+W336jucW6qkSSLJIzOyRZoC6d24pGG
 +Je/KwX/ymaiww2DuPabCl5NJjs3uZhsKqi53Qe6YSTc8ZU2zyrpLHbGD4NwZrfgvP+e
 zI8A==
X-Gm-Message-State: APjAAAX895GuMNRvHkHFS3g7dEB8XYiek/VxsSLtQXjFIqJ76q38YTS7
 zaxp4jkSZkobpatmukap768=
X-Google-Smtp-Source: APXvYqzOaurDRWYu9ke1kM+bB+a8DNEavcWgckpha8tyYpW7pnfmEP7gMnK3Q1hF+tuDBY5QVGIRDA==
X-Received: by 2002:a63:644:: with SMTP id 65mr7421600pgg.306.1573267629257;
 Fri, 08 Nov 2019 18:47:09 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id r184sm8643749pfc.106.2019.11.08.18.47.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 Nov 2019 18:47:09 -0800 (PST)
Date: Fri, 8 Nov 2019 18:45:02 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_audmix: Add spin lock to protect tdms
Message-ID: <20191109024502.GA9187@Asurada-Nvidia.nvidia.com>
References: <1573025265-31852-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573025265-31852-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, perex@perex.cz,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 06, 2019 at 03:27:45PM +0800, Shengjiu Wang wrote:
> Audmix support two substream, When two substream start
> to run, the trigger function may be called by two substream
> in same time, that the priv->tdms may be updated wrongly.
> 
> The expected priv->tdms is 0x3, but sometimes the
> result is 0x2, or 0x1.

Feels like a bug fix to me, so  might be better to have a "Fixes"
line and CC stable tree?

Anyway, change looks good to me:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks

> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_audmix.c | 6 ++++++
>  sound/soc/fsl/fsl_audmix.h | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> index c7e4e9757dce..a1db1bce330f 100644
> --- a/sound/soc/fsl/fsl_audmix.c
> +++ b/sound/soc/fsl/fsl_audmix.c
> @@ -286,6 +286,7 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>  				  struct snd_soc_dai *dai)
>  {
>  	struct fsl_audmix *priv = snd_soc_dai_get_drvdata(dai);
> +	unsigned long lock_flags;
>  
>  	/* Capture stream shall not be handled */
>  	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> @@ -295,12 +296,16 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>  	case SNDRV_PCM_TRIGGER_START:
>  	case SNDRV_PCM_TRIGGER_RESUME:
>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		spin_lock_irqsave(&priv->lock, lock_flags);
>  		priv->tdms |= BIT(dai->driver->id);
> +		spin_unlock_irqrestore(&priv->lock, lock_flags);
>  		break;
>  	case SNDRV_PCM_TRIGGER_STOP:
>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		spin_lock_irqsave(&priv->lock, lock_flags);
>  		priv->tdms &= ~BIT(dai->driver->id);
> +		spin_unlock_irqrestore(&priv->lock, lock_flags);
>  		break;
>  	default:
>  		return -EINVAL;
> @@ -491,6 +496,7 @@ static int fsl_audmix_probe(struct platform_device *pdev)
>  		return PTR_ERR(priv->ipg_clk);
>  	}
>  
> +	spin_lock_init(&priv->lock);
>  	platform_set_drvdata(pdev, priv);
>  	pm_runtime_enable(dev);
>  
> diff --git a/sound/soc/fsl/fsl_audmix.h b/sound/soc/fsl/fsl_audmix.h
> index 7812ffec45c5..479f05695d53 100644
> --- a/sound/soc/fsl/fsl_audmix.h
> +++ b/sound/soc/fsl/fsl_audmix.h
> @@ -96,6 +96,7 @@ struct fsl_audmix {
>  	struct platform_device *pdev;
>  	struct regmap *regmap;
>  	struct clk *ipg_clk;
> +	spinlock_t lock; /* Protect tdms */
>  	u8 tdms;
>  };
>  
> -- 
> 2.21.0
> 
