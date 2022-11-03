Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E15B4618296
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 16:24:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N36xC5czwz3cLB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 02:24:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JYIcN4Qv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JYIcN4Qv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JYIcN4Qv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JYIcN4Qv;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N36wB6wxLz3c2g
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 02:23:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667488999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ex9w6AF29xEwpNLs+Jj1aaojn2ZZjhH0ZX9iUoTOfgc=;
	b=JYIcN4Qvut2ueP8N4RFbgV0SYq5S8nvRybbNe2ttD9jexTpnOj2XngkrGJD88PEFd9PSiO
	khIJaLvEJXZECQvfBP2WCcEPF4mGZDl/ojdIeFDtnqLr+D9EM85KqMhDa91FrMO3n72YH3
	QJLdpwtvDAncQDbMJaVB0ruJZizXNQ0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667488999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ex9w6AF29xEwpNLs+Jj1aaojn2ZZjhH0ZX9iUoTOfgc=;
	b=JYIcN4Qvut2ueP8N4RFbgV0SYq5S8nvRybbNe2ttD9jexTpnOj2XngkrGJD88PEFd9PSiO
	khIJaLvEJXZECQvfBP2WCcEPF4mGZDl/ojdIeFDtnqLr+D9EM85KqMhDa91FrMO3n72YH3
	QJLdpwtvDAncQDbMJaVB0ruJZizXNQ0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-kitAtiMvMuSemLr9ImdT2A-1; Thu, 03 Nov 2022 11:23:18 -0400
X-MC-Unique: kitAtiMvMuSemLr9ImdT2A-1
Received: by mail-ej1-f70.google.com with SMTP id hc43-20020a17090716ab00b0078e28567ffbso1476749ejc.15
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 08:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ex9w6AF29xEwpNLs+Jj1aaojn2ZZjhH0ZX9iUoTOfgc=;
        b=3W8YGUxCAMKSbCtwW6JbqrpVY+4DiBhSDf195+q4eNjZesanrn6RXB7NwMVr4hjovT
         eHxJ1lNpkh/hPSBw6LGMlDz8NPTLxFZNvDohph4gjXijLc1/J0c7sQXnwiHKZyyocUx6
         ExeDom2JNxX1RcqBNQfLj7O+IpnZ/jM3vruBwM62aD6TSX3BD87IGC6D0YOBvWERmKmB
         PcNRk/SYD5jkVMIRDOYOM6lvtZiy57ffrrprcHvu2yc9OzJiZY/AjLSuPmm23mtP6tuy
         9eJE+4nVEVZrNpKe6VUbd4XB/etbDDt6RGze1sXUU53DC8P8+mOjHjak8rq2cUTyODyh
         3YGA==
X-Gm-Message-State: ACrzQf3FS1RKbdq3OStARzrRHcFOBV/YQMV1EF4d6A7KNYr3OcKpyeSr
	8mLgI7n7aaDDtq+sFoHr68USnDVbrt2jHrqaeK6QKT++IF6su243EM/DA6Vy44WkSuRhOBmV04k
	ZhJ8nxF9H7TKNAlnh2dsgGeilCA==
X-Received: by 2002:a17:907:8a07:b0:7ad:e111:9f1f with SMTP id sc7-20020a1709078a0700b007ade1119f1fmr18706636ejc.748.1667488996698;
        Thu, 03 Nov 2022 08:23:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7w/ZtXgKJ7V+2Z8oeupCi1g9Jll17Pmqv+y4uPqlw3EJEEB8/pAd5jt1iBgMRagb/0UlEDkg==
X-Received: by 2002:a17:907:8a07:b0:7ad:e111:9f1f with SMTP id sc7-20020a1709078a0700b007ade1119f1fmr18706603ejc.748.1667488996425;
        Thu, 03 Nov 2022 08:23:16 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c? ([2001:b07:6468:f312:1c09:f536:3de6:228c])
        by smtp.googlemail.com with ESMTPSA id 9-20020a170906218900b007a9c3831409sm596520eju.137.2022.11.03.08.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 08:23:15 -0700 (PDT)
Message-ID: <7b6ce80e-7f1f-11cd-8bde-8d8fa9fd7e1d@redhat.com>
Date: Thu, 3 Nov 2022 16:23:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 39/44] KVM: Drop kvm_count_lock and instead protect
 kvm_usage_count with kvm_lock
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-40-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221102231911.3107438-40-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/3/22 00:19, Sean Christopherson wrote:
> +- kvm_lock is taken outside kvm->mmu_lock

Not surprising since one is a mutex and one is an rwlock. :)  You can 
drop this hunk as well as the "Opportunistically update KVM's locking 
documentation" sentence in the commit message.

>   - vcpu->mutex is taken outside kvm->arch.hyperv.hv_lock
>   
>   - kvm->arch.mmu_lock is an rwlock.  kvm->arch.tdp_mmu_pages_lock and
> @@ -216,15 +220,11 @@ time it will be set using the Dirty tracking mechanism described above.
>   :Type:		mutex
>   :Arch:		any
>   :Protects:	- vm_list
> -
> -``kvm_count_lock``
> -^^^^^^^^^^^^^^^^^^
> -
> -:Type:		raw_spinlock_t
> -:Arch:		any
> -:Protects:	- hardware virtualization enable/disable
> -:Comment:	'raw' because hardware enabling/disabling must be atomic /wrt
> -		migration.
> +		- kvm_usage_count
> +		- hardware virtualization enable/disable
> +		- module probing (x86 only)

