Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C55AE2D2E70
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 16:40:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr4Bv5y5tzDqCb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 02:40:39 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr3bN6SkmzDqNW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 02:13:20 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Cr3bG4xZSz9v42n;
 Tue,  8 Dec 2020 16:13:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DLQnTwSN6Bb0; Tue,  8 Dec 2020 16:13:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Cr3bG33tKz9v0Vw;
 Tue,  8 Dec 2020 16:13:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F2DE48B7CA;
 Tue,  8 Dec 2020 16:13:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id h6SE5JibrgJa; Tue,  8 Dec 2020 16:13:15 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 271938B7BE;
 Tue,  8 Dec 2020 16:13:15 +0100 (CET)
Subject: Re: [PATCH 14/20] ethernet: ucc_geth: don't statically allocate eight
 ucc_geth_info
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Li Yang <leoyang.li@nxp.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
References: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
 <20201205191744.7847-15-rasmus.villemoes@prevas.dk>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8259bec3-9343-82e3-a420-a8170cf922a4@csgroup.eu>
Date: Tue, 8 Dec 2020 16:13:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201205191744.7847-15-rasmus.villemoes@prevas.dk>
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
> struct ucc_geth_info is somewhat large, and on systems with only one
> or two UCC instances, that just wastes a few KB of memory. So
> allocate and populate a chunk of memory at probe time instead of
> initializing them all during driver init.
> 
> Note that the existing "ug_info == NULL" check was dead code, as the
> address of some static array element can obviously never be NULL.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>   drivers/net/ethernet/freescale/ucc_geth.c | 32 +++++++++--------------
>   1 file changed, 12 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
> index a06744d8b4af..273342233bba 100644
> --- a/drivers/net/ethernet/freescale/ucc_geth.c
> +++ b/drivers/net/ethernet/freescale/ucc_geth.c
> @@ -157,8 +157,6 @@ static const struct ucc_geth_info ugeth_primary_info = {
>   	.riscRx = QE_RISC_ALLOCATION_RISC1_AND_RISC2,
>   };
>   
> -static struct ucc_geth_info ugeth_info[8];
> -
>   #ifdef DEBUG
>   static void mem_disp(u8 *addr, int size)
>   {
> @@ -3714,25 +3712,23 @@ static int ucc_geth_probe(struct platform_device* ofdev)
>   	if ((ucc_num < 0) || (ucc_num > 7))
>   		return -ENODEV;
>   
> -	ug_info = &ugeth_info[ucc_num];
> -	if (ug_info == NULL) {
> -		if (netif_msg_probe(&debug))
> -			pr_err("[%d] Missing additional data!\n", ucc_num);
> -		return -ENODEV;
> -	}
> +	ug_info = kmalloc(sizeof(*ug_info), GFP_KERNEL);

Could we use dev_kmalloc() instead, to avoid the freeing on the wait out and the err_free_info: path ?

> +	if (ug_info == NULL)
> +		return -ENOMEM;
> +	memcpy(ug_info, &ugeth_primary_info, sizeof(*ug_info));
>   
>   	ug_info->uf_info.ucc_num = ucc_num;
>   
>   	err = ucc_geth_parse_clock(np, "rx", &ug_info->uf_info.rx_clock);
>   	if (err)
> -		return err;
> +		goto err_free_info;
>   	err = ucc_geth_parse_clock(np, "tx", &ug_info->uf_info.tx_clock);
>   	if (err)
> -		return err;
> +		goto err_free_info;
>   
>   	err = of_address_to_resource(np, 0, &res);
>   	if (err)
> -		return -EINVAL;
> +		goto err_free_info;
>   
>   	ug_info->uf_info.regs = res.start;
>   	ug_info->uf_info.irq = irq_of_parse_and_map(np, 0);
> @@ -3745,7 +3741,7 @@ static int ucc_geth_probe(struct platform_device* ofdev)
>   		 */
>   		err = of_phy_register_fixed_link(np);
>   		if (err)
> -			return err;
> +			goto err_free_info;
>   		ug_info->phy_node = of_node_get(np);
>   	}
>   
> @@ -3876,6 +3872,8 @@ static int ucc_geth_probe(struct platform_device* ofdev)
>   		of_phy_deregister_fixed_link(np);
>   	of_node_put(ug_info->tbi_node);
>   	of_node_put(ug_info->phy_node);
> +err_free_info:
> +	kfree(ug_info);
>   
>   	return err;
>   }
> @@ -3886,6 +3884,7 @@ static int ucc_geth_remove(struct platform_device* ofdev)
>   	struct ucc_geth_private *ugeth = netdev_priv(dev);
>   	struct device_node *np = ofdev->dev.of_node;
>   
> +	kfree(ugeth->ug_info);
>   	ucc_geth_memclean(ugeth);
>   	if (of_phy_is_fixed_link(np))
>   		of_phy_deregister_fixed_link(np);
> @@ -3920,17 +3919,10 @@ static struct platform_driver ucc_geth_driver = {
>   
>   static int __init ucc_geth_init(void)
>   {
> -	int i, ret;
> -
>   	if (netif_msg_drv(&debug))
>   		pr_info(DRV_DESC "\n");
> -	for (i = 0; i < 8; i++)
> -		memcpy(&(ugeth_info[i]), &ugeth_primary_info,
> -		       sizeof(ugeth_primary_info));
> -
> -	ret = platform_driver_register(&ucc_geth_driver);
>   
> -	return ret;
> +	return platform_driver_register(&ucc_geth_driver);
>   }
>   
>   static void __exit ucc_geth_exit(void)
> 
