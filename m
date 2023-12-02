Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B921801922
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Dec 2023 01:52:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=P+OGwpec;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Shrxy4cR4z3dHP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Dec 2023 11:52:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=P+OGwpec;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3rx9qzqykdig4qmzvos00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Shrx33rqzz3c9y
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Dec 2023 11:52:05 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6cddec65393so3790950b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Dec 2023 16:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701478317; x=1702083117; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qf5LyHZHuBq8ET8yZ518WK6d/Ohu8OSBvuXvyN934wU=;
        b=P+OGwpectnM214EeO19/RurBhNiaAuZ2PGnmPM3JLTNwLWczeM1p1atQ4nDPWTcBpp
         cxIsN8BIUNgWZ7qE78rh1rEm/RYN2n2EMUIfoiXrHVuRo+5dKLzaqNtXkfqLWF+amFR+
         MAQOQoyh3OoypHzfRo8ozZZFqPMd8RCQOsXUCtgjfx//rpgSQGtkyqHFHc/NGmLX2iI8
         p8MFsZA1mswthTqlhkNXWbwRZtA+LXwHp8SZHmfjvqZeTufpoNEJoZ5khVsBh8NGo3fa
         I+5iU/zdaTfjvwxez8mcak0g3ILr4czfggeavlZ23QNoRmyCPFoE0hJKsioounnC8FyR
         6QXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701478317; x=1702083117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qf5LyHZHuBq8ET8yZ518WK6d/Ohu8OSBvuXvyN934wU=;
        b=WWUwqqCM3tWwpAhC+/PmO7m+qtwq7TyRGNTT0JIw3KZz57l8D1hKGcGx4KSDjsLgXp
         eeD97n9WUPSHdmeUDwdCn6c5qL65flkrd5kL8HML5e9GpZ5xG+pk8aD6ZOut+7u5Nl/d
         gX9hgLpVSGQmVy0Jda+7gABgdkhLEhmTTqbsFqD6tAjpukBhv3AACSQu+rJ1I/w0z3OP
         ua5cOax0HcrNm/yTUWjoxpcHYnsgCcxtZlT3yx8PFr4mVV8l6cYonoi0oZdfm+HSu+fe
         RDKJSmHeQaOdd887XimjrhHS14Nx9YLDxm7Kb1BmMVMszdufCg44i5R/d56z01Agt332
         LbMQ==
X-Gm-Message-State: AOJu0YyzqDcEERmBwcn4JD1Lgthik/aweL4HnBMZG2/NKQJKU7Rxy2Ws
	5L4w9OMt/363NK2POKaC4yR3A/EHAHM=
X-Google-Smtp-Source: AGHT+IEloABSTDcKm+41L5WpzazJRfhcCVpuae9X+15kKFthyi+8YQcZOmegDR+VoF+o36yu4wG4kUpnsoo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:5848:0:b0:5b8:fe99:152d with SMTP id
 i8-20020a635848000000b005b8fe99152dmr4028549pgm.7.1701478317322; Fri, 01 Dec
 2023 16:51:57 -0800 (PST)
Date: Fri, 1 Dec 2023 16:51:55 -0800
In-Reply-To: <20230918160258.GL13795@ziepe.ca>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-6-seanjc@google.com>
 <20230918152110.GI13795@ziepe.ca> <ZQhxpesyXeG+qbS6@google.com> <20230918160258.GL13795@ziepe.ca>
Message-ID: <ZWp_q1w01NCZi8KX@google.com>
Subject: Re: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO,
 don't do circular lookup
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: x86@kernel.org, kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>, Andrew Thornton <andrewth@google.com>, Ingo Molnar <mingo@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Venkatesh Srinivas <venkateshs@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Borislav Petkov <bp@alien8.de>, And
 y Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Krowiak <akrowiak@linux.ibm.com>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-perf-users@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 18, 2023, Jason Gunthorpe wrote:
> On Mon, Sep 18, 2023 at 08:49:57AM -0700, Sean Christopherson wrote:
> > On Mon, Sep 18, 2023, Jason Gunthorpe wrote:
> > > On Fri, Sep 15, 2023 at 05:30:57PM -0700, Sean Christopherson wrote:
> > > > Explicitly pass KVM's get/put helpers to VFIO when attaching a VM to
> > > > VFIO instead of having VFIO do a symbol lookup back into KVM.  Having both
> > > > KVM and VFIO do symbol lookups increases the overall complexity and places
> > > > an unnecessary dependency on KVM (from VFIO) without adding any value.
> > > > 
> > > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > > ---
> > > >  drivers/vfio/vfio.h      |  2 ++
> > > >  drivers/vfio/vfio_main.c | 74 +++++++++++++++++++---------------------
> > > >  include/linux/vfio.h     |  4 ++-
> > > >  virt/kvm/vfio.c          |  9 +++--
> > > >  4 files changed, 47 insertions(+), 42 deletions(-)
> > > 
> > > I don't mind this, but Christoph had disliked my prior attempt to do
> > > this with function pointers..
> > > 
> > > The get can be inlined, IIRC, what about putting a pointer to the put
> > > inside the kvm struct?
> > 
> > That wouldn't allow us to achieve our goal, which is to hide the details of
> > "struct kvm" from VFIO (and the rest of the kernel).
> 
> > What's the objection to handing VFIO a function pointer?
> 
> Hmm, looks like it was this thread:
> 
>  https://lore.kernel.org/r/0-v1-33906a626da1+16b0-vfio_kvm_no_group_jgg@nvidia.com
> 
> Your rational looks a little better to me.
> 
> > > The the normal kvm get/put don't have to exported symbols at all?
> > 
> > The export of kvm_get_kvm_safe() can go away (I forgot to do that in this series),
> > but kvm_get_kvm() will hang around as it's needed by KVM sub-modules (PPC and x86),
> > KVMGT (x86), and drivers/s390/crypto/vfio_ap_ops.c (no idea what to call that beast).
> 
> My thought would be to keep it as an inline, there should be some way
> to do that without breaking your desire to hide the bulk of the kvm
> struct content. Like put the refcount as the first element in the
> struct and just don't ifdef it away?.

That doesn't work because of the need to invoke kvm_destroy_vm() when the last
reference is put, i.e. all of kvm_destroy_vm() would need to be inlined (LOL) or
VFIO would need to do a symbol lookup on kvm_destroy_vm(), which puts back us at
square one.

There's one more wrinkle: this patch is buggy in that it doesn't ensure the liveliness
of KVM-the-module, i.e. nothing prevents userspace from unloading kvm.ko while VFIO
still holds a reference to a kvm structure, and so invoking ->put_kvm() could jump
into freed code.  To fix that, KVM would also need to pass along a module pointer :-(

One thought would be to have vac.ko (tentative name), which is the "base" module
that will hold the KVM/virtualization bits that need to be singletons, i.e. can't
be per-KVM, provide the symbols needed for VFIO to manage references.  But that
just ends up moving the module reference trickiness into VAC+KVM, e.g. vac.ko would
still need to be handed a function pointer in order to call back into the correct
kvm.ko code.

Hrm, but I suspect the vac.ko <=> kvm.ko interactions will need to deal with
module shenanigans anyways, and the shenanigans would only affect crazy people
like us that actually want multiple KVM modules.

I'll plan on going that route.  The very worst case scenario is that it just punts
this conversation down to a possibile future.  Dropping this patch and the previous
prep patch won't meaningful affect the goals of this series, as only kvm_get_kvm_safe()
and kvm_get_kvm() would need to be exposed outside of #ifdef __KVM__.  Then we can
figure out what to do with them if/when the whole multi-KVM thing comes along.
