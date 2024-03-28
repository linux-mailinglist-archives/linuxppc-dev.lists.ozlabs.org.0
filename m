Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB0A890CD8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 23:02:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NeBaGf8E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5Hb54dZqz3vyk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 09:02:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NeBaGf8E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::932; helo=mail-ua1-x932.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5DQB4Rc1z3vYv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 06:39:44 +1100 (AEDT)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7db36dbd474so272670241.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711654782; x=1712259582; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=622VK9NVBI6NV/BHlHroiE+gl2GqatwpJmnEQrqKhSw=;
        b=NeBaGf8Erf18CcbU8GNz50siJsFDsyAWSZJjlCXiBlgoFhPzjWwQNxboAppWFO6Tm1
         Nviz9ykqWvCoUNRpvO/z5xjQQjYMTyJ1KgBfbGwLCwCeaMJ7VTkS7Z+xx/rN1k9j5lzc
         UJVoGl2Wt3TRBlrHBRhGl95DHTsBqWJ/nR3MsST8XSku5x854QC2WPHB5PAHwxJrk5nk
         c5ZdvVB4++En1RDjaWVD+/QDVf1hRNJ+e5APmFxhsH4JLght6xuxTf7ug52Qxv1txgMC
         ikXSn/tKzvbG8+9B8MA9EDi4GXgxD/DrpLqzSbqR9WzFrKVecbnAlYblHzFceQxtckP6
         fecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711654782; x=1712259582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=622VK9NVBI6NV/BHlHroiE+gl2GqatwpJmnEQrqKhSw=;
        b=st5f6DHVBPsVMxu+T0qXWtlWqokkjTHuUyocZMslUif2zQUJCQGJI3meabo0Cne87D
         7n1biu8KU+Xw56IW+UJaPsFWLH72i6u0/CTffduk3GWsxsuft1lfMKK0Dkk0ibl/KazV
         R+gJQiPhSnmblq811pglA4/pTgmjW18tQFgIYYVkrlEenZzZ5rl6A6gRGN7jZB+ZCx5G
         NCpwgQMGRh5jGmlx6Pv0LZowUX131Za40tBQn8NtEXMyMoQCc+7AcUSXuyPtoWJZtRO7
         LpgBW+gNWEDUrzoIBiu20MfOfWy1GzdxsMYSaWlyKqasubF45Ago+BnEMCT5QP8rFRUC
         af7w==
X-Forwarded-Encrypted: i=1; AJvYcCXPAN5O4OlqkGUEEoqpx6BqubIGM/s4/VR4Ock2U5M4HhS1Wr+5U0jXXyJZmsdZ0dTxaYZX9gKuKmmIW64gynBGsyOs5zfU9MkdHy6t4g==
X-Gm-Message-State: AOJu0YzIMoQyOHHTNWz/DOY3Au7kSH4Ha21z3WgMgcC51BwybSe/rOUB
	3uPfm/TIsgXiZHFB4WWbtWsb07H0zns1iIpRpIzS0mGjFrvER8DHJyz/HpFj9fx47YmzuBQPOEm
	3SaYNtgo9q+rIlX6BpO7UnH4gJtc=
X-Google-Smtp-Source: AGHT+IEY59Ji/OARBUAoYgwqWp5p4Pop3R94bZWuKlJaRj9K8xYwJ5pD7jLBPmXxcg5SXNElqhUUtT98mEK7bvSO2Kc=
X-Received: by 2002:a1f:c801:0:b0:4d4:1cca:1a72 with SMTP id
 y1-20020a1fc801000000b004d41cca1a72mr369742vkf.6.1711654781874; Thu, 28 Mar
 2024 12:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com> <ZgUGXTKPVhrA1tam@matsya>
 <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com> <ZgW3j1qkLA-QU4iM@matsya>
In-Reply-To: <ZgW3j1qkLA-QU4iM@matsya>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 12:39:30 -0700
Message-ID: <CAOMdWSKY9D75FM3bswUfXn2o7bGtrei3G5kLt6JdcdOPDXaG8g@mail.gmail.com>
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
To: Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: imx@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>, Oliver Neukum <oneukum@suse.com>, duncan.sands@free.fr, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>, aubin.constans@microchip.com, Linus Walleij <linus.walleij@linaro.org>, Frank Li <Frank.Li@nxp.com>, linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org, Netdev <netdev@vger.kernel.org>, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-riscv@lists.infradead.org, "K. Y. Srinivasan" <kys@microsoft.com>, Robert Jarzmik <robert.jarzmik@free.fr>, haijie1@huawei.com, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, oakad@yahoo.com, Florian Fainelli <florian.fainelli@broadcom.com>, linux-rdma@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, Jassi
  Brar <jassisinghbrar@gmail.com>, Dexuan Cui <decui@microsoft.com>, HaraldWelte@viatech.com, Jernej Skrabec <jernej.skrabec@gmail.com>, "jh80.chung" <jh80.chung@samsung.com>, zw@zh-kernel.org, Chen-Yu Tsai <wens@csie.org>, Alan Stern <stern@rowland.harvard.edu>, linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>, pierre@ossman.eu, linux-usb@vger.kernel.org, Eugeniy.Paltsev@synopsys.com, Patrice Chotard <patrice.chotard@foss.st.com>, asahi@lists.linux.dev, brucechang@via.com.tw, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Baolin Wang <baolin.wang
 @linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>, openipmi-developer@lists.sourceforge.net, Mauro Carvalho Chehab <mchehab@kernel.org>, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Scott Branden <sbranden@broadcom.com>, logang@deltatee.com, Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>, Haiyang Zhang <haiyangz@microsoft.com>, linux-kernel@vger.kernel.org, Leo Li <leoyang.li@nxp.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-sunxi@lists.linux.dev, Zhou Wang <wangzhou1@hisilicon.com>, linux-s390@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Tejun Heo <tj@kernel.org>, Manuel Lauss <manuel.lauss@gmail.com>, linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > >> The only generic interface to execute asynchronously in the BH context is
> > >> tasklet; however, it's marked deprecated and has some design flaws. To
> > >> replace tasklets, BH workqueue support was recently added. A BH workqueue
> > >> behaves similarly to regular workqueues except that the queued work items
> > >> are executed in the BH context.
> > >
> > > Thanks for conversion, am happy with BH alternative as it helps in
> > > dmaengine where we need shortest possible time between tasklet and
> > > interrupt handling to maximize dma performance
> >
> > I still feel that we want something different for dmaengine,
> > at least in the long run. As we have discussed in the past,
> > the tasklet context in these drivers is what the callbacks
> > from the dma client device is run in, and a lot of these probably
> > want something other than tasklet context, e.g. just call
> > complete() on a client-provided completion structure.
> >
> > Instead of open-coding the use of the system_bh_wq in each
> > dmaengine, how about we start with a custom WQ_BH
> > specifically for the dmaengine subsystem and wrap them
> > inside of another interface.
> >
> > Since almost every driver associates the tasklet with the
> > dma_chan, we could go one step further and add the
> > work_queue structure directly into struct dma_chan,
> > with the wrapper operating on the dma_chan rather than
> > the work_queue.
>
> I think that is very great idea. having this wrapped in dma_chan would
> be very good way as well
>
> Am not sure if Allen is up for it :-)

 Thanks Arnd, I know we did speak about this at LPC. I did start
working on using completion. I dropped it as I thought it would
be easier to move to workqueues.

Vinod, I would like to give this a shot and put out a RFC, I would
really appreciate review and feedback.

Thanks,
Allen

>
> --
> ~Vinod
>
