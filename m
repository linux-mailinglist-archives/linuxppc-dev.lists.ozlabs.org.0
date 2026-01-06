Return-Path: <linuxppc-dev+bounces-15320-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D5DCF7C54
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 11:23:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlnMD5fb0z2yVL;
	Tue, 06 Jan 2026 21:23:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767695032;
	cv=none; b=RwaMFc8/EWlKUnCcsemDeM3Bc1vckKK9UveX9w3eUAqpsWBX1htuO/cHrJ10YjXFVr1CdOJT+iIAueyOF9vEBhMESkyduLeB0wyBkBL9Xy9mzEjSmN/p92HrdPHYTy7n2pKONVZcGmNtliIdzDLWBvaJSCJrr2fOdsNSsI/FXGi1aGaOeJwpcvz0z/prjCqp3/OoeAbxXpQqkKoSSR2icF+/TFYoU40d9mgbGaFz529vyyrkzRsPs4i+qk08MwXLcfzFdS5DSvB7aFhCkx30OJLNgrpYySHIwfsg+TXraw1n05D5zMMj20kcSxyqGNanSbWDAy1FMMxbNTR1syNk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767695032; c=relaxed/relaxed;
	bh=RPktYUhL8dq/Qfmo71IZceXt7DDBZATodRE6QZLbjHI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DIieoydo24I+6lFQg6Upz1nTDadu05884OkonQS/OPqjvv3Huy5yz9iaoNLV7tJChbdZRtctR/CpwPFajdPEQ9ivAwPdZtlqye8xEpINpfk2TE7sPmDDnQORZg98/e6IBhhvsOQAxJ/fyZztdzjZ6KyLkJUMSyT23lwPxU5NJauRMOYh7lMPH2qB+L9KxKxFP+1jdQT4IxQOxK5dI44OITKEBWeHLeI3ItVsSPCFaQGlc1NRdZbZFVurnG4tjbMCLJnu6nKNgw8dOm6mbgAOskq6qan+lS2DI92PlUZ/7tddXguCqgT5154qkc/rm2oVbqLIL2ltHX4G/OLwBIT+Qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlnMC54JCz2yRM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 21:23:51 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlnM661F0zJ4703;
	Tue,  6 Jan 2026 18:23:46 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 3D53640570;
	Tue,  6 Jan 2026 18:23:48 +0800 (CST)
Received: from localhost (10.48.149.114) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 10:23:45 +0000
Date: Tue, 6 Jan 2026 10:23:44 +0000
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
Subject: Re: [PATCH 08/11] clk: imx: imx31: Simplify with scoped for each OF
 child loop
Message-ID: <20260106102344.00003201@huawei.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-8-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
	<20260105-of-for-each-compatible-scoped-v1-8-24e99c177164@oss.qualcomm.com>
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

On Mon, 05 Jan 2026 14:33:46 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

I guess this is papering over similar compatibility issues with old DT
as the previous one (so fsl,imx-osc26m which may or may not have fallback
compatible to fixed-clock).

Jonathan

> 
> ---
> 
> Depends on first patch.
> ---
>  drivers/clk/imx/clk-imx31.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx31.c b/drivers/clk/imx/clk-imx31.c
> index 4c8d9ff0b2ad..962eccac63ce 100644
> --- a/drivers/clk/imx/clk-imx31.c
> +++ b/drivers/clk/imx/clk-imx31.c
> @@ -123,18 +123,15 @@ static void __init _mx31_clocks_init(void __iomem *base, unsigned long fref)
>  
>  static void __init mx31_clocks_init_dt(struct device_node *np)
>  {
> -	struct device_node *osc_np;
>  	u32 fref = 26000000; /* default */
>  	void __iomem *ccm;
>  
> -	for_each_compatible_node(osc_np, NULL, "fixed-clock") {
> +	for_each_compatible_node_scoped(osc_np, NULL, "fixed-clock") {
>  		if (!of_device_is_compatible(osc_np, "fsl,imx-osc26m"))
>  			continue;
>  
> -		if (!of_property_read_u32(osc_np, "clock-frequency", &fref)) {
> -			of_node_put(osc_np);
> +		if (!of_property_read_u32(osc_np, "clock-frequency", &fref))
>  			break;
> -		}
>  	}
>  
>  	ccm = of_iomap(np, 0);
> 


