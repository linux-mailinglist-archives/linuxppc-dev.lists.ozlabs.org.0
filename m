Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3918900E6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 14:57:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=arndb.de header.i=@arndb.de header.a=rsa-sha1 header.s=fm1 header.b=bZ/F23JM;
	dkim=permerror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha1 header.s=fm2 header.b=wIyGwxiT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V54px5rzTz3vgc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 00:57:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=bZ/F23JM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=wIyGwxiT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.142; helo=flow7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow7-smtp.messagingengine.com (flow7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4zlt1sDTz3cBG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 21:09:13 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id 5C11820053F;
	Thu, 28 Mar 2024 06:09:10 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 28 Mar 2024 06:09:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711620550; x=1711627750; bh=pYBjGEQadh
	25rkMc0fkoc5Y7p79L1tP3xKDkS0IogRA=; b=bZ/F23JMPyrmIk/Ntj2seAKXb/
	fK61J0u8ls1qOi2xe5oyM0yZSsH19MZp9yi+zXy1BWPve1eXg+la8Sg/UxYaSRbf
	sz3eypDY+Q1OHr+nkbkQQXqADbtGp250VeO64zWBK3NlHeV3OuNA+AZQsGMbPzKc
	tIO1b/JsdoMTi9Sa4qtzIxjRNmOivgTzJ16capo1Du6/6Fjf289SueUzJiDFabNr
	qhusH+/OTCYUQ62Md0W6Kb3XPtKtRHxWZCqsKeVcfwYFkjwwnQZ/KFVsiJpsteij
	UEFhJXpiMc48Yj8JBMnhQua7+EaskwT/bkKa7TU7dUlzuZ/tjgJdklUZue1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711620550; x=1711627750; bh=pYBjGEQadh25rkMc0fkoc5Y7p79L
	1tP3xKDkS0IogRA=; b=wIyGwxiTM97DFQgPX8br04l4NUp1wbd4F4aPRoaUOJ69
	IWjYFE2zpRpr2ZuCwawUtQP0xu1riAaYJcF8USi+pvWpGBrvqxzl6qy9M8HeUTvj
	kVxQ7atxp6oErsgqwVoswrTCwbaiyfyUdp8+oN7eMDHgG5G6bSbHffjZHTbQsPbP
	IflwKJRYQrIc3e2sOalAP3O2nnPS7RFCYwh52d72tHyVVP1qCEG8loNKTO3Li5SS
	3ttm0HswwW743xnKX1Ty4B5+hDe8/KcLasvI/O1mopYD2mG+ye8Mw2HvxrKxhJv0
	BtW1IYz8le5pBrV97eBtuTiYg1cJRixjcewJiJzDtg==
X-ME-Sender: <xms:xEEFZjUDB6vUXVuE4su_mfFztVEXuLQBqnkQAhHLwG1jR8Gk4Rhccg>
    <xme:xEEFZrkXsFEZpvOySs979kbBxybPVD4HPzNHJDAuQc2A74iPvQQqs8EEN8sgZ1AOY
    -B735Q1j88_yj5yeME>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduledgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:xEEFZvanNkHDHk3D4daIt3HN3RRy4VJsLZBS_5xTq6OZ_s46lBHeqg>
    <xmx:xEEFZuXz105eJN6iaqF1LnVwLMEtc10LEM014QjmGYfrwvQMnV9zQQ>
    <xmx:xEEFZtlackC-bm2ZG6jhrgNjSy9Qg70Et6FoLLjgTPEKil-mStUOQg>
    <xmx:xEEFZrdAQp1QGnibQ6HQuAZmU_FkzEzvep2EzwBzRXg0_5Nan7e3Mg>
    <xmx:xkEFZvTJcmNZMFGcjkzffyZ1DB1SyuiY0BkmrH3Smejf5bob7fZc1n9GOA0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E6410B6008D; Thu, 28 Mar 2024 06:09:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
MIME-Version: 1.0
Message-Id: <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com>
In-Reply-To: <ZgUGXTKPVhrA1tam@matsya>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com> <ZgUGXTKPVhrA1tam@matsya>
Date: Thu, 28 Mar 2024 11:08:47 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vinod Koul" <vkoul@kernel.org>, "Allen Pais" <apais@linux.microsoft.com>
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 29 Mar 2024 00:55:57 +1100
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
 brar@gmail.com>, Dexuan Cui <decui@microsoft.com>, HaraldWelte@viatech.com, Jernej Skrabec <jernej.skrabec@gmail.com>, "jh80.chung" <jh80.chung@samsung.com>, zw@zh-kernel.org, Chen-Yu Tsai <wens@csie.org>, Alan Stern <stern@rowland.harvard.edu>, linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>, pierre@ossman.eu, linux-usb@vger.kernel.org, Eugeniy.Paltsev@synopsys.com, Patrice Chotard <patrice.chotard@foss.st.com>, asahi@lists.linux.dev, brucechang@via.com.tw, Kees Cook <keescook@chromium.org>, oakad@yahoo.com, Sven Peter <sven@svenpeter.dev>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@gmail.com>, =?UTF-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Matthias 
 Brugger <matthias.bgg@gmail.com>, openipmi-developer@lists.sourceforge.net, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Scott Branden <sbranden@broadcom.com>, logang@deltatee.com, Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>, Haiyang Zhang <haiyangz@microsoft.com>, linux-kernel@vger.kernel.org, Leo Li <leoyang.li@nxp.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-sunxi@lists.linux.dev, Zhou Wang <wangzhou1@hisilicon.com>, linux-s390@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Tejun Heo <tj@kernel.org>, Manuel Lauss <manuel.lauss@gmail.com>, linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 28, 2024, at 06:55, Vinod Koul wrote:
> On 27-03-24, 16:03, Allen Pais wrote:
>> The only generic interface to execute asynchronously in the BH context is
>> tasklet; however, it's marked deprecated and has some design flaws. To
>> replace tasklets, BH workqueue support was recently added. A BH workqueue
>> behaves similarly to regular workqueues except that the queued work items
>> are executed in the BH context.
>
> Thanks for conversion, am happy with BH alternative as it helps in
> dmaengine where we need shortest possible time between tasklet and
> interrupt handling to maximize dma performance

I still feel that we want something different for dmaengine,
at least in the long run. As we have discussed in the past,
the tasklet context in these drivers is what the callbacks
from the dma client device is run in, and a lot of these probably
want something other than tasklet context, e.g. just call
complete() on a client-provided completion structure.

Instead of open-coding the use of the system_bh_wq in each
dmaengine, how about we start with a custom WQ_BH
specifically for the dmaengine subsystem and wrap them
inside of another interface.

Since almost every driver associates the tasklet with the
dma_chan, we could go one step further and add the
work_queue structure directly into struct dma_chan,
with the wrapper operating on the dma_chan rather than
the work_queue.

      Arnd
