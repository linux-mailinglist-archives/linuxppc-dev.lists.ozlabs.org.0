Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAE588F0AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 22:11:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=j1MFXh/g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4fVd6WLfz3vgH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 08:11:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=j1MFXh/g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=apais@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4WgX2yGbz3brc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 03:03:52 +1100 (AEDT)
Received: from apais-vm1.0synte4vioeebbvidf5q0vz2ua.xx.internal.cloudapp.net (unknown [52.183.86.224])
	by linux.microsoft.com (Postfix) with ESMTPSA id DA2672085CE4;
	Wed, 27 Mar 2024 09:03:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DA2672085CE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711555401;
	bh=3hcnlvv5JwxGRimv8puox0FI6yYT22rRQLYPals06nM=;
	h=From:To:Cc:Subject:Date:From;
	b=j1MFXh/gQg1tzy1NiZhDwekxwc8dvAzI+onvdyQYuwuUQW8n92YESaET4UqKK3s+1
	 GkKlfkFJN7woCpfY/15BUPreZuaOKAoShX2RDT1e+7ZGcLy3rLDfkRWzSogXlEFbF5
	 xONzEb2r0qc0V0QS8P8cWQIe/e+DcLcRmQWlSfJA=
From: Allen Pais <apais@linux.microsoft.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] Convert Tasklets to BH Workqueues
Date: Wed, 27 Mar 2024 16:03:05 +0000
Message-Id: <20240327160314.9982-1-apais@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
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
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, HaraldWelte@viatech.com, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, wangzhou1@hisilicon.com, jernej.skrabec@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-usb@vger.kernel.org, Eugeniy.Paltsev@sy
 nopsys.com, patrice.chotard@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-mips@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com, tj@kernel.org, manuel.lauss@gmail.com, linux-media@vger.kernel.org, s
 hawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series represents a significant shift in how asynchronous
execution in the bottom half (BH) context is handled within the kernel.
Traditionally, tasklets have been the go-to mechanism for such operations.
This series introduces the conversion of existing tasklet implementations
to the newly supported BH workqueues, marking a pivotal enhancement
in how asynchronous tasks are managed and executed.

Background and Motivation:
Tasklets have served as the kernel's lightweight mechanism for
scheduling bottom-half processing, providing a simple interface
for deferring work from interrupt context. There have been increasing
requests and motivations to deprecate and eventually remove tasklets
in favor of more modern and flexible mechanisms.

Introduction of BH Workqueues:
BH workqueues are designed to behave similarly to regular workqueues
with the added benefit of execution in the BH context.

Conversion Details:
The conversion process involved identifying all instances where
tasklets were used within the kernel and replacing them with BH workqueue
implementations.

This patch series is a first step toward broader adoption of BH workqueues
across the kernel, and soon other subsystems using tasklets will undergo
a similar transition. The groundwork laid here could serve as a
blueprint for such future conversions.

Testing Request:
In addition to a thorough review of these changes,
I kindly request that the reviwers engage in both functional and
performance testing of this patch series. Specifically, benchmarks
that measure interrupt handling efficiency, latency, and throughput.

I welcome your feedback, suggestions, and any further discussion on this
patch series.


Additional Info:
    Based on the work done by Tejun Heo <tj@kernel.org>
    Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10

