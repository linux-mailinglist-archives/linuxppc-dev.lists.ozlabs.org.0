Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D2488F0C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 22:19:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mFTUbpCj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4fh73lTJz3vxJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 08:19:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mFTUbpCj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4XtZ0brFz3vXy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 03:58:29 +1100 (AEDT)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-476cec93716so2127399137.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 09:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711558704; x=1712163504; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yUltN/NJxMhxZV1CH62BOvzy406AgQtlnwGFiPeOm1M=;
        b=mFTUbpCj4AYj3YIovFMdKJuJEa2JdAMeRlxcoEhG88IvaiDYByDaqLeNCjLTNSaZCT
         oSkYpF9zxyvTyKQDrMckJGZHddoX5z83KA2TWDGAnnVY4nGkUI63ThpU5EKmSIMEzCWX
         nUxNrg0pxmCMVzU1MrXHqvIAMpOB2ZzEHGjT3Ji6RldOr38K87kw2Y0rpsuzBU4Vo+dM
         KvrxtJs1bPPU9vV++EYkfstQDr9bDc7yv9A++pOGBGXj55KEq19n8UvzFDBxnW89meJw
         /S7UeKE8DlPRYX0Hc709ALtqCQU6JmFxrRjSmfVmQ39JdcjrxzNcYZbM4H6ShrMxTJhr
         deTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711558704; x=1712163504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUltN/NJxMhxZV1CH62BOvzy406AgQtlnwGFiPeOm1M=;
        b=Oxjf5RXUZftqTQWpUNdPIKU7c2VmSqZRMbd4sKNfDRC5kHWmAazC3N9vzsiJKTjKyi
         GOqo2xGmmpt7YpIyxAuTpU594RySNk/br3UV8SbtzakO8epk8mu5pBhMKqVDXgat1iog
         4PqzVBC5+k0a81JtSt6X3+hOO585C+OdTrO2cUy9WHBqtK/Wc3p4eD6wNwiMKKC6272U
         axQwtQ1AH+N1PPM1fD79k8boTJqIz2xh24qs1aB/eC9redIIBRgrIyw2Qm67s63vw+eV
         shyS7MtmbNHm5LFLDZvy/ympOoAHsSYZSV1QzPmbpCgt263Ci5t6ALZTlRRJRyJkCbST
         A2Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVOfdo3tYD3WLa3KH1wfNjSSGT2vl+esJlmVXu6doBsqwVXqxikFH+msD7lcAuimY9sSFikZafJqiR42B+IKK43FAZUZ5HgkspbGtSL4A==
X-Gm-Message-State: AOJu0Yyf6iO5YKquSzMNcJgRrVeUhbHYd3ayTnMuZOs33T4mWUWRjDxj
	3XgzMkfWrVVBtPHwdbg/H0RUm3sLqDdy1N+R+kk7t6OEZite6ddwnzfi7bH5Nk3O5OpgJXGQ2Yk
	XkNo07P8yCArbwd4fcQFCOr8TMVM=
X-Google-Smtp-Source: AGHT+IG2+7fcvBBedZik6uQF+4M2q3ObjFc26qAotYqTJVzVn8pG6NuXX7LEd77qXX8Tn8MdeN0ijCK67x3Q8xGLlB4=
X-Received: by 2002:a05:6102:3b83:b0:472:64aa:403f with SMTP id
 z3-20020a0561023b8300b0047264aa403fmr602964vsu.26.1711558703814; Wed, 27 Mar
 2024 09:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-5-apais@linux.microsoft.com> <2024032753-probable-blatancy-80bf@gregkh>
In-Reply-To: <2024032753-probable-blatancy-80bf@gregkh>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 27 Mar 2024 09:58:12 -0700
Message-ID: <CAOMdWSLipPfm3OZTpjZz4uF4M+E_8QAoTeMcKBXawLnkTQx6Jg@mail.gmail.com>
Subject: Re: [PATCH 4/9] USB: Convert from tasklet to BH workqueue
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 28 Mar 2024 08:10:21 +1100
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
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org, HaraldWelte@viatech.com, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, wangzhou1@hisilicon.com, jernej.skrabec@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-mips@vger.ke
 rnel.org, Eugeniy.Paltsev@synopsys.com, patrice.chotard@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com,
  tj@kernel.org, manuel.lauss@gmail.com, linux-media@vger.kernel.org, shawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > The only generic interface to execute asynchronously in the BH context is
> > tasklet; however, it's marked deprecated and has some design flaws. To
> > replace tasklets, BH workqueue support was recently added. A BH workqueue
> > behaves similarly to regular workqueues except that the queued work items
> > are executed in the BH context.
> >
> > This patch converts drivers/infiniband/* from tasklet to BH workqueue.
>
> No it does not, I think your changelog is wrong :(

Whoops, sorry about that. I messed up the commit messages. I will fix it in v2.
>
> >
> > Based on the work done by Tejun Heo <tj@kernel.org>
> > Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> >
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
> >  drivers/usb/atm/usbatm.c            | 55 +++++++++++++++--------------
> >  drivers/usb/atm/usbatm.h            |  3 +-
> >  drivers/usb/core/hcd.c              | 22 ++++++------
> >  drivers/usb/gadget/udc/fsl_qe_udc.c | 21 +++++------
> >  drivers/usb/gadget/udc/fsl_qe_udc.h |  4 +--
> >  drivers/usb/host/ehci-sched.c       |  2 +-
> >  drivers/usb/host/fhci-hcd.c         |  3 +-
> >  drivers/usb/host/fhci-sched.c       | 10 +++---
> >  drivers/usb/host/fhci.h             |  5 +--
> >  drivers/usb/host/xhci-dbgcap.h      |  3 +-
> >  drivers/usb/host/xhci-dbgtty.c      | 15 ++++----
> >  include/linux/usb/cdc_ncm.h         |  2 +-
> >  include/linux/usb/usbnet.h          |  2 +-
> >  13 files changed, 76 insertions(+), 71 deletions(-)
> >
> > diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
> > index 2da6615fbb6f..74849f24e52e 100644
> > --- a/drivers/usb/atm/usbatm.c
> > +++ b/drivers/usb/atm/usbatm.c
> > @@ -17,7 +17,7 @@
> >   *           - Removed the limit on the number of devices
> >   *           - Module now autoloads on device plugin
> >   *           - Merged relevant parts of sarlib
> > - *           - Replaced the kernel thread with a tasklet
> > + *           - Replaced the kernel thread with a work
>
> a "work"?
 will fix the comments.

>
> >   *           - New packet transmission code
> >   *           - Changed proc file contents
> >   *           - Fixed all known SMP races
> > @@ -68,6 +68,7 @@
> >  #include <linux/wait.h>
> >  #include <linux/kthread.h>
> >  #include <linux/ratelimit.h>
> > +#include <linux/workqueue.h>
> >
> >  #ifdef VERBOSE_DEBUG
> >  static int usbatm_print_packet(struct usbatm_data *instance, const unsigned char *data, int len);
> > @@ -249,7 +250,7 @@ static void usbatm_complete(struct urb *urb)
> >       /* vdbg("%s: urb 0x%p, status %d, actual_length %d",
> >            __func__, urb, status, urb->actual_length); */
> >
> > -     /* Can be invoked from task context, protect against interrupts */
> > +     /* Can be invoked from work context, protect against interrupts */
>
> "workqueue"?  This too seems wrong.
>
> Same for other comment changes in this patch.

Thanks for the quick review, I will fix the comments and send out v2.

- Alle

> thanks,
>
> greg k-h
>
