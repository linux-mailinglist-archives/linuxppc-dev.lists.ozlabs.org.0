Return-Path: <linuxppc-dev+bounces-2087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B10899993D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 03:25:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPpq22fC0z3bsL;
	Fri, 11 Oct 2024 12:25:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728595458;
	cv=none; b=Dyh7OCT2MtJ76b7w03frdxN9w9qTI3t496b5eWh8DWK+P0+NiVxxDpzFDSBiKZ2dhSNCOasNdVch37u81b4W9NTy2jnMoblGi9/+7nqF84p2cGvpMCUGYp5lsYiR4I4J0L0TV87E9/efEit7sVorTFo7lOqmZbd87AyjGs5lu69smPsEQ5pVd8w8rQpLHE37j3AjVIiYxDTDxehfAGPiHOYdGHNC9NvlhEQUgqroEolLU6KVNGAsMRTB6miqKE50DAZFbLB3CNUF9bvdvyWAfvm+w9lE+TC9dBMHONnO0nllIe+Jd14C9fphh76ia/a/qt9wxrAsKVaSOZ7E/633BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728595458; c=relaxed/relaxed;
	bh=TTrbVtOPHPilcmbjskJG9XlxanFpaqz6L16YYJyOAKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cKTXegIVyDhKxHQl/XsgCd6Jho7gnyQ06heKnNAFqNQtFWAI3tDvet2shwZAx+iRD7cBk7R0TE2ZHdxnyMLWKkywbyN4Ve6gzAM1F8stYL8nJOFHNCmZkKH+AcrSUD6JmJin3pM4eHDQvUJEW6p1mmQTu5cE6v46fHQ3fODH3zcdTmWvcE4OOuc6CtwxRgEpp7xaw4nWrXX28Fc+Mjpq+WxZyNwZa7PL1BOStR/0AUIlF8tg7ZmYNJnSWlq0LMYSCTVUWJlVbULN4ZMxqU3Htj9Kt+bgsbfVz1hROwR0P7b02TWlqDj7SZa0rw1K708RO1CdL8aCUCw4ORMhNourhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QCB2t6dt; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QCB2t6dt; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QCB2t6dt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QCB2t6dt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPjSJ5yfQz3bq4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 08:24:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728595451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TTrbVtOPHPilcmbjskJG9XlxanFpaqz6L16YYJyOAKI=;
	b=QCB2t6dtRUm0r8y3T5faFtZsd9M3yLjToJVaNtIvoOuS4GkjaN3lWJsy/6Q0omsC+jOOcn
	qMIrZ2Uey7uUqGiW4V8exiubYQUKQVO7LlJdmaJBzwtA9UCkVvl6rHI7+mR1+aftMcsnoh
	BJGcXa97I+RsqY1NKNbxa2EEMk5NVD8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728595451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TTrbVtOPHPilcmbjskJG9XlxanFpaqz6L16YYJyOAKI=;
	b=QCB2t6dtRUm0r8y3T5faFtZsd9M3yLjToJVaNtIvoOuS4GkjaN3lWJsy/6Q0omsC+jOOcn
	qMIrZ2Uey7uUqGiW4V8exiubYQUKQVO7LlJdmaJBzwtA9UCkVvl6rHI7+mR1+aftMcsnoh
	BJGcXa97I+RsqY1NKNbxa2EEMk5NVD8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-jtO-l0A3N2KVOaAfYHTMRQ-1; Thu, 10 Oct 2024 17:24:09 -0400
X-MC-Unique: jtO-l0A3N2KVOaAfYHTMRQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a9946fff3adso87905766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 14:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595448; x=1729200248;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TTrbVtOPHPilcmbjskJG9XlxanFpaqz6L16YYJyOAKI=;
        b=M8wwB8NkQq78L2i/akEZ8XKVIiBS0MV6a0odXD4HaGSxOvIDevZpIpVDgoQTGO8seb
         EFyrUj7i+t/GjJ/FoqsPrxxEjdQ0Pg002my7VpxidE+5KNYTvVpV4WniJ99KrQ6qCl7x
         ZAHfaoS3D5aVmpBesaRdhcR9vb2jD+ZO4/VkfCqwJbeCMMuvRlzkzorgSGorqGan5Z0q
         sPoUwXrALszNy6YEUN0DwPQBEtMxao7j6XhnfV2PLABevEUJDB/HqdGmFkDlo2zcQ8qs
         gUv3M8y2ij/frwlCqiV3Cg2JO8s6tvZDMSsdHjod9bddjS625BwFai5S/QAsqFvXFypw
         8+1g==
