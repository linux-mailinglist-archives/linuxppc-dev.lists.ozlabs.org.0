Return-Path: <linuxppc-dev+bounces-4972-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8551A08F02
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 12:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTzhm167Pz3cTl;
	Fri, 10 Jan 2025 22:20:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736508008;
	cv=none; b=H+wHWZg5flchORyyAL1IoBVZZTfvjeNLy2IJnR2Cmw7I7px5lwVpG0qzRUFduPB2KNhGOo1hn1RIWt+WmzOtjB2S0W3ovkNS96tzE/FVPw2XDXIe6MA0KDA4ZzUBJp8Hk48lQBjI3Zxdf26oyI2LsHKOpnOrVV2nfzr1qqHyPJivg0JqJbIOEJKNmMjWfERPdb4GhovHc07wLKUZrdBimjoANTK5rcd2yGLt5nUCi8jACZeFB5uLXwC89WlSEqdp2vm23L5s0IGv0URaEhe5hyMpgZXydQJZpTZKOqzXyO0PZN/a5AwZCewcNPSrC6w9exPkxSnUIk84M7nUdeZIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736508008; c=relaxed/relaxed;
	bh=7a1D6ppqciy30TKWup9AFLAvB1aQQbbJ7iN7+ABPphQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFLvnN2vFLNZ2Lfz2IKoW9aVo9mVOpvLqi9Dphp9xSDPV7VY5RsCGViWcfPZLjUBSeNy8fGwwZKSrIfmUUnnC6wFx3sA/I+SQDhoxFotGnRcy8mXa/s2D8MIDNXOtMk8XMYdRbjA+lEYCF8WsCNWUofV22ec++osSLJ6+swcEG6RYHJ1xh0sO5wCi/KxrLduM8t8Edly+CN8swnWta6627OCQoi2NyH313uUvySICkMP2joS1qtiCNqNQyL566uJU8K83gfl6yVCedWrpBnHbvTRTBQI5Ew/CKO1GzgXVqcdJZedd7No8e0lAAYPD5+dj4JG9244muzUyUGg64dveA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTzhk6cyCz3c6f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 22:20:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YTzQ66bMjz9sSN;
	Fri, 10 Jan 2025 12:07:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9565rjOLSGr7; Fri, 10 Jan 2025 12:07:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YTzQ65Z96z9sSL;
	Fri, 10 Jan 2025 12:07:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AB26E8B787;
	Fri, 10 Jan 2025 12:07:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id X1yPG8Y30LGd; Fri, 10 Jan 2025 12:07:26 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 31B778B768;
	Fri, 10 Jan 2025 12:07:26 +0100 (CET)
Message-ID: <8b080760-c1c7-4d9d-a17b-3c0115392b36@csgroup.eu>
Date: Fri, 10 Jan 2025 12:07:25 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] freescale: ucc_geth: Remove set but unused
 variables
To: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20250110-ucc-unused-var-v1-1-4cf02475b21d@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250110-ucc-unused-var-v1-1-4cf02475b21d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 10/01/2025 à 11:18, Simon Horman a écrit :
> Remove set but unused variables. These seem to provide no value.
> So in the spirit of less being more, remove them.

Would be good to identify when those variables became unused.

