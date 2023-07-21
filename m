Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D62C875CB08
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 17:10:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DVDpX5Mq;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DVDpX5Mq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6tJv5kVzz3cVt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 01:10:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DVDpX5Mq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DVDpX5Mq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6tGR3RHSz3cR2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 01:07:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689952077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AtcGzkETEnO18qgeRoihrAkrVd5qbbNpgaZO4bjwaRo=;
	b=DVDpX5Mq0I0uPf4FRmTHdmQJvJP9sLYUKojjFTHyLm1808o3uGh4O+gdN7ZrlDsiqAv08U
	uUrUHJnvsT2EjvpCRInoJOLhIYC9anidPyXHzQPoZ6Pw6L9/xhs93ueJdK4JWrc3Ez2oFv
	2mM58jXmzk5yVPphgxYxCjw2W3QrPTI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689952077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AtcGzkETEnO18qgeRoihrAkrVd5qbbNpgaZO4bjwaRo=;
	b=DVDpX5Mq0I0uPf4FRmTHdmQJvJP9sLYUKojjFTHyLm1808o3uGh4O+gdN7ZrlDsiqAv08U
	uUrUHJnvsT2EjvpCRInoJOLhIYC9anidPyXHzQPoZ6Pw6L9/xhs93ueJdK4JWrc3Ez2oFv
	2mM58jXmzk5yVPphgxYxCjw2W3QrPTI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-kgOqgmFXPbyZksKu-qfS4A-1; Fri, 21 Jul 2023 11:07:54 -0400
X-MC-Unique: kgOqgmFXPbyZksKu-qfS4A-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-4fbe4f88b67so2069853e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 08:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689952067; x=1690556867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AtcGzkETEnO18qgeRoihrAkrVd5qbbNpgaZO4bjwaRo=;
        b=S7SQkD/Db+/I9MT5avD9Dh0VK7iY3cSXU3sfFqYmVkWCtiqjKjN1dg4as/Ry38eYy4
         NJ3hWpux+FM+sU6xVJT+orXCoO4fTYH+FdAAtzZwnDUMZVSALBg43I9sg8nzZqqvh2op
         iDgYLGlUpv1RgeVcerHdemtQNlbISDU+WJZGdRBMnDtTgpuWvM6R3TdpvyytbUFhvLwF
         0RZA0EXOPgPYoYrFyFPfhYsAA+ZkheVVZPMx9nVds0F7f5hYBMoAtoF+SNgybmJLEKTv
         sDFCJxJozJ4p0NleXqU4Va/xpiu4TKiOzOfYbNHpNtiNTFXqtKlNpWMHhBJGTiblMA9Z
         mXig==
X-Gm-Message-State: ABy/qLaFvRbETiH61yQJSaJ2GbZs/nIxqHyd3gvl8oTLweqr4A3c5Kqa
	qhWa/8xnHAW3T8U+w+Rx+9bFb17q8ZHClXBbDkjl5n8ooi+DtaqYrZldsiYVGRQuETxkt6kEng7
	jck40pgYH/cc0GEc5DDktepstsw==
X-Received: by 2002:ac2:4191:0:b0:4f8:5ab0:68c4 with SMTP id z17-20020ac24191000000b004f85ab068c4mr1303818lfh.59.1689952067658;
        Fri, 21 Jul 2023 08:07:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGo8Pi+B+7hRHqSy6ClZ4oP94DPqHOZMbTIQ3rRFkaZiIFeWC2//bW1iNqq7vZ0rxNpIdgKag==
X-Received: by 2002:ac2:4191:0:b0:4f8:5ab0:68c4 with SMTP id z17-20020ac24191000000b004f85ab068c4mr1303798lfh.59.1689952067306;
        Fri, 21 Jul 2023 08:07:47 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id p1-20020a056402074100b0051df5eefa20sm2257329edy.76.2023.07.21.08.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 08:07:46 -0700 (PDT)
Message-ID: <123035a3-9d0d-70be-9894-f89a84c7e8fd@redhat.com>
Date: Fri, 21 Jul 2023 17:07:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 15/29] KVM: Drop superfluous
 __KVM_VCPU_MULTIPLE_ADDRESS_SPACE macro
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-16-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230718234512.1690985-16-seanjc@google.com>
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

On 7/19/23 01:44, Sean Christopherson wrote:
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/include/asm/kvm_host.h | 1 -
>   include/linux/kvm_host.h        | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index b87ff7b601fa..7a905e033932 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -2105,7 +2105,6 @@ enum {
>   #define HF_SMM_MASK		(1 << 1)
>   #define HF_SMM_INSIDE_NMI_MASK	(1 << 2)
>   
> -# define __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
>   # define KVM_ADDRESS_SPACE_NUM 2
>   # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
>   # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 0d1e2ee8ae7a..5839ef44e145 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -693,7 +693,7 @@ bool kvm_arch_irqchip_in_kernel(struct kvm *kvm);
>   #define KVM_MEM_SLOTS_NUM SHRT_MAX
>   #define KVM_USER_MEM_SLOTS (KVM_MEM_SLOTS_NUM - KVM_INTERNAL_MEM_SLOTS)
>   
> -#ifndef __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
> +#if KVM_ADDRESS_SPACE_NUM == 1
>   static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>   {
>   	return 0;

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

