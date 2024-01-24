Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C58C683B64C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 01:58:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RUkJPtiW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TL2WV5Kp8z3cLY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 11:58:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RUkJPtiW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.179; helo=out-179.mta0.migadu.com; envelope-from=vadim.fedorenko@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 396 seconds by postgrey-1.37 at boromir; Wed, 24 Jan 2024 21:10:52 AEDT
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKfqJ6fJ3z2yk5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 21:10:52 +1100 (AEDT)
Message-ID: <7e7c5d46-001c-46db-85ca-eca013225a89@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1706090630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yti7MYJIYg6JfWboDSjYnbcVlnUKXyDreyg35KDjqIw=;
	b=RUkJPtiW8IMhoRLqRwemCoNXGiM5w+ckEtlm7cgDbPwoYX/axGgzOf2u6PSAuqvApemt8O
	NJDkUqhrSRg2stYS9+hRzIkYTxINC5pUHEhSAbkHhSDYvKf9rnhzjp9JCU12z8V4IpVi7d
	oOUrlhNKsuL6Fl04BwuA3HMFc42UpSQ=
Date: Wed, 24 Jan 2024 10:03:45 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] net: wan: Add support for QMC HDLC
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20240123164912.249540-1-herve.codina@bootlin.com>
 <20240123164912.249540-2-herve.codina@bootlin.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20240123164912.249540-2-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Thu, 25 Jan 2024 11:57:05 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/01/2024 16:49, Herve Codina wrote:
