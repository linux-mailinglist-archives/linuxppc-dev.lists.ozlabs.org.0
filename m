Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A0463F3BE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 16:23:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNKbt10gZz3bYL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 02:23:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B+Uzk/aU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nag0keCd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vkuznets@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B+Uzk/aU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nag0keCd;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNKZr0Jz0z3bXJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 02:22:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669908172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0uolOOp7yoOC/673O4rWJ2SQim3eJ9tGJUopqkFhibc=;
	b=B+Uzk/aU+G0kyeVnZME32d4YN4l7sLEVdy7VP6JuIJVqdFtpi6L4u9AR4foUS4yhJn04ji
	IbCpdEjCFiv/Ox5p9ri3H0diiVKuINuS06MGQTlm7eAeA92w2eMUUp1TObuZXodswa8hnv
	xYmqwHPcu0DVGFsFXIzPOza1/s2AbEU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669908173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0uolOOp7yoOC/673O4rWJ2SQim3eJ9tGJUopqkFhibc=;
	b=Nag0keCdiCH3WT3SjS51bcH8YAmNcKPZZL3zL3dy3L6DbmOKn5ZFSdvE6i4kv9sMkZCkMB
	XS/OHx1MSv30Vbme7bAfuWLfzhlPJ2yDpNxC3+L26cZWb5NmvxhXTNL0KnLIt0b8U3vEZW
	l4CEXtkDaOag2VCs1FfSit93qcxiGNI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-488-jUxfhWUhPc2tINngJG0ETA-1; Thu, 01 Dec 2022 10:22:51 -0500
X-MC-Unique: jUxfhWUhPc2tINngJG0ETA-1
Received: by mail-wm1-f70.google.com with SMTP id bi19-20020a05600c3d9300b003cf9d6c4016so2676243wmb.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Dec 2022 07:22:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0uolOOp7yoOC/673O4rWJ2SQim3eJ9tGJUopqkFhibc=;
        b=ZFF4G/hX1ndwD0sGZv7u+QWvBH9R2xm0xu6HTGMTyPHNuUUZm9hZPxTu6srPiwXdhs
         i/vCdS8SkvjxGTYMPvxgo6TVvp04YdQlUMsFmsx3FK23PPtibNruGD6s1bq7x5RnB/48
         pk/BkntJ1/wmLcqYYhlGy9RrBr9mOvgksqNm6snLjt8VrJ/UgW1wq0HY8LoFilnQzZ+m
         gkVNlQCvQ8wWhw2m1/aNB2FDi1nvtsJKe384sAJevQQuPNjZqsGmLRUJPO3Qppljg4Nf
         gm0ZWaG78bhsLtqCvdNJUz2j2NcP5fj2Ib5NG4j5fX9QHACr6EchXgUDymQpkQKfyMvt
         K5Hg==
X-Gm-Message-State: ANoB5pnsxw3Yb7w6OVXpMYdUS5e6POf204sQOYfZ/510+Tm5IRAl09qW
	XlJytsXGEg1zsF1X+1es5uVRTvOFQztFmXbyMxXCPyiQLK7U9yYnnmSM6Hd5taiAKjQCMtXQGJ6
	RAYMUWY7QUYkle8bNlxPHO//VgA==
X-Received: by 2002:adf:f54e:0:b0:242:1534:7b57 with SMTP id j14-20020adff54e000000b0024215347b57mr14035633wrp.404.1669908170126;
        Thu, 01 Dec 2022 07:22:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4+3YusiSWHR13O3MACnIQbSphop/g7AmmIFME21D1fv2+5ZYUMJJrVIeLUQmj0nQTJeAmHuA==
X-Received: by 2002:adf:f54e:0:b0:242:1534:7b57 with SMTP id j14-20020adff54e000000b0024215347b57mr14035606wrp.404.1669908169821;
        Thu, 01 Dec 2022 07:22:49 -0800 (PST)
Received: from ovpn-194-141.brq.redhat.com (nat-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id j11-20020a05600c190b00b003b47e75b401sm10593279wmq.37.2022.12.01.07.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 07:22:49 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v2 12/50] KVM: VMX: Move Hyper-V eVMCS initialization to
 helper
In-Reply-To: <20221130230934.1014142-13-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-13-seanjc@google.com>
Date: Thu, 01 Dec 2022 16:22:45 +0100
Message-ID: <87k03bf8sa.fsf@ovpn-194-141.brq.redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, David Woodhouse <dwmw2@infradead.org>, Matthew Rosato <mjrosato@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, Sean Christopherson <seanjc@google.com>, Paul Durrant <paul@xen.org>, Paul Walmsley <paul.walmsley@sifive.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-a
 rm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:

