Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 479FD3D4F76
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jul 2021 20:22:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GXry10vVnz3Wtp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 04:22:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GXrxg1Y1lz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 04:22:13 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GXrxZ71FkzBCTP;
 Sun, 25 Jul 2021 20:22:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kcwmj6KcnYOR; Sun, 25 Jul 2021 20:22:10 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GXrxZ64yVzBCTJ;
 Sun, 25 Jul 2021 20:22:10 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 2BE91293; Sun, 25 Jul 2021 20:27:28 +0200 (CEST)
Received: from 37-165-12-41.coucou-networks.fr
 (37-165-12-41.coucou-networks.fr [37.165.12.41]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Sun, 25 Jul 2021 20:27:28 +0200
Date: Sun, 25 Jul 2021 20:27:28 +0200
Message-ID: <20210725202728.Horde.h18tJbMCDL-jDvRqhxi5iQ1@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Geoff Levand <geoff@infradead.org>
Subject: Re: [PATCH v4 08/10] net/ps3_gelic: Rename no to descr_count
References: <cover.1627068552.git.geoff@infradead.org>
 <07e42ec30037d514c1d63f33efe4642364d89802.1627068552.git.geoff@infradead.org>
In-Reply-To: <07e42ec30037d514c1d63f33efe4642364d89802.1627068552.git.geoff@infradead.org>
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

> In an effort to make the PS3 gelic driver easier to maintain, rename
> the gelic_card_init_chain parameter 'no' to 'descr_count'.

Not sure you really need a so long name. 'count' should be good enough.

Read https://www.kernel.org/doc/html/latest/process/coding-style.html#namin=
g

>
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  drivers/net/ethernet/toshiba/ps3_gelic_net.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c=20=20
>=20b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> index e55aa9fecfeb..60fcca5d20dd 100644
> --- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> +++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> @@ -325,7 +325,7 @@ static void gelic_card_free_chain(struct=20=20
>=20gelic_card *card,
>   * @card: card structure
>   * @chain: address of chain
>   * @start_descr: address of descriptor array
> - * @no: number of descriptors
> + * @descr_count: number of descriptors
>   *
>   * we manage a circular list that mirrors the hardware structure,
>   * except that the hardware uses bus addresses.
> @@ -334,16 +334,16 @@ static void gelic_card_free_chain(struct=20=20
>=20gelic_card *card,
>   */
>  static int gelic_card_init_chain(struct gelic_card *card,
>  	struct gelic_descr_chain *chain, struct gelic_descr *start_descr,
> -	int no)
> +	int descr_count)
>  {
>  	int i;
>  	struct gelic_descr *descr;
>  	struct device *dev =3D ctodev(card);
>
>  	descr =3D start_descr;
> -	memset(descr, 0, sizeof(*descr) * no);
> +	memset(descr, 0, sizeof(*descr) *descr_count);

You forgot the space after the *

Christophe

>
> -	for (i =3D 0; i < no; i++, descr++) {
> +	for (i =3D 0; i < descr_count; i++, descr++) {
>  		descr->link.size =3D sizeof(struct gelic_hw_regs);
>  		gelic_descr_set_status(descr, GELIC_DESCR_DMA_NOT_IN_USE);
>  		descr->link.cpu_addr =3D
> @@ -361,7 +361,7 @@ static int gelic_card_init_chain(struct gelic_card *c=
ard,
>  	start_descr->prev =3D (descr - 1);
>
>  	descr =3D start_descr;
> -	for (i =3D 0; i < no; i++, descr++) {
> +	for (i =3D 0; i < descr_count; i++, descr++) {
>  		descr->hw_regs.next_descr_addr =3D
>  			cpu_to_be32(descr->next->link.cpu_addr);
>  	}
> --
> 2.25.1


