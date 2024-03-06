Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A478737B6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 14:28:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H2rRtAHZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqYD04WTQz3vYv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 00:28:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H2rRtAHZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqYCJ23fxz3cML
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 00:27:55 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-dd02fb9a31cso3827005276.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Mar 2024 05:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709731672; x=1710336472; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0PvucL6HmTJPxI4SoEkWegaPuUqqdMQQ07XKPr7IUE=;
        b=H2rRtAHZaFDOgUCFOrpW7hpXH7AQJesd5XLwQhCLBzFLkBVdmxgY0fofrniZ30pBpX
         6kCJudg06i3TjrTmsCMRnbxtyBq397d+Ajetrk1m/0zrfzMkczM0ihzddyiwLrkKtLhl
         okhU7BflqQpmM8pIt5trjgPJVpskoVJsKp8fhhKuFp/iLpD1hy/T95n9D5OYHZJzGtwo
         V91p2/4H/graWLwFSvWmYrQndKLbyxgOQhCG6jktNrV4Bn8GVtMKTf8BdBM8aOnDmLwX
         IU8KyCpmZSdkGtiiLl+W1FRTAjoAB2gqX+m6izlKY28ZqpNT1Z9P4XWWXg51Q+BX1sXH
         L7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709731672; x=1710336472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0PvucL6HmTJPxI4SoEkWegaPuUqqdMQQ07XKPr7IUE=;
        b=a3Xx8g4e3l5+VgQ/PlM5/sPcyXkzVWwpK6d0iLdMF5BetgWqhRiB8qMXA6UfUuz+hJ
         0nZrC9XnU1NniAIwOPxBxgw11F+ovz/551EcWFqgSX6B1yXhW6OOgtTrG2IX3/RXOksP
         FmkRVccKyaWln28s7S8dK6m3FUaxm5sKPj8Xj+nW6YpMH7mRduVxHUahevwUPEbJy/4S
         aCu00ux9etKwsc89NNPbhuP7S5wjZvqWEhix5Awv0q8w0i6acMqfsw7uAjC+AFVfY0Ae
         oTI7lfsgZG7vMtw6k7AetOX2yt1JXCDZWtThyNtPIaMlE/96XXuqw3tgA9Tpy+BKGF16
         GtNw==
X-Forwarded-Encrypted: i=1; AJvYcCUBPcXdRk0CIoTisapCCArE1zAPrc4eMf9EFPVFv9owA/Xb6533ZTRZ1kpcgn3KdoFYqeqx8zi4DFS7xLgEywL3CD1HsAR7OsyOMXKw5g==
X-Gm-Message-State: AOJu0YxxHPx4Ym3WELlS8g0qgedd1wjDan2T3HcsrQ3A9bZmayjbOtp1
	uiWlWke7MhCdOfBYYz1vl8A+YVYWLnG+QdoHE87DwlNLjLjT3cIy
X-Google-Smtp-Source: AGHT+IEdFCX2aJgj0ez4SSkRsd6MT2uesocn1kIUh63onuC2wn5Lla2LBTT79+qSGTnzA1IsbvsBJA==
X-Received: by 2002:a25:ae60:0:b0:dc6:b8f5:50ae with SMTP id g32-20020a25ae60000000b00dc6b8f550aemr13653049ybe.32.1709731672289;
        Wed, 06 Mar 2024 05:27:52 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:a708:4ac5:2d2f:c5bb])
        by smtp.gmail.com with ESMTPSA id g7-20020a258a07000000b00dcdb7d232f9sm3019270ybl.4.2024.03.06.05.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 05:27:51 -0800 (PST)
Date: Wed, 6 Mar 2024 05:27:51 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v6 1/5] net: wan: Add support for QMC HDLC
Message-ID: <ZehvV6kCD3RCumAL@yury-ThinkPad>
References: <20240306080726.167338-1-herve.codina@bootlin.com>
 <20240306080726.167338-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306080726.167338-2-herve.codina@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 06, 2024 at 09:07:17AM +0100, Herve Codina wrote:
> The QMC HDLC driver provides support for HDLC using the QMC (QUICC
> Multichannel Controller) to transfer the HDLC data.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/net/wan/Kconfig        |  12 +
>  drivers/net/wan/Makefile       |   1 +
>  drivers/net/wan/fsl_qmc_hdlc.c | 413 +++++++++++++++++++++++++++++++++
>  3 files changed, 426 insertions(+)
>  create mode 100644 drivers/net/wan/fsl_qmc_hdlc.c
> 
> diff --git a/drivers/net/wan/Kconfig b/drivers/net/wan/Kconfig
> index 7dda87756d3f..31ab2136cdf1 100644
> --- a/drivers/net/wan/Kconfig
> +++ b/drivers/net/wan/Kconfig
> @@ -197,6 +197,18 @@ config FARSYNC
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called farsync.
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
>  config FSL_UCC_HDLC
>  	tristate "Freescale QUICC Engine HDLC support"
>  	depends on HDLC
> diff --git a/drivers/net/wan/Makefile b/drivers/net/wan/Makefile
> index 8119b49d1da9..00e9b7ee1e01 100644
> --- a/drivers/net/wan/Makefile
> +++ b/drivers/net/wan/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_WANXL)		+= wanxl.o
>  obj-$(CONFIG_PCI200SYN)		+= pci200syn.o
>  obj-$(CONFIG_PC300TOO)		+= pc300too.o
>  obj-$(CONFIG_IXP4XX_HSS)	+= ixp4xx_hss.o
> +obj-$(CONFIG_FSL_QMC_HDLC)	+= fsl_qmc_hdlc.o
>  obj-$(CONFIG_FSL_UCC_HDLC)	+= fsl_ucc_hdlc.o
>  obj-$(CONFIG_SLIC_DS26522)	+= slic_ds26522.o
>  
> diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hdlc.c
> new file mode 100644
> index 000000000000..90063a92209e
> --- /dev/null
> +++ b/drivers/net/wan/fsl_qmc_hdlc.c
> @@ -0,0 +1,413 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Freescale QMC HDLC Device Driver
> + *
> + * Copyright 2023 CS GROUP France
> + *
> + * Author: Herve Codina <herve.codina@bootlin.com>
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bug.h>
> +#include <linux/cleanup.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/hdlc.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
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
> +static struct qmc_hdlc *netdev_to_qmc_hdlc(struct net_device *netdev)
> +{
> +	return dev_to_hdlc(netdev)->priv;
> +}
> +
> +static int qmc_hdlc_recv_queue(struct qmc_hdlc *qmc_hdlc, struct qmc_hdlc_desc *desc, size_t size);
> +
> +#define QMC_HDLC_RX_ERROR_FLAGS				\
> +	(QMC_RX_FLAG_HDLC_OVF | QMC_RX_FLAG_HDLC_UNA |	\
> +	 QMC_RX_FLAG_HDLC_CRC | QMC_RX_FLAG_HDLC_ABORT)
> +
> +static void qmc_hcld_recv_complete(void *context, size_t length, unsigned int flags)
> +{
> +	struct qmc_hdlc_desc *desc = context;
> +	struct net_device *netdev = desc->netdev;
> +	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
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

It's minor, but you can avoid conditionals doing something like:

		netdev->stats.rx_over_errors += !!(flags & QMC_RX_FLAG_HDLC_OVF);

Thanks,
Yury

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
