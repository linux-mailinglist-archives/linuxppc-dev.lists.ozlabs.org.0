Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA28B8C5D9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 04:08:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467Xzf5yRDzDqZy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 12:07:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467Xxn3Y2BzDqHG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 12:06:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 467Xxm5bc9z9s7T;
 Wed, 14 Aug 2019 12:06:20 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH] powerpc/64s/radix: introduce option to disable
 broadcast tlbie
In-Reply-To: <20190731123203.6370-1-npiggin@gmail.com>
References: <20190731123203.6370-1-npiggin@gmail.com>
Date: Wed, 14 Aug 2019 12:06:19 +1000
Message-ID: <87zhkcqz50.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

Just a few comments.

Nicholas Piggin <npiggin@gmail.com> writes:
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index 71f7fede2fa4..56ceecbd3d5c 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -285,6 +286,30 @@ static inline void _tlbie_pid(unsigned long pid, unsigned long ric)
>  	asm volatile("eieio; tlbsync; ptesync": : :"memory");
>  }
>  
> +struct tlbiel_pid {
> +	unsigned long pid;
> +	unsigned long ric;
> +};
> +
> +static void do_tlbiel_pid(void *info)
> +{
> +	struct tlbiel_pid *t = info;
> +
> +	if (t->ric == RIC_FLUSH_TLB)
> +		_tlbiel_pid(t->pid, RIC_FLUSH_TLB);
> +	else if (t->ric == RIC_FLUSH_PWC)
> +		_tlbiel_pid(t->pid, RIC_FLUSH_PWC);
> +	else
> +		_tlbiel_pid(t->pid, RIC_FLUSH_ALL);
> +}
> +
> +static inline void _tlbiel_pid_broadcast(const struct cpumask *cpus,
> +				unsigned long pid, unsigned long ric)

Can we call these "multicast" instead of "broadcast"?

I think that's more accurate, and avoids confusion with tlbie which
literally does a broadcast (at least architecturally).

> @@ -524,6 +604,12 @@ static bool mm_needs_flush_escalation(struct mm_struct *mm)
>  	return false;
>  }
>  
> +static bool tlbie_enabled = true;
> +static bool use_tlbie(void)
> +{
> +	return tlbie_enabled;
> +}

No synchronisation, but that's OK. Would probably be good to have
a comment though explaining why.

We could use a static_key but I guess the overhead of a comparison and
branch is in the noise vs the tlbie/tlbiel.

> @@ -1100,3 +1221,13 @@ extern void radix_kvm_prefetch_workaround(struct mm_struct *mm)
>  }
>  EXPORT_SYMBOL_GPL(radix_kvm_prefetch_workaround);
>  #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
> +
> +static int __init radix_tlb_setup(void)
> +{
> +	debugfs_create_bool("tlbie_enabled", 0600,
> +			powerpc_debugfs_root,
> +			&tlbie_enabled);
> +
> +	return 0;
> +}
> +arch_initcall(radix_tlb_setup);

For working around hardware bugs we would want a command line parameter
or other boot time way to flip this. But I guess you're saying because
we haven't converted all uses of tlbie we can't really support that
anyway, and so a runtime switch is sufficient?

cheers
