Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD513E0D88
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 07:09:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgGqs1KSRz3dbN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 15:09:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgGqX2Xnlz2xKS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 15:09:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GgGqT23Mzz9sX3;
 Thu,  5 Aug 2021 07:09:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqCKhATqXA0K; Thu,  5 Aug 2021 07:09:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GgGqT0krgz9sX2;
 Thu,  5 Aug 2021 07:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EDFC58B7AE;
 Thu,  5 Aug 2021 07:09:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nfvDJOUxX9Z9; Thu,  5 Aug 2021 07:09:08 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C9878B76A;
 Thu,  5 Aug 2021 07:09:08 +0200 (CEST)
Subject: Re: [PATCH v4 07/10] net/ps3_gelic: Add new routine gelic_unmap_link
To: Geoff Levand <geoff@infradead.org>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
References: <cover.1627068552.git.geoff@infradead.org>
 <024b88e07095f00bc2eabfae2f526851600ee272.1627068552.git.geoff@infradead.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1a8bc554-5230-769d-c007-7f620d286a84@csgroup.eu>
Date: Thu, 5 Aug 2021 07:09:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <024b88e07095f00bc2eabfae2f526851600ee272.1627068552.git.geoff@infradead.org>
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
> Put the common code for unmaping a link into its own routine,
> gelic_unmap_link, and add some debugging checks.
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>

CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#31: FILE: drivers/net/ethernet/toshiba/ps3_gelic_net.c:300:
+	dma_unmap_single(dev, descr->link.cpu_addr, descr->link.size,
+		DMA_BIDIRECTIONAL);


NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or --fix-inplace.

Commit bcb1cb297705 ("net/ps3_gelic: Add new routine gelic_unmap_link") has style problems, please 
review.

NOTE: Ignored message types: ARCH_INCLUDE_LINUX BIT_MACRO COMPARISON_TO_NULL DT_SPLIT_BINDING_PATCH 
EMAIL_SUBJECT FILE_PATH_CHANGES GLOBAL_INITIALISERS LINE_SPACING MULTIPLE_ASSIGNMENTS



> ---
>   drivers/net/ethernet/toshiba/ps3_gelic_net.c | 23 +++++++++++++++-----
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> index 85fc1915c8be..e55aa9fecfeb 100644
> --- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> +++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> @@ -288,6 +288,21 @@ void gelic_card_down(struct gelic_card *card)
>   	mutex_unlock(&card->updown_lock);
>   }
>   
> +static void gelic_unmap_link(struct device *dev, struct gelic_descr *descr)
> +{
> +	BUG_ON_DEBUG(descr->hw_regs.payload.dev_addr);
> +	BUG_ON_DEBUG(descr->hw_regs.payload.size);
> +
> +	BUG_ON_DEBUG(!descr->link.cpu_addr);
> +	BUG_ON_DEBUG(!descr->link.size);
> +
> +	dma_unmap_single(dev, descr->link.cpu_addr, descr->link.size,
> +		DMA_BIDIRECTIONAL);
> +
> +	descr->link.cpu_addr = 0;
> +	descr->link.size = 0;
> +}
> +
>   /**
>    * gelic_card_free_chain - free descriptor chain
>    * @card: card structure
> @@ -301,9 +316,7 @@ static void gelic_card_free_chain(struct gelic_card *card,
>   
>   	for (descr = descr_in; descr && descr->link.cpu_addr;
>   		descr = descr->next) {
> -		dma_unmap_single(dev, descr->link.cpu_addr, descr->link.size,
> -			DMA_BIDIRECTIONAL);
> -		descr->link.cpu_addr = 0;
> +		gelic_unmap_link(dev, descr);
>   	}
>   }
>   
> @@ -364,9 +377,7 @@ static int gelic_card_init_chain(struct gelic_card *card,
>   iommu_error:
>   	for (i--, descr--; 0 <= i; i--, descr--)
>   		if (descr->link.cpu_addr)
> -			dma_unmap_single(dev, descr->link.cpu_addr,
> -					 descr->link.size,
> -					 DMA_BIDIRECTIONAL);
> +			gelic_unmap_link(dev, descr);
>   	return -ENOMEM;
>   }
>   
> 
