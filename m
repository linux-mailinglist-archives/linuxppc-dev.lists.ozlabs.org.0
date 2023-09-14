Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F51D7A0C59
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 20:16:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QUWdmjVj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmlrw1Bgrz3cCT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 04:16:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QUWdmjVj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=32k0dzqykdlejvreatxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmlqy1Ytcz3cBd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 04:15:56 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-58f9db8bc1dso17820837b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 11:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694715354; x=1695320154; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NotwC0wYPH9Bmm+eHoPAvBDfUZeidJiPlRdc5f2ZPWA=;
        b=QUWdmjVjzmME630QllXZ/2HZlPTZjy385Pr3nRKorXh53ZFOPrL1UMGZYHR0IQEB8S
         7TEwAoIkhf15vJufrZLFIIfDXHALNoSNoV/emmCPGjTmOGOdL3Yd22I0Rl/J4F7vkelv
         G6TojlYVTtJiAUH3YbfdMgUlUittQPWIh75svItcydOG+i+h5J1b1yjpi0geBeGL5nA0
         PvPxV3bAlL/845Ps8kj2dq4SDOLM6i4KZ+VXya6gp/qMgWavIo5QtHy8lSGzqc85ppcg
         r3eSmfBiIMSvmYFYm2ghAFWUqXZenrizd4YsH1eUPnM52fIYiu0PXHAfMel9lD+D/xta
         giig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694715354; x=1695320154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NotwC0wYPH9Bmm+eHoPAvBDfUZeidJiPlRdc5f2ZPWA=;
        b=PUCjGyMyPP2wwoM3IkvXhYqh/TKisSr+Yj01iyzHdydFbPT6gmTLtnAndBGCzMVV+s
         srE34IpjUrBjzNz0UaPC/2T27bSIJbkzg/FvcbbkrZLr0IFnWxJUWhnePnF9UMsXqcAY
         omFtrlHI+uMsf4P0E9AthpAguTih8NmSNUgyUaMvMVUkHymzq9oR+fq+f8ZRH5i3jtYL
         cw32n9tRIofnPTty1JgWjtQMJw7pPtSwdRIuNtwnTJYjndUvyhBjQj5bCXpw5lrlCQmn
         8R4FW6i/JQ69s7dmHqHu+Uaag6ZWji4THfUCqg8N1dSHMqqIKTku0NUQHTrp011mOXL9
         ZK3g==
X-Gm-Message-State: AOJu0YwDn7S7Cj2EBdHz1oRtjzddTlkv5TOxoYE4CaXFZ6JXpvUauBrK
	DM2ZQpM6sPr/JbVvtCVgseIioaa1Mow=
X-Google-Smtp-Source: AGHT+IGPJqA/+ZACxXOUgdzWN4hGcwV50i6jcfcPa2GrWEQEeACHClOtxAN3Jr9h2WjxVFoJdPIyBK0jy04=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:3187:b0:59b:e81f:62b3 with SMTP id
 fd7-20020a05690c318700b0059be81f62b3mr91025ywb.10.1694715354294; Thu, 14 Sep
 2023 11:15:54 -0700 (PDT)
Date: Thu, 14 Sep 2023 11:15:52 -0700
In-Reply-To: <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
Mime-Version: 1.0
References: <ZOO782YGRY0YMuPu@google.com> <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZQNN2AyDJ8dF0/6D@google.com>
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

On Mon, Aug 28, 2023, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> >> If we track struct kvm with the inode, then I think (a), (b) and (c) can
> >> be independent of the refcounting method. What do you think?
> >
> > No go.  Because again, the inode (physical memory) is coupled to the virtual machine
> > as a thing, not to a "struct kvm".  Or more concretely, the inode is coupled to an
> > ASID or an HKID, and there can be multiple "struct kvm" objects associated with a
> > single ASID.  And at some point in the future, I suspect we'll have multiple KVM
> > objects per HKID too.
> >
> > The current SEV use case is for the migration helper, where two KVM objects share
> > a single ASID (the "real" VM and the helper).  I suspect TDX will end up with
> > similar behavior where helper "VMs" can use the HKID of the "real" VM.  For KVM,
> > that means multiple struct kvm objects being associated with a single HKID.
> >
> > To prevent use-after-free, KVM "just" needs to ensure the helper instances can't
> > outlive the real instance, i.e. can't use the HKID/ASID after the owning virtual
> > machine has been destroyed.
> >
> > To put it differently, "struct kvm" is a KVM software construct that _usually_,
> > but not always, is associated 1:1 with a virtual machine.
> >
> > And FWIW, stashing the pointer without holding a reference would not be a complete
> > solution, because it couldn't guard against KVM reusing a pointer.  E.g. if a
> > struct kvm was unbound and then freed, KVM could reuse the same memory for a new
> > struct kvm, with a different ASID/HKID, and get a false negative on the rebinding
> > check.
> 
> I agree that inode (physical memory) is coupled to the virtual machine
> as a more generic concept.
> 
> I was hoping that in the absence of CC hardware providing a HKID/ASID,
> the struct kvm pointer could act as a representation of the "virtual
> machine". You're definitely right that KVM could reuse a pointer and so
> that idea doesn't stand.
> 
> I thought about generating UUIDs to represent "virtual machines" in the
> absence of CC hardware, and this UUID could be transferred during
> intra-host migration, but this still doesn't take host userspace out of
> the TCB. A malicious host VMM could just use the migration ioctl to copy
> the UUID to a malicious dumper VM, which would then pass checks with a
> gmem file linked to the malicious dumper VM. This is fine for HKID/ASIDs
> because the memory is encrypted; with UUIDs there's no memory
> encryption.

