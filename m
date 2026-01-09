Return-Path: <linuxppc-dev+bounces-15479-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F863D0B9AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 18:22:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnpW14mt7z2yD4;
	Sat, 10 Jan 2026 04:22:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767979357;
	cv=none; b=amO3r9gg9iKckr3ZllSgfldi/AEl+l5exI83teK9fB2oLvs2ClYin0RVrR4Oug0CoiC+npOfkMY1ljNwAeOHDoUKuVgMoRoQofM0q9HIKYaWmyNPNfk33dpV7huVmel/W/kT0TQn3ThlTx78M1Bsndd8WMzMMxd3RYTvbyb5cbyLKJHxSME0X6TVbx77jhiPxH252/I6hEpuehHq6T5+HY1LNn+LpVl/BOUPJLQIKtsEqYd4uqsx6VH8D9o2VjF5X98w0Joup3X8X/YBx9cEofSJpQ+77q1X5ne6Np8/dOGndeulpswe8JTpgmhh78dfs/hk1d2wF46H5fihe6n6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767979357; c=relaxed/relaxed;
	bh=1Bbk0z+0VFz7pKqIE/AUfFuALuk0M59BhsEARCrLwFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2RSVf/bVZZNQCrpOPlEtDl3M3C7cMh3yi2Ni/SgHCp76haJGIvqy4stEiGLD5CavHwlWzj20gM/QUwUNfG4gJUpSc49lV2X62i1cSMEmGwol9g3FKAK9Pev/4AgkNeoWXNIRMrrZ9x4VVCLGL9J7JqYE4H8hc1CZ4x8wgKOs57XPacR/UiMsXiuBoZHrU8FWcUW28QCPtVOhwhtQHkgL02KzYBjmpVH7oV7M+LJHhQj6rEcsLTzaE4hLRyZMnEqXjl1SsCFoTIjTTn/nMFzBtZGavUYC9rDwFQ4hZuBa2msYxgGx9fbW4YBeRN5/cvO0la+xIv6fh/u54esn5l2jA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nz6KMZGO; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nz6KMZGO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnpW06K5qz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 04:22:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 230184401E;
	Fri,  9 Jan 2026 17:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013C9C4CEF1;
	Fri,  9 Jan 2026 17:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767979355;
	bh=ANMtR/alobtcTc1B2UvZS7tSAS69B3p/g2Gc9BywPbc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nz6KMZGOR0IWeqrcGkzHUWt15KFX1u57rcmSi142rXY6IhUKCMxco2rLIZciMuJnl
	 8C/7D0f76zWMgRMyECqecQl4ck15bMVM1MqXCsEZb1sxZJ6OIzyjehuEjlzJkpqTck
	 YiVe26cVIund+DnlSquBzSPDjh6jAN/rxXUUdiUy6ekbqqe8KgbmBs/tVJIe+Nt0me
	 qvflVUseSsHMdKcTfYR7LjeuoyiYfx5oIfzugwKuNs7aNAVRmOlYijDCMm44nuzmeH
	 DAlajjQtAGsjWT5V+opkAbTE4Og3VhHVlxqHfo9CzeLphrWbyGDlxk+ssLxsfX+sU7
	 7dn2GxNm+sSIA==
Message-ID: <a6b5cf84-454e-4a43-b52f-d607c648864e@kernel.org>
Date: Fri, 9 Jan 2026 18:22:20 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] powerpc/wii: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
 <20260109-of-for-each-compatible-scoped-v3-5-c22fa2c0749a@oss.qualcomm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-5-c22fa2c0749a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 09/01/2026 à 17:57, Krzysztof Kozlowski a écrit :
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
> 
> Depends on the first patch.
> ---
>   arch/powerpc/platforms/embedded6xx/hlwd-pic.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
> index b57e87b0b3ce..1522a8bece29 100644
> --- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
> +++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
> @@ -201,11 +201,10 @@ unsigned int hlwd_pic_get_irq(void)
>   void __init hlwd_pic_probe(void)
>   {
>   	struct irq_domain *host;
> -	struct device_node *np;
>   	const u32 *interrupts;
>   	int cascade_virq;
>   
> -	for_each_compatible_node(np, NULL, "nintendo,hollywood-pic") {
> +	for_each_compatible_node_scoped(np, NULL, "nintendo,hollywood-pic") {
>   		interrupts = of_get_property(np, "interrupts", NULL);
>   		if (interrupts) {
>   			host = hlwd_pic_init(np);
> @@ -215,7 +214,6 @@ void __init hlwd_pic_probe(void)
>   			irq_set_chained_handler(cascade_virq,
>   						hlwd_pic_irq_cascade);
>   			hlwd_irq_host = host;
> -			of_node_put(np);
>   			break;
>   		}
>   	}
> 


