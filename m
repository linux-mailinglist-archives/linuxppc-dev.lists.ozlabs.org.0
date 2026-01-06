Return-Path: <linuxppc-dev+bounces-15315-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15369CF7B09
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 11:11:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dln4j4rwzz2yKr;
	Tue, 06 Jan 2026 21:11:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767694277;
	cv=none; b=WkP9lVEQRHdwrDdMydmqZsHV61YfP4ZHFbu/eJiw5gTVKY83QPYIlhv0qKEM5Pmjmx5L2/SJOJpxZ8DRZMSRUzxMiWJ13Dn1tHcrGaLPJ219ggV8duOrKhuiRKkD42LLFIlr/4fI5A4Vz78pply5oDc7wVurwbfVLq9kqjtxhl00GnhK7y1+2JJJLXblJqM5hVx3Hi6xKw/6MSxZxH5olHJPUicL2JgNV4oEQus7+QnqdHMpSS8Os0aVC817MV7mBwxF2qUenkacVa48aPXKkxpPMgCO16vbVvJ12GBbdd7mooxLlioo6TRvb3wk6kpEDhg7P+GstqjFvVWd5UCBQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767694277; c=relaxed/relaxed;
	bh=JAaWSZrkgXS20+tl/c1StPWBCKTEEEgiGWBtEcPVqr8=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oF7PnuwZbEjBL7gyy9Jmwu6oKez6X5pGXH/xtxuUhvreOj1WhFVCyhWmW74NAWf+nHE97xfaW5WnR9XBf4IZKWbCOCzPwGUJtYe35GgOH+1vNENkcICUgqX7xpD5+oh3dx/MyxbZi0/h1h+rYUwAmrNHDV5Ek2Qlbwb2oJiS9Hc7vCuaEWpwzlz0VTHrJJ7xOrg+IzdFkn9zF4TJXBALnWk7mCXg8LINC3phVYY2+QGb7g4A9bdviEgucvWSJtVRD8nJDDW7XEaomNgkCERD8QpwCKGMfxdff+wdP3LjNDoVXjl/QFJ3NOlOpEEMsdjM1QubH5jElXfsbq2RmwB1Hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dln4h0qrCz2xSX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 21:11:16 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dln4W0mslzHnHW1;
	Tue,  6 Jan 2026 18:11:07 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 12CE340565;
	Tue,  6 Jan 2026 18:11:11 +0800 (CST)
Received: from localhost (10.48.149.114) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 10:11:08 +0000
Date: Tue, 6 Jan 2026 10:11:07 +0000
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
Subject: Re: [PATCH 03/11] ARM: exynos: Simplify with scoped for each OF
 child loop
Message-ID: <20260106101107.0000398f@huawei.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-3-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
	<20260105-of-for-each-compatible-scoped-v1-3-24e99c177164@oss.qualcomm.com>
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

On Mon, 05 Jan 2026 14:33:41 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

A suggestion inline, but assuming you don't go with that, this is fine.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> 
> Depends on the first patch.
> ---
>  arch/arm/mach-exynos/exynos.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
> index 2e8099479ffa..18695076c34e 100644
> --- a/arch/arm/mach-exynos/exynos.c
> +++ b/arch/arm/mach-exynos/exynos.c
> @@ -47,9 +47,7 @@ unsigned int exynos_rev(void)
>  
>  void __init exynos_sysram_init(void)
>  {
> -	struct device_node *node;
> -
> -	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram") {
> +	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram") {
>  		struct resource res;
>  		if (!of_device_is_available(node))
>  			continue;
No idea how common this pattern is, but maybe worth
	for_each_compatible_available_node_scoped() ?
Bit of a pain as you'd need a of_find_compatible_available_node() helper.
So I'll let you assess if there are enough instances of this to make it worthwhile.


> @@ -57,15 +55,13 @@ void __init exynos_sysram_init(void)
>  		of_address_to_resource(node, 0, &res);
>  		sysram_base_addr = ioremap(res.start, resource_size(&res));
>  		sysram_base_phys = res.start;
> -		of_node_put(node);
>  		break;
>  	}
>  
> -	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram-ns") {
> +	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram-ns") {
>  		if (!of_device_is_available(node))
>  			continue;
>  		sysram_ns_base_addr = of_iomap(node, 0);
> -		of_node_put(node);
>  		break;
>  	}
>  }
> 


