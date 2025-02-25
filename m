Return-Path: <linuxppc-dev+bounces-6477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF67A45106
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 00:47:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2Z69588nz305D;
	Wed, 26 Feb 2025 10:47:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740527265;
	cv=none; b=iGL5rfjsFHo+kNWKGhyGgynyYJouFjR5wlvZdz5m/ZZE0c3lATPtKI85MWpdGpKK1+hhEzs3Gl9GTdrsPiaTP1+wtMVPIbg67gUa/5qeVfc8lZBqnwVMrhyUx3x54NK14OsM/0IqmhGXpGqX9Mc70e4UIlRwUYcqbqQQqhM+GTsLgVR5O3WRd59lBNs6N+7354no8BLclb5brMeWzUbi3wupZ5e1Nf/oyPQR9m6967vhry3YNbFRNpjNw6f7gpKldErLm7H1bJr/tEYtGG4uyGR4T5xkcLOdzYVBdN8XS+y+JcniCLxujiAkPaQ64/ahxz3CjG4Ac4PHZxHoipIX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740527265; c=relaxed/relaxed;
	bh=I+5VgZvS5RLhaGwFZILFRfiBrL6y7Ik6GC5bOnzJSKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F6fOebAH0zPCNqbsHP/k+6v4ASzSbo4FkKiGN0gwCP4xAYjme/jWsetBDjFMabcLQdP/lTxaOr9/za37+2k8mIECRvTgLuJXieaE4VcxhA6ghZzlS59wxnvnuft4dGSxn157ihY1tsILZLGGd095l72tX4UhtGw1rEZX/IqfzfdoIrQuic8Q9peyLbT4GKIRvC1wYGLpv5yw2phWUsbKmm6DOX3/Pr/LJaPTXlBCTIlHHDjw1orxvDGk3dRRoXp937wnbIilMwW9LrZwmmaaJOqFFj+QgCstvso7jthZayDgwANJmMzQoe1G4LQxMqZ/BqP85ys1nvj6fgv8TNpTRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a7bPH7e7; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fWpgf11d; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a7bPH7e7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fWpgf11d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2Z6839zMz2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 10:47:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740527259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I+5VgZvS5RLhaGwFZILFRfiBrL6y7Ik6GC5bOnzJSKo=;
	b=a7bPH7e7/g2xoJfXAyL0SsjVyRy7bjAutvVoJP/sINvBiVTIVJsbcrZ7hwO9uh3OD6rCke
	RzYLS9KEu+8SYIeSpnnXmFRitpA/kMdg6R3klXoyiU4WVYo9FTpa/LRcF1Z7yNJk456wkQ
	ntztyLEO7qDXiXJYd9uW0kI8VLIvjjQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740527260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I+5VgZvS5RLhaGwFZILFRfiBrL6y7Ik6GC5bOnzJSKo=;
	b=fWpgf11dF3u6njmTeuoUM+8sZ0DwjiSZ2WkPxl3QnkS8sXS4mAruu8Uby6LZmjGkayaMRe
	s3hOTLUcybtE13FtfM1dbVZdt+wlaZd9zGegu/RcXM1KQh6suFYI9yLYnUPL+DqTRS90tW
	ZJmLUnrfYd2D6/m63bo3TbUfjEqvCyE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-itKrui9hOUCUeBVlohUjXQ-1; Tue, 25 Feb 2025 18:47:38 -0500
