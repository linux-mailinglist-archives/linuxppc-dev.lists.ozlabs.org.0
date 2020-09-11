Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9902658D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 07:35:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnkxT4gcSzDqfr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 15:35:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnkvd1LmyzDqFt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 15:34:04 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BnkvX3750z9tynQ;
 Fri, 11 Sep 2020 07:34:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0__RLcxl5619; Fri, 11 Sep 2020 07:34:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BnkvX1RJCz9tynP;
 Fri, 11 Sep 2020 07:34:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 020818B832;
 Fri, 11 Sep 2020 07:34:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yHWETXkREEl6; Fri, 11 Sep 2020 07:34:00 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E9028B75E;
 Fri, 11 Sep 2020 07:34:00 +0200 (CEST)
Subject: Re: [PATCH 2/7] powerpc/prom: Fix W=1 compile warning
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20200910210250.1962595-1-clg@kaod.org>
 <20200910210250.1962595-3-clg@kaod.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ed65bab2-b42c-38f6-d68e-c9924cfca62d@csgroup.eu>
Date: Fri, 11 Sep 2020 07:33:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910210250.1962595-3-clg@kaod.org>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/09/2020 à 23:02, Cédric Le Goater a écrit :
> arch/powerpc/kernel/prom.c: In function ‘early_reserve_mem’:
> arch/powerpc/kernel/prom.c:625:10: error: variable ‘reserve_map’ set but not used [-Werror=unused-but-set-variable]
>    __be64 *reserve_map;
>            ^~~~~~~~~~~
> cc1: all warnings being treated as errors

A small sentence explaining how this is fixes would be welcome, so that 
you don't need to read the code the know what the commit does to fix the 
warning. Also the subject should be more explicit.


> 
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   arch/powerpc/kernel/prom.c | 51 +++++++++++++++++++-------------------
>   1 file changed, 26 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index d8a2fb87ba0c..4bae9ebc7d0b 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -622,11 +622,6 @@ static void __init early_reserve_mem_dt(void)
>   
>   static void __init early_reserve_mem(void)
>   {
> -	__be64 *reserve_map;
> -
> -	reserve_map = (__be64 *)(((unsigned long)initial_boot_params) +
> -			fdt_off_mem_rsvmap(initial_boot_params));
> -
>   	/* Look for the new "reserved-regions" property in the DT */
>   	early_reserve_mem_dt();
>   
> @@ -639,28 +634,34 @@ static void __init early_reserve_mem(void)
>   	}
>   #endif /* CONFIG_BLK_DEV_INITRD */
>   
> -#ifdef CONFIG_PPC32

Instead of such a big change, you could simply do the following in 
addition to the move of reserve_map allocation after it.

	if (!IS_ENABLED(CONFIG_PPC32))
		return;

> -	/*
> -	 * Handle the case where we might be booting from an old kexec
> -	 * image that setup the mem_rsvmap as pairs of 32-bit values
> -	 */
> -	if (be64_to_cpup(reserve_map) > 0xffffffffull) {
> -		u32 base_32, size_32;
> -		__be32 *reserve_map_32 = (__be32 *)reserve_map;
> -
> -		DBG("Found old 32-bit reserve map\n");
> -
> -		while (1) {
> -			base_32 = be32_to_cpup(reserve_map_32++);
> -			size_32 = be32_to_cpup(reserve_map_32++);
> -			if (size_32 == 0)
> -				break;
> -			DBG("reserving: %x -> %x\n", base_32, size_32);
> -			memblock_reserve(base_32, size_32);
> +	if (IS_ENABLED(CONFIG_PPC32)) {
> +		__be64 *reserve_map;
> +
> +		reserve_map = (__be64 *)(((unsigned long)initial_boot_params) +
> +				 fdt_off_mem_rsvmap(initial_boot_params));
> +
> +		/*
> +		 * Handle the case where we might be booting from an
> +		 * old kexec image that setup the mem_rsvmap as pairs
> +		 * of 32-bit values
> +		 */
> +		if (be64_to_cpup(reserve_map) > 0xffffffffull) {
> +			u32 base_32, size_32;
> +			__be32 *reserve_map_32 = (__be32 *)reserve_map;
> +
> +			DBG("Found old 32-bit reserve map\n");
> +
> +			while (1) {
> +				base_32 = be32_to_cpup(reserve_map_32++);
> +				size_32 = be32_to_cpup(reserve_map_32++);
> +				if (size_32 == 0)
> +					break;
> +				DBG("reserving: %x -> %x\n", base_32, size_32);
> +				memblock_reserve(base_32, size_32);
> +			}
> +			return;
>   		}
> -		return;
>   	}
> -#endif
>   }
>   
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> 


Christophe
