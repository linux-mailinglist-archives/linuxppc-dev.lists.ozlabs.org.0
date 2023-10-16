Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7227CA6F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 13:51:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=nW8JwL/T;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AF28Q16d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8Fnl0Fgpz3c56
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 22:51:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=nW8JwL/T;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AF28Q16d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=jannau.net (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com; envelope-from=j@jannau.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 353 seconds by postgrey-1.37 at boromir; Mon, 16 Oct 2023 22:50:50 AEDT
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8Fmp1TGvz2yLr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 22:50:50 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 3011758034D;
	Mon, 16 Oct 2023 07:44:51 -0400 (EDT)
Received: from imap53 ([10.202.2.103])
  by compute1.internal (MEProxy); Mon, 16 Oct 2023 07:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1697456691; x=1697460291; bh=3C
	1PfPveiaRs3ElXRm2Ihf7X0mwxNyKdWtRCHHHpbpo=; b=nW8JwL/TTNFtxwc2UK
	CF+NkCnYs9+Td4HriptzKiYQTQmo++kTw+gxYsEctgs6XpUJfBMtN08wyVqipPYV
	DVQAEpG3no+3Pr/JHa9L9+j59kFTCUbpaVV8XNZUiToWTN7kVOKJ/t9Jn03kqIW8
	8PvCtnW6dM8mnlkVk+5aFFHcTf4Mchz5KtlsKM5PjlHW4OPC7xtML/jBnqTFUUWv
	MJ8szAs9pCB1CIZdhvEDLkSUsx3H59DMMSwEysjCS/MPcBCU2WvVypxLYqNZl/Og
	pHvABZlGaTzQCPBUQ+tIkJAxr4LIAyY4ASUWSw3C9YNeHSNFFGZ4i/IDvfIoXLau
	7lMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1697456691; x=1697460291; bh=3C1PfPveiaRs3
	ElXRm2Ihf7X0mwxNyKdWtRCHHHpbpo=; b=AF28Q16dg412MfVbXAXSTcwqZzLgs
	0BmuDR5X2adEVDx0SNfpNpAfR/fKtkDmWT7qhlscnr4A/bN6Kk6+LifFP5t5qa25
	erCG1gLeiiSnWxDLsQnJqYHssS9Btp+oiyRI+W1frAHFD+tNFe7r9RBHQZyuVFhY
	I9oa2En/l8ABUYjKH5WD/wZdCznHGSYaAd0shVSPUOxx6w0kUg3lOVtEo3RYVJHH
	01shsYNPD//w+6KnTtIeBnJKaQERy8ZS7vUdi9BjHT5XBdYfS8jVxxQKugD3gb5i
	Nz+v9xD63rcv88VLvVkEOjZShxP7V+CIldAQX0ougMf4LhyuZFlGsEUYA==
X-ME-Sender: <xms:MSItZZNDGu6k9bRZ3WhGgvGMiInakhaEopTlfaLZ2EH24xUWz8i7rw>
    <xme:MSItZb_zXgdaESj-avPZXoF-_q7iPLmKfbXWvtj2x66XKECQk2XBVzFHxAFZTGRr7
    mW_4M-Er2TceJtJDiY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjedtgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdflrghn
    nhgvucfirhhunhgruhdfuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrh
    hnpeevvdfhtddvvddtgffggfeuteduhfeigeevfeffueekheetffekjeehjeefhfeitden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrg
    hnnhgruhdrnhgvth
X-ME-Proxy: <xmx:MSItZYS637994kT_xsAHEBWDws37IUZPhHpeuCyoZt1m2W02MxuGFw>
    <xmx:MSItZVtuaGJQpUfpmnsVy_fi5RBdrJipuKkBUx_QQ-EiHrAuAcdNIg>
    <xmx:MSItZReDxJvIX9a4wA08kLZ1vNf77NZRCnZameqwwxuQvuJbycCfQA>
    <xmx:MyItZc35kZ09XlJiHtxn5ky_KhbYa-UMT89LGIohaJO0CFcIVoYVJQ>
Feedback-ID: i47b949f6:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 81B0C36409AE; Mon, 16 Oct 2023 07:44:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1019-ged83ad8595-fm-20231002.001-ged83ad85
MIME-Version: 1.0
Message-Id: <2111fedf-a690-453a-a705-6e9b8141d93d@app.fastmail.com>
In-Reply-To: <9-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
References: <9-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
Date: Mon, 16 Oct 2023 13:44:29 +0200
From: "Janne Grunau" <j@jannau.net>
To: "Jason Gunthorpe" <jgg@nvidia.com>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "David Woodhouse" <dwmw2@infradead.org>, iommu@lists.linux.dev,
 "Joerg Roedel" <joro@8bytes.org>, "Kevin Tian" <kevin.tian@intel.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 "Hector Martin" <marcan@marcan.st>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Sven Peter" <sven@svenpeter.dev>, "Will Deacon" <will@kernel.org>
Subject: Re: [PATCH v2 9/9] iommu/dart: Remove the force_bypass variable
Content-Type: text/plain
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
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hej,

On Thu, Sep 28, 2023, at 01:47, Jason Gunthorpe wrote:
> This flag just caches if the IO page size is larger than the CPU
> PAGE_SIZE. This only needs to be checked in two places so remove the
> confusingly named cache.
>
> dart would like to not support paging domains at all if the IO page size
> is larger than the CPU page size. In this case we should ideally fail
> domain_alloc_paging(), as there is no point in creating a domain that can
> never be attached. Move the test into apple_dart_finalize_domain().
>
> The check in apple_dart_mod_streams() will prevent the domain from being
> attached to the wrong dart
>
> There is no HW limitation that prevents BLOCKED domains from working,
> remove that test.
>
> The check in apple_dart_of_xlate() is redundant since immediately after
> the pgsize is checked. Remove it.
>
> Remove the variable.
>
> Suggested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/apple-dart.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index 126da0d89f0dd4..821b4a3465dfb9 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -196,7 +196,6 @@ struct apple_dart_hw {
>   * @lock: lock for hardware operations involving this dart
>   * @pgsize: pagesize supported by this DART
>   * @supports_bypass: indicates if this DART supports bypass mode
> - * @force_bypass: force bypass mode due to pagesize mismatch?
>   * @sid2group: maps stream ids to iommu_groups
>   * @iommu: iommu core device
>   */
> @@ -217,7 +216,6 @@ struct apple_dart {
>  	u32 pgsize;
>  	u32 num_streams;
>  	u32 supports_bypass : 1;
> -	u32 force_bypass : 1;
> 
>  	struct iommu_group *sid2group[DART_MAX_STREAMS];
>  	struct iommu_device iommu;
> @@ -576,6 +574,9 @@ static int apple_dart_finalize_domain(struct 
> apple_dart_domain *dart_domain,
>  	int ret = 0;
>  	int i, j;
> 
> +	if (dart->pgsize > PAGE_SIZE)
> +		return -EINVAL;
> +
>  	mutex_lock(&dart_domain->init_lock);
> 
>  	if (dart_domain->finalized)
> @@ -659,9 +660,6 @@ static int apple_dart_attach_dev_paging(struct 
> iommu_domain *domain,
>  	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
>  	struct apple_dart_domain *dart_domain = to_dart_domain(domain);
> 
> -	if (cfg->stream_maps[0].dart->force_bypass)
> -		return -EINVAL;
> -
>  	ret = apple_dart_finalize_domain(dart_domain, cfg);
>  	if (ret)
>  		return ret;
> @@ -706,9 +704,6 @@ static int apple_dart_attach_dev_blocked(struct 
> iommu_domain *domain,
>  	struct apple_dart_stream_map *stream_map;
>  	int i;
> 
> -	if (cfg->stream_maps[0].dart->force_bypass)
> -		return -EINVAL;
> -
>  	for_each_stream_map(i, cfg, stream_map)
>  		apple_dart_hw_disable_dma(stream_map);
>  	return 0;
> @@ -803,8 +798,6 @@ static int apple_dart_of_xlate(struct device *dev, 
> struct of_phandle_args *args)
>  	if (cfg_dart) {
>  		if (cfg_dart->supports_bypass != dart->supports_bypass)
>  			return -EINVAL;
> -		if (cfg_dart->force_bypass != dart->force_bypass)
> -			return -EINVAL;
>  		if (cfg_dart->pgsize != dart->pgsize)
>  			return -EINVAL;
>  	}
> @@ -946,7 +939,7 @@ static int apple_dart_def_domain_type(struct device 
> *dev)
>  {
>  	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
> 
> -	if (cfg->stream_maps[0].dart->force_bypass)
> +	if (cfg->stream_maps[0].dart->pgsize > PAGE_SIZE)
>  		return IOMMU_DOMAIN_IDENTITY;
>  	if (!cfg->stream_maps[0].dart->supports_bypass)
>  		return IOMMU_DOMAIN_DMA;
> @@ -1146,8 +1139,6 @@ static int apple_dart_probe(struct platform_device *pdev)
>  		goto err_clk_disable;
>  	}
> 
> -	dart->force_bypass = dart->pgsize > PAGE_SIZE;
> -
>  	ret = apple_dart_hw_reset(dart);
>  	if (ret)
>  		goto err_clk_disable;
> @@ -1171,7 +1162,8 @@ static int apple_dart_probe(struct 
> platform_device *pdev)
>  	dev_info(
>  		&pdev->dev,
>  		"DART [pagesize %x, %d streams, bypass support: %d, bypass forced: 
> %d] initialized\n",
> -		dart->pgsize, dart->num_streams, dart->supports_bypass, 
> dart->force_bypass);
> +		dart->pgsize, dart->num_streams, dart->supports_bypass,
> +		dart->pgsize > PAGE_SIZE);
>  	return 0;
> 
>  err_sysfs_remove:
> -- 

Reviewed-by: Janne Grunau <j@jannau.net>

thanks,
Janne
