Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C303294B4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 12:34:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGRgk0BKdzDql9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 21:34:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGRf30nHGzDqMW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 21:32:52 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CGRdp4V1FzB09bF;
 Wed, 21 Oct 2020 12:32:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jnZ2Vh4Sltdf; Wed, 21 Oct 2020 12:32:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CGRdp39xqzB09bB;
 Wed, 21 Oct 2020 12:32:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E52C8B7F6;
 Wed, 21 Oct 2020 12:32:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8NBdCwGsqdJN; Wed, 21 Oct 2020 12:32:47 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5762E8B7EA;
 Wed, 21 Oct 2020 12:32:47 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/mm: Add mask of always present MMU features
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <06bf0e094463533e7aec6900bddd435171e9f44f.1602517171.git.christophe.leroy@csgroup.eu>
Message-ID: <4bc99005-f3c0-045b-e0d5-f8b6f2b2e90d@csgroup.eu>
Date: Wed, 21 Oct 2020 12:32:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <06bf0e094463533e7aec6900bddd435171e9f44f.1602517171.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/10/2020 à 17:39, Christophe Leroy a écrit :
> On the same principle as commit 773edeadf672 ("powerpc/mm: Add mask
> of possible MMU features"), add mask for MMU features that are
> always there in order to optimise out dead branches.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Features must be anded with MMU_FTRS_POSSIBLE instead of ~0, otherwise
>      MMU_FTRS_ALWAYS is ~0 when no #ifdef matches.

This is still not enough. For BOOK3S/32, MMU_FTRS_POSSIBLE is still too much.
We need a #ifdef CONFIG_PPC_BOOK3S_32 with 0.

Christophe

> ---
>   arch/powerpc/include/asm/mmu.h | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index 255a1837e9f7..64e7e7f7cda9 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -201,8 +201,30 @@ enum {
>   		0,
>   };
>   
> +enum {
> +	MMU_FTRS_ALWAYS =
> +#ifdef CONFIG_PPC_8xx
> +		MMU_FTR_TYPE_8xx &
> +#endif
> +#ifdef CONFIG_40x
> +		MMU_FTR_TYPE_40x &
> +#endif
> +#ifdef CONFIG_PPC_47x
> +		MMU_FTR_TYPE_47x &
> +#elif defined(CONFIG_44x)
> +		MMU_FTR_TYPE_44x &
> +#endif
> +#if defined(CONFIG_E200) || defined(CONFIG_E500)
> +		MMU_FTR_TYPE_FSL_E &
> +#endif
> +		MMU_FTRS_POSSIBLE,
> +};
> +
>   static inline bool early_mmu_has_feature(unsigned long feature)
>   {
> +	if (MMU_FTRS_ALWAYS & feature)
> +		return true;
> +
>   	return !!(MMU_FTRS_POSSIBLE & cur_cpu_spec->mmu_features & feature);
>   }
>   
> @@ -231,6 +253,9 @@ static __always_inline bool mmu_has_feature(unsigned long feature)
>   	}
>   #endif
>   
> +	if (MMU_FTRS_ALWAYS & feature)
> +		return true;
> +
>   	if (!(MMU_FTRS_POSSIBLE & feature))
>   		return false;
>   
> 
