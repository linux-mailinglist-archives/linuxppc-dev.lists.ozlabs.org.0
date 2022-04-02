Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F21264F04F4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 18:35:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KW2hv6NjXz3c2q
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Apr 2022 02:35:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KW2hV57jSz2xRp
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Apr 2022 02:35:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KW2hP62wJz9sSX;
 Sat,  2 Apr 2022 18:35:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MEtE9mW9L07m; Sat,  2 Apr 2022 18:35:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KW2hP54N8z9sS6;
 Sat,  2 Apr 2022 18:35:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9808D8B76D;
 Sat,  2 Apr 2022 18:35:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1mhd8NZeBHsu; Sat,  2 Apr 2022 18:35:17 +0200 (CEST)
Received: from [192.168.202.137] (unknown [192.168.202.137])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 231568B768;
 Sat,  2 Apr 2022 18:35:17 +0200 (CEST)
Message-ID: <9d02405a-793e-bcf5-a424-470d9c82ec7d@csgroup.eu>
Date: Sat, 2 Apr 2022 18:35:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] powerpc/drmem: Don't compute the NUMA node for each LMB
Content-Language: fr-FR
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <202008051807.Vi8NDJtX%lkp@intel.com>
 <20200805133502.33723-1-ldufour@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20200805133502.33723-1-ldufour@linux.ibm.com>
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
Cc: nathanl@linux.ibm.com, cheloha@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/08/2020 à 15:35, Laurent Dufour a écrit :
> All the LMB from the same set of ibm,dynamic-memory-v2 property are
> sharing the same NUMA node. Don't compute that node for each one.
> 
> Tested on a system with 1022 LMBs spread on 4 NUMA nodes, only 4 calls to
> lmb_set_nid() have been made instead of 1022.
> 
> This should prevent some soft lockups when starting large guests
> 
> Code has meaning only if CONFIG_MEMORY_HOTPLUG is set, otherwise the nid
> field is not present in the drmem_lmb structure.
> 
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>

It looks like this patch was superseded by e5e179aa3a39 ("pseries/drmem: 
don't cache node id in drmem_lmb struct").

If not, anyway it conflicts with that patch so it has to be rebased.

Thanks
Christophe


> ---
>   arch/powerpc/mm/drmem.c | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
> index b2eeea39684c..c11b6ec99ea3 100644
> --- a/arch/powerpc/mm/drmem.c
> +++ b/arch/powerpc/mm/drmem.c
> @@ -402,6 +402,9 @@ static void __init init_drmem_v2_lmbs(const __be32 *prop)
>   	const __be32 *p;
>   	u32 i, j, lmb_sets;
>   	int lmb_index;
> +#ifdef CONFIG_MEMORY_HOTPLUG
> +	struct drmem_lmb *first = NULL;
> +#endif
>   
>   	lmb_sets = of_read_number(prop++, 1);
>   	if (lmb_sets == 0)
> @@ -426,6 +429,15 @@ static void __init init_drmem_v2_lmbs(const __be32 *prop)
>   	for (i = 0; i < lmb_sets; i++) {
>   		read_drconf_v2_cell(&dr_cell, &p);
>   
> +#ifdef CONFIG_MEMORY_HOTPLUG
> +		/*
> +		 * Fetch the NUMA node id for the fist set or if the
> +		 * associativity index is different from the previous set.
> +		 */
> +		if (first && dr_cell.aa_index != first->aa_index)
> +			first = NULL;
> +#endif
> +
>   		for (j = 0; j < dr_cell.seq_lmbs; j++) {
>   			lmb = &drmem_info->lmbs[lmb_index++];
>   
> @@ -438,7 +450,18 @@ static void __init init_drmem_v2_lmbs(const __be32 *prop)
>   			lmb->aa_index = dr_cell.aa_index;
>   			lmb->flags = dr_cell.flags;
>   
> -			lmb_set_nid(lmb);
> +#ifdef CONFIG_MEMORY_HOTPLUG
> +			/*
> +			 * All the LMB in the set share the same NUMA
> +			 * associativity property. So read that node only once.
> +			 */
> +			if (!first) {
> +				lmb_set_nid(lmb);
> +				first = lmb;
> +			} else {
> +				lmb->nid = first->nid;
> +			}
> +#endif
>   		}
>   	}
>   }
