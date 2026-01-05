Return-Path: <linuxppc-dev+bounces-15286-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AFFCF5DA8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 23:36:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlTgP19bNz2yFq;
	Tue, 06 Jan 2026 09:36:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767652609;
	cv=none; b=U+hW/6rdqV79/ZX0zYN9zctaaote6VqorXifdmjJTD3aF64aB4pOC03TEdeYb7txLNCfRaIkQWPBN1tNu6JMenViI1Ci7F/BSzRJLFw9LpOrtzKb8qhpCwZuvoU0HhLvoSWuT+rJysU4w4zg8W0SA+5K854FsWAK9HtIhezxpycyagdaXn0/2/YXMKjoJRjlHmFg5Yfrl462XH5pyFi6N1bcOzwU72CvaKxSi6AY/oUSWhgnfFOsz1x1goNQWVnR+uTNMX6G1NWqUXVcKU1sJ6OhH2MMFdvkkXGtxDaeGcDa4QUtWro0WGK8yffIEWVMwwW/6ZDBirW0zs7dAJdAVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767652609; c=relaxed/relaxed;
	bh=le5Y4bZnYOXFfWpyttP9RqC5Wv5OlgHvktPhqYfo3vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fE8rKm/c9cmaut/i4l8VHn9hMzXk939IEYEE2F5D5OUmuTgOtc6yzHXMQkTb4+ZhJsL6yNCwQhEfO5UR1II/vq0iW63mIb+MrE5i4jfLCdG5Ex0ysENyOxzFEx77GeFEs+z5SecumnjMl9OpR1e5uBQJpzIoXNxCwxKEB/+zPlSsZlkiQSjAI7HScPDtBQ43BWQsthduOQEVkVq9ghoaLPMfkqNFGiMaHN/+evpLjiimPPtgPqTdxk8a+C7rgOTQ6te6pT3Wyv4I7vRMK8GDkXqZybFpye12jWleQIuw+C76z9VVq7ubRAa/OO1I383Jc8sfZQVaup9O0uGsO1qdzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dmbHwuIs; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dmbHwuIs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlTgM53MJz2xqr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 09:36:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9104E405A7;
	Mon,  5 Jan 2026 22:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47434C116D0;
	Mon,  5 Jan 2026 22:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767652605;
	bh=kzkUocZGzbldAqL7H+ZbDJj1W7al0AimC+VuLG+yvHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dmbHwuIs+Jus28fsK5wm0xq/ylwPIKhkr5dyCyT/XQL2ulRMOn63qz9aCdKiEaCov
	 Jd9a57EMPcFXqJhga7Fp0ZIjS73JKd5dOkHRg2dEcMidwoO77HKO1vriP/dsVzHPfA
	 dzPOnbxH4z4WVGzGyN2Nr4qg2ODsudK2C4wa2JDGQ0ENC81eHPfEfU/stMY7zXBjiK
	 hvO+GP6m++TN9SO+Pnmaf14Kg/z0dcI+Z+ggkx97EtvnNELUIPfS8uHdbyyFT1OCs6
	 RzPiRnzPyb2M/xb2uU6ERe6nlnPwbEx5h/c8oyr8ufiJP2RVk6dBGg0wT0ctIQs++l
	 kUKgFhWdsrlYw==
Date: Mon, 5 Jan 2026 16:36:44 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH 01/11] of: Add for_each_compatible_node_scoped() helper
Message-ID: <20260105223644.GA3633916-robh@kernel.org>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-1-24e99c177164@oss.qualcomm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-1-24e99c177164@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 05, 2026 at 02:33:39PM +0100, Krzysztof Kozlowski wrote:
> Just like looping through children and available children, add a scoped
> helper for for_each_compatible_node() so error paths can drop
> of_node_put() leading to simpler code.
> 
> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Prerequisite for all further patches.
> ---
>  .clang-format      | 1 +
>  include/linux/of.h | 7 +++++++
>  2 files changed, 8 insertions(+)

You need to update scripts/dtc/dt-extract-compatibles

> 
> diff --git a/.clang-format b/.clang-format
> index c7060124a47a..1cc151e2adcc 100644
> --- a/.clang-format
> +++ b/.clang-format
> @@ -259,6 +259,7 @@ ForEachMacros:
>    - 'for_each_collection'
>    - 'for_each_comp_order'
>    - 'for_each_compatible_node'
> +  - 'for_each_compatible_node_scoped'
>    - 'for_each_component_dais'
>    - 'for_each_component_dais_safe'
>    - 'for_each_conduit'
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 9bbdcf25a2b4..be6ec4916adf 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -1485,6 +1485,13 @@ static inline int of_property_read_s32(const struct device_node *np,
>  #define for_each_compatible_node(dn, type, compatible) \
>  	for (dn = of_find_compatible_node(NULL, type, compatible); dn; \
>  	     dn = of_find_compatible_node(dn, type, compatible))
> +
> +#define for_each_compatible_node_scoped(dn, type, compatible) \
> +	for (struct device_node *dn __free(device_node) =		\
> +	     of_find_compatible_node(NULL, type, compatible);		\
> +	     dn;							\
> +	     dn = of_find_compatible_node(dn, type, compatible))
> +
>  #define for_each_matching_node(dn, matches) \
>  	for (dn = of_find_matching_node(NULL, matches); dn; \
>  	     dn = of_find_matching_node(dn, matches))
> 
> -- 
> 2.51.0
> 

