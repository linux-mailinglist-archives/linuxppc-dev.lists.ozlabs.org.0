Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F372D713967
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 14:15:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QTd0C6DR5z3f8c
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 22:15:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EKY74s2B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EKY74s2B;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QTc8q24X0z30QD;
	Sun, 28 May 2023 21:37:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8756E61445;
	Sun, 28 May 2023 11:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CFAFC433D2;
	Sun, 28 May 2023 11:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685273862;
	bh=BIru6hlSNmRQGDEmy/Ww2n/Ov46kOSzrO8WVSVMyVwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EKY74s2BqKVHsqdLZEJDtyzRLP27oRRAE5LsCzf35joLA4Bv8NFE6KwFSXzjEcDAc
	 /QHhhuwz8E4i4TDH5lCtMbNH7ouvxh60fkkTD/Otlm/A+C79fe6sGqqSkaxM+fI2/7
	 xnKqQUPfkVoUXTG/Y91VsilUBchm/3mfEM5jOOP0=
Date: Sun, 28 May 2023 12:37:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/97] usb: Convert to platform remove callback returning
 void
Message-ID: <2023052848-patronage-zen-de4b@gregkh>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Sun, 28 May 2023 22:14:39 +1000
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
Cc: Richard Leitner <richard.leitner@linux.dev>, Tomer Maimon <tmaimon77@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Justin Chen <justinpopo6@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Hongren Zheng <i@zenithal.me>, Zheng Wang <zyytlz.wz@163.com>, Gaosheng Cui <cuigaosheng1@huawei.com>, Jerome Brunet <jbrunet@baylibre.com>, Phil Edworthy <phil.edworthy@renesas.com>, linux-samsung-soc@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Artur Bujdoso <artur.bujdoso@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, NXP Linux Team <linux-imx@nxp.com>, Cristian Birsan <cristian.birsan@microchip.com>, linux-tegra@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Souradeep Chowdhury <quic_schowdhu@quicinc.com>, linux-omap@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Neal Liu <neal_liu@aspeedtech.com>, Peter Chen <peter.chen@
 kernel.org>, linux-usb@vger.kernel.org, kernel@pengutronix.de, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Prashanth K <quic_prashk@quicinc.com>, Thierry Reding <thierry.reding@gmail.com>, Shuah Khan <shuah@kernel.org>, Jean Delvare <jdelvare@suse.de>, Piyush Mehta <piyush.mehta@amd.com>, Jim Lin <jilin@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Minas Harutyunyan <hminas@synopsys.com>, Haotien Hsu <haotienh@nvidia.com>, Colin Ian King <colin.i.king@gmail.com>, Kang Chen <void0red@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Aswath Govindraju <a-govindraju@ti.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Roger Quadros <rogerq@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org, Wayne Chang <waynec@nvidia.com>, Sing-Han Chen <singhanc@nvidia.com>, linux-arm-ke
 rnel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, Darren Stevens <darren@stevens-zone.net>, Herve Codina <herve.codina@bootlin.com>, Dan Carpenter <error27@gmail.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, Al Cooper <alcooperx@gmail.com>, Valentina Manea <valentina.manea.m@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, Benjamin Fair <benjaminfair@google.com>, Michal Simek <michal.simek@amd.com>, Kevin Cernekee <cernekee@gmail.com>, Nancy Yuen <yuenn@google.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, Paolo Abeni <pabeni@redhat.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Arnd Bergmann <arnd@arndb.de>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, Vladimir Zapolskiy <vz@mlei
 a.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, Olav Kongas <ok@artecdesign.ee>, Shaomin Deng <dengshaomin@cdjrlc.com>, Tang Bin <tangbin@cmss.chinamobile.com>, Avi Fishman <avifishman70@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>, Konrad Dybcio <konrad.dybcio@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Shawn Guo <shawnguo@kernel.org>, Lei YU <yulei.sh@bytedance.com>, Tali Perry <tali.perry1@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Henry Tian <tianxiaofeng@bytedance.com>, openbmc@lists.ozlabs.org, Andy Gross <agross@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Pawel Laszczak <pawell@cadence.com>, Kalle Valo <kvalo@kernel.org>, Dongliang Mu <mudongliangabcd@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevche
 nko@linux.intel.com>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Patrick Venture <venture@google.com>, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Li Yang <leoyang.li@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rui Miguel Silva <rui.silva@linaro.org>, linuxppc-dev@lists.ozlabs.org, Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 18, 2023 at 01:01:02AM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> this series convers the drivers below drivers/usb to the .remove_new()
> callback of struct platform_driver(). The motivation is to make the
> remove callback less prone for errors and wrong assumptions. See commit
> 5c5a7680e67b ("platform: Provide a remove callback that returns no
> value") for a more detailed rationale.
> 
> All drivers converted here already returned zero unconditionally in their
> .remove() callback, so converting them to .remove_new() is trivial.

All but 2 patches applied, as one was for a driver that wasn't in the
tree anymore, and the dwc2 patch didn't apply at all.

thanks,

greg k-h
