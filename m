Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1593619248
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 09:00:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3Y2F48HDz3cLX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 19:00:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IR2tdOmr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IR2tdOmr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IR2tdOmr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IR2tdOmr;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3Y1J60PYz3bjB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 18:59:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667548752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EJeUF4PeIyDwWhg83Rm4e9DTJIlz0RfDdBHuS7iY8Qc=;
	b=IR2tdOmrTRSk+dJN70STqGRsLNF6IZmhLHLJmJIg2ruYnIlRpt9pL03yRnwBgNveZkDPWy
	We/dhWd20tMKwJpyKjIpBspxnbBzyHtfrLdXrkH48ALEgl4/BKzHb+6HNCYPJdp6jNWipy
	n7KlGpQ4H5hpJw0szmYI/aDXFAawgTc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667548752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EJeUF4PeIyDwWhg83Rm4e9DTJIlz0RfDdBHuS7iY8Qc=;
	b=IR2tdOmrTRSk+dJN70STqGRsLNF6IZmhLHLJmJIg2ruYnIlRpt9pL03yRnwBgNveZkDPWy
	We/dhWd20tMKwJpyKjIpBspxnbBzyHtfrLdXrkH48ALEgl4/BKzHb+6HNCYPJdp6jNWipy
	n7KlGpQ4H5hpJw0szmYI/aDXFAawgTc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-jBx0GVosPTukP9ARpLmJyQ-1; Fri, 04 Nov 2022 03:59:11 -0400
X-MC-Unique: jBx0GVosPTukP9ARpLmJyQ-1
Received: by mail-ej1-f70.google.com with SMTP id oz34-20020a1709077da200b007adc8d68e90so2736650ejc.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Nov 2022 00:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJeUF4PeIyDwWhg83Rm4e9DTJIlz0RfDdBHuS7iY8Qc=;
        b=FUBsaGw37dxVopo9s1TEz8rxUZxWFZxT4JBcGqhS82QSQAy1a5JZR1FwpFHIbHHhYy
         iF+lscPgSwk0f5Wf5S0u3+Yd/glu6IMakTyn0GKQhzRHIDLhR0+uEC06G0owHi3Zmebz
         TSJgEZN5QDXT4ewiWb1q3KJn3SpkZl9+8tAqdSRLofjkfAlx7UgfK/OYK+yPhy6aOqeW
         ftiw0ycss1vuXGwMNvkXWGDGtjCJMgI77aiJz+XCQA2IsV+pUNBBIBOVur0DEEj5f954
         70IyQTFVUaibYDDsSpQ76bwaXHu+JQSBHSWPcXoed211WFoQ7y5hMC8AZM/eR7wNUXSL
         4LLA==
X-Gm-Message-State: ACrzQf3hP8U8QskfHZklu1bg0xivB5fsC/hKdDb1SSRNcCIF5HObaRVb
	A5WM8FNNBXI+aGAjuVBtyththTEQNL2MDMAftQxQoIAN5T35uipsSndzBetRPlQvPy3zUQ8anTK
	qpTuoWgo9qxVRn974+zTF5wXV4g==
X-Received: by 2002:a05:6402:378c:b0:458:8053:6c5f with SMTP id et12-20020a056402378c00b0045880536c5fmr33842098edb.9.1667548749723;
        Fri, 04 Nov 2022 00:59:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4JQssOxBto/uy8zX5hPa1fJjqq666daf9UF+4lfquuNi1ItDIQofNjauQbNAII7zHijsljig==
X-Received: by 2002:a05:6402:378c:b0:458:8053:6c5f with SMTP id et12-20020a056402378c00b0045880536c5fmr33842056edb.9.1667548749383;
        Fri, 04 Nov 2022 00:59:09 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5? ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
        by smtp.googlemail.com with ESMTPSA id t24-20020aa7d4d8000000b00461a98a2128sm1576537edr.26.2022.11.04.00.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 00:59:08 -0700 (PDT)
Message-ID: <2d964d60-c2e9-ea00-37b4-ad82af9e013f@redhat.com>
Date: Fri, 4 Nov 2022 08:59:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
To: Isaku Yamahata <isaku.yamahata@gmail.com>,
 Sean Christopherson <seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221104071749.GC1063309@ls.amr.corp.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221104071749.GC1063309@ls.amr.corp.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, 
 linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/4/22 08:17, Isaku Yamahata wrote:
