Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B15B3D4F7C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jul 2021 20:24:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GXs0m27D3z30F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 04:24:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GXs0S1v6Dz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 04:24:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GXs0P1tWPzBCTT;
 Sun, 25 Jul 2021 20:24:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jkng_VejQV9Y; Sun, 25 Jul 2021 20:24:37 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GXs0P0xWCzBCTJ;
 Sun, 25 Jul 2021 20:24:37 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 69C8D3B5; Sun, 25 Jul 2021 20:29:54 +0200 (CEST)
Received: from 37-165-12-41.coucou-networks.fr
 (37-165-12-41.coucou-networks.fr [37.165.12.41]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Sun, 25 Jul 2021 20:29:54 +0200
Date: Sun, 25 Jul 2021 20:29:54 +0200
Message-ID: <20210725202954.Horde.bRFhkpxqK_S2oN3y1Mj0pA1@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Geoff Levand <geoff@infradead.org>
Subject: Re: [PATCH v4 09/10] net/ps3_gelic: Add new routine gelic_work_to_card
References: <cover.1627068552.git.geoff@infradead.org>
 <5634f7c76a67345c9735e05b68228ea899a8bf9d.1627068552.git.geoff@infradead.org>
In-Reply-To: <5634f7c76a67345c9735e05b68228ea899a8bf9d.1627068552.git.geoff@infradead.org>
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

> Add new helper routine gelic_work_to_card that converts a work_struct
> to a gelic_card.

Adding a function is it really needed as it is used only once ?

Christophe

>
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  drivers/net/ethernet/toshiba/ps3_gelic_net.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c=20=20
>=20b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> index 60fcca5d20dd..42f4de9ad5fe 100644
> --- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> +++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> @@ -1420,6 +1420,11 @@ static const struct ethtool_ops=20=20
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
> @@ -1429,8 +1434,7 @@ static const struct ethtool_ops=20=20
>=20gelic_ether_ethtool_ops =3D {
>   */
>  static void gelic_net_tx_timeout_task(struct work_struct *work)
>  {
> -	struct gelic_card *card =3D
> -		container_of(work, struct gelic_card, tx_timeout_task);
> +	struct gelic_card *card =3D gelic_work_to_card(work);
>  	struct net_device *netdev =3D card->netdev[GELIC_PORT_ETHERNET_0];
>  	struct device *dev =3D ctodev(card);
>
> --
> 2.25.1


