Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247A5E0AB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 11:13:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dwPV6K4LzDqQl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 19:13:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ObWcSxFy"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dwM83YDzzDqPb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 19:10:59 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id t16so923830pfe.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=As2upjpnu0eNfhcHUKlBkgyy1u4yzbeYFixzSKqaDY4=;
 b=ObWcSxFyx81NI2OD5AYV1+2zf6+ZncHg9EmE7AwksRacdzCfdlIP0d9ckHlCSk+hAE
 lkIF1fwAfUwolfL8XdbQ0DqaD6bt2B1+RCqafwyRLeiMOQNEtmTnoR/6nVgXwKXbm9sU
 uxSk7sytU9XzbuoPWfaw76VZJQcVDVWHZ8tWKtLZL28YnSLgT0hSP9zD11bnACe+24F7
 GnFTEl6L7+NzdthUoBXS60y3CmnZ9N3bq1xqzwdpXzMQwLoKEITiT6AmxobFJbRpkujk
 3m+ymw+NthAjrjGNfrbA2ry19Ag6AnfdneyhwF0MwTOfOC5UVUgYLyt69JILg9kL5Zva
 DKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=As2upjpnu0eNfhcHUKlBkgyy1u4yzbeYFixzSKqaDY4=;
 b=mhcWZzitY4mEXndsACXBK6BVdI+fjuDFYmrIMeV+i5OjsaMvIhqcjeWXKBinLr9jvj
 pQ4eQpWPinlmlhw4PcDcLnk4wl5PLGgCJzoBks9AIqiAXhFEmYnivmWh/hEqSm3BgeLy
 C0atYRsEVzn5iqok1bZGAifc35AB5XqB3dMeVUuNGOGa3sXXthkA6pTRA+qjl4Aw8PFO
 7oodcEzy6gUglsnn75fmFaxBfDX2ZBSFDQ09rXqUVnaApkpW1/IX2AXW6XR4SznN+pBh
 2pMA0n0DSUJyzrBI+KWuohoJNYB8fhcdOw5bT69Cj0OGWuLZKDxcvx+V1cJLMUkY0zoY
 TP1Q==
X-Gm-Message-State: APjAAAWA4K9AzPBX07jZ5pEZgQrJxP6s7sNSz80Bx2HR5j7b+2Iu2ET8
 pUHGGcfzbe43pE4G6mqyCLw=
X-Google-Smtp-Source: APXvYqzFCXmdRw6ALVWTUgHPfy1hOiev9xTr20YFwbNlADqhKzfB6/Es/73il0GfRP7q2dFFqSPcKA==
X-Received: by 2002:a17:90a:ac14:: with SMTP id
 o20mr11615624pjq.114.1562145057087; 
 Wed, 03 Jul 2019 02:10:57 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 x1sm1350046pjo.4.2019.07.03.02.10.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 02:10:56 -0700 (PDT)
Date: Wed, 3 Jul 2019 02:10:46 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: shengjiu.wang@nxp.com
Subject: Re: [PATCH V2 1/2] ASoC: fsl_esai: Wrap some operations to be
 functions
Message-ID: <20190703091046.GA8764@Asurada>
References: <cover.1562136119.git.shengjiu.wang@nxp.com>
 <f57c5a045c6e5491b1bc9831388eab2c88773176.1562136119.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f57c5a045c6e5491b1bc9831388eab2c88773176.1562136119.git.shengjiu.wang@nxp.com>
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
 festevam@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks good to me, yet two small comments inline.

Please add this to this patch in the next version:
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

On Wed, Jul 03, 2019 at 02:42:04PM +0800, shengjiu.wang@nxp.com wrote:
> +static int fsl_esai_register_restore(struct fsl_esai *esai_priv)
> +{
> +	int ret;
> +	/* FIFO reset for safety */
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,

Checkpatch script would probably warn this. Usually we add a blank
line after variable declarations.

> @@ -866,22 +935,9 @@ static int fsl_esai_probe(struct platform_device *pdev)
>  
>  	dev_set_drvdata(&pdev->dev, esai_priv);
>  
> -	/* Reset ESAI unit */
> -	ret = regmap_write(esai_priv->regmap, REG_ESAI_ECR, ESAI_ECR_ERST);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to reset ESAI: %d\n", ret);
> +	ret = fsl_esai_init(esai_priv);

Could we rename this function to fsl_easi_hw_init() or something
clear like fsl_esai_register_init? fsl_easi_init() feels like a
driver init() function to me.

Thank you
Nicolin
