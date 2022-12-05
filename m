Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BE8643621
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 21:53:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQwkd1Xfcz3bY0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 07:53:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YfFvmGBb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=isaku.yamahata@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YfFvmGBb;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQwjf14qBz30QX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 07:52:53 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id 140so12586756pfz.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Dec 2022 12:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N16dq1CjYHOw+jv6Di6rohy5xmWMqcOUPt5c96rryYM=;
        b=YfFvmGBbFyecNX7HuYSwK+aGIglSOKNXdG/GyCa5qUzLMOe/bS3LGfF0q9vWX+ZfHt
         3Z92dtbJE772PsZ/NJy5FRdBdPEPZm5rcU7jdu4sFmCGP/7IKFYS0/CsqrcgEPVmen5V
         y6ej8cIOWvXwaBIve/M5ONQiyIWsJPUuFBVbweXevgwwGb/E9u9wEIP6iF6QJbkluoas
         PAiChapsuF6enaxC+tqdFRIctA1WbhgM/AjJeBOJlUlozWnDnw8Sd2pTj6YzSHsPtsBl
         J/2/tufxjQZdaKhz5ClxSt9r4yMQhCI1VtASfuD1Pfedea9GvzKUkPwh7azEivUucBcM
         puDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N16dq1CjYHOw+jv6Di6rohy5xmWMqcOUPt5c96rryYM=;
        b=N+a4X6uA3iH8Wuwsb5aDctqReT+oePE8gv5kQRhb2nkbtMrQ9R5bo7ac7kq8swzHvn
         o7b+x5vBlJw7XXz4Pg9f1z7rxGhHrupA1Xg1cYxsuWUa8h6q2vgpi1WkqPcjNAUVXmD7
         1xQgYU+1C0KPxeugbWFRKUGYP2JStHXayM0NkXg4yNG/Po+t48Z96KLqsPckhRSIJfic
         aLkes/q1yoH0HJE3z6EqdG/aks6OZBhFxHV0EvrMsobBFdG5ht6bCNmxiCUjK7zeTbBS
         WPvRfP5xvw5eyzupVIDwALHGii0M1cCkIZbAa7qHRWNAJgBq2J3OqaXU4JWvH41qFn5N
         vKMg==
X-Gm-Message-State: ANoB5pno7DrwL2ujFAXIbFuWl1cKqDdb4Z66Vsaj/TL0jZJgr5DFHUcT
	gEX9QFiunT8KRBgeFJt/Cg8=
X-Google-Smtp-Source: AA0mqf4HpL3/0El3PrCiEsjkXuyAuKLQ7k5vbcFuFyn7/o3SL661WsLVyVHRUVAGEIBg3Ob2/Ax1ug==
X-Received: by 2002:a05:6a00:4097:b0:576:cadf:16cc with SMTP id bw23-20020a056a00409700b00576cadf16ccmr9458181pfb.55.1670273568627;
        Mon, 05 Dec 2022 12:52:48 -0800 (PST)
Received: from localhost ([192.55.54.55])
        by smtp.gmail.com with ESMTPSA id f3-20020a170902ce8300b001780e4e6b65sm11105896plg.114.2022.12.05.12.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:52:47 -0800 (PST)
Date: Mon, 5 Dec 2022 12:52:46 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v2 31/50] KVM: x86: Do CPU compatibility checks in x86
 code
Message-ID: <20221205205246.GA3630770@ls.amr.corp.intel.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-32-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221130230934.1014142-32-seanjc@google.com>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, isaku.yamahata@gmail.com, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead
 .org, Isaku Yamahata <isaku.yamahata@intel.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 30, 2022 at 11:09:15PM +0000,
Sean Christopherson <seanjc@google.com> wrote:

