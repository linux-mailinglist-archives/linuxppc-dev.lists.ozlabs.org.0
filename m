Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 705552DF9F9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 09:34:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Czt6f3p4czDrBq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 19:34:02 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzskM5CgpzDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 19:16:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CzskB0XYvzB09ZX;
 Mon, 21 Dec 2020 09:16:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id z84Cu6KYnQQj; Mon, 21 Dec 2020 09:16:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Czsk96QdNzB09ZW;
 Mon, 21 Dec 2020 09:16:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E42178B7BE;
 Mon, 21 Dec 2020 09:16:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1CskhB0VnZ9H; Mon, 21 Dec 2020 09:16:22 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 907B08B7C7;
 Mon, 21 Dec 2020 09:16:22 +0100 (CET)
Subject: Re: [PATCH 13/23] powerpc/mm: Move hpte_insert_repeating() prototype
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20201221074222.403894-1-clg@kaod.org>
 <20201221074222.403894-14-clg@kaod.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <40284fdb-12ce-fdb2-f1f5-7df803c226e9@csgroup.eu>
Date: Mon, 21 Dec 2020 09:16:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201221074222.403894-14-clg@kaod.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/12/2020 à 08:42, Cédric Le Goater a écrit :
> It fixes this W=1 compile error :
> 
> ../arch/powerpc/mm/book3s64/hash_utils.c:1867:6: error: no previous prototype for ‘hpte_insert_repeating’ [-Werror=missing-prototypes]
>   1867 | long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
>        |      ^~~~~~~~~~~~~~~~~~~~~
> 
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   arch/powerpc/include/asm/book3s/64/mmu-hash.h | 5 +++++
>   arch/powerpc/mm/book3s64/hash_hugetlbpage.c   | 4 ----
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> index a94fd4e0c182..76ff95950309 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> @@ -454,6 +454,11 @@ static inline unsigned long hpt_hash(unsigned long vpn,
>   #define HPTE_NOHPTE_UPDATE	0x2
>   #define HPTE_USE_KERNEL_KEY	0x4
>   
> +extern long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
> +				  unsigned long pa, unsigned long rlags,
> +				  unsigned long vflags, int psize, int ssize);
> +
> +

Don't copy the 'extern' keyword. It is useless for function prototypes.

Then you could probably fit on only two lines (nowadays 100 chars are allowed per line)


>   extern int __hash_page_4K(unsigned long ea, unsigned long access,
>   			  unsigned long vsid, pte_t *ptep, unsigned long trap,
>   			  unsigned long flags, int ssize, int subpage_prot);
> diff --git a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c b/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
> index b5e9fff8c217..a688e1324ae5 100644
> --- a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
> +++ b/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
> @@ -16,10 +16,6 @@
>   unsigned int hpage_shift;
>   EXPORT_SYMBOL(hpage_shift);
>   
> -extern long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
> -				  unsigned long pa, unsigned long rlags,
> -				  unsigned long vflags, int psize, int ssize);
> -
>   int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
>   		     pte_t *ptep, unsigned long trap, unsigned long flags,
>   		     int ssize, unsigned int shift, unsigned int mmu_psize)
> 
