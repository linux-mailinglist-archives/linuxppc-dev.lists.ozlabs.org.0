Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB5455F3B6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 05:11:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXmgs3l0dz3f21
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 13:11:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IHoWciH6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IHoWciH6;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXMTY3dvrz3cdf;
	Tue, 28 Jun 2022 21:15:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656414946; x=1687950946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VAm8GqMxSVbXa5l11MJLdH5RISvLfde2v1QEXHVyiio=;
  b=IHoWciH6oSb9a7OJsZB0GBiiIh4o3AUV4J5rhHTn12rthQrhye/A5mcW
   suvkGFP01DX9Q8iyWBzI6k93ivuhoKv8SesdEUV3h81ThVggfU+xxtV5g
   3HAxtc6W+Xabg1niaRQh5ZKWZnOJrML+OyIrEnPnzJXrC1HojuOhPu/h9
   kMvJoE1nmGfo1fZJO/YnzV5AgShywMWQ8ZDiK/rZTypNgXU3YFZ5SSH9a
   EBfCqU4kfl+54nQavGK1kv6H2zj8Qx0ZjgFScn99mswKLCig931F4JvFj
   IUx9tE49ikIRAubGEfyYrMzkrksdqF5ZTol6LclKUMGNRpybEwzoMp3hC
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="261516056"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="261516056"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 04:15:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="540456672"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 04:15:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1o69BV-000wl7-8C;
	Tue, 28 Jun 2022 14:15:09 +0300
Date: Tue, 28 Jun 2022 14:15:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v1 0/2] Fix console probe delay when stdout-path isn't set
Message-ID: <Yrrivbk2NSK3loBW@smile.fi.intel.com>
References: <20220628020110.1601693-1-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628020110.1601693-1-saravanak@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Wed, 29 Jun 2022 13:09:16 +1000
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
Cc: andrew lunn <andrew@lunn.ch>, peng fan <peng.fan@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linus walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Hammer Hsieh <hammerh0314@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Vineet Gupta <vgupta@kernel.org>, len brown <len.brown@intel.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kerne
 l@pengutronix.de>, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, pavel machek <pavel@ucw.cz>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, eric dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, sascha hauer <sha@pengutronix.de>, Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>, Tobias Klauser <tklauser@distanz.ch>, linux-mips@vger.kernel.org, kernel-team@android.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andreas Farber <afaerber@suse.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Pali Rohar <pali@kernel.org>, heiner kallweit <hkallweit1@gmail.com>, ulf hansson <ulf.hansson@linaro.o
 rg>, Neil Armstrong <narmstrong@baylibre.com>, Lorenz

o Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>, linux-tegra@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Mateusz Holenko <mholenko@antmicro.com>, Alexander Shiyan <shc_work@mail.ru>, kevin hilman <khilman@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>, paolo abeni <pabeni@redhat.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-snps-arc@lists.infradead.org, Timur Tabi <timur@kernel.org>, hideaki yoshifuji <yoshfuji@linux-ipv6.org>, iommu@lists.linux-foundation.org, Laxman Dewangan <ldewangan@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>, Baolin Wang <baolin.wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Baruch Siach <baruch@tkos.
 co.il>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, joerg roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org, jakub kicinski <kuba@kernel.org>, will deacon <will@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, netdev@vger.kernel.org, david ahern <dsahern@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Takao Orito <orito.takao@socionext.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 27, 2022 at 07:01:01PM -0700, Saravana Kannan wrote:
> Since the series that fixes console probe delay based on stdout-path[1] got
> pulled into driver-core-next, I made these patches on top of them.
> 
> Even if stdout-path isn't set in DT, this patch should take console
> probe times back to how they were before the deferred_probe_timeout
> clean up series[2].

Are you sure it's only limited to the serial drivers?
(just asking, I don't know myself the answer)

-- 
With Best Regards,
Andy Shevchenko


