Return-Path: <linuxppc-dev+bounces-17690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMKFIEH1p2mtmwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:02:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB261FD10B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:02:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQmsV01kgz3bp0;
	Wed, 04 Mar 2026 20:02:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772614973;
	cv=none; b=UsswrcPmgUKA15Dhx3lOJrfUvGSgxXfJ+uRA9TZl/DI6bpKHP9wsEsqx4qNiJAazD4+mfikFG1dT3RzaZcrVKU2hY44h909mqLL5M19XcUxFT3vgD8Tqkr5lSxfaZSCm1d7gawlXzaBaQKSDTRfm7bCc5NlLVJdeCTidstW8GwoBXLc+vQ/KNen1gUK+TJQ6Vhf+qyLDnuU5OeS/IWks9MclaXEijea5aY8UanhHxUpImI8DZsiyW9PVTtuh3mCACfVuvdtCsCACX5dpZMIFMyeHoOh8qehvq4aaRBWjoPgOURaEIWE4kxzvR/CAQQcjtZQeWdQqqMNxnFas82asbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772614973; c=relaxed/relaxed;
	bh=7DHo8nnofvS0v9zWPBa2XQHrIeh/6sZBlfpPvEqhW5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XcL3roOlo9KsHMRn/mUpo1653fQIiyicGGg1FvB92E2dopMSaVKNml0OcQ+vJxoUVcR9U0aqBaMmlIx/D0E1r+68JtanOedHXaJG15dB+5fvwGabW3E8WEpjkSO1lCdkdfIZWHO5uAhF5z8Ij5ut/nhZgq5R0I/UV0zIdQrgEmKV3ydKFmFL+/+bG3RLZsGCA4S1o2582lNIyhPW/xoxY1hS0Az2PVuvZ7462fxHqlf1jhzg3spP6rO900f923tCu9Qho+MxBGNoGhqsDDaqFcxViWLb8xln7HA6sqmNYdAexIWt+bzxn3RMheuVRW3L/4z2guspATlZVxpVYZDGgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HhixUQ6H; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HhixUQ6H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQmsS6M1mz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 20:02:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB11F60097;
	Wed,  4 Mar 2026 09:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A82C19423;
	Wed,  4 Mar 2026 09:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772614970;
	bh=kxfIGChB2wC+nGHup8CVs7dyrylhcmHq5LK6PQjxQRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HhixUQ6Hh4hoRpXlkVOmTId9s+P0IjU3EDdIeeT9+mpTbOUx+A28yRnTUnROHq7y7
	 JdwDgCknbvOQ8P4fwjeO82HZKw4HYFFSZqansP/wuuPBpm/b3ldEYMU5ieW8DmGakr
	 fJHL4DP0s8AddWHaYFgzv54RvRLx9oiN6ycuU0jK7mroppUgjLyzi8X5GhxYSKZ+u4
	 rfUEaoVOOZo0SQBMWziJ5uh94KT5cN2O7wwEDZRWpMav6EwASPxK8pST3CiQOUkJ3q
	 KTX+0X8FOUH+zchvZ7qlwozteoijtM7XLPnXqtCyYvoitu6x/Q6mVfWu3G1ho8y+k8
	 uRWnMQmllPnfA==
Message-ID: <9d07ed92-ca0d-4012-bbb9-b2dc37f17f44@kernel.org>
Date: Wed, 4 Mar 2026 10:02:46 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 06/10] powerpc/64s: Kill the unused argument of
 exit_lazy_flush_tlb
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Hugh Dickins <hughd@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <cover.1772013273.git.ritesh.list@gmail.com>
 <9385e4fbc4bb99ba47ea6070fd82233e6576c228.1772013273.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <9385e4fbc4bb99ba47ea6070fd82233e6576c228.1772013273.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 9DB261FD10B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17690-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-mm@kvack.org,m:hughd@google.com,m:akpm@linux-foundation.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:aneesh.kumar@kernel.org,m:venkat88@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action



