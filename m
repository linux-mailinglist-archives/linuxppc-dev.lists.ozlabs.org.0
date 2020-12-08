Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FB92D2E84
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 16:44:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr4HG24G8zDqQj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 02:44:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr3cy00rRzDqbt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 02:14:41 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Cr3cr4GK0zB09b4;
 Tue,  8 Dec 2020 16:14:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SALn5SeD5L_H; Tue,  8 Dec 2020 16:14:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Cr3cr2dWlzB09b1;
 Tue,  8 Dec 2020 16:14:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D84858B7CA;
 Tue,  8 Dec 2020 16:14:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id atXkrH6OgQ7d; Tue,  8 Dec 2020 16:14:32 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C4258B7BE;
 Tue,  8 Dec 2020 16:14:31 +0100 (CET)
Subject: Re: [PATCH 15/20] ethernet: ucc_geth: use UCC_GETH_{RX,
 TX}_BD_RING_ALIGNMENT macros directly
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Li Yang <leoyang.li@nxp.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
References: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
 <20201205191744.7847-16-rasmus.villemoes@prevas.dk>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6844ad03-637f-86ab-6747-989cd44cccac@csgroup.eu>
Date: Tue, 8 Dec 2020 16:14:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201205191744.7847-16-rasmus.villemoes@prevas.dk>
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
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Zhao Qiang <qiang.zhao@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/12/2020 à 20:17, Rasmus Villemoes a écrit :
> These macros both have the value 32, there's no point first
> initializing align to a lower value.
> 
> If anything, one could throw in a
> BUILD_BUG_ON(UCC_GETH_TX_BD_RING_ALIGNMENT < 4), but it's not worth it
> - lots of code depends on named constants having sensible values.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>   drivers/net/ethernet/freescale/ucc_geth.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
> index 273342233bba..ccde42f547b8 100644
> --- a/drivers/net/ethernet/freescale/ucc_geth.c
> +++ b/drivers/net/ethernet/freescale/ucc_geth.c
> @@ -2196,9 +2196,7 @@ static int ucc_geth_alloc_tx(struct ucc_geth_private *ugeth)
>   		    UCC_GETH_TX_BD_RING_SIZE_MEMORY_ALIGNMENT)
>   			length += UCC_GETH_TX_BD_RING_SIZE_MEMORY_ALIGNMENT;
>   		if (uf_info->bd_mem_part == MEM_PART_SYSTEM) {
> -			u32 align = 4;
> -			if (UCC_GETH_TX_BD_RING_ALIGNMENT > 4)
> -				align = UCC_GETH_TX_BD_RING_ALIGNMENT;
> +			u32 align = UCC_GETH_TX_BD_RING_ALIGNMENT;

I think checkpatch.pl will expect an empty line here in addition.

>   			ugeth->tx_bd_ring_offset[j] =
>   				(u32) kmalloc((u32) (length + align), GFP_KERNEL);
>   
> @@ -2274,9 +2272,7 @@ static int ucc_geth_alloc_rx(struct ucc_geth_private *ugeth)
>   	for (j = 0; j < ug_info->numQueuesRx; j++) {
>   		length = ug_info->bdRingLenRx[j] * sizeof(struct qe_bd);
>   		if (uf_info->bd_mem_part == MEM_PART_SYSTEM) {
> -			u32 align = 4;
> -			if (UCC_GETH_RX_BD_RING_ALIGNMENT > 4)
> -				align = UCC_GETH_RX_BD_RING_ALIGNMENT;
> +			u32 align = UCC_GETH_RX_BD_RING_ALIGNMENT;

Same

>   			ugeth->rx_bd_ring_offset[j] =
>   				(u32) kmalloc((u32) (length + align), GFP_KERNEL);
>   			if (ugeth->rx_bd_ring_offset[j] != 0)
> 
