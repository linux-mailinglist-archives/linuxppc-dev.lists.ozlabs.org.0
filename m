Return-Path: <linuxppc-dev+bounces-5018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 999BBA09D93
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 23:06:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVG2Z72n6z3cYy;
	Sat, 11 Jan 2025 09:06:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ba"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736546790;
	cv=none; b=L/cgKTCAmy3plB5PznaWcjWXK6EJEiamQdRJ9AKNbFJd+tnllVJb6wKKSWP7EhirWh3gnMOa95iJRTsCoFfSj1X7G40bPhnpzndljL4qgNSiNPzOBz9z4m/KNjocwGV+qvNFZRGaR6bLGZADUvGLPgbZslrCHEfl6Q4MKKlxgBzC6xL4x4g2sRNlKuffEf02yMGJzazpkEVj4br74283okBbtEQIrFPK3dQTQStsdl1fdg5hjijCSEoyeyjwafioLqpbql7mSuJFopkqLlyXOpW+pxuIS5IztqvUtvJXwsK0wmiC8MZ5dPklbhWTruVVgIDSmHFC6ZEhIEiMaU3wrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736546790; c=relaxed/relaxed;
	bh=2x5BxF/3ZkUkZ+08VxDfgNb3JHhNGdhbGCSwU27BGaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozaarIplMhAYzczcBJBFEL5Iw90ls8kAw8bPeS7fCmf6oAlrqzLdNi+DgSRP6eLuvEkba6L7FCJaoK33bGl68NatiGKfEABnE20Rh/vfAI3ya1iuHPgoINW3ppATjGTb1EGjNNw/Xn4r79Hsk4HxSqllm7TCf0LlnyoKLZWA0l8yCQ3fWU/Wqo45ppOfqvg+kFqFTmq5JAu+YzuTgzqF/HKG2VrgvWgLosMnHA6XbZHJ6feRzXAyM84Bb0roX0xcE/akn9I+Iip7HzQ1h3LBu4rAImSH2cx6j+Q/nzHBNFQ7kw1esNJs6bHcsSxSc5c/KMcrgPylgrc8eLwKRDTB6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:203:375::ba; helo=out-186.mta1.migadu.com; envelope-from=sean.anderson@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ba; helo=out-186.mta1.migadu.com; envelope-from=sean.anderson@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 70 seconds by postgrey-1.37 at boromir; Sat, 11 Jan 2025 09:06:23 AEDT
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [IPv6:2001:41d0:203:375::ba])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVG2R4zSVz3cYh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 09:06:23 +1100 (AEDT)
Message-ID: <ba885c8c-c5f0-4902-8515-3c133a00d7f1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736546679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2x5BxF/3ZkUkZ+08VxDfgNb3JHhNGdhbGCSwU27BGaM=;
	b=VU6wzF3mE866i1no/6U66csETxez/bREQM53MmiNGv1XnD0PmIbPMQpAz7P1cHr+ry40jW
	6RMUzfnkgYIoplHz5iotr5rTv8Kd9snuwjrJqwmLPxQE4200bmPgNzApeRG79EpcFVqIDY
	oWOrLT1Lseiz3xI8SPo8HyEsEA8aMP4=
Date: Fri, 10 Jan 2025 17:04:34 -0500
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
Subject: Re: [PATCH 2/2] of/address: Fix WARN when attempting translating
 non-translatable addresses
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Saravana Kannan <saravanak@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250110215030.3637845-1-robh@kernel.org>
 <20250110215030.3637845-2-robh@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250110215030.3637845-2-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 1/10/25 16:50, Rob Herring (Arm) wrote:
> The recently added WARN() for deprecated #address-cells and #size-cells
> triggered a WARN when of_platform_populate() (which calls
> of_address_to_resource()) is used on nodes with non-translatable
> addresses. This case is expected to return an error.
> 
> Rework the bus matching to allow no match and make the default require
> an #address-cells property. That should be safe to do as any platform
> missing #address-cells would have a warning already.
> 
> Fixes: 045b14ca5c36 ("of: WARN on deprecated #address-cells/#size-cells handling")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/of/address.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index c1f1c810e810..8770004d9b08 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -340,6 +340,15 @@ static int of_bus_default_flags_match(struct device_node *np)
>  	return of_property_present(np, "#address-cells") && (of_bus_n_addr_cells(np) == 3);
>  }
>  
> +static int of_bus_default_match(struct device_node *np)
> +{
> +	/*
> +	 * Check for presence first since of_bus_n_addr_cells() will warn when
> +	 * walking parent nodes.
> +	 */
> +	return of_property_present(np, "#address-cells");
> +}
> +
>  /*
>   * Array of bus specific translators
>   */
> @@ -384,7 +393,7 @@ static const struct of_bus of_busses[] = {
>  	{
>  		.name = "default",
>  		.addresses = "reg",
> -		.match = NULL,
> +		.match = of_bus_default_match,
>  		.count_cells = of_bus_default_count_cells,
>  		.map = of_bus_default_map,
>  		.translate = of_bus_default_translate,
> @@ -399,7 +408,6 @@ static const struct of_bus *of_match_bus(struct device_node *np)
>  	for (i = 0; i < ARRAY_SIZE(of_busses); i++)
>  		if (!of_busses[i].match || of_busses[i].match(np))
>  			return &of_busses[i];
> -	BUG();
>  	return NULL;
>  }
>  
> @@ -521,6 +529,8 @@ static u64 __of_translate_address(struct device_node *node,
>  	if (parent == NULL)
>  		return OF_BAD_ADDR;
>  	bus = of_match_bus(parent);
> +	if (!bus)
> +		return OF_BAD_ADDR;
>  
>  	/* Count address cells & copy address locally */
>  	bus->count_cells(dev, &na, &ns);
> @@ -564,6 +574,8 @@ static u64 __of_translate_address(struct device_node *node,
>  
>  		/* Get new parent bus and counts */
>  		pbus = of_match_bus(parent);
> +		if (!pbus)
> +			return OF_BAD_ADDR;
>  		pbus->count_cells(dev, &pna, &pns);
>  		if (!OF_CHECK_COUNTS(pna, pns)) {
>  			pr_err("Bad cell count for %pOF\n", dev);
> @@ -703,7 +715,7 @@ const __be32 *__of_get_address(struct device_node *dev, int index, int bar_no,
>  
>  	/* match the parent's bus type */
>  	bus = of_match_bus(parent);
> -	if (strcmp(bus->name, "pci") && (bar_no >= 0))
> +	if (!bus || (strcmp(bus->name, "pci") && (bar_no >= 0)))
>  		return NULL;
>  
>  	/* Get "reg" or "assigned-addresses" property */

Tested-by: Sean Anderson <sean.anderson@linux.dev>

