Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEDE4D6745
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 18:10:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFXVn1nfgz3bSn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 04:10:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFXVN0H3Rz2xXV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 04:09:45 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KFXVG0cWGz9sSC;
 Fri, 11 Mar 2022 18:09:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jBiKIj-FlMv0; Fri, 11 Mar 2022 18:09:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KFXVF6jL0z9sSB;
 Fri, 11 Mar 2022 18:09:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D61938B78F;
 Fri, 11 Mar 2022 18:09:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HzkxlSnyKj1Z; Fri, 11 Mar 2022 18:09:41 +0100 (CET)
Received: from [192.168.202.87] (unknown [192.168.202.87])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5144D8B763;
 Fri, 11 Mar 2022 18:09:41 +0100 (CET)
Message-ID: <e3fad9c3-213e-72d8-1f85-6f84336dbb94@csgroup.eu>
Date: Fri, 11 Mar 2022 18:09:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v0 2/2] powerpc, drmem: Rename DRMEM_LMB_RESERVED to
 DRMEM_LMB_ISOLATED
Content-Language: fr-FR
To: Bharata B Rao <bharata@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <1519209387-29767-1-git-send-email-bharata@linux.vnet.ibm.com>
 <1519209387-29767-3-git-send-email-bharata@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1519209387-29767-3-git-send-email-bharata@linux.vnet.ibm.com>
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
Cc: nfont@linux.vnet.ibm.com, mwb@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/02/2018 à 11:36, Bharata B Rao a écrit :
> Memory hotplug code uses a temporary LMB flags bit DRMEM_LMB_RESERVED
> to mark the LMB which is currently undergoing hotplug or unplug.
> It is easy to confuse DRMEM_LMB_RESERVED to mean the LMB is reserved
> for which a separate flag bit already exists DRCONF_MEM_RESERVED. Since
> both DRMEM_LMB_RESERVED and DRCONF_MEM_RESERVED operate on the same
> LMB flags word, rename the former to DRMEM_LMB_ISOLATED.

Nothing has happened since this RFC was posted, we still have it as 
'new' in patchwork and it doesn't apply.

I'll flag it as 'RFC' so we keep it in our RFC history.

Christophe

