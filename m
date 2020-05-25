Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 935091E0650
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 07:11:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VlZ324vMzDqTL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 15:11:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kn3TRd1F; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VlX96K3pzDqMl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 15:10:00 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id d10so8231045pgn.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 22:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YRJ/uOHwZy2ewPR+X9jA1rwhfgU5ND1HSwCyer+uJtE=;
 b=kn3TRd1Ful72W4WI09lPbmOCFr0cc8jgn/UQsM8xyEHuv8XRoTCZ59qmXXiaJBYdoa
 dF8Tv4JnSYd5PhsKJTrKoICFXCjSlY+YIKoDpi2QAOLNDCqzDQEtS1UZX8GztwRd2dbL
 g6heL6VZWCf46y76J1lh8DWJYvCsWLZMV2AeLcr4UVpkTHgncjJbjnXezE67plJYDmJM
 oBCaj405nHTpfZIa/Wnd8188OR8SSLVyQTWoNjr3xX4v5nqTUQC60PyDpgC/33A5yg3P
 6sZxeN6t3t2rsso7zauGnonIyue2jEA2Yp0zYhZNMYU53O4gGdSqdnKcZOe71a1ICc1T
 WNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YRJ/uOHwZy2ewPR+X9jA1rwhfgU5ND1HSwCyer+uJtE=;
 b=doc0tE/vVgHW479La4vK2XWZMMJGlkUSZ/SjFE6hrToKwNu7hMvHpjSmdiGO7NAWA4
 kVBxlsrmvtjiwC4WoT+f4aD1YrMozAdDtDS23wM2D6GLDvmY8MNXiBLmpw+dgBt0UZP5
 dzR/s443yKRH4FKUY4jEN3rOBL9bKlLv8hBf+m5fM58AMm03usP5r1gTvQsTdmehZv8e
 wRZaaHQ51QeGoa6q7GQjxmZ0C7Ol97jzv6KXlAjOtPzhZix+czGvHX8NeBrpy+3NiCTF
 TorDhI95bxABOe9x94fJBYSPFJ4sC+wDhCrgYPKwgkzXiT8Hp3J53Be3d9sHa623nua4
 VADw==
X-Gm-Message-State: AOAM530t314MzvsRdGzujb4lD1IwdSJf1ysm2OVZPVu+tRF72CQnacSi
 3vCGQMAZ1bjS7csPIaz5874=
X-Google-Smtp-Source: ABdhPJzQCUPRj8DgbPosLYa7RFU4MdgVjnRbidmCGmop2YwNzGzhcWemC1QhhiQMgnYiykuu8Rio6A==
X-Received: by 2002:a62:be18:: with SMTP id l24mr3743697pff.12.1590383398285; 
 Sun, 24 May 2020 22:09:58 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 7sm12153013pfc.203.2020.05.24.22.09.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 22:09:58 -0700 (PDT)
Date: Sun, 24 May 2020 22:09:51 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Merge suspend/resume function to
 runtime_suspend/resume
Message-ID: <20200525050950.GA1244@Asurada>
References: <1590141444-28668-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590141444-28668-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 22, 2020 at 05:57:24PM +0800, Shengjiu Wang wrote:
> With dedicated power domain for asrc, power can be disabled after
> probe and pm runtime suspend, then the value of all registers need to
> be restored in pm runtime resume. So we can merge suspend/resume function
> to runtime_suspend/resume function and enable regcache only in end of
> probe.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c | 70 ++++++++++++++++------------------------
>  1 file changed, 27 insertions(+), 43 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 432936039de4..3ebbe15ac378 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -1100,6 +1100,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, asrc);
>  	pm_runtime_enable(&pdev->dev);
>  	spin_lock_init(&asrc->lock);
> +	regcache_cache_only(asrc->regmap, true);
>  
>  	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
>  					      &fsl_asrc_dai, 1);
> @@ -1117,6 +1118,7 @@ static int fsl_asrc_runtime_resume(struct device *dev)
>  	struct fsl_asrc *asrc = dev_get_drvdata(dev);
>  	struct fsl_asrc_priv *asrc_priv = asrc->private;
>  	int i, ret;
> +	u32 asrctr;
>  
>  	ret = clk_prepare_enable(asrc->mem_clk);
>  	if (ret)
> @@ -1135,6 +1137,24 @@ static int fsl_asrc_runtime_resume(struct device *dev)
>  			goto disable_asrck_clk;
>  	}
>  
> +	/* Stop all pairs provisionally */
> +	regmap_read(asrc->regmap, REG_ASRCTR, &asrctr);
> +	regmap_update_bits(asrc->regmap, REG_ASRCTR,
> +			   ASRCTR_ASRCEi_ALL_MASK, 0);
> +
> +	/* Restore all registers */
> +	regcache_cache_only(asrc->regmap, false);
> +	regcache_mark_dirty(asrc->regmap);


