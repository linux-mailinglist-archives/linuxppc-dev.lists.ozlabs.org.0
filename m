Return-Path: <linuxppc-dev+bounces-15478-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECF8D0B9A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 18:22:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnpVP014Xz2yFh;
	Sat, 10 Jan 2026 04:22:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767979324;
	cv=none; b=IDk/eGMhS5LmQwgoYJN8Cy6xpt9bK05asqHKzR4Mfh4qqi6eMkaECbNGC2nDxGpPFgZFSpaIXmjWDGoHuYSmxvzFvUm4BvFz9Vdh/pRF61J/gtzMPTxeIRauaGY7mxqipPtb96uUIEdf0yzoV3vfMJvG7+jEU32t8S0C9uNqy7WF002YT4g5pVWGI9De7J31PA/9It7aLGQxUeTDkFVj0rdqiMEw+W3X4cSFnyPq9hv3kTeqLlfeN5YgpScvOlFQq4psREkEOs7bwLVz4LzPc1WyMoQCefb3YJi8BQppG4LWFyXbGkcim7Do37BOatSsCUNb1c35yrusu5Zx23qebQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767979324; c=relaxed/relaxed;
	bh=LrvaMEFksRwNf+9QjYnHfEu8TPiJ1u3+Dlfy3rKK+wE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dK+0b3FSEhzS0G1kdbFASJdfkJva8/RJ0PTozY0PzhuTjA1y+fAquVvqHXQ13cu5F7Pe5kb8w+vLR4R1qQi2paT8eZDLNzq2WkSKVzMTxJAC3bQe5kpigHz6HlfrbkFPfQ3ZZgyMgCOJp9pUJFQ4Ml9pbRuVeU3X2IvV0BUMg4Y7HOzA5ExNVBiThfFqFH/OyCF3sLfbubgWk3F/5+NQLqn8NtyNw5XeLY8le2sjcIQQ877IafP9ugwg3wFht1/XOfVPhTbdTfMmy2C7fh5KzjYLy+lpUHhyAZI4rzQgVxPZ7Jo3sHvTbU+3y4dNXqI/fhHNIGGT8Ekv/YvpfrksTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fMWxy9I1; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fMWxy9I1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnpVN15JKz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 04:22:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A89560178;
	Fri,  9 Jan 2026 17:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F1AC4CEF1;
	Fri,  9 Jan 2026 17:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767979321;
	bh=G0CdK1BbKzMKU+qqbitcHl4o9Pf/LHQ1vf98qGeQbYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fMWxy9I1T3LHdLmPtdMUL88DS3wYXB71qViQVOCn0+8QCbajTFBrfCs8mqRUXy+Y4
	 4E+eBYsitwzT/qE/4+xLri8dA5feTyUtep33ImpFVLB2+Wxssd+JDlhKBMSAEgTwgb
	 jnchWeKlErbxlJm9dPOlSzhoP46/HA2MEdAQR6j1cvUjT1Z48s7+DCjf3C8gGAwNSr
	 BUXYSgbI6w2J7+HijlF38X8OoLlcZ7PktPyZMuYV6gFQjkfwBvlk7LRC/7Nd22e6Z+
	 gB/+xmfzZzhw6BchvPsR2Qael3H05SiSbrl7pdb++/DLGljx6tybl/LamhByeVke5T
	 r+n5loRskMeeA==
Message-ID: <48faa7b1-d486-406a-a8c4-a1c9609e7fc6@kernel.org>
Date: Fri, 9 Jan 2026 18:21:47 +0100
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
Subject: Re: [PATCH v3 04/12] powerpc/fsp2: Simplify with scoped for each OF
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
 <20260109-of-for-each-compatible-scoped-v3-4-c22fa2c0749a@oss.qualcomm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-4-c22fa2c0749a@oss.qualcomm.com>
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
>   arch/powerpc/platforms/44x/fsp2.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/44x/fsp2.c b/arch/powerpc/platforms/44x/fsp2.c
> index f6b8d02e08b0..b06d9220844c 100644
> --- a/arch/powerpc/platforms/44x/fsp2.c
> +++ b/arch/powerpc/platforms/44x/fsp2.c
> @@ -199,16 +199,14 @@ static irqreturn_t rst_wrn_handler(int irq, void *data) {
>   
>   static void __init node_irq_request(const char *compat, irq_handler_t errirq_handler)
>   {
> -	struct device_node *np;
>   	unsigned int irq;
>   	int32_t rc;
>   
> -	for_each_compatible_node(np, NULL, compat) {
> +	for_each_compatible_node_scoped(np, NULL, compat) {
>   		irq = irq_of_parse_and_map(np, 0);
>   		if (!irq) {
>   			pr_err("device tree node %pOFn is missing a interrupt",
>   			      np);
> -			of_node_put(np);
>   			return;
>   		}
>   
> @@ -216,7 +214,6 @@ static void __init node_irq_request(const char *compat, irq_handler_t errirq_han
>   		if (rc) {
>   			pr_err("fsp_of_probe: request_irq failed: np=%pOF rc=%d",
>   			      np, rc);
> -			of_node_put(np);
>   			return;
>   		}
>   	}
> 


