Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E2F8928B7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Mar 2024 02:18:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uEituwgn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5ztW09D3z3vhd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Mar 2024 12:18:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uEituwgn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5mMJ0Vp6z3cGK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Mar 2024 03:39:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D74B61977;
	Fri, 29 Mar 2024 16:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717E8C433C7;
	Fri, 29 Mar 2024 16:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711730343;
	bh=mu709RK6RdUvGezRsei4fEVVFDMPGmRnjx++n5sjyL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uEituwgn1xxAMuURhdwt3/iaLtwEGCu1+Mclwo9+Ty7wLbaMiWmyQU0rOPlf9vJzM
	 o13NJKluh2NnMuLRvgLiGrQVrebzv3a2gzICu48+3LXXhQ45oB4NluNbhd7SB44a70
	 M0Wt2X6l0SJT7LJi3C8GA4V9BEhry7YR3ma4wI/3OylDT4TAEwBE8hLV/q3auS8o5H
	 9muF3kTL6rkQ20Iba0mAQK6pIs92yEx6N2CKY/CrPm5aLVKXPn+H3gbBFziiX6OMqC
	 zpP4PltZewjblpXJOZBFZ8cpmv8jSqFoiAAks6EZfkeP36KAWbWprPmsY2/9TNUion
	 NxXBlJGeFB7CQ==
Date: Fri, 29 Mar 2024 22:08:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Allen <allen.lkml@gmail.com>
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
Message-ID: <ZgbuotY4IX4iHm9U@matsya>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com>
 <ZgUGXTKPVhrA1tam@matsya>
 <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com>
 <ZgW3j1qkLA-QU4iM@matsya>
 <CAOMdWSKY9D75FM3bswUfXn2o7bGtrei3G5kLt6JdcdOPDXaG8g@mail.gmail.com>
 <678ba20b-9f1d-41cb-8a25-e716b61ffafe@app.fastmail.com>
 <CAOMdWSKC4B8zn6N+=5DssB_BiR6JkHBEpJr0ohKb149eJvCKMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMdWSKC4B8zn6N+=5DssB_BiR6JkHBEpJr0ohKb149eJvCKMQ@mail.gmail.com>
X-Mailman-Approved-At: Sat, 30 Mar 2024 12:17:51 +1100
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
Cc: imx@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>, Oliver Neukum <oneukum@suse.com>, Duncan Sands <duncan.sands@free.fr>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>, aubin.constans@microchip.com, Linus Walleij <linus.walleij@linaro.org>, Frank Li <Frank.Li@nxp.com>, linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org, Netdev <netdev@vger.kernel.org>, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-riscv@lists.infradead.org, "K. Y. Srinivasan" <kys@microsoft.com>, Robert Jarzmik <robert.jarzmik@free.fr>, haijie1@huawei.com, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, oakad@yahoo.com, Florian Fainelli <florian.fainelli@broadcom.com>, linux-rdma@vger.kernel.org, Viresh Kumar <vireshk@ker
 nel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Dexuan Cui <decui@microsoft.com>, HaraldWelte@viatech.com, Jernej Skrabec <jernej.skrabec@gmail.com>, "jh80.chung" <jh80.chung@samsung.com>, zw@zh-kernel.org, Chen-Yu Tsai <wens@csie.org>, Alan Stern <stern@rowland.harvard.edu>, linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>, pierre@ossman.eu, linux-usb@vger.kernel.org, Eugeniy.Paltsev@synopsys.com, Patrice Chotard <patrice.chotard@foss.st.com>, asahi@lists.linux.dev, brucechang@via.com.tw, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@gmail.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Baolin Wa
 ng <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>, openipmi-developer@lists.sourceforge.net, Mauro Carvalho Chehab <mchehab@kernel.org>, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Scott Branden <sbranden@broadcom.com>, logang@deltatee.com, Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>, Haiyang Zhang <haiyangz@microsoft.com>, linux-kernel@vger.kernel.org, Leo Li <leoyang.li@nxp.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-sunxi@lists.linux.dev, Zhou Wang <wangzhou1@hisilicon.com>, linux-s390@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Tejun Heo <tj@kernel.org>, Manuel Lauss <manuel.lauss@gmail.com>, linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28-03-24, 13:01, Allen wrote:
> > >> > Since almost every driver associates the tasklet with the
> > >> > dma_chan, we could go one step further and add the
> > >> > work_queue structure directly into struct dma_chan,
> > >> > with the wrapper operating on the dma_chan rather than
> > >> > the work_queue.
> > >>
> > >> I think that is very great idea. having this wrapped in dma_chan would
> > >> be very good way as well
> > >>
> > >> Am not sure if Allen is up for it :-)
> > >
> > >  Thanks Arnd, I know we did speak about this at LPC. I did start
> > > working on using completion. I dropped it as I thought it would
> > > be easier to move to workqueues.
> >
> > It's definitely easier to do the workqueue conversion as a first
> > step, and I agree adding support for the completion right away is
> > probably too much. Moving the work_struct into the dma_chan
> > is probably not too hard though, if you leave your current
> > approach for the cases where the tasklet is part of the
> > dma_dev rather than the dma_chan.
> >
> 
>  Alright, I will work on moving work_struck into the dma_chan and
> leave the dma_dev as is (using bh workqueues) and post a RFC.
> Once reviewed, I could move to the next step.

That might be better from a performance pov but the current design is a
global tasklet and not a per chan one... We would need to carefully
review and test this for sure

-- 
~Vinod
