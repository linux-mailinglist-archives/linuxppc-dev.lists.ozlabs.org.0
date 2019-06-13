Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE70B4363E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 15:07:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PkY55C9XzDrQQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 23:07:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="NyjBpczB"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Pk9x39PHzDrMH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 22:50:45 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Pk9r1GVwz9v00L;
 Thu, 13 Jun 2019 14:50:40 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=NyjBpczB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SVtYa9beBncy; Thu, 13 Jun 2019 14:50:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Pk9q752Dz9v00J;
 Thu, 13 Jun 2019 14:50:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560430240; bh=pTwwRiZdJKJ6tY+T10JSotQr5almlLpVgBNMt/5ukTg=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=NyjBpczBJ59J8xTZ+BnVahuln2IIek0w4aqoEqv560r/EO4MxtGOWUsT9o+Upsl27
 S3/kNEon/ZpKRC46mLcrQkDYcIvTU/J+KPfcZ2hGGZ9EwkDbzeM4USNrgYZ2ERNqjB
 ae8pW/yDaqCZ8T19xIwbZ7ztlX0jd8tF5GzYN7zA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EF4688B8B9;
 Thu, 13 Jun 2019 14:50:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id z2IbEDTJueAY; Thu, 13 Jun 2019 14:50:40 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C94EA8B8E4;
 Thu, 13 Jun 2019 14:50:39 +0200 (CEST)
Subject: Re: [PATCH v3 1/4] crypto: talitos - move struct talitos_edesc into
 talitos.h
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, horia.geanta@nxp.com
References: <cover.1560429844.git.christophe.leroy@c-s.fr>
 <0ada8523d5765391ddc6899815e0e1eb511bcb7d.1560429844.git.christophe.leroy@c-s.fr>
Message-ID: <eb4463ff-04aa-fc47-e126-c15f39062686@c-s.fr>
Date: Thu, 13 Jun 2019 14:50:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <0ada8523d5765391ddc6899815e0e1eb511bcb7d.1560429844.git.christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/06/2019 à 14:48, Christophe Leroy a écrit :
> Moves it into talitos.h so that it can be used
> from any place in talitos.c
> 
> This will be required for next
> patch ("crypto: talitos - fix hash on SEC1")
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Cc: stable@vger.kernel.org

> ---
>   drivers/crypto/talitos.c | 30 ------------------------------
>   drivers/crypto/talitos.h | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
> index 3b3e99f1cddb..5b401aec6c84 100644
> --- a/drivers/crypto/talitos.c
> +++ b/drivers/crypto/talitos.c
> @@ -951,36 +951,6 @@ static int aead_des3_setkey(struct crypto_aead *authenc,
>   	goto out;
>   }
>   
> -/*
> - * talitos_edesc - s/w-extended descriptor
> - * @src_nents: number of segments in input scatterlist
> - * @dst_nents: number of segments in output scatterlist
> - * @icv_ool: whether ICV is out-of-line
> - * @iv_dma: dma address of iv for checking continuity and link table
> - * @dma_len: length of dma mapped link_tbl space
> - * @dma_link_tbl: bus physical address of link_tbl/buf
> - * @desc: h/w descriptor
> - * @link_tbl: input and output h/w link tables (if {src,dst}_nents > 1) (SEC2)
> - * @buf: input and output buffeur (if {src,dst}_nents > 1) (SEC1)
> - *
> - * if decrypting (with authcheck), or either one of src_nents or dst_nents
> - * is greater than 1, an integrity check value is concatenated to the end
> - * of link_tbl data
> - */
> -struct talitos_edesc {
> -	int src_nents;
> -	int dst_nents;
> -	bool icv_ool;
> -	dma_addr_t iv_dma;
> -	int dma_len;
> -	dma_addr_t dma_link_tbl;
> -	struct talitos_desc desc;
> -	union {
> -		struct talitos_ptr link_tbl[0];
> -		u8 buf[0];
> -	};
> -};
> -
>   static void talitos_sg_unmap(struct device *dev,
>   			     struct talitos_edesc *edesc,
>   			     struct scatterlist *src,
> diff --git a/drivers/crypto/talitos.h b/drivers/crypto/talitos.h
> index 32ad4fc679ed..95f78c6d9206 100644
> --- a/drivers/crypto/talitos.h
> +++ b/drivers/crypto/talitos.h
> @@ -42,6 +42,36 @@ struct talitos_desc {
>   
>   #define TALITOS_DESC_SIZE	(sizeof(struct talitos_desc) - sizeof(__be32))
>   
> +/*
> + * talitos_edesc - s/w-extended descriptor
> + * @src_nents: number of segments in input scatterlist
> + * @dst_nents: number of segments in output scatterlist
> + * @icv_ool: whether ICV is out-of-line
> + * @iv_dma: dma address of iv for checking continuity and link table
> + * @dma_len: length of dma mapped link_tbl space
> + * @dma_link_tbl: bus physical address of link_tbl/buf
> + * @desc: h/w descriptor
> + * @link_tbl: input and output h/w link tables (if {src,dst}_nents > 1) (SEC2)
> + * @buf: input and output buffeur (if {src,dst}_nents > 1) (SEC1)
> + *
> + * if decrypting (with authcheck), or either one of src_nents or dst_nents
> + * is greater than 1, an integrity check value is concatenated to the end
> + * of link_tbl data
> + */
> +struct talitos_edesc {
> +	int src_nents;
> +	int dst_nents;
> +	bool icv_ool;
> +	dma_addr_t iv_dma;
> +	int dma_len;
> +	dma_addr_t dma_link_tbl;
> +	struct talitos_desc desc;
> +	union {
> +		struct talitos_ptr link_tbl[0];
> +		u8 buf[0];
> +	};
> +};
> +
>   /**
>    * talitos_request - descriptor submission request
>    * @desc: descriptor pointer (kernel virtual)
> 
