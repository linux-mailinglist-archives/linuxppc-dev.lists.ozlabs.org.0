Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4B4763BE2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 18:00:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ypSxifbz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9zC64t8Zz3cM3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 02:00:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ypSxifbz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3-0lbzaykdlikwsfbuyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9zB83Hn2z2yV0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 01:59:58 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d10792c7582so3434717276.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690387195; x=1690991995;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x1RCz9AGh0t/+COzjYLcha5fkSMq/GNrC4CuEfgGTfc=;
        b=ypSxifbz+3xr2TyQi3H8IoM4jyz7RGQWDnGcHi1NC0Po8RTEHh8icWGPEeM5z47awl
         loHCPZy4rtZMbUI9RqdI0QLfF+ad98/C7r2wxAa7ZpGCgkUVuuHTSwwJ1OUjNqHnXY8X
         84BBat8mly4SBV0f6KqsOvHk8cSJA6wdZ1HsQOFr2IirR9RtsavVXkabaGLdXW2RSaSS
         UJmT6LqQAsULk7Nz99DvDaEAqSJ5Xa6WPtogY6EBxsD6vOblRb8mRKx+BIAVyZOlnkaE
         pEMJT5wcLP195pWDDcCypB4wv+dW/iWZkWl4YuLww/x6MLh6go/yMgsbLUu6B2dDA/yw
         w4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690387195; x=1690991995;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1RCz9AGh0t/+COzjYLcha5fkSMq/GNrC4CuEfgGTfc=;
        b=TDcRmDAF2zZblvPY0NUB7bkVZMRWH2AfTC87NMVSzH27giJgiybm/nxJVVIsIy83ym
         AWrCRWl6zr8umwJ8yupGujMNU5TvqLgUoN7UUYY0brvvolIXul7VVywJyfFsbE/heIX2
         sZknTUmhFPye9NJ3/U7NkHhA5J9Ftv/DOHFu9LS3N0w9tstr+v7AdZ03D70fSVe03Hrx
         nK0O8dOyWutkc+vlt6PAi6UC/U6GfpF26+62TIawAbLoVgMGwCKCUAGXe+EbPH6k9Z1T
         fF8/cXoEptpHYqvv2wd2F4u4RZ9BFifKaMKwL04ek9yP9j5QX9wlDLJVQhqGDoyiNr54
         wzsA==
X-Gm-Message-State: ABy/qLZeFnAXOdmSaxwLfIpEdAFyQ3IQszRenmwtIeSLEQxtAgSkWHFy
	6+flujAnpVEmUfYG8KSXcKaCrTF8gMA=
X-Google-Smtp-Source: APBJJlE6mP/UcpH4lPNK9j4UUpMqMy7oSio4zbtJsZXhMStHU1Br/fIarHdKjyAaokfpTf45S20N2ryKLpo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:99c8:0:b0:d1c:e102:95a5 with SMTP id
 q8-20020a2599c8000000b00d1ce10295a5mr15014ybo.7.1690387195164; Wed, 26 Jul
 2023 08:59:55 -0700 (PDT)
Date: Wed, 26 Jul 2023 08:59:53 -0700
In-Reply-To: <ZL4BiQWihfrD0TOJ@yilunxu-OptiPlex-7050>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-9-seanjc@google.com>
 <ZL4BiQWihfrD0TOJ@yilunxu-OptiPlex-7050>
Message-ID: <ZMFC+V6Llv1JWLEt@google.com>
Subject: Re: [RFC PATCH v11 08/29] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Xu Yilun <yilun.xu@intel.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver
  Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 24, 2023, Xu Yilun wrote:
> On 2023-07-18 at 16:44:51 -0700, Sean Christopherson wrote:
> > @@ -1346,6 +1350,9 @@ static void kvm_destroy_vm(struct kvm *kvm)
> >  		kvm_free_memslots(kvm, &kvm->__memslots[i][0]);
> >  		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
> >  	}
> > +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> > +	xa_destroy(&kvm->mem_attr_array);
> > +#endif
> 
> Is it better to make the destruction in reverse order from the creation?

Yeah.  It _shoudn't_ matter, but there's no reason not keep things tidy and
consistent.

> To put xa_destroy(&kvm->mem_attr_array) after cleanup_srcu_struct(&kvm->srcu),
> or put xa_init(&kvm->mem_attr_array) after init_srcu_struct(&kvm->irq_srcu).

The former, because init_srcu_struct() can fail (allocates memory), whereas
xa_init() is a "pure" initialization routine.

> >  	cleanup_srcu_struct(&kvm->irq_srcu);
> >  	cleanup_srcu_struct(&kvm->srcu);
> >  	kvm_arch_free_vm(kvm);
> > @@ -2346,6 +2353,145 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
> >  }
> >  #endif /* CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */
> 
> [...]
> 
> > +static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> > +					   struct kvm_memory_attributes *attrs)
> > +{
> > +	gfn_t start, end;
> > +
> > +	/* flags is currently not used. */
> > +	if (attrs->flags)
> > +		return -EINVAL;
> > +	if (attrs->attributes & ~kvm_supported_mem_attributes(kvm))
> > +		return -EINVAL;
> > +	if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
> > +		return -EINVAL;
> > +	if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
> > +		return -EINVAL;
> > +
> > +	start = attrs->address >> PAGE_SHIFT;
> > +	end = (attrs->address + attrs->size - 1 + PAGE_SIZE) >> PAGE_SHIFT;
> 
> As the attrs->address/size are both garanteed to be non-zero, non-wrap
> and page aligned in prevous check. Is it OK to simplify the calculation,
> like:
> 
>   end = (attrs->address + attrs->size) >> PAGE_SHIFT;

Yes, that should work.

Chao, am I missing something?  Or did we just end up with unnecessarly convoluted
code as things evolved?

> > +
> > +	if (WARN_ON_ONCE(start == end))
> > +		return -EINVAL;
> 
> Also, is this check possible to be hit? Maybe remove it?

It should be impossible to, hence the WARN.  I added the check for two reasons:
(1) to help document that end is exclusive, and (2) to guard against future bugs.
