Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F26BC78756E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 18:33:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nFqLNEvP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWpYf0DBrz3cKV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 02:33:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nFqLNEvP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWpXn1rxPz3c5S
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 02:32:56 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7751FF805;
	Thu, 24 Aug 2023 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692894771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsZa7pZKZNbOWTMTAuaVYbIB0/GSiNJq7wZvQfer+ls=;
	b=nFqLNEvPxHjcfURhNwgVrXak5QCYFYuY/xVoa2IdayasepT7+bAW6cycLkh5qxW2v/blqb
	tIm3mQ5Vd8ytwAOyuhV3ZZOGkBO2OUcbGr1ZxCrLKW+ptuNJt4wNaLv3Xiq43vbcUs4q7h
	vfD5hXaYwMqEzhVXe+iOUgiiyYBTQr5qnIFUytGfxXFyG5bPC9G49VMll2D7OxAI1LWeVR
	PjTqnx2eyDwQWulJUtPAco2jbccZtAXUjq6YsfYQFfCqo/PvOaqu9s7dedj24KU02U8dGc
	5/DxtsUwOk7cg6s2XKm6BNMJ58dM27YmcBy9wLVI0DkEMhSL4xig+IzZEYRZzw==
Date: Thu, 24 Aug 2023 18:32:45 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v4 20/28] wan: qmc_hdlc: Add runtime timeslots changes
 support
Message-ID: <20230824183245.26bea22a@bootlin.com>
In-Reply-To: <cbdcf645-f473-f10c-a76e-feb6316d2a47@wanadoo.fr>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
	<1364a0742fc76e7d275273dbbc4c97b008ec70a5.1692376361.git.christophe.leroy@csgroup.eu>
	<cbdcf645-f473-f10c-a76e-feb6316d2a47@wanadoo.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Mon, 21 Aug 2023 07:40:26 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Le 18/08/2023 à 18:39, Christophe Leroy a écrit :
