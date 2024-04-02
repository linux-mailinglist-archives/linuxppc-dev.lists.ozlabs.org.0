Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73376895D6E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 22:17:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=k85ElzoY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8K1Z1QZsz3dWW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 07:17:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=k85ElzoY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V83gt6KhLz2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 21:16:26 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-dcc4de7d901so3942691276.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Apr 2024 03:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712052982; x=1712657782; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uzac7wtIrnnrBvtOLPs8xaD+ikoHcCxqEerEJoMcBFs=;
        b=k85ElzoYFSnsiUkcJ86eqy4xPfVgkajsTJZn6BUCyJNW8rmZQGUp1X1cRyhzEzX/8j
         i+f3Lc2wJUyjHMO6/pVmdCFHyWsozyGD9JrL0KrQ8Xq64pm3boQYYDxz9eLr4QFZiVKa
         nI1bE5EK+R7f4zDxHW6ojnyPs3LAH7c7ZU8e+I1Isctd4vEkWu/H/XdtEkSps49KyVA1
         +YXrtHm1vtTbP3QOcTDXF1Ku2gPEjCWJTqgHF+wV6YDvI5WwYj4KZo/RVkulkcV3ujbt
         Vfc1eXSSB1K3sjt1YCQDRjLOL9YiinveEQyVQ/lLzfH8yaBzVS/pFxDzxXv/MN9EK/O3
         aUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712052982; x=1712657782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzac7wtIrnnrBvtOLPs8xaD+ikoHcCxqEerEJoMcBFs=;
        b=PvLfEbv08O/rM5cgmj73PBqfNE5kSFiA+EI1c6oyXrs56eVVtNJXsYsbFy2Epj8DJ3
         s9sULnC6ReB1cOlMIJTLoBIJJgVAhTGxRCup8cpDHJ8blrWE/vLpr5xwaJTj0KL/Tjh3
         Fe0tkgZ7sdUuBW/Zzsq7Fv8r78FRrTVFNQBGAHN8lPFIYH12T6cBfFmYZuBdmexG8/ae
         3ezWdId8GRjRJ4kWia8pMlmt5xy9qvaJjguEz8xtfcafYaT0Jg+4JClc5g5iGK1JVRMa
         gAcOIuemcQfsKDdoIUVBWNdiQYqAVBCy8J4+kvhv2SVW/UsjwcpGeRcVnWiYNEXIK9d5
         xKGA==
X-Forwarded-Encrypted: i=1; AJvYcCU/VfVe2YUAAhQMjlM89ZGVHHcmkUKgVeXSef0+EXdYM+lZIs8L5w08Z4RPYHec7x1ClIRNicWebs1K5X5LspaBrCDb+X5ovd636/9gng==
X-Gm-Message-State: AOJu0YxcXPgg4TB+gkOrVg174YSFcPbcnILE1bqdIGyP1hHUiFsKxk1Z
	OLCr/mWIuwnR6fgTc/us7+mPr7DtTKZFEdMKqacrlzzFeMMzXz8IHIY7uk8Trsf1ArNgbFg4QdQ
	34Wv1L9cOV4MLDRxVbqrnrYKWU2zZTr4K5SDIwA==
X-Google-Smtp-Source: AGHT+IHzjYx5u+Am4EzQhN6aMsFTdxF/7ehGqP9AXe12JTbN0HclFOy9oE6Q1Tva+ZRKMaaQSSepEoCeBcfLH2AuW+A=
X-Received: by 2002:a25:b191:0:b0:dcd:b034:b504 with SMTP id
 h17-20020a25b191000000b00dcdb034b504mr9487652ybj.27.1712052982018; Tue, 02
 Apr 2024 03:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com> <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>
 <ZgWZDtNU4tCwqyeu@slm.duckdns.org>
In-Reply-To: <ZgWZDtNU4tCwqyeu@slm.duckdns.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Apr 2024 12:15:45 +0200
Message-ID: <CAPDyKFp5KET0HR+8MwO4cf0O6W2kyFqHoKcVf5jbgBuLuQUcFA@mail.gmail.com>
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
To: Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 03 Apr 2024 07:17:02 +1100
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
Cc: imx@lists.linux.dev, linux-hyperv@vger.kernel.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-usb@vger.kernel.org, HaraldWelte@viatech.com, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, wangzhou1@hisilicon.com, jernej.skrabec@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-mips@vger.kernel.org, Eugeniy.Paltse
 v@synopsys.com, patrice.chotard@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com, dmaengine@vger.kernel.org, manuel.lauss@gmail.com,
  linux-media@vger.kernel.org, shawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 28 Mar 2024 at 17:21, Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Thu, Mar 28, 2024 at 01:53:25PM +0100, Ulf Hansson wrote:
> > At this point we have suggested to drivers to switch to use threaded
> > irq handlers (and regular work queues if needed too). That said,
> > what's the benefit of using the BH work queue?
>
> BH workqueues should behave about the same as tasklets which have more
> limited interface and is subtly broken in an expensive-to-fix way (around
> freeing in-flight work item), so the plan is to replace tasklets with BH
> workqueues and remove tasklets from the kernel.

Seems like a good approach!

>
> The [dis]advantages of BH workqueues over threaded IRQs or regular threaded
> workqueues are the same as when you compare them to tasklets. No thread
> switching overhead, so latencies will be a bit tighter. Wheteher that
> actually matters really depends on the use case. Here, the biggest advantage
> is that it's mostly interchangeable with tasklets and can thus be swapped
> easily.

Right, thanks for clarifying!

However, the main question is then - if/when it makes sense to use the
BH workqueue for an mmc host driver. Unless there are some HW
limitations, a threaded irq handler should be sufficient, I think.

That said, moving to threaded irq handlers is a different topic and
doesn't prevent us from moving to BH workqueues as it seems like a
step in the right direction.

Kind regards
Uffe