X-Forwarded-Encrypted: i=1; AJvYcCXEI6U+hGLK9jL2H4KQqUkmsBzw/ldsvRQ9S4a/ttt+jpUpr3ALYwbsvqK7AoOeidGnYdfhr7W+nOHHiy8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFqhEsuj8bjzIDyvPSiv4pxuPAMRf3ZDa89dw/tTA9h1vF9hwL
	2yiKzBxJSdAyqDOgrVL/sF84F4KiZ+F6JPcq9mACl2cwEmSRm2TrF87+gAi0D/cScdH9/VQDS1N
	h8pvnAU2rEltdjW971tOJqY/GBveNKnWec2kOlt8/QRY+xQwYmuZH4HoiZ6jPJA8=
X-Received: by 2002:a17:907:e2c2:b0:a99:50b8:9a10 with SMTP id a640c23a62f3a-a99b95e5ff5mr26361566b.64.1728595448155;
        Thu, 10 Oct 2024 14:24:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH15rRMAVXsYsvGP3nHpjiqsOwqxS4ttKi4hWbrl20imAxCjoxkwTI5t6kkZa8FMv1uivlQnA==
X-Received: by 2002:a17:907:e2c2:b0:a99:50b8:9a10 with SMTP id a640c23a62f3a-a99b95e5ff5mr26359666b.64.1728595447686;
        Thu, 10 Oct 2024 14:24:07 -0700 (PDT)
Received: from [192.168.10.3] ([151.81.124.37])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a99a80dc502sm139723466b.146.2024.10.10.14.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 14:24:07 -0700 (PDT)
Message-ID: <640d6536-e1b3-4ca8-99f8-676e8905cc3e@redhat.com>
Date: Thu, 10 Oct 2024 23:23:55 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] powerpc/kvm: Fix spinlock member access for PREEMPT_RT
To: Vishal Chourasia <vishalc@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ZwgYXsCDDwsOBZ4a@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <ZwgYXsCDDwsOBZ4a@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 10/10/24 20:09, Vishal Chourasia wrote:
> Hi,
> 
> While building the kernel with CONFIG_PREEMPT_RT, I encountered several
> compilation errors in the PowerPC KVM code. The issues appear in
> book3s_hv_rm_mmu.c where it tries to access the 'rlock' member of struct
> spinlock, which doesn't exist in the RT configuration.

How was this tested? I suspect that putting to sleep a task that is 
running in real mode is a huge no-no.  The actual solution would have to 
be to split mmu_lock into a spin_lock and a raw_spin_lock, but that's a 
huge amount of work probably.  I'd just add a "depends on !PPC || 
!KVM_BOOK3S_64_HV" or something like that, to prevent enabling KVM-HV on 
PREEMPT_RT kernels.

Thanks,

Paolo

