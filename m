Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE0A3E0D84
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 07:08:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgGp90Pd6z3cXN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 15:08:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgGnq5mKYz3bZ3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 15:07:43 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GgGnn1xSVz9sWL;
 Thu,  5 Aug 2021 07:07:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6t7DCkzoMOFG; Thu,  5 Aug 2021 07:07:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GgGnn0vtrz9sWG;
 Thu,  5 Aug 2021 07:07:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F3CAA8B7AE;
 Thu,  5 Aug 2021 07:07:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eQgHi0R9P5Y4; Thu,  5 Aug 2021 07:07:40 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9EB018B76A;
 Thu,  5 Aug 2021 07:07:40 +0200 (CEST)
Subject: Re: [PATCH v4 05/10] net/ps3_gelic: Add vlan_id structure
To: Geoff Levand <geoff@infradead.org>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
References: <cover.1627068552.git.geoff@infradead.org>
 <1cdd7f718dde93dcaebf7ddd025869901aa30523.1627068552.git.geoff@infradead.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <defb4181-c57f-7088-7208-f106c1b8c5ac@csgroup.eu>
Date: Thu, 5 Aug 2021 07:07:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1cdd7f718dde93dcaebf7ddd025869901aa30523.1627068552.git.geoff@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/07/2021 à 22:31, Geoff Levand a écrit :
> In an effort to make the PS3 gelic driver easier to maintain, add
> a definition for the vlan_id structure.
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>

Commit 4298d9fdc87f ("net/ps3_gelic: Add vlan_id structure") has no obvious style problems and is 
ready for submission.


> ---
>   drivers/net/ethernet/toshiba/ps3_gelic_net.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> index 946e9bfa071b..54e50ad9e629 100644
> --- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> +++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> @@ -1614,13 +1614,14 @@ static struct gelic_card *gelic_alloc_card_net(struct net_device **netdev)
>   static void gelic_card_get_vlan_info(struct gelic_card *card)
>   {
>   	struct device *dev = ctodev(card);
> +	unsigned int i;
>   	u64 v1, v2;
>   	int status;
> -	unsigned int i;
> -	struct {
> +	struct vlan_id {
>   		int tx;
>   		int rx;
> -	} vlan_id_ix[2] = {
> +	};
> +	struct vlan_id vlan_id_ix[2] = {
>   		[GELIC_PORT_ETHERNET_0] = {
>   			.tx = GELIC_LV1_VLAN_TX_ETHERNET_0,
>   			.rx = GELIC_LV1_VLAN_RX_ETHERNET_0
> 
