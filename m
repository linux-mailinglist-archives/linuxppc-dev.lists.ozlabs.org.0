Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52845940CB1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 11:00:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IuTODtkN;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I2FWiQSS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WY8Mf1RLCz3dJB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 19:00:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IuTODtkN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I2FWiQSS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY8Lw6rTNz3cfx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 19:00:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722330005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3Vq57YbceZaPKW/jag25INSUT9w3HBYWgm/2iS/lmgI=;
	b=IuTODtkNBtQ6fJPltvLWkV9SqdUOnBZZ2OMEtsyFRDapspM01cyMiNqaP1AI88sasYdSPl
	kDhXcsyKePHH9pWcXnUot0geqVFZyl6cuM4oDWyA2uM6qXQyCS30R8MFfAIa4M4oFDzVMi
	qfZGs/ofza7Coy6C9PI87bbeqzAJ61w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722330006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3Vq57YbceZaPKW/jag25INSUT9w3HBYWgm/2iS/lmgI=;
	b=I2FWiQSS6I6ofUnRB51JCKfYhWhKh1iGcOKY/5zZw1e2sAG2LhFAXR2YCgCWsPK5fxu/+/
	2fkJof+icWA5VB8eThuH+2LiHUAZ6HDOiTGxUbmt5B9hPeD83IGO/RBDiuqbprzzIUSGt8
	YJ0DOrd8IMNbQhdAfndyrgSc9PUephM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-WrGehRVEMYOINNAdoa04hA-1; Tue, 30 Jul 2024 05:00:01 -0400
X-MC-Unique: WrGehRVEMYOINNAdoa04hA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52efc9f200aso4919698e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 02:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722330000; x=1722934800;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Vq57YbceZaPKW/jag25INSUT9w3HBYWgm/2iS/lmgI=;
        b=dhKu0+3YIaxR/3IiHYf1yTDkF9uzliG93gya1b8kvB4d19o4UMTBeZ4qo6QiR4aK0N
         N+sAZgtNIqAf4meZoAU8I3hP2aACq7E2is4NcpJ0WwpcKPq7zoWJXwP3q2v7cOMIGw2d
         hFm5LAzPwI9XYPwx2Xe/r7G7hbmoC783cQ/mn/nx80Kevn8L7D6bSCX1Unnpr1QaNcL5
         yH/6C8kD5R8yemUWjZywyineuRu7EYd10Xiuk7bSIxGvrQ9lUa4arUpjToPCnzaUcjn3
         9R/SHuGRCTPwHOnOhDUGMQQBcoUntnygv9yd8P2X+tgn3KuIkyeZQMWTN9u6TNplWqYY
         2i/A==
X-Forwarded-Encrypted: i=1; AJvYcCWRhQF2q3tXEF/MQ2hyddP9tASMMj2Puo30FqsckSDm4Esmw49oxWrDm3gR3VEOB99NsK/NFmLdjYJecITaYx6Rtc3SjKHpPZQWwvT6fw==
X-Gm-Message-State: AOJu0Yx8p1G1RjCEVD36l0StyfwJuFR/JpyS9RHXFyWhtJrrfuze6o/2
	NhZdn0qmPlSA0KRaYQblJb7uQW7ffcir/50xHiwmzIV2T9LYQUTPA7RtN0MmcwZkXlawhwn3ff2
	787L8Kiz3Lf0afkmrQnFhzteQVrXgwhNrusOQ7KwhBLjCg1rzFqdPB+0gIBZ6kn4=
X-Received: by 2002:ac2:4bd4:0:b0:530:ac41:4ee with SMTP id 2adb3069b0e04-530ac410772mr853127e87.24.1722329999868;
        Tue, 30 Jul 2024 01:59:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1CX9fuid97Fo9k/P7XEAx/O03KlRJUJxp6LS6LdYujPfua6G8Lket79YT5PUqIa4JM4vZ8g==
X-Received: by 2002:ac2:4bd4:0:b0:530:ac41:4ee with SMTP id 2adb3069b0e04-530ac410772mr853087e87.24.1722329999379;
        Tue, 30 Jul 2024 01:59:59 -0700 (PDT)
Received: from [192.168.10.47] ([151.95.101.29])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5ac63590d76sm7021589a12.24.2024.07.30.01.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 01:59:58 -0700 (PDT)
Message-ID: <bb2d52e8-ceff-46e8-83a1-4db535754aa0@redhat.com>
Date: Tue, 30 Jul 2024 10:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 50/84] KVM: VMX: Use __kvm_faultin_page() to get APIC
 access page/pfn
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-51-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240726235234.228822-51-seanjc@google.com>
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
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/27/24 01:51, Sean Christopherson wrote:
> Use __kvm_faultin_page() get the APIC access page so that KVM can
> precisely release the refcounted page, i.e. to remove yet another user
> of kvm_pfn_to_refcounted_page().  While the path isn't handling a guest
> page fault, the semantics are effectively the same; KVM just happens to
> be mapping the pfn into a VMCS field instead of a secondary MMU.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/kvm/vmx/vmx.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 30032585f7dc..b109bd282a52 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -6786,8 +6786,10 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
>   	struct kvm *kvm = vcpu->kvm;
>   	struct kvm_memslots *slots = kvm_memslots(kvm);
>   	struct kvm_memory_slot *slot;
> +	struct page *refcounted_page;
>   	unsigned long mmu_seq;
>   	kvm_pfn_t pfn;
> +	bool ign;

Even if you don't use it, call the out argument "writable".

Paolo

>   
>   	/* Defer reload until vmcs01 is the current VMCS. */
>   	if (is_guest_mode(vcpu)) {
> @@ -6823,7 +6825,7 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
>   	 * controls the APIC-access page memslot, and only deletes the memslot
>   	 * if APICv is permanently inhibited, i.e. the memslot won't reappear.
>   	 */
> -	pfn = gfn_to_pfn_memslot(slot, gfn);
> +	pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &ign, &refcounted_page);
>   	if (is_error_noslot_pfn(pfn))
>   		return;
>   
> @@ -6834,10 +6836,13 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
>   		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
>   
>   	/*
> -	 * Do not pin apic access page in memory, the MMU notifier
> -	 * will call us again if it is migrated or swapped out.
> +	 * Do not pin the APIC access page in memory so that it can be freely
> +	 * migrated, the MMU notifier will call us again if it is migrated or
> +	 * swapped out.  KVM backs the memslot with anonymous memory, the pfn
> +	 * should always point at a refcounted page (if the pfn is valid).
>   	 */
> -	kvm_release_pfn_clean(pfn);
> +	if (!WARN_ON_ONCE(!refcounted_page))
> +		kvm_release_page_clean(refcounted_page);
>   
>   	/*
>   	 * No need for a manual TLB flush at this point, KVM has already done a

