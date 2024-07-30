Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB086940CE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 11:06:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SH89Gu4w;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SH89Gu4w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WY8V65LHLz3clB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 19:06:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SH89Gu4w;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SH89Gu4w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY8TQ2WMJz3cfT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 19:05:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722330342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y8G0Rsvl2ZfKQVim3WYEu/ULpMdQ5SB3TZr8FpmD1gs=;
	b=SH89Gu4wyG7tWzOQ7a9n3AmdbUK6j/8XmicE5Yy2RbVQUoAKxdQoMyhbm6uWHnSBjJ6yW3
	NKi2WK5tHwBVamjgrolwvssbUmwDHiyTK7wSbA3zhI2Ssjb3Z/2HZDVTKAmoNcPrKSc/sH
	1x6P5VrHlyacvdzM/CGMBWssaFxC9eM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722330342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y8G0Rsvl2ZfKQVim3WYEu/ULpMdQ5SB3TZr8FpmD1gs=;
	b=SH89Gu4wyG7tWzOQ7a9n3AmdbUK6j/8XmicE5Yy2RbVQUoAKxdQoMyhbm6uWHnSBjJ6yW3
	NKi2WK5tHwBVamjgrolwvssbUmwDHiyTK7wSbA3zhI2Ssjb3Z/2HZDVTKAmoNcPrKSc/sH
	1x6P5VrHlyacvdzM/CGMBWssaFxC9eM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-2_tySA_jPvyXdNoedr7z9Q-1; Tue, 30 Jul 2024 05:05:39 -0400
X-MC-Unique: 2_tySA_jPvyXdNoedr7z9Q-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a77f0eca75bso415440866b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 02:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722330338; x=1722935138;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8G0Rsvl2ZfKQVim3WYEu/ULpMdQ5SB3TZr8FpmD1gs=;
        b=T60SRsMec7aeIwTfJM6SfME6nuXvAG9Em9xwuYv9US9IojiIUc7OQsIPYUUHiTF+94
         6ZcHM+T1N69Q95sO6OB9HBmtCyf10VLLTpsFmOLtDCUVKEFZvhv5TxtubVuyCRbGWQNL
         PjNsk9eINUEsdYhdPhcVDXPeTKHImmXPkqy3Dmet6LHXjsRPXxyUcOix/aEyyvI6sBAh
         iqad7CHiyTBzhQcVWvxb6a38X9FiJm3yPPjgjoQJHiEyGLjjPyDFdtJFfgKrRPLYF41V
         JM/WaDbe266fD/sQq3e/MEHvajqsyHiI+pXnzWC2Ft874VHuX3GSWRDzR6WDjeGtArPl
         vHNA==
X-Forwarded-Encrypted: i=1; AJvYcCUEGJEwtUL1LGamczAS67XLs3Q29PmbTyyoaBXAu+DcBZJH2Qdo19nRz95p2LR1VO1Pt+4btUqFGakmTKTDWmzIYppgK/FdSvYpGiod2A==
X-Gm-Message-State: AOJu0YweyiKho/UyVkSVmfWL4mGzUOGQHRA1NfehgXNM9Kyx3tfv74Hs
	hagoA+bmEih6kJNGaLtmGEHW9jmFKMuD0epiw0vOi/nZZYO7MOuH4M5WSyFuk4bf84ml+zQZxxn
	xVR+t0/3Rc7AYdM0hwmBa9Lnw8d9BXOPLK87cIKIwUeigF/8CGZWo5RNQ+BmJasQ=
X-Received: by 2002:a17:907:9803:b0:a6f:4f2c:1936 with SMTP id a640c23a62f3a-a7d4011446bmr605766966b.44.1722330338310;
        Tue, 30 Jul 2024 02:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyHe4aJyS1Uxr4GJW4wjt2WBKjxS53+1D2JV4zXUtkqi7IDeNByS7dwef5YTgCXCGFtY96FA==
X-Received: by 2002:a17:907:9803:b0:a6f:4f2c:1936 with SMTP id a640c23a62f3a-a7d4011446bmr605763366b.44.1722330337702;
        Tue, 30 Jul 2024 02:05:37 -0700 (PDT)
Received: from [192.168.10.47] ([151.95.101.29])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7acab23157sm617304466b.33.2024.07.30.02.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 02:05:37 -0700 (PDT)
Message-ID: <2da6b57e-d5c2-4016-b89b-d51700eeb845@redhat.com>
Date: Tue, 30 Jul 2024 11:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 45/84] KVM: guest_memfd: Provide "struct page" as
 output from kvm_gmem_get_pfn()
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
 <20240726235234.228822-46-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240726235234.228822-46-seanjc@google.com>
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
> Provide the "struct page" associated with a guest_memfd pfn as an output
> from __kvm_gmem_get_pfn() so that KVM guest page fault handlers can
        ^^^^^^^^^^^^^^^^^^^^

