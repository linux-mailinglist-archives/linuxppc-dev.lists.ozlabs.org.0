Return-Path: <linuxppc-dev+bounces-15323-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF7ACF7CE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 11:35:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlncZ67XBz2xLR;
	Tue, 06 Jan 2026 21:35:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767695726;
	cv=none; b=akGxcProv4A8ORG5rTZkhFZ1N0dl5CA4DsXd5VsCCpLQOZEhvVybPlbnuPpBU3c/XXNrZ1IH8RV4OYPWuFa1bh0ApdWoVKyUd1HWyfbqsIpV5prA1q0/ZxOx91QpYfh8lV11zSpqbQ85RvX7ZCjNGzQlLNUFbtM4jW4rWBmtHS7ZEq1jRQGzVPpPL/4IC+DIYW03yOG1OGEAA+NY/1tuE/F2Ry6mU0ZZ1bWwEiGz7Wf2nmU6CFtK3d32dlnDWvHJaoKriLQu7tTZWgB4SRiQJ95XBRiDo5BlRE4Q+/wyH0geRUOKBitODnefUO6C9OC359yAuU9woFUIXS1RExhCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767695726; c=relaxed/relaxed;
	bh=YofzUWWUbXFyzC0jSht6vCG8DZDYif+vmqb0NDO6BzY=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H9vqV7anAOLdFn36fd/xfMZ75+u7YevT6WGqmzyAhnpagQPAF0WhrT0spdGAKvvfbgKE769QKddwevNvlmllTTHg1Ebtv7I/I9nDMDNpVACJ57NFEaPFemReZtsShVi+PVhrTBgcyxY6mgQVrCkt4apl/1iydQhSdfMV6rxKpwPY8lgB4pe28ZNm8K95EkaJWNdU14FZfGey0Z7ESC0woWDymQrrjKB9NJPtQybGEBUm2kLrUAzmnzwOo8qjnA0cWroZaUugDkqZo6hZvQFo+BOxsdfvtyEHNFDXb3KVpktwEK0bmbcXIjXk7ey4CksG9H1fZH7+CotxiQagtR6DlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlncY1jpzz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 21:35:23 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlncL3gwGzHnHGw;
	Tue,  6 Jan 2026 18:35:14 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 7E19C40570;
	Tue,  6 Jan 2026 18:35:18 +0800 (CST)
Received: from localhost (10.48.149.114) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 10:35:15 +0000
Date: Tue, 6 Jan 2026 10:35:12 +0000
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
Subject: Re: [PATCH 11/11] cpufreq: s5pv210: Simplify with scoped for each
 OF child loop
Message-ID: <20260106103512.00002266@huawei.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-11-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
	<20260105-of-for-each-compatible-scoped-v1-11-24e99c177164@oss.qualcomm.com>
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

On Mon, 05 Jan 2026 14:33:49 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.  Note that there is another part of code using "np"
> variable, so scoped loop should not shadow it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Patch is fine so
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Bit odd to use devm_ for a driver that has no real support for being unbound
(looks like it leaks everything if that happens) but to me it looks like
it might be worth doing anyway to allow direct returns in error
cases etc.  Anyhow, that's a much bigger looking project and would need
a devm_add_action_or_reset() for the final register and someone to test
it doesn't blow up if an unbind does happen.

One of the things I like about reviewing this sort of cleanup series
is it makes me look at a bunch of code I'd never normally go see ;)

Jonathan

> 
> ---
> 
> Depends on the first patch.
> ---
>  drivers/cpufreq/s5pv210-cpufreq.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index ba8a1c96427a..e64e84e1ee79 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -629,19 +629,17 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>  		goto err_clock;
>  	}
>  
> -	for_each_compatible_node(np, NULL, "samsung,s5pv210-dmc") {
> -		id = of_alias_get_id(np, "dmc");
> +	for_each_compatible_node_scoped(dmc, NULL, "samsung,s5pv210-dmc") {
> +		id = of_alias_get_id(dmc, "dmc");
>  		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
> -			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", np);
> -			of_node_put(np);
> +			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
>  			result = id;
>  			goto err_clk_base;
>  		}
>  
> -		dmc_base[id] = of_iomap(np, 0);
> +		dmc_base[id] = of_iomap(dmc, 0);
>  		if (!dmc_base[id]) {
>  			dev_err(dev, "failed to map dmc%d registers\n", id);
> -			of_node_put(np);
>  			result = -EFAULT;
>  			goto err_dmc;
>  		}
> 


