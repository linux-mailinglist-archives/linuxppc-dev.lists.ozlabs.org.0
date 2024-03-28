Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B9890CEC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 23:06:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FpkFAP8N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5HgH1n2bz3vqL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 09:06:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FpkFAP8N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5Dw14TyDz3vYj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 07:02:09 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-78a5f7269e3so219220385a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 13:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711656126; x=1712260926; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lQZIemFmXjC6xyiLulQ43Ea/EhoY/GbG4RXFhJQU0/8=;
        b=FpkFAP8NJxPmLVRD9SRxnZJQjPHv7RocGdziJKEV4vfFGUfkUxhx6Z/5NiX7RMK71C
         iZDJWs9yuSXnCAj2KKxwGcRD2HGbtMoiThLPbhNfTQ2VN2jBn4ngNnecPTidEc05Qt9r
         jbdl7H+42ITGvxRS+aEc9hxJp9jEceQ1jwOBh/D64Dtq7pbSWz1cQh/Qa0pC1DZWINUV
         an4BOmSUluP1DuhCnQPoAaOjITlQwdyB8QneIkL/vWqLQ/L1gWf5BYS0THoo3xT0vyhC
         LWmmcEML4FSmlY6ntHzhTLQ0fkIlwW1NSJbS2r5dDqvMNIwLE3rUt57PTF4x8by0/OzE
         sJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711656126; x=1712260926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQZIemFmXjC6xyiLulQ43Ea/EhoY/GbG4RXFhJQU0/8=;
        b=ZbdSH7cjvuSqQ3CdDAglLSJxvrUWZwZ94w+UIvQLbqS+pYYGX6UhXHD3JQjOpGnOXm
         32OJ+yBM/CGPKMxm9SoZ2qOKukPNHrsOjdeizOkJlTXrMv4Ai0MAHavUlRLCPT5bbWm7
         1iQlCxHusIP9fuzRmO/7uvw/cE2pgReM74KPdg/kPMWFXkDy/voJl4roZohUUt23DO0a
         efra0C+tgsxVUpwLUmMuVoar894KfFyZ2Sb98OEn/6XKVON0CTzIfJ0254PGf1pWJ/oZ
         bUSEZS1VnPTONZlw6C5qhSqxjJKHiLgZbDb8+nRVNQt8Hwl//PxQSvhjrU7lSRNjS7AD
         2B2g==
X-Forwarded-Encrypted: i=1; AJvYcCUAtr7+2XPRdPCiUz9wAWC9cVGHzsZfUnGRuChMIUNdlIjWkzNz5DTsanuGmEamhUMs2mBgvnCOOPKcc5YG81tw0ZJob8eiGLGsW4qKzQ==
X-Gm-Message-State: AOJu0Yz1AXNw4lMxvkyIANh23lgxnsVwV3THKsBsYUaBc4G7M74ifA0j
	dJ5rSsTS9ZvJLVu5vPiTonj2SfQ6q6oCsMoNjdNWonry7TwFK0Y1AZ6l3sOlWThhgLEtRaRveFn
	tWPbZuYbLf2MqJipmCGxUmcO0vHE=
X-Google-Smtp-Source: AGHT+IFQNOvoxYEranyGbOCvmAR4etDDhau+OcrTFex7JkKGx6yINzP/h18hs1c4qiY1arvh6SuEYWtwfkxWkgaJ4wM=
X-Received: by 2002:a05:620a:c4e:b0:78a:62a6:7e2f with SMTP id
 u14-20020a05620a0c4e00b0078a62a67e2fmr5081544qki.5.1711656126274; Thu, 28 Mar
 2024 13:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com> <ZgUGXTKPVhrA1tam@matsya>
 <2e9257af-c123-406b-a189-eaebeecc1d71@app.fastmail.com> <ZgW3j1qkLA-QU4iM@matsya>
 <CAOMdWSKY9D75FM3bswUfXn2o7bGtrei3G5kLt6JdcdOPDXaG8g@mail.gmail.com> <678ba20b-9f1d-41cb-8a25-e716b61ffafe@app.fastmail.com>
In-Reply-To: <678ba20b-9f1d-41cb-8a25-e716b61ffafe@app.fastmail.com>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 13:01:55 -0700
Message-ID: <CAOMdWSKC4B8zn6N+=5DssB_BiR6JkHBEpJr0ohKb149eJvCKMQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: imx@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>, Oliver Neukum <oneukum@suse.com>, Duncan Sands <duncan.sands@free.fr>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>, aubin.constans@microchip.com, Linus Walleij <linus.walleij@linaro.org>, Frank Li <Frank.Li@nxp.com>, linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org, HaraldWelte@viatech.com, Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org, Netdev <netdev@vger.kernel.org>, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-riscv@lists.infradead.org, "K. Y. Srinivasan" <kys@microsoft.com>, Robert Jarzmik <robert.jarzmik@free.fr>, haijie1@huawei.com, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, linux-rdma@vger.kernel.org, Viresh Kumar <vire
 shk@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Dexuan Cui <decui@microsoft.com>, Zhou Wang <wangzhou1@hisilicon.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, "jh80.chung" <jh80.chung@samsung.com>, zw@zh-kernel.org, Chen-Yu Tsai <wens@csie.org>, Alan Stern <stern@rowland.harvard.edu>, linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>, pierre@ossman.eu, linux-mips@vger.kernel.org, Eugeniy.Paltsev@synopsys.com, Patrice Chotard <patrice.chotard@foss.st.com>, asahi@lists.linux.dev, brucechang@via.com.tw, Kees Cook <keescook@chromium.org>, oakad@yahoo.com, Sven Peter <sven@svenpeter.dev>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Bao
 lin Wang <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>, openipmi-developer@lists.sourceforge.net, Mauro Carvalho Chehab <mchehab@kernel.org>, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Scott Branden <sbranden@broadcom.com>, logang@deltatee.com, Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>, Haiyang Zhang <haiyangz@microsoft.com>, linux-kernel@vger.kernel.org, Leo Li <leoyang.li@nxp.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-sunxi@lists.linux.dev, Vinod Koul <vkoul@kernel.org>, linux-s390@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Tejun Heo <tj@kernel.org>, Manuel Lauss <manuel.lauss@gmail.com>, linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> >> > Since almost every driver associates the tasklet with the
> >> > dma_chan, we could go one step further and add the
> >> > work_queue structure directly into struct dma_chan,
> >> > with the wrapper operating on the dma_chan rather than
> >> > the work_queue.
> >>
> >> I think that is very great idea. having this wrapped in dma_chan would
> >> be very good way as well
> >>
> >> Am not sure if Allen is up for it :-)
> >
> >  Thanks Arnd, I know we did speak about this at LPC. I did start
> > working on using completion. I dropped it as I thought it would
> > be easier to move to workqueues.
>
> It's definitely easier to do the workqueue conversion as a first
> step, and I agree adding support for the completion right away is
> probably too much. Moving the work_struct into the dma_chan
> is probably not too hard though, if you leave your current
> approach for the cases where the tasklet is part of the
> dma_dev rather than the dma_chan.
>

 Alright, I will work on moving work_struck into the dma_chan and
leave the dma_dev as is (using bh workqueues) and post a RFC.
Once reviewed, I could move to the next step.

Thank you.

- Allen
