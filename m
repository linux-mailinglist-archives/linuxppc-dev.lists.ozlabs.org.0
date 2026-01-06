Return-Path: <linuxppc-dev+bounces-15314-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5F9CF7AC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 11:06:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlmzL4SGXz2yMJ;
	Tue, 06 Jan 2026 21:06:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767693998;
	cv=none; b=WBLp5O9kpeuB6Tk2Jo0bSw9rbdmz4bnI1HXKvxXN/9a51bK9lGakhgVqHsgXjriGxdUjYOPlJPYZ1d6IhrGMudmL9nQU79H1VVGQecq/5fCMH9qQC6BFZEgJDG8bo5BAg+Ivji3dCu5+M6A5LYAWDMF6VZk8LyCA9poWjA54g3NGYQ+8qSpQXZS8D6MH8YiHyxGZbgvjsvzqwVbzDH4ZpEKFmXFMiUDQE/NlYyoI5PZQE6gM3sXgPwP7mzbQ6AiwS/6CrdKXF/ki3xvBE7jV+T8kRdthtQM3iHo5YkXHu4KihIFXF44c+siWgqMBBwQQFbUt5sIdcqb3MIs8HSA54A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767693998; c=relaxed/relaxed;
	bh=YsdGILf7uDjjbcXyetjyi9iEF0t78DsgrRFT9Xu0dT0=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xy4qhRQ3hHVcZeWCgIsWRZutvvbBxCHgBLM/9QT7wMEVlw74lXWzPyKZwm7z3WlnuX6m8E/7zjfbLOyq/mgNwWjNKt2Ccd90KfwxoilBf8ikm04nG+V47ziCNI4Ri64eIu8dyRY9m8E58pif6srRoqJZ9ua43aDyxs2TsFOiXmCh1t74VnUgWGE0FIwFVy63A0g9btNoJwXcjT8vyDxz5iJY3SIdUAh0CjAlQ4QSmvUr2NKp47UKIcd6Bv5AUOZec3iO6nmcM3DZPnqoxrnfbwN6SJGH+iHYLzEUwCkhRm3gJGkbRC15r3AGxjPOy/k+eQus7XiBWK+VmMZ9ig7XPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlmzK3zkdz2y7c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 21:06:37 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlmzD5H6QzJ4722;
	Tue,  6 Jan 2026 18:06:32 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 2015740565;
	Tue,  6 Jan 2026 18:06:34 +0800 (CST)
Received: from localhost (10.48.149.114) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 10:06:31 +0000
Date: Tue, 6 Jan 2026 10:06:30 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
CC: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	<morbo@google.com>, Justin Stitt <justinstitt@google.com>, Russell King
	<linux@armlinux.org.uk>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nipun Gupta
	<nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, Abel Vesa
	<abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
	<dmaengine@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-pm@vger.kernel.org>
Subject: Re: [PATCH 02/11] ARM: at91: Simplify with scoped for each OF child
 loop
Message-ID: <20260106100630.000073b6@huawei.com>
In-Reply-To: <20260106100429.00001852@huawei.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
	<20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
	<20260106100429.00001852@huawei.com>
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

On Tue, 6 Jan 2026 10:04:29 +0000
Jonathan Cameron <jonathan.cameron@huawei.com> wrote:

> On Mon, 05 Jan 2026 14:33:40 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 
> > Use scoped for-each loop when iterating over device nodes to make code a
> > bit simpler.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>  
> Interesting bit of code. I guess there is some history here that didn't
> get captured as a comment?
> 
> > 
> > ---
> > 
> > Depends on the first patch.
> > ---
> >  arch/arm/mach-at91/pm.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> > index 35058b99069c..68bb4a86cd94 100644
> > --- a/arch/arm/mach-at91/pm.c
> > +++ b/arch/arm/mach-at91/pm.c
> > @@ -982,15 +982,12 @@ static void __init at91_pm_sram_init(void)
> >  	struct gen_pool *sram_pool;
> >  	phys_addr_t sram_pbase;
> >  	unsigned long sram_base;
> > -	struct device_node *node;
> >  	struct platform_device *pdev = NULL;
> >  
> > -	for_each_compatible_node(node, NULL, "mmio-sram") {
> > +	for_each_compatible_node_scoped(node, NULL, "mmio-sram") {
> >  		pdev = of_find_device_by_node(node);
> > -		if (pdev) {
> > -			of_node_put(node);
> > +		if (pdev)
> >  			break;
> > -  
> 		}
> I'm curious if there are DT out there that ever causes the code to get to 
> here?  There might be multiple mmio-sram nodes but if there were seems unlikely
> the driver wants which ever one has a pdev at a given point in time.
> That feels like a weird race condition. So in practice I'd expect this to
> always either get the first one, or none.
> e.g. Why this can't just be
> 
> node = of_find_node_by_name("mmio-sram);
ah. Not name obviously.  Need more coffee.
of_find_compatible_node()

> if (node) {
> 	pdev = of_find_device_by_node(node);
> }
> 
> or something along those lines.
> 
> Given risk of a regression maybe better to do what you have here.
> So with that in mind
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
> >  	}
> >  
> >  	if (!pdev) {
> >   
> 


