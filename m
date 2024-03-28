Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF798900E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 14:56:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hysjLZhk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V54p83bhTz3vbl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 00:56:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hysjLZhk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4t7T5pKsz3cVG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 16:55:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DB667CE2942;
	Thu, 28 Mar 2024 05:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E6DC433F1;
	Thu, 28 Mar 2024 05:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711605346;
	bh=C6skgkr2NMPDni3brGoFkl+5/I4LRqRBMa9zmdDL9uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hysjLZhkEnvXnxd+HtHwjnxShxKJsdr7YRORWMMbG9CAv2Wo4v/3W17f+9SmlwjYP
	 AyxLZuXRv9YJGW7TBEhuFvjqai5JqAqlAjT7kP1ISp5EH8RS9fJ2YPnuq82HTriscX
	 k3oc9NY2bXpiP0jGnfR7dbOxiqpXyBbLE3Kr+zaoP4w8AQS+EkbA1t2gSCobYQ2KlV
	 32f78em/AA4bHgFdo/ljQvmpapnRbgSvmNw6bLqNSxN3FzIz/Su4hMEut3jzJjbgI6
	 ErlOb5+1jhqeBVqohmzPhEaaC6pQ2kHQXfpk3998EVOS2mUbOgGjtxbSO/uM8abY2C
	 N/IIGvRGfpoEA==
Date: Thu, 28 Mar 2024 11:25:41 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Allen Pais <apais@linux.microsoft.com>
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
Message-ID: <ZgUGXTKPVhrA1tam@matsya>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327160314.9982-3-apais@linux.microsoft.com>
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
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, HaraldWelte@viatech.com, jernej.skrabec@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-usb@vger.kernel.org, Eugeniy.Paltsev
 @synopsys.com, patrice.chotard@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, wangzhou1@hisilicon.com, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com, tj@kernel.org, manuel.lauss@gmail.com, linux-media@vger.k
 ernel.org, shawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Allen,

Subsytem is dmaengine, can you rename this to dmaengine: ...

On 27-03-24, 16:03, Allen Pais wrote:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.

Thanks for conversion, am happy with BH alternative as it helps in
dmaengine where we need shortest possible time between tasklet and
interrupt handling to maximize dma performance

