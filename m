Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA127830F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 21:34:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=qpKSqx5I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV2j45CmYz3c1W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 05:34:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=qpKSqx5I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=39lvjzaykdckxjfsohlttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV2hB0FlHz30BZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 05:33:11 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-26ecc4795a4so2336356a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 12:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692646389; x=1693251189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lTUf23UWw1SkKKJ2TYgJ195zKcBZk+aHzDWYw0jOr4Q=;
        b=qpKSqx5ICliXSxPjZu0tOZy7xlqIAe6qVNImHFeHE99jDfjJ0rkalTo5f1yiylL8Zp
         zW/oM/ylnbuxciYR4prkKI8mJaHp2WuQufXKGB2RG8EjyX49+7sODEpJkoODIpJFN+WQ
         d92P7dg0Kdt0AwxXyEzQoriMz6/KeQrNijacO4IuCJVKS1YJTlTz834blo5E9EKqcgWL
         PEM2JeCl6oJE3F68JjqgLe5PECwZdFSwKXlISOg41aNDBtfUtUCqAE2x2tOPTF0xf31f
         3SefiEREMJ5D9AnExP5D9BLT2XJ6ZGgC24sHacNuUQH7uTJzB0bBXanlC1qACw6pUjbt
         /CMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692646389; x=1693251189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lTUf23UWw1SkKKJ2TYgJ195zKcBZk+aHzDWYw0jOr4Q=;
        b=XPNdw13jUn4wzy8UXC4xGU6R4nFITguHhPrDZ5B7tQm4g2K0DRrm0c+FWq0i3PPfNN
         gk2IhecBJAgRVhRPlyql5xNQMYtlSYjKQAhhgtiwiumFsMmskRkumA30o8sqJIbF3XhA
         B5a9AnYe2pjQrbya0G39ALHMfkborwD3SCVzJRjaWkOaOf/lZnfTvFXQ4M4dBc1bFhYs
         shp9bNxw8Pi7WKXVlBipVhAijLSK7sGYkFMd47NaAOqk9U55cnml7bAnWb3RZYr4Alsq
         l2uaXOK1MLaXGqTsqZ6mrmIcncp9FfwuRhxYNn273l//f3zNR2CoVdGT3svIPdgL7iOO
         /Rvg==
X-Gm-Message-State: AOJu0YyU5Zuhk4h9vP8BpYklfk51k65pGNKSwZ5keSG7HPtShdQItu+k
	Q3+0Tnh8h3I8EqhTklTD85Ro5fByWJY=
X-Google-Smtp-Source: AGHT+IHapYFA1E8erMKTCUk5o1Pg5iPJ1NuCQ0fs2o2CFjrEymp3AKNMxkfs6EIdF0eDdCPrJxgkHXuIM1g=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:d90b:b0:26d:1212:7924 with SMTP id
 c11-20020a17090ad90b00b0026d12127924mr1918689pjv.4.1692646388708; Mon, 21 Aug
 2023 12:33:08 -0700 (PDT)
Date: Mon, 21 Aug 2023 12:33:07 -0700
In-Reply-To: <diqzzg2ktiao.fsf@ackerleytng-ctop.c.googlers.com>
Mime-Version: 1.0
References: <ZNvaJ3igvcvTZ/8k@google.com> <diqzzg2ktiao.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZOO782YGRY0YMuPu@google.com>
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

