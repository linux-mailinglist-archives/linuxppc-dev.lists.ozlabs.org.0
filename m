Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 852BD890CCF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 23:00:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kg69fqHz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5HXX2CDyz3vlV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 09:00:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kg69fqHz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e34; helo=mail-vs1-xe34.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5B4Y6SCmz3ccV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 04:54:21 +1100 (AEDT)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4783dca2b17so486940137.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 10:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711648458; x=1712253258; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nG7pFQ9K9R/mz80FNkdLLBY0bbfjalJJC6HLc51WLAE=;
        b=Kg69fqHzPptYivNFU0DO89ekLDBB9QuUv4/4N0SVv43w/XJ7jx/JEFvXNFKlEuqB0T
         PV2KCMGFggwflrxZI6MGFLfG1mnq4zzUT0rdDSj4rU1AVd+H0s74U9/OZV4AW1mI0sX3
         JbS7pNoHA/vrWD0+cwCBYJCdO+lZY60mu0CrCZUPAzMdIZln3HDDr2W2dLAoB8yyo0jg
         3zfwKQz/6/RXAYC6ZqW0SUrZzrnH+WUYQILsKItmvGMm+JA3HE/fHMNrVzSUJiPeC9Ho
         fKFkEGokzY412jBFGftGDbmAQa0keTa5rbK6KTj8L2AWS5j/ws+LZe88UcIil8MWHNt2
         dHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648458; x=1712253258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nG7pFQ9K9R/mz80FNkdLLBY0bbfjalJJC6HLc51WLAE=;
        b=Y7mlDJ1hs+lTp3xKOnxTcV01fyArCElmPNQ4stmR0buVHxm6ZPp/AkWuWaddnWMQzk
         KxcNNjufev1huJeW+0xHDmdf/8mgWK3ZcKiHUQ+W3SzO98zhW9ojX7GOhbofdJp/Xe9u
         FEIWISrolY/N/ym+lWzYYv3lBWgW1D6N8w1sNuQjDD0U1XjY+V4uJkQg+mFapaDYhf7p
         qTAGcedbbUEQsT/Sl28NpRiCZd2BBgAMH21eJRutzR8AucVa77LWYHptT0okyoEV41a/
         EmeNt2AjbSIVsDOmKCAZHp2OFlvWcp4U515tzOBHVbLxTKan4vjdtPNT2bnMkI/NKDZR
         UKBg==
X-Forwarded-Encrypted: i=1; AJvYcCVJPrvhndPjw5pTXvuLsGIrNb8SlQMTjAusgztEuLo+AQUCnBOgwDkD9viUKqh5akdYpJjNaOpZ38jStbo7f8aHJLeHE+D73/TvujiBJg==
X-Gm-Message-State: AOJu0YwbvvoANaNe0b0PcC3neJCdLUygPp65vxg1oHCvxawsqdJRtTgU
	rs/aGTc+eIq5AePYFS9uE3u5THUlisSpGjB39nxZ9YU15kvwJyqpCYCkelmq/zkZsAY8ufSMhOo
	lEA1WJjc5JMksMqsIZN48/f9xTKE=
X-Google-Smtp-Source: AGHT+IGBQCwISe8ItG/2YCXarhKnEHlwL8nEFQuoDJ++KAY35MV4NPvZiqYz3quZfRGkQvsUcmc8+OZbNMhL2JCbvQY=
X-Received: by 2002:a67:b64d:0:b0:476:fc98:c73e with SMTP id
 e13-20020a67b64d000000b00476fc98c73emr4018043vsm.34.1711648458714; Thu, 28
 Mar 2024 10:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-5-apais@linux.microsoft.com> <42c445b4-a156-4c43-bf98-bd2a9ac7a4fa@rowland.harvard.edu>
In-Reply-To: <42c445b4-a156-4c43-bf98-bd2a9ac7a4fa@rowland.harvard.edu>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 10:54:07 -0700
Message-ID: <CAOMdWS+4T7rw577q9iW_oin8bbVF4m6Mpx-L2riqno5QX_L=WQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] USB: Convert from tasklet to BH workqueue
To: Alan Stern <stern@rowland.harvard.edu>
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
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org, HaraldWelte@viatech.com, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, wangzhou1@hisilicon.com, jernej.skrabec@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-mips@vger.kernel.org, Eugeniy.Paltsev@s
 ynopsys.com, patrice.chotard@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com, tj@kernel.org, manuel.laus
 s@gmail.com, linux-media@vger.kernel.org, shawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> >
> > This patch converts drivers/infiniband/* from tasklet to BH workqueue.
> >
> > Based on the work done by Tejun Heo <tj@kernel.org>
> > Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> >
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
>
> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > index c0e005670d67..88d8e1c366cd 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
>
> > @@ -1662,10 +1663,9 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
> >       usb_put_urb(urb);
> >  }
> >
> > -static void usb_giveback_urb_bh(struct work_struct *work)
> > +static void usb_giveback_urb_bh(struct work_struct *t)
> >  {
> > -     struct giveback_urb_bh *bh =
> > -             container_of(work, struct giveback_urb_bh, bh);
> > +     struct giveback_urb_bh *bh = from_work(bh, t, bh);
> >       struct list_head local_list;
> >
> >       spin_lock_irq(&bh->lock);
>
> Is there any reason for this apparently pointless change of a local
> variable's name?

 No, it was done just to keep things consistent across the kernel.
I can revert it back to *work if you'd prefer.

Thanks.

>
> Alan Stern
>


-- 
       - Allen