> Move the CPU compatibility checks to pure x86 code, i.e. drop x86's use
> of the common kvm_x86_check_cpu_compat() arch hook.  x86 is the only
> architecture that "needs" to do per-CPU compatibility checks, moving
> the logic to x86 will allow dropping the common code, and will also
> give x86 more control over when/how the compatibility checks are
> performed, e.g. TDX will need to enable hardware (do VMXON) in order to
> perform compatibility checks.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/svm/svm.c |  2 +-
>  arch/x86/kvm/vmx/vmx.c |  2 +-
>  arch/x86/kvm/x86.c     | 49 ++++++++++++++++++++++++++++++++----------
>  3 files changed, 40 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 19e81a99c58f..d7ea1c1175c2 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -5103,7 +5103,7 @@ static int __init svm_init(void)
>  	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
>  	 * exposed to userspace!
>  	 */
> -	r = kvm_init(&svm_init_ops, sizeof(struct vcpu_svm),
> +	r = kvm_init(NULL, sizeof(struct vcpu_svm),
>  		     __alignof__(struct vcpu_svm), THIS_MODULE);
>  	if (r)
>  		goto err_kvm_init;
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 654d81f781da..8deb1bd60c10 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -8592,7 +8592,7 @@ static int __init vmx_init(void)
>  	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
>  	 * exposed to userspace!
>  	 */
> -	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
> +	r = kvm_init(NULL, sizeof(struct vcpu_vmx),
>  		     __alignof__(struct vcpu_vmx), THIS_MODULE);
>  	if (r)
>  		goto err_kvm_init;
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 66f16458aa97..3571bc968cf8 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9277,10 +9277,36 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
>  	kvm_pmu_ops_update(ops->pmu_ops);
>  }
>  
> +struct kvm_cpu_compat_check {
> +	struct kvm_x86_init_ops *ops;
> +	int *ret;

minor nitpick: just int ret. I don't see the necessity of the pointer.
Anyway overall it looks good to me.

Reviewed-by: Isaku Yamahata <isaku.yamahata@intel.com>

> +};
> +
> +static int kvm_x86_check_processor_compatibility(struct kvm_x86_init_ops *ops)
> +{
> +	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
> +
> +	WARN_ON(!irqs_disabled());
> +
> +	if (__cr4_reserved_bits(cpu_has, c) !=
> +	    __cr4_reserved_bits(cpu_has, &boot_cpu_data))
> +		return -EIO;
> +
> +	return ops->check_processor_compatibility();
> +}
> +
> +static void kvm_x86_check_cpu_compat(void *data)
> +{
> +	struct kvm_cpu_compat_check *c = data;
> +
> +	*c->ret = kvm_x86_check_processor_compatibility(c->ops);
> +}
> +
>  static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
>  {
> +	struct kvm_cpu_compat_check c;
>  	u64 host_pat;
> -	int r;
> +	int r, cpu;
>  
>  	if (kvm_x86_ops.hardware_enable) {
>  		pr_err("kvm: already loaded vendor module '%s'\n", kvm_x86_ops.name);
> @@ -9360,6 +9386,14 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
>  	if (r != 0)
>  		goto out_mmu_exit;
>  
> +	c.ret = &r;
> +	c.ops = ops;
> +	for_each_online_cpu(cpu) {
> +		smp_call_function_single(cpu, kvm_x86_check_cpu_compat, &c, 1);
> +		if (r < 0)

Here it can be "c.ret < 0".

> +			goto out_hardware_unsetup;
> +	}
> +
>  	/*
>  	 * Point of no return!  DO NOT add error paths below this point unless
>  	 * absolutely necessary, as most operations from this point forward
> @@ -9402,6 +9436,8 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
>  	kvm_init_msr_list();
>  	return 0;
>  
> +out_hardware_unsetup:
> +	ops->runtime_ops->hardware_unsetup();
>  out_mmu_exit:
>  	kvm_mmu_vendor_module_exit();
>  out_free_percpu:
> @@ -12037,16 +12073,7 @@ void kvm_arch_hardware_disable(void)
>  
>  int kvm_arch_check_processor_compat(void *opaque)
>  {
> -	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
> -	struct kvm_x86_init_ops *ops = opaque;
> -
> -	WARN_ON(!irqs_disabled());
> -
> -	if (__cr4_reserved_bits(cpu_has, c) !=
> -	    __cr4_reserved_bits(cpu_has, &boot_cpu_data))
> -		return -EIO;
> -
> -	return ops->check_processor_compatibility();
> +	return 0;
>  }
>  
>  bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu)
> -- 
> 2.38.1.584.g0f3c55d4c2-goog
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
