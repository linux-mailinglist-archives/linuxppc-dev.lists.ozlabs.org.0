Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCF6890CCB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 22:59:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fV3DhTCn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5HVx2yGqz3vlP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 08:59:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fV3DhTCn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92e; helo=mail-ua1-x92e.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V59zd2nRMz3cZQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 04:50:05 +1100 (AEDT)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7e04e70c372so307506241.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 10:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711648202; x=1712253002; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hWHCqghfJDvViQtrnjDyRBjptIr10JmWbLdcHeOE900=;
        b=fV3DhTCn7fX44tPjfv4aCH+R8lhIqI7rQ3C9CkPw+EqnQXcbMGAyIbFJXbGirjW6wF
         4EhqsQuw2MNz1pfqeVEIvG1sf2vJ9eT2a+Mml/eMU/kgahNByoalsHJHt2Bus+nu3LIx
         IKmU7KGO1Hlnx85gz3EFME930RIBVDrhGvHHxNiTLcWpdh+IzLTuZb4eks3ITIVyYoD5
         2GLElVTxilhmE9YyAZY1TFf80JdZ3o2UUM8KuZBNMTTaBTzIJcbK22FCOP6/ElcEFIno
         du0UmiXOClhpr32G35ZR3znXELXEScTkrd+1wRRQIti/++jsXAInxTIsYj56pceVvvK9
         WAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648202; x=1712253002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWHCqghfJDvViQtrnjDyRBjptIr10JmWbLdcHeOE900=;
        b=aUezjGBOnFWZOgZlpVWim5rC2bs2kVKHIg7P1Kg56oMhtcEradnvPVLE/5nkEqxpWr
         cTEwq+PQZUDrRAk9BDzoiEVWF+b0z2QmQSDncsaAlO+tfedco4DkZssNFjc1jL/87wai
         SLPQw0HI58aPnweArqq21vQtWVnXk/Vqsu+UwShkiBnehEKvLaeig4RpVARgrgBb/iqi
         5nEXho574U38sLBjUYron8JNNzw8B7w1w4qnVd2Y1qfmbRMWn6zaX1wxlpj2Peajvkjl
         fXIY7adwKciefYcnhf3flFe4sbWF/GvpQzJBEtkYDLhv5HlnoQL/yZwEYbFmYIVAMchj
         8i/A==
X-Forwarded-Encrypted: i=1; AJvYcCXU5YQxW9eqlit9VKw9+nao47e3iZuOm0W6fzCjiEoEyRv/Meh8pVq3OlFPjuqgF3aPngWCvdPBVRCZ082wntBMB208j0haKU0r2QMg9w==
X-Gm-Message-State: AOJu0YzmeDkWiFY8m74Hh4/69P4wbwYk6NP+SnpSTtDmHaYKYghPYIUO
	uBW4nR3xKYnTBUuTR7x7v3691kgRIEsI4J0vMjXwJEhtcifW3yI7anjSf/9DAd/lRHDiQxIhr/3
	b9V13ReX8TsfbV0eOt1M1C2bxwmg=
X-Google-Smtp-Source: AGHT+IG9ir7Qv5o8Rj+SB4p+I2Iv/yEJXMt0i85p6DOUBIUWCoVLWKyvCgsi6TT17MsYpR3xksNQ2srolzx+ehJ8uf4=
X-Received: by 2002:a05:6102:5e1:b0:478:2339:cef6 with SMTP id
 w1-20020a05610205e100b004782339cef6mr3607473vsf.5.1711648202174; Thu, 28 Mar
 2024 10:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com> <ZgUGXTKPVhrA1tam@matsya>
In-Reply-To: <ZgUGXTKPVhrA1tam@matsya>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 10:49:51 -0700
Message-ID: <CAOMdWSJxDAFKLVbH7wrB16m2nNXHm0b45dCRhvitVCP1Wf1aEg@mail.gmail.com>
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
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, HaraldWelte@viatech.com, jernej.skrabec@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-usb@vger.kernel.org, Eugeniy.Paltsev
 @synopsys.com, patrice.chotard@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, wangzhou1@hisilicon.com, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com, tj@kernel.org, ma
 nuel.lauss@gmail.com, linux-media@vger.kernel.org, shawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>
