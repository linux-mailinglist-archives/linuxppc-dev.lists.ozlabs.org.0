Return-Path: <linuxppc-dev+bounces-15318-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D7CF7BD3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 11:17:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlnDB4hRRz2yMh;
	Tue, 06 Jan 2026 21:17:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767694666;
	cv=none; b=cl48vP8azD03JDcidGGuZiku0JnMtZl0BmGorh6ERpZ08R/I5pfa8GbBs3O3bVzLAwusEqafXR3E5GIRme3by3y2O0MU11Y+rhtwrdOkvcyQ8Fm8f4guv86ylyKl1PNoXPesr7riLRBz82oVRl+N+NbjiMuRUhUeBpRa9L9FoPoGWeaSSYs/C6xP4IKkWCBNKdhMdf7V8xsHk2ISzNUc1whDTSDwbW8NbdNxCImKm9AIrEhvaEMd7jtAx5edsmg8JrUbV5HmPoswf366VdB5Z//b9vMfu8ru6CmW7vNRQq2K54Xw+sc16FuOMXrh33hwDxc0LzvyuIaUN+/a/+oCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767694666; c=relaxed/relaxed;
	bh=zYT5wqbUqDm/mUM69DIGafZy3AzuMM1pGAE6Z08iK2k=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sf9JcDgWxFFuXCLkWGeZVN5jzZ3nnuz4j7pj2hXcZ4jMPp1DA9afl3Yg34T8nfVYYKApe/AEt/P6HxroDCgCFTL8d+JHdfh1zdI3+FV9aSGFBa74VGc+Pu6L9Z3ZmaFnxyfD1Zkny7T96275HscTOo0AuwCNB9y5SuxNZA6rN7ga5tWyZw3rrT+SogEOxeZmeOP9NQSZuEI2WSwqiAjRaZ6VAAIiu9Tv4/xftZzahtM9O8k3aha54LU2aMjducqCfcFJKK3QvOi1C0DJyvrnsM+d7ksJV1QAsZ/Msnj/kklGngwYaPr+9IEdWhmW+A15nyMiDoW1aPEKunxLkM0pmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlnD93DcLz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 21:17:43 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlnCz32yTzHnHX4;
	Tue,  6 Jan 2026 18:17:35 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D87E4056A;
	Tue,  6 Jan 2026 18:17:39 +0800 (CST)
Received: from localhost (10.48.149.114) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 10:17:37 +0000
Date: Tue, 6 Jan 2026 10:17:33 +0000
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
Subject: Re: [PATCH 06/11] cdx: Simplify with scoped for each OF child loop
Message-ID: <20260106101733.000059e9@huawei.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-6-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
	<20260105-of-for-each-compatible-scoped-v1-6-24e99c177164@oss.qualcomm.com>
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

On Mon, 05 Jan 2026 14:33:44 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
I'd be tempted to make one more tweak in this one to bring
it inline with the suggestions around not combining scoped cleanups
with gotos (see the comments in cleanup.h)

No bug here, just nice to have.
> 
> ---
> 
> Depends on the first patch.
> ---
>  drivers/cdx/cdx.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
> index b39af2f1937f..bbde529aaa93 100644
> --- a/drivers/cdx/cdx.c
> +++ b/drivers/cdx/cdx.c
> @@ -608,7 +608,6 @@ static ssize_t rescan_store(const struct bus_type *bus,
>  {
>  	struct cdx_controller *cdx;
>  	struct platform_device *pd;
> -	struct device_node *np;
>  	bool val;
>  
>  	if (kstrtobool(buf, &val) < 0)
> @@ -623,10 +622,9 @@ static ssize_t rescan_store(const struct bus_type *bus,
>  	cdx_unregister_devices(&cdx_bus_type);
>  
>  	/* Rescan all the devices */
> -	for_each_compatible_node(np, NULL, compat_node_name) {
> +	for_each_compatible_node_scoped(np, NULL, compat_node_name) {
>  		pd = of_find_device_by_node(np);
>  		if (!pd) {
> -			of_node_put(np);
>  			count = -EINVAL;
>  			goto unlock;
break instead.
Or better yet a follow up patch to use guard() for the mutex allowing a
direct return here.


>  		}
> 


