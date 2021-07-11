Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8716E3C3D22
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jul 2021 16:05:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GN7vq0ZD1z3bhm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 00:05:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GN7vR6VRWz2yRT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 00:05:06 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GN7vM6GZjzBBcp;
 Sun, 11 Jul 2021 16:05:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GDO7VwwhrRVj; Sun, 11 Jul 2021 16:05:03 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GN7vM581PzBBZK;
 Sun, 11 Jul 2021 16:05:03 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 1B79E4B; Sun, 11 Jul 2021 16:10:09 +0200 (CEST)
Received: from 37.173.248.140 ([37.173.248.140]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Sun, 11 Jul 2021 16:10:09 +0200
Date: Sun, 11 Jul 2021 16:10:09 +0200
Message-ID: <20210711161009.Horde.-2XrOwgc5iHy9h_vEuG5zQ5@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Geoff Levand <geoff@infradead.org>
Subject: Re: [PATCH v3 2/2] net/ps3_gelic: Cleanups, improve logging
References: <cover.1625976141.git.geoff@infradead.org>
 <ffb7b2f4ac085986f563131e3851e07393cd514f.1625976141.git.geoff@infradead.org>
In-Reply-To: <ffb7b2f4ac085986f563131e3851e07393cd514f.1625976141.git.geoff@infradead.org>
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

> General source cleanups and improved logging messages.
>

Describe a bit more what you do to cleanup and improve.

Some of your changes are not cleanup , they increase the mess.


You should read kernel coding style

> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  drivers/net/ethernet/toshiba/ps3_gelic_net.c | 395 ++++++++++---------
>  1 file changed, 216 insertions(+), 179 deletions(-)
>
> diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c=20=20
>=20b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> index e01938128882..9dbcb7c4ec80 100644
> --- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> +++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> @@ -44,17 +44,17 @@ MODULE_AUTHOR("SCE Inc.");
>  MODULE_DESCRIPTION("Gelic Network driver");
>  MODULE_LICENSE("GPL");
>
> -
> -/* set irq_mask */
>  int gelic_card_set_irq_mask(struct gelic_card *card, u64 mask)
>  {
> +	struct device *dev =3D ctodev(card);
>  	int status;
>
>  	status =3D lv1_net_set_interrupt_mask(bus_id(card), dev_id(card),
>  					    mask, 0);
> -	if (status)
> -		dev_info(ctodev(card),
> -			 "%s failed %d\n", __func__, status);
> +	if (status) {


No { } for single lines

> +		dev_err(dev, "%s:%d failed: %d\n", __func__, __LINE__, status);
> +	}
> +
>  	return status;
>  }
>
> @@ -63,6 +63,7 @@ static void gelic_card_rx_irq_on(struct gelic_card *car=
d)
>  	card->irq_mask |=3D GELIC_CARD_RXINT;
>  	gelic_card_set_irq_mask(card, card->irq_mask);
>  }
> +
>  static void gelic_card_rx_irq_off(struct gelic_card *card)
>  {
>  	card->irq_mask &=3D ~GELIC_CARD_RXINT;
> @@ -70,15 +71,14 @@ static void gelic_card_rx_irq_off(struct=20=20
>=20gelic_card *card)
>  }
>
>  static void gelic_card_get_ether_port_status(struct gelic_card *card,
> -					     int inform)
> +	int inform)

Bad indent

>  {
>  	u64 v2;
>  	struct net_device *ether_netdev;
>
>  	lv1_net_control(bus_id(card), dev_id(card),
> -			GELIC_LV1_GET_ETH_PORT_STATUS,
> -			GELIC_LV1_VLAN_TX_ETHERNET_0, 0, 0,
> -			&card->ether_port_status, &v2);
> +		GELIC_LV1_GET_ETH_PORT_STATUS, GELIC_LV1_VLAN_TX_ETHERNET_0, 0,
> +		0, &card->ether_port_status, &v2);

Bad indent