> Subsytem is dmaengine, can you rename this to dmaengine: ...

 My apologies, will have it fixed in v2.

>
> On 27-03-24, 16:03, Allen Pais wrote:
> > The only generic interface to execute asynchronously in the BH context is
> > tasklet; however, it's marked deprecated and has some design flaws. To
> > replace tasklets, BH workqueue support was recently added. A BH workqueue
> > behaves similarly to regular workqueues except that the queued work items
> > are executed in the BH context.
>
> Thanks for conversion, am happy with BH alternative as it helps in
> dmaengine where we need shortest possible time between tasklet and
> interrupt handling to maximize dma performance
>
> >
> > This patch converts drivers/dma/* from tasklet to BH workqueue.
>
> >
> > Based on the work done by Tejun Heo <tj@kernel.org>
> > Branch: git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> >
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
> >  drivers/dma/altera-msgdma.c                   | 15 ++++----
> >  drivers/dma/apple-admac.c                     | 15 ++++----
> >  drivers/dma/at_hdmac.c                        |  2 +-
> >  drivers/dma/at_xdmac.c                        | 15 ++++----
> >  drivers/dma/bcm2835-dma.c                     |  2 +-
> >  drivers/dma/dma-axi-dmac.c                    |  2 +-
> >  drivers/dma/dma-jz4780.c                      |  2 +-
> >  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    |  2 +-
> >  drivers/dma/dw-edma/dw-edma-core.c            |  2 +-
> >  drivers/dma/dw/core.c                         | 13 +++----
> >  drivers/dma/dw/regs.h                         |  3 +-
> >  drivers/dma/ep93xx_dma.c                      | 15 ++++----
> >  drivers/dma/fsl-edma-common.c                 |  2 +-
> >  drivers/dma/fsl-qdma.c                        |  2 +-
> >  drivers/dma/fsl_raid.c                        | 11 +++---
> >  drivers/dma/fsl_raid.h                        |  2 +-
> >  drivers/dma/fsldma.c                          | 15 ++++----
> >  drivers/dma/fsldma.h                          |  3 +-
> >  drivers/dma/hisi_dma.c                        |  2 +-
> >  drivers/dma/hsu/hsu.c                         |  2 +-
> >  drivers/dma/idma64.c                          |  4 +--
> >  drivers/dma/img-mdc-dma.c                     |  2 +-
> >  drivers/dma/imx-dma.c                         | 27 +++++++-------
> >  drivers/dma/imx-sdma.c                        |  6 ++--
> >  drivers/dma/ioat/dma.c                        | 17 ++++-----
> >  drivers/dma/ioat/dma.h                        |  5 +--
> >  drivers/dma/ioat/init.c                       |  2 +-
> >  drivers/dma/k3dma.c                           | 19 +++++-----
> >  drivers/dma/mediatek/mtk-cqdma.c              | 35 ++++++++++---------
> >  drivers/dma/mediatek/mtk-hsdma.c              |  2 +-
> >  drivers/dma/mediatek/mtk-uart-apdma.c         |  4 +--
> >  drivers/dma/mmp_pdma.c                        | 13 +++----
> >  drivers/dma/mmp_tdma.c                        | 11 +++---
> >  drivers/dma/mpc512x_dma.c                     | 17 ++++-----
> >  drivers/dma/mv_xor.c                          | 13 +++----
> >  drivers/dma/mv_xor.h                          |  5 +--
> >  drivers/dma/mv_xor_v2.c                       | 23 ++++++------
> >  drivers/dma/mxs-dma.c                         | 13 +++----
> >  drivers/dma/nbpfaxi.c                         | 15 ++++----
> >  drivers/dma/owl-dma.c                         |  2 +-
> >  drivers/dma/pch_dma.c                         | 17 ++++-----
> >  drivers/dma/pl330.c                           | 31 ++++++++--------
> >  drivers/dma/plx_dma.c                         | 13 +++----
> >  drivers/dma/ppc4xx/adma.c                     | 17 ++++-----
> >  drivers/dma/ppc4xx/adma.h                     |  5 +--
> >  drivers/dma/pxa_dma.c                         |  2 +-
> >  drivers/dma/qcom/bam_dma.c                    | 35 ++++++++++---------
> >  drivers/dma/qcom/gpi.c                        | 18 +++++-----
> >  drivers/dma/qcom/hidma.c                      | 11 +++---
> >  drivers/dma/qcom/hidma.h                      |  5 +--
> >  drivers/dma/qcom/hidma_ll.c                   | 11 +++---
> >  drivers/dma/qcom/qcom_adm.c                   |  2 +-
> >  drivers/dma/sa11x0-dma.c                      | 27 +++++++-------
> >  drivers/dma/sf-pdma/sf-pdma.c                 | 23 ++++++------
> >  drivers/dma/sf-pdma/sf-pdma.h                 |  5 +--
> >  drivers/dma/sprd-dma.c                        |  2 +-
> >  drivers/dma/st_fdma.c                         |  2 +-
> >  drivers/dma/ste_dma40.c                       | 17 ++++-----
> >  drivers/dma/sun6i-dma.c                       | 33 ++++++++---------
> >  drivers/dma/tegra186-gpc-dma.c                |  2 +-
> >  drivers/dma/tegra20-apb-dma.c                 | 19 +++++-----
> >  drivers/dma/tegra210-adma.c                   |  2 +-
> >  drivers/dma/ti/edma.c                         |  2 +-
> >  drivers/dma/ti/k3-udma.c                      | 11 +++---
> >  drivers/dma/ti/omap-dma.c                     |  2 +-
> >  drivers/dma/timb_dma.c                        | 23 ++++++------
> >  drivers/dma/txx9dmac.c                        | 29 +++++++--------
> >  drivers/dma/txx9dmac.h                        |  5 +--
> >  drivers/dma/virt-dma.c                        |  9 ++---
> >  drivers/dma/virt-dma.h                        |  9 ++---
> >  drivers/dma/xgene-dma.c                       | 21 +++++------
> >  drivers/dma/xilinx/xilinx_dma.c               | 23 ++++++------
> >  drivers/dma/xilinx/xilinx_dpdma.c             | 21 +++++------
> >  drivers/dma/xilinx/zynqmp_dma.c               | 21 +++++------
> >  74 files changed, 442 insertions(+), 395 deletions(-)
> >
> > diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
> > index a8e3615235b8..611b5290324b 100644
> > --- a/drivers/dma/altera-msgdma.c
> > +++ b/drivers/dma/altera-msgdma.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> >  #include <linux/of_dma.h>
> > +#include <linux/workqueue.h>
> >
> >  #include "dmaengine.h"
> >
> > @@ -170,7 +171,7 @@ struct msgdma_sw_desc {
> >  struct msgdma_device {
> >       spinlock_t lock;
> >       struct device *dev;
> > -     struct tasklet_struct irq_tasklet;
> > +     struct work_struct irq_work;
>
> Can we name these as bh_work to signify that we are always in bh
> context? here and everywhere please

 Sure, will address it in v2.
>
>
> >       struct list_head pending_list;
> >       struct list_head free_list;
> >       struct list_head active_list;
> > @@ -676,12 +677,12 @@ static int msgdma_alloc_chan_resources(struct dma_chan *dchan)
> >  }
> >
> >  /**
> > - * msgdma_tasklet - Schedule completion tasklet
> > + * msgdma_work - Schedule completion work
>
> ..
>
> > @@ -515,7 +516,7 @@ struct gpii {
> >       enum gpi_pm_state pm_state;
> >       rwlock_t pm_lock;
> >       struct gpi_ring ev_ring;
> > -     struct tasklet_struct ev_task; /* event processing tasklet */
> > +     struct work_struct ev_task; /* event processing work */
> >       struct completion cmd_completion;
> >       enum gpi_cmd gpi_cmd;
> >       u32 cntxt_type_irq_msk;
> > @@ -755,7 +756,7 @@ static void gpi_process_ieob(struct gpii *gpii)
> >       gpi_write_reg(gpii, gpii->ieob_clr_reg, BIT(0));
> >
> >       gpi_config_interrupts(gpii, MASK_IEOB_SETTINGS, 0);
> > -     tasklet_hi_schedule(&gpii->ev_task);
> > +     queue_work(system_bh_highpri_wq, &gpii->ev_task);
>
> This is good conversion, thanks for ensuring system_bh_highpri_wq is
> used here

 Thank you very much for the review, will have v2 sent soon.

- Allen

> --
> ~Vinod
>
