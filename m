Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FC6ADFE7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 22:22:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S01y4nSJzDqRR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 06:21:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hv0mLxLc"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Rzzz6qXRzDqGt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 06:20:13 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id x15so8470023pgg.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 13:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=f8kcD/av2IHtuxWBUd9aJrd7r9hFL0IzQqelqnKxuvQ=;
 b=Hv0mLxLcScQ94ymOj99jHE5Kt1cXtpZWue2SaJ5v6OKjJ7L7Ao4eWhXannThE12GW7
 Wmci9TLL/AR6PRHyLB0Vzog+19uWg4E1/Wh4sroDjJQQtKGvmyOj1OK7+pxbQv4DPC55
 SiExlpS1JidbNG1Zt22gYsII4PKp7RVNf7dPjpcaahb/ZV3ZF/nvnrvfuOLdP9kkwjZ1
 C3zLNhMfI+gSlZAByou/WFjhDKrnZxdjifSD8dlozMMvgWBVEpcdy9VtDy4UCkoXWpIl
 n1jg2pl9cWP3Bdf53t4EUovTYOauq8gC109oHaF7/HBraLt4RfNnL/DVqPZEjwWy2aFm
 LzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f8kcD/av2IHtuxWBUd9aJrd7r9hFL0IzQqelqnKxuvQ=;
 b=Mt29fVvkwmc6siAmLGU1nPCZHrYeSg7dk1OetLZjwkBoea5sgHCngb28rrBV45Om71
 uUAO8II3tr5pCO0Zh5k2KG9xyxAwiIMGHwlbAAjnd8PlkNj0yOVKipxV48ZYobV1EOYY
 MJdvVSthm/zzdF84jZfKchbnHvNU65zLzes7l1XQBImD7SvTjgj8nLBuX8wiJTiAJ0Xp
 JaJRobgWdNKaVeSDSVi+EJoL4AKjXS/QA1qag/t6XqH5e3XWLwItcqUqWsjkMjr1z504
 /1b9fYhmBcCLDeqlxuo22RfDauhq/Nc7KKaUY15OKq3cuk/7ZQP7g9eH4mq1m2pxSabP
 nfew==
X-Gm-Message-State: APjAAAX7LP0sYP8czyrV7W7FOUrluEn8uGyZFWgpJDw4DlxTO0J2dDRX
 HZN4SOZMDjQ1a+bf9llINv4=
X-Google-Smtp-Source: APXvYqzFYT+lG/hdw0tQ+UPPVLQYZKqrbn7uN1Vn51POIuZlnzmyKI1abdpHBuq7s3lqUdd3yDYsSg==
X-Received: by 2002:a63:3046:: with SMTP id w67mr24304918pgw.37.1568060409962; 
 Mon, 09 Sep 2019 13:20:09 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id r30sm32034684pfl.42.2019.09.09.13.20.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Sep 2019 13:20:09 -0700 (PDT)
Date: Mon, 9 Sep 2019 13:19:45 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_asrc: update supported sample format
Message-ID: <20190909201945.GC10344@Asurada-Nvidia.nvidia.com>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <f62fda1f49af8159eb23a978147a321dd6849d1a.1568025083.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f62fda1f49af8159eb23a978147a321dd6849d1a.1568025083.git.shengjiu.wang@nxp.com>
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
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 09, 2019 at 06:33:20PM -0400, Shengjiu Wang wrote:
> The ASRC support 24bit/16bit/8bit input width, so S20_3LE format
> should not be supported, it is word width is 20bit.

I thought 3LE used 24-bit physical width. And the driver assigns
ASRC_WIDTH_24_BIT to "width" for all non-16bit cases, so 20-bit
would go for that 24-bit slot also. I don't clearly recall if I
had explicitly tested S20_3LE, but I feel it should work since
I put there...

Thanks
Nicolin

> So replace S20_3LE with S24_3LE in supported list and add S8
> format in TX supported list
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 4d3804a1ea55..584badf956d2 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -624,7 +624,7 @@ static int fsl_asrc_dai_probe(struct snd_soc_dai *dai)
>  
>  #define FSL_ASRC_FORMATS	(SNDRV_PCM_FMTBIT_S24_LE | \
>  				 SNDRV_PCM_FMTBIT_S16_LE | \
> -				 SNDRV_PCM_FMTBIT_S20_3LE)
> +				 SNDRV_PCM_FMTBIT_S24_3LE)
>  
>  static struct snd_soc_dai_driver fsl_asrc_dai = {
>  	.probe = fsl_asrc_dai_probe,
> @@ -635,7 +635,8 @@ static struct snd_soc_dai_driver fsl_asrc_dai = {
>  		.rate_min = 5512,
>  		.rate_max = 192000,
>  		.rates = SNDRV_PCM_RATE_KNOT,
> -		.formats = FSL_ASRC_FORMATS,
> +		.formats = FSL_ASRC_FORMATS |
> +			   SNDRV_PCM_FMTBIT_S8,
>  	},
>  	.capture = {
>  		.stream_name = "ASRC-Capture",
> -- 
> 2.21.0
> 
