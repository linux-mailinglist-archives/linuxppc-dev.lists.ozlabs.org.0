Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB1B87375A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 14:06:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CzYpciDZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqXl52x4cz3dVZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 00:06:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CzYpciDZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqXkN1pCqz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 00:06:19 +1100 (AEDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-609d9ce5bdeso7014167b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Mar 2024 05:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709730374; x=1710335174; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0Oi3DIHf6RcVnBQ6jfEGvzGhX4KFvOXX/NtautGKE4=;
        b=CzYpciDZP/Idb0jCDnkrIKQbC11OdIvYD9qDM1gq6VPqfIktlNIsIGNo22sJgBWQaB
         DHERo6EMmM9ISBporY2b5RQAn5e+Fb3qORyz5TY0FL8Opmmy14PEJtCjAloBbuTUCgbZ
         fuKOlrwnD/MW/zqHt2ax3XVY5Az8eDhwhoZ78j42vj9iVEQ61g4pNQo4iSs2gw/xDIhR
         gGYdbi/KhuiCL71rKRu/zcHwURi4ClNRBbB1GsgbkBrzOqreYp6R/tAiYX0rOhyGavv/
         2J4Be+Q9dZA+b3f9I6SXjI5UROq80UQLG29z0+oUInmMKTyspsIJ7qnL+dLVuTO0qlKd
         dg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709730374; x=1710335174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0Oi3DIHf6RcVnBQ6jfEGvzGhX4KFvOXX/NtautGKE4=;
        b=R2qYoVIlA3fvuR6CkqW5NJM7ImsG7oLJNIftm7MVN2ovv4IW9HdbC93B+qODE3vFKB
         e+zWs8vn3Y3yDpty5m7QRxW/dJubk9ZMoTQaDiSgu+fInFe0QsjPNZjeSyHYr+/odRtr
         xY7ZnRmidFfoodJ/PTy93BBn3BVgkeE/vRi6j89ryzAJsdWXavRMw9s+T1tN8O/FsyFV
         lxTJUL3vqBMn4i4pHMSekI4i2ErvAgHubsnE8Yxk305TaXOrO5NxOKgmbBdXcFFjF8Gv
         FG1xbCv9p523WKQpwV4h1RDVwpzIYO1ObHs6X15m0noIj8oVc6nBmXNIpCGnBm8Z0sND
         s4Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUxhn5RIwH+Hzc/DmoqSi1myUpnhjCmAbhpgHHRsTnkqy3d7A+TgE5TmfFKpc1ihnTOXuAd0CwD1XxiM36x5FKDsBaMDnuB6NqiVgsFpA==
X-Gm-Message-State: AOJu0YwLJQxUrEUtah2cg7WGGwIXi51lmK3WsMwpZZlMaJiHNgBa+WF3
	vlvsA3SQAdqHAY1mZis3i3o1+9hHgox3KCSCj8KEbHTB8Gbgo/KR
X-Google-Smtp-Source: AGHT+IE+aoLOnpZkLP/3EfQ+xyS+L+4GWolxGYGRGD6QvHKeBWbWI3i1ajDfNqpm2ci7qFy0mSU4Mg==
X-Received: by 2002:a81:5b08:0:b0:609:bd7b:bb55 with SMTP id p8-20020a815b08000000b00609bd7bbb55mr7704201ywb.23.1709730374439;
        Wed, 06 Mar 2024 05:06:14 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:a708:4ac5:2d2f:c5bb])
        by smtp.gmail.com with ESMTPSA id s123-20020a0de981000000b0060968d94177sm3683591ywe.15.2024.03.06.05.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 05:06:13 -0800 (PST)
Date: Wed, 6 Mar 2024 05:06:12 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v6 4/5] net: wan: fsl_qmc_hdlc: Add runtime timeslots
 changes support
Message-ID: <ZehqRMZwtazTf6P6@yury-ThinkPad>
References: <20240306080726.167338-1-herve.codina@bootlin.com>
 <20240306080726.167338-5-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306080726.167338-5-herve.codina@bootlin.com>
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

