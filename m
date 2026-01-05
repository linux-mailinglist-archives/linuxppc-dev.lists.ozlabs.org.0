Return-Path: <linuxppc-dev+bounces-15278-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAECCF3E1E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 14:43:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlFqV0vsjz2yFW;
	Tue, 06 Jan 2026 00:43:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767620582;
	cv=none; b=DsOECdwPmvFZ8XQzQ5hLh8H6OMp2GoqAGL0etQKHE92rI3UJxnJxCJiiWYFqzG2PhyfnFo7iaGWBOBdWjLcbzEz2Tt1ob1qwjr8eJWaJJ/zw7r6TN2KUMyrx+oTnOb076kSLKcj823mnjxVrPIaVDsfTljwscSwiIgLTsCUbEAcRMnUz49Eye43mcT/03qlR2AHEP6I9hofmxcP2Z58QJyITYO/4oyFlpH0SpIaJ+9iDUEIVs5R6nSNuujxzeKtRQN8Y1wdg3n4tVwf9gKqNRH96hPY3miWapIAeNAQ5/UkMpgP0qjuRR9RuaO2HDkYKbMVizgAN5Cs6kd9lEDmcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767620582; c=relaxed/relaxed;
	bh=nW4FzkxLPeaZw8ODTfOg6Tu/LkvVmWEmLVso3YA+EUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=F8aKO4A48SusBRaT1o3BpCMZFIDLA2lUgDAiLh7KEBxNM5Wfsdd6uhfmkFsYZ5UMqamv9oClxU1H4QzAUfD11iJhEKDnGCwLgXQFKGsueffEhfgL3EVbJXlPyhqvN0edreJroWhXeAkcAdRwy2jF3q8rGtBpTokjptD1iBGha6rN48RDD8lF/Tk1gnTHmf4FnNp+v/Bng7NMPPLJkwK7kWsUzOmdYZa0pfOW2wI7K6Z5E6WO2QSMR23eE5vmnjkE9fuS08sAQ6X6NUDAkno/Py1kOYZjEC118r2GN+8CNlcK+jQa0goqxviGCc4Wu2XLTAmd27tKf8ybCptUvvgjow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=eAPLSXu0; dkim-atps=neutral; spf=pass (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=prvs=45855fd85=nicolas.ferre@microchip.com; receiver=lists.ozlabs.org) smtp.mailfrom=microchip.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=eAPLSXu0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=prvs=45855fd85=nicolas.ferre@microchip.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Tue, 06 Jan 2026 00:43:00 AEDT
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlFqS2sT2z2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 00:43:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1767620579; x=1799156579;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=a3Sj0a26r3lVQlAJmFwNu/sL9HQAEQqcEw3msVeSpzM=;
  b=eAPLSXu0efRoYT9r0caBuncmI565c8OzFiaFaZL7CDP4LSZZJoqzStl1
   ZRCxsFXRc7dM4ItFt3jLrVsAkR/LthA5zaMohKjVCFolSaoeGAh4vI3sU
   X72HZmnBFLOTjQvWVIp2bth2LSzYikg9FtkefE294mqCp0+OzU+HPJP00
   qInXGu3JDrslMkQwWGjWoEfw36pUKcz/ZXLqLW05uPLcXEt2/bmb9PMQF
   pB4tjgAdsubSjWeVcIllpe43aPI56StIu22kM/Mf3q0pgK7H2SH3HMgQ3
   heYRyvr7WsZ9PG3em3W75Z9G4LK9EuMBNZA14CDjSVfINpMj8mwFfT7D1
   g==;
X-CSE-ConnectionGUID: HBkZ5l8JRtWI55dHimVviw==
X-CSE-MsgGUID: JZGd2c01Rd6FFUdxsxi0Mw==
X-IronPort-AV: E=Sophos;i="6.21,203,1763449200"; 
   d="scan'208";a="58252843"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jan 2026 06:41:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 5 Jan 2026 06:41:52 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 5 Jan 2026 06:41:43 -0700
Message-ID: <49ebaa9d-cad9-42cd-8bb9-5210fe18eeb5@microchip.com>
Date: Mon, 5 Jan 2026 14:41:47 +0100
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
Subject: Re: [PATCH 02/11] ARM: at91: Simplify with scoped for each OF child
 loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Miguel Ojeda
	<ojeda@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	<morbo@google.com>, Justin Stitt <justinstitt@google.com>, Russell King
	<linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski
	<krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
	<dmaengine@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-pm@vger.kernel.org>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Krzysztof,

On 05/01/2026 at 14:33, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for handling this!
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Best regards,
   Nicolas

> ---
> 
> Depends on the first patch.
> ---
>   arch/arm/mach-at91/pm.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index 35058b99069c..68bb4a86cd94 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -982,15 +982,12 @@ static void __init at91_pm_sram_init(void)
>          struct gen_pool *sram_pool;
>          phys_addr_t sram_pbase;
>          unsigned long sram_base;
> -       struct device_node *node;
>          struct platform_device *pdev = NULL;
> 
> -       for_each_compatible_node(node, NULL, "mmio-sram") {
> +       for_each_compatible_node_scoped(node, NULL, "mmio-sram") {
>                  pdev = of_find_device_by_node(node);
> -               if (pdev) {
> -                       of_node_put(node);
> +               if (pdev)
>                          break;
> -               }
>          }
> 
>          if (!pdev) {
> 
> --
> 2.51.0
> 