What do you mean exactly by "module probing"?  Is it anything else than 
what is serialized by vendor_module_lock?

Paolo

> +:Comment:	KVM also disables CPU hotplug via cpus_read_lock() during
> +		enable/disable.
>   
>   ``kvm->mn_invalidate_lock``
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 4e765ef9f4bd..c8d92e6c3922 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -100,7 +100,6 @@ EXPORT_SYMBOL_GPL(halt_poll_ns_shrink);
>    */
>   
>   DEFINE_MUTEX(kvm_lock);
> -static DEFINE_RAW_SPINLOCK(kvm_count_lock);
>   LIST_HEAD(vm_list);
>   
>   static cpumask_var_t cpus_hardware_enabled;
> @@ -5028,9 +5027,10 @@ static void hardware_enable_nolock(void *junk)
>   
>   static int kvm_online_cpu(unsigned int cpu)
>   {
> +	unsigned long flags;
>   	int ret = 0;
>   
> -	raw_spin_lock(&kvm_count_lock);
> +	mutex_lock(&kvm_lock);
>   	/*
>   	 * Abort the CPU online process if hardware virtualization cannot
>   	 * be enabled. Otherwise running VMs would encounter unrecoverable
> @@ -5039,13 +5039,16 @@ static int kvm_online_cpu(unsigned int cpu)
>   	if (kvm_usage_count) {
>   		WARN_ON_ONCE(atomic_read(&hardware_enable_failed));
>   
> +		local_irq_save(flags);
>   		hardware_enable_nolock(NULL);
> +		local_irq_restore(flags);
> +
>   		if (atomic_read(&hardware_enable_failed)) {
>   			atomic_set(&hardware_enable_failed, 0);
>   			ret = -EIO;
>   		}
>   	}
> -	raw_spin_unlock(&kvm_count_lock);
> +	mutex_unlock(&kvm_lock);
>   	return ret;
>   }
>   
> @@ -5061,10 +5064,13 @@ static void hardware_disable_nolock(void *junk)
>   
>   static int kvm_offline_cpu(unsigned int cpu)
>   {
> -	raw_spin_lock(&kvm_count_lock);
> -	if (kvm_usage_count)
> +	mutex_lock(&kvm_lock);
> +	if (kvm_usage_count) {
> +		preempt_disable();
>   		hardware_disable_nolock(NULL);
> -	raw_spin_unlock(&kvm_count_lock);
> +		preempt_enable();
> +	}
> +	mutex_unlock(&kvm_lock);
>   	return 0;
>   }
>   
> @@ -5079,9 +5085,11 @@ static void hardware_disable_all_nolock(void)
>   
>   static void hardware_disable_all(void)
>   {
> -	raw_spin_lock(&kvm_count_lock);
> +	cpus_read_lock();
> +	mutex_lock(&kvm_lock);
>   	hardware_disable_all_nolock();
> -	raw_spin_unlock(&kvm_count_lock);
> +	mutex_unlock(&kvm_lock);
> +	cpus_read_unlock();
>   }
>   
>   static int hardware_enable_all(void)
> @@ -5097,7 +5105,7 @@ static int hardware_enable_all(void)
>   	 * Disable CPU hotplug to prevent scenarios where KVM sees
>   	 */
>   	cpus_read_lock();
> -	raw_spin_lock(&kvm_count_lock);
> +	mutex_lock(&kvm_lock);
>   
>   	kvm_usage_count++;
>   	if (kvm_usage_count == 1) {
> @@ -5110,7 +5118,7 @@ static int hardware_enable_all(void)
>   		}
>   	}
>   
> -	raw_spin_unlock(&kvm_count_lock);
> +	mutex_unlock(&kvm_lock);
>   	cpus_read_unlock();
>   
>   	return r;
> @@ -5716,6 +5724,15 @@ static void kvm_init_debug(void)
>   
>   static int kvm_suspend(void)
>   {
> +	/*
> +	 * Secondary CPUs and CPU hotplug are disabled across the suspend/resume
> +	 * callbacks, i.e. no need to acquire kvm_lock to ensure the usage count
> +	 * is stable.  Assert that kvm_lock is not held as a paranoid sanity
> +	 * check that the system isn't suspended when KVM is enabling hardware.
> +	 */
> +	lockdep_assert_not_held(&kvm_lock);
> +	lockdep_assert_irqs_disabled();
> +
>   	if (kvm_usage_count)
>   		hardware_disable_nolock(NULL);
>   	return 0;
> @@ -5723,10 +5740,11 @@ static int kvm_suspend(void)
>   
>   static void kvm_resume(void)
>   {
> -	if (kvm_usage_count) {
> -		lockdep_assert_not_held(&kvm_count_lock);
> +	lockdep_assert_not_held(&kvm_lock);
> +	lockdep_assert_irqs_disabled();
> +
> +	if (kvm_usage_count)
>   		hardware_enable_nolock(NULL);
> -	}
>   }
>   
>   static struct syscore_ops kvm_syscore_ops = {