On Wed, Mar 06, 2024 at 09:07:20AM +0100, Herve Codina wrote:
> QMC channels support runtime timeslots changes but nothing is done at
> the QMC HDLC driver to handle these changes.
> 
> Use existing IFACE ioctl in order to configure the timeslots to use.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/net/wan/fsl_qmc_hdlc.c | 151 ++++++++++++++++++++++++++++++++-
>  1 file changed, 150 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hdlc.c
> index 90063a92209e..31c0f32474a3 100644
> --- a/drivers/net/wan/fsl_qmc_hdlc.c
> +++ b/drivers/net/wan/fsl_qmc_hdlc.c
> @@ -10,6 +10,7 @@
>  #include <linux/array_size.h>
>  #include <linux/bug.h>
>  #include <linux/cleanup.h>
> +#include <linux/bitmap.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> @@ -39,6 +40,7 @@ struct qmc_hdlc {
>  	struct qmc_hdlc_desc tx_descs[8];
>  	unsigned int tx_out;
>  	struct qmc_hdlc_desc rx_descs[4];
> +	u32 slot_map;
>  };
>  
>  static struct qmc_hdlc *netdev_to_qmc_hdlc(struct net_device *netdev)
> @@ -203,6 +205,144 @@ static netdev_tx_t qmc_hdlc_xmit(struct sk_buff *skb, struct net_device *netdev)
>  	return NETDEV_TX_OK;
>  }
>  
> +static int qmc_hdlc_xlate_slot_map(struct qmc_hdlc *qmc_hdlc,
> +				   u32 slot_map, struct qmc_chan_ts_info *ts_info)
> +{
> +	DECLARE_BITMAP(ts_mask_avail, 64);
> +	DECLARE_BITMAP(ts_mask, 64);
> +	DECLARE_BITMAP(map, 64);
> +
> +	/* Tx and Rx available masks must be identical */
> +	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
> +		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
> +			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
> +		return -EINVAL;
> +	}
> +
> +	bitmap_from_u64(ts_mask_avail, ts_info->rx_ts_mask_avail);
> +	bitmap_from_u64(map, slot_map);
> +	bitmap_scatter(ts_mask, map, ts_mask_avail, 64);

We've got a BITMAP_FROM_U64() for this:

	DECLARE_BITMAP(ts_mask_avail, 64) = { BITMAP_FROM_U64(ts_info->rx_ts_mask_avail) };
	DECLARE_BITMAP(map, 64) = { BITMAP_FROM_U64(slot_map) };

> +
> +	if (bitmap_weight(ts_mask, 64) != bitmap_weight(map, 64)) {
> +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots %64pb -> (%64pb, %64pb)\n",
> +			map, ts_mask_avail, ts_mask);
> +		return -EINVAL;
> +	}
> +
> +	bitmap_to_arr64(&ts_info->tx_ts_mask, ts_mask, 64);
> +	ts_info->rx_ts_mask = ts_info->tx_ts_mask;
> +	return 0;
> +}
> +
> +static int qmc_hdlc_xlate_ts_info(struct qmc_hdlc *qmc_hdlc,
> +				  const struct qmc_chan_ts_info *ts_info, u32 *slot_map)
> +{
> +	DECLARE_BITMAP(ts_mask_avail, 64);
> +	DECLARE_BITMAP(ts_mask, 64);
> +	DECLARE_BITMAP(map, 64);
> +	u32 array32[2];

NIT. Bad name. I'd suggest slot_array, or something.

> +	/* Tx and Rx masks and available masks must be identical */
> +	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
> +		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
> +			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
> +		return -EINVAL;
> +	}
> +	if (ts_info->rx_ts_mask != ts_info->tx_ts_mask) {
> +		dev_err(qmc_hdlc->dev, "tx and rx timeslots mismatch (0x%llx, 0x%llx)\n",
> +			ts_info->rx_ts_mask, ts_info->tx_ts_mask);
> +		return -EINVAL;
> +	}
> +
> +	bitmap_from_u64(ts_mask_avail, ts_info->rx_ts_mask_avail);
> +	bitmap_from_u64(ts_mask, ts_info->rx_ts_mask);

Same as above, can you try using BITMAP_FROM_U64()?

Thanks,
Yury