> The QMC HDLC driver provides support for HDLC using the QMC (QUICC
> Multichannel Controller) to transfer the HDLC data.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
> ---
>   drivers/net/wan/Kconfig        |  12 +
>   drivers/net/wan/Makefile       |   1 +
>   drivers/net/wan/fsl_qmc_hdlc.c | 422 +++++++++++++++++++++++++++++++++
>   3 files changed, 435 insertions(+)
>   create mode 100644 drivers/net/wan/fsl_qmc_hdlc.c
> 
> diff --git a/drivers/net/wan/Kconfig b/drivers/net/wan/Kconfig
> index 7dda87756d3f..31ab2136cdf1 100644
> --- a/drivers/net/wan/Kconfig
> +++ b/drivers/net/wan/Kconfig
> @@ -197,6 +197,18 @@ config FARSYNC
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called farsync.
>   
> +config FSL_QMC_HDLC
> +	tristate "Freescale QMC HDLC support"
> +	depends on HDLC
> +	depends on CPM_QMC
> +	help
> +	  HDLC support using the Freescale QUICC Multichannel Controller (QMC).
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called fsl_qmc_hdlc.
> +
> +	  If unsure, say N.
> +
>   config FSL_UCC_HDLC
>   	tristate "Freescale QUICC Engine HDLC support"
>   	depends on HDLC
> diff --git a/drivers/net/wan/Makefile b/drivers/net/wan/Makefile
> index 8119b49d1da9..00e9b7ee1e01 100644
> --- a/drivers/net/wan/Makefile
> +++ b/drivers/net/wan/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_WANXL)		+= wanxl.o
>   obj-$(CONFIG_PCI200SYN)		+= pci200syn.o
>   obj-$(CONFIG_PC300TOO)		+= pc300too.o
>   obj-$(CONFIG_IXP4XX_HSS)	+= ixp4xx_hss.o
> +obj-$(CONFIG_FSL_QMC_HDLC)	+= fsl_qmc_hdlc.o
>   obj-$(CONFIG_FSL_UCC_HDLC)	+= fsl_ucc_hdlc.o
>   obj-$(CONFIG_SLIC_DS26522)	+= slic_ds26522.o
>   
> diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hdlc.c
> new file mode 100644
> index 000000000000..31b637ec8390
> --- /dev/null
> +++ b/drivers/net/wan/fsl_qmc_hdlc.c
> @@ -0,0 +1,422 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Freescale QMC HDLC Device Driver
> + *
> + * Copyright 2023 CS GROUP France
> + *
> + * Author: Herve Codina <herve.codina@bootlin.com>
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/hdlc.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <soc/fsl/qe/qmc.h>
> +
> +struct qmc_hdlc_desc {
> +	struct net_device *netdev;
> +	struct sk_buff *skb; /* NULL if the descriptor is not in use */
> +	dma_addr_t dma_addr;
> +	size_t dma_size;
> +};
> +
> +struct qmc_hdlc {
> +	struct device *dev;
> +	struct qmc_chan *qmc_chan;
> +	struct net_device *netdev;
> +	bool is_crc32;
> +	spinlock_t tx_lock; /* Protect tx descriptors */
> +	struct qmc_hdlc_desc tx_descs[8];
> +	unsigned int tx_out;
> +	struct qmc_hdlc_desc rx_descs[4];
> +};
> +
> +static inline struct qmc_hdlc *netdev_to_qmc_hdlc(struct net_device *netdev)
> +{
> +	return dev_to_hdlc(netdev)->priv;
> +}
> +
> +static int qmc_hdlc_recv_queue(struct qmc_hdlc *qmc_hdlc, struct qmc_hdlc_desc *desc, size_t size);
> +
> +#define QMC_HDLC_RX_ERROR_FLAGS (QMC_RX_FLAG_HDLC_OVF | \
> +				 QMC_RX_FLAG_HDLC_UNA | \
> +				 QMC_RX_FLAG_HDLC_ABORT | \
> +				 QMC_RX_FLAG_HDLC_CRC)
> +
> +static void qmc_hcld_recv_complete(void *context, size_t length, unsigned int flags)
> +{
> +	struct qmc_hdlc_desc *desc = context;
> +	struct net_device *netdev = desc->netdev;
> +	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(desc->netdev);

a line above desc->netdev was stored in netdev. better to reuse it and 
make declaration part consistent with qmc_hcld_xmit_complete

> +	int ret;
> +
> +	dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size, DMA_FROM_DEVICE);
> +
> +	if (flags & QMC_HDLC_RX_ERROR_FLAGS) {
> +		netdev->stats.rx_errors++;
> +		if (flags & QMC_RX_FLAG_HDLC_OVF) /* Data overflow */
> +			netdev->stats.rx_over_errors++;
> +		if (flags & QMC_RX_FLAG_HDLC_UNA) /* bits received not multiple of 8 */
> +			netdev->stats.rx_frame_errors++;
> +		if (flags & QMC_RX_FLAG_HDLC_ABORT) /* Received an abort sequence */
> +			netdev->stats.rx_frame_errors++;
> +		if (flags & QMC_RX_FLAG_HDLC_CRC) /* CRC error */
> +			netdev->stats.rx_crc_errors++;
> +		kfree_skb(desc->skb);
> +	} else {
> +		netdev->stats.rx_packets++;
> +		netdev->stats.rx_bytes += length;
> +
> +		skb_put(desc->skb, length);
> +		desc->skb->protocol = hdlc_type_trans(desc->skb, netdev);
> +		netif_rx(desc->skb);
> +	}
> +
> +	/* Re-queue a transfer using the same descriptor */
> +	ret = qmc_hdlc_recv_queue(qmc_hdlc, desc, desc->dma_size);
> +	if (ret) {
> +		dev_err(qmc_hdlc->dev, "queue recv desc failed (%d)\n", ret);
> +		netdev->stats.rx_errors++;
> +	}
> +}
> +
> +static int qmc_hdlc_recv_queue(struct qmc_hdlc *qmc_hdlc, struct qmc_hdlc_desc *desc, size_t size)
> +{
> +	int ret;
> +
> +	desc->skb = dev_alloc_skb(size);
> +	if (!desc->skb)
> +		return -ENOMEM;
> +
> +	desc->dma_size = size;
> +	desc->dma_addr = dma_map_single(qmc_hdlc->dev, desc->skb->data,
> +					desc->dma_size, DMA_FROM_DEVICE);
> +	ret = dma_mapping_error(qmc_hdlc->dev, desc->dma_addr);
> +	if (ret)
> +		goto free_skb;
> +
> +	ret = qmc_chan_read_submit(qmc_hdlc->qmc_chan, desc->dma_addr, desc->dma_size,
> +				   qmc_hcld_recv_complete, desc);
> +	if (ret)
> +		goto dma_unmap;
> +
> +	return 0;
> +
> +dma_unmap:
> +	dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size, DMA_FROM_DEVICE);
> +free_skb:
> +	kfree_skb(desc->skb);
> +	desc->skb = NULL;
> +	return ret;
> +}
> +
> +static void qmc_hdlc_xmit_complete(void *context)
> +{
> +	struct qmc_hdlc_desc *desc = context;
> +	struct net_device *netdev = desc->netdev;
> +	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
> +	struct sk_buff *skb;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&qmc_hdlc->tx_lock, flags);
> +	dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size, DMA_TO_DEVICE);
> +	skb = desc->skb;
> +	desc->skb = NULL; /* Release the descriptor */
> +	if (netif_queue_stopped(netdev))
> +		netif_wake_queue(netdev);
> +	spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags);
> +
> +	netdev->stats.tx_packets++;
> +	netdev->stats.tx_bytes += skb->len;
> +
> +	dev_consume_skb_any(skb);
> +}
> +
> +static int qmc_hdlc_xmit_queue(struct qmc_hdlc *qmc_hdlc, struct qmc_hdlc_desc *desc)
> +{
> +	int ret;
> +
> +	desc->dma_addr = dma_map_single(qmc_hdlc->dev, desc->skb->data,
> +					desc->dma_size, DMA_TO_DEVICE);
> +	ret = dma_mapping_error(qmc_hdlc->dev, desc->dma_addr);
> +	if (ret) {
> +		dev_err(qmc_hdlc->dev, "failed to map skb\n");
> +		return ret;
> +	}
> +
> +	ret = qmc_chan_write_submit(qmc_hdlc->qmc_chan, desc->dma_addr, desc->dma_size,
> +				    qmc_hdlc_xmit_complete, desc);
> +	if (ret) {
> +		dev_err(qmc_hdlc->dev, "qmc chan write returns %d\n", ret);
> +		dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size, DMA_TO_DEVICE);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static netdev_tx_t qmc_hdlc_xmit(struct sk_buff *skb, struct net_device *netdev)
> +{
> +	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
> +	struct qmc_hdlc_desc *desc;
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&qmc_hdlc->tx_lock, flags);
> +	desc = &qmc_hdlc->tx_descs[qmc_hdlc->tx_out];
> +	if (desc->skb) {
> +		/* Should never happen.
> +		 * Previous xmit should have already stopped the queue.
> +		 */

according to the comment it's better to make if(unlikely(desc->skb)) or
even WARN_ONCE()

> +		netif_stop_queue(netdev);
> +		spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags);
> +		return NETDEV_TX_BUSY;
> +	}
> +	spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags);

[...]
