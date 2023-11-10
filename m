Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1657E8118
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 19:23:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=k1akDEfa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRnJr2wStz3cZm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 05:23:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=k1akDEfa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3bhvozqykdfkj51ea37ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRnHv2vvBz30fD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Nov 2023 05:23:05 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5b02ed0f886so31980747b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 10:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699640581; x=1700245381; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/u2JG0fndtvz5StB0AokXkOquj7NpP7M8gj3x0QBG2E=;
        b=k1akDEfaYOrqvKjGdfeCoiInVnqlLSoe9ZpTfAyvjtdQVV0RVTfQUCnrCi222J0iUw
         ie5DdCAQhl+WL01Nj32jh0QyB3VoSE95PIRHuCY9eklKQDqPoEMj5WteRLIA3LvlR0+w
         yiaKQ5cQtmg7nvOFLgqf0n4Y/QX9aAL0N7FPPdjTCR4bzNFMDr73O44fQlIYR4YS7Xcu
         qlPFMU8dwUiOjMPuQzK9J2JhIpY0lPXGB9Ma8rpS8nU/daDsBD26HjTK8iJi6ShTp482
         TjSmuLlTKIGF2freWcXaf646ZQEGJNmzrjOB396UXSE/FDEBFKM0e3rUnhL9Xjcw9V0Z
         1xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699640581; x=1700245381;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/u2JG0fndtvz5StB0AokXkOquj7NpP7M8gj3x0QBG2E=;
        b=juGpjG0whjO01Y8Cqju48fTrMjvhbeACXOYzpx2bFLRWip/at0YhP7aGQ/MrQgpIyo
         bXZDJ8rg4lhUX8pHE57/Lx2CiTKi6ThZP6ZmTfpfAJoeWF/ptLmcij6U2ekoOCxo9mAX
         6EpUM1N2wxc+rf1CEwiOmRiTqNweZYOeUojAmgaPfiEvIBNUhYSOdzvLrUMNj7SCx2UN
         nMK9rtp+nrRz0BsjSHmJZpwMYEpO3ky7BKqNc2TjFV/AO+Aka+YFJq2lOlJMhwOJ3Kfy
         5xi4k5Ic7jzg1n+uyINpwueMtvpCWS/dwOnrj6f3nwtumDfCZzqDrt8y8DlZ3chjyk7w
         IQSA==
X-Gm-Message-State: AOJu0Yw7xhj/isUDZLps8ieJey4JH56QyiHE7HAEVBu+KYHQF2jgWJ8o
	AYcJRBrACfYK0mqlE7WB6b/RlPrIPsA=
X-Google-Smtp-Source: AGHT+IFilgu1/Q1EZiEoL3sTFYKCQfnhtgAeMBBAfAGcs6DHfZF6Y3nZ5EepLJy80XYZ0ZRT2keQkzxRdJY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ef0c:0:b0:5be:ae71:d70a with SMTP id
 o12-20020a81ef0c000000b005beae71d70amr242444ywm.4.1699640580898; Fri, 10 Nov
 2023 10:23:00 -0800 (PST)
Date: Fri, 10 Nov 2023 10:22:59 -0800
In-Reply-To: <956d8ee3-8b63-4a2d-b0c4-c0d3d74a0f6f@intel.com>
Mime-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-16-pbonzini@redhat.com>
 <956d8ee3-8b63-4a2d-b0c4-c0d3d74a0f6f@intel.com>
Message-ID: <ZU51A3U6E3aZXayC@google.com>
Subject: Re: [PATCH 15/34] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.co
 m>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 10, 2023, Xiaoyao Li wrote:
> On 11/6/2023 12:30 AM, Paolo Bonzini wrote:
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 68a144cb7dbc..a6de526c0426 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -589,8 +589,20 @@ struct kvm_memory_slot {
> >   	u32 flags;
> >   	short id;
> >   	u16 as_id;
> > +
> > +#ifdef CONFIG_KVM_PRIVATE_MEM
> > +	struct {
> > +		struct file __rcu *file;
> > +		pgoff_t pgoff;
> > +	} gmem;
> > +#endif
> >   };
> > +static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
> > +{
> > +	return slot && (slot->flags & KVM_MEM_GUEST_MEMFD);
> > +}
> > +
> 
> maybe we can move this block and ...
> 
> <snip>
> 
> > @@ -2355,6 +2379,30 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
> >   					struct kvm_gfn_range *range);
> >   bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> >   					 struct kvm_gfn_range *range);
> > +
> > +static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> > +{
> > +	return IS_ENABLED(CONFIG_KVM_PRIVATE_MEM) &&
> > +	       kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
> > +}
> > +#else
> > +static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> > +{
> > +	return false;
> > +}
> >   #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
> 
> this block to Patch 18?

It would work, but my vote is to keep them here to minimize the changes to common
KVM code in the x86 enabling.  It's not a strong preference though.  Of course,
at this point, fiddling with this sort of thing is probably a bad idea in terms
of landing guest_memfd.

> > @@ -4844,6 +4875,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
> >   #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> >   	case KVM_CAP_MEMORY_ATTRIBUTES:
> >   		return kvm_supported_mem_attributes(kvm);
> > +#endif
> > +#ifdef CONFIG_KVM_PRIVATE_MEM
> > +	case KVM_CAP_GUEST_MEMFD:
> > +		return !kvm || kvm_arch_has_private_mem(kvm);
> >   #endif
> >   	default:
> >   		break;
> > @@ -5277,6 +5312,18 @@ static long kvm_vm_ioctl(struct file *filp,
> >   	case KVM_GET_STATS_FD:
> >   		r = kvm_vm_ioctl_get_stats_fd(kvm);
> >   		break;
> > +#ifdef CONFIG_KVM_PRIVATE_MEM
> > +	case KVM_CREATE_GUEST_MEMFD: {
> > +		struct kvm_create_guest_memfd guest_memfd;
> 
> Do we need a guard of below?
> 
> 		r = -EINVAL;
> 		if (!kvm_arch_has_private_mem(kvm))
> 			goto out;

Argh, yeah, that's weird since KVM_CAP_GUEST_MEMFD says "not supported" if the
VM doesn't support private memory.

Enforcing that would break guest_memfd_test.c though.  And having to create a
"special" VM just to test basic guest_memfd functionality would be quite
annoying.

So my vote is to do:

	case KVM_CAP_GUEST_MEMFD:
		return IS_ENABLED(CONFIG_KVM_PRIVATE_MEM);

There's no harm to KVM if userspace creates a file it can't use, and at some
point KVM will hopefully support guest_memfd irrespective of private memory.
