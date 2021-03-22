Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9530E3437E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 05:25:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3hHW4DWMz301j
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 15:25:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=uL11HUWQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=uL11HUWQ; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3hH12927z2y0K
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 15:24:42 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id x126so10087854pfc.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 21:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Jk/UWUBTuek25gcQf24w6j3TceVnzQwrN0sozkH+Waw=;
 b=uL11HUWQs1TG7BouVaWfuk5JJw8rnibWEaFol58YX68TGaw87bg0xtmsLs+vpt9SZE
 g54JAaEnJY83sx6dZ9oWXsSUunCZxJF9UFQLIpyqaTO0Gwy56YhwSCiQgdUZqvqSX/5U
 HkYqD4WJ+ggNIC0/w+WEzYRSX9YQGblhUINRlOMxVjWe9esyL3tdB6XZEs9MSZn1N543
 ne6MN0ccvmNzFEsmY2ej5NoLEZkZOmCxnK2MX4xiu2YquyCwyYAsQ9HbwC1fYBsmMj2t
 teHIO7aPYVv6apfJnQhWfXW0wgFFxvST5FkNHC/zptDZr7RtRZt96A1l91Go2+ahpS+p
 d8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Jk/UWUBTuek25gcQf24w6j3TceVnzQwrN0sozkH+Waw=;
 b=p/I4XiocXxAcBom3/u10HxyHuyzgYdYcKrLEIEGXe0mDTMdx074Eh5ECRGne9KkTjt
 Fmn9xDVrjCFmCt9XEsogYgOiHX4GKnpxk89+w9PX6b0Dpah5WbscDybBURifd9bmCsdB
 KbYnvgRp3rHxlsLhELAaKPxNv9UvEKpt5yoEvH+NjhiJXQc2Z/B9UBe7Mtoawy+2nrII
 eCuI/GRHWv8qHMczgkN0JVBBf7KRmHLHlkIk4Cw94/KcYi+PvmHGX4/Q7BEmbEW1XsfJ
 WM8UHJXs0pdvYblxbQwsG9WEqgd49FYzPGOiLlBiWkod9e9BxFS+XEGgf4F1xrNjl1l1
 n2nQ==
X-Gm-Message-State: AOAM532iWncGVK1HdYRDax+Sfq6M9Nfixxw7DGEXJST4L0DvgFuIPlzu
 FblUl2iguTaSZNlwroYOAk5cOVYqNq0AzYB0
X-Google-Smtp-Source: ABdhPJzlm+eN9ZsqQHWRsgkUDD4D61FDKWnpkvNXnM4754KsmWa40BR5F/hzUFntII4amj99IIWjyg==
X-Received: by 2002:a63:db10:: with SMTP id e16mr21370248pgg.234.1616387076755; 
 Sun, 21 Mar 2021 21:24:36 -0700 (PDT)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id g7sm10412878pgb.10.2021.03.21.21.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Mar 2021 21:24:36 -0700 (PDT)
Message-ID: <47284fdd-51ef-5ba7-487b-dfb46ec2816e@ozlabs.ru>
Date: Mon, 22 Mar 2021 15:24:32 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH v3 16/41] KVM: PPC: Book3S HV P9: Move radix MMU switching
 instructions together
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-17-npiggin@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210305150638.2675513-17-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/03/2021 02:06, Nicholas Piggin wrote:
> Switching the MMU from radix<->radix mode is tricky particularly as the
> MMU can remain enabled and requires a certain sequence of SPR updates.
> Move these together into their own functions.
> 
> This also includes the radix TLB check / flush because it's tied in to
> MMU switching due to tlbiel getting LPID from LPIDR.
> 
> (XXX: isync / hwsync synchronisation TBD)


Looks alright but what is this comment about? Is something missing or 
just sub optimal?


> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>