> On Wed, Nov 02, 2022 at 11:18:27PM +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> 
>> Non-x86 folks, please test on hardware when possible.  I made a _lot_ of
>> mistakes when moving code around.  Thankfully, x86 was the trickiest code
>> to deal with, and I'm fairly confident that I found all the bugs I
>> introduced via testing.  But the number of mistakes I made and found on
>> x86 makes me more than a bit worried that I screwed something up in other
>> arch code.
>>
>> This is a continuation of Chao's series to do x86 CPU compatibility checks
>> during virtualization hardware enabling[1], and of Isaku's series to try
>> and clean up the hardware enabling paths so that x86 (Intel specifically)
>> can temporarily enable hardware during module initialization without
>> causing undue pain for other architectures[2].  It also includes one patch
>> from another mini-series from Isaku that provides the less controversial
>> patches[3].
>>
>> The main theme of this series is to kill off kvm_arch_init(),
>> kvm_arch_hardware_(un)setup(), and kvm_arch_check_processor_compat(), which
>> all originated in x86 code from way back when, and needlessly complicate
>> both common KVM code and architecture code.  E.g. many architectures don't
>> mark functions/data as __init/__ro_after_init purely because kvm_init()
>> isn't marked __init to support x86's separate vendor modules.
>>
>> The idea/hope is that with those hooks gone (moved to arch code), it will
>> be easier for x86 (and other architectures) to modify their module init
>> sequences as needed without having to fight common KVM code.  E.g. I'm
>> hoping that ARM can build on this to simplify its hardware enabling logic,
>> especially the pKVM side of things.
>>
>> There are bug fixes throughout this series.  They are more scattered than
>> I would usually prefer, but getting the sequencing correct was a gigantic
>> pain for many of the x86 fixes due to needing to fix common code in order
>> for the x86 fix to have any meaning.  And while the bugs are often fatal,
>> they aren't all that interesting for most users as they either require a
>> malicious admin or broken hardware, i.e. aren't likely to be encountered
>> by the vast majority of KVM users.  So unless someone _really_ wants a
>> particular fix isolated for backporting, I'm not planning on shuffling
>> patches.
>>
>> Tested on x86.  Lightly tested on arm64.  Compile tested only on all other
>> architectures.
> 
> Thanks for the patch series. I the rebased TDX KVM patch series and it worked.
> Since cpu offline needs to be rejected in some cases(To keep at least one cpu
> on a package), arch hook for cpu offline is needed.
> I can keep it in TDX KVM patch series.

Yes, this patch looks good.

Paolo

> diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
> index 23c0f4bc63f1..ef7bcb845d42 100644
> --- a/arch/x86/include/asm/kvm-x86-ops.h
> +++ b/arch/x86/include/asm/kvm-x86-ops.h
> @@ -17,6 +17,7 @@ BUILD_BUG_ON(1)
>   KVM_X86_OP(hardware_enable)
>   KVM_X86_OP(hardware_disable)
>   KVM_X86_OP(hardware_unsetup)
> +KVM_X86_OP_OPTIONAL_RET0(offline_cpu)
>   KVM_X86_OP(has_emulated_msr)
>   KVM_X86_OP(vcpu_after_set_cpuid)
>   KVM_X86_OP(is_vm_type_supported)
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 496c7c6eaff9..c420409aa96f 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1468,6 +1468,7 @@ struct kvm_x86_ops {
>   	int (*hardware_enable)(void);
>   	void (*hardware_disable)(void);
>   	void (*hardware_unsetup)(void);
> +	int (*offline_cpu)(void);
>   	bool (*has_emulated_msr)(struct kvm *kvm, u32 index);
>   	void (*vcpu_after_set_cpuid)(struct kvm_vcpu *vcpu);
>   
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 2ed5a017f7bc..17c5d6a76c93 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12039,6 +12039,11 @@ void kvm_arch_hardware_disable(void)
>   	drop_user_return_notifiers();
>   }
>   
> +int kvm_arch_offline_cpu(unsigned int cpu)
> +{
> +	return static_call(kvm_x86_offline_cpu)();
> +}
> +
>   bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu)
>   {
>   	return vcpu->kvm->arch.bsp_vcpu_id == vcpu->vcpu_id;
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 620489b9aa93..4df79443fd11 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1460,6 +1460,7 @@ static inline void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
>   int kvm_arch_hardware_enable(void);
>   void kvm_arch_hardware_disable(void);
>   #endif
> +int kvm_arch_offline_cpu(unsigned int cpu);
>   int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
>   bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
>   int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index f6b6dcedaa0a..f770fdc662d0 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5396,16 +5396,24 @@ static void hardware_disable_nolock(void *junk)
>   	__this_cpu_write(hardware_enabled, false);
>   }
>   
> +__weak int kvm_arch_offline_cpu(unsigned int cpu)
> +{
> +	return 0;
> +}
> +
>   static int kvm_offline_cpu(unsigned int cpu)
>   {
> +	int r = 0;
> +
>   	mutex_lock(&kvm_lock);
> -	if (kvm_usage_count) {
> +	r = kvm_arch_offline_cpu(cpu);
> +	if (!r && kvm_usage_count) {
>   		preempt_disable();
>   		hardware_disable_nolock(NULL);
>   		preempt_enable();
>   	}
>   	mutex_unlock(&kvm_lock);
> -	return 0;
> +	return r;
>   }
>   
>   static void hardware_disable_all_nolock(void)
> 