There is for instance commit 64a99fe596f9 ("ethernet: ucc_geth: remove 
bd_mem_part and all associated code")

...

> 
> Compile tested only.
> No runtime effect intended.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>

As you are playing with that driver, there are also sparse warnings to 
be fixed, getting plenty when building with C=2

> ---
>   drivers/net/ethernet/freescale/ucc_geth.c | 39 +++++++------------------------
>   1 file changed, 8 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
> index 88510f822759..1e3a1cb997c3 100644
> --- a/drivers/net/ethernet/freescale/ucc_geth.c
> +++ b/drivers/net/ethernet/freescale/ucc_geth.c
> @@ -1704,14 +1704,8 @@ static int ugeth_82xx_filtering_clear_addr_in_paddr(struct ucc_geth_private *uge
>   
>   static void ucc_geth_free_rx(struct ucc_geth_private *ugeth)
>   {
> -	struct ucc_geth_info *ug_info;
> -	struct ucc_fast_info *uf_info;
> -	u16 i, j;
>   	u8 __iomem *bd;
> -
> -
> -	ug_info = ugeth->ug_info;
> -	uf_info = &ug_info->uf_info;
> +	u16 i, j;

Why do you need to move this declaration ? Looks like cosmetics. That 
goes beyond the purpose of this patch which is already big enough and 
should be avoided. The same applies several times in this patch.

>   
>   	for (i = 0; i < ucc_geth_rx_queues(ugeth->ug_info); i++) {
>   		if (ugeth->p_rx_bd_ring[i]) {
> @@ -1743,16 +1737,11 @@ static void ucc_geth_free_rx(struct ucc_geth_private *ugeth)
>   
>   static void ucc_geth_free_tx(struct ucc_geth_private *ugeth)
>   {
> -	struct ucc_geth_info *ug_info;
> -	struct ucc_fast_info *uf_info;
> -	u16 i, j;
>   	u8 __iomem *bd;
> +	u16 i, j;
>   
>   	netdev_reset_queue(ugeth->ndev);
>   
> -	ug_info = ugeth->ug_info;
> -	uf_info = &ug_info->uf_info;
> -
>   	for (i = 0; i < ucc_geth_tx_queues(ugeth->ug_info); i++) {
>   		bd = ugeth->p_tx_bd_ring[i];
>   		if (!bd)
> @@ -2036,13 +2025,11 @@ static int ucc_struct_init(struct ucc_geth_private *ugeth)
>   static int ucc_geth_alloc_tx(struct ucc_geth_private *ugeth)
>   {
>   	struct ucc_geth_info *ug_info;
> -	struct ucc_fast_info *uf_info;
> +	u8 __iomem *bd;
>   	int length;
>   	u16 i, j;
> -	u8 __iomem *bd;
>   
>   	ug_info = ugeth->ug_info;
> -	uf_info = &ug_info->uf_info;
>   
>   	/* Allocate Tx bds */
>   	for (j = 0; j < ucc_geth_tx_queues(ug_info); j++) {
> @@ -2098,13 +2085,11 @@ static int ucc_geth_alloc_tx(struct ucc_geth_private *ugeth)
>   static int ucc_geth_alloc_rx(struct ucc_geth_private *ugeth)
>   {
>   	struct ucc_geth_info *ug_info;
> -	struct ucc_fast_info *uf_info;
> +	u8 __iomem *bd;
>   	int length;
>   	u16 i, j;
> -	u8 __iomem *bd;
>   
>   	ug_info = ugeth->ug_info;
> -	uf_info = &ug_info->uf_info;
>   
>   	/* Allocate Rx bds */
>   	for (j = 0; j < ucc_geth_rx_queues(ug_info); j++) {
> @@ -2155,7 +2140,6 @@ static int ucc_geth_alloc_rx(struct ucc_geth_private *ugeth)
>   
>   static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>   {
> -	struct ucc_geth_82xx_address_filtering_pram __iomem *p_82xx_addr_filt;
>   	struct ucc_geth_init_pram __iomem *p_init_enet_pram;
>   	struct ucc_fast_private *uccf;
>   	struct ucc_geth_info *ug_info;
> @@ -2165,8 +2149,8 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>   	int ret_val = -EINVAL;
>   	u32 remoder = UCC_GETH_REMODER_INIT;
>   	u32 init_enet_pram_offset, cecr_subblock, command;
> -	u32 ifstat, i, j, size, l2qt, l3qt;
>   	u16 temoder = UCC_GETH_TEMODER_INIT;
> +	u32 i, j, size, l2qt, l3qt;
>   	u8 function_code = 0;
>   	u8 __iomem *endOfRing;
>   	u8 numThreadsRxNumerical, numThreadsTxNumerical;
> @@ -2260,7 +2244,7 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>   	/*                    Set IFSTAT                     */
>   	/* For more details see the hardware spec.           */
>   	/* Read only - resets upon read                      */
> -	ifstat = in_be32(&ug_regs->ifstat);
> +	in_be32(&ug_regs->ifstat);
>   
>   	/*                    Clear UEMPR                    */
>   	/* For more details see the hardware spec.           */
> @@ -2651,10 +2635,6 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
>   		for (j = 0; j < NUM_OF_PADDRS; j++)
>   			ugeth_82xx_filtering_clear_addr_in_paddr(ugeth, (u8) j);
>   
> -		p_82xx_addr_filt =
> -		    (struct ucc_geth_82xx_address_filtering_pram __iomem *) ugeth->
> -		    p_rx_glbl_pram->addressfiltering;
> -
>   		ugeth_82xx_filtering_clear_all_addr_in_hash(ugeth,
>   			ENET_ADDR_TYPE_GROUP);
>   		ugeth_82xx_filtering_clear_all_addr_in_hash(ugeth,
> @@ -2889,9 +2869,8 @@ static int ucc_geth_rx(struct ucc_geth_private *ugeth, u8 rxQ, int rx_work_limit
>   	struct sk_buff *skb;
>   	u8 __iomem *bd;
>   	u16 length, howmany = 0;
> -	u32 bd_status;
> -	u8 *bdBuffer;
>   	struct net_device *dev;
> +	u32 bd_status;
>   
>   	ugeth_vdbg("%s: IN", __func__);
>   
> @@ -2904,7 +2883,7 @@ static int ucc_geth_rx(struct ucc_geth_private *ugeth, u8 rxQ, int rx_work_limit
>   
>   	/* while there are received buffers and BD is full (~R_E) */
>   	while (!((bd_status & (R_E)) || (--rx_work_limit < 0))) {
> -		bdBuffer = (u8 *) in_be32(&((struct qe_bd __iomem *)bd)->buf);
> +		in_be32(&((struct qe_bd __iomem *)bd)->buf);

This line should go completely.

>   		length = (u16) ((bd_status & BD_LENGTH_MASK) - 4);
>   		skb = ugeth->rx_skbuff[rxQ][ugeth->skb_currx[rxQ]];
>   
> @@ -3043,14 +3022,12 @@ static irqreturn_t ucc_geth_irq_handler(int irq, void *info)
>   	struct net_device *dev = info;
>   	struct ucc_geth_private *ugeth = netdev_priv(dev);
>   	struct ucc_fast_private *uccf;
> -	struct ucc_geth_info *ug_info;
>   	register u32 ucce;
>   	register u32 uccm;
>   
>   	ugeth_vdbg("%s: IN", __func__);
>   
>   	uccf = ugeth->uccf;
> -	ug_info = ugeth->ug_info;
>   
>   	/* read and clear events */
>   	ucce = (u32) in_be32(uccf->p_ucce);
> 
> 


