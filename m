Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B57887272
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 19:01:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=lJ6R4eit;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1VW11W0Nz3w9t
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 05:01:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=lJ6R4eit;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=nicolas.ferre@microchip.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Sat, 23 Mar 2024 02:14:29 AEDT
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1Qps3p9Kz3vYp;
	Sat, 23 Mar 2024 02:14:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711120469; x=1742656469;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=F50EgZ2lJjv6pHduFkF5MM5IKGV69nz1KM4YNtLhMAs=;
  b=lJ6R4eit6rZQ/gqYyhyQTNoILh7DDt8NvTnVpRLc+0Cbr7cCeCJsmC7y
   kedJnmliWWR66HScfUY0POBnj9WNF0wx4glzWNPupb1Mkd7Xl6CIPMBcY
   6Nv08oIpIpA2wTAodepHxSyM8kztXirGOF3ggKC3acQxDpYET0MIn3qD2
   iYinfNYQU7EAzgpMc3BN1ctD8K3pO+g9n3gmqJT3h6Vqwi/9oEvcmubEb
   9U8bZcSrcyjAfL+4fKWgYzbJgQvo4Vc33gAraS2dJzgQKGzUqcHJ6ta4D
   f7hlR3vUUVFqm6JhdAXJeJHvU/gSgg2UuRilLBkMlDNoUkH07hfoNUeyD
   Q==;
X-CSE-ConnectionGUID: X1l3K2T7QvGR7YYL+xW82w==
X-CSE-MsgGUID: FtnGXb0RSl6ESGuAQ94UKg==
X-IronPort-AV: E=Sophos;i="6.07,146,1708412400"; 
   d="scan'208";a="185306479"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Mar 2024 08:13:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 08:13:07 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 22 Mar 2024 08:12:51 -0700
Message-ID: <e8dff9d4-ed15-44e9-ae9a-2e77845ec40b@microchip.com>
Date: Fri, 22 Mar 2024 16:11:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
Content-Language: en-US, fr-FR
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	<linux-i2c@vger.kernel.org>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 23 Mar 2024 04:58:59 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Tomer Maimon <tmaimon77@gmail.com>, Ajay Gupta <ajayg@nvidia.com>, Viresh Kumar <viresh.kumar@linaro.org>, Linus
 Walleij <linus.walleij@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Khalil Blaiech <kblaiech@nvidia.com>, Oleksij
 Rempel <o.rempel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Yicong Yang <yangyicong@hisilicon.com>, Laxman Dewangan <ldewangan@nvidia.com>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Aneesh
 Kumar K.V" <aneesh.kumar@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>, Ryan Wanner <Ryan.Wanner@microchip.com>, Andi Shyti <andi.shyti@kernel.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Nick Hawkins <nick.hawkins@hpe.com>, linux-amlogic@lists.infradead.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Hector Martin <marcan@marcan.st>, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin
 Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org, imx@lists.linux.dev, Jean-Marie Verdun <verdun@hpe.com>, linux-tegra@vger.kernel.org, Elie Morisse <syniurge@gmail.com>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Peter Korsgaard <peter@korsgaard.com>, Benjamin Fair <benjaminfair@google.com>, Michal
 Simek <michal.simek@amd.com>, Nancy Yuen <yuenn@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Codrin
 Ciubotariu <codrin.ciubotariu@microchip.com>, Robert Richter <rric@kernel.org>, Asmaa Mnebhi <asmaa@nvidia.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Conghui Chen <conghui.chen@intel.com>, Benson Leung <bleung@chromium.org>, Qii Wang <qii.wang@mediatek.com>, Avi Fishman <avifishman70@gmail.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Konrad Dybcio <konrad.dybcio@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, asahi@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>, Vignesh R <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Jan Dabros <jsd@semihalf.com>, openbmc@lists.ozlabs.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Sven Peter <sven@svenpeter.dev>, virtualization@lists.linux.dev, Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Loic Poulain <loic.pou
 lain@linaro.org>, Patrick Venture <venture@google.com>, Bjorn Andersson <andersson@kernel.org>, linux-mips@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/03/2024 at 14:25, Wolfram Sang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

[..]

>   drivers/i2c/busses/i2c-at91-master.c       |  2 +-
>   drivers/i2c/busses/i2c-at91-slave.c        |  8 ++++----

[..]

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com> # for at91
Probably file names themselves will need some care, in a second time.

Thanks. Regards,
   Nicolas

[..]

> --
> 2.43.0
> 

