Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1C833CE96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 08:25:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F04ZP1y9sz30DJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 18:25:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F04Z34fV5z2xy4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 18:25:13 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F04Yx4zmWz9v020;
 Tue, 16 Mar 2021 08:25:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id pgm3WMIQyJIS; Tue, 16 Mar 2021 08:25:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F04Yx48q1z9v01y;
 Tue, 16 Mar 2021 08:25:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4BB418B788;
 Tue, 16 Mar 2021 08:25:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5I_gIPpLFGd9; Tue, 16 Mar 2021 08:25:10 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ABDB88B782;
 Tue, 16 Mar 2021 08:25:09 +0100 (CET)
Subject: Re: [PATCH v9 7/8] powerpc/mm: implement set_memory_attr()
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210316031741.1004850-1-jniethe5@gmail.com>
 <20210316031741.1004850-7-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5a848626-cd83-e4de-f64e-2a7ee082d7d7@csgroup.eu>
Date: Tue, 16 Mar 2021 08:25:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316031741.1004850-7-jniethe5@gmail.com>
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
Cc: christophe.leroy@c-s.fr, ajd@linux.ibm.com, npiggin@gmail.com,
 kbuild test robot <lkp@intel.com>, naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/03/2021 à 04:17, Jordan Niethe a écrit :
> From: Christophe Leroy <christophe.leroy@c-s.fr>

Can you please update the whole series with my new email address: christophe.leroy@csgroup.eu



> 
> In addition to the set_memory_xx() functions which allows to change
> the memory attributes of not (yet) used memory regions, implement a
> set_memory_attr() function to:
> - set the final memory protection after init on currently used
> kernel regions.
> - enable/disable kernel memory regions in the scope of DEBUG_PAGEALLOC.
> 
> Unlike the set_memory_xx() which can act in three step as the regions
> are unused, this function must modify 'on the fly' as the kernel is
> executing from them. At the moment only PPC32 will use it and changing
> page attributes on the fly is not an issue.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Reported-by: kbuild test robot <lkp@intel.com>
> [ruscur: cast "data" to unsigned long instead of int]
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>   arch/powerpc/include/asm/set_memory.h |  2 ++
>   arch/powerpc/mm/pageattr.c            | 33 +++++++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
> index 64011ea444b4..b040094f7920 100644
> --- a/arch/powerpc/include/asm/set_memory.h
> +++ b/arch/powerpc/include/asm/set_memory.h
> @@ -29,4 +29,6 @@ static inline int set_memory_x(unsigned long addr, int numpages)
>   	return change_memory_attr(addr, numpages, SET_MEMORY_X);
>   }
>   
> +int set_memory_attr(unsigned long addr, int numpages, pgprot_t prot);
> +
>   #endif
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> index 2da3fbab6ff7..2fde1b195c85 100644
> --- a/arch/powerpc/mm/pageattr.c
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -79,3 +79,36 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
>   	return apply_to_existing_page_range(&init_mm, start, sz,
>   					    change_page_attr, (void *)action);
>   }
> +
> +/*
> + * Set the attributes of a page:
> + *
> + * This function is used by PPC32 at the end of init to set final kernel memory
> + * protection. It includes changing the maping of the page it is executing from
> + * and data pages it is using.
> + */
> +static int set_page_attr(pte_t *ptep, unsigned long addr, void *data)
> +{
> +	pgprot_t prot = __pgprot((unsigned long)data);
> +
> +	spin_lock(&init_mm.page_table_lock);
> +
> +	set_pte_at(&init_mm, addr, ptep, pte_modify(*ptep, prot));
> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +
> +	spin_unlock(&init_mm.page_table_lock);
> +
> +	return 0;
> +}
> +
> +int set_memory_attr(unsigned long addr, int numpages, pgprot_t prot)
> +{
> +	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
> +	unsigned long sz = numpages * PAGE_SIZE;
> +
> +	if (numpages <= 0)
> +		return 0;
> +
> +	return apply_to_existing_page_range(&init_mm, start, sz, set_page_attr,
> +					    (void *)pgprot_val(prot));
> +}
> 
