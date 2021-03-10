Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D971333876
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 10:15:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwRHj0w3nz3d4j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 20:15:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwRHK62fPz30Ng
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 20:14:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DwRHB5pJwz9tyyl;
 Wed, 10 Mar 2021 10:14:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0ls_2FiszXcP; Wed, 10 Mar 2021 10:14:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DwRHB4KSkz9tyyk;
 Wed, 10 Mar 2021 10:14:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 97B6A8B786;
 Wed, 10 Mar 2021 10:14:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FDKXEONqcFgv; Wed, 10 Mar 2021 10:14:47 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 140C58B77E;
 Wed, 10 Mar 2021 10:14:47 +0100 (CET)
Subject: Re: [PATCH] powerpc/mm: Add cond_resched() while removing hpte
 mappings
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210310075938.361656-1-vaibhav@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6acf3ba8-296d-a8f7-4242-eeb5f05edf40@csgroup.eu>
Date: Wed, 10 Mar 2021 10:14:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310075938.361656-1-vaibhav@linux.ibm.com>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/03/2021 à 08:59, Vaibhav Jain a écrit :
> While removing large number of mappings from hash page tables for
> large memory systems as soft-lockup is reported because of the time
> spent inside htap_remove_mapping() like one below:
> 
>   watchdog: BUG: soft lockup - CPU#8 stuck for 23s!
>   <snip>
>   NIP plpar_hcall+0x38/0x58
>   LR  pSeries_lpar_hpte_invalidate+0x68/0xb0
>   Call Trace:
>    0x1fffffffffff000 (unreliable)
>    pSeries_lpar_hpte_removebolted+0x9c/0x230
>    hash__remove_section_mapping+0xec/0x1c0
>    remove_section_mapping+0x28/0x3c
>    arch_remove_memory+0xfc/0x150
>    devm_memremap_pages_release+0x180/0x2f0
>    devm_action_release+0x30/0x50
>    release_nodes+0x28c/0x300
>    device_release_driver_internal+0x16c/0x280
>    unbind_store+0x124/0x170
>    drv_attr_store+0x44/0x60
>    sysfs_kf_write+0x64/0x90
>    kernfs_fop_write+0x1b0/0x290
>    __vfs_write+0x3c/0x70
>    vfs_write+0xd4/0x270
>    ksys_write+0xdc/0x130
>    system_call+0x5c/0x70
> 
> Fix this by adding a cond_resched() to the loop in
> htap_remove_mapping() that issues hcall to remove hpte mapping. This
> should prevent the soft-lockup from being reported.

Isn't it overkill to call is at each iteration ?

Looking at a few other places, there is some mitigation. For instance fadump_free_reserved_memory() 
does it based on elapsed time. Another exemple is drmem_lmb_next() doing it every 16 iteration.


> 
> Suggested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>   arch/powerpc/mm/book3s64/hash_utils.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 581b20a2feaf..ea3945c70b18 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -359,6 +359,8 @@ int htab_remove_mapping(unsigned long vstart, unsigned long vend,
>   		}
>   		if (rc < 0)
>   			return rc;
> +
> +		cond_resched();
>   	}
>   
>   	return ret;
> 

Christophe
