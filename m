Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8C41139D7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 03:23:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Szz85ShVzDqYK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 13:23:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NELtG8K2"; 
 dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Szx04tNRzDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 13:21:21 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id v93so619551pjb.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Dec 2019 18:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JumaJpJPhmNfSvvvkz61jNW5BTSsDPkTym99dI21cw8=;
 b=NELtG8K2dfx3apc8E7BMQrUJfvTeRmPJjo/179dWN+u9bqC92MWHpqsHkTkdG9+tHF
 PkWc/QCeImujLtQRnf/3RUcmQEnVe0z/zZelOft28FusJuB78yRG3LRkTYee+U4vXvo0
 NOuCfiPqqDj241vOAHnEz9QUHIUElAqGuk4tPIXgcXhGQsbAcwCMKuyXfO4G9iUzkhvy
 UTtHcjNRw6czLtFkee5AzGgRcgr0EqkDnDvkpAdDOAeVjUChbuY7qAN8a2sBD91Sf5QU
 ZesxB54dEpcVcp16enpBExvDge265f35e/qjqs09wM/u8CM3orqeE+B/i4ZhyxRsnyhH
 CvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JumaJpJPhmNfSvvvkz61jNW5BTSsDPkTym99dI21cw8=;
 b=DJodbQe0r8mTJjrHIZbSLeX2mWH7m5dym83eiFc5kewe3fBjdb/K4uiAT4N2E087kM
 RabArJ8b/rC77HQ21JMtcyef6mS4saERc2sGYpfql7qHYaDasPj1NWLLK19W8shysG/p
 Q3apkf7Hnap2aP0zkFpLRDEzs1YqAf1fIEDXbj20kH/G4HH+J8tNEVdqY2TndvgRGpLb
 DR4VOJ0dZ0gxQ0pqIRB7mC0MA4zVfWay946HV7PtIqX1tqIMRwZ8/XtqNCP+l3MIenux
 APruH8PLadem+6QWrELjwTD14RULKxdp7W0Vsf5Fzuf4dOqZ9snMoZS1b7wgD8sqKO59
 9sqw==
X-Gm-Message-State: APjAAAVpnMZRzCdfOgBsarjD9zrlcN9Z+rQ2rns0Yf0IlUf39CrLGVWd
 gVMpoI0FUytP6lAjrn/poHk=
X-Google-Smtp-Source: APXvYqwb6wYTzOOyWbUQwbCr44Sh1Uouiz0Kb5BZ0Mc3ApMcrfMMebihBJVtLLPa9b3XOn+09sXF8w==
X-Received: by 2002:a17:90a:6484:: with SMTP id
 h4mr4335560pjj.84.1575512479426; 
 Wed, 04 Dec 2019 18:21:19 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id y38sm9041215pgk.33.2019.12.04.18.21.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 04 Dec 2019 18:21:19 -0800 (PST)
Date: Wed, 4 Dec 2019 18:17:57 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH] ASoC: fsl_sai: add IRQF_SHARED
Message-ID: <20191205021756.GA1122@Asurada-Nvidia.nvidia.com>
References: <20191128223802.18228-1-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128223802.18228-1-michael@walle.cc>
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
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 28, 2019 at 11:38:02PM +0100, Michael Walle wrote:
> The LS1028A SoC uses the same interrupt line for adjacent SAIs. Use
> IRQF_SHARED to be able to use these SAIs simultaneously.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks

> ---
>  sound/soc/fsl/fsl_sai.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index b517e4bc1b87..8c3ea7300972 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -958,7 +958,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return irq;
>  
> -	ret = devm_request_irq(&pdev->dev, irq, fsl_sai_isr, 0, np->name, sai);
> +	ret = devm_request_irq(&pdev->dev, irq, fsl_sai_isr, IRQF_SHARED,
> +			       np->name, sai);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to claim irq %u\n", irq);
>  		return ret;
> -- 
> 2.20.1
> 