> +	bitmap_gather(map, ts_mask, ts_mask_avail, 64);
> +
> +	if (bitmap_weight(ts_mask, 64) != bitmap_weight(map, 64)) {
> +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots (%64pb, %64pb) -> %64pb\n",
> +			ts_mask_avail, ts_mask, map);
> +		return -EINVAL;
> +	}
> +
> +	bitmap_to_arr32(array32, map, 64);
> +	if (array32[1]) {
> +		dev_err(qmc_hdlc->dev, "Slot map out of 32bit (%64pb, %64pb) -> %64pb\n",
> +			ts_mask_avail, ts_mask, map);
> +		return -EINVAL;
> +	}
> +
> +	*slot_map = array32[0];
> +	return 0;
> +}
> +
> +static int qmc_hdlc_set_iface(struct qmc_hdlc *qmc_hdlc, int if_iface, const te1_settings *te1)
> +{
> +	struct qmc_chan_ts_info ts_info;
> +	int ret;
> +
> +	ret = qmc_chan_get_ts_info(qmc_hdlc->qmc_chan, &ts_info);
> +	if (ret) {
> +		dev_err(qmc_hdlc->dev, "get QMC channel ts info failed %d\n", ret);
> +		return ret;
> +	}
> +	ret = qmc_hdlc_xlate_slot_map(qmc_hdlc, te1->slot_map, &ts_info);
> +	if (ret)
> +		return ret;
> +
> +	ret = qmc_chan_set_ts_info(qmc_hdlc->qmc_chan, &ts_info);
> +	if (ret) {
> +		dev_err(qmc_hdlc->dev, "set QMC channel ts info failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	qmc_hdlc->slot_map = te1->slot_map;
> +
> +	return 0;
> +}
> +
> +static int qmc_hdlc_ioctl(struct net_device *netdev, struct if_settings *ifs)
> +{
> +	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
> +	te1_settings te1;
> +
> +	switch (ifs->type) {
> +	case IF_GET_IFACE:
> +		ifs->type = IF_IFACE_E1;
> +		if (ifs->size < sizeof(te1)) {
> +			if (!ifs->size)
> +				return 0; /* only type requested */
> +
> +			ifs->size = sizeof(te1); /* data size wanted */
> +			return -ENOBUFS;
> +		}
> +
> +		memset(&te1, 0, sizeof(te1));
> +
> +		/* Update slot_map */
> +		te1.slot_map = qmc_hdlc->slot_map;
> +
> +		if (copy_to_user(ifs->ifs_ifsu.te1, &te1, sizeof(te1)))
> +			return -EFAULT;
> +		return 0;
> +
> +	case IF_IFACE_E1:
> +	case IF_IFACE_T1:
> +		if (!capable(CAP_NET_ADMIN))
> +			return -EPERM;
> +
> +		if (netdev->flags & IFF_UP)
> +			return -EBUSY;
> +
> +		if (copy_from_user(&te1, ifs->ifs_ifsu.te1, sizeof(te1)))
> +			return -EFAULT;
> +
> +		return qmc_hdlc_set_iface(qmc_hdlc, ifs->type, &te1);
> +
> +	default:
> +		return hdlc_ioctl(netdev, ifs);
> +	}
> +}
> +
>  static int qmc_hdlc_open(struct net_device *netdev)
>  {
>  	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
> @@ -326,12 +466,13 @@ static const struct net_device_ops qmc_hdlc_netdev_ops = {
>  	.ndo_open       = qmc_hdlc_open,
>  	.ndo_stop       = qmc_hdlc_close,
>  	.ndo_start_xmit = hdlc_start_xmit,
> -	.ndo_siocwandev	= hdlc_ioctl,
> +	.ndo_siocwandev = qmc_hdlc_ioctl,
>  };
>  
>  static int qmc_hdlc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct qmc_chan_ts_info ts_info;
>  	struct qmc_hdlc *qmc_hdlc;
>  	struct qmc_chan_info info;
>  	hdlc_device *hdlc;
> @@ -357,6 +498,14 @@ static int qmc_hdlc_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, -EINVAL, "QMC chan mode %d is not QMC_HDLC\n",
>  				     info.mode);
>  
> +	ret = qmc_chan_get_ts_info(qmc_hdlc->qmc_chan, &ts_info);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "get QMC channel ts info failed\n");
> +
> +	ret = qmc_hdlc_xlate_ts_info(qmc_hdlc, &ts_info, &qmc_hdlc->slot_map);
> +	if (ret)
> +		return ret;
> +
>  	qmc_hdlc->netdev = alloc_hdlcdev(qmc_hdlc);
>  	if (!qmc_hdlc->netdev)
>  		return -ENOMEM;
> -- 
> 2.43.0
