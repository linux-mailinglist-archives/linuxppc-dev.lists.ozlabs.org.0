Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B14763F94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 21:29:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=VVF1b7RU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RB3qP4HZrz3cNH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 05:29:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=VVF1b7RU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3zxpbzaykdoyamivrkowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RB3pW3YLHz2ygy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 05:28:17 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1bba7a32a40so1027065ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 12:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690399693; x=1691004493;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JT2UHI+2Np7L7QsdeetNAkLhraffv5kgEdfCjKl11Yk=;
        b=VVF1b7RUawi3/QYYQt22u1jH5OUH1Tf8XnLnE4b/agwXthOwpe69728aWprc+cBAPp
         m1NzpejyJPFn+J7cEl/k4Xfw7NV/DNs921DAj4mD25qN63m2UV8rxLRjeMa24TJWqXH7
         YevHJEPTBXycw8cNMxRiQayY5davffRodPeaquNPMlG3yhTbW+l2TZNv0KoNxIAjUf1u
         vx7QnvYOOpb+Nn9iea9EFg+zAfgVPq5/2O4eLtzlraYz5aepPr1S1PEGRUkv/ClpXjx1
         oD0KN8QbT88DXT6sIsMyGXbNhhlwFsmmZRUM0BDYakuaZeCUCb/tpsShC/zQA5q7Janp
         MXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690399693; x=1691004493;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JT2UHI+2Np7L7QsdeetNAkLhraffv5kgEdfCjKl11Yk=;
        b=HTLNoZWOIx392eUuK0eQG5HMmqSmthW8FbTPMrlimwB3+Qwe7EbBMFt7YDndbElv3m
         H/cwfFfvo2yFisVpyk14a0FHJ7bpB/LLioCw0GZr/aUz3yfXPv1P/a2CBDZ3o1A55Mxi
         K6M0/oPJovcCuoMiTiq6mTgk6qtjZ6aKBTGbB8j6Fo7xc6PA95gVgYM7w97rnv/IkJy+
         jv2PakfgIzMrpttp0mXfy0Rfibpzrw9hYqVPi/RHH0oOvjfFQ7R4N+K0g8fY42i5mglH
         h0QW46wc1NwwOvGJ33J9UHCoR61+jgoNNF6AEVFvIPzRT/kI7rOA1y5egzw6nPyvTJzJ
         EneA==
X-Gm-Message-State: ABy/qLbHjd2BjcyToo1kJPGaZY8tj1hZ8XiiLMSLLXTMEON/XtVL8xZD
	Q9CKq9+Vc9M5Vg87d5iIyoamUeu4qlI=
X-Google-Smtp-Source: APBJJlGcmwLcdH6TXOymYc9nTB5UyZup+2YRvQp3iON5gHoKZStwU7nqu5mwxNJ6DvyQEbhf1ifDNjwDMJ4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ce8b:b0:1b8:2055:fc1f with SMTP id
 f11-20020a170902ce8b00b001b82055fc1fmr13036plg.2.1690399693010; Wed, 26 Jul
 2023 12:28:13 -0700 (PDT)
Date: Wed, 26 Jul 2023 12:28:11 -0700
In-Reply-To: <8f7ea958-7caa-a185-10d2-900024aeddf0@quicinc.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <8f7ea958-7caa-a185-10d2-900024aeddf0@quicinc.com>
Message-ID: <ZMFzyy5mZVxLn4uo@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Elliot Berman <quic_eberman@quicinc.com>
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

On Wed, Jul 26, 2023, Elliot Berman wrote:
> 
> 
> On 7/18/2023 4:44 PM, Sean Christopherson wrote:
> > TODO
>  <snip>
> > diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
> > index 6325d1d0e90f..15041aa7d9ae 100644
> > --- a/include/uapi/linux/magic.h
> > +++ b/include/uapi/linux/magic.h
> > @@ -101,5 +101,6 @@
> >   #define DMA_BUF_MAGIC		0x444d4142	/* "DMAB" */
> >   #define DEVMEM_MAGIC		0x454d444d	/* "DMEM" */
> >   #define SECRETMEM_MAGIC		0x5345434d	/* "SECM" */
> > +#define GUEST_MEMORY_MAGIC	0x474d454d	/* "GMEM" */
> 
> 
> Should this be:
> 
> #define GUEST_MEMORY_KVM_MAGIC
> 
> or KVM_GUEST_MEMORY_KVM_MAGIC?
> 
> BALLOON_KVM_MAGIC is KVM-specific few lines above.

Ah, good point.  My preference would be either KVM_GUEST_MEMORY_MAGIC or
KVM_GUEST_MEMFD_MAGIC.  Though hopefully we don't actually need a dedicated
filesystem, I _think_ it's unnecessary if we don't try to support userspace
mounts.

> ---
> 
> Originally, I was planning to use the generic guest memfd infrastructure to
> support Gunyah hypervisor, however I see that's probably not going to be
> possible now that the guest memfd implementation is KVM-specific. I think
> this is good for both KVM and Gunyah as there will be some Gunyah specifics
> and some KVM specifics in each of implementation, as you mentioned in the
> previous series.

Yeah, that's where my headspace is at too.  Sharing the actual uAPI, and even
internal APIs to some extent, doesn't save all that much, e.g. wiring up an ioctl()
is the easy part.  Whereas I strongly suspect each hypervisor use case will want
different semantics for the uAPI.

> I'll go through series over next week or so and I'll try to find how much
> similar Gunyah guest mem fd implementation would be and we can see if it's
> better to pull whatever that ends up being into a common implementation?

That would be awesome!  

> We could also agree to have completely divergent fd implementations like we
> do for the UAPI. Thoughts?

I'd like to avoid _completely_ divergent implementations, e.g. the majority of
kvm_gmem_allocate() and __kvm_gmem_create() isn't KVM specific.  I think there
would be value in sharing the core allocation logic, even if the other details
are different.  Especially if we fully commit to not supporting migration or
swap, and decide to use xarray directly to manage folios instead of bouncing
through the filemap APIs.

Thanks!