> Move Hyper-V's eVMCS initialization to a dedicated helper to clean up
> vmx_init(), and add a comment to call out that the Hyper-V init code
> doesn't need to be unwound if vmx_init() ultimately fails.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 73 +++++++++++++++++++++++++-----------------
>  1 file changed, 43 insertions(+), 30 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index c0de7160700b..b8bf95b9710d 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -523,6 +523,8 @@ static inline void vmx_segment_cache_clear(struct vcpu_vmx *vmx)
>  static unsigned long host_idt_base;
>  
>  #if IS_ENABLED(CONFIG_HYPERV)
> +static struct kvm_x86_ops vmx_x86_ops __initdata;
> +
>  static bool __read_mostly enlightened_vmcs = true;
>  module_param(enlightened_vmcs, bool, 0444);
>  
> @@ -551,6 +553,43 @@ static int hv_enable_l2_tlb_flush(struct kvm_vcpu *vcpu)
>  	return 0;
>  }
>  
> +static __init void hv_init_evmcs(void)
> +{
> +	int cpu;
> +
> +	if (!enlightened_vmcs)
> +		return;
> +
> +	/*
> +	 * Enlightened VMCS usage should be recommended and the host needs
> +	 * to support eVMCS v1 or above.
> +	 */
> +	if (ms_hyperv.hints & HV_X64_ENLIGHTENED_VMCS_RECOMMENDED &&
> +	    (ms_hyperv.nested_features & HV_X64_ENLIGHTENED_VMCS_VERSION) >=
> +	     KVM_EVMCS_VERSION) {
> +
> +		/* Check that we have assist pages on all online CPUs */
> +		for_each_online_cpu(cpu) {
> +			if (!hv_get_vp_assist_page(cpu)) {
> +				enlightened_vmcs = false;
> +				break;
> +			}
> +		}
> +
> +		if (enlightened_vmcs) {
> +			pr_info("KVM: vmx: using Hyper-V Enlightened VMCS\n");
> +			static_branch_enable(&enable_evmcs);
> +		}
> +
> +		if (ms_hyperv.nested_features & HV_X64_NESTED_DIRECT_FLUSH)
> +			vmx_x86_ops.enable_l2_tlb_flush
> +				= hv_enable_l2_tlb_flush;
> +
> +	} else {
> +		enlightened_vmcs = false;
> +	}
> +}
> +
>  static void hv_reset_evmcs(void)
>  {
>  	struct hv_vp_assist_page *vp_ap;
> @@ -577,6 +616,7 @@ static void hv_reset_evmcs(void)
>  }
>  
>  #else /* IS_ENABLED(CONFIG_HYPERV) */
> +static void hv_init_evmcs(void) {}
>  static void hv_reset_evmcs(void) {}
>  #endif /* IS_ENABLED(CONFIG_HYPERV) */
>  
> @@ -8500,38 +8540,11 @@ static int __init vmx_init(void)
>  {
>  	int r, cpu;
>  
> -#if IS_ENABLED(CONFIG_HYPERV)
>  	/*
> -	 * Enlightened VMCS usage should be recommended and the host needs
> -	 * to support eVMCS v1 or above. We can also disable eVMCS support
> -	 * with module parameter.
> +	 * Note, hv_init_evmcs() touches only VMX knobs, i.e. there's nothing
> +	 * to unwind if a later step fails.
>  	 */
> -	if (enlightened_vmcs &&
> -	    ms_hyperv.hints & HV_X64_ENLIGHTENED_VMCS_RECOMMENDED &&
> -	    (ms_hyperv.nested_features & HV_X64_ENLIGHTENED_VMCS_VERSION) >=
> -	    KVM_EVMCS_VERSION) {
> -
> -		/* Check that we have assist pages on all online CPUs */
> -		for_each_online_cpu(cpu) {
> -			if (!hv_get_vp_assist_page(cpu)) {
> -				enlightened_vmcs = false;
> -				break;
> -			}
> -		}
> -
> -		if (enlightened_vmcs) {
> -			pr_info("KVM: vmx: using Hyper-V Enlightened VMCS\n");
> -			static_branch_enable(&enable_evmcs);
> -		}
> -
> -		if (ms_hyperv.nested_features & HV_X64_NESTED_DIRECT_FLUSH)
> -			vmx_x86_ops.enable_l2_tlb_flush
> -				= hv_enable_l2_tlb_flush;
> -
> -	} else {
> -		enlightened_vmcs = false;
> -	}
> -#endif
> +	hv_init_evmcs();
>  
>  	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
>  		     __alignof__(struct vcpu_vmx), THIS_MODULE);

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Vitaly

