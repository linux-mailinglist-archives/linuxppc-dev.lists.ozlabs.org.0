Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D766C1139DC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 03:25:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47T01R4w4czDqXP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 13:25:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aglRMlJM"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SzzL1CJnzDqYM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 13:23:26 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id b1so809978pgq.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Dec 2019 18:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=H1VUU4rUNg7kFJO0xACp+i6rdKuZ6Hw04Q1UCWcIN1I=;
 b=aglRMlJMdAULGfV+4x2klYHp9oyyrIwz3f1q0hoDKQJotHgJodNQPgDvNbiZevppxo
 BQM6xM/mqyzPvkKf7kt4NMp59Sm9OQCTMpy1gDhVWEH3tfO079d/zDI3qGeovh98hDKE
 VeVC5xtkNdnKAnjJCHBbaMTazkMa/jsA+8xUcqSrA0mq3oOo2NENR4XY1WexeTw+VyxJ
 /vTvSm5xCYVi9dBv/k7miIdxyLqSwKBpelvVPgcYzA3n2FFo597Z3mh++tJtZJKzroYC
 95t1Ad8Ibr0gUrZmOJDiJhST1NjFBqLSKMa48T55xBKnfKKH5fJOKUNcIotF/8F3p1If
 TwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=H1VUU4rUNg7kFJO0xACp+i6rdKuZ6Hw04Q1UCWcIN1I=;
 b=jIws7xOe/MHXfRQL/qKmDXGJIqv6/zsDrmHPdrqhRiJfHo7VFWZ++QHMro1FjYoUrP
 ZWncZDR1Z2LStZpMeTLQwAs66QLXfrfhKL9vFJZzkqUS3lwcgSBT0ktZbhM41l7uam9R
 RQO+KwZ+CM6E/qul2h6DuR7kGe3oVRjSJo/GfGvk59PuhweEzlPRaV5+XEewc1D007H8
 M3PHMB9H+rYWEZDRHB85dDLAAGPkWlW15w3yNOl1TEAiihmEfFJPzria7BVyv90/20nB
 EOKckaIBeUkVYWlqCFcVVP1VOQCY6zGsQldiQs00jXr9J53HdfweBqNHJZoJWjN3VmEt
 3LtA==
X-Gm-Message-State: APjAAAU5kwUgyfk7oll1Tuj/ZH1Bbe5/TOLp8ME82FSii8AowaCSuR+B
 Mo/SKC0at64Jhb/NCeNJ2oY=
X-Google-Smtp-Source: APXvYqzkjBxfnQeluO+tqp7YsVDUANm1utWoTgwzql0A8Bkxp/7Um+nIn79aONqUfWZ+c2qIO6OiWQ==
X-Received: by 2002:a65:4381:: with SMTP id m1mr6893645pgp.43.1575512596508;
 Wed, 04 Dec 2019 18:23:16 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id d26sm8722858pgv.66.2019.12.04.18.23.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 04 Dec 2019 18:23:16 -0800 (PST)
Date: Wed, 4 Dec 2019 18:19:56 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Chuhong Yuan <hslester96@gmail.com>
Subject: Re: [PATCH resend] ASoC: fsl_audmix: add missed pm_runtime_disable
Message-ID: <20191205021955.GB1122@Asurada-Nvidia.nvidia.com>
References: <20191203111303.12933-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203111303.12933-1-hslester96@gmail.com>
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 03, 2019 at 07:13:03PM +0800, Chuhong Yuan wrote:
> The driver forgets to call pm_runtime_disable in probe failure
> and remove.
> Add the missed calls to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks

> ---
>  sound/soc/fsl/fsl_audmix.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> index a1db1bce330f..5faecbeb5497 100644
> --- a/sound/soc/fsl/fsl_audmix.c
> +++ b/sound/soc/fsl/fsl_audmix.c
> @@ -505,15 +505,20 @@ static int fsl_audmix_probe(struct platform_device *pdev)
>  					      ARRAY_SIZE(fsl_audmix_dai));
>  	if (ret) {
>  		dev_err(dev, "failed to register ASoC DAI\n");
> -		return ret;
> +		goto err_disable_pm;
>  	}
>  
>  	priv->pdev = platform_device_register_data(dev, mdrv, 0, NULL, 0);
>  	if (IS_ERR(priv->pdev)) {
>  		ret = PTR_ERR(priv->pdev);
>  		dev_err(dev, "failed to register platform %s: %d\n", mdrv, ret);
> +		goto err_disable_pm;
>  	}
>  
> +	return 0;
> +
> +err_disable_pm:
> +	pm_runtime_disable(dev);
>  	return ret;
>  }
>  
> @@ -521,6 +526,8 @@ static int fsl_audmix_remove(struct platform_device *pdev)
>  {
>  	struct fsl_audmix *priv = dev_get_drvdata(&pdev->dev);
>  
> +	pm_runtime_disable(&pdev->dev);
> +
>  	if (priv->pdev)
>  		platform_device_unregister(priv->pdev);
>  
> -- 
> 2.24.0
> 