>
>  	if (inform) {
>  		ether_netdev =3D card->netdev[GELIC_PORT_ETHERNET_0];
> @@ -105,15 +105,17 @@ gelic_descr_get_status(struct gelic_descr *descr)
>
>  static int gelic_card_set_link_mode(struct gelic_card *card, int mode)
>  {
> +	struct device *dev =3D ctodev(card);
>  	int status;
>  	u64 v1, v2;
>
>  	status =3D lv1_net_control(bus_id(card), dev_id(card),
> -				 GELIC_LV1_SET_NEGOTIATION_MODE,
> -				 GELIC_LV1_PHY_ETHERNET_0, mode, 0, &v1, &v2);
> +		GELIC_LV1_SET_NEGOTIATION_MODE, GELIC_LV1_PHY_ETHERNET_0, mode,
> +		0, &v1, &v2);
> +
>  	if (status) {
> -		pr_info("%s: failed setting negotiation mode %d\n", __func__,
> -			status);
> +		dev_err(dev, "%s:%d: Failed setting negotiation mode: %d\n",
> +			__func__, __LINE__, status);
>  		return -EBUSY;
>  	}
>
> @@ -130,13 +132,16 @@ static int gelic_card_set_link_mode(struct=20=20
>=20gelic_card *card, int mode)
>   */
>  static void gelic_card_disable_txdmac(struct gelic_card *card)
>  {
> +	struct device *dev =3D ctodev(card);
>  	int status;
>
>  	/* this hvc blocks until the DMA in progress really stopped */
>  	status =3D lv1_net_stop_tx_dma(bus_id(card), dev_id(card));
> -	if (status)
> -		dev_err(ctodev(card),
> -			"lv1_net_stop_tx_dma failed, status=3D%d\n", status);
> +
> +	if (status) {
> +		dev_err(dev, "%s:%d: lv1_net_stop_tx_dma failed: %d\n",
> +			__func__, __LINE__, status);
> +	}
>  }
>
>  /**
> @@ -187,13 +192,16 @@ static void gelic_card_enable_rxdmac(struct=20=20
>=20gelic_card *card)
>   */
>  static void gelic_card_disable_rxdmac(struct gelic_card *card)
>  {
> +	struct device *dev =3D ctodev(card);
>  	int status;
>
>  	/* this hvc blocks until the DMA in progress really stopped */
>  	status =3D lv1_net_stop_rx_dma(bus_id(card), dev_id(card));
> -	if (status)
> -		dev_err(ctodev(card),
> -			"lv1_net_stop_rx_dma failed, %d\n", status);
> +
> +	if (status) {
> +		dev_err(dev, "%s:%d: lv1_net_stop_rx_dma failed: %d\n",
> +			__func__, __LINE__, status);
> +	}
>  }
>
>  /**
> @@ -216,6 +224,7 @@ static void gelic_descr_set_status(struct=20=20
>=20gelic_descr *descr,
>  	 * Usually caller of this function wants to inform that to the
>  	 * hardware, so we assure here the hardware sees the change.
>  	 */
> +

Bad blank line, it separates the comment from the commentee


>  	wmb();
>  }
>
> @@ -229,8 +238,7 @@ static void gelic_descr_set_status(struct=20=20
>=20gelic_descr *descr,
>   * and re-initialize the hardware chain for later use
>   */
>  static void gelic_card_reset_chain(struct gelic_card *card,
> -				   struct gelic_descr_chain *chain,
> -				   struct gelic_descr *start_descr)
> +	struct gelic_descr_chain *chain, struct gelic_descr *start_descr)
>  {
>  	struct gelic_descr *descr;
>
> @@ -248,45 +256,41 @@ static void gelic_card_reset_chain(struct=20=20
>=20gelic_card *card,
>
>  void gelic_card_up(struct gelic_card *card)
>  {
> -	pr_debug("%s: called\n", __func__);
> +	struct device *dev =3D ctodev(card);
> +
>  	mutex_lock(&card->updown_lock);
>  	if (atomic_inc_return(&card->users) =3D=3D 1) {
> -		pr_debug("%s: real do\n", __func__);
> -		/* enable irq */
> +		dev_dbg(dev, "%s:%d: Starting...\n", __func__, __LINE__);
>  		gelic_card_set_irq_mask(card, card->irq_mask);
> -		/* start rx */
>  		gelic_card_enable_rxdmac(card);
> -
>  		napi_enable(&card->napi);
>  	}
>  	mutex_unlock(&card->updown_lock);
> -	pr_debug("%s: done\n", __func__);
>  }
>
>  void gelic_card_down(struct gelic_card *card)
>  {
> +	struct device *dev =3D ctodev(card);
>  	u64 mask;
> -	pr_debug("%s: called\n", __func__);
> +
>  	mutex_lock(&card->updown_lock);
>  	if (atomic_dec_if_positive(&card->users) =3D=3D 0) {
> -		pr_debug("%s: real do\n", __func__);
> +		dev_dbg(dev, "%s:%d: Stopping...\n", __func__, __LINE__);
>  		napi_disable(&card->napi);
>  		/*
> -		 * Disable irq. Wireless interrupts will
> -		 * be disabled later if any
> +		 * Disable irq. Wireless interrupts will be disabled later.
>  		 */
>  		mask =3D card->irq_mask & (GELIC_CARD_WLAN_EVENT_RECEIVED |
> -					 GELIC_CARD_WLAN_COMMAND_COMPLETED);
> +			GELIC_CARD_WLAN_COMMAND_COMPLETED);
>  		gelic_card_set_irq_mask(card, mask);
> -		/* stop rx */
> +
>  		gelic_card_disable_rxdmac(card);
>  		gelic_card_reset_chain(card, &card->rx_chain,
> -				       card->descr + GELIC_NET_TX_DESCRIPTORS);
> -		/* stop tx */
> +			card->descr + GELIC_NET_TX_DESCRIPTORS);
> +
>  		gelic_card_disable_txdmac(card);
>  	}
>  	mutex_unlock(&card->updown_lock);
> -	pr_debug("%s: done\n", __func__);
>  }
>
>  static void gelic_unmap_link(struct device *dev, struct gelic_descr *des=
cr)
> @@ -652,6 +656,7 @@ static void gelic_card_release_tx_chain(struct=20=20
>=20gelic_card *card, int stop)
>  void gelic_net_set_multi(struct net_device *netdev)
>  {
>  	struct gelic_card *card =3D netdev_card(netdev);
> +	struct device *dev =3D ctodev(card);
>  	struct netdev_hw_addr *ha;
>  	unsigned int i;
>  	uint8_t *p;
> @@ -661,27 +666,31 @@ void gelic_net_set_multi(struct net_device *netdev)
>  	/* clear all multicast address */
>  	status =3D lv1_net_remove_multicast_address(bus_id(card), dev_id(card),
>  						  0, 1);
> -	if (status)
> -		dev_err(ctodev(card),
> -			"lv1_net_remove_multicast_address failed %d\n",
> -			status);
> +	if (status) {
> +		dev_err(dev,
> +			"%s:%d: lv1_net_remove_multicast_address failed %d\n",
> +			__func__, __LINE__, status);
> +	}
> +
>  	/* set broadcast address */
>  	status =3D lv1_net_add_multicast_address(bus_id(card), dev_id(card),
>  					       GELIC_NET_BROADCAST_ADDR, 0);
> -	if (status)
> -		dev_err(ctodev(card),
> -			"lv1_net_add_multicast_address failed, %d\n",
> -			status);
> +	if (status) {
> +		dev_err(dev,
> +			"%s:%d: lv1_net_add_multicast_address failed, %d\n",
> +			__func__, __LINE__, status);
> +	}
>
>  	if ((netdev->flags & IFF_ALLMULTI) ||
>  	    (netdev_mc_count(netdev) > GELIC_NET_MC_COUNT_MAX)) {
>  		status =3D lv1_net_add_multicast_address(bus_id(card),
>  						       dev_id(card),
>  						       0, 1);
> -		if (status)
> -			dev_err(ctodev(card),
> -				"lv1_net_add_multicast_address failed, %d\n",
> -=09=09=09=09status);
> +		if (status) {
> +			dev_err(dev,
> +				"%s:%d: lv1_net_add_multicast_address failed, %d\n",
> +				__func__, __LINE__, status);
> +		}
>  		return;
>  	}
>
> @@ -694,12 +703,13 @@ void gelic_net_set_multi(struct net_device *netdev)
>  			addr |=3D *p++;
>  		}
>  		status =3D lv1_net_add_multicast_address(bus_id(card),
> -						       dev_id(card),
> -						       addr, 0);
> -		if (status)
> -			dev_err(ctodev(card),
> -				"lv1_net_add_multicast_address failed, %d\n",
> -				status);
> +			dev_id(card), addr, 0);
> +
> +		if (status) {
> +			dev_err(dev,
> +				"%s:%d: lv1_net_add_multicast_address failed, %d\n",
> +				__func__, __LINE__, status);
> +		}
>  	}
>  }
>
> @@ -711,17 +721,17 @@ void gelic_net_set_multi(struct net_device *netdev)
>   */
>  int gelic_net_stop(struct net_device *netdev)
>  {
> -	struct gelic_card *card;
> +	struct gelic_card *card =3D netdev_card(netdev);
> +	struct device *dev =3D ctodev(card);
>
> -	pr_debug("%s: start\n", __func__);
> +	dev_dbg(dev, "%s:%d: >\n", __func__, __LINE__);
>
>  	netif_stop_queue(netdev);
>  	netif_carrier_off(netdev);
>
> -	card =3D netdev_card(netdev);
>  	gelic_card_down(card);
>
> -	pr_debug("%s: done\n", __func__);
> +	dev_dbg(dev, "%s:%d: <\n", __func__, __LINE__);
>  	return 0;
>  }
>
> @@ -736,14 +746,15 @@ gelic_card_get_next_tx_descr(struct gelic_card *car=
d)
>  {
>  	if (!card->tx_chain.head)
>  		return NULL;
> +
>  	/*  see if the next descriptor is free */
> -	if (card->tx_chain.tail !=3D card->tx_chain.head->next &&
> -	    gelic_descr_get_status(card->tx_chain.head) =3D=3D
> -	    GELIC_DESCR_DMA_NOT_IN_USE)
> +	if ((card->tx_chain.tail !=3D card->tx_chain.head->next)
> +		&& (gelic_descr_get_status(card->tx_chain.head)
> +		=3D=3D GELIC_DESCR_DMA_NOT_IN_USE)) {
>  		return card->tx_chain.head;
> -	else
> -		return NULL;
> +	}
>
> +	return NULL;
>  }
>
>  /**
> @@ -787,14 +798,15 @@ static void gelic_descr_set_tx_cmdstat(struct=20=20
>=20gelic_descr *descr,
>  }
>
>  static struct sk_buff *gelic_put_vlan_tag(struct sk_buff *skb,
> -						 unsigned short tag)
> +	unsigned short tag)
>  {
>  	struct vlan_ethhdr *veth;
>  	static unsigned int c;
>
>  	if (skb_headroom(skb) < VLAN_HLEN) {
>  		struct sk_buff *sk_tmp =3D skb;
> -		pr_debug("%s: hd=3D%d c=3D%ud\n", __func__, skb_headroom(skb), c);
> +		pr_debug("%s:%d: hd=3D%d c=3D%ud\n", __func__, __LINE__,
> +			skb_headroom(skb), c);
>  		skb =3D skb_realloc_headroom(sk_tmp, VLAN_HLEN);
>  		if (!skb)
>  			return NULL;
> @@ -818,7 +830,6 @@ static struct sk_buff *gelic_put_vlan_tag(struct=20=
=20
>=20sk_buff *skb,
>   * @skb: packet to use
>   *
>   * returns 0 on success, <0 on failure.
> - *
>   */
>  static int gelic_descr_prepare_tx(struct gelic_card *card,
>  	struct gelic_descr *descr, struct sk_buff *skb)
> @@ -1161,9 +1172,9 @@ static int gelic_net_poll(struct napi_struct=20=20
>=20*napi, int budget)
>  	int packets_done =3D 0;
>
>  	while (packets_done < budget) {
> -		if (!gelic_card_decode_one_descr(card))
> +		if (!gelic_card_decode_one_descr(card)) {
>  			break;
> -
> +		}
>  		packets_done++;
>  	}
>
> @@ -1171,6 +1182,7 @@ static int gelic_net_poll(struct napi_struct=20=20
>=20*napi, int budget)
>  		napi_complete_done(napi, packets_done);
>  		gelic_card_rx_irq_on(card);
>  	}
> +
>  	return packets_done;
>  }
>
> @@ -1185,8 +1197,9 @@ static irqreturn_t gelic_card_interrupt(int=20=20
>=20irq, void *ptr)
>
>  	status =3D card->irq_status;
>
> -	if (!status)
> +	if (!status) {
>  		return IRQ_NONE;
> +	}
>
>  	status &=3D card->irq_mask;
>
> @@ -1205,13 +1218,15 @@ static irqreturn_t gelic_card_interrupt(int=20=20
>=20irq, void *ptr)
>  	}
>
>  	/* ether port status changed */
> -	if (status & GELIC_CARD_PORT_STATUS_CHANGED)
> +	if (status & GELIC_CARD_PORT_STATUS_CHANGED) {
>  		gelic_card_get_ether_port_status(card, 1);
> +	}
>
>  #ifdef CONFIG_GELIC_WIRELESS
>  	if (status & (GELIC_CARD_WLAN_EVENT_RECEIVED |
> -		      GELIC_CARD_WLAN_COMMAND_COMPLETED))
> +		GELIC_CARD_WLAN_COMMAND_COMPLETED)) {
>  		gelic_wl_interrupt(card->netdev[GELIC_PORT_WIRELESS], status);
> +	}
>  #endif
>
>  	return IRQ_HANDLED;
> @@ -1247,19 +1262,16 @@ int gelic_net_open(struct net_device *netdev)
>  {
>  	struct gelic_card *card =3D netdev_card(netdev);
>
> -	dev_dbg(ctodev(card), " -> %s %p\n", __func__, netdev);
> -
>  	gelic_card_up(card);
>
>  	netif_start_queue(netdev);
>  	gelic_card_get_ether_port_status(card, 1);
>
> -	dev_dbg(ctodev(card), " <- %s\n", __func__);
>  	return 0;
>  }
>
>  void gelic_net_get_drvinfo(struct net_device *netdev,
> -			   struct ethtool_drvinfo *info)
> +	struct ethtool_drvinfo *info)
>  {
>  	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
>  	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
> @@ -1317,11 +1329,11 @@ static int=20=20
>=20gelic_ether_get_link_ksettings(struct net_device *netdev,
>  	return 0;
>  }
>
> -static int
> -gelic_ether_set_link_ksettings(struct net_device *netdev,
> -			       const struct ethtool_link_ksettings *cmd)
> +static int gelic_ether_set_link_ksettings(struct net_device *netdev,
> +	const struct ethtool_link_ksettings *cmd)
>  {
>  	struct gelic_card *card =3D netdev_card(netdev);
> +	struct device *dev =3D ctodev(card);
>  	u64 mode;
>  	int ret;
>
> @@ -1341,94 +1353,100 @@ gelic_ether_set_link_ksettings(struct=20=20
>=20net_device *netdev,
>  		default:
>  			return -EINVAL;
>  		}
> +
>  		if (cmd->base.duplex =3D=3D DUPLEX_FULL) {
>  			mode |=3D GELIC_LV1_ETHER_FULL_DUPLEX;
>  		} else if (cmd->base.speed =3D=3D SPEED_1000) {
> -			pr_info("1000 half duplex is not supported.\n");
> +			dev_dbg(dev,
> +				"%s:%d: 1000 half duplex is not supported.\n",
> +				__func__, __LINE__);
>  			return -EINVAL;
>  		}
>  	}
>
>  	ret =3D gelic_card_set_link_mode(card, mode);
>
> -	if (ret)
> +	if (ret) {
>  		return ret;
> +	}
>
>  	return 0;
>  }
>
>  static void gelic_net_get_wol(struct net_device *netdev,
> -			      struct ethtool_wolinfo *wol)
> +	struct ethtool_wolinfo *wol)
>  {
> -	if (0 <=3D ps3_compare_firmware_version(2, 2, 0))
> +	if (0 <=3D ps3_compare_firmware_version(2, 2, 0)) {
>  		wol->supported =3D WAKE_MAGIC;
> -	else
> +	} else {
>  		wol->supported =3D 0;
> +	}
>
>  	wol->wolopts =3D ps3_sys_manager_get_wol() ? wol->supported : 0;
>  	memset(&wol->sopass, 0, sizeof(wol->sopass));
>  }
> +
>  static int gelic_net_set_wol(struct net_device *netdev,
> -			     struct ethtool_wolinfo *wol)
> +	struct ethtool_wolinfo *wol)
>  {
> +	struct gelic_card *card =3D netdev_card(netdev);
> +	struct device *dev =3D ctodev(card);
>  	int status;
> -	struct gelic_card *card;
>  	u64 v1, v2;
>
>  	if (ps3_compare_firmware_version(2, 2, 0) < 0 ||
> -	    !capable(CAP_NET_ADMIN))
> +		!capable(CAP_NET_ADMIN)) {
>  		return -EPERM;
> +	}
>
> -	if (wol->wolopts & ~WAKE_MAGIC)
> +	if (wol->wolopts & ~WAKE_MAGIC) {
>  		return -EINVAL;
> +	}
>
> -	card =3D netdev_card(netdev);
>  	if (wol->wolopts & WAKE_MAGIC) {
>  		status =3D lv1_net_control(bus_id(card), dev_id(card),
> -					 GELIC_LV1_SET_WOL,
> -					 GELIC_LV1_WOL_MAGIC_PACKET,
> -					 0, GELIC_LV1_WOL_MP_ENABLE,
> -					 &v1, &v2);
> +			GELIC_LV1_SET_WOL, GELIC_LV1_WOL_MAGIC_PACKET, 0,
> +			GELIC_LV1_WOL_MP_ENABLE, &v1, &v2);
> +
>  		if (status) {
> -			pr_info("%s: enabling WOL failed %d\n", __func__,
> -				status);
> +			dev_dbg(dev, "%s:%d: enabling WOL failed: %d\n",
> +				__func__, __LINE__, status);
>  			status =3D -EIO;
>  			goto done;
>  		}
> +
>  		status =3D lv1_net_control(bus_id(card), dev_id(card),
> -					 GELIC_LV1_SET_WOL,
> -					 GELIC_LV1_WOL_ADD_MATCH_ADDR,
> -					 0, GELIC_LV1_WOL_MATCH_ALL,
> -					 &v1, &v2);
> -		if (!status)
> +			GELIC_LV1_SET_WOL, GELIC_LV1_WOL_ADD_MATCH_ADDR, 0,
> +			GELIC_LV1_WOL_MATCH_ALL, &v1, &v2);
> +
> +		if (!status) {
>  			ps3_sys_manager_set_wol(1);
> -		else {
> -			pr_info("%s: enabling WOL filter failed %d\n",
> -				__func__, status);
> +		} else {
> +			dev_dbg(dev, "%s:%d: Enabling WOL filter failed: %d\n",
> +				__func__, __LINE__, status);
>  			status =3D -EIO;
>  		}
>  	} else {
>  		status =3D lv1_net_control(bus_id(card), dev_id(card),
> -					 GELIC_LV1_SET_WOL,
> -					 GELIC_LV1_WOL_MAGIC_PACKET,
> -					 0, GELIC_LV1_WOL_MP_DISABLE,
> -					 &v1, &v2);
> +			GELIC_LV1_SET_WOL, GELIC_LV1_WOL_MAGIC_PACKET, 0,
> +=09		GELIC_LV1_WOL_MP_DISABLE, &v1, &v2);
> +
>  		if (status) {
> -			pr_info("%s: disabling WOL failed %d\n", __func__,
> -				status);
> +			dev_dbg(dev, "%s:%d: Disabling WOL failed: %d\n",
> +				__func__, __LINE__, status);
>  			status =3D -EIO;
>  			goto done;
>  		}
> +
>  		status =3D lv1_net_control(bus_id(card), dev_id(card),
> -					 GELIC_LV1_SET_WOL,
> -					 GELIC_LV1_WOL_DELETE_MATCH_ADDR,
> -					 0, GELIC_LV1_WOL_MATCH_ALL,
> -					 &v1, &v2);
> +			GELIC_LV1_SET_WOL, GELIC_LV1_WOL_DELETE_MATCH_ADDR, 0,
> +			GELIC_LV1_WOL_MATCH_ALL, &v1, &v2);
> +
>  		if (!status)
>  			ps3_sys_manager_set_wol(0);
>  		else {
> -			pr_info("%s: removing WOL filter failed %d\n",
> -				__func__, status);
> +			dev_dbg(dev, "%s:%d: Removing WOL filter failed: %d\n",
> +				__func__, __LINE__, status);
>  			status =3D -EIO;
>  		}
>  	}
> @@ -1445,6 +1463,11 @@ static const struct ethtool_ops=20=20
>=20gelic_ether_ethtool_ops =3D {
>  	.set_link_ksettings =3D gelic_ether_set_link_ksettings,
>  };
>
> +static struct gelic_card *gelic_work_to_card(struct work_struct *work)
> +{
> +	return container_of(work, struct gelic_card, tx_timeout_task);
> +}
> +
>  /**
>   * gelic_net_tx_timeout_task - task scheduled by the watchdog timeout
>   * function (to be called not under interrupt status)
> @@ -1454,14 +1477,15 @@ static const struct ethtool_ops=20=20
>=20gelic_ether_ethtool_ops =3D {
>   */
>  static void gelic_net_tx_timeout_task(struct work_struct *work)
>  {
> -	struct gelic_card *card =3D
> -		container_of(work, struct gelic_card, tx_timeout_task);
> +	struct gelic_card *card =3D gelic_work_to_card(work);
>  	struct net_device *netdev =3D card->netdev[GELIC_PORT_ETHERNET_0];
> +	struct device *dev =3D ctodev(card);
>
> -	dev_info(ctodev(card), "%s:Timed out. Restarting...\n", __func__);
> +	dev_info(dev, "%s:%d: Timed out. Restarting...\n", __func__, __LINE__);
>
> -	if (!(netdev->flags & IFF_UP))
> +	if (!(netdev->flags & IFF_UP)) {
>  		goto out;
> +	}
>
>  	netif_device_detach(netdev);
>  	gelic_net_stop(netdev);
> @@ -1486,10 +1510,12 @@ void gelic_net_tx_timeout(struct net_device=20=20
>=20*netdev, unsigned int txqueue)
>
>  	card =3D netdev_card(netdev);
>  	atomic_inc(&card->tx_timeout_task_counter);
> -	if (netdev->flags & IFF_UP)
> +
> +	if (netdev->flags & IFF_UP) {
>  		schedule_work(&card->tx_timeout_task);
> -	else
> +	} else {
>  		atomic_dec(&card->tx_timeout_task_counter);
> +	}
>  }
>
>  static const struct net_device_ops gelic_netdevice_ops =3D {
> @@ -1513,7 +1539,7 @@ static const struct net_device_ops=20=20
>=20gelic_netdevice_ops =3D {
>   * fills out function pointers in the net_device structure
>   */
>  static void gelic_ether_setup_netdev_ops(struct net_device *netdev,
> -					 struct napi_struct *napi)
> +	struct napi_struct *napi)
>  {
>  	netdev->watchdog_timeo =3D GELIC_NET_WATCHDOG_TIMEOUT;
>  	/* NAPI */
> @@ -1534,25 +1560,28 @@ static void=20=20
>=20gelic_ether_setup_netdev_ops(struct net_device *netdev,
>   **/
>  int gelic_net_setup_netdev(struct net_device *netdev, struct=20=20
>=20gelic_card *card)
>  {
> +	struct device *dev =3D ctodev(card);
>  	int status;
>  	u64 v1, v2;
>
>  	netdev->hw_features =3D NETIF_F_IP_CSUM | NETIF_F_RXCSUM;
> -
>  	netdev->features =3D NETIF_F_IP_CSUM;
> -	if (GELIC_CARD_RX_CSUM_DEFAULT)
> +
> +	if (GELIC_CARD_RX_CSUM_DEFAULT) {
>  		netdev->features |=3D NETIF_F_RXCSUM;
> +	}
>
>  	status =3D lv1_net_control(bus_id(card), dev_id(card),
> -				 GELIC_LV1_GET_MAC_ADDRESS,
> -				 0, 0, 0, &v1, &v2);
> +		GELIC_LV1_GET_MAC_ADDRESS, 0, 0, 0, &v1, &v2);
> +
>  	v1 <<=3D 16;
> +
>  	if (status || !is_valid_ether_addr((u8 *)&v1)) {
> -		dev_info(ctodev(card),
> -			 "%s:lv1_net_control GET_MAC_ADDR failed %d\n",
> -			 __func__, status);
> +		dev_dbg(dev, "%s:%d: lv1_net_control GET_MAC_ADDR failed: %d\n",
> +				__func__, __LINE__, status);
>  		return -EINVAL;
>  	}
> +
>  	memcpy(netdev->dev_addr, &v1, ETH_ALEN);
>
>  	if (card->vlan_required) {
> @@ -1569,13 +1598,15 @@ int gelic_net_setup_netdev(struct net_device=20=
=20
>=20*netdev, struct gelic_card *card)
>  	netdev->max_mtu =3D GELIC_NET_MAX_MTU;
>
>  	status =3D register_netdev(netdev);
> +
>  	if (status) {
> -		dev_err(ctodev(card), "%s:Couldn't register %s %d\n",
> -			__func__, netdev->name, status);
> +		dev_err(dev, "%s:%d: Couldn't register %s: %d\n", __func__,
> +			__LINE__, netdev->name, status);
>  		return status;
>  	}
> -	dev_info(ctodev(card), "%s: MAC addr %pM\n",
> -		 netdev->name, netdev->dev_addr);
> +
> +	dev_info(dev, "%s:%d: %s MAC addr %pxM\n", __func__, __LINE__,
> +		netdev->name, netdev->dev_addr);
>
>  	return 0;
>  }
> @@ -1600,34 +1631,33 @@ static struct gelic_card=20=20
>=20*gelic_alloc_card_net(struct net_device **netdev)
>  	 */
>  	BUILD_BUG_ON(offsetof(struct gelic_card, irq_status) % 8);
>  	BUILD_BUG_ON(offsetof(struct gelic_card, descr) % 32);
> -	alloc_size =3D
> -		sizeof(struct gelic_card) +
> +
> +	alloc_size =3D sizeof(struct gelic_card) +
>  		sizeof(struct gelic_descr) * GELIC_NET_RX_DESCRIPTORS +
>  		sizeof(struct gelic_descr) * GELIC_NET_TX_DESCRIPTORS +
>  		GELIC_ALIGN - 1;
>
>  	p  =3D kzalloc(alloc_size, GFP_KERNEL);
> -	if (!p)
> +
> +	if (!p) {
>  		return NULL;
> +	}
> +
>  	card =3D PTR_ALIGN(p, GELIC_ALIGN);
>  	card->unalign =3D p;
>
> -	/*
> -	 * alloc netdev
> -	 */
>  	*netdev =3D alloc_etherdev(sizeof(struct gelic_port));
> +
>  	if (!*netdev) {
>  		kfree(card->unalign);
>  		return NULL;
>  	}
> -	port =3D netdev_priv(*netdev);
>
> -	/* gelic_port */
> +	port =3D netdev_priv(*netdev);
>  	port->netdev =3D *netdev;
>  	port->card =3D card;
>  	port->type =3D GELIC_PORT_ETHERNET_0;
>
> -	/* gelic_card */
>  	card->netdev[GELIC_PORT_ETHERNET_0] =3D *netdev;
>
>  	INIT_WORK(&card->tx_timeout_task, gelic_net_tx_timeout_task);
> @@ -1641,13 +1671,15 @@ static struct gelic_card=20=20
>=20*gelic_alloc_card_net(struct net_device **netdev)
>
>  static void gelic_card_get_vlan_info(struct gelic_card *card)
>  {
> +	struct device *dev =3D ctodev(card);
> +	unsigned int i;
>  	u64 v1, v2;
>  	int status;
> -	unsigned int i;
> -	struct {
> +	struct vlan_id {
>  		int tx;
>  		int rx;
> -	} vlan_id_ix[2] =3D {
> +	};
> +	struct vlan_id vlan_id_ix[2] =3D {
>  		[GELIC_PORT_ETHERNET_0] =3D {
>  			.tx =3D GELIC_LV1_VLAN_TX_ETHERNET_0,
>  			.rx =3D GELIC_LV1_VLAN_RX_ETHERNET_0
> @@ -1661,38 +1693,44 @@ static void gelic_card_get_vlan_info(struct=20=20
>=20gelic_card *card)
>  	for (i =3D 0; i < ARRAY_SIZE(vlan_id_ix); i++) {
>  		/* tx tag */
>  		status =3D lv1_net_control(bus_id(card), dev_id(card),
> -					 GELIC_LV1_GET_VLAN_ID,
> -					 vlan_id_ix[i].tx,
> -					 0, 0, &v1, &v2);
> +			GELIC_LV1_GET_VLAN_ID,	vlan_id_ix[i].tx, 0, 0, &v1,
> +			&v2);
> +
>  		if (status || !v1) {
> -			if (status !=3D LV1_NO_ENTRY)
> -				dev_dbg(ctodev(card),
> -					"get vlan id for tx(%d) failed(%d)\n",
> -					vlan_id_ix[i].tx, status);
> +			if (status !=3D LV1_NO_ENTRY) {
> +				dev_dbg(dev,
> +					"%s:%d: Get vlan id for tx(%d) failed: %d\n",
> +					__func__, __LINE__, vlan_id_ix[i].tx,
> +					status);
> +			}
>  			card->vlan[i].tx =3D 0;
>  			card->vlan[i].rx =3D 0;
>  			continue;
>  		}
> +
>  		card->vlan[i].tx =3D (u16)v1;
>
>  		/* rx tag */
>  		status =3D lv1_net_control(bus_id(card), dev_id(card),
> -					 GELIC_LV1_GET_VLAN_ID,
> -					 vlan_id_ix[i].rx,
> -					 0, 0, &v1, &v2);
> +			GELIC_LV1_GET_VLAN_ID, vlan_id_ix[i].rx, 0, 0, &v1,
> +			&v2);
> +
>  		if (status || !v1) {
> -			if (status !=3D LV1_NO_ENTRY)
> -				dev_info(ctodev(card),
> -					 "get vlan id for rx(%d) failed(%d)\n",
> -					 vlan_id_ix[i].rx, status);
> +			if (status !=3D LV1_NO_ENTRY) {
> +				dev_dbg(dev,
> +					"%s:%d: Get vlan id for rx(%d) failed: %d\n",
> +					__func__, __LINE__, vlan_id_ix[i].rx,
> +					status);
> +			}
>  			card->vlan[i].tx =3D 0;
>  			card->vlan[i].rx =3D 0;
>  			continue;
>  		}
> +
>  		card->vlan[i].rx =3D (u16)v1;
>
> -		dev_dbg(ctodev(card), "vlan_id[%d] tx=3D%02x rx=3D%02x\n",
> -			i, card->vlan[i].tx, card->vlan[i].rx);
> +		dev_dbg(dev, "%s:%d: vlan_id[%d] tx=3D%02x rx=3D%02x\n", __func__,
> +			__LINE__, i, card->vlan[i].tx, card->vlan[i].rx);
>  	}
>
>  	if (card->vlan[GELIC_PORT_ETHERNET_0].tx) {
> @@ -1707,9 +1745,10 @@ static void gelic_card_get_vlan_info(struct=20=20
>=20gelic_card *card)
>  		card->vlan[GELIC_PORT_WIRELESS].rx =3D 0;
>  	}
>
> -	dev_info(ctodev(card), "internal vlan %s\n",
> -		 card->vlan_required? "enabled" : "disabled");
> +	dev_dbg(dev, "%s:%d: internal vlan %s\n", __func__, __LINE__,
> +		card->vlan_required? "enabled" : "disabled");
>  }
> +
>  /*
>   * ps3_gelic_driver_probe - add a device to the control of this driver
>   */
> @@ -1872,26 +1911,25 @@ static int ps3_gelic_driver_probe(struct=20=20
>=20ps3_system_bus_device *sb_dev)
>   * ps3_gelic_driver_remove - remove a device from the control of this dr=
iver
>   */
>
> -static void ps3_gelic_driver_remove(struct ps3_system_bus_device *dev)
> +static void ps3_gelic_driver_remove(struct ps3_system_bus_device *sb_dev=
)
>  {
> -	struct gelic_card *card =3D ps3_system_bus_get_drvdata(dev);
> +	struct gelic_card *card =3D ps3_system_bus_get_drvdata(sb_dev);
> +	struct device *dev =3D &sb_dev->core;
>  	struct net_device *netdev0;
> -	pr_debug("%s: called\n", __func__);
>
> -	/* set auto-negotiation */
> +	dev_dbg(dev, "%s:%d: >\n", __func__, __LINE__);
> +
>  	gelic_card_set_link_mode(card, GELIC_LV1_ETHER_AUTO_NEG);
>
>  #ifdef CONFIG_GELIC_WIRELESS
>  	gelic_wl_driver_remove(card);
>  #endif
> -	/* stop interrupt */
> +
>  	gelic_card_set_irq_mask(card, 0);
>
> -	/* turn off DMA, force end */
>  	gelic_card_disable_rxdmac(card);
>  	gelic_card_disable_txdmac(card);
>
> -	/* release chains */
>  	gelic_card_release_tx_chain(card, 1);
>  	gelic_card_release_rx_chain(card);
>
> @@ -1899,28 +1937,28 @@ static void ps3_gelic_driver_remove(struct=20=20
>=20ps3_system_bus_device *dev)
>  	gelic_card_free_chain(card, card->rx_top);
>
>  	netdev0 =3D card->netdev[GELIC_PORT_ETHERNET_0];
> -	/* disconnect event port */
> +
>  	free_irq(card->irq, card);
>  	netdev0->irq =3D 0;
>  	ps3_sb_event_receive_port_destroy(card->dev, card->irq);
>
>  	wait_event(card->waitq,
> -		   atomic_read(&card->tx_timeout_task_counter) =3D=3D 0);
> +		atomic_read(&card->tx_timeout_task_counter) =3D=3D 0);
>
>  	lv1_net_set_interrupt_status_indicator(bus_id(card), dev_id(card),
> -					       0 , 0);
> +		0 , 0);
>
>  	unregister_netdev(netdev0);
>  	kfree(netdev_card(netdev0)->unalign);
>  	free_netdev(netdev0);
>
> -	ps3_system_bus_set_drvdata(dev, NULL);
> +	ps3_system_bus_set_drvdata(sb_dev, NULL);
>
> -	ps3_dma_region_free(dev->d_region);
> +	ps3_dma_region_free(sb_dev->d_region);
>
> -	ps3_close_hv_device(dev);
> +	ps3_close_hv_device(sb_dev);
>
> -	pr_debug("%s: done\n", __func__);
> +	dev_dbg(dev, "%s:%d: <\n", __func__, __LINE__);
>  }
>
>  static struct ps3_system_bus_driver ps3_gelic_driver =3D {
> @@ -1932,14 +1970,14 @@ static struct ps3_system_bus_driver=20=20
>=20ps3_gelic_driver =3D {
>  	.core.owner =3D THIS_MODULE,
>  };
>
> -static int __init ps3_gelic_driver_init (void)
> +static int __init ps3_gelic_driver_init(void)
>  {
>  	return firmware_has_feature(FW_FEATURE_PS3_LV1)
>  		? ps3_system_bus_driver_register(&ps3_gelic_driver)
>  		: -ENODEV;
>  }
>
> -static void __exit ps3_gelic_driver_exit (void)
> +static void __exit ps3_gelic_driver_exit(void)
>  {
>  	ps3_system_bus_driver_unregister(&ps3_gelic_driver);
>  }
> @@ -1948,4 +1986,3 @@ module_init(ps3_gelic_driver_init);
>  module_exit(ps3_gelic_driver_exit);
>
>  MODULE_ALIAS(PS3_MODULE_ALIAS_GELIC);
> -
> --
> 2.25.1