X-MC-Unique: itKrui9hOUCUeBVlohUjXQ-1
X-Mimecast-MFC-AGG-ID: itKrui9hOUCUeBVlohUjXQ_1740527257
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5da0b47115aso8366177a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 15:47:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740527257; x=1741132057;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+5VgZvS5RLhaGwFZILFRfiBrL6y7Ik6GC5bOnzJSKo=;
        b=CxBvD3dHHaY3yTaeF1FibFkZrzBgSBhv3I60b/ykSS6z/G3PXqbQ8N3H28/93Wbpjx
         5IF4ga8awPDPnhy5JFG5ZHpJukduF3NldXef4AkJzgaBBEPLVb65A73KUBMuv8JHMLkX
         t0F27qCqVB/WisdoUkKgMuZT9hmMRkJGVew2xn6b15nUOO/em4ilS4YFJ8+VCjNuuVFf
         gPb/TJzOdjRRnkEEzhtbmARCh/6EVX83x1w22kKZoax91fa2C2ZJC1/LHvPunLj/cNEO
         jRHTuIyZGkfOzMbEwERafZ5ZaeH5++SfEZ88fVrXa4XXxBZ/uXvjTcaDwPu/ho8Q/HDI
         7CUw==
X-Forwarded-Encrypted: i=1; AJvYcCVB/kO7rRB5lPGcjWkOy+BUqYZRn5OtvI9J2o8lottyH+iJ7f2i4g151c2ULERWfqGGlXMS4BOgy5WxZHQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBDOUt91oy6APiUZNRxjwbBjxjSPh0jD94YJO0zRhrSJ8yQoBw
	BSP/HKm1NCqtY03ElGoXh8l3dNs5GCRhHAEPQ/siMdeamDwxBKyRTYjjczyn3rrk/aGHSB6Tpa4
	nDY3nQuZotne1H/8mXi80+hvwVWEe91WzpyXxRjMX/j/78hrp6ZGPrnUqfwSgHIo=
X-Gm-Gg: ASbGncvJDoJ2c0lQGhwBAOXHREPunyJ0L2HPAnUZRegqDCSXhWz0gCBYO2HqWz2Nea9
	Z5mbl8GIA517XqayFqR0+pmDbIPYApp9Zn7Yisj1TopWiDI6646xTNwb9m+C/ZLwpDgbB31XToR
	9bSJ24c/IWudJt35/1HSVN7ozGByWh1Md3iU3ZUJEkATh+n6/BvY0eAxY9ZvskIrO3oEBq/Kvug
	ojP9VAczRCXg6jk+jltO9n2YXf93ES+HF3jVnOOiztcopWvpSUX/dS1jdmlvoPxiXshJ8DiGIqF
	QKnQT8h4yoikXa2rHYIN
X-Received: by 2002:a05:6402:35d1:b0:5e0:750a:5c30 with SMTP id 4fb4d7f45d1cf-5e4a0dfc708mr1644336a12.20.1740527256957;
        Tue, 25 Feb 2025 15:47:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIdTNjyooRvOwtF86c7hT5C/AWZUuE2nxzDPKhqPyR/bEqM/yRWSn2G4IdfhjgLnOUUDk8gQ==
X-Received: by 2002:a05:6402:35d1:b0:5e0:750a:5c30 with SMTP id 4fb4d7f45d1cf-5e4a0dfc708mr1644299a12.20.1740527256453;
        Tue, 25 Feb 2025 15:47:36 -0800 (PST)
Received: from [192.168.10.81] ([176.206.102.52])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5e460ff8629sm1891405a12.59.2025.02.25.15.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 15:47:35 -0800 (PST)
Message-ID: <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com>
Date: Wed, 26 Feb 2025 00:47:33 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>,
 Yan Zhao <yan.y.zhao@intel.com>,
 Rick P Edgecombe <rick.p.edgecombe@intel.com>,
 Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