I don't understand what problem you're trying to solve.  I don't see a need to
provide a single concrete representation/definition of a "virtual machine".  E.g.
there's no need for a formal definition to securely perform intrahost migration,
KVM just needs to ensure that the migration doesn't compromise guest security,
functionality, etc.

That gets a lot more complex if the target KVM instance (module, not "struct kvm")
is a different KVM, e.g. when migrating to a different host.  Then there needs to
be a way to attest that the target is trusted and whatnot, but that still doesn't
require there to be a formal definition of a "virtual machine".

> Circling back to the original topic, was associating the file with
> struct kvm at gmem file creation time meant to constrain the use of the
> gmem file to one struct kvm, or one virtual machine, or something else?

It's meant to keep things as simple as possible (relatively speaking).  A 1:1
association between a KVM instance and a gmem instance means we don't have to
worry about the edge cases and oddities I pointed out earlier in this thread.

> Follow up questions:
> 
> 1. Since the physical memory's representation is the inode and should be
>    coupled to the virtual machine (as a concept, not struct kvm), should
>    the binding/coupling be with the file, or the inode?

Both.  The @kvm instance is bound to a file, because the file is that @kvm's view
of the underlying memory, e.g. effectively provides the translation of guest
addresses to host memory.  The @kvm instance is indirectly bound to the inode
because the file is bound to the inode.

> 2. Should struct kvm still be bound to the file/inode at gmem file
>    creation time, since

Yes.

>    + struct kvm isn't a good representation of a "virtual machine"

I don't see how this is relevant, because as above, I don't see why we need a
canonical represenation of a virtual machine.

>    + we currently don't have anything that really represents a "virtual
>      machine" without hardware support

HKIDs and ASIDs don't provide a "virtual machine" representation either.  E.g. if
a TDX guest is live migrated to a different host, it will likely have a different
HKID, and definitely have a different encryption key, but it's still the same
virtual machine.

> I'd also like to bring up another userspace use case that Google has:
> re-use of gmem files for rebooting guests when the KVM instance is
> destroyed and rebuilt.
>
> When rebooting a VM there are some steps relating to gmem that are
> performance-sensitive:

If we (Google) really cared about performance, then we shouldn't destroy and recreate
the VM in the first place.  E.g. the cost of zapping, freeing, re-allocating and
re-populating SPTEs is far from trivial.  Pulling RESET shouldn't change what
memory that is assigned to a VM, and reseting stats is downright bizarre IMO.

In other words, I think Google's approach of destroying the VM to emulate a reboot
is asinine.  I'm not totally against extending KVM's uAPI to play nice with such
an approach, but I'm not exactly sympathetic either.

> a.      Zeroing pages from the old VM when we close a gmem file/inode
> b. Deallocating pages from the old VM when we close a gmem file/inode
> c.   Allocating pages for the new VM from the new gmem file/inode
> d.      Zeroing pages on page allocation
> 
> We want to reuse the gmem file to save re-allocating pages (b. and c.),
> and one of the two page zeroing allocations (a. or d.).
> 
> Binding the gmem file to a struct kvm on creation time means the gmem
> file can't be reused with another VM on reboot.

Not without KVM's assistance, which userspace will need for TDX and SNP VMs no
matter what, e.g. to ensure the new and old KVM instance get the same HKID/ASID.
And we've already mapped out the more complex case of intrahost migration, so I
don't expect this to be at all challenging to implement.

> Also, host userspace is forced to close the gmem file to allow the old VM to
> be freed.

Yes, but that can happen after the "new" VM has instantiated its file/view of
guest memory.

> For other places where files pin KVM, like the stats fd pinning vCPUs, I
> guess that matters less since there isn't much of a penalty to close and
> re-open the stats fd.
