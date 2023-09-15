Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AC87A1E88
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 14:22:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=hfofoNUX;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XoGHAuaQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnCy50MrYz3cPF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 22:22:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=hfofoNUX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XoGHAuaQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 334 seconds by postgrey-1.37 at boromir; Fri, 15 Sep 2023 22:09:59 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnCgC1Bsbz3c27;
	Fri, 15 Sep 2023 22:09:59 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694779455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q3Ibg3p9cDagivhDktxq8eP8BYordpmk7hum3Axk04g=;
	b=hfofoNUXRajtM0GjlTDL3S8uCPrZulnUAl3sDOuUPa5oy4jGgAgNbuoN9zq30CvsIMo6cQ
	76S8YLIyYmUWLWqXq+B6LailcKKqcikZGHOc4Erpeot3J8LvMzg2R6WVBIi3xzRwnUY395
	pS/yCtuKAjRQXT0+x4oEIpQyUhpbeGdMECufG8cXCZoM+44lexmwXf4O2LHWyQ5xwYsTtI
	hG+jNq5wP5koi7uiKsR8aQVs4cDip7FcG5dlrN7qOoLDiEan+8YKeUcutQq6RBBnllQ/za
	F8F1a6fTyU+1T0L+VnAkTGdL1QBpNnEZDKqVeyezp0ZEm/31ANRktL+QyqAdKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694779455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q3Ibg3p9cDagivhDktxq8eP8BYordpmk7hum3Axk04g=;
	b=XoGHAuaQljzpxY7rNPRk66q5CkUTImgsUWadAIDMEofDY3WaI6vm1ZUxH4Wc2bfKw2zqPJ
	9SjBirKXUrFTwlAA==
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, John Ogness
 <john.ogness@linutronix.de>
Subject: Re: [PATCH tty v1 00/74] serial: wrappers for uart port lock
In-Reply-To: <alpine.DEB.2.21.2309141959100.57368@angie.orcam.me.uk>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
 <alpine.DEB.2.21.2309141959100.57368@angie.orcam.me.uk>
Date: Fri, 15 Sep 2023 14:04:14 +0200
Message-ID: <87il8b1w3l.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 15 Sep 2023 22:22:09 +1000
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Hammer Hsieh <hammerh0314@gmail.com>, Jiamei Xie <jiamei.xie@arm.com>, NXP Linux Team <linux-imx@nxp.com>, Vineet Gupta <vgupta@kernel.org>, Thierry Reding <treding@nvidia.com>, Petr Mladek <pmladek@suse.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>, linux-unisoc@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Richard Genoud <richard.genoud@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Alexandre Bello
 ni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, Xiongfeng Wang <wangxiongfeng2@huawei.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, delisun <delisun@pateo.com.cn>, Fabio Estevam <festevam@gmail.com>, Ruan Jinjie <ruanjinjie@huawei.com>, Matthew Howell <matthew.howell@sealevel.com>, Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>, Hongyu Xie <xiehongyu1@kylinos.cn>, Tobias Klauser <tklauser@distanz.ch>, Yangtao Li <frank.li@vivo.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>, Sherry Sun <sherry.sun@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, "David
 S. Miller" <davem@davemloft.net>, Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, Lukas Wunner <lukas@wunner.de>, Sergey Organov <sorganov@gmail.com>, Mukesh Ojha <quic_mojha@quicinc.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Lino Sanfilippo <l.sanfilippo@kunbus.com>, Tom Rix <trix@redhat.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>, Yuan Can <yuancan@huawei.com>, Isaac True <isaac.true@canonical.com>, linux-tegra@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Mateusz Holenko <mholenko@antmicro.com>, Kevin Cernekee <cernekee@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, Chen-Yu Tsai <wenst@chromium.org>, Ilpo =?utf
 -8?Q?J?= =?utf-8?Q?=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, linux-snps-arc@lists.infradead.org, Patrice Chotard <patrice.chotard@foss.st.com>, Jacky Huang <ychuang3@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Timur Tabi <timur@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Konrad Dybcio <konrad.dybcio@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Baruch Siach <baruch@tkos.co.il>, Valentin Caron <valentin.caron@foss.st.com>, Tony Lindgren <tony@atomide.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Liviu Dudau <liviu.dudau@arm.com>, A
 lexandre Torgue <alexandre.torgue@foss.st.com>, sparclinux@vger.kernel.org, Shan-Chun Hung <schung@nuvoton.com>, linux-riscv@lists.infradead.org, Marek Vasut <marex@denx.de>, Lech Perczak <lech.perczak@camlingroup.com>, Russell King <linux@armlinux.org.uk>, Nick Hu <nick.hu@sifive.com>, Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Johan Hovold <johan@kernel.org>, linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, Taichi Sugaya <sugaya.taichi@socionext.com>, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lucas Tanure <tanure@linux.com>, Andrew Davis <afd@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer
  Dabbelt <palmer@dabbelt.com>, Takao Orito <orito.takao@socionext.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 14 2023 at 20:01, Maciej W. Rozycki wrote:

> On Thu, 14 Sep 2023, John Ogness wrote:
>
>> Patches 2-74 switch all uart port locking call sites to use the new
>> wrappers. These patches were automatically generated using coccinelle.
>
>  Hmm, no need to do this for drivers/tty/serial/zs.c?

zs.c does not use port lock at all. It has like a couple of other
drivers a local homebrewn spinlock.

Thanks,

        tglx
