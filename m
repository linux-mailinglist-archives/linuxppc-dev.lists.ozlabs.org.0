Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F41375CB3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 17:15:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GSAqMAqt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GSAqMAqt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6tR53vsXz3cF1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 01:15:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GSAqMAqt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GSAqMAqt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6tQC6zsFz2yDs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 01:14:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689952481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BrJmJjnrV3+4TK5GKS3+EEIdaYEFXLT6GE196jD6rfg=;
	b=GSAqMAqtw8bpBMNQ/k37eLgiQyRDBCbx6G6eDU2JBW5XMIuPMqmZ9CK1hzDmIEm4K9I89S
	x+6iWzOwOORx713vDZJYJAufEimfVtbRD6KgcpfybD2fEsNsqwre9NNAqWla4KErsciL+C
	IsdfXAvM0svvQnCfDLOtZsPxDf3zcyM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689952481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BrJmJjnrV3+4TK5GKS3+EEIdaYEFXLT6GE196jD6rfg=;
	b=GSAqMAqtw8bpBMNQ/k37eLgiQyRDBCbx6G6eDU2JBW5XMIuPMqmZ9CK1hzDmIEm4K9I89S
	x+6iWzOwOORx713vDZJYJAufEimfVtbRD6KgcpfybD2fEsNsqwre9NNAqWla4KErsciL+C
	IsdfXAvM0svvQnCfDLOtZsPxDf3zcyM=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-uSXlp0JFMsOdNUHV2zX5jQ-1; Fri, 21 Jul 2023 11:14:36 -0400
X-MC-Unique: uSXlp0JFMsOdNUHV2zX5jQ-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2b743113ecdso20724811fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 08:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689952475; x=1690557275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BrJmJjnrV3+4TK5GKS3+EEIdaYEFXLT6GE196jD6rfg=;
        b=Uve74Wi13hMbEbkZ75EXQt0i3Uf4NDIymkJf39tSj0KvZkew+IVt/A7PV97vSmgBZ+
         Ni2R186wpidcvzX2vhgLKwE8vS31frDWO9UXjEV+Igad6U6epaC+E1N55W+UCIW0RMfe
         fjx0qAe+hBlTSdOZr0ETZr3wH+ilPyKrEPohJhTv/V4eANq48BrAkXjHhrmfUZfLO7g4
         FWErOXibGTMQ9h7GZOuhTpoF+ubtKAPfuazhPcEZbUgq9cThNvBF8hYAQPs0RTbIwLZ5
         r6PePmSmg8Z+gqPnNJwahWDD1fiboLiT1m3QCksENsaIMlpwJVhJN6KXZxARORYg5wh/
         +2zw==
X-Gm-Message-State: ABy/qLZKK/RErZOKwMh4unV6p8tiDTsnZtoRBT0gvxsy7UBcmgCBB8Nf
	bjmQ5EEV/GGLIAZaj5fktV9otqOJcAepUDv/OBSOAyOidtWHgrY5a625B5qdSDnGkAZ3m6qKdXO
	2FYzVJYJOMC/IWmAXwJ5F22R9Cg==
X-Received: by 2002:a05:6512:1150:b0:4f8:661f:60a4 with SMTP id m16-20020a056512115000b004f8661f60a4mr1702754lfg.41.1689952475216;
        Fri, 21 Jul 2023 08:14:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEY792MHWkKnplUr0Vx4lx09FEkAsdfsZuVIi7WtMfQ0gFs1YquUiOv8dJt4JtZPtFNMSuP/g==
X-Received: by 2002:a05:6512:1150:b0:4f8:661f:60a4 with SMTP id m16-20020a056512115000b004f8661f60a4mr1702736lfg.41.1689952474795;
        Fri, 21 Jul 2023 08:14:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id l23-20020a056402345700b00521d2cf5f3bsm2224721edc.96.2023.07.21.08.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 08:14:34 -0700 (PDT)
Message-ID: <75f13a8a-132f-99ee-d3c6-24a12f2f23d5@redhat.com>
Date: Fri, 21 Jul 2023 17:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 18/29] KVM: selftests: Drop unused
 kvm_userspace_memory_region_find() helper
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-19-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230718234512.1690985-19-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/19/23 01:45, Sean Christopherson wrote:
> Drop kvm_userspace_memory_region_find(), it's unused and a terrible API
> (probably why it's unused).  If anything outside of kvm_util.c needs to
> get at the memslot, userspace_mem_region_find() can be exposed to give
> others full access to all memory region/slot information.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   .../selftests/kvm/include/kvm_util_base.h     |  4 ---
>   tools/testing/selftests/kvm/lib/kvm_util.c    | 29 -------------------
>   2 files changed, 33 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> index 07732a157ccd..6aeb008dd668 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -753,10 +753,6 @@ vm_adjust_num_guest_pages(enum vm_guest_mode mode, unsigned int num_guest_pages)
>   	return n;
>   }
>   
> -struct kvm_userspace_memory_region *
> -kvm_userspace_memory_region_find(struct kvm_vm *vm, uint64_t start,
> -				 uint64_t end);
> -
>   #define sync_global_to_guest(vm, g) ({				\
>   	typeof(g) *_p = addr_gva2hva(vm, (vm_vaddr_t)&(g));	\
>   	memcpy(_p, &(g), sizeof(g));				\
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 9741a7ff6380..45d21e052db0 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -586,35 +586,6 @@ userspace_mem_region_find(struct kvm_vm *vm, uint64_t start, uint64_t end)
>   	return NULL;
>   }
>   
> -/*
> - * KVM Userspace Memory Region Find
> - *
> - * Input Args:
> - *   vm - Virtual Machine
> - *   start - Starting VM physical address
> - *   end - Ending VM physical address, inclusive.
> - *
> - * Output Args: None
> - *
> - * Return:
> - *   Pointer to overlapping region, NULL if no such region.
> - *
> - * Public interface to userspace_mem_region_find. Allows tests to look up
> - * the memslot datastructure for a given range of guest physical memory.
> - */
> -struct kvm_userspace_memory_region *
> -kvm_userspace_memory_region_find(struct kvm_vm *vm, uint64_t start,
> -				 uint64_t end)
> -{
> -	struct userspace_mem_region *region;
> -
> -	region = userspace_mem_region_find(vm, start, end);
> -	if (!region)
> -		return NULL;
> -
> -	return &region->region;
> -}
> -
>   __weak void vcpu_arch_free(struct kvm_vcpu *vcpu)
>   {
>   

Will queue this.

Paolo

