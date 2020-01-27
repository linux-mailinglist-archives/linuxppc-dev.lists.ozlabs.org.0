Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0BF14A8FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2020 18:32:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 485xdY3lRLzDqJl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 04:32:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 485xbb45crzDqFm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 04:30:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gbbSKgJD; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 485xbb0tb7z99nZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 04:30:35 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 485xbZ6Wc9z9sRs; Tue, 28 Jan 2020 04:30:34 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c42;
 helo=mail-yw1-xc42.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gbbSKgJD; dkim-atps=neutral
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 485xbZ4PR0z9sR0
 for <linuxppc-dev@ozlabs.org>; Tue, 28 Jan 2020 04:30:34 +1100 (AEDT)
Received: by mail-yw1-xc42.google.com with SMTP id u139so5074703ywf.13
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jan 2020 09:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oZHC1+WaNyQ1RQmD8lDg7R2NyPlPBpATeNYas3dE1z8=;
 b=gbbSKgJDMd+Dc0wdYQ+B3QvoLZ0SmdoRbKcwOGdhB3xVko+9BtlBFYwu4iEgCQ25mS
 fRu/ATOTok5y+oPPglN39WgYGYSELWA3qDpU0QAw4cTqyEuQyhugnl9l+eAc3k7lMHpy
 v7v5TBQa0bhq6hcqZqDBO+Ws7/U6LNN/voCozfM03R956FSNJ/HpfUDNDqpFb502BGZB
 QHz/uztWHG5EJ9mvFX4U8xH7d3R28ncmR+LdtBgHeGmMN2aZxUrVm0t30jhDJc6GyISJ
 9pZ/AS8MOta7ngR0U6PKFOmLhIFGiA4HLdof5JjvEYQBkWaUYk26MIG0fwOz59Gdxv9g
 qD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oZHC1+WaNyQ1RQmD8lDg7R2NyPlPBpATeNYas3dE1z8=;
 b=HUISepWIfZLDkjK52/Lye7o4sOmI2P5VEHKU70ym28c8wxMRnGWDMQvCgYZHT4fpcm
 cCjTYxEf9IRUQDCBEDY0+0KGaTDQ2GioD6Nf+drd43m+EEWxGEnfyrUKMBIt3psu+H+q
 LyhQOwMg8qeqRmBp9Yj3kXoyB90Yx1JlWr6kGugfpXPprf4p0saqDEyt0mQZg0ORahh3
 y3PG/nQheMtqyXq0peEyTJkGJXtHwuXqYo5ako8LlGaQsLnjEhO0oviGGuuE+KqpMjvu
 Rj+LzPBpikgxXoxp26T5lb9WkeQwIOA42t8/cDddrN+lvhTEDzDn11rInadyShs88m3i
 B18A==
X-Gm-Message-State: APjAAAVpGgeGRCoOkbsDGGlvGO5N+uCqq7Dnb2x/65Eeopo/+NaWeZuB
 RchWfdA1PAwarVviV2MtFOI=
X-Google-Smtp-Source: APXvYqzkShbWVxRKSEyOSDpGxKW8vNiN/4DbCdTnjruNWa6WquVtJjN8C9Qn67xdTMWxVFq1lrxtjw==
X-Received: by 2002:a81:bb41:: with SMTP id a1mr12449625ywl.253.1580146230905; 
 Mon, 27 Jan 2020 09:30:30 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net.
 [73.88.245.53])
 by smtp.gmail.com with ESMTPSA id q62sm6898824ywg.76.2020.01.27.09.30.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Jan 2020 09:30:30 -0800 (PST)
Subject: Re: [PATCH] of: Add OF_DMA_DEFAULT_COHERENT & select it on powerpc
To: Michael Ellerman <mpe@ellerman.id.au>, robh+dt@kernel.org
References: <20200126115247.13402-1-mpe@ellerman.id.au>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <7cc13334-2765-c800-2242-cb7d2edcc608@gmail.com>
Date: Mon, 27 Jan 2020 11:30:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200126115247.13402-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, chzigotzky@xenosoft.de,
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


+ Frank (me)

On 1/26/20 5:52 AM, Michael Ellerman wrote:
> There's an OF helper called of_dma_is_coherent(), which checks if a
> device has a "dma-coherent" property to see if the device is coherent
> for DMA.
> 
> But on some platforms devices are coherent by default, and on some
> platforms it's not possible to update existing device trees to add the
> "dma-coherent" property.
> 
> So add a Kconfig symbol to allow arch code to tell
> of_dma_is_coherent() that devices are coherent by default, regardless
> of the presence of the property.
> 
> Select that symbol on powerpc when NOT_COHERENT_CACHE is not set, ie.
> when the system has a coherent cache.
> 
> Fixes: 92ea637edea3 ("of: introduce of_dma_is_coherent() helper")
> Cc: stable@vger.kernel.org # v3.16+
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/Kconfig | 1 +
>  drivers/of/Kconfig   | 4 ++++
>  drivers/of/address.c | 6 +++++-
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 1ec34e16ed65..19f5aa8ac9a3 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -238,6 +238,7 @@ config PPC
>  	select NEED_DMA_MAP_STATE		if PPC64 || NOT_COHERENT_CACHE
>  	select NEED_SG_DMA_LENGTH
>  	select OF
> +	select OF_DMA_DEFAULT_COHERENT		if !NOT_COHERENT_CACHE
>  	select OF_EARLY_FLATTREE
>  	select OLD_SIGACTION			if PPC32
>  	select OLD_SIGSUSPEND
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 37c2ccbefecd..d91618641be6 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -103,4 +103,8 @@ config OF_OVERLAY
>  config OF_NUMA
>  	bool
>  
> +config OF_DMA_DEFAULT_COHERENT
> +	# arches should select this if DMA is coherent by default for OF devices
> +	bool
> +
>  endif # OF
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 99c1b8058559..e8a39c3ec4d4 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -995,12 +995,16 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
>   * @np:	device node
>   *
>   * It returns true if "dma-coherent" property was found
> - * for this device in DT.
> + * for this device in the DT, or if DMA is coherent by
> + * default for OF devices on the current platform.
>   */
>  bool of_dma_is_coherent(struct device_node *np)
>  {
>  	struct device_node *node = of_node_get(np);
>  
> +	if (IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT))
> +		return true;
> +
>  	while (node) {
>  		if (of_property_read_bool(node, "dma-coherent")) {
>  			of_node_put(node);
> 