> > From: Herve Codina <herve.codina@bootlin.com>
> > 
> > QMC channels support runtime timeslots changes but nothing is done at
> > the QMC HDLC driver to handle these changes.
> > 
> > Use existing IFACE ioctl in order to configure the timeslots to use.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---  
> 
> Hi,
> 
> a few nits below, should there be a v5.
> 
> >   drivers/net/wan/fsl_qmc_hdlc.c | 169 ++++++++++++++++++++++++++++++++-
> >   1 file changed, 168 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hdlc.c
> > index 4f84ac5fc63e..4b8cb5761fd1 100644
> > --- a/drivers/net/wan/fsl_qmc_hdlc.c
> > +++ b/drivers/net/wan/fsl_qmc_hdlc.c
> > @@ -32,6 +32,7 @@ struct qmc_hdlc {
> >   	struct qmc_hdlc_desc tx_descs[8];
> >   	unsigned int tx_out;
> >   	struct qmc_hdlc_desc rx_descs[4];
> > +	u32 slot_map;
> >   };
> >   
> >   static inline struct qmc_hdlc *netdev_to_qmc_hdlc(struct net_device *netdev)
> > @@ -202,6 +203,162 @@ static netdev_tx_t qmc_hdlc_xmit(struct sk_buff *skb, struct net_device *netdev)
> >   	return NETDEV_TX_OK;
> >   }
> >   
> > +static int qmc_hdlc_xlate_slot_map(struct qmc_hdlc *qmc_hdlc,
> > +				   u32 slot_map, struct qmc_chan_ts_info *ts_info)
> > +{
> > +	u64 ts_mask_avail;
> > +	unsigned int bit;
> > +	unsigned int i;
> > +	u64 ts_mask;
> > +	u64 map = 0;  
> 
> This init looks useless.

Will be removed in the next iteration.

> 
> > +
> > +	/* Tx and Rx masks must be identical */
> > +	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
> > +		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
> > +			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ts_mask_avail = ts_info->rx_ts_mask_avail;
> > +	ts_mask = 0;
> > +	map = slot_map;
> > +	bit = 0;
> > +	for (i = 0; i < 64; i++) {
> > +		if (ts_mask_avail & BIT_ULL(i)) {
> > +			if (map & BIT_ULL(bit))
> > +				ts_mask |= BIT_ULL(i);
> > +			bit++;
> > +		}
> > +	}
> > +
> > +	if (hweight64(ts_mask) != hweight64(map)) {
> > +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots 0x%llx -> (0x%llx,0x%llx)\n",
> > +			map, ts_mask_avail, ts_mask);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ts_info->tx_ts_mask = ts_mask;
> > +	ts_info->rx_ts_mask = ts_mask;
> > +	return 0;
> > +}
> > +
> > +static int qmc_hdlc_xlate_ts_info(struct qmc_hdlc *qmc_hdlc,
> > +				  const struct qmc_chan_ts_info *ts_info, u32 *slot_map)
> > +{
> > +	u64 ts_mask_avail;
> > +	unsigned int bit;
> > +	unsigned int i;
> > +	u64 ts_mask;
> > +	u64 map = 0;  
> 
> This init looks useless.

Will be remove in the next iteration.

> 
> > +
> > +	/* Tx and Rx masks must be identical */
> > +	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
> > +		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
> > +			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
> > +		return -EINVAL;
> > +	}
> > +	if (ts_info->rx_ts_mask != ts_info->tx_ts_mask) {
> > +		dev_err(qmc_hdlc->dev, "tx and rx timeslots mismatch (0x%llx, 0x%llx)\n",
> > +			ts_info->rx_ts_mask, ts_info->tx_ts_mask);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ts_mask_avail = ts_info->rx_ts_mask_avail;
> > +	ts_mask = ts_info->rx_ts_mask;
> > +	map = 0;
> > +	bit = 0;
> > +	for (i = 0; i < 64; i++) {
> > +		if (ts_mask_avail & BIT_ULL(i)) {
> > +			if (ts_mask & BIT_ULL(i))
> > +				map |= BIT_ULL(bit);
> > +			bit++;
> > +		}
> > +	}
> > +
> > +	if (hweight64(ts_mask) != hweight64(map)) {
> > +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots (0x%llx,0x%llx) -> 0x%llx\n",
> > +			ts_mask_avail, ts_mask, map);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (map >= BIT_ULL(32)) {
> > +		dev_err(qmc_hdlc->dev, "Slot map out of 32bit (0x%llx,0x%llx) -> 0x%llx\n",
> > +			ts_mask_avail, ts_mask, map);
> > +		return -EINVAL;
> > +	}
> > +
> > +	*slot_map = map;
> > +	return 0;
> > +}  
> 
> ...
> 
> > +static int qmc_hdlc_ioctl(struct net_device *netdev, struct if_settings *ifs)
> > +{
> > +	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
> > +	te1_settings te1;
> > +
> > +	switch (ifs->type) {
> > +	case IF_GET_IFACE:
> > +		ifs->type = IF_IFACE_E1;
> > +		if (ifs->size < sizeof(te1)) {
> > +			if (!ifs->size)
> > +				return 0; /* only type requested */
> > +
> > +			ifs->size = sizeof(te1); /* data size wanted */
> > +			return -ENOBUFS;
> > +		}
> > +
> > +		memset(&te1, 0, sizeof(te1));
> > +
> > +		/* Update slot_map */
> > +		te1.slot_map = qmc_hdlc->slot_map;
> > +
> > +		if (copy_to_user(ifs->ifs_ifsu.te1, &te1,  sizeof(te1)))  
> 
>                                                           ~~
> Extra space.

Will be fixed in the next iteration.

> 
> > +			return -EFAULT;
> > +		return 0;
> > +
> > +	case IF_IFACE_E1:
> > +	case IF_IFACE_T1:
> > +		if (!capable(CAP_NET_ADMIN))
> > +			return -EPERM;
> > +
> > +		if (netdev->flags & IFF_UP)
> > +			return -EBUSY;
> > +
> > +		if (copy_from_user(&te1, ifs->ifs_ifsu.te1, sizeof(te1)))
> > +			return -EFAULT;
> > +
> > +		return qmc_hdlc_set_iface(qmc_hdlc, ifs->type, &te1);
> > +
> > +	default:
> > +		return hdlc_ioctl(netdev, ifs);
> > +	}
> > +}  
> 
> ...
> 

Thanks for the review,
Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
