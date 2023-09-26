Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF737AF5B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 23:28:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=jannau.net header.i=@jannau.net header.a=rsa-sha1 header.s=fm1 header.b=p7lUbVcI;
	dkim=permerror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha1 header.s=i47b949f6.fm2 header.b=n6zMX99n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwCXQ0Rxqz3cBY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 07:28:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=p7lUbVcI;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=i47b949f6.fm2 header.b=n6zMX99n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=jannau.net (client-ip=64.147.123.18; helo=wnew4-smtp.messagingengine.com; envelope-from=janne@jannau.net; receiver=lists.ozlabs.org)
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rw8MJ1RSmz30fm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 05:05:16 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id C5FB42B00139;
	Tue, 26 Sep 2023 15:05:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 26 Sep 2023 15:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695755112; x=1695758712; bh=J7
	exHnsQYRJBdZItKfcOQx1NZselfQyXQouqmOrn0xs=; b=p7lUbVcIVde+aCTFxF
	MXrRvMzhb72YSlrsH0UEZmx96IucjYqoiUcTDgVEIm7HrdQnDCqsPxaGg5BXaAxA
	AbfvXlJLsm8jjR3OF8eowUHLUvehu3cMGh9YrHsoNcDFLjjrtlbF0BIBo3ZDVZv0
	vRNZxAmwP+6BbbiXyWlt6NzsIlEcxfB2vymqEJjW+bk1JQi1Rk3x4aK+1rAZXTRt
	yd3vJzXU5EMBUta43wstc4SbHfLb3/zqsLVcfQH1WtnM4f7BGF9s0vkbz+82lSwL
	rar3skmax3L50u5b2OOKj9mh8s/nmzmOPu2x8J4bM8n21VG2ibcPga7ug1hEtNEa
	53oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=i47b949f6.fm2; t=1695755112; x=1695758712; bh=J7e
	xHnsQYRJBdZItKfcOQx1NZselfQyXQouqmOrn0xs=; b=n6zMX99nghX3F9xryXH
	Yle+J77pYkaPpUQ9LWyXGG7ttU4OteqUOrOTsR58wKHeqBK6MaF0MXka82mq2KRm
	NoH80lD7MTFHzqtoXnuGaRYe+U0a10N6UAONP3EesFZipqy4pmpic7YRioUVjEWY
	xLSd3aJaQoh6ZVX03n5u2mbRPLVu6GifXo9JT+/ODBX2HInnRHF9u3i+gBptCptb
	juFETw7TanVCqhOkC787gKnY6X8XC6fJ3ZqHDknX32LLJSoctFF8wqiRRkGMc3pf
	gb8CJ05LVFxLjIK4clV107IDCZK7dTPKdO4CxVCcpdEWM4fYF99QPe+a5HYJ9UA1
	vhQ==
X-ME-Sender: <xms:ZisTZdWSKiiYwmYS5jGIvTM7NDShNLJT3FlyEQzEolrCqKRiVX3dKQ>
    <xme:ZisTZdn-XbR5VN1HUqBsQx448S0RkO7Jbz7X05JBwHe1CJ8hv2m2XDgZuZ8A2ju-o
    BMh2nuw0E3Qhf7M4ew>
X-ME-Received: <xmr:ZisTZZbQaFROuammzp06jq-2ed30DlG_G0r1Iqx8ThH_XqKC4eSNbb_rJ5pDUWTxr2QaVBHOZUHj1oCz9TrU8rlKdBpOsqhliQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvjedrtddtgddutdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhn
    vgcuifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpe
    fgvdffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjrghnnhgvse
    hjrghnnhgruhdrnhgvth
X-ME-Proxy: <xmx:ZisTZQUAM7-KVpz2w1AXceueDy79IL6f3QzhNl6W0C17gJ9cfWqGEw>
    <xmx:ZisTZXlEm9F514jffVQExC9xlHDQ4HWHE_HUFDxp9eOYwzmqy7bTOA>
    <xmx:ZisTZdd5E01EC5PqddByG_RlvoV0no5jPmsZyxCJtuOvCPMbRsClEQ>
    <xmx:ZysTZfnywZnQWuN2JkCRYtVbjIhjTDXX1Uu4uijFZyndgHdnwisRazF76lk>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Sep 2023 15:05:09 -0400 (EDT)
Date: Tue, 26 Sep 2023 21:05:08 +0200
From: Janne Grunau <j@jannau.net>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 6/8] iommu/dart: Move the blocked domain support to a
 global static