On Mon, Aug 21, 2023, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Tue, Aug 15, 2023, Ackerley Tng wrote:
> >> Sean Christopherson <seanjc@google.com> writes:
> >> > Nullifying the KVM pointer isn't sufficient, because without additional actions
> >> > userspace could extract data from a VM by deleting its memslots and then binding
> >> > the guest_memfd to an attacker controlled VM.  Or more likely with TDX and SNP,
> >> > induce badness by coercing KVM into mapping memory into a guest with the wrong
> >> > ASID/HKID.
> >> >
> >> > I can think of three ways to handle that:
> >> >
> >> >   (a) prevent a different VM from *ever* binding to the gmem instance
> >> >   (b) free/zero physical pages when unbinding
> >> >   (c) free/zero when binding to a different VM
> >> >
> >> > Option (a) is easy, but that pretty much defeats the purpose of decopuling
> >> > guest_memfd from a VM.
> >> >
> >> > Option (b) isn't hard to implement, but it screws up the lifecycle of the memory,
> >> > e.g. would require memory when a memslot is deleted.  That isn't necessarily a
> >> > deal-breaker, but it runs counter to how KVM memlots currently operate.  Memslots
> >> > are basically just weird page tables, e.g. deleting a memslot doesn't have any
> >> > impact on the underlying data in memory.  TDX throws a wrench in this as removing
> >> > a page from the Secure EPT is effectively destructive to the data (can't be mapped
> >> > back in to the VM without zeroing the data), but IMO that's an oddity with TDX and
> >> > not necessarily something we want to carry over to other VM types.
> >> >
> >> > There would also be performance implications (probably a non-issue in practice),
> >> > and weirdness if/when we get to sharing, linking and/or mmap()ing gmem.  E.g. what
> >> > should happen if the last memslot (binding) is deleted, but there outstanding userspace
> >> > mappings?
> >> >
> >> > Option (c) is better from a lifecycle perspective, but it adds its own flavor of
> >> > complexity, e.g. the performant way to reclaim TDX memory requires the TDMR
> >> > (effectively the VM pointer), and so a deferred relcaim doesn't really work for
> >> > TDX.  And I'm pretty sure it *can't* work for SNP, because RMP entries must not
> >> > outlive the VM; KVM can't reuse an ASID if there are pages assigned to that ASID
> >> > in the RMP, i.e. until all memory belonging to the VM has been fully freed.

...

> I agree with you that nulling the KVM pointer is insufficient to keep
> host userspace out of the TCB. Among the three options (a) preventing a
> different VM (HKID/ASID) from binding to the gmem instance, or zeroing
> the memory either (b) on unbinding, or (c) on binding to another VM
> (HKID/ASID),
> 
> (a) sounds like adding a check issued to TDX/SNP upon binding and this
>     check would just return OK for software-protected VMs (line of sight
>     to removing host userspace from TCB).
> 
> Or, we could go further for software-protected VMs and add tracking in
> the inode to prevent the same inode from being bound to different
> "HKID/ASID"s, perhaps like this:
> 
> + On first binding, store the KVM pointer in the inode - not file (but
>   not hold a refcount)
> + On rebinding, check that the KVM matches the pointer in the inode
> + On intra-host migration, update the KVM pointer in the inode to allow
>   binding to the new struct kvm
> 
> I think you meant associating the file with a struct kvm at creation
> time as an implementation for (a), but technically since the inode is
> the representation of memory, tracking of struct kvm should be with the
> inode instead of the file.
> 
> (b) You're right that this messes up the lifecycle of the memory and
>     wouldn't work with intra-host migration.
> 
> (c) sounds like doing the clearing on a check similar to that of (a)

Sort of, though it's much nastier, because it requires the "old" KVM instance to
be alive enough to support various operations.  I.e. we'd have to make stronger
guarantees about exactly when the handoff/transition could happen.

> If we track struct kvm with the inode, then I think (a), (b) and (c) can
> be independent of the refcounting method. What do you think?

No go.  Because again, the inode (physical memory) is coupled to the virtual machine
as a thing, not to a "struct kvm".  Or more concretely, the inode is coupled to an
ASID or an HKID, and there can be multiple "struct kvm" objects associated with a
single ASID.  And at some point in the future, I suspect we'll have multiple KVM
objects per HKID too.

The current SEV use case is for the migration helper, where two KVM objects share
a single ASID (the "real" VM and the helper).  I suspect TDX will end up with
similar behavior where helper "VMs" can use the HKID of the "real" VM.  For KVM,
that means multiple struct kvm objects being associated with a single HKID.

To prevent use-after-free, KVM "just" needs to ensure the helper instances can't
outlive the real instance, i.e. can't use the HKID/ASID after the owning virtual
machine has been destroyed.

To put it differently, "struct kvm" is a KVM software construct that _usually_,
but not always, is associated 1:1 with a virtual machine.

And FWIW, stashing the pointer without holding a reference would not be a complete
solution, because it couldn't guard against KVM reusing a pointer.  E.g. if a
struct kvm was unbound and then freed, KVM could reuse the same memory for a new
struct kvm, with a different ASID/HKID, and get a false negative on the rebinding
check.