> ---
>   arch/powerpc/kvm/book3s_hv.c | 55 +++++++++++++++++++++---------------
>   1 file changed, 32 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index f1230f9d98ba..b9cae42b9cd5 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3449,12 +3449,38 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
>   	trace_kvmppc_run_core(vc, 1);
>   }
>   
> +static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u64 lpcr)
> +{
> +	struct kvmppc_vcore *vc = vcpu->arch.vcore;
> +	struct kvm_nested_guest *nested = vcpu->arch.nested;
> +	u32 lpid;
> +
> +	lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
> +
> +	mtspr(SPRN_LPID, lpid);
> +	mtspr(SPRN_LPCR, lpcr);
> +	mtspr(SPRN_PID, vcpu->arch.pid);
> +	isync();
> +
> +	/* TLBIEL must have LPIDR set, so set guest LPID before flushing. */
> +	kvmppc_check_need_tlb_flush(kvm, vc->pcpu, nested);
> +}
> +
> +static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
> +{
> +	mtspr(SPRN_PID, pid);
> +	mtspr(SPRN_LPID, kvm->arch.host_lpid);
> +	mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
> +	isync();
> +}
> +
>   /*
>    * Load up hypervisor-mode registers on P9.
>    */
>   static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>   				     unsigned long lpcr)
>   {
> +	struct kvm *kvm = vcpu->kvm;
>   	struct kvmppc_vcore *vc = vcpu->arch.vcore;
>   	s64 hdec;
>   	u64 tb, purr, spurr;
> @@ -3477,12 +3503,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>   	 * P8 and P9 suppress the HDEC exception when LPCR[HDICE] = 0,
>   	 * so set HDICE before writing HDEC.
>   	 */
> -	mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr | LPCR_HDICE);
> +	mtspr(SPRN_LPCR, kvm->arch.host_lpcr | LPCR_HDICE);
>   	isync();
>   
>   	hdec = time_limit - mftb();
>   	if (hdec < 0) {
> -		mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr);
> +		mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
>   		isync();
>   		return BOOK3S_INTERRUPT_HV_DECREMENTER;
>   	}
> @@ -3517,7 +3543,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>   	}
>   	mtspr(SPRN_CIABR, vcpu->arch.ciabr);
>   	mtspr(SPRN_IC, vcpu->arch.ic);
> -	mtspr(SPRN_PID, vcpu->arch.pid);
>   
>   	mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
>   	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
> @@ -3531,8 +3556,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>   
>   	mtspr(SPRN_AMOR, ~0UL);
>   
> -	mtspr(SPRN_LPCR, lpcr);
> -	isync();
> +	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
>   
>   	kvmppc_xive_push_vcpu(vcpu);
>   
> @@ -3571,7 +3595,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>   		mtspr(SPRN_DAWR1, host_dawr1);
>   		mtspr(SPRN_DAWRX1, host_dawrx1);
>   	}
> -	mtspr(SPRN_PID, host_pidr);
>   
>   	/*
>   	 * Since this is radix, do a eieio; tlbsync; ptesync sequence in
> @@ -3586,9 +3609,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>   	if (cpu_has_feature(CPU_FTR_ARCH_31))
>   		asm volatile(PPC_CP_ABORT);
>   
> -	mtspr(SPRN_LPID, vcpu->kvm->arch.host_lpid);	/* restore host LPID */
> -	isync();
> -
>   	vc->dpdes = mfspr(SPRN_DPDES);
>   	vc->vtb = mfspr(SPRN_VTB);
>   	mtspr(SPRN_DPDES, 0);
> @@ -3605,7 +3625,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>   	}
>   
>   	mtspr(SPRN_HDEC, 0x7fffffff);
> -	mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr);
> +
> +	switch_mmu_to_host_radix(kvm, host_pidr);
>   
>   	return trap;
>   }
> @@ -4138,7 +4159,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>   {
>   	struct kvm_run *run = vcpu->run;
>   	int trap, r, pcpu;
> -	int srcu_idx, lpid;
> +	int srcu_idx;
>   	struct kvmppc_vcore *vc;
>   	struct kvm *kvm = vcpu->kvm;
>   	struct kvm_nested_guest *nested = vcpu->arch.nested;
> @@ -4212,13 +4233,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>   	vc->vcore_state = VCORE_RUNNING;
>   	trace_kvmppc_run_core(vc, 0);
>   
> -	if (cpu_has_feature(CPU_FTR_HVMODE)) {


The new location of mtspr(SPRN_LPID, lpid) does not check for 
CPU_FTR_HVMODE anymore, is this going to work with HV KVM on pseries? 
Thanks,




> -		lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
> -		mtspr(SPRN_LPID, lpid);
> -		isync();
> -		kvmppc_check_need_tlb_flush(kvm, pcpu, nested);
> -	}
> -
>   	guest_enter_irqoff();
>   
>   	srcu_idx = srcu_read_lock(&kvm->srcu);
> @@ -4237,11 +4251,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>   
>   	srcu_read_unlock(&kvm->srcu, srcu_idx);
>   
> -	if (cpu_has_feature(CPU_FTR_HVMODE)) {
> -		mtspr(SPRN_LPID, kvm->arch.host_lpid);
> -		isync();
> -	}
> -
>   	set_irq_happened(trap);
>   
>   	kvmppc_set_host_core(pcpu);
> 

-- 
Alexey
