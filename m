Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CACC2D791E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 16:24:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Csvhq5365zDqxZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Dec 2020 02:24:27 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Csvg73ShmzDqdL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Dec 2020 02:22:59 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Csvg12GJLz9v0BR;
 Fri, 11 Dec 2020 16:22:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wd5pGtPFX2xY; Fri, 11 Dec 2020 16:22:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Csvg11DsHz9v0BQ;
 Fri, 11 Dec 2020 16:22:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AD5E68B86D;
 Fri, 11 Dec 2020 16:22:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lPuwoqgJFjrM; Fri, 11 Dec 2020 16:22:54 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0EE778B869;
 Fri, 11 Dec 2020 16:22:54 +0100 (CET)
Subject: Re: [PATCH] net: ethernet: fs-enet: remove casting dma_alloc_coherent
To: Xu Wang <vulab@iscas.ac.cn>, pantelis.antoniou@gmail.com,
 davem@davemloft.net, kuba@kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20201211085212.85457-1-vulab@iscas.ac.cn>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <34548188-67f4-d3ef-c2e3-871fc520e838@csgroup.eu>
Date: Fri, 11 Dec 2020 16:22:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201211085212.85457-1-vulab@iscas.ac.cn>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/12/2020 à 09:52, Xu Wang a écrit :
> Remove casting the values returned by dma_alloc_coherent.

Can you explain more in the commit log ?

As far as I can see, dma_alloc_coherent() doesn't return __iomem, and ring_base member is __iomem

Christophe

> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>   drivers/net/ethernet/freescale/fs_enet/mac-fec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
> index 99fe2c210d0f..3ae345676e50 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
> @@ -131,7 +131,7 @@ static int allocate_bd(struct net_device *dev)
>   	struct fs_enet_private *fep = netdev_priv(dev);
>   	const struct fs_platform_info *fpi = fep->fpi;
>   
> -	fep->ring_base = (void __force __iomem *)dma_alloc_coherent(fep->dev,
> +	fep->ring_base = dma_alloc_coherent(fep->dev,
>   					    (fpi->tx_ring + fpi->rx_ring) *
>   					    sizeof(cbd_t), &fep->ring_mem_addr,
>   					    GFP_KERNEL);
> 
