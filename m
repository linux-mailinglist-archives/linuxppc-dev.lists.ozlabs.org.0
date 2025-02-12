Return-Path: <linuxppc-dev+bounces-6113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 797CFA31E31
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 06:47:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yt6ls2W8Lz2yJL;
	Wed, 12 Feb 2025 16:47:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739339257;
	cv=none; b=Rn6Uz5ILpiBCyUBqqOafhyZlNvZBlRz+j6Ho0UwZqemR2kgmBq0JFD9j0KxyylzFPWhrp91PEhSdRFIB/FCANLHvXpOSTgcok1gZZBCFGRSB85aFmXjTA3aNN3fIWsCmnI+kq5qyACa417uQZAD5crewmSWOAmMkJYmFvDU8rtmjr6OYohsYwMm9W6NpGVLbFMuLb3oHtE505km3imXAVXbhPWvzQFO/+jCSfF7R9zlRBpBhSYQZGjLx0wo6sPskHA/H2s5SycuyWaY2YrfpYWpAloKVxYLkmRzNchig22hybzYz+ZpQJZ6+YXOZ/RDkRUTK5+kPsD6Ny7X3/PYGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739339257; c=relaxed/relaxed;
	bh=xinMluINFjywEDYyoC26VQxv0j+JtHBVUHVm2m0jvas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChF7SRgulzczOEidigzHFSHkxqzwFh4R08+k+wTbGLaSGpydca0Y1+1aTLPIoIxjkIHt3AGScRhqHXnQ5jG3/Pu9iBcd4pOb5vK7MY8FQVKeZMzqB3vXcVViNNbLVJn43TmhMQ72qFRBBvoV7WuN8blbJ0QD+vjxjf8zkwE0DA7qBgmFV9sVF+ohL3TIgbn1DNAxrglnmlggCmG0Kf+Fts8HxelXef+/jc/H7L2zKUtZvCvkuoRu4VTeciruHJ5YtQ7BM3EqvnaSlyrBdjBypbHs9F12H+LsysxznjeczjajlhFGKRtFadUtOlHI47H+p3wok8R9fckDG0XzBJOWXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OEY6BjB6; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OEY6BjB6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yt6lr2V1bz2yF4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 16:47:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9156C5C5B7F;
	Wed, 12 Feb 2025 05:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE5EC4CEDF;
	Wed, 12 Feb 2025 05:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739339252;
	bh=ilS7Vyw4k14KiS1Avo6VfcY56qUDNzLPX44dUnRds40=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OEY6BjB6CkYChOeih1Nh4KTQb5T3hOPO5/BHvi7V1yaiUS6QYrxbrMpu0V9TvJU9J
	 PwMtEHJOV6jMdEDMrdF4qoiQ9afZeuZ6U3krh0RCknAFygY+3WJGg7Kih9DhWHKuSv
	 i/NuEcces9zbZEenBCoX3iPwqBRmIs7J7JJgst006EuNAjOkCEUt+SsxGWFqfhCp88
	 cUBp1jdnSvjeMgknSBOmx7GTlxJPM03xAa0VK2sY1ujBxaB2ENY3MKmls+qnGaSwJu
	 qzkT/pTUkgod6PlEHu19Q/f8NAeU6ZmA7G/R1fLahfBESpsq3/opCLlle12M5ej6zZ
	 VtgyK3wzJuDfw==
Message-ID: <e7a1b608-2bad-41d4-844a-07fd73818bb3@kernel.org>
Date: Wed, 12 Feb 2025 06:47:20 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
To: Zhang Zekun <zhangzekun11@huawei.com>, robh@kernel.org,
 saravanak@google.com, justin.chen@broadcom.com,
 florian.fainelli@broadcom.com, andrew+netdev@lunn.ch, kuba@kernel.org,
 o.rempel@pengutronix.de, kory.maincent@bootlin.com,
 jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
 laurent.pinchart+renesas@ideasonboard.com, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, taras.chornyi@plvision.eu, edumazet@google.com,
 pabeni@redhat.com, sudeep.holla@arm.com, cristian.marussi@arm.com
Cc: arm-scmi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, chenjun102@huawei.com
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250207013117.104205-2-zhangzekun11@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 07/02/2025 02:31, Zhang Zekun wrote:
> There are many drivers use of_find_node_by_name() with a not-NULL
> device_node pointer, and a number of callers would require a call to
> of_node_get() before using it. There are also some drivers who forget
> to call of_node_get() which would cause a ref count leak[1]. So, Add a
> wraper function for of_find_node_by_name(), drivers may use this function
> to call of_find_node_by_name() with the refcount already balanced.
> 
> [1] https://lore.kernel.org/all/20241024015909.58654-1-zhangzekun11@huawei.com/
> 
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---
>  include/linux/of.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index eaf0e2a2b75c..b7c6d7ff278c 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -268,6 +268,11 @@ static inline const char *of_node_full_name(const struct device_node *np)
>  #define for_each_of_allnodes(dn) for_each_of_allnodes_from(NULL, dn)
>  extern struct device_node *of_find_node_by_name(struct device_node *from,
>  	const char *name);
> +static inline struct device_node *of_find_node_by_name_balanced(struct device_node *from,
> +								const char *name)
> +{
> +	return of_find_node_by_name(of_node_get(from), name);

I don't think that solution to people not reading API description is to
create more API with similar but a bit different behavior, especially
undocumented.

Best regards,
Krzysztof