I see you doing regcache_mark_dirty() in the resume() now,
being different from previously doing in suspend()?

Thanks
Nic


> +	regcache_sync(asrc->regmap);
> +
> +	regmap_update_bits(asrc->regmap, REG_ASRCFG,
> +			   ASRCFG_NDPRi_ALL_MASK | ASRCFG_POSTMODi_ALL_MASK |
> +			   ASRCFG_PREMODi_ALL_MASK, asrc_priv->regcache_cfg);
> +
> +	/* Restart enabled pairs */
> +	regmap_update_bits(asrc->regmap, REG_ASRCTR,
> +			   ASRCTR_ASRCEi_ALL_MASK, asrctr);
> +
>  	return 0;
>  
>  disable_asrck_clk:
> @@ -1155,6 +1175,11 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
>  	struct fsl_asrc_priv *asrc_priv = asrc->private;
>  	int i;
>  
> +	regmap_read(asrc->regmap, REG_ASRCFG,
> +		    &asrc_priv->regcache_cfg);
> +
> +	regcache_cache_only(asrc->regmap, true);
> +
>  	for (i = 0; i < ASRC_CLK_MAX_NUM; i++)
>  		clk_disable_unprepare(asrc_priv->asrck_clk[i]);
>  	if (!IS_ERR(asrc->spba_clk))
> @@ -1166,51 +1191,10 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
>  }
>  #endif /* CONFIG_PM */
>  
> -#ifdef CONFIG_PM_SLEEP
> -static int fsl_asrc_suspend(struct device *dev)
> -{
> -	struct fsl_asrc *asrc = dev_get_drvdata(dev);
> -	struct fsl_asrc_priv *asrc_priv = asrc->private;
> -
> -	regmap_read(asrc->regmap, REG_ASRCFG,
> -		    &asrc_priv->regcache_cfg);
> -
> -	regcache_cache_only(asrc->regmap, true);
> -	regcache_mark_dirty(asrc->regmap);
> -
> -	return 0;
> -}
> -
> -static int fsl_asrc_resume(struct device *dev)
> -{
> -	struct fsl_asrc *asrc = dev_get_drvdata(dev);
> -	struct fsl_asrc_priv *asrc_priv = asrc->private;
> -	u32 asrctr;
> -
> -	/* Stop all pairs provisionally */
> -	regmap_read(asrc->regmap, REG_ASRCTR, &asrctr);
> -	regmap_update_bits(asrc->regmap, REG_ASRCTR,
> -			   ASRCTR_ASRCEi_ALL_MASK, 0);
> -
> -	/* Restore all registers */
> -	regcache_cache_only(asrc->regmap, false);
> -	regcache_sync(asrc->regmap);
> -
> -	regmap_update_bits(asrc->regmap, REG_ASRCFG,
> -			   ASRCFG_NDPRi_ALL_MASK | ASRCFG_POSTMODi_ALL_MASK |
> -			   ASRCFG_PREMODi_ALL_MASK, asrc_priv->regcache_cfg);
> -
> -	/* Restart enabled pairs */
> -	regmap_update_bits(asrc->regmap, REG_ASRCTR,
> -			   ASRCTR_ASRCEi_ALL_MASK, asrctr);
> -
> -	return 0;
> -}
> -#endif /* CONFIG_PM_SLEEP */
> -
>  static const struct dev_pm_ops fsl_asrc_pm = {
>  	SET_RUNTIME_PM_OPS(fsl_asrc_runtime_suspend, fsl_asrc_runtime_resume, NULL)
> -	SET_SYSTEM_SLEEP_PM_OPS(fsl_asrc_suspend, fsl_asrc_resume)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
>  
>  static const struct fsl_asrc_soc_data fsl_asrc_imx35_data = {
> -- 
> 2.21.0
> 
