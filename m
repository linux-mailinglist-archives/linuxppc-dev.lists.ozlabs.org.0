Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC55E7A1263
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 02:34:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=x2HMgclJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmwF06KcRz3cGw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 10:34:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=x2HMgclJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3c6ydzqykdpwwierngksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmwD70m38z309t
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 10:33:58 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d8109d3a3bbso1874809276.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 17:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694738035; x=1695342835; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J23lG2GsSAJUhRlfXZ8Nll1xYHKwqpwqAHVfDlHiwRQ=;
        b=x2HMgclJytJo2Idbki6qRWK8+6ZiJPoAfTJZxjyQ4c2iV+D4ODivtiX4BusJRhgYOa
         HcAz5t49AImN/Bu8uDr6FaQ0pUmDu6xu6oBj5QUKSBqptg+p41UxhgVqbGNj/sYqJnwQ
         KjJU2UqHTbspzR0CHVCVuzuyGDMApEi5qFur+lT4xVcNfesIofsQMVNHay+1lrJY6mLf
         lVAKhlRfG9lvaB+AnQKuiUsxGFGCpzkcqoyP2yy8ykjkyop9FFV6bg6SDhJJAuFmk1Yn
         p00nq1RT58Ocl+OiICeIV233sp6Og7g/vc7S9Hf0GkBYK6scZBrez0/cAY+I/t690kCh
         5zCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694738035; x=1695342835;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J23lG2GsSAJUhRlfXZ8Nll1xYHKwqpwqAHVfDlHiwRQ=;
        b=o8uFHtYfZjXQR+vyXf7vs/RmDVoCED1eNGkwil5W3hfPHYsZekM3sb8I7TOuTryw53
         DyH/6C0K1r9rrzGnn4zteigHiXW64lZ+SXJCnLMfgiKHJ1LYwRDuT4yRSbE+WKtwSIlw
         EmjH/EedPsUOQsbpWYCHqpvI8CDshf0oYXYLtCWC2JeT12oZjc3RgqryqbSXYvFMLj3b
         LLbt8QsVGJbpxEnhCt5Bborki5CCD2myreuV5ICowYzy1mighWGuAJi9b0AeBj68zyPK
         J/r1WO281mBE8S8A46kUqPhLS8LD2IBFSLtx+5p6oCc9trnsrcB1UOmlgU3ZHfN49JiH
         rVlQ==
X-Gm-Message-State: AOJu0YwwTK78LD2X2OCwnkrHY95fqIUWTaTkXe3JN/Fy4aXig0FkKO54
	oJlFSaWQKZsW0ogAD2f7JvwhnIlCEJY=
X-Google-Smtp-Source: AGHT+IHBN6t0jhuW16tvzWJMbA1thelqq1JkZNxaAmcO8xrBGxWQKZuWbB7lmKVGkcmoGzwdDBC0p73x1Zc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ad5c:0:b0:d7b:9830:c172 with SMTP id
 l28-20020a25ad5c000000b00d7b9830c172mr2934ybe.0.1694738035530; Thu, 14 Sep
 2023 17:33:55 -0700 (PDT)
Date: Thu, 14 Sep 2023 17:33:53 -0700
In-Reply-To: <diqzv8ccjqbd.fsf@ackerleytng-ctop.c.googlers.com>
Mime-Version: 1.0
References: <ZOO782YGRY0YMuPu@google.com> <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
 <ZQNN2AyDJ8dF0/6D@google.com> <diqzv8ccjqbd.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZQOmcc969s90DwNz@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, maz@kernel.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, liam.merwick@oracle.com, linux-mips@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 14, 2023, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Mon, Aug 28, 2023, Ackerley Tng wrote:
> >> Sean Christopherson <seanjc@google.com> writes:
> >> >> If we track struct kvm with the inode, then I think (a), (b) and (c) can
> >> >> be independent of the refcounting method. What do you think?
> >> >
> >> > No go.  Because again, the inode (physical memory) is coupled to the virtual machine
> >> > as a thing, not to a "struct kvm".  Or more concretely, the inode is coupled to an
> >> > ASID or an HKID, and there can be multiple "struct kvm" objects associated with a
> >> > single ASID.  And at some point in the future, I suspect we'll have multiple KVM
> >> > objects per HKID too.
> >> >
> >> > The current SEV use case is for the migration helper, where two KVM objects share
> >> > a single ASID (the "real" VM and the helper).  I suspect TDX will end up with
> >> > similar behavior where helper "VMs" can use the HKID of the "real" VM.  For KVM,
> >> > that means multiple struct kvm objects being associated with a single HKID.
> >> >
> >> > To prevent use-after-free, KVM "just" needs to ensure the helper instances can't
> >> > outlive the real instance, i.e. can't use the HKID/ASID after the owning virtual
> >> > machine has been destroyed.
> >> >
> >> > To put it differently, "struct kvm" is a KVM software construct that _usually_,
> >> > but not always, is associated 1:1 with a virtual machine.
> >> >
> >> > And FWIW, stashing the pointer without holding a reference would not be a complete
> >> > solution, because it couldn't guard against KVM reusing a pointer.  E.g. if a
> >> > struct kvm was unbound and then freed, KVM could reuse the same memory for a new
> >> > struct kvm, with a different ASID/HKID, and get a false negative on the rebinding
> >> > check.
> >> 
> >> I agree that inode (physical memory) is coupled to the virtual machine
> >> as a more generic concept.
> >> 
> >> I was hoping that in the absence of CC hardware providing a HKID/ASID,
> >> the struct kvm pointer could act as a representation of the "virtual
> >> machine". You're definitely right that KVM could reuse a pointer and so
> >> that idea doesn't stand.
> >> 
> >> I thought about generating UUIDs to represent "virtual machines" in the
> >> absence of CC hardware, and this UUID could be transferred during
> >> intra-host migration, but this still doesn't take host userspace out of
> >> the TCB. A malicious host VMM could just use the migration ioctl to copy
> >> the UUID to a malicious dumper VM, which would then pass checks with a
> >> gmem file linked to the malicious dumper VM. This is fine for HKID/ASIDs
> >> because the memory is encrypted; with UUIDs there's no memory
> >> encryption.
> >
> > I don't understand what problem you're trying to solve.  I don't see a need to
> > provide a single concrete representation/definition of a "virtual machine".  E.g.
> > there's no need for a formal definition to securely perform intrahost migration,
> > KVM just needs to ensure that the migration doesn't compromise guest security,
> > functionality, etc.
> >
> > That gets a lot more complex if the target KVM instance (module, not "struct kvm")
> > is a different KVM, e.g. when migrating to a different host.  Then there needs to
> > be a way to attest that the target is trusted and whatnot, but that still doesn't
> > require there to be a formal definition of a "virtual machine".
> >
> >> Circling back to the original topic, was associating the file with
> >> struct kvm at gmem file creation time meant to constrain the use of the
> >> gmem file to one struct kvm, or one virtual machine, or something else?
> >
> > It's meant to keep things as simple as possible (relatively speaking).  A 1:1
> > association between a KVM instance and a gmem instance means we don't have to
> > worry about the edge cases and oddities I pointed out earlier in this thread.
> >
> 
> I looked through this thread again and re-read the edge cases and
> oddities that was pointed out earlier (last paragraph at [1]) and I
> think I understand better, and I have just one last clarification.
> 
> It was previously mentioned that binding on creation time simplifies the
> lifecycle of memory:
> 
> "(a) prevent a different VM from *ever* binding to the gmem instance" [1]
> 
> Does this actually mean
> 
> "prevent a different struct kvm from *ever* binding to this gmem file"
> 
> ?

Yes.

> If so, then binding on creation
> 
> + Makes the gmem *file* (and just not the bindings xarray) the binding
>   between struct kvm and the file.

Yep.

> + Simplifies the KVM-userspace contract to "this gmem file can only be
>   used with this struct kvm"

Yep.

> Binding on creation doesn't offer any way to block the contents of the
> inode from being used with another "virtual machine" though, since we
> can have more than one gmem file pointing to the same inode, and the
> other gmem file is associated with another struct kvm. (And a strut kvm
> isn't associated 1:1 with a virtual machine [2])

Yep.

> The point about an inode needing to be coupled to a virtual machine as a
> thing [2] led me to try to find a single concrete representation of a
> "virtual machine".
> 
> Is locking inode contents to a "virtual machine" outside the scope of
> gmem?

Yes, because it's not gmem's responsibility to define "secure" (from a guest
perspective) or "safe" (from a platform stability and correctness perspective).

E.g. inserting additional vCPUs into the VM a la the SEV migration helper thing
is comically insecure without some way to attest the helper code.  Building policy
into the host kernel/KVM to do that attestation or otherwise determine what code
is/isn't safe for the guest to run is firmly out-of-scope.  KVM can certainly
provide the tools and help with enforcement, but the policy needs to be defined
elsewhere.  Even for something like pKVM, where KVM is in the TCB, KVM still doesn't
define who/what to trust (though KVM is heavily involved in enforcing security
stuff).

And for platform safety, e.g. not allowing two VMs to use the same HKID (ignoring
helpers for the moment), that's a KVM problem but NOT a gmem problem.  The point
I raised in link[2] about a gmem inode and thus the HKID/ASID associated with the
inode being bound to the "virtual machine" still holds true, but (a) it's not a
1:1 correlation, e.g. a VM could utilize multiple gmem inodes (all with the same
HKID/ASID), and (b) the safety and functional correctness aspects aren't unique
to gmem, e.g. even when when gmem isn't in the picture, KVM needs to make sure it
manages ASIDs correctly.  The only difference with SNP in the picture is that if
KVM screws up ASID management, bad things happen to the host, not (just) the guest.

>  If so, then it is fine to bind on creation time, use a VM ioctl
> over a system ioctl, and the method of refcounting in gmem v12 is okay.
> 
> [1] https://lore.kernel.org/lkml/ZNKv9ul2I7A4V7IF@google.com/
> [2] https://lore.kernel.org/lkml/ZOO782YGRY0YMuPu@google.com/
> 
> > <snip>