> 
> This patch converts drivers/dma/* from tasklet to BH workqueue.

> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/dma/altera-msgdma.c                   | 15 ++++----
>  drivers/dma/apple-admac.c                     | 15 ++++----
>  drivers/dma/at_hdmac.c                        |  2 +-
>  drivers/dma/at_xdmac.c                        | 15 ++++----
>  drivers/dma/bcm2835-dma.c                     |  2 +-
>  drivers/dma/dma-axi-dmac.c                    |  2 +-
>  drivers/dma/dma-jz4780.c                      |  2 +-
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    |  2 +-
>  drivers/dma/dw-edma/dw-edma-core.c            |  2 +-
>  drivers/dma/dw/core.c                         | 13 +++----
>  drivers/dma/dw/regs.h                         |  3 +-
>  drivers/dma/ep93xx_dma.c                      | 15 ++++----
>  drivers/dma/fsl-edma-common.c                 |  2 +-
>  drivers/dma/fsl-qdma.c                        |  2 +-
>  drivers/dma/fsl_raid.c                        | 11 +++---
>  drivers/dma/fsl_raid.h                        |  2 +-
>  drivers/dma/fsldma.c                          | 15 ++++----
>  drivers/dma/fsldma.h                          |  3 +-
>  drivers/dma/hisi_dma.c                        |  2 +-
>  drivers/dma/hsu/hsu.c                         |  2 +-
>  drivers/dma/idma64.c                          |  4 +--
>  drivers/dma/img-mdc-dma.c                     |  2 +-
>  drivers/dma/imx-dma.c                         | 27 +++++++-------
>  drivers/dma/imx-sdma.c                        |  6 ++--
>  drivers/dma/ioat/dma.c                        | 17 ++++-----
>  drivers/dma/ioat/dma.h                        |  5 +--
>  drivers/dma/ioat/init.c                       |  2 +-
>  drivers/dma/k3dma.c                           | 19 +++++-----
>  drivers/dma/mediatek/mtk-cqdma.c              | 35 ++++++++++---------
>  drivers/dma/mediatek/mtk-hsdma.c              |  2 +-
>  drivers/dma/mediatek/mtk-uart-apdma.c         |  4 +--
>  drivers/dma/mmp_pdma.c                        | 13 +++----
>  drivers/dma/mmp_tdma.c                        | 11 +++---
>  drivers/dma/mpc512x_dma.c                     | 17 ++++-----
>  drivers/dma/mv_xor.c                          | 13 +++----
>  drivers/dma/mv_xor.h                          |  5 +--
>  drivers/dma/mv_xor_v2.c                       | 23 ++++++------
>  drivers/dma/mxs-dma.c                         | 13 +++----
>  drivers/dma/nbpfaxi.c                         | 15 ++++----
>  drivers/dma/owl-dma.c                         |  2 +-
>  drivers/dma/pch_dma.c                         | 17 ++++-----
>  drivers/dma/pl330.c                           | 31 ++++++++--------
>  drivers/dma/plx_dma.c                         | 13 +++----
>  drivers/dma/ppc4xx/adma.c                     | 17 ++++-----
>  drivers/dma/ppc4xx/adma.h                     |  5 +--
>  drivers/dma/pxa_dma.c                         |  2 +-
>  drivers/dma/qcom/bam_dma.c                    | 35 ++++++++++---------
>  drivers/dma/qcom/gpi.c                        | 18 +++++-----
>  drivers/dma/qcom/hidma.c                      | 11 +++---
>  drivers/dma/qcom/hidma.h                      |  5 +--
>  drivers/dma/qcom/hidma_ll.c                   | 11 +++---
>  drivers/dma/qcom/qcom_adm.c                   |  2 +-
>  drivers/dma/sa11x0-dma.c                      | 27 +++++++-------
>  drivers/dma/sf-pdma/sf-pdma.c                 | 23 ++++++------
>  drivers/dma/sf-pdma/sf-pdma.h                 |  5 +--
>  drivers/dma/sprd-dma.c                        |  2 +-
>  drivers/dma/st_fdma.c                         |  2 +-
>  drivers/dma/ste_dma40.c                       | 17 ++++-----
>  drivers/dma/sun6i-dma.c                       | 33 ++++++++---------
>  drivers/dma/tegra186-gpc-dma.c                |  2 +-
>  drivers/dma/tegra20-apb-dma.c                 | 19 +++++-----
>  drivers/dma/tegra210-adma.c                   |  2 +-
>  drivers/dma/ti/edma.c                         |  2 +-
>  drivers/dma/ti/k3-udma.c                      | 11 +++---
>  drivers/dma/ti/omap-dma.c                     |  2 +-
>  drivers/dma/timb_dma.c                        | 23 ++++++------
>  drivers/dma/txx9dmac.c                        | 29 +++++++--------
>  drivers/dma/txx9dmac.h                        |  5 +--
>  drivers/dma/virt-dma.c                        |  9 ++---
>  drivers/dma/virt-dma.h                        |  9 ++---
>  drivers/dma/xgene-dma.c                       | 21 +++++------
>  drivers/dma/xilinx/xilinx_dma.c               | 23 ++++++------
>  drivers/dma/xilinx/xilinx_dpdma.c             | 21 +++++------
>  drivers/dma/xilinx/zynqmp_dma.c               | 21 +++++------
>  74 files changed, 442 insertions(+), 395 deletions(-)
> 
> diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
> index a8e3615235b8..611b5290324b 100644
> --- a/drivers/dma/altera-msgdma.c
> +++ b/drivers/dma/altera-msgdma.c
> @@ -20,6 +20,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/of_dma.h>
> +#include <linux/workqueue.h>
>  
>  #include "dmaengine.h"
>  
> @@ -170,7 +171,7 @@ struct msgdma_sw_desc {
>  struct msgdma_device {
>  	spinlock_t lock;
>  	struct device *dev;
> -	struct tasklet_struct irq_tasklet;
> +	struct work_struct irq_work;

Can we name these as bh_work to signify that we are always in bh
context? here and everywhere please


>  	struct list_head pending_list;
>  	struct list_head free_list;
>  	struct list_head active_list;
> @@ -676,12 +677,12 @@ static int msgdma_alloc_chan_resources(struct dma_chan *dchan)
>  }
>  
>  /**
> - * msgdma_tasklet - Schedule completion tasklet
> + * msgdma_work - Schedule completion work

...

> @@ -515,7 +516,7 @@ struct gpii {
>  	enum gpi_pm_state pm_state;
>  	rwlock_t pm_lock;
>  	struct gpi_ring ev_ring;
> -	struct tasklet_struct ev_task; /* event processing tasklet */
> +	struct work_struct ev_task; /* event processing work */
>  	struct completion cmd_completion;
>  	enum gpi_cmd gpi_cmd;
>  	u32 cntxt_type_irq_msk;
> @@ -755,7 +756,7 @@ static void gpi_process_ieob(struct gpii *gpii)
>  	gpi_write_reg(gpii, gpii->ieob_clr_reg, BIT(0));
>  
>  	gpi_config_interrupts(gpii, MASK_IEOB_SETTINGS, 0);
> -	tasklet_hi_schedule(&gpii->ev_task);
> +	queue_work(system_bh_highpri_wq, &gpii->ev_task);

This is good conversion, thanks for ensuring system_bh_highpri_wq is
used here
-- 
~Vinod
