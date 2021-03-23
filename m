Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9048345ABF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 10:25:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4QvC6J9Gz3bcZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 20:25:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=rEO47+3O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=rEO47+3O; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Qtk4GjLz301J
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 20:24:43 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 mz6-20020a17090b3786b02900c16cb41d63so9870850pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 02:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FQy724f3aSfvwjrdvT2z4SOy8aIlcRPra52/t5MOpx8=;
 b=rEO47+3OUtSrfju69fa+rQ1UBkGA2gR0fqGsaAPd1YpPo0NaidzSI/zk+vaoG+NIrC
 mVRrgTyOb8cjVVExv8quxGtyvxrt8XfpIJrkg2QwoFxP0ZvheKx3Wor9TyAV6v8jqNJw
 eJQWCWFOCRpRefoHxKXHZwczBFPDYFKN/VA7MHYYYzyxdrQOkeX2BozTiVROJ2XAVUZ8
 W1m1ypPeeF11bHUUeLwxGvfE+zc9Jie9Ku8cs1KyeMqTMf1kDzgEl0B5wiczqZMOmxGs
 XDuedGDR8IIKtqETaWYSHdz3mmkixOBF2oufBx5N3q54jsC12J2feJpKttV9R3h1iy9t
 VE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FQy724f3aSfvwjrdvT2z4SOy8aIlcRPra52/t5MOpx8=;
 b=VMj9JFcOLFfVYA/Icctm7TPVuQZIpqObJfDhDVvjjyYEDZPKw25JZqCjnTekp7rFZN
 6H3mutDXnv0J33H5vzewPmj8rmKfzGPoO9jJCtRxCXUctgetJ1LNY5cWhqsLUc++Fk13
 5JxX8nfILdYYyOSwmmmpreWDhr0Hb81tWBt+R/bnL1dM2jVNgV90fa21+0tbZT+MELGC
 7ZSQwISLvil5VPpRgGAmDgPhc+aoo2qgxbBP2iSUt+SVvkz8W5I3bMLPeb/I/BS6/D4F
 ofdzeZ+aatHlZyK6D/Wp2w1yLo+TB/buCZTvgFF5LBb23bQHY/E/N9EhgIVeHScQOwDH
 2zPA==
X-Gm-Message-State: AOAM530GlTGxr/oBDIkcF7eYIi/RUBtMvqaPzdpjj+IN0yq/g/2AusYS
 3vyb1HPj+vOkZGPp8p3cYxCgLCgU24uQZLJ8
X-Google-Smtp-Source: ABdhPJyg/qMeDW3/8CDbOt7Z+HACOx4jsQl/LjrCzmWFCtIroEP3zOp9T5Iu3/1ZsF3Pk+Zt96GTfg==
X-Received: by 2002:a17:90a:a414:: with SMTP id
 y20mr3586324pjp.77.1616491481534; 
 Tue, 23 Mar 2021 02:24:41 -0700 (PDT)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id z4sm14825369pgv.73.2021.03.23.02.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 02:24:41 -0700 (PDT)
Message-ID: <994fb056-4445-4301-faca-b53394fb6b35@ozlabs.ru>
Date: Tue, 23 Mar 2021 20:24:37 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH v4 22/46] KVM: PPC: Book3S HV P9: Stop handling hcalls in
 real-mode in the P9 path
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-23-npiggin@gmail.com>
 <6901d698-f3d8-024b-3aa1-47b157bbd57d@ozlabs.ru>
 <1616490842.v369xyk7do.astroid@bobo.none>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <1616490842.v369xyk7do.astroid@bobo.none>
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



