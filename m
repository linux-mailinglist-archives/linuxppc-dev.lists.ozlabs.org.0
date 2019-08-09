Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5135E883A4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 22:03:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464x4W0hKLzDrC0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 06:03:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TkLm8gEE"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464wzp0Fw0zDrBd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 05:59:01 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id c3so23451687pfa.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Aug 2019 12:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ojmnuX0x32lHJ/D+75vj1kRonZuJ/g9iqnUm+zVivbQ=;
 b=TkLm8gEEMKiW84W4cgO3zvgYqub5DNNpfruKswekAOlUl+cYRrXISnfEwCNCJjld37
 MpnXIJSZYfTAJ83cPWQb7HnOdnU9IgacryuATqNKcAJ0pudFeHiW67gBlWLyB3qJ5fqD
 7n4PuWj/J6WOaJr/Sk1w0wBVupILPbLKDgFfc43Tv1X2pOyPHF0IAEGU+uB/aOFAoLjX
 32YgPYRRjSNnvYRpMZNAvNttfOf82m/5Uk1BbxQoPxIe8Sb+M7PTPI/QVGYDG/wrUvxZ
 vakjJnYA5CnIZFc0fT7s/kcB/Q/781RityGhOB9smsOtTHLVbY5MdFAO4CqyBYZFYmKk
 4USA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ojmnuX0x32lHJ/D+75vj1kRonZuJ/g9iqnUm+zVivbQ=;
 b=hLJ4oVr2YmN5fa35eGx2a4nbacaFBPqLaryUgUHH8gnuycHU9XVrBmYCbGx2yYDVSF
 npH2mlpaWAHusNBsNCwKBWHRseTIMnOaPkzuTYsFG+ene+SWn01uOFQrQb9zXZyyKzWM
 FDL2iauy2T46L9WT4dKowSHMuPaaPm1Ox7xKj/rOK5c4w16GsvTN8kmP2fOm+Oqfb9oy
 MrkfFdXDTFASZY3GqVHvrWDgGjN6z3W5KtwE21w2jOnvKrPtQrglHuW2HHuynbXddheq
 G8hwZRUMTaEU3LXf9DYkKJ+3ysyLH45IcQFTd8C+K01+4X4o5ePoo79hdu+x3Q3HMgcH
 UgVg==
X-Gm-Message-State: APjAAAUso8qMawhP6+/4J7HqDlJTTqyz5+JFV2TmZwkqCIhZmNQqx7bw
 JrHLs3W6FpyLOGkI0b4jKiA=
X-Google-Smtp-Source: APXvYqymbF/Bhg9bVlIjFmuXbUC94GuivHKAsuqe5AuDRK1+Hydo9/dP5KXtlzUlLvLE/7UKNhy1Bw==
X-Received: by 2002:aa7:9516:: with SMTP id b22mr23116258pfp.106.1565380738742; 
 Fri, 09 Aug 2019 12:58:58 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 e13sm121094779pff.45.2019.08.09.12.58.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 12:58:58 -0700 (PDT)
Date: Fri, 9 Aug 2019 12:58:46 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_esai: Add compatible string for imx6ull
Message-ID: <20190809195845.GB8148@Asurada>
References: <1565346467-5769-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565346467-5769-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 09, 2019 at 06:27:46PM +0800, Shengjiu Wang wrote:
> Add compatible string for imx6ull, from imx6ull platform,
> the issue of channel swap after xrun is fixed in hardware.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
>  sound/soc/fsl/fsl_esai.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index 10d2210c91ef..4b4a8e831e9e 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -920,6 +920,7 @@ static int fsl_esai_remove(struct platform_device *pdev)
>  static const struct of_device_id fsl_esai_dt_ids[] = {
>  	{ .compatible = "fsl,imx35-esai", },
>  	{ .compatible = "fsl,vf610-esai", },
> +	{ .compatible = "fsl,imx6ull-esai", },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, fsl_esai_dt_ids);
> -- 
> 2.21.0
> 
