Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 324AA8A4F02
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 14:28:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DTEXAucD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJ5zv2yLYz3dWc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 22:28:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DTEXAucD;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJ5zB2WG6z3cnv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 22:27:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713184054;
	bh=Kg0IaaFvkx0vPahWnl4bGsKUwrTtxLTCmAqwqLLNhTg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DTEXAucDsJ8VGX3CWQW/+zFc9hYesJ1AQoYC/tgDzYYvxzgwWttp7PwmjONSIIknC
	 voyIOgLBNjIKat/sXBpgag8hT7NbXvQ5zdBhhCXTp9ejd8f+3KuYJeGPDLi/dONU8Z
	 FT19bxOAVbxsILJSynJuocMSKUA/4GeE9bGycq3LrCttC7cObYxFS6vcItJZERXO5f
	 wQhPf3T4PcISwrjwyawazbTwIiEpXZrneAENXkD0xQvstWH1tbQLPC2c2hCn2jTvSQ
	 xurQyggaf4ZdWOzQhAucric3Rb8cBh37xdKCtze3QQ10u78cZjw4WKZL4nys0/J1jr
	 G1l/OvnLUYpgA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VJ5z968qgz4wcb;
	Mon, 15 Apr 2024 22:27:33 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV nestedv2: Cancel pending DEC
 exception
In-Reply-To: <20240415035731.103097-1-vaibhav@linux.ibm.com>
References: <20240415035731.103097-1-vaibhav@linux.ibm.com>
Date: Mon, 15 Apr 2024 22:27:32 +1000
Message-ID: <8734rmdd57.fsf@mail.lhotse>
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Vaibhav Jain <vaibhav@linux.ibm.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:
> This reverts commit 180c6b072bf3 ("KVM: PPC: Book3S HV nestedv2: Do not
> cancel pending decrementer exception") [1] which prevented canceling a
> pending HDEC exception for nestedv2 KVM guests. It was done to avoid
> overhead of a H_GUEST_GET_STATE hcall to read the 'DEC expiry TB' register
> which was higher compared to handling extra decrementer exceptions.
>
> However recent benchmarks indicate that overhead of not handling 'DECR'
> expiry for Nested KVM Guest(L2) is higher and results in much larger exits
> to Pseries Host(L1) as indicated by the Unixbench-arithoh bench[2]

Any reason you chose that benchmark? At least on my system it seems to
compile to an infinite loop incrementing a single register.

Presumably the change is still good, but a more well known benchmark
would be good, even if it's just stress-ng, at least that's a bit more
standard.

cheers

> Metric	    	      | Current upstream    | Revert [1]  | Difference %
> ========================================================================
> arithoh-count (10)    |	3244831634	    | 3403089673  | +04.88%
> kvm_hv:kvm_guest_exit |	513558		    | 152441	  | -70.32%
> probe:kvmppc_gsb_recv |	28060		    | 28110	  | +00.18%
>
> N=1
>
> As indicated by the data above that reverting [1] results in substantial
> reduction in number of L2->L1 exits with only slight increase in number of
> H_GUEST_GET_STATE hcalls to read the value of 'DEC expiry TB'. This results
> in an overall ~4% improvement of arithoh[2] throughput.
>
> [1] commit 180c6b072bf3 ("KVM: PPC: Book3S HV nestedv2: Do not cancel pending decrementer exception")
> [2] https://github.com/kdlucas/byte-unixbench/
>
> Fixes: 180c6b072bf3 ("KVM: PPC: Book3S HV nestedv2: Do not cancel pending decrementer exception")
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>
> ---
> Changelog:
> Since v1: https://lore.kernel.org/all/20240313072625.76804-1-vaibhav@linux.ibm.com
> * Updated/Corrected patch title and description
> * Included data on test benchmark results for Unixbench-arithoh bench.
> ---
>  arch/powerpc/kvm/book3s_hv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 8e86eb577eb8..692a7c6f5fd9 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4857,7 +4857,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>  	 * entering a nested guest in which case the decrementer is now owned
>  	 * by L2 and the L1 decrementer is provided in hdec_expires
>  	 */
> -	if (!kvmhv_is_nestedv2() && kvmppc_core_pending_dec(vcpu) &&
> +	if (kvmppc_core_pending_dec(vcpu) &&
>  			((tb < kvmppc_dec_expires_host_tb(vcpu)) ||
>  			 (trap == BOOK3S_INTERRUPT_SYSCALL &&
>  			  kvmppc_get_gpr(vcpu, 3) == H_ENTER_NESTED)))
> -- 
> 2.44.0