Message-ID: <ZRMrZJ1HgpULWeyv@robin>
References: <0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
 <6-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
X-Mailman-Approved-At: Wed, 27 Sep 2023 07:27:38 +1000
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
Cc: linux-arm-kernel@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>, Sven Peter <sven@svenpeter.dev>, linuxppc-dev@lists.ozlabs.org, Joerg Roedel <joro@8bytes.org>, Hector Martin <marcan@marcan.st>, Nicholas Piggin <npiggin@gmail.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, asahi@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hej,

On Fri, Sep 22, 2023 at 02:07:57PM -0300, Jason Gunthorpe wrote:
> Move to the new static global for blocked domains. Move the blocked
> specific code to apple_dart_attach_dev_blocked().
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/apple-dart.c | 36 ++++++++++++++++++++++++++----------
>  1 file changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index 424f779ccc34df..376f4c5461e8f7 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -675,10 +675,6 @@ static int apple_dart_attach_dev(struct iommu_domain *domain,
>  		for_each_stream_map(i, cfg, stream_map)
>  			apple_dart_setup_translation(dart_domain, stream_map);
>  		break;
> -	case IOMMU_DOMAIN_BLOCKED:
> -		for_each_stream_map(i, cfg, stream_map)
> -			apple_dart_hw_disable_dma(stream_map);
> -		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -710,6 +706,30 @@ static struct iommu_domain apple_dart_identity_domain = {
>  	.ops = &apple_dart_identity_ops,
>  };
>  
> +static int apple_dart_attach_dev_blocked(struct iommu_domain *domain,
> +					 struct device *dev)
> +{
> +	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
> +	struct apple_dart_stream_map *stream_map;
> +	int i;
> +
> +	if (cfg->stream_maps[0].dart->force_bypass)
> +		return -EINVAL;

unrelated to this change as this keeps the current behavior but I think
force_bypass should not override IOMMU_DOMAIN_BLOCKED. It is set if the
CPU page size is smaller than dart's page size. Obviously dart can't
translate in that situation but it should be still possible to block it
completely.

How do we manage this? I can write a patch either to the current state
or based on this series.

> +
> +	for_each_stream_map(i, cfg, stream_map)
> +		apple_dart_hw_disable_dma(stream_map);
> +	return 0;
> +}
> +
> +static const struct iommu_domain_ops apple_dart_blocked_ops = {
> +	.attach_dev = apple_dart_attach_dev_blocked,
> +};
> +
> +static struct iommu_domain apple_dart_blocked_domain = {
> +	.type = IOMMU_DOMAIN_BLOCKED,
> +	.ops = &apple_dart_blocked_ops,
> +};
> +
>  static struct iommu_device *apple_dart_probe_device(struct device *dev)
>  {
>  	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
> @@ -739,8 +759,7 @@ static struct iommu_domain *apple_dart_domain_alloc(unsigned int type)
>  {
>  	struct apple_dart_domain *dart_domain;
>  
> -	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED &&
> -	    type != IOMMU_DOMAIN_BLOCKED)
> +	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED)
>  		return NULL;
>  
>  	dart_domain = kzalloc(sizeof(*dart_domain), GFP_KERNEL);
> @@ -749,10 +768,6 @@ static struct iommu_domain *apple_dart_domain_alloc(unsigned int type)
>  
>  	mutex_init(&dart_domain->init_lock);
>  
> -	/* no need to allocate pgtbl_ops or do any other finalization steps */
> -	if (type == IOMMU_DOMAIN_BLOCKED)
> -		dart_domain->finalized = true;
> -
>  	return &dart_domain->domain;
>  }
>  
> @@ -966,6 +981,7 @@ static void apple_dart_get_resv_regions(struct device *dev,
>  
>  static const struct iommu_ops apple_dart_iommu_ops = {
>  	.identity_domain = &apple_dart_identity_domain,
> +	.blocked_domain = &apple_dart_blocked_domain,
>  	.domain_alloc = apple_dart_domain_alloc,
>  	.probe_device = apple_dart_probe_device,
>  	.release_device = apple_dart_release_device,
> -- 
> 2.42.0

Reviewed-by: Janne Grunau <j@jannau.net>

best regards
Janne

ps: I sent the reply to [Patch 4/8] accidentally with an incorrect from
address but the correct Reviewed-by:. I can resend if necessary.
