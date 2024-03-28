Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CBD890CD5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 23:01:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QQ+Ol01e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5HYN163Xz3vtq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 09:01:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QQ+Ol01e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5Bvr279cz3fQR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 05:31:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7250A61783;
	Thu, 28 Mar 2024 18:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9561C433C7;
	Thu, 28 Mar 2024 18:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711650709;
	bh=09Kq07Ctu1YK6YAopY47/y5AlbJwjHjNBMXfeYxKY3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQ+Ol01eGrtbmmXmm5UOF8z3YVrAFzrLyUinoyXQOw2oD/3BtgXxtRpcyL6qEGHMi
	 Fuf1dGmu1+mXVCx0A2v+QG1OZmZa5GwKeTprSp0vXiGl5WvN4w7glf0wb/Ho4jGsI6
	 A7WhuNfxRZ+SYEDd2EHDavctgY396ec7mZY6h+UmOVbwQhncgmm56Grgtq512eTU0I
	 juRVEJtAyO8mA2/2SAJmqgsMiWvU8lqDqaMAEVDmDUSGgn+tYLJ7mum23hafaIgM0S
	 0/cB+mlWradcKD4+nkGPqD1rFiy3Q7s73Qm1b4qRq5IHy2lK358t2WVn9s4EqNJkuF
	 qXaWYWlrz6OoQ==
Date: Fri, 29 Mar 2024 00:01:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
Message-ID: <ZgW3j1qkLA-QU4iM@matsya>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com>
 <ZgUGXTKPVhrA1tam@matsya>
 <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com>
X-Mailman-Approved-At: Fri, 29 Mar 2024 08:57:06 +1100
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
Cc: imx@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>, Oliver Neukum <oneukum@suse.com>, duncan.sands@free.fr, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>, aubin.constans@microchip.com, Linus Walleij <linus.walleij@linaro.org>, Frank Li <Frank.Li@nxp.com>, linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org, Netdev <netdev@vger.kernel.org>, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-riscv@lists.infradead.org, "K. Y. Srinivasan" <kys@microsoft.com>, Robert Jarzmik <robert.jarzmik@free.fr>, haijie1@huawei.com, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, linux-rdma@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, Jassi Brar <jassisingh
 brar@gmail.com>, Dexuan Cui <decui@microsoft.com>, HaraldWelte@viatech.com, Jernej Skrabec <jernej.skrabec@gmail.com>, "jh80.chung" <jh80.chung@samsung.com>, zw@zh-kernel.org, Chen-Yu Tsai <wens@csie.org>, Alan Stern <stern@rowland.harvard.edu>, linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>, pierre@ossman.eu, linux-usb@vger.kernel.org, Eugeniy.Paltsev@synopsys.com, Patrice Chotard <patrice.chotard@foss.st.com>, asahi@lists.linux.dev, brucechang@via.com.tw, Kees Cook <keescook@chromium.org>, oakad@yahoo.com, Sven Peter <sven@svenpeter.dev>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@gmail.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Matthias B
 rugger <matthias.bgg@gmail.com>, openipmi-developer@lists.sourceforge.net, Mauro Carvalho Chehab <mchehab@kernel.org>, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Scott Branden <sbranden@broadcom.com>, logang@deltatee.com, Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>, Haiyang Zhang <haiyangz@microsoft.com>, linux-kernel@vger.kernel.org, Leo Li <leoyang.li@nxp.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-sunxi@lists.linux.dev, Zhou Wang <wangzhou1@hisilicon.com>, linux-s390@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Tejun Heo <tj@kernel.org>, Manuel Lauss <manuel.lauss@gmail.com>, linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28-03-24, 11:08, Arnd Bergmann wrote:
> On Thu, Mar 28, 2024, at 06:55, Vinod Koul wrote:
> > On 27-03-24, 16:03, Allen Pais wrote:
> >> The only generic interface to execute asynchronously in the BH context is
> >> tasklet; however, it's marked deprecated and has some design flaws. To
> >> replace tasklets, BH workqueue support was recently added. A BH workqueue
> >> behaves similarly to regular workqueues except that the queued work items
> >> are executed in the BH context.
> >
> > Thanks for conversion, am happy with BH alternative as it helps in
> > dmaengine where we need shortest possible time between tasklet and
> > interrupt handling to maximize dma performance
> 
> I still feel that we want something different for dmaengine,
> at least in the long run. As we have discussed in the past,
> the tasklet context in these drivers is what the callbacks
> from the dma client device is run in, and a lot of these probably
> want something other than tasklet context, e.g. just call
> complete() on a client-provided completion structure.
> 
> Instead of open-coding the use of the system_bh_wq in each
> dmaengine, how about we start with a custom WQ_BH
> specifically for the dmaengine subsystem and wrap them
> inside of another interface.
> 
> Since almost every driver associates the tasklet with the
> dma_chan, we could go one step further and add the
> work_queue structure directly into struct dma_chan,
> with the wrapper operating on the dma_chan rather than
> the work_queue.

I think that is very great idea. having this wrapped in dma_chan would
be very good way as well

Am not sure if Allen is up for it :-)

-- 
~Vinod
