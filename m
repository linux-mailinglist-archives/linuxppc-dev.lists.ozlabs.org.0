Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AC33D4F85
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jul 2021 20:33:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GXsBG4ln4z30Mr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 04:33:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GXs9x3f3wz2yLQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 04:32:50 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GXs9q1cxpzBCTn;
 Sun, 25 Jul 2021 20:32:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qNNbYLWewUwJ; Sun, 25 Jul 2021 20:32:47 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GXs9q0Sj8zBCTX;
 Sun, 25 Jul 2021 20:32:47 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 5ED5A3D9; Sun, 25 Jul 2021 20:38:04 +0200 (CEST)
Received: from 37-165-12-41.coucou-networks.fr
 (37-165-12-41.coucou-networks.fr [37.165.12.41]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Sun, 25 Jul 2021 20:38:04 +0200
Date: Sun, 25 Jul 2021 20:38:04 +0200
Message-ID: <20210725203804.Horde.sruKcwZQKonIWKjB98332A2@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Geoff Levand <geoff@infradead.org>
Subject: Re: [PATCH v4 10/10] net/ps3_gelic: Fix DMA mapping problems
References: <cover.1627068552.git.geoff@infradead.org>
 <7aa1d9b1b4ffadcbdc6f88e4f8d4a323da307595.1627068552.git.geoff@infradead.org>
In-Reply-To: <7aa1d9b1b4ffadcbdc6f88e4f8d4a323da307595.1627068552.git.geoff@infradead.org>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Geoff Levand <geoff@infradead.org> a =C3=A9crit=C2=A0:

> Fixes several DMA mapping problems with the PS3's gelic network driver:
>
>  * Change from checking the return value of dma_map_single to using the
>    dma_mapping_error routine.
>  * Use the correct buffer length when mapping the RX skb.
>  * Improved error checking and debug logging.

The patch is quite big and probably deserves more explanation. For=20=20
instance,=20explain why the buffer length is not correct today.

Also as it is a bug fixing patch, it should include a 'fixes' tag, and=20=
=20
a=20Cc: to stable@vger.kernel.org. Also, when possible, bug fixes should=20=
=20
be=20one of the first patches in a series like that so that they can be=20=
=20
applied=20to stable without applying the whole series.

Christophe

>
> Fixes runtime errors like these, and also other randomly occurring errors=
:
>
>   IP-Config: Complete:
>   DMA-API: ps3_gelic_driver sb_05: device driver failed to check map erro=
r
>   WARNING: CPU: 0 PID: 0 at kernel/dma/debug.c:1027 .check_unmap+0x888/0x=
8dc
>
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  drivers/net/ethernet/toshiba/ps3_gelic_net.c | 183 +++++++++++--------
>  1 file changed, 108 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c=20=20
>=20b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> index 42f4de9ad5fe..11ddeacb1159 100644
> --- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> +++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> @@ -336,22 +336,31 @@ static int gelic_card_init_chain(struct=20=20
>=20gelic_card *card,
>  	struct gelic_descr_chain *chain, struct gelic_descr *start_descr,
>  	int descr_count)
>  {
> -	int i;
> -	struct gelic_descr *descr;
> +	struct gelic_descr *descr =3D start_descr;
>  	struct device *dev =3D ctodev(card);
> +	unsigned int index;
>
> -	descr =3D start_descr;
> -	memset(descr, 0, sizeof(*descr) *descr_count);
> +	memset(start_descr, 0, descr_count * sizeof(*start_descr));
>
> -	for (i =3D 0; i < descr_count; i++, descr++) {
> -		descr->link.size =3D sizeof(struct gelic_hw_regs);
> +	for (index =3D 0, descr =3D start_descr; index < descr_count;
> +		index++, descr++) {
>  		gelic_descr_set_status(descr, GELIC_DESCR_DMA_NOT_IN_USE);
> -		descr->link.cpu_addr =3D
> -			dma_map_single(dev, descr, descr->link.size,
> -				DMA_BIDIRECTIONAL);
>
> -		if (!descr->link.cpu_addr)
> -			goto iommu_error;
> +		descr->link.size =3D sizeof(struct gelic_hw_regs);
> +		descr->link.cpu_addr =3D dma_map_single(dev, descr,
> +			descr->link.size, DMA_BIDIRECTIONAL);
> +
> +		if (unlikely(dma_mapping_error(dev, descr->link.cpu_addr))) {
> +			dev_err(dev, "%s:%d: dma_mapping_error\n", __func__,
> +				__LINE__);
> +
> +			for (index--, descr--; index > 0; index--, descr--) {
> +				if (descr->link.cpu_addr) {
> +					gelic_unmap_link(dev, descr);
> +				}
> +			}
> +			return -ENOMEM;
> +		}
>
>  		descr->next =3D descr + 1;
>  		descr->prev =3D descr - 1;
> @@ -360,8 +369,9 @@ static int gelic_card_init_chain(struct gelic_card *c=
ard,
>  	(descr - 1)->next =3D start_descr;
>  	start_descr->prev =3D (descr - 1);
>
> -	descr =3D start_descr;
> -	for (i =3D 0; i < descr_count; i++, descr++) {
> +	/* chain bus addr of hw descriptor */
> +	for (index =3D 0, descr =3D start_descr; index < descr_count;
> +		index++, descr++) {
>  		descr->hw_regs.next_descr_addr =3D
>  			cpu_to_be32(descr->next->link.cpu_addr);
>  	}
> @@ -373,12 +383,6 @@ static int gelic_card_init_chain(struct=20=20
>=20gelic_card *card,
>  	(descr - 1)->hw_regs.next_descr_addr =3D 0;
>
>  	return 0;
> -
> -iommu_error:
> -	for (i--, descr--; 0 <=3D i; i--, descr--)
> -		if (descr->link.cpu_addr)
> -			gelic_unmap_link(dev, descr);
> -	return -ENOMEM;
>  }
>
>  /**
> @@ -395,49 +399,63 @@ static int gelic_descr_prepare_rx(struct=20=20
>=20gelic_card *card,
>  	struct gelic_descr *descr)
>  {
>  	struct device *dev =3D ctodev(card);
> -	int offset;
> -	unsigned int bufsize;
> +	struct aligned_buff {
> +		unsigned int total_bytes;
> +		unsigned int offset;
> +	};
> +	struct aligned_buff a_buf;
> +	dma_addr_t cpu_addr;
>
>  	if (gelic_descr_get_status(descr) !=3D  GELIC_DESCR_DMA_NOT_IN_USE) {
>  		dev_err(dev, "%s:%d: ERROR status\n", __func__, __LINE__);
>  	}
>
> -	/* we need to round up the buffer size to a multiple of 128 */
> -	bufsize =3D ALIGN(GELIC_NET_MAX_MTU, GELIC_NET_RXBUF_ALIGN);
> +	a_buf.total_bytes =3D ALIGN(GELIC_NET_MAX_MTU, GELIC_NET_RXBUF_ALIGN)
> +		+ GELIC_NET_RXBUF_ALIGN;
> +
> +	descr->skb =3D dev_alloc_skb(a_buf.total_bytes);
>
> -	/* and we need to have it 128 byte aligned, therefore we allocate a
> -	 * bit more */
> -	descr->skb =3D dev_alloc_skb(bufsize + GELIC_NET_RXBUF_ALIGN - 1);
>  	if (!descr->skb) {
> -		descr->hw_regs.payload.dev_addr =3D 0; /* tell DMAC don't touch memory=
 */
> +		descr->hw_regs.payload.dev_addr =3D 0;
> +		descr->hw_regs.payload.size =3D 0;
>  		return -ENOMEM;
>  	}
> -	descr->hw_regs.payload.size =3D cpu_to_be32(bufsize);
> +
> +	a_buf.offset =3D PTR_ALIGN(descr->skb->data, GELIC_NET_RXBUF_ALIGN)
> +		- descr->skb->data;
> +
> +	if (a_buf.offset) {
> +		dev_dbg(dev, "%s:%d: offset=3D%u\n", __func__, __LINE__,
> +			a_buf.offset);
> +		skb_reserve(descr->skb, a_buf.offset);
> +	}
> +
>  	descr->hw_regs.dmac_cmd_status =3D 0;
>  	descr->hw_regs.result_size =3D 0;
>  	descr->hw_regs.valid_size =3D 0;
>  	descr->hw_regs.data_error =3D 0;
>
> -	offset =3D ((unsigned long)descr->skb->data) &
> -		(GELIC_NET_RXBUF_ALIGN - 1);
> -	if (offset)
> -		skb_reserve(descr->skb, GELIC_NET_RXBUF_ALIGN - offset);
> -	/* io-mmu-map the skb */
> -	descr->hw_regs.payload.dev_addr =3D cpu_to_be32(dma_map_single(dev,
> -						     descr->skb->data,
> -						     GELIC_NET_MAX_MTU,
> -						     DMA_FROM_DEVICE));
> -	if (!descr->hw_regs.payload.dev_addr) {
> +	descr->hw_regs.payload.size =3D a_buf.total_bytes - a_buf.offset;
> +	cpu_addr =3D dma_map_single(dev, descr->skb->data,
> +		descr->hw_regs.payload.size, DMA_FROM_DEVICE);
> +	descr->hw_regs.payload.dev_addr =3D cpu_to_be32(cpu_addr);
> +
> +	if (unlikely(dma_mapping_error(dev, cpu_addr))) {
> +		dev_err(dev, "%s:%d: dma_mapping_error\n", __func__, __LINE__);
> +
> +		descr->hw_regs.payload.dev_addr =3D 0;
> +		descr->hw_regs.payload.size =3D 0;
> +
>  		dev_kfree_skb_any(descr->skb);
>  		descr->skb =3D NULL;
> -		dev_info(dev,
> -			 "%s:Could not iommu-map rx buffer\n", __func__);
> +
>  		gelic_descr_set_status(descr, GELIC_DESCR_DMA_NOT_IN_USE);
> +
>  		return -ENOMEM;
> -	} else {
> -		gelic_descr_set_status(descr, GELIC_DESCR_DMA_CARDOWNED);
> -		return 0;
>  	}
> +
> +	gelic_descr_set_status(descr, GELIC_DESCR_DMA_CARDOWNED);
> +	return 0;
>  }
>
>  /**
> @@ -454,13 +472,18 @@ static void gelic_card_release_rx_chain(struct=20=
=20
>=20gelic_card *card)
>  		if (descr->skb) {
>  			dma_unmap_single(dev,
>  				be32_to_cpu(descr->hw_regs.payload.dev_addr),
> -				descr->skb->len, DMA_FROM_DEVICE);
> -			descr->hw_regs.payload.dev_addr =3D 0;
> +				descr->hw_regs.payload.size, DMA_FROM_DEVICE);
> +
>  			dev_kfree_skb_any(descr->skb);
>  			descr->skb =3D NULL;
> +
>  			gelic_descr_set_status(descr,
>  				GELIC_DESCR_DMA_NOT_IN_USE);
>  		}
> +
> +		descr->hw_regs.payload.dev_addr =3D 0;
> +		descr->hw_regs.payload.size =3D 0;
> +
>  		descr =3D descr->next;
>  	} while (descr !=3D card->rx_chain.head);
>  }
> @@ -526,17 +549,19 @@ static void gelic_descr_release_tx(struct=20=20
>=20gelic_card *card,
>  		GELIC_DESCR_TX_TAIL));
>
>  	dma_unmap_single(dev, be32_to_cpu(descr->hw_regs.payload.dev_addr),
> -		skb->len, DMA_TO_DEVICE);
> -	dev_kfree_skb_any(skb);
> +		descr->hw_regs.payload.size, DMA_TO_DEVICE);
>
>  	descr->hw_regs.payload.dev_addr =3D 0;
>  	descr->hw_regs.payload.size =3D 0;
> +
> +	dev_kfree_skb_any(skb);
> +	descr->skb =3D NULL;
> +
>  	descr->hw_regs.next_descr_addr =3D 0;
>  	descr->hw_regs.result_size =3D 0;
>  	descr->hw_regs.valid_size =3D 0;
>  	descr->hw_regs.data_status =3D 0;
>  	descr->hw_regs.data_error =3D 0;
> -	descr->skb =3D NULL;
>
>  	gelic_descr_set_status(descr, GELIC_DESCR_DMA_NOT_IN_USE);
>  }
> @@ -565,31 +590,34 @@ static void gelic_card_wake_queues(struct=20=20
>=20gelic_card *card)
>  static void gelic_card_release_tx_chain(struct gelic_card *card, int sto=
p)
>  {
>  	struct gelic_descr_chain *tx_chain;
> -	enum gelic_descr_dma_status status;
>  	struct device *dev=20=3D ctodev(card);
> -	struct net_device *netdev;
> -	int release =3D 0;
> +	int release;
> +
> +	for (release =3D 0, tx_chain =3D &card->tx_chain;
> +		tx_chain->head !=3D tx_chain->tail && tx_chain->tail;
> +		tx_chain->tail =3D tx_chain->tail->next) {
> +		enum gelic_descr_dma_status status;
> +		struct gelic_descr *descr;
> +		struct net_device *netdev;
> +
> +		descr =3D tx_chain->tail;
> +		status =3D gelic_descr_get_status(descr);
> +		netdev =3D descr->skb->dev;
>
> -	for (tx_chain =3D &card->tx_chain;
> -	     tx_chain->head !=3D tx_chain->tail && tx_chain->tail;
> -	     tx_chain->tail =3D tx_chain->tail->next) {
> -		status =3D gelic_descr_get_status(tx_chain->tail);
> -		netdev =3D tx_chain->tail->skb->dev;
>  		switch (status) {
>  		case GELIC_DESCR_DMA_RESPONSE_ERROR:
>  		case GELIC_DESCR_DMA_PROTECTION_ERROR:
>  		case GELIC_DESCR_DMA_FORCE_END:
> -			 dev_info_ratelimited(dev,
> -					 "%s:%d: forcing end of tx descriptor with status %x\n",
> -					 __func__, __LINE__, status);
> +			dev_info_ratelimited(dev,
> +				"%s:%d: forcing end of tx descriptor with status %x\n",
> +				__func__, __LINE__, status);
>  			netdev->stats.tx_dropped++;
>  			break;
>
>  		case GELIC_DESCR_DMA_COMPLETE:
> -			if (tx_chain->tail->skb) {
> +			if (descr->skb) {
>  				netdev->stats.tx_packets++;
> -				netdev->stats.tx_bytes +=3D
> -					tx_chain->tail->skb->len;
> +				netdev->stats.tx_bytes +=3D descr->skb->len;
>  			}
>  			break;
>
> @@ -599,7 +627,7 @@ static void gelic_card_release_tx_chain(struct=20=20
>=20gelic_card *card, int stop)
>  			}
>  		}
>
> -		gelic_descr_release_tx(card, tx_chain->tail);
> +		gelic_descr_release_tx(card, descr);
>  		release++;
>  	}
>  out:
> @@ -703,19 +731,19 @@ int gelic_net_stop(struct net_device *netdev)
>   *
>   * returns the address of the next descriptor, or NULL if not available.
>   */
> -static struct gelic_descr *
> -gelic_card_get_next_tx_descr(struct gelic_card *card)
> +static struct gelic_descr *gelic_card_get_next_tx_descr(struct=20=20
>=20gelic_card *card)
>  {
>  	if (!card->tx_chain.head)
>  		return NULL;
> +
>  	/*  see if the next descriptor is free */
>  	if (card->tx_chain.tail !=3D card->tx_chain.head->next &&
> -		gelic_descr_get_status(card->tx_chain.head) =3D=3D
> -			GELIC_DESCR_DMA_NOT_IN_USE)
> +		(gelic_descr_get_status(card->tx_chain.head) =3D=3D
> +			GELIC_DESCR_DMA_NOT_IN_USE)) {
>  		return card->tx_chain.head;
> -	else
> -		return NULL;
> +	}
>
> +	return NULL;
>  }
>
>  /**
> @@ -809,18 +837,23 @@ static int gelic_descr_prepare_tx(struct=20=20
>=20gelic_card *card,
>  		if (!skb_tmp) {
>  			return -ENOMEM;
>  		}
> +
>  		skb =3D skb_tmp;
>  	}
>
> -	cpu_addr =3D dma_map_single(dev, skb->data, skb->len, DMA_TO_DEVICE);
> +	descr->hw_regs.payload.size =3D skb->len;
> +	cpu_addr =3D dma_map_single(dev, skb->data, descr->hw_regs.payload.size=
,
> +		DMA_TO_DEVICE);
> +	descr->hw_regs.payload.dev_addr =3D cpu_to_be32(cpu_addr);
>
> -	if (!cpu_addr) {
> +	if (unlikely(dma_mapping_error(dev, cpu_addr))) {
>  		dev_err(dev, "%s:%d: dma_mapping_error\n", __func__, __LINE__);
> +
> +		descr->hw_regs.payload.dev_addr =3D 0;
> +		descr->hw_regs.payload.size =3D 0;
>  		return -ENOMEM;
>  	}
>
> -	descr->hw_regs.payload.dev_addr =3D cpu_to_be32(cpu_addr);
> -	descr->hw_regs.payload.size =3D cpu_to_be32(skb->len);
>  	descr->skb =3D skb;
>  	descr->hw_regs.data_status =3D 0;
>  	descr->hw_regs.next_descr_addr =3D 0; /* terminate hw descr */
> @@ -948,9 +981,9 @@ static void gelic_net_pass_skb_up(struct=20=20
>=20gelic_descr *descr,
>
>  	data_status =3D be32_to_cpu(descr->hw_regs.data_status);
>  	data_error =3D be32_to_cpu(descr->hw_regs.data_error);
> -	/* unmap skb buffer */
> +
>  	dma_unmap_single(dev, be32_to_cpu(descr->hw_regs.payload.dev_addr),
> -			 GELIC_NET_MAX_MTU, DMA_FROM_DEVICE);
> +			 descr->hw_regs.payload.size, DMA_FROM_DEVICE);
>
>  	skb_put(skb, be32_to_cpu(descr->hw_regs.valid_size) ?
>  		be32_to_cpu(descr->hw_regs.valid_size) :
> --
> 2.25.1


