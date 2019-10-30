Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 383D4E9413
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 01:20:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472pxb1C3jzF3hp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 11:20:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="d6VYehVq"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472pvb5LjzzF3hY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 11:18:18 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id j22so235633pgh.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 17:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eL9nLhkFV+3fjZqHJucvMS1Z4avpEDieJP4rKaoqZys=;
 b=d6VYehVqNaBLztOnm+3wC0Y2Cp3OWS7oUyfmQU3cWBQlsNiwJyE0ktWOkED3EIadm3
 uheShic0KwVuxyjDgjUuT2kQhhyF5HVGhPA/jqlAJfycoSdfQ8kFbVKWhSCjJSsJoph2
 K4chyo/pgU81+3tgfMlrYy7ZvrwpHGoVJ+Ms8PNRRql6AYczh86QzTYwS4VhzG6IiZKe
 kxjc5ME/pSjJD3+PxHtJk5S/chLaPUZV1MFHhiSTheuPHK+cV/JDhaG4BNUrzgPEqv+o
 VlglM3QqZPomBtVA2mhSoUEdiECMpGQ3hrVRfB7Dk1IWHkZ9xfEnCIr7/jGWAxjXN90p
 GFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eL9nLhkFV+3fjZqHJucvMS1Z4avpEDieJP4rKaoqZys=;
 b=DnbpDUyQWGxky7yt8spNtFqScAi+VDnMKWheC7DdzClzRNM4MTMTa1Tj/t0JkMwAyq
 OIwPcgOJhrax/ONSbvrGmVhJPgnCpMMoO6MkpOZDGo/8XtuCHailUYsSLQZrl409wBo9
 BMwWnCmvZXRzO7oI3nMq6mm00XsH0JvIunb9xuDODyR1ZRneGuXsNWEXJBoK0pMemzX/
 94m+HuBRDj0JvveaAFG4P+iwHiT1EDdEdWl0qy1ZScCqMzwhoVxq8cq0ohROh+GbWL5O
 hJAuo3lPj2w9aOkS6rjIdeJaoTXdOJsLKO4dbbpJo27WApserB4Tb4eMVqZSa0mXjEL2
 WTBQ==
X-Gm-Message-State: APjAAAVj7P+tNgB/lmTMP1FHYKLpsK/i9EOZ6Im2TgvD5st48MQUrA88
 uSWR+4bF3C9BCKePXIpc+VM=
X-Google-Smtp-Source: APXvYqw0eHqTFbOpxspUUagZHSV8qs2zbtP3YZq4SWaoOEZYjhzimcKl2o0Wtc6rf4wFJf7fMv8AMQ==
X-Received: by 2002:a63:b144:: with SMTP id g4mr12268618pgp.87.1572394694419; 
 Tue, 29 Oct 2019 17:18:14 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id g17sm334431pgn.37.2019.10.29.17.18.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Oct 2019 17:18:14 -0700 (PDT)
Date: Tue, 29 Oct 2019 17:17:56 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_asrc: Add support for imx8qm
Message-ID: <20191030001756.GA19352@Asurada-Nvidia.nvidia.com>
References: <1572340629-20702-1-git-send-email-shengjiu.wang@nxp.com>
 <1572340629-20702-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572340629-20702-2-git-send-email-shengjiu.wang@nxp.com>
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

On Tue, Oct 29, 2019 at 05:17:09PM +0800, Shengjiu Wang wrote:
> There are two asrc module in imx8qm, each module has different
> clock configuration, and the DMA type is EDMA.
> 
> So in this patch, we define the new clocks, refine the clock map,
> and include struct fsl_asrc_soc_data for different soc usage.
> 
> The EDMA channel is fixed with each dma request, one dma request
> corresponding to one dma channel. So we need to request dma
> channel with dma request of asrc module.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c     | 91 +++++++++++++++++++++++++++++-------
>  sound/soc/fsl/fsl_asrc.h     | 65 +++++++++++++++++++++++++-
>  sound/soc/fsl/fsl_asrc_dma.c | 39 ++++++++++++----
>  3 files changed, 167 insertions(+), 28 deletions(-)

> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index d6146de9acd2..dbb07a486504 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -199,19 +199,40 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
>  
>  	/* Get DMA request of Back-End */
>  	tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
> -	tmp_data = tmp_chan->private;
> -	pair->dma_data.dma_request = tmp_data->dma_request;
> -	dma_release_channel(tmp_chan);
> +	/* tmp_chan may be NULL for it is already allocated by Back-End */
> +	if (tmp_chan) {
> +		tmp_data = tmp_chan->private;
> +		if (tmp_data)
> +			pair->dma_data.dma_request = tmp_data->dma_request;

If this patch is supposed to add a !tmp_chan case for EDMA, we
probably shouldn't mute the !tmp_data case because dma_request
will be NULL, although the code previously didn't have a check
either. I mean we might need to error-out for !tmp_chan. Or...
is this intentional?

> +		dma_release_channel(tmp_chan);
> +	}
>  
>  	/* Get DMA request of Front-End */
>  	tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
> -	tmp_data = tmp_chan->private;
> -	pair->dma_data.dma_request2 = tmp_data->dma_request;
> -	pair->dma_data.peripheral_type = tmp_data->peripheral_type;
> -	pair->dma_data.priority = tmp_data->priority;
> -	dma_release_channel(tmp_chan);
> +	if (tmp_chan) {
> +		tmp_data = tmp_chan->private;
> +		if (tmp_data) {

Same question here.

> +			pair->dma_data.dma_request2 = tmp_data->dma_request;
> +			pair->dma_data.peripheral_type =
> +				 tmp_data->peripheral_type;
> +			pair->dma_data.priority = tmp_data->priority;
> +		}
> +		dma_release_channel(tmp_chan);
> +	}
