Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CDF3538FC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Apr 2021 19:06:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FD0Yk0Yc8z3bxp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:06:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FD0YM3XRbz2yyx
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 03:05:54 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FD0Y82fMyz9txtD;
 Sun,  4 Apr 2021 19:05:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id x2rDN5V69KRg; Sun,  4 Apr 2021 19:05:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FD0Y80xvSz9txtB;
 Sun,  4 Apr 2021 19:05:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AB7A08B78E;
 Sun,  4 Apr 2021 19:05:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SL43VzMhlW0d; Sun,  4 Apr 2021 19:05:51 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 15B408B76A;
 Sun,  4 Apr 2021 19:05:51 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/mm: Add cond_resched() while removing hpte
 mappings
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
References: <20210404163148.321346-1-vaibhav@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <cb4a3059-0f5f-d904-7da4-065f2ec9bf0a@csgroup.eu>
Date: Sun, 4 Apr 2021 19:05:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210404163148.321346-1-vaibhav@linux.ibm.com>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Santosh Sivaraj <santosh@fossix.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/04/2021 à 18:31, Vaibhav Jain a écrit :
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
> htap_remove_mapping() that issues hcall to remove hpte mapping. The
> call to cond_resched() is issued every HZ jiffies which should prevent
> the soft-lockup from being reported.
> 
> Suggested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> 
> ---
> Changelog:
> 
> v2: Issue cond_resched() every HZ jiffies instead of each iteration of
>      the loop. [ Christophe Leroy ]
> ---
>   arch/powerpc/mm/book3s64/hash_utils.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 581b20a2feaf..286e7e8cb919 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -338,7 +338,7 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
>   int htab_remove_mapping(unsigned long vstart, unsigned long vend,
>   		      int psize, int ssize)
>   {
> -	unsigned long vaddr;
> +	unsigned long vaddr, time_limit;
>   	unsigned int step, shift;
>   	int rc;
>   	int ret = 0;
> @@ -351,8 +351,19 @@ int htab_remove_mapping(unsigned long vstart, unsigned long vend,
>   
>   	/* Unmap the full range specificied */
>   	vaddr = ALIGN_DOWN(vstart, step);
> +	time_limit = jiffies + HZ;
> +
>   	for (;vaddr < vend; vaddr += step) {
>   		rc = mmu_hash_ops.hpte_removebolted(vaddr, psize, ssize);
> +
> +		/*
> +		 * For large number of mappings introduce a cond_resched()
> +		 * to prevent softlockup warnings.
> +		 */
> +		if (time_after(jiffies, time_limit)) {
> +			cond_resched();
> +			time_limit = jiffies + HZ;
> +		}
>   		if (rc == -ENOENT) {
>   			ret = -ENOENT;
>   			continue;
> 
