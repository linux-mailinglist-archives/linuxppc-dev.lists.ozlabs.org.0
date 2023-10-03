Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CFC7B6DBE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 18:00:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OYPH+wwL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Mwj68yJz3ddX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 03:00:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OYPH+wwL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3ydoczqykdhulxtgcvzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0Mvp35vBz3c5F
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 02:59:32 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d81646fcf3eso1311283276.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Oct 2023 08:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696348769; x=1696953569; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xP89tk8jeFUDqiHwgtcyinENLLmFDFAo+sp2wFgmRBw=;
        b=OYPH+wwLahyFnG8KHSWTnTcQwTHQ9RKcFqYMiSzseWDAKhWhPwOZ321Yp4vWj0A2xn
         Na9p27/PTcAqv5Z0mZzQZKeHjhYhhlpPkCTes8DzO1ciP7LhyHfshr/RJ+fqrZmQCXcl
         wYeI5a/AF669YgpHCJXz/79CB7pYz5+UZ/59txDAd9gvHEOLQ0HKiNdGWegGLHu5vNKu
         XhfGIRlVL/n0BMT8dcagQYqzwb920jY/bXZc3g1UUR6TINaeGEecpRYOhjC8K/0Jw9YJ
         BW52YiwJAzsgpdIGqMSfoyCdxzHrb1doq5p/eq60ywr3QAVIzdhEzaq7M9BvIO7IT70Q
         L/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696348769; x=1696953569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xP89tk8jeFUDqiHwgtcyinENLLmFDFAo+sp2wFgmRBw=;
        b=Ta3Rw8bqAi4ejPhakPZDc/vk40TXuVjTkx1bkCTPqNnGRgaLIR5cKgJfgW33Bbcckw
         xBsMnn/OHCJCsnKBDgDD+0DgEAI4wUMOdiDfSxdZ/KkLRq2h0iUsLCjz70aVUhxbpPcv
         FJwgEjesLj/HHoAcN2LT8J/iVjkDofOzFgy4H9evrqsbP+f+tOOiGSVnniJC885jXZb9
         x+YWCfjt/kCPGU+gi1+bwJCMAFxRNtHqe21WGE2MZj6ME4aits/068Q6QzNTG2tLpMWU
         5/wVIs4u9/3evMpoma39CxsmHERpJaZKLwYMp8fHx9q9LnJx0xsOeuXJeYMzaHwy5DOi
         9eSg==
X-Gm-Message-State: AOJu0YylfrM9S6qGwmn5onAm5gpqRyXodXjy7qkDBlilNI4BkIRRLUi6
	sxGi7G/5hKs8FKkOjvFE5hrIb8cqLfs=
X-Google-Smtp-Source: AGHT+IHlsTPxnmIroL8cntBugIBpa7VGBcPZjKPldlj/dItcEWdxSvIkKSkj76hPSiTFqWvviFkle9Hc81s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:3604:0:b0:d7a:c85c:725b with SMTP id
 d4-20020a253604000000b00d7ac85c725bmr227114yba.7.1696348768967; Tue, 03 Oct
 2023 08:59:28 -0700 (PDT)
Date: Tue, 3 Oct 2023 08:59:27 -0700
In-Reply-To: <CA+EHjTzSUXx8P9gWmUERg4owxH6r6yNPm1_RL-BzS_2CNPtRKw@mail.gmail.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
 <CA+EHjTzSUXx8P9gWmUERg4owxH6r6yNPm1_RL-BzS_2CNPtRKw@mail.gmail.com>
Message-ID: <ZRw6X2BptZnRPNK7@google.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel
 .org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 03, 2023, Fuad Tabba wrote:
> Hi,
> 
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index d2d913acf0df..f8642ff2eb9d 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -1227,6 +1227,7 @@ struct kvm_ppc_resize_hpt {
> >  #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
> >  #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
> >  #define KVM_CAP_USER_MEMORY2 230
> > +#define KVM_CAP_MEMORY_ATTRIBUTES 231
> >
> >  #ifdef KVM_CAP_IRQ_ROUTING
> >
> > @@ -2293,4 +2294,17 @@ struct kvm_s390_zpci_op {
> >  /* flags for kvm_s390_zpci_op->u.reg_aen.flags */
> >  #define KVM_S390_ZPCIOP_REGAEN_HOST    (1 << 0)
> >
> > +/* Available with KVM_CAP_MEMORY_ATTRIBUTES */
> > +#define KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES    _IOR(KVMIO,  0xd2, __u64)
> > +#define KVM_SET_MEMORY_ATTRIBUTES              _IOW(KVMIO,  0xd3, struct kvm_memory_attributes)
> > +
> > +struct kvm_memory_attributes {
> > +       __u64 address;
> > +       __u64 size;
> > +       __u64 attributes;
> > +       __u64 flags;
> > +};
> > +
> > +#define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> > +
> 
> In pKVM, we don't want to allow setting (or clearing) of PRIVATE/SHARED
> attributes from userspace.

Why not?  The whole thing falls apart if userspace doesn't *know* the state of a
page, and the only way for userspace to know the state of a page at a given moment
in time is if userspace controls the attributes.  E.g. even if KVM were to provide
a way for userspace to query attributes, the attributes exposed to usrspace would
become stale the instant KVM drops slots_lock (or whatever lock protects the attributes)
since userspace couldn't prevent future changes.

Why does pKVM need to prevent userspace from stating *its* view of attributes?

If the goal is to reduce memory overhead, that can be solved by using an internal,
non-ABI attributes flag to track pKVM's view of SHARED vs. PRIVATE.  If the guest
attempts to access memory where pKVM and userspace don't agree on the state,
generate an exit to userspace.  Or kill the guest.  Or do something else entirely.

> However, we'd like to use the attributes xarray to track the sharing state of
> guest pages at the host kernel.
> 
> Moreover, we'd rather the default guest page state be PRIVATE, and
> only specify which pages are shared. All pKVM guest pages start off as
> private, and the majority will remain so.

I would rather optimize kvm_vm_set_mem_attributes() to generate range-based
xarray entries, at which point it shouldn't matter all that much whether PRIVATE
or SHARED is the default "empty" state.  We opted not to do that for the initial
merge purely to keep the code as simple as possible (which is obviously still not
exactly simple).

With range-based xarray entries, the cost of tagging huge chunks of memory as
PRIVATE should be a non-issue.  And if that's not enough for whatever reason, I
would rather define the polarity of PRIVATE on a per-VM basis, but only for internal
storage.
 
> I'm not sure if this is the best way to do this: One idea would be to move
> the definition of KVM_MEMORY_ATTRIBUTE_PRIVATE to
> arch/*/include/asm/kvm_host.h, which is where kvm_arch_supported_attributes()
> lives as well. This would allow different architectures to specify their own
> attributes (i.e., instead we'd have a KVM_MEMORY_ATTRIBUTE_SHARED for pKVM).
> This wouldn't help in terms of preventing userspace from clearing attributes
> (i.e., setting a 0 attribute) though.
> 
> The other thing, which we need for pKVM anyway, is to make
> kvm_vm_set_mem_attributes() global, so that it can be called from outside of
> kvm_main.c (already have a local patch for this that declares it in
> kvm_host.h),

That's no problem, but I am definitely opposed to KVM modifying attributes that
are owned by userspace.

> and not gate this function by KVM_GENERIC_MEMORY_ATTRIBUTES.

As above, I am opposed to pKVM having a completely different ABI for managing
PRIVATE vs. SHARED.  I have no objection to pKVM using unclaimed flags in the
attributes to store extra metadata, but if KVM_SET_MEMORY_ATTRIBUTES doesn't work
for pKVM, then we've failed miserably and should revist the uAPI.
