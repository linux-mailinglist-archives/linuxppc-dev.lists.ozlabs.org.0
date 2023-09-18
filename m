Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D587A46AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 12:09:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Z2XvmWco;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rq0sK57pHz3cLj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 20:09:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Z2XvmWco;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RpyZH715Tz2yG9;
	Mon, 18 Sep 2023 18:26:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C1BEFCE0A7C;
	Mon, 18 Sep 2023 08:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1362EC433C7;
	Mon, 18 Sep 2023 08:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695025603;
	bh=sMXA/6fEari6gFcvN4K1t3oFk4UFIEvXkCv0bTqIj5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z2XvmWcozWHkSw/N8sb8Ry+NwN7vHjaQPDv3sxyalk6XldCahUkcj1cgGARw0kkHz
	 yKR/pNFJ9fM2gO4iQ63iJwfyjudX+nJreWAHWO/Y0KD87L4PsdK8/ClAb9aCu4qrBz
	 XIHRzKPc76RORYHeobe15Z6xsHb2TSzbLBEp9zlA=
Date: Mon, 18 Sep 2023 10:26:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH tty v1 00/74] serial: wrappers for uart port lock
Message-ID: <2023091826-seventy-opium-17b8@gregkh>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
 <87y1h3lwjh.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1h3lwjh.fsf@jogness.linutronix.de>
X-Mailman-Approved-At: Mon, 18 Sep 2023 20:08:24 +1000
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Hammer Hsieh <hammerh0314@gmail.com>, Jiamei Xie <jiamei.xie@arm.com>, NXP Linux Team <linux-imx@nxp.com>, Vineet Gupta <vgupta@kernel.org>, Thierry Reding <treding@nvidia.com>, Petr Mladek <pmladek@suse.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>, linux-unisoc@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Richard Genoud <richard.genoud@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Andrew Morton <akpm@linux-founda
 tion.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, Xiongfeng Wang <wangxiongfeng2@huawei.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, delisun <delisun@pateo.com.cn>, Fabio Estevam <festevam@gmail.com>, Ruan Jinjie <ruanjinjie@huawei.com>, Matthew Howell <matthew.howell@sealevel.com>, Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>, Hongyu Xie <xiehongyu1@kylinos.cn>, Tobias Klauser <tklauser@distanz.ch>, Yangtao Li <frank.li@vivo.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>, Sherry Sun <sherry.sun@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, Lukas Wunner <lukas@wunner.de>, Sergey Organov <sorganov@gmail.com>, Mukesh Ojha <quic_mojha@quicinc.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Lino Sanfilippo <l.sanfilippo@kunbus.com>, Tom Rix <trix@redhat.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>, Yuan Can <yuancan@huawei.com>, Isaac True <isaac.true@canonical.com>, linux-tegra@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Mateusz Holenko <mholenko@antmicro.com>, Kevin Cernekee <cernekee@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, Chen-Yu Tsai <wenst@chromium.org>, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo
 .jarvinen@linux.intel.com>, linux-snps-arc@lists.infradead.org, Patrice Chotard <patrice.chotard@foss.st.com>, Jacky Huang <ychuang3@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Timur Tabi <timur@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Konrad Dybcio <konrad.dybcio@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Baruch Siach <baruch@tkos.co.il>, Valentin Caron <valentin.caron@foss.st.com>, Tony Lindgren <tony@atomide.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue
 @foss.st.com>, sparclinux@vger.kernel.org, Shan-Chun Hung <schung@nuvoton.com>, linux-riscv@lists.infradead.org, Marek Vasut <marex@denx.de>, Lech Perczak <lech.perczak@camlingroup.com>, Russell King <linux@armlinux.org.uk>, Nick Hu <nick.hu@sifive.com>, Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Johan Hovold <johan@kernel.org>, linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, Taichi Sugaya <sugaya.taichi@socionext.com>, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lucas Tanure <tanure@linux.com>, Andrew Davis <afd@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Ta
 kao Orito <orito.takao@socionext.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 18, 2023 at 10:29:30AM +0206, John Ogness wrote:
> On 2023-09-14, John Ogness <john.ogness@linutronix.de> wrote:
> > Provide and use wrapper functions for spin_[un]lock*(port->lock)
> > invocations so that the console mechanics can be applied later on at a
> > single place and does not require to copy the same logic all over the
> > drivers.
> 
> For the full 74-patch series:
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> 
> Sorry that my SoB was missing from the initial posting.

Thanks for this, I'll rebuild my tree with this added.

greg k-h
