Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B1A4D2B76
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 10:09:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD5xS2WP5z3bYk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 20:09:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD5x039J2z2xMQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 20:09:21 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KD5ww4gRvz9sSc;
 Wed,  9 Mar 2022 10:09:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uKKKXZbnDWW3; Wed,  9 Mar 2022 10:09:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KD5ww3fjkz9sSR;
 Wed,  9 Mar 2022 10:09:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6BF958B77E;
 Wed,  9 Mar 2022 10:09:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rUP_3xdCSKr9; Wed,  9 Mar 2022 10:09:20 +0100 (CET)
Received: from [192.168.202.3] (unknown [192.168.202.3])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F86F8B763;
 Wed,  9 Mar 2022 10:09:20 +0100 (CET)
Message-ID: <7145e14d-d781-934b-a0c0-fd846e7fc5cf@csgroup.eu>
Date: Wed, 9 Mar 2022 10:09:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] powerpc/mm: Fix printing of process table address
Content-Language: fr-FR
To: Balbir Singh <bsingharora@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20180328030932.32169-1-bsingharora@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20180328030932.32169-1-bsingharora@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 28/03/2018 à 05:09, Balbir Singh a écrit :
> New changes to %p cause the information printed at boot
> about radix-mmu partition and process table opaque, if
> we really want to protect those values, we should make
> dmesg more secure using CONFIG_SECURITY_DMESG_RESTRICT
> 
> Before the patches:
> 
> radix-mmu: Partition table         (ptrval)
> radix-mmu: Process table         (ptrval) and radix root for kernel:         (ptrval)
> 
> After the patches
> 
> radix-mmu: Partition table c0000000ffff0000
> radix-mmu: Process table c0000000fe000000 and radix root for kernel: c0000000015a0000
> 
> Signed-off-by: Balbir Singh <bsingharora@gmail.com>


This patch was superseded by ec5b705c4836 ("powerpc/mm/radix: remove 
useless kernel messages")

> ---
>   arch/powerpc/mm/pgtable-radix.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/pgtable-radix.c b/arch/powerpc/mm/pgtable-radix.c
> index 2e10a964e290..3f676e89c3a6 100644
> --- a/arch/powerpc/mm/pgtable-radix.c
> +++ b/arch/powerpc/mm/pgtable-radix.c
> @@ -329,7 +329,8 @@ static void __init radix_init_pgtable(void)
>   	 * physical address here.
>   	 */
>   	register_process_table(__pa(process_tb), 0, PRTB_SIZE_SHIFT - 12);
> -	pr_info("Process table %p and radix root for kernel: %p\n", process_tb, init_mm.pgd);
> +	pr_info("Process table %px and radix root for kernel: %px\n",
> +			process_tb, init_mm.pgd);
>   	asm volatile("ptesync" : : : "memory");
>   	asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
>   		     "r" (TLBIEL_INVAL_SET_LPID), "r" (0));
> @@ -363,7 +364,7 @@ static void __init radix_init_partition_table(void)
>   	mmu_partition_table_set_entry(0, dw0, 0);
>   
>   	pr_info("Initializing Radix MMU\n");
> -	pr_info("Partition table %p\n", partition_tb);
> +	pr_info("Partition table %px\n", partition_tb);
>   }
>   
>   void __init radix_init_native(void)