References: <20250224235542.2562848-1-seanjc@google.com>
 <20250224235542.2562848-2-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250224235542.2562848-2-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yrv4jvTPwX5tUxoOWZNy-FCd1yj_5DZodEW_x0JdClo_1740527257
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2/25/25 00:55, Sean Christopherson wrote:
> Free vCPUs before freeing any VM state, as both SVM and VMX may access
> VM state when "freeing" a vCPU that is currently "in" L2, i.e. that needs
> to be kicked out of nested guest mode.
> 
> Commit 6fcee03df6a1 ("KVM: x86: avoid loading a vCPU after .vm_destroy was
> called") partially fixed the issue, but for unknown reasons only moved the
> MMU unloading before VM destruction.  Complete the change, and free all
> vCPU state prior to destroying VM state, as nVMX accesses even more state
> than nSVM.

I applied this to kvm-coco-queue, I will place it in kvm/master too 
unless you shout.

Paolo

> In addition to the AVIC, KVM can hit a use-after-free on MSR filters:
> 
>    kvm_msr_allowed+0x4c/0xd0
>    __kvm_set_msr+0x12d/0x1e0
>    kvm_set_msr+0x19/0x40
>    load_vmcs12_host_state+0x2d8/0x6e0 [kvm_intel]
>    nested_vmx_vmexit+0x715/0xbd0 [kvm_intel]
>    nested_vmx_free_vcpu+0x33/0x50 [kvm_intel]
>    vmx_free_vcpu+0x54/0xc0 [kvm_intel]
>    kvm_arch_vcpu_destroy+0x28/0xf0
>    kvm_vcpu_destroy+0x12/0x50
>    kvm_arch_destroy_vm+0x12c/0x1c0
>    kvm_put_kvm+0x263/0x3c0
>    kvm_vm_release+0x21/0x30
> 
> and an upcoming fix to process injectable interrupts on nested VM-Exit
> will access the PIC:
> 
>    BUG: kernel NULL pointer dereference, address: 0000000000000090
>    #PF: supervisor read access in kernel mode
>    #PF: error_code(0x0000) - not-present page
>    CPU: 23 UID: 1000 PID: 2658 Comm: kvm-nx-lpage-re
>    RIP: 0010:kvm_cpu_has_extint+0x2f/0x60 [kvm]
>    Call Trace:
>     <TASK>
>     kvm_cpu_has_injectable_intr+0xe/0x60 [kvm]
>     nested_vmx_vmexit+0x2d7/0xdf0 [kvm_intel]
>     nested_vmx_free_vcpu+0x40/0x50 [kvm_intel]
>     vmx_vcpu_free+0x2d/0x80 [kvm_intel]
>     kvm_arch_vcpu_destroy+0x2d/0x130 [kvm]
>     kvm_destroy_vcpus+0x8a/0x100 [kvm]
>     kvm_arch_destroy_vm+0xa7/0x1d0 [kvm]
>     kvm_destroy_vm+0x172/0x300 [kvm]
>     kvm_vcpu_release+0x31/0x50 [kvm]
> 
> Inarguably, both nSVM and nVMX need to be fixed, but punt on those
> cleanups for the moment.  Conceptually, vCPUs should be freed before VM
> state.  Assets like the I/O APIC and PIC _must_ be allocated before vCPUs
> are created, so it stands to reason that they must be freed _after_ vCPUs
> are destroyed.
> 
> Reported-by: Aaron Lewis <aaronlewis@google.com>
> Closes: https://lore.kernel.org/all/20240703175618.2304869-2-aaronlewis@google.com
> Cc: Jim Mattson <jmattson@google.com>
> Cc: Yan Zhao <yan.y.zhao@intel.com>
> Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>
> Cc: Kai Huang <kai.huang@intel.com>
> Cc: Isaku Yamahata <isaku.yamahata@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/kvm/x86.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 58b82d6fd77c..045c61cc7e54 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12890,11 +12890,11 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
>   		mutex_unlock(&kvm->slots_lock);
>   	}
>   	kvm_unload_vcpu_mmus(kvm);
> +	kvm_destroy_vcpus(kvm);
>   	kvm_x86_call(vm_destroy)(kvm);
>   	kvm_free_msr_filter(srcu_dereference_check(kvm->arch.msr_filter, &kvm->srcu, 1));
>   	kvm_pic_destroy(kvm);
>   	kvm_ioapic_destroy(kvm);
> -	kvm_destroy_vcpus(kvm);
>   	kvfree(rcu_dereference_check(kvm->arch.apic_map, 1));
>   	kfree(srcu_dereference_check(kvm->arch.pmu_event_filter, &kvm->srcu, 1));
>   	kvm_mmu_uninit_vm(kvm);