Le 25/02/2026 à 12:04, Ritesh Harjani (IBM) a écrit :
> In previous patch we removed the only caller of exit_lazy_flush_tlb()
> which was passing always_flush = false in it's second argument.
> 
> With that gone, all the callers of exit_lazy_flush_tlb() are local to
> radix_pgtable.c and there is no need of an additional argument.
> 
> This patch does the required cleanup. There should not be any
> functionality change in this patch.
> 
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   arch/powerpc/mm/book3s64/internal.h  |  2 --
>   arch/powerpc/mm/book3s64/pgtable.c   |  2 --
>   arch/powerpc/mm/book3s64/radix_tlb.c | 14 +++++---------
>   3 files changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/internal.h b/arch/powerpc/mm/book3s64/internal.h
> index cad08d83369c..f7055251c8b7 100644
> --- a/arch/powerpc/mm/book3s64/internal.h
> +++ b/arch/powerpc/mm/book3s64/internal.h
> @@ -31,6 +31,4 @@ static inline bool slb_preload_disabled(void)
>   
>   void hpt_do_stress(unsigned long ea, unsigned long hpte_group);
>   
> -void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush);
> -
>   #endif /* ARCH_POWERPC_MM_BOOK3S64_INTERNAL_H */
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 84284dff650a..52d3e0c4a030 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -23,8 +23,6 @@
>   #include <mm/mmu_decl.h>
>   #include <trace/events/thp.h>
>   
> -#include "internal.h"
> -
>   struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
>   EXPORT_SYMBOL_GPL(mmu_psize_defs);
>   
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index 9e1f6558d026..339bd276840b 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -19,8 +19,6 @@
>   #include <asm/cputhreads.h>
>   #include <asm/plpar_wrappers.h>
>   
> -#include "internal.h"
> -
>   /*
>    * tlbiel instruction for radix, set invalidation
>    * i.e., r=1 and is=01 or is=10 or is=11
> @@ -660,7 +658,7 @@ static bool mm_needs_flush_escalation(struct mm_struct *mm)
>    * If always_flush is true, then flush even if this CPU can't be removed
>    * from mm_cpumask.
>    */
> -void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush)
> +static void exit_lazy_flush_tlb(struct mm_struct *mm)
>   {
>   	unsigned long pid = mm->context.id;
>   	int cpu = smp_processor_id();
> @@ -703,19 +701,17 @@ void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush)
>   	if (cpumask_test_cpu(cpu, mm_cpumask(mm))) {
>   		dec_mm_active_cpus(mm);
>   		cpumask_clear_cpu(cpu, mm_cpumask(mm));
> -		always_flush = true;
>   	}
>   
>   out:
> -	if (always_flush)
> -		_tlbiel_pid(pid, RIC_FLUSH_ALL);
> +	_tlbiel_pid(pid, RIC_FLUSH_ALL);
>   }
>   
>   #ifdef CONFIG_SMP
>   static void do_exit_flush_lazy_tlb(void *arg)
>   {
>   	struct mm_struct *mm = arg;
> -	exit_lazy_flush_tlb(mm, true);
> +	exit_lazy_flush_tlb(mm);
>   }
>   
>   static void exit_flush_lazy_tlbs(struct mm_struct *mm)
> @@ -777,7 +773,7 @@ static enum tlb_flush_type flush_type_needed(struct mm_struct *mm, bool fullmm)
>   			 * to trim.
>   			 */
>   			if (tick_and_test_trim_clock()) {
> -				exit_lazy_flush_tlb(mm, true);
> +				exit_lazy_flush_tlb(mm);
>   				return FLUSH_TYPE_NONE;
>   			}
>   		}
> @@ -823,7 +819,7 @@ static enum tlb_flush_type flush_type_needed(struct mm_struct *mm, bool fullmm)
>   		if (current->mm == mm)
>   			return FLUSH_TYPE_LOCAL;
>   		if (cpumask_test_cpu(cpu, mm_cpumask(mm)))
> -			exit_lazy_flush_tlb(mm, true);
> +			exit_lazy_flush_tlb(mm);
>   		return FLUSH_TYPE_NONE;
>   	}
>   