Just "kvm_gmem_get_pfn()".

> directly put the page instead of having to rely on
> kvm_pfn_to_refcounted_page().

This will conflict with my series, where I'm introducing
folio_file_pfn() and using it here:
> -	page = folio_file_page(folio, index);
> +	*page = folio_file_page(folio, index);
>   
> -	*pfn = page_to_pfn(page);
> +	*pfn = page_to_pfn(*page);
>   	if (max_order)
>   		*max_order = 0;

That said, I think it's better to turn kvm_gmem_get_pfn() into
kvm_gmem_get_page() here, and pull the page_to_pfn() or page_to_phys()
to the caller as applicable.  This highlights that the caller always
gets a refcounted page with guest_memfd.

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 901be9e420a4..bcc4a4c594ef 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4348,13 +4348,14 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
  		return -EFAULT;
  	}
  
-	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
+	r = kvm_gmem_get_page(vcpu->kvm, fault->slot, fault->gfn, &fault->refcounted_page,
  			     &max_order);
  	if (r) {
  		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
  		return r;
  	}
  
+	fault->pfn = page_to_pfn(page);
  	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
  	fault->max_level = kvm_max_private_mapping_level(vcpu->kvm, fault->pfn,
  							 fault->max_level, max_order);
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index a16c873b3232..db4181d11f2e 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3847,7 +3847,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
  	if (VALID_PAGE(svm->sev_es.snp_vmsa_gpa)) {
  		gfn_t gfn = gpa_to_gfn(svm->sev_es.snp_vmsa_gpa);
  		struct kvm_memory_slot *slot;
-		kvm_pfn_t pfn;
+		struct page *page;
  
  		slot = gfn_to_memslot(vcpu->kvm, gfn);
  		if (!slot)
@@ -3857,7 +3857,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
  		 * The new VMSA will be private memory guest memory, so
  		 * retrieve the PFN from the gmem backend.
  		 */
-		if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, NULL))
+		if (kvm_gmem_get_page(vcpu->kvm, slot, gfn, &page, NULL))
  			return -EINVAL;
  
  		/*
@@ -3873,7 +3873,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
  		svm->sev_es.snp_has_guest_vmsa = true;
  
  		/* Use the new VMSA */
-		svm->vmcb->control.vmsa_pa = pfn_to_hpa(pfn);
+		svm->vmcb->control.vmsa_pa = page_to_phys(page);
  
  		/* Mark the vCPU as runnable */
  		vcpu->arch.pv.pv_unhalted = false;
@@ -3886,7 +3886,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
  		 * changes then care should be taken to ensure
  		 * svm->sev_es.vmsa is pinned through some other means.
  		 */
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_clean(page);
  	}
  
  	/*
@@ -4687,6 +4687,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
  	struct kvm *kvm = vcpu->kvm;
  	int order, rmp_level, ret;
  	bool assigned;
+	struct page *page;
  	kvm_pfn_t pfn;
  	gfn_t gfn;
  
@@ -4712,13 +4713,14 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
  		return;
  	}
  
-	ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &order);
+	ret = kvm_gmem_get_page(kvm, slot, gfn, &page, &order);
  	if (ret) {
  		pr_warn_ratelimited("SEV: Unexpected RMP fault, no backing page for private GPA 0x%llx\n",
  				    gpa);
  		return;
  	}
  
+	pfn = page_to_pfn(page);
  	ret = snp_lookup_rmpentry(pfn, &assigned, &rmp_level);
  	if (ret || !assigned) {
  		pr_warn_ratelimited("SEV: Unexpected RMP fault, no assigned RMP entry found for GPA 0x%llx PFN 0x%llx error %d\n",
@@ -4770,7 +4772,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
  out:
  	trace_kvm_rmp_fault(vcpu, gpa, pfn, error_code, rmp_level, ret);
  out_no_trace:
-	put_page(pfn_to_page(pfn));
+	kvm_release_page_unused(page);
  }
  
  static bool is_pfn_range_shared(kvm_pfn_t start, kvm_pfn_t end)


And the change in virt/kvm/guest_memfd.c then is just as trivial, apart
from all the renaming:

-	*pfn = folio_file_pfn(folio, index);
+	*page = folio_file_page(folio, index);


Paolo