Allen Pais (9):
  hyperv: Convert from tasklet to BH workqueue
  dma: Convert from tasklet to BH workqueue
  IB: Convert from tasklet to BH workqueue
  USB: Convert from tasklet to BH workqueue
  mailbox: Convert from tasklet to BH workqueue
  ipmi: Convert from tasklet to BH workqueue
  s390: Convert from tasklet to BH workqueue
  drivers/media/*: Convert from tasklet to BH workqueue
  mmc: Convert from tasklet to BH workqueue

 drivers/char/ipmi/ipmi_msghandler.c           | 30 ++++----
 drivers/dma/altera-msgdma.c                   | 15 ++--
 drivers/dma/apple-admac.c                     | 15 ++--
 drivers/dma/at_hdmac.c                        |  2 +-
 drivers/dma/at_xdmac.c                        | 15 ++--
 drivers/dma/bcm2835-dma.c                     |  2 +-
 drivers/dma/dma-axi-dmac.c                    |  2 +-
 drivers/dma/dma-jz4780.c                      |  2 +-
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    |  2 +-
 drivers/dma/dw-edma/dw-edma-core.c            |  2 +-
 drivers/dma/dw/core.c                         | 13 ++--
 drivers/dma/dw/regs.h                         |  3 +-
 drivers/dma/ep93xx_dma.c                      | 15 ++--
 drivers/dma/fsl-edma-common.c                 |  2 +-
 drivers/dma/fsl-qdma.c                        |  2 +-
 drivers/dma/fsl_raid.c                        | 11 +--
 drivers/dma/fsl_raid.h                        |  2 +-
 drivers/dma/fsldma.c                          | 15 ++--
 drivers/dma/fsldma.h                          |  3 +-
 drivers/dma/hisi_dma.c                        |  2 +-
 drivers/dma/hsu/hsu.c                         |  2 +-
 drivers/dma/idma64.c                          |  4 +-
 drivers/dma/img-mdc-dma.c                     |  2 +-
 drivers/dma/imx-dma.c                         | 27 +++----
 drivers/dma/imx-sdma.c                        |  6 +-
 drivers/dma/ioat/dma.c                        | 17 +++--
 drivers/dma/ioat/dma.h                        |  5 +-
 drivers/dma/ioat/init.c                       |  2 +-
 drivers/dma/k3dma.c                           | 19 ++---
 drivers/dma/mediatek/mtk-cqdma.c              | 35 ++++-----
 drivers/dma/mediatek/mtk-hsdma.c              |  2 +-
 drivers/dma/mediatek/mtk-uart-apdma.c         |  4 +-
 drivers/dma/mmp_pdma.c                        | 13 ++--
 drivers/dma/mmp_tdma.c                        | 11 +--
 drivers/dma/mpc512x_dma.c                     | 17 +++--
 drivers/dma/mv_xor.c                          | 13 ++--
 drivers/dma/mv_xor.h                          |  5 +-
 drivers/dma/mv_xor_v2.c                       | 23 +++---
 drivers/dma/mxs-dma.c                         | 13 ++--
 drivers/dma/nbpfaxi.c                         | 15 ++--
 drivers/dma/owl-dma.c                         |  2 +-
 drivers/dma/pch_dma.c                         | 17 +++--
 drivers/dma/pl330.c                           | 31 ++++----
 drivers/dma/plx_dma.c                         | 13 ++--
 drivers/dma/ppc4xx/adma.c                     | 17 +++--
 drivers/dma/ppc4xx/adma.h                     |  5 +-
 drivers/dma/pxa_dma.c                         |  2 +-
 drivers/dma/qcom/bam_dma.c                    | 35 ++++-----
 drivers/dma/qcom/gpi.c                        | 18 ++---
 drivers/dma/qcom/hidma.c                      | 11 +--
 drivers/dma/qcom/hidma.h                      |  5 +-
 drivers/dma/qcom/hidma_ll.c                   | 11 +--
 drivers/dma/qcom/qcom_adm.c                   |  2 +-
 drivers/dma/sa11x0-dma.c                      | 27 +++----
 drivers/dma/sf-pdma/sf-pdma.c                 | 23 +++---
 drivers/dma/sf-pdma/sf-pdma.h                 |  5 +-
 drivers/dma/sprd-dma.c                        |  2 +-
 drivers/dma/st_fdma.c                         |  2 +-
 drivers/dma/ste_dma40.c                       | 17 +++--
 drivers/dma/sun6i-dma.c                       | 33 ++++----
 drivers/dma/tegra186-gpc-dma.c                |  2 +-
 drivers/dma/tegra20-apb-dma.c                 | 19 ++---
 drivers/dma/tegra210-adma.c                   |  2 +-
 drivers/dma/ti/edma.c                         |  2 +-
 drivers/dma/ti/k3-udma.c                      | 11 +--
 drivers/dma/ti/omap-dma.c                     |  2 +-
 drivers/dma/timb_dma.c                        | 23 +++---
 drivers/dma/txx9dmac.c                        | 29 +++----
 drivers/dma/txx9dmac.h                        |  5 +-
 drivers/dma/virt-dma.c                        |  9 ++-
 drivers/dma/virt-dma.h                        |  9 ++-
 drivers/dma/xgene-dma.c                       | 21 +++---
 drivers/dma/xilinx/xilinx_dma.c               | 23 +++---
 drivers/dma/xilinx/xilinx_dpdma.c             | 21 +++---
 drivers/dma/xilinx/zynqmp_dma.c               | 21 +++---
 drivers/hv/channel.c                          |  8 +-
 drivers/hv/channel_mgmt.c                     |  5 +-
 drivers/hv/connection.c                       |  9 ++-
 drivers/hv/hv.c                               |  3 +-
 drivers/hv/hv_balloon.c                       |  4 +-
 drivers/hv/hv_fcopy.c                         |  8 +-
 drivers/hv/hv_kvp.c                           |  8 +-
 drivers/hv/hv_snapshot.c                      |  8 +-
 drivers/hv/hyperv_vmbus.h                     |  9 ++-
 drivers/hv/vmbus_drv.c                        | 19 ++---
 drivers/infiniband/hw/bnxt_re/bnxt_re.h       |  3 +-
 drivers/infiniband/hw/bnxt_re/qplib_fp.c      | 21 +++---
 drivers/infiniband/hw/bnxt_re/qplib_fp.h      |  2 +-
 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c    | 25 ++++---
 drivers/infiniband/hw/bnxt_re/qplib_rcfw.h    |  2 +-
 drivers/infiniband/hw/erdma/erdma.h           |  3 +-
 drivers/infiniband/hw/erdma/erdma_eq.c        | 11 +--
 drivers/infiniband/hw/hfi1/rc.c               |  2 +-
 drivers/infiniband/hw/hfi1/sdma.c             | 37 ++++-----
 drivers/infiniband/hw/hfi1/sdma.h             |  9 ++-
 drivers/infiniband/hw/hfi1/tid_rdma.c         |  6 +-
 drivers/infiniband/hw/irdma/ctrl.c            |  2 +-
 drivers/infiniband/hw/irdma/hw.c              | 24 +++---
 drivers/infiniband/hw/irdma/main.h            |  5 +-
 drivers/infiniband/hw/qib/qib.h               |  7 +-
 drivers/infiniband/hw/qib/qib_iba7322.c       |  9 ++-
 drivers/infiniband/hw/qib/qib_rc.c            | 16 ++--
 drivers/infiniband/hw/qib/qib_ruc.c           |  4 +-
 drivers/infiniband/hw/qib/qib_sdma.c          | 11 +--
 drivers/infiniband/sw/rdmavt/qp.c             |  2 +-
 drivers/mailbox/bcm-pdc-mailbox.c             | 21 +++---
 drivers/mailbox/imx-mailbox.c                 | 16 ++--
 drivers/media/pci/bt8xx/bt878.c               |  8 +-
 drivers/media/pci/bt8xx/bt878.h               |  3 +-
 drivers/media/pci/bt8xx/dvb-bt8xx.c           |  9 ++-
 drivers/media/pci/ddbridge/ddbridge.h         |  3 +-
 drivers/media/pci/mantis/hopper_cards.c       |  2 +-
 drivers/media/pci/mantis/mantis_cards.c       |  2 +-
 drivers/media/pci/mantis/mantis_common.h      |  3 +-
 drivers/media/pci/mantis/mantis_dma.c         |  5 +-
 drivers/media/pci/mantis/mantis_dma.h         |  2 +-
 drivers/media/pci/mantis/mantis_dvb.c         | 12 +--
 drivers/media/pci/ngene/ngene-core.c          | 23 +++---
 drivers/media/pci/ngene/ngene.h               |  5 +-
 drivers/media/pci/smipcie/smipcie-main.c      | 18 ++---
 drivers/media/pci/smipcie/smipcie.h           |  3 +-
 drivers/media/pci/ttpci/budget-av.c           |  3 +-
 drivers/media/pci/ttpci/budget-ci.c           | 27 +++----
 drivers/media/pci/ttpci/budget-core.c         | 10 +--
 drivers/media/pci/ttpci/budget.h              |  5 +-
 drivers/media/pci/tw5864/tw5864-core.c        |  2 +-
 drivers/media/pci/tw5864/tw5864-video.c       | 13 ++--
 drivers/media/pci/tw5864/tw5864.h             |  7 +-
 drivers/media/platform/intel/pxa_camera.c     | 15 ++--
 drivers/media/platform/marvell/mcam-core.c    | 11 +--
 drivers/media/platform/marvell/mcam-core.h    |  3 +-
 .../st/sti/c8sectpfe/c8sectpfe-core.c         | 15 ++--
 .../st/sti/c8sectpfe/c8sectpfe-core.h         |  2 +-
 drivers/media/radio/wl128x/fmdrv.h            |  7 +-
 drivers/media/radio/wl128x/fmdrv_common.c     | 41 +++++-----
 drivers/media/rc/mceusb.c                     |  2 +-
 drivers/media/usb/ttusb-dec/ttusb_dec.c       | 21 +++---
 drivers/mmc/host/atmel-mci.c                  | 35 ++++-----
 drivers/mmc/host/au1xmmc.c                    | 37 ++++-----
 drivers/mmc/host/cb710-mmc.c                  | 15 ++--
 drivers/mmc/host/cb710-mmc.h                  |  3 +-
 drivers/mmc/host/dw_mmc.c                     | 25 ++++---
 drivers/mmc/host/dw_mmc.h                     |  9 ++-
 drivers/mmc/host/omap.c                       | 17 +++--
 drivers/mmc/host/renesas_sdhi.h               |  3 +-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 24 +++---
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  9 +--
 drivers/mmc/host/sdhci-bcm-kona.c             |  2 +-
 drivers/mmc/host/tifm_sd.c                    | 15 ++--
 drivers/mmc/host/tmio_mmc.h                   |  3 +-
 drivers/mmc/host/tmio_mmc_core.c              |  4 +-
 drivers/mmc/host/uniphier-sd.c                | 13 ++--
 drivers/mmc/host/via-sdmmc.c                  | 25 ++++---
 drivers/mmc/host/wbsd.c                       | 75 ++++++++++---------
 drivers/mmc/host/wbsd.h                       | 10 +--
 drivers/s390/block/dasd.c                     | 42 +++++------
 drivers/s390/block/dasd_int.h                 | 10 +--
 drivers/s390/char/con3270.c                   | 27 ++++---
 drivers/s390/crypto/ap_bus.c                  | 24 +++---
 drivers/s390/crypto/ap_bus.h                  |  2 +-
 drivers/s390/crypto/zcrypt_msgtype50.c        |  2 +-
 drivers/s390/crypto/zcrypt_msgtype6.c         |  4 +-
 drivers/s390/net/ctcm_fsms.c                  |  4 +-
 drivers/s390/net/ctcm_main.c                  | 15 ++--
 drivers/s390/net/ctcm_main.h                  |  5 +-
 drivers/s390/net/ctcm_mpc.c                   | 12 +--
 drivers/s390/net/ctcm_mpc.h                   |  7 +-
 drivers/s390/net/lcs.c                        | 26 +++----
 drivers/s390/net/lcs.h                        |  2 +-
 drivers/s390/net/qeth_core_main.c             |  2 +-
 drivers/s390/scsi/zfcp_qdio.c                 | 45 +++++------
 drivers/s390/scsi/zfcp_qdio.h                 |  9 ++-
 drivers/usb/atm/usbatm.c                      | 55 +++++++-------
 drivers/usb/atm/usbatm.h                      |  3 +-
 drivers/usb/core/hcd.c                        | 22 +++---
 drivers/usb/gadget/udc/fsl_qe_udc.c           | 21 +++---
 drivers/usb/gadget/udc/fsl_qe_udc.h           |  4 +-
 drivers/usb/host/ehci-sched.c                 |  2 +-
 drivers/usb/host/fhci-hcd.c                   |  3 +-
 drivers/usb/host/fhci-sched.c                 | 10 +--
 drivers/usb/host/fhci.h                       |  5 +-
 drivers/usb/host/xhci-dbgcap.h                |  3 +-
 drivers/usb/host/xhci-dbgtty.c                | 15 ++--
 include/linux/hyperv.h                        |  2 +-
 include/linux/usb/cdc_ncm.h                   |  2 +-
 include/linux/usb/usbnet.h                    |  2 +-
 186 files changed, 1135 insertions(+), 1044 deletions(-)

-- 
2.17.1