> arch/powerpc/kvm/book3s_hv_rm_mmu.c:248:32: error: no member named 'rlock' in 'struct spinlock'
>    248 |         arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
>        |                         ~~~~~~~~~~~~~ ^
> ./arch/powerpc/include/asm/qspinlock.h:164:45: note: expanded from macro 'arch_spin_lock'
>    164 | #define arch_spin_lock(l)               queued_spin_lock(l)
>        |                                                          ^
> arch/powerpc/kvm/book3s_hv_rm_mmu.c:263:36: error: no member named 'rlock' in 'struct spinlock'
>    263 |                         arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
>        |                                           ~~~~~~~~~~~~~ ^
> ./arch/powerpc/include/asm/qspinlock.h:166:49: note: expanded from macro 'arch_spin_unlock'
>    166 | #define arch_spin_unlock(l)             queued_spin_unlock(l)
>        |                                                            ^
> arch/powerpc/kvm/book3s_hv_rm_mmu.c:277:34: error: no member named 'rlock' in 'struct spinlock'
>    277 |         arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
>        |                           ~~~~~~~~~~~~~ ^
> ./arch/powerpc/include/asm/qspinlock.h:166:49: note: expanded from macro 'arch_spin_unlock'
>    166 | #define arch_spin_unlock(l)             queued_spin_unlock(l)
>        |                                                            ^
> arch/powerpc/kvm/book3s_hv_rm_mmu.c:938:32: error: no member named 'rlock' in 'struct spinlock'
>    938 |         arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
>        |                         ~~~~~~~~~~~~~ ^
> ./arch/powerpc/include/asm/qspinlock.h:164:45: note: expanded from macro 'arch_spin_lock'
>    164 | #define arch_spin_lock(l)               queued_spin_lock(l)
>        |                                                          ^
> arch/powerpc/kvm/book3s_hv_rm_mmu.c:950:34: error: no member named 'rlock' in 'struct spinlock'
>    950 |         arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
>        |                           ~~~~~~~~~~~~~ ^
> ./arch/powerpc/include/asm/qspinlock.h:166:49: note: expanded from macro 'arch_spin_unlock'
>    166 | #define arch_spin_unlock(l)             queued_spin_unlock(l)
>        |                                                            ^
> arch/powerpc/kvm/book3s_hv_rm_mmu.c:966:32: error: no member named 'rlock' in 'struct spinlock'
>    966 |         arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
>        |                         ~~~~~~~~~~~~~ ^
> ./arch/powerpc/include/asm/qspinlock.h:164:45: note: expanded from macro 'arch_spin_lock'
>    164 | #define arch_spin_lock(l)               queued_spin_lock(l)
>        |                                                          ^
> arch/powerpc/kvm/book3s_hv_rm_mmu.c:981:34: error: no member named 'rlock' in 'struct spinlock'
>    981 |         arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
>        |                           ~~~~~~~~~~~~~ ^
> ./arch/powerpc/include/asm/qspinlock.h:166:49: note: expanded from macro 'arch_spin_unlock'
>    166 | #define arch_spin_unlock(l)             queued_spin_unlock(l)
>        |                                                            ^
> 7 errors generated.
> make[4]: *** [scripts/Makefile.build:229: arch/powerpc/kvm/book3s_hv_rm_mmu.o] Error 1
> make[3]: *** [scripts/Makefile.build:478: arch/powerpc/kvm] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [scripts/Makefile.build:478: arch/powerpc] Error 2
> make[2]: *** Waiting for unfinished jobs....
> 
> Replace arch_spin_lock/unlock on kvm->mmu_lock.rlock.raw_lock with
> simple spin_lock/unlock on kvm->mmu_lock to fix build errors with
> CONFIG_PREEMPT_RT. The RT configuration changes the spinlock structure,
> removing the rlock member.
> 
> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
> ---
>   arch/powerpc/kvm/book3s_hv_rm_mmu.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> index 17cb75a127b04..abf1e6de85644 100644
> --- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> +++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> @@ -245,7 +245,7 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
>          /* Translate to host virtual address */
>          hva = __gfn_to_hva_memslot(memslot, gfn);
> 
> -       arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
> +       spin_lock(&kvm->mmu_lock);
>          ptep = find_kvm_host_pte(kvm, mmu_seq, hva, &hpage_shift);
>          if (ptep) {
>                  pte_t pte;
> @@ -260,7 +260,7 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
>                   * to <= host page size, if host is using hugepage
>                   */
>                  if (host_pte_size < psize) {
> -                       arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
> +                       spin_unlock(&kvm->mmu_lock);
>                          return H_PARAMETER;
>                  }
>                  pte = kvmppc_read_update_linux_pte(ptep, writing);
> @@ -274,7 +274,7 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
>                          pa |= gpa & ~PAGE_MASK;
>                  }
>          }
> -       arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
> +       spin_unlock(&kvm->mmu_lock);
> 
>          ptel &= HPTE_R_KEY | HPTE_R_PP0 | (psize-1);
>          ptel |= pa;
> @@ -935,7 +935,7 @@ static long kvmppc_do_h_page_init_zero(struct kvm_vcpu *vcpu,
>          mmu_seq = kvm->mmu_invalidate_seq;
>          smp_rmb();
> 
> -       arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
> +       spin_lock(&kvm->mmu_lock);
> 
>          ret = kvmppc_get_hpa(vcpu, mmu_seq, dest, 1, &pa, &memslot);
>          if (ret != H_SUCCESS)
> @@ -947,7 +947,7 @@ static long kvmppc_do_h_page_init_zero(struct kvm_vcpu *vcpu,
>          kvmppc_update_dirty_map(memslot, dest >> PAGE_SHIFT, PAGE_SIZE);
> 
>   out_unlock:
> -       arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
> +       spin_unlock(&kvm->mmu_lock);
>          return ret;
>   }
> 
> @@ -963,7 +963,7 @@ static long kvmppc_do_h_page_init_copy(struct kvm_vcpu *vcpu,
>          mmu_seq = kvm->mmu_invalidate_seq;
>          smp_rmb();
> 
> -       arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
> +       spin_lock(&kvm->mmu_lock);
>          ret = kvmppc_get_hpa(vcpu, mmu_seq, dest, 1, &dest_pa, &dest_memslot);
>          if (ret != H_SUCCESS)
>                  goto out_unlock;
> @@ -978,7 +978,7 @@ static long kvmppc_do_h_page_init_copy(struct kvm_vcpu *vcpu,
>          kvmppc_update_dirty_map(dest_memslot, dest >> PAGE_SHIFT, PAGE_SIZE);
> 
>   out_unlock:
> -       arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
> +       spin_unlock(&kvm->mmu_lock);
>          return ret;
>   }
> 
> --
> 2.46.2
> 
> 