On 23/03/2021 20:16, Nicholas Piggin wrote:
> Excerpts from Alexey Kardashevskiy's message of March 23, 2021 7:02 pm:
>>
>>
>> On 23/03/2021 12:02, Nicholas Piggin wrote:
>>> In the interest of minimising the amount of code that is run in
>>> "real-mode", don't handle hcalls in real mode in the P9 path.
>>>
>>> POWER8 and earlier are much more expensive to exit from HV real mode
>>> and switch to host mode, because on those processors HV interrupts get
>>> to the hypervisor with the MMU off, and the other threads in the core
>>> need to be pulled out of the guest, and SLBs all need to be saved,
>>> ERATs invalidated, and host SLB reloaded before the MMU is re-enabled
>>> in host mode. Hash guests also require a lot of hcalls to run. The
>>> XICS interrupt controller requires hcalls to run.
>>>
>>> By contrast, POWER9 has independent thread switching, and in radix mode
>>> the hypervisor is already in a host virtual memory mode when the HV
>>> interrupt is taken. Radix + xive guests don't need hcalls to handle
>>> interrupts or manage translations.
>>>
>>> So it's much less important to handle hcalls in real mode in P9.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>    arch/powerpc/include/asm/kvm_ppc.h      |  5 ++
>>>    arch/powerpc/kvm/book3s_hv.c            | 57 ++++++++++++++++----
>>>    arch/powerpc/kvm/book3s_hv_rmhandlers.S |  5 ++
>>>    arch/powerpc/kvm/book3s_xive.c          | 70 +++++++++++++++++++++++++
>>>    4 files changed, 127 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
>>> index 73b1ca5a6471..db6646c2ade2 100644
>>> --- a/arch/powerpc/include/asm/kvm_ppc.h
>>> +++ b/arch/powerpc/include/asm/kvm_ppc.h
>>> @@ -607,6 +607,7 @@ extern void kvmppc_free_pimap(struct kvm *kvm);
>>>    extern int kvmppc_xics_rm_complete(struct kvm_vcpu *vcpu, u32 hcall);
>>>    extern void kvmppc_xics_free_icp(struct kvm_vcpu *vcpu);
>>>    extern int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 cmd);
>>> +extern int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req);
>>>    extern u64 kvmppc_xics_get_icp(struct kvm_vcpu *vcpu);
>>>    extern int kvmppc_xics_set_icp(struct kvm_vcpu *vcpu, u64 icpval);
>>>    extern int kvmppc_xics_connect_vcpu(struct kvm_device *dev,
>>> @@ -639,6 +640,8 @@ static inline int kvmppc_xics_enabled(struct kvm_vcpu *vcpu)
>>>    static inline void kvmppc_xics_free_icp(struct kvm_vcpu *vcpu) { }
>>>    static inline int kvmppc_xics_hcall(struct kvm_vcpu *vcpu, u32 cmd)
>>>    	{ return 0; }
>>> +static inline int kvmppc_xive_xics_hcall(struct kvm_vcpu *vcpu, u32 req)
>>> +	{ return 0; }
>>>    #endif
>>>    
>>>    #ifdef CONFIG_KVM_XIVE
>>> @@ -673,6 +676,7 @@ extern int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 irq,
>>>    			       int level, bool line_status);
>>>    extern void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu);
>>>    extern void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu);
>>> +extern void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu);
>>>    
>>>    static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>>>    {
>>> @@ -714,6 +718,7 @@ static inline int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 ir
>>>    				      int level, bool line_status) { return -ENODEV; }
>>>    static inline void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu) { }
>>>    static inline void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu) { }
>>> +static inline void kvmppc_xive_cede_vcpu(struct kvm_vcpu *vcpu) { }
>>>    
>>>    static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>>>    	{ return 0; }
>>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>>> index fa7614c37e08..17739aaee3d8 100644
>>> --- a/arch/powerpc/kvm/book3s_hv.c
>>> +++ b/arch/powerpc/kvm/book3s_hv.c
>>> @@ -1142,12 +1142,13 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>>>    }
>>>    
>>>    /*
>>> - * Handle H_CEDE in the nested virtualization case where we haven't
>>> - * called the real-mode hcall handlers in book3s_hv_rmhandlers.S.
>>> + * Handle H_CEDE in the P9 path where we don't call the real-mode hcall
>>> + * handlers in book3s_hv_rmhandlers.S.
>>> + *
>>>     * This has to be done early, not in kvmppc_pseries_do_hcall(), so
>>>     * that the cede logic in kvmppc_run_single_vcpu() works properly.
>>>     */
>>> -static void kvmppc_nested_cede(struct kvm_vcpu *vcpu)
>>> +static void kvmppc_cede(struct kvm_vcpu *vcpu)
>>>    {
>>>    	vcpu->arch.shregs.msr |= MSR_EE;
>>>    	vcpu->arch.ceded = 1;
>>> @@ -1403,9 +1404,15 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
>>>    		/* hcall - punt to userspace */
>>>    		int i;
>>>    
>>> -		/* hypercall with MSR_PR has already been handled in rmode,
>>> -		 * and never reaches here.
>>> -		 */
>>> +		if (unlikely(vcpu->arch.shregs.msr & MSR_PR)) {
>>> +			/*
>>> +			 * Guest userspace executed sc 1, reflect it back as a
>>> +			 * privileged program check interrupt.
>>> +			 */
>>> +			kvmppc_core_queue_program(vcpu, SRR1_PROGPRIV);
>>> +			r = RESUME_GUEST;
>>> +			break;
>>> +		}
>>>    
>>>    		run->papr_hcall.nr = kvmppc_get_gpr(vcpu, 3);
>>>    		for (i = 0; i < 9; ++i)
>>> @@ -3663,6 +3670,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>>>    	return trap;
>>>    }
>>>    
>>> +static inline bool hcall_is_xics(unsigned long req)
>>> +{
>>> +	return (req == H_EOI || req == H_CPPR || req == H_IPI ||
>>> +		req == H_IPOLL || req == H_XIRR || req == H_XIRR_X);
>>
>> Do not need braces :)
>>
>>
>>> +}
>>> +
>>>    /*
>>>     * Virtual-mode guest entry for POWER9 and later when the host and
>>>     * guest are both using the radix MMU.  The LPIDR has already been set.
>>> @@ -3774,15 +3787,36 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>>>    		/* H_CEDE has to be handled now, not later */
>>>    		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
>>>    		    kvmppc_get_gpr(vcpu, 3) == H_CEDE) {
>>> -			kvmppc_nested_cede(vcpu);
>>> +			kvmppc_cede(vcpu);
>>>    			kvmppc_set_gpr(vcpu, 3, 0);
>>>    			trap = 0;
>>>    		}
>>>    	} else {
>>>    		kvmppc_xive_push_vcpu(vcpu);
>>>    		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
>>> +		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
>>> +		    !(vcpu->arch.shregs.msr & MSR_PR)) {
>>> +			unsigned long req = kvmppc_get_gpr(vcpu, 3);
>>> +
>>> +			/* H_CEDE has to be handled now, not later */
>>> +			if (req == H_CEDE) {
>>> +				kvmppc_cede(vcpu);
>>> +				kvmppc_xive_cede_vcpu(vcpu); /* may un-cede */
>>> +				kvmppc_set_gpr(vcpu, 3, 0);
>>> +				trap = 0;
>>> +
>>> +			/* XICS hcalls must be handled before xive is pulled */
>>> +			} else if (hcall_is_xics(req)) {
>>> +				int ret;
>>> +
>>> +				ret = kvmppc_xive_xics_hcall(vcpu, req);
>>> +				if (ret != H_TOO_HARD) {
>>> +					kvmppc_set_gpr(vcpu, 3, ret);
>>> +					trap = 0;
>>> +				}
>>> +			}
>>> +		}
>>>    		kvmppc_xive_pull_vcpu(vcpu);
>>> -
>>>    	}
>>>    
>>>    	vcpu->arch.slb_max = 0;
>>> @@ -4442,8 +4476,11 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>>>    		else
>>>    			r = kvmppc_run_vcpu(vcpu);
>>>    
>>> -		if (run->exit_reason == KVM_EXIT_PAPR_HCALL &&
>>> -		    !(vcpu->arch.shregs.msr & MSR_PR)) {
>>> +		if (run->exit_reason == KVM_EXIT_PAPR_HCALL) {
>>> +			if (WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_PR)) {
>>> +				r = RESUME_GUEST;
>>> +				continue;
>>> +			}
>>>    			trace_kvm_hcall_enter(vcpu);
>>>    			r = kvmppc_pseries_do_hcall(vcpu);
>>>    			trace_kvm_hcall_exit(vcpu, r);
>>> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>>> index c11597f815e4..2d0d14ed1d92 100644
>>> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>>> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>>> @@ -1397,9 +1397,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>>    	mr	r4,r9
>>>    	bge	fast_guest_return
>>>    2:
>>> +	/* If we came in through the P9 short path, no real mode hcalls */
>>> +	lwz	r0, STACK_SLOT_SHORT_PATH(r1)
>>> +	cmpwi	r0, 0
>>> +	bne	no_try_real
>>
>>
>> btw is mmu on at this point? or it gets enabled by rfid at the end of
>> guest_exit_short_path?
> 
> Hash guest it's off. Radix guest it can be on or off depending on the
> interrupt type and MSR and LPCR[AIL] values.

What I meant was - what do we expect here on p9? mmu on? ^w^w^w^w^w^w^w^w^w

I just realized - it is radix so there is no problem with vmalloc 
addresses in real mode as these do not use top 2 bits as on hash and the 
exact mmu state is less important here. Cheers.


> 
> Thanks,
> Nick
> 

-- 
Alexey
