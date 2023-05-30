Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B387171D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 01:39:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QW8546hywz3f6b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 09:39:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fvcRwGGO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fvcRwGGO;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QW8484XWNz3bnP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 09:39:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=1Dw3EGfLZhFfy3+wVtWlL1NBwMICEGnt2pRJcPI4ppc=; b=fvcRwGGOaprOoxX4TJWrFse6e1
	eoOnh5Rd2CCbsl8XoPZzPp99q95sd/oH8XyWBxgUoaZw3ca/YmpXf7A4NUCAsICkiVq9d8DWNElHw
	hfGh5noP4xw7VhxbYtmPCZCjj58qK5PmbmS5Yn2EZoM3VUcFqYrA+gKrMMIby6G7m88gnAG3zIw+h
	LyI/ybyTq2BuQM1VqaRDT6YXKE2oDGvtVjWZhmJzdbXkBha6mcRJm2V3P/zf9SYtT/vIWmbUcE6tF
	ebHpJ+B+eGhOVyonYQBokmQZd/ABlFNyG2DlzrYTUTFR9FPOk1hCeaA2eldGt1RQOm9S8aycKQlel
	6aIUMNog==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q48vX-00FUrv-08;
	Tue, 30 May 2023 23:38:55 +0000
Message-ID: <71922379-ee3d-9d6d-33dd-edcf8ef7508e@infradead.org>
Date: Tue, 30 May 2023 16:38:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 RESEND] ASoC: fsl MPC52xx drivers require PPC_BESTCOMM
Content-Language: en-US
To: linux-kernel@vger.kernel.org
References: <20230521225702.1608-1-rdunlap@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230521225702.1608-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello maintainers,

I am still seeing these build errors on linux-next-20230530.

Is there a problem with the patch?
Thanks.

On 5/21/23 15:57, Randy Dunlap wrote:
> Both SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA select
> SND_SOC_MPC5200_AC97. The latter symbol depends on PPC_BESTCOMM,
> so the 2 former symbols should also depend on PPC_BESTCOMM since
> "select" does not follow any dependency chains.
> 
> This prevents a kconfig warning and build errors:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
>   Depends on [n]: SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
>   Selected by [m]:
>   - SND_MPC52xx_SOC_PCM030 [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC5200_SIMPLE [=y]
>   - SND_MPC52xx_SOC_EFIKA [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_EFIKA [=y]
> 
> ERROR: modpost: "mpc5200_audio_dma_destroy" [sound/soc/fsl/mpc5200_psc_ac97.ko] undefined!
> ERROR: modpost: "mpc5200_audio_dma_create" [sound/soc/fsl/mpc5200_psc_ac97.ko] undefined!
> 
> Fixes: 40d9ec14e7e1 ("ASoC: remove BROKEN from Efika and pcm030 fabric drivers")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Xiubo Li <Xiubo.Lee@gmail.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> ---
> v2: use correct email address for Mark Brown.
> 
>  sound/soc/fsl/Kconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff -- a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
> --- a/sound/soc/fsl/Kconfig
> +++ b/sound/soc/fsl/Kconfig
> @@ -243,7 +243,7 @@ config SND_SOC_MPC5200_AC97
>  
>  config SND_MPC52xx_SOC_PCM030
>  	tristate "SoC AC97 Audio support for Phytec pcm030 and WM9712"
> -	depends on PPC_MPC5200_SIMPLE
> +	depends on PPC_MPC5200_SIMPLE && PPC_BESTCOMM
>  	select SND_SOC_MPC5200_AC97
>  	select SND_SOC_WM9712
>  	help
> @@ -252,7 +252,7 @@ config SND_MPC52xx_SOC_PCM030
>  
>  config SND_MPC52xx_SOC_EFIKA
>  	tristate "SoC AC97 Audio support for bbplan Efika and STAC9766"
> -	depends on PPC_EFIKA
> +	depends on PPC_EFIKA && PPC_BESTCOMM
>  	select SND_SOC_MPC5200_AC97
>  	select SND_SOC_STAC9766
>  	help

-- 
~Randy
