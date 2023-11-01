Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 791AF7DE82C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 23:35:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nO+oAXc4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLMKb2Yvyz3cfR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 09:35:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nO+oAXc4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3k9jczqykdhqkwsfbuyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLMJm22d1z2xqp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Nov 2023 09:35:02 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a90d6ab944so5416607b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Nov 2023 15:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698878099; x=1699482899; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oVrvOLECZXxSaWjRNpKGTaiE8FNIaCo3DEHHzsR8PGo=;
        b=nO+oAXc4nipSvpXPrR17To9eKTlEQCNp04hGm4Yucovt5WrdnYtbfAOaKVOzle664+
         aBv6Hhx1tHfqR7inRbQMbNHk1qQ7jrhfXqyOqmtKZXsG6Lmd8Dd1MzmxffB187xYnFLf
         bYW/kjXVOgxSGhmHq3BSWPz0Jcl2P2pOPbmUffJeUTtchA6kMl2+JERBfAVRe7tgtvNn
         cAS5lTnR11o5opB/B5UxkVkCYoAZ6X7wLCHvD5+a6wp/O2TDCZrP27Z2a+mMhXF25quE
         oCvU3aHdaJnzsjkaothapN6y0SMXz+aQAJ21CYRGEplexXr8VVvUHGleoX0ovwRtykS6
         LtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698878099; x=1699482899;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVrvOLECZXxSaWjRNpKGTaiE8FNIaCo3DEHHzsR8PGo=;
        b=majORnPiP6Ktjw+gYZHoRDaY0l3rr0AzavRQD04qbuuGXOPClIDgjib4clPBvXRAkB
         vmWfMWQugcChCIbEtVgFvEJG0Sw1d05x0qJnBU7NHoEv4xypw5THZlQxLuC/P538L+Gy
         K/aUi5n8n8uvWUahbN2/wwOICv423Ri0Sfh7+720PQBYMj//O7LoF1efjWw1FW3c7Bw4
         Ore51yBHBHMdTzk1vP79hla7XuDClYefyZtZOsia6TA9BzDSHiIo7ttuG8xM6hXHKVuT
         acCTdCS9svEiaKX8vchLA3IA+oaTK0yWTXOSYBU5/twuUjA44BijPW8DFKn8rE2thwnv
         K4kw==
X-Gm-Message-State: AOJu0YzfiyplMGF9uyXAoIgShe12u4sJ6R2t5hjiO1Y+ks8wwsQUPi4D
	U7WVzYUTXHubvvK3kkKaYwax24H21VA=
X-Google-Smtp-Source: AGHT+IGD6UN3MOOerdMFLEmny4gzkak60wHqIVXKsA4NlWLNqw1UJj00i84usFlUQuEsQ45Qnt2ok92VRKM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:9214:0:b0:5a7:bbdb:6b39 with SMTP id
 j20-20020a819214000000b005a7bbdb6b39mr350826ywg.3.1698878099514; Wed, 01 Nov
 2023 15:34:59 -0700 (PDT)
Date: Wed, 1 Nov 2023 15:34:58 -0700
In-Reply-To: <4ca2253d-276f-43c5-8e9f-0ded5d5b2779@redhat.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com> <ZUEML6oJXDCFJ9fg@google.com>
 <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com> <ZUJVfCkIYYFp5VwG@google.com>
 <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
 <ZUJ-cJfofk2d_I0B@google.com> <4ca2253d-276f-43c5-8e9f-0ded5d5b2779@redhat.com>
Message-ID: <ZULSkilO-tdgDGyT@google.com>
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, A
 nup Patel <anup@brainfault.org>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 01, 2023, Paolo Bonzini wrote:
> On 11/1/23 17:36, Sean Christopherson wrote:
> > > > "Allow" isn't perfect, e.g. I would much prefer a straight KVM_GUEST_MEMFD_USE_HUGEPAGES
> > > > or KVM_GUEST_MEMFD_HUGEPAGES flag, but I wanted the name to convey that KVM doesn't
> > > > (yet) guarantee hugepages.  I.e. KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is stronger than
> > > > a hint, but weaker than a requirement.  And if/when KVM supports a dedicated memory
> > > > pool of some kind, then we can add KVM_GUEST_MEMFD_REQUIRE_HUGEPAGE.
> > > I think that the current patch is fine, but I will adjust it to always
> > > allow the flag, and to make the size check even if !CONFIG_TRANSPARENT_HUGEPAGE.
> > > If hugepages are not guaranteed, and (theoretically) you could have no
> > > hugepage at all in the result, it's okay to get this result even if THP is not
> > > available in the kernel.
> > Can you post a fixup patch?  It's not clear to me exactly what behavior you intend
> > to end up with.
> 
> Sure, just this:
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 7d1a33c2ad42..34fd070e03d9 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -430,10 +430,7 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>  {
>  	loff_t size = args->size;
>  	u64 flags = args->flags;
> -	u64 valid_flags = 0;
> -
> -	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> -		valid_flags |= KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
> +	u64 valid_flags = KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
>  	if (flags & ~valid_flags)
>  		return -EINVAL;
> @@ -441,11 +438,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>  	if (size < 0 || !PAGE_ALIGNED(size))
>  		return -EINVAL;
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  	if ((flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE) &&
>  	    !IS_ALIGNED(size, HPAGE_PMD_SIZE))
>  		return -EINVAL;
> -#endif

That won't work, HPAGE_PMD_SIZE is valid only for CONFIG_TRANSPARENT_HUGEPAGE=y.

#else /* CONFIG_TRANSPARENT_HUGEPAGE */
#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
#define HPAGE_PMD_MASK ({ BUILD_BUG(); 0; })
#define HPAGE_PMD_SIZE ({ BUILD_BUG(); 0; })

...

>  	return __kvm_gmem_create(kvm, size, flags);
>  }
> 
> Paolo
> 
