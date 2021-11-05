Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17862446975
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 21:12:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HmBWp6jh8z2yyv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 07:12:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=cIEyP8aW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=cIEyP8aW; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HmBW90CmHz2yMx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 07:12:18 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so4145306pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov 2021 13:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qri/F8nrhMHPEDYa4uQBt3JEMiHHv9C5/Jmdnno/6TE=;
 b=cIEyP8aWcsIt4l1x4nbkEBmKTwuf4VKIqebtH0CamXLLrZvDTlRgHn6uwPaIY1qdYN
 Fgiy/kNzJgL6/SmGcy37HITOWEPVyIdCiclDP5nOj+WydYi2O63mGY95RUeOrxL9PvWh
 Gfm1SPQHjJDMZsGGN4DcnnN4SM2ODaCqT/kJ/VZE7yvR3zhk2fJEFqV9YFGRTqZ+jsnj
 Pgh/W1HeccTmRVlizmn2ItiqkKcXfVUFRASIjGOCbR0SyLm177P2qgIaXEww6aWSnQar
 T5v/4lUFkU6kuCFZ6hk4p9nBXBYb6gEsGdXh01NXvay8YV3v3E29TKauFH/h+FbOOdHd
 GGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qri/F8nrhMHPEDYa4uQBt3JEMiHHv9C5/Jmdnno/6TE=;
 b=smrb7CI4tDTV9vN+705ZUkA04MlNKHO6WrVSJV0JcHrp4d4VN1FNdSyjafzXZffoTR
 wQ+VPif5Bt47mj0oOHgrBLoKtqi/c/W6R+7mgajIUrqIW5e5g8cChzzkTtYW8C4GZO6e
 vR7ue6o6MGgTkdUHiM8jUU0EZWVqsdq+VyKkvNB5uv9DPr0WyFj02t6dHtM6lNXFDnaX
 cbnbU4GbC2MEK1uoNmEmBh/3ZegsazJJYMUQOv3/8nyuQlZWqFZAJMvfETu/uBelLj12
 pTOFPuWpFEhScT+jqy32oYGTYDQkAGDLxuuHcbCLiCxBGiP2FX2jvXaGGYjmzfpi4fDq
 cmUg==
X-Gm-Message-State: AOAM531ONscZX2SfJ6hya/1FfoADzkZGV8ctEIbk5plkHOjI3LLsF/C+
 K+YyKRjwwZF2N0IA15T7ZRxhnw==
X-Google-Smtp-Source: ABdhPJw8Bn6P+IE+Qzeo9KqPziiJGvYCB1J6tl8vP7MYz520ZFYD+Cv/5edLbN+g+nahR9ZSMbCUMA==
X-Received: by 2002:a17:902:758b:b0:13e:8b1:e49f with SMTP id
 j11-20020a170902758b00b0013e08b1e49fmr53627978pll.6.1636143136683; 
 Fri, 05 Nov 2021 13:12:16 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id a20sm7760762pff.57.2021.11.05.13.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 13:12:16 -0700 (PDT)
Date: Fri, 5 Nov 2021 20:12:12 +0000
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 1/5] KVM: Move wiping of the kvm->vcpus array to common
 code
Message-ID: <YYWQHBwD4nBLo9qi@google.com>
References: <20211105192101.3862492-1-maz@kernel.org>
 <20211105192101.3862492-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105192101.3862492-2-maz@kernel.org>
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
Cc: Juergen Gross <jgross@suse.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, Anup Patel <anup.patel@wdc.com>,
 Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, David Hildenbrand <david@redhat.com>,
 linux-mips@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Atish Patra <atish.patra@wdc.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@samba.org>, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kernel-team@android.com,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvmarm@lists.cs.columbia.edu, Suzuki K Poulose <suzuki.poulose@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 05, 2021, Marc Zyngier wrote:
> All architectures have similar loops iterating over the vcpus,
> freeing one vcpu at a time, and eventually wiping the reference
> off the vcpus array. They are also inconsistently taking
> the kvm->lock mutex when wiping the references from the array.

...

> +void kvm_destroy_vcpus(struct kvm *kvm)
> +{
> +	unsigned int i;
> +	struct kvm_vcpu *vcpu;
> +
> +	kvm_for_each_vcpu(i, vcpu, kvm)
> +		kvm_vcpu_destroy(vcpu);
> +
> +	mutex_lock(&kvm->lock);

But why is kvm->lock taken here?  Unless I'm overlooking an arch, everyone calls
this from kvm_arch_destroy_vm(), in which case this is the only remaining reference
to @kvm.  And if there's some magic path for which that's not true, I don't see how
it can possibly be safe to call kvm_vcpu_destroy() without holding kvm->lock, or
how this would guarantee that all vCPUs have actually been destroyed before nullifying
the array.

> +	for (i = 0; i < atomic_read(&kvm->online_vcpus); i++)
> +		kvm->vcpus[i] = NULL;
> +
> +	atomic_set(&kvm->online_vcpus, 0);
> +	mutex_unlock(&kvm->lock);
> +}
> +EXPORT_SYMBOL_GPL(kvm_destroy_vcpus);
