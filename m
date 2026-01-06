Return-Path: <linuxppc-dev+bounces-15319-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0FCCF7C1D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 11:21:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlnK05PCqz2yKr;
	Tue, 06 Jan 2026 21:21:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767694916;
	cv=none; b=FP+NJBaa3znEDlFWZxMX16hREDqiPB7CL7xt+tpduQOeD6A8xQNpTN65ruMkyW/BEvdi2XiudVv/qV7HUENTU0X8tg+3bePoCplZYPHuclTfwZLM4y247Tu3HRIvLwDgKPS5sI7qoGL8j1eqk4s91GVZiUNFClcpsjdUTEOxoo/QP1fjJCf2vYqx0Q+c3XcMJ0cYWJyrDOKqozvooq6JHW6paUEKjKUal7QwmPJQwZL3WuibOhLP1lS1ajfCGXCnNFWuJkI/Mx1qG6BjPzm+xQZ2dB6jTlH1XgPbS7XBIhToNp/LrfOf2ieNDVJyuMeBrbPIjDEP3Zo9AswD+8j0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767694916; c=relaxed/relaxed;
	bh=80JGuCaryORikQJCv6k0KCMTsV9HvIMB99VFFcCg9cM=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OFx2d95TOVfWuOYhdwXHK80DeUDeqHYRQQz2bnbhYieI0UQqLiIWva14KLPzGth+ctMDQpmHpKBb9FBe7xJBIa2FbOrTTwJq9IaEEqb5d0MPyRCO/Szfe4rkM8zm7ZmD/OpJ7f7SSPzHc4gpbtVDbb7CX113fiSijKtBWxOCuqsPQL564U8e79Fr0L8DzKiAJInmvDNJbrnNj2nKlCQqeoWR/NURZcTtbWYFCcKARIWcnZIBXKRa/536QBZ1yraetlligVj3D1//DU02YQ24V1ZWuxCjLIwCuDGXxjhXldgKSH6Z15sZvcreJKWseHQqTmme2kdbDLUdT5QhVGT2yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlnJz57PPz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 21:21:55 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlnJs33ywzJ46sy;
	Tue,  6 Jan 2026 18:21:49 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id CBDD740570;
	Tue,  6 Jan 2026 18:21:50 +0800 (CST)
Received: from localhost (10.48.149.114) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 10:21:48 +0000
Date: Tue, 6 Jan 2026 10:21:46 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
CC: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, "Saravana
 Kannan" <saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	<morbo@google.com>, Justin Stitt <justinstitt@google.com>, Russell King
	<linux@armlinux.org.uk>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nipun Gupta
	<nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, Abel Vesa
	<abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael Turquette
	<mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
	<dmaengine@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-pm@vger.kernel.org>
Subject: Re: [PATCH 07/11] clk: imx: imx27: Simplify with scoped for each OF
 child loop
Message-ID: <20260106102146.00005bfb@huawei.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-7-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
	<20260105-of-for-each-compatible-scoped-v1-7-24e99c177164@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.149.114]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 05 Jan 2026 14:33:45 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
This is one that had me thinking for a (short) while about what pattern
required this double match was there for.  A comment would have been useful!

Ah well, nothing to do with your patch which is good.

Jonathan

> 
> ---
> 
> Depends on first patch.
> ---
>  drivers/clk/imx/clk-imx27.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx27.c b/drivers/clk/imx/clk-imx27.c
> index 99618ded0939..f2f0d3fe5c52 100644
> --- a/drivers/clk/imx/clk-imx27.c
> +++ b/drivers/clk/imx/clk-imx27.c
> @@ -171,17 +171,14 @@ static void __init _mx27_clocks_init(unsigned long fref)
>  
>  static void __init mx27_clocks_init_dt(struct device_node *np)
>  {
> -	struct device_node *refnp;
>  	u32 fref = 26000000; /* default */
>  
> -	for_each_compatible_node(refnp, NULL, "fixed-clock") {
> +	for_each_compatible_node_scoped(refnp, NULL, "fixed-clock") {
>  		if (!of_device_is_compatible(refnp, "fsl,imx-osc26m"))
>  			continue;
>  
> -		if (!of_property_read_u32(refnp, "clock-frequency", &fref)) {
> -			of_node_put(refnp);
> +		if (!of_property_read_u32(refnp, "clock-frequency", &fref))
>  			break;
> -		}
>  	}
>  
>  	ccm = of_iomap(np, 0);
> 


