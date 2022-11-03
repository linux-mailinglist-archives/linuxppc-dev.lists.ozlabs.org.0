Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A52617F83
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 15:29:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N35jq6LHJz3cMx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 01:29:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y8o9aQnZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y8o9aQnZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vkuznets@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y8o9aQnZ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y8o9aQnZ;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N35hr6RYSz2ymS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 01:28:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667485706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xJXDTOdlX1XyIcsWYcqglWBdRZQ9xmr4YB2PW91lUtk=;
	b=Y8o9aQnZ3G3tLMJAZhZOeEpVNqHwShtj8XyuSqKyvSHEtYaovx5MipVGXOSFwKPYMiPHbR
	OGiMYMs2835Og8eywbo9aF8e/jeJTsYjzGGzqZSUHJo0uulT43/vrmIR0A0AIc92xJmNrJ
	Z7W7qs5oLWx+iOyBPtrtly30VAio/IE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667485706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xJXDTOdlX1XyIcsWYcqglWBdRZQ9xmr4YB2PW91lUtk=;
	b=Y8o9aQnZ3G3tLMJAZhZOeEpVNqHwShtj8XyuSqKyvSHEtYaovx5MipVGXOSFwKPYMiPHbR
	OGiMYMs2835Og8eywbo9aF8e/jeJTsYjzGGzqZSUHJo0uulT43/vrmIR0A0AIc92xJmNrJ
	Z7W7qs5oLWx+iOyBPtrtly30VAio/IE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-462-tL6n5ooeNLKHTRSLftclyg-1; Thu, 03 Nov 2022 10:28:25 -0400
X-MC-Unique: tL6n5ooeNLKHTRSLftclyg-1
Received: by mail-ej1-f69.google.com with SMTP id gt15-20020a1709072d8f00b007aaac7973fbso1363236ejc.23
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 07:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJXDTOdlX1XyIcsWYcqglWBdRZQ9xmr4YB2PW91lUtk=;
        b=3Dpq9nZFr6XnMZIlBq00M8p2as2KX6vP8mLaEFvWnUG+Ij1G+ob6vkM60RqIMuZRiT
         Dh/8sL7gTKiWUYpUce+LG129GrZ+ua6dy28DzTnyPVV4sVgVqGCoTIGwtFVs+nHJytG3
         L0wDUqafS9q0c9QOTIjDJoHvHqAOjw0vxGyiHtEkHxr0eQtpSiQB4rVDV8APAWxxtDbc
         23CIPDI1cPNuxlbTxAZRGGJkQQYcq6cEn2ORSD2P+7TplbamEYg84cNuEoPNuiYUkqFJ
         d8amSGZQRzbkGbMNpKEq907rLMJAqImqUStCNHlUkXQUnjFu2WNvzyBCRB3I/mpkmS3Q
         gGsw==
X-Gm-Message-State: ACrzQf36MG5PGsTlaxBZPwwNET/AiwnfpCWzqnUGlwLU9xsh4wSM+Fgi
	cCJ2j86Zqk19TVSfcUkkmKBNsRbE+ERGgW+4YjC6KGiqRL7Zh7gLNTq3dRaOhgcPbw45N5SspHS
	0I7vVtJKBqPAAl3Yq/drYe9ICHg==
X-Received: by 2002:a17:907:6da3:b0:78e:2a5f:5aaf with SMTP id sb35-20020a1709076da300b0078e2a5f5aafmr29209470ejc.554.1667485703902;
        Thu, 03 Nov 2022 07:28:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4/BLSlzeBmBH2wK2ozHzek7JvfdOrTUEgVR1Jkq3btzgsJIv9L2s0vi2zOnPRlcAj1lu9eWg==
X-Received: by 2002:a17:907:6da3:b0:78e:2a5f:5aaf with SMTP id sb35-20020a1709076da300b0078e2a5f5aafmr29209446ejc.554.1667485703617;
        Thu, 03 Nov 2022 07:28:23 -0700 (PDT)
Received: from ovpn-194-252.brq.redhat.com (nat-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id r18-20020a1709061bb200b0073d7bef38e3sm558528ejg.45.2022.11.03.07.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 07:28:22 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 10/44] KVM: VMX: Clean up eVMCS enabling if KVM
 initialization fails
In-Reply-To: <20221102231911.3107438-11-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-11-seanjc@google.com>
Date: Thu, 03 Nov 2022 15:28:21 +0100
Message-ID: <87mt98qfi2.fsf@ovpn-194-252.brq.redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, Anup Patel <anup@brainfault.o
 rg>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:

> To make it obvious that KVM doesn't have a lurking bug, cleanup eVMCS
> enabling if kvm_init() fails even though the enabling doesn't strictly
> need to be unwound.  eVMCS enabling only toggles values that are fully
> contained in the VMX module, i.e. it's technically ok to leave the values
> as-is since they'll disappear entirely when the module is unloaded, but
> doing proper cleanup is relatively simple, and having a chunk of code
> that isn't unwound is confusing.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 137 +++++++++++++++++++++++------------------
>  1 file changed, 78 insertions(+), 59 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 05a747c9a9ff..b3fd4049de01 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -524,6 +524,8 @@ static inline void vmx_segment_cache_clear(struct vcpu_vmx *vmx)
>  static unsigned long host_idt_base;
>  
>  #if IS_ENABLED(CONFIG_HYPERV)
> +static struct kvm_x86_ops vmx_x86_ops __initdata;
> +
>  static bool __read_mostly enlightened_vmcs = true;
>  module_param(enlightened_vmcs, bool, 0444);
>  
> @@ -552,6 +554,71 @@ static int hv_enable_direct_tlbflush(struct kvm_vcpu *vcpu)
>  	return 0;
>  }
>  
> +static __init void hv_setup_evmcs(void)
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
> +			vmx_x86_ops.enable_direct_tlbflush
> +				= hv_enable_direct_tlbflush;
> +
> +	} else {
> +		enlightened_vmcs = false;
> +	}
> +}
> +static void hv_cleanup_evmcs(void)
> +{
> +	struct hv_vp_assist_page *vp_ap;
> +	int cpu;
> +
> +	if (!static_branch_unlikely(&enable_evmcs))
> +		return;
> +
> +	/*
> +	 * Reset everything to support using non-enlightened VMCS access later
> +	 * (e.g. when we reload the module with enlightened_vmcs=0)
> +	 */
> +	for_each_online_cpu(cpu) {
> +		vp_ap =	hv_get_vp_assist_page(cpu);
> +
> +		if (!vp_ap)
> +			continue;
> +
> +		vp_ap->nested_control.features.directhypercall = 0;
> +		vp_ap->current_nested_vmcs = 0;
> +		vp_ap->enlighten_vmentry = 0;
> +	}

Unrelated to your patch but while looking at this code I got curious
about why don't we need a protection against CPU offlining here. Turns
out that even when we offline a CPU, its VP assist page remains
allocated (see hv_cpu_die()), we just write '0' to the MSR and thus
accessing the page is safe. The consequent hv_cpu_init(), however, does
not restore VP assist page when it's already allocated:

# rdmsr -p 24 0x40000073
10212f001
# echo 0 > /sys/devices/system/cpu/cpu24/online 
# echo 1 > /sys/devices/system/cpu/cpu24/online 
# rdmsr -p 24 0x40000073
0

The culprit is commit e5d9b714fe402 ("x86/hyperv: fix root partition
faults when writing to VP assist page MSR"). A patch is inbound.

'hv_root_partition' case is different though. We do memunmap() and reset
VP assist page to zero so it is theoretically possible we're going to
clash. Unless I'm missing some obvious reason why module unload can't
coincide with CPU offlining, we may be better off surrounding this with
cpus_read_lock()/cpus_read_unlock(). 

> +
> +	static_branch_disable(&enable_evmcs);
> +}
> +
> +#else /* IS_ENABLED(CONFIG_HYPERV) */
> +static void hv_setup_evmcs(void) {}
> +static void hv_cleanup_evmcs(void) {}
>  #endif /* IS_ENABLED(CONFIG_HYPERV) */
>  
>  /*
> @@ -8435,29 +8502,8 @@ static void vmx_exit(void)
>  
>  	kvm_exit();
>  
> -#if IS_ENABLED(CONFIG_HYPERV)
> -	if (static_branch_unlikely(&enable_evmcs)) {
> -		int cpu;
> -		struct hv_vp_assist_page *vp_ap;
> -		/*
> -		 * Reset everything to support using non-enlightened VMCS
> -		 * access later (e.g. when we reload the module with
> -		 * enlightened_vmcs=0)
> -		 */
> -		for_each_online_cpu(cpu) {
> -			vp_ap =	hv_get_vp_assist_page(cpu);
> +	hv_cleanup_evmcs();
>  
> -			if (!vp_ap)
> -				continue;
> -
> -			vp_ap->nested_control.features.directhypercall = 0;
> -			vp_ap->current_nested_vmcs = 0;
> -			vp_ap->enlighten_vmentry = 0;
> -		}
> -
> -		static_branch_disable(&enable_evmcs);
> -	}
> -#endif
>  	vmx_cleanup_l1d_flush();
>  
>  	allow_smaller_maxphyaddr = false;
> @@ -8468,43 +8514,12 @@ static int __init vmx_init(void)
>  {
>  	int r, cpu;
>  
> -#if IS_ENABLED(CONFIG_HYPERV)
> -	/*
> -	 * Enlightened VMCS usage should be recommended and the host needs
> -	 * to support eVMCS v1 or above. We can also disable eVMCS support
> -	 * with module parameter.
> -	 */
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
> -			vmx_x86_ops.enable_direct_tlbflush
> -				= hv_enable_direct_tlbflush;
> -
> -	} else {
> -		enlightened_vmcs = false;
> -	}
> -#endif
> +	hv_setup_evmcs();
>  
>  	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
>  		     __alignof__(struct vcpu_vmx), THIS_MODULE);
>  	if (r)
> -		return r;
> +		goto err_kvm_init;
>  
>  	/*
>  	 * Must be called after kvm_init() so enable_ept is properly set
> @@ -8514,10 +8529,8 @@ static int __init vmx_init(void)
>  	 * mitigation mode.
>  	 */
>  	r = vmx_setup_l1d_flush(vmentry_l1d_flush_param);
> -	if (r) {
> -		vmx_exit();
> -		return r;
> -	}
> +	if (r)
> +		goto err_l1d_flush;
>  
>  	vmx_setup_fb_clear_ctrl();
>  
> @@ -8542,5 +8555,11 @@ static int __init vmx_init(void)
>  		allow_smaller_maxphyaddr = true;
>  
>  	return 0;
> +
> +err_l1d_flush:
> +	vmx_exit();
> +err_kvm_init:
> +	hv_cleanup_evmcs();
> +	return r;
>  }
>  module_init(vmx_init);

-- 
Vitaly

