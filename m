Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E84226CBB60
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 11:45:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm4Yd55wXz3cf6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 20:45:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=F5gJRWm7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm4Xl4JGHz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 20:44:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=F5gJRWm7;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pm4Xk2N3Wz4wj7;
	Tue, 28 Mar 2023 20:44:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1679996695;
	bh=h44tjwPWW2IRwuQCXs8ZriqQ5qG2iC4F4mxOhWNfVck=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=F5gJRWm7WYCKGU8Q8KbQ8Da7oWCG2XDwriXfyP60NS1OhQb9+TdIrYsLHNpqTlhiF
	 R4Uhpez9mvEBvPvasQa8NQSZZUDDcf7zykZMwRbD4lJJICohazRItWFu+hz42L9kIP
	 NnzigE0Fc0+gX7nimp5REAYTGzmdD395VaF1zgu7UNtKlJRHgMgIidbCCbKpSNmjRk
	 vMzYtIPuoMcD14nFNidNlNcraSx1+aD/ay3yrSd8dNvswFbBalIErdrAxncLkek7Lh
	 Soq5ckLM7ksSOjlq6mHUeR9fbdeeH6PRVeni4wyqlf45qb9a5Y1vq1rAv6vqu6SbzM
	 2CpPJwZzloZyA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH] arch/powerpc/kvm: kvmppc_core_vcpu_create_hv: check for
 kzalloc failure
In-Reply-To: <20230323074718.2810914-1-kconsul@linux.vnet.ibm.com>
References: <20230323074718.2810914-1-kconsul@linux.vnet.ibm.com>
Date: Tue, 28 Mar 2023 20:44:48 +1100
Message-ID: <87pm8tcir3.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> kvmppc_vcore_create() might not be able to allocate memory through
> kzalloc. In that case the kvm->arch.online_vcores shouldn't be
> incremented.

I agree that looks wrong.

Have you tried to test what goes wrong if it fails? It looks like it
will break the LPCR update, which likely will cause the guest to crash
horribly.

You could use CONFIG_FAIL_SLAB and fail-nth etc. to fail just one
allocation for a guest. Or probably easier to just hack the code to fail
the 4th time it's called using a static counter.

Doesn't really matter but could be interesting.

> Add a check for kzalloc failure and return with -ENOMEM from
> kvmppc_core_vcpu_create_hv().
>
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 6ba68dd6190b..e29ee755c920 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -2968,13 +2968,17 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
>  			pr_devel("KVM: collision on id %u", id);
>  			vcore = NULL;
>  		} else if (!vcore) {
> +			vcore = kvmppc_vcore_create(kvm,
> +					id & ~(kvm->arch.smt_mode - 1));

That line doesn't need to be wrapped, we allow 90 columns.

> +			if (unlikely(!vcore)) {
> +				mutex_unlock(&kvm->lock);
> +				return -ENOMEM;
> +			}

Rather than introducing a new return point here, I think it would be
preferable to use the existing !vcore case below.

>  			/*
>  			 * Take mmu_setup_lock for mutual exclusion
>  			 * with kvmppc_update_lpcr().
>  			 */
> -			err = -ENOMEM;
> -			vcore = kvmppc_vcore_create(kvm,
> -					id & ~(kvm->arch.smt_mode - 1));

So leave that as is (maybe move the comment down).

And wrap the below in:

 +                      if (vcore) {

>  			mutex_lock(&kvm->arch.mmu_setup_lock);
>  			kvm->arch.vcores[core] = vcore;
>  			kvm->arch.online_vcores++;
 			
 			mutex_unlock(&kvm->arch.mmu_setup_lock);
 +                      }
		}
	}

Meaning the vcore == NULL case will fall through to here and return via
this existing path:

	mutex_unlock(&kvm->lock);

	if (!vcore)
		return err;


cheers