> 
> Signed-off-by: Bharata B Rao <bharata@linux.vnet.ibm.com>
> ---
>   arch/powerpc/include/asm/drmem.h                | 14 ++++-----
>   arch/powerpc/mm/drmem.c                         |  2 +-
>   arch/powerpc/platforms/pseries/hotplug-memory.c | 40 ++++++++++++-------------
>   3 files changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
> index ce242b9..b3fa3f7 100644
> --- a/arch/powerpc/include/asm/drmem.h
> +++ b/arch/powerpc/include/asm/drmem.h
> @@ -72,21 +72,21 @@ static inline u32 drmem_lmb_size(void)
>   	return drmem_info->lmb_size;
>   }
>   
> -#define DRMEM_LMB_RESERVED	0x80000000
> +#define DRMEM_LMB_ISOLATED	0x80000000
>   
> -static inline void drmem_mark_lmb_reserved(struct drmem_lmb *lmb)
> +static inline void drmem_mark_lmb_isolated(struct drmem_lmb *lmb)
>   {
> -	lmb->flags |= DRMEM_LMB_RESERVED;
> +	lmb->flags |= DRMEM_LMB_ISOLATED;
>   }
>   
> -static inline void drmem_remove_lmb_reservation(struct drmem_lmb *lmb)
> +static inline void drmem_remove_lmb_isolation(struct drmem_lmb *lmb)
>   {
> -	lmb->flags &= ~DRMEM_LMB_RESERVED;
> +	lmb->flags &= ~DRMEM_LMB_ISOLATED;
>   }
>   
> -static inline bool drmem_lmb_reserved(struct drmem_lmb *lmb)
> +static inline bool drmem_lmb_isolated(struct drmem_lmb *lmb)
>   {
> -	return lmb->flags & DRMEM_LMB_RESERVED;
> +	return lmb->flags & DRMEM_LMB_ISOLATED;
>   }
>   
>   u64 drmem_lmb_memory_max(void);
> diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
> index 3f18036..652bf3a 100644
> --- a/arch/powerpc/mm/drmem.c
> +++ b/arch/powerpc/mm/drmem.c
> @@ -35,7 +35,7 @@ static u32 drmem_lmb_flags(struct drmem_lmb *lmb)
>   	 * Return the value of the lmb flags field minus the reserved
>   	 * bit used internally for hotplug processing.
>   	 */
> -	return lmb->flags & ~DRMEM_LMB_RESERVED;
> +	return lmb->flags & ~DRMEM_LMB_ISOLATED;
>   }
>   
>   static struct property *clone_property(struct property *prop, u32 prop_sz)
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index c1578f5..2f5ca29 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -467,7 +467,7 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
>   		/* Mark this lmb so we can add it later if all of the
>   		 * requested LMBs cannot be removed.
>   		 */
> -		drmem_mark_lmb_reserved(lmb);
> +		drmem_mark_lmb_isolated(lmb);
>   
>   		lmbs_removed++;
>   		if (lmbs_removed == lmbs_to_remove)
> @@ -478,7 +478,7 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
>   		pr_err("Memory hot-remove failed, adding LMB's back\n");
>   
>   		for_each_drmem_lmb(lmb) {
> -			if (!drmem_lmb_reserved(lmb))
> +			if (!drmem_lmb_isolated(lmb))
>   				continue;
>   
>   			rc = dlpar_add_lmb(lmb);
> @@ -486,20 +486,20 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
>   				pr_err("Failed to add LMB back, drc index %x\n",
>   				       lmb->drc_index);
>   
> -			drmem_remove_lmb_reservation(lmb);
> +			drmem_remove_lmb_isolation(lmb);
>   		}
>   
>   		rc = -EINVAL;
>   	} else {
>   		for_each_drmem_lmb(lmb) {
> -			if (!drmem_lmb_reserved(lmb))
> +			if (!drmem_lmb_isolated(lmb))
>   				continue;
>   
>   			dlpar_release_drc(lmb->drc_index);
>   			pr_info("Memory at %llx was hot-removed\n",
>   				lmb->base_addr);
>   
> -			drmem_remove_lmb_reservation(lmb);
> +			drmem_remove_lmb_isolation(lmb);
>   		}
>   		rc = 0;
>   	}
> @@ -608,7 +608,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>   		if (rc)
>   			break;
>   
> -		drmem_mark_lmb_reserved(lmb);
> +		drmem_mark_lmb_isolated(lmb);
>   	}
>   
>   	if (rc) {
> @@ -616,7 +616,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>   
>   
>   		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
> -			if (!drmem_lmb_reserved(lmb))
> +			if (!drmem_lmb_isolated(lmb))
>   				continue;
>   
>   			rc = dlpar_add_lmb(lmb);
> @@ -624,19 +624,19 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>   				pr_err("Failed to add LMB, drc index %x\n",
>   				       lmb->drc_index);
>   
> -			drmem_remove_lmb_reservation(lmb);
> +			drmem_remove_lmb_isolation(lmb);
>   		}
>   		rc = -EINVAL;
>   	} else {
>   		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
> -			if (!drmem_lmb_reserved(lmb))
> +			if (!drmem_lmb_isolated(lmb))
>   				continue;
>   
>   			dlpar_release_drc(lmb->drc_index);
>   			pr_info("Memory at %llx (drc index %x) was hot-removed\n",
>   				lmb->base_addr, lmb->drc_index);
>   
> -			drmem_remove_lmb_reservation(lmb);
> +			drmem_remove_lmb_isolation(lmb);
>   		}
>   	}
>   
> @@ -760,7 +760,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>   		/* Mark this lmb so we can remove it later if all of the
>   		 * requested LMBs cannot be added.
>   		 */
> -		drmem_mark_lmb_reserved(lmb);
> +		drmem_mark_lmb_isolated(lmb);
>   
>   		lmbs_added++;
>   		if (lmbs_added == lmbs_to_add)
> @@ -771,7 +771,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>   		pr_err("Memory hot-add failed, removing any added LMBs\n");
>   
>   		for_each_drmem_lmb(lmb) {
> -			if (!drmem_lmb_reserved(lmb))
> +			if (!drmem_lmb_isolated(lmb))
>   				continue;
>   
>   			rc = dlpar_remove_lmb(lmb);
> @@ -781,17 +781,17 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>   			else
>   				dlpar_release_drc(lmb->drc_index);
>   
> -			drmem_remove_lmb_reservation(lmb);
> +			drmem_remove_lmb_isolation(lmb);
>   		}
>   		rc = -EINVAL;
>   	} else {
>   		for_each_drmem_lmb(lmb) {
> -			if (!drmem_lmb_reserved(lmb))
> +			if (!drmem_lmb_isolated(lmb))
>   				continue;
>   
>   			pr_info("Memory at %llx (drc index %x) was hot-added\n",
>   				lmb->base_addr, lmb->drc_index);
> -			drmem_remove_lmb_reservation(lmb);
> +			drmem_remove_lmb_isolation(lmb);
>   		}
>   		rc = 0;
>   	}
> @@ -874,14 +874,14 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
>   			break;
>   		}
>   
> -		drmem_mark_lmb_reserved(lmb);
> +		drmem_mark_lmb_isolated(lmb);
>   	}
>   
>   	if (rc) {
>   		pr_err("Memory indexed-count-add failed, removing any added LMBs\n");
>   
>   		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
> -			if (!drmem_lmb_reserved(lmb))
> +			if (!drmem_lmb_isolated(lmb))
>   				continue;
>   
>   			rc = dlpar_remove_lmb(lmb);
> @@ -891,17 +891,17 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
>   			else
>   				dlpar_release_drc(lmb->drc_index);
>   
> -			drmem_remove_lmb_reservation(lmb);
> +			drmem_remove_lmb_isolation(lmb);
>   		}
>   		rc = -EINVAL;
>   	} else {
>   		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
> -			if (!drmem_lmb_reserved(lmb))
> +			if (!drmem_lmb_isolated(lmb))
>   				continue;
>   
>   			pr_info("Memory at %llx (drc index %x) was hot-added\n",
>   				lmb->base_addr, lmb->drc_index);
> -			drmem_remove_lmb_reservation(lmb);
> +			drmem_remove_lmb_isolation(lmb);
>   		}
>   	}
>   
