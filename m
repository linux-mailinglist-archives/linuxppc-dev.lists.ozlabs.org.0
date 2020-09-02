Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A6925AB47
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 14:42:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhNrZ75hJzDqxW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 22:42:54 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhNp732JVzDq72
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 22:40:43 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BhNny1KHpz9txSj;
 Wed,  2 Sep 2020 14:40:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id iYRqEll7XluB; Wed,  2 Sep 2020 14:40:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BhNny0VQGz9txSg;
 Wed,  2 Sep 2020 14:40:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D3428B7E6;
 Wed,  2 Sep 2020 14:40:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id S0aC3aZkjhef; Wed,  2 Sep 2020 14:40:39 +0200 (CEST)
Received: from [10.25.210.31] (unknown [10.25.210.31])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 68D048B7E5;
 Wed,  2 Sep 2020 14:40:39 +0200 (CEST)
Subject: Re: [PATCH v4 04/13] mm/debug_vm_pgtables/hugevmap: Use the arch
 helper to identify huge vmap support.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114222.181353-5-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7e88e090-e3af-b26c-ca65-3d98e8f81eb3@csgroup.eu>
Date: Wed, 2 Sep 2020 14:40:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200902114222.181353-5-aneesh.kumar@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/09/2020 à 13:42, Aneesh Kumar K.V a écrit :
> ppc64 supports huge vmap only with radix translation. Hence use arch helper
> to determine the huge vmap support.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   mm/debug_vm_pgtable.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 00649b47f6e0..4c73e63b4ceb 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -28,6 +28,7 @@
>   #include <linux/swapops.h>
>   #include <linux/start_kernel.h>
>   #include <linux/sched/mm.h>
> +#include <linux/io.h>
>   #include <asm/pgalloc.h>
>   #include <asm/tlbflush.h>
>   
> @@ -206,11 +207,12 @@ static void __init pmd_leaf_tests(unsigned long pfn, pgprot_t prot)
>   	WARN_ON(!pmd_leaf(pmd));
>   }
>   
> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
>   static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
>   {
>   	pmd_t pmd;
>   
> -	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> +	if (!arch_ioremap_pmd_supported())

What about moving ioremap_pmd_enabled() from mm/ioremap.c to some .h, 
and using it ?
As ioremap_pmd_enabled() is defined at all time, no need of #ifdef

>   		return;
>   
>   	pr_debug("Validating PMD huge\n");
> @@ -224,6 +226,9 @@ static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
>   	pmd = READ_ONCE(*pmdp);
>   	WARN_ON(!pmd_none(pmd));
>   }
> +#else /* CONFIG_HAVE_ARCH_HUGE_VMAP */
> +static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot) { }
> +#endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */
>   
>   static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
>   {
> @@ -320,11 +325,12 @@ static void __init pud_leaf_tests(unsigned long pfn, pgprot_t prot)
>   	WARN_ON(!pud_leaf(pud));
>   }
>   
> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
>   static void __init pud_huge_tests(pud_t *pudp, unsigned long pfn, pgprot_t prot)
>   {
>   	pud_t pud;
>   
> -	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> +	if (!arch_ioremap_pud_supported())

What about moving ioremap_pud_enabled() from mm/ioremap.c to some .h, 
and using it ?
As ioremap_pud_enabled() is defined at all time, no need of #ifdef

>   		return;
>   
>   	pr_debug("Validating PUD huge\n");
> @@ -338,6 +344,10 @@ static void __init pud_huge_tests(pud_t *pudp, unsigned long pfn, pgprot_t prot)
>   	pud = READ_ONCE(*pudp);
>   	WARN_ON(!pud_none(pud));
>   }
> +#else /* !CONFIG_HAVE_ARCH_HUGE_VMAP */
> +static void __init pud_huge_tests(pud_t *pudp, unsigned long pfn, pgprot_t prot) { }
> +#endif /* !CONFIG_HAVE_ARCH_HUGE_VMAP */
> +
>   #else  /* !CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
>   static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot) { }
>   static void __init pud_advanced_tests(struct mm_struct *mm,
> 

Christophe
