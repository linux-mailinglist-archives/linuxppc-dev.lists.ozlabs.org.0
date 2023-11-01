Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A6F7DDFF3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 11:56:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=enupJPD7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3pM4xkFz3d8T
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 21:56:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=enupJPD7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3jp26fRz3cbB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 21:52:13 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-66d17bdabe1so45038736d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Nov 2023 03:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698835928; x=1699440728; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1C51gwP1j6EX8xWamHNo0Nti+w4//VV3v7LQeJatAc=;
        b=enupJPD7QN+q2aqATSYrKOUxp2DigEOjJL/CAYxm1K4UOCE9GqSg6ATS8dlOxpu8hv
         H4lYvm0fZzmuJXG3lzoZ8WTHm7C3TZMUL+i22q58h8AP1ZR90RIze7dDnr9qLRL52+wp
         AM6xF0xZCzFZS0cXMKCusKZYtw4jY99URydPMxiHdAcD0J0igyPigtacAOUE42GRAkJE
         klzo2dqfsqxoVFJMeMxeS+b+wGkfqUH6gcZLhgmoe7Vo5z15eIuHLL7sS1XuMsehApvv
         lT/aj12hQpYervoOC9A/rtrPOBcwxPbT0oSk3rJh/nDm6OaMLc75m26voQD8vR4eDQQI
         sPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698835928; x=1699440728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1C51gwP1j6EX8xWamHNo0Nti+w4//VV3v7LQeJatAc=;
        b=wdxiYTNqxuuoms87f+PaUHKpZ96Jy0FyIPSuPgBOr+o71eqAEJdqibYQUrUY2VGcTf
         c/wTY6sviaZvFftSOB8rNbs/GkzvbZMA6O5DT9IqBB70thzL3sURhiHoGmeR/Ys+JqrC
         uAyWVKQd/cBNWxxRV0e/sP6mOEffQ7Xv8JW1nsm0z7F2IhtPc2tDBJjA80i7fJY01yTN
         1qI5cHqDmPpM06rdvUW9CsrGjpJbIIOR6N+Jcw2ihVSjb2j00C1pehyJI2w/dHg3/Iwb
         PYVXo6/N0WmQC9G/SxQ7/RLA//JWOhBXmvsWK1nesyA92V82s5qu2zKWlvKSj310FA5Z
         jqfA==
X-Gm-Message-State: AOJu0YzpKdhhuGThboTy3bUwg/SHTx6E8P7gYMo+3+Kqnosb0OVIHX9c
	WB0bjahWN9hYRMN+sAR/ysH8dOBO3XZ6BmTPRMWWiQ==
X-Google-Smtp-Source: AGHT+IGBD7AeuMGXkTRP2ep4CYUi9124TDOVpS389Mu+hB31XqL4gTKvstmlOGh29as6609/Xh60qBUoSzB28pjDL10=
X-Received: by 2002:a0c:d64a:0:b0:675:5111:4cec with SMTP id
 e10-20020a0cd64a000000b0067551114cecmr114725qvj.58.1698835928102; Wed, 01 Nov
 2023 03:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <CA+EHjTzj4drYKONVOLP19DYpJ4O8kSXcFzw2AKier1QdcFKx_Q@mail.gmail.com> <ZUF8A5KpwpA6IKUH@google.com>
In-Reply-To: <ZUF8A5KpwpA6IKUH@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 1 Nov 2023 10:51:31 +0000
Message-ID: <CA+EHjTwTT9cFzYTtwT43nLJS01Sgt0NqzUgKAnfo2fiV3tEvXg@mail.gmail.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracl
 e.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sean,

On Tue, Oct 31, 2023 at 10:13=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Tue, Oct 31, 2023, Fuad Tabba wrote:
> > Hi,
> >
> > On Fri, Oct 27, 2023 at 7:23=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> >
> > ...
> >
> > > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/=
api.rst
> > > index e2252c748fd6..e82c69d5e755 100644
> > > --- a/Documentation/virt/kvm/api.rst
> > > +++ b/Documentation/virt/kvm/api.rst
> > > @@ -6079,6 +6079,15 @@ applied.
> > >  :Parameters: struct kvm_userspace_memory_region2 (in)
> > >  :Returns: 0 on success, -1 on error
> > >
> > > +KVM_SET_USER_MEMORY_REGION2 is an extension to KVM_SET_USER_MEMORY_R=
EGION that
> > > +allows mapping guest_memfd memory into a guest.  All fields shared w=
ith
> > > +KVM_SET_USER_MEMORY_REGION identically.  Userspace can set KVM_MEM_P=
RIVATE in
> > > +flags to have KVM bind the memory region to a given guest_memfd rang=
e of
> > > +[guest_memfd_offset, guest_memfd_offset + memory_size].  The target =
guest_memfd
> > > +must point at a file created via KVM_CREATE_GUEST_MEMFD on the curre=
nt VM, and
> > > +the target range must not be bound to any other memory region.  All =
standard
> > > +bounds checks apply (use common sense).
> > > +
> >
> > Bikeshedding here: Not sure if KVM_MEM_PRIVATE is the best name for
> > this. It gets confusing with KVM_MEMORY_ATTRIBUTE_PRIVATE, i.e., that
> > a region marked as KVM_MEM_PRIVATE is only potentially private. It did
> > confuse the rest of the team when I walked them through a previous
> > version of this code once. Would something like KVM_MEM_GUESTMEM make
> > more sense?
>
> Heh, deja vu.  We discussed this back in v7[*], and I came to the conclus=
ion that
> choosing a name that wasn't explicitly tied to private memory wasn't just=
ified.
> But that was before a KVM-owned guest_memfd was even an idea, and thus be=
fore we
> had anything close to a real use case.
>
> Since we now know that at least pKVM will use guest_memfd for shared memo=
ry, and
> odds are quite good that "regular" VMs will also do the same, i.e. will w=
ant
> guest_memfd with the concept of private memory, I agree that we should av=
oid
> PRIVATE.
>
> Though I vote for KVM_MEM_GUEST_MEMFD (or KVM_MEM_GUEST_MEMFD_VALID or
> KVM_MEM_USE_GUEST_MEMFD).  I.e. do our best to avoid ambiguity between re=
ferring
> to "guest memory" at-large and guest_memfd.

Yeah I remember that discussion, but I didn't realize how confusing it
was until I was presenting my work so far to the rest of the team, and
it confused them quite a bit. I'm happy with any of the other
alternatives that you suggest, as long as the distinction is clear.

> > > -See KVM_SET_USER_MEMORY_REGION.
> > > +A KVM_MEM_PRIVATE region _must_ have a valid guest_memfd (private me=
mory) and
> > > +userspace_addr (shared memory).  However, "valid" for userspace_addr=
 simply
> > > +means that the address itself must be a legal userspace address.  Th=
e backing
> > > +mapping for userspace_addr is not required to be valid/populated at =
the time of
> > > +KVM_SET_USER_MEMORY_REGION2, e.g. shared memory can be lazily mapped=
/allocated
> > > +on-demand.
> >
> > Regarding requiring that a private region have both a valid
> > guest_memfd and a userspace_addr, should this be
> > implementation-specific? In pKVM at least, all regions for protected
> > VMs are private, and KVM doesn't care about the host userspace address
> > for those regions even when part of the memory is shared.
>
> Hmm, as of this patch, no, because the pKVM usage doesn't exist.  E.g.
>
> .  Because this literally documents the current ABI.  When

Ack.

> > > +When mapping a gfn into the guest, KVM selects shared vs. private, i=
.e consumes
> > > +userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIB=
UTE_PRIVATE
> > > +state.  At VM creation time, all memory is shared, i.e. the PRIVATE =
attribute
> > > +is '0' for all gfns.  Userspace can control whether memory is shared=
/private by
> > > +toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES =
as needed.
> >
> > In pKVM, guest memory is private by default, and most of it will
> > remain so for the lifetime of the VM. Userspace could explicitly mark
> > all the guest's memory as private at initialization, but it would save
> > a slight amount of work. That said, I understand that it might be
> > better to be consistent across implementations.
>
> Yeah, we discussed this in v12[*].  The default really doesn't matter for=
 memory
> overheads or performances once supports range-based xarray entries, and i=
f that
> isn't sufficient, KVM can internally invert the polarity of PRIVATE.
>
> But for the ABI, I think we put a stake in the ground and say that all me=
mory is
> shared by default.  That way CoCo VMs and regular VMs (i.e VMs without th=
e concept
> of private memory) all have the same ABI.  Practically speaking, the cost=
 to pKVM
> (and likely every other CoCo VM type) is a single ioctl() during VM creat=
ion to
> "convert" all memory to private.
>
> [*] https://lore.kernel.org/all/ZRw6X2BptZnRPNK7@google.com

Ack.

...

> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index 78a0b09ef2a5..5d1a2f1b4e94 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -798,7 +798,7 @@ void kvm_mmu_invalidate_range_add(struct kvm *kvm=
, gfn_t start, gfn_t end)
> > >         }
> > >  }
> > >
> > > -static bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_=
range *range)
> > > +bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *=
range)
> > >  {
> > >         kvm_mmu_invalidate_range_add(kvm, range->start, range->end);
> > >         return kvm_unmap_gfn_range(kvm, range);
> > > @@ -1034,6 +1034,9 @@ static void kvm_destroy_dirty_bitmap(struct kvm=
_memory_slot *memslot)
> > >  /* This does not remove the slot from struct kvm_memslots data struc=
tures */
> > >  static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot=
 *slot)
> > >  {
> > > +       if (slot->flags & KVM_MEM_PRIVATE)
> > > +               kvm_gmem_unbind(slot);
> > > +
> >
> > Should this be called after kvm_arch_free_memslot()? Arch-specific ode
> > might need some of the data before the unbinding, something I thought
> > might be necessary at one point for the pKVM port when deleting a
> > memslot, but realized later that kvm_invalidate_memslot() ->
> > kvm_arch_guest_memory_reclaimed() was the more logical place for it.
> > Also, since that seems to be the pattern for arch-specific handlers in
> > KVM.
>
> Maybe?  But only if we can about symmetry between the allocation and free=
 paths
> I really don't think kvm_arch_free_memslot() should be doing anything bey=
ond a
> "pure" free.  E.g. kvm_arch_free_memslot() is also called after moving a =
memslot,
> which hopefully we never actually have to allow for guest_memfd, but any =
code in
> kvm_arch_free_memslot() would bring about "what if" questions regarding m=
emslot
> movement.  I.e. the API is intended to be a "free arch metadata associate=
d with
> the memslot".
>
> Out of curiosity, what does pKVM need to do at kvm_arch_guest_memory_recl=
aimed()?

It's about the host reclaiming ownership of guest memory when tearing
down a protected guest. In pKVM, we currently teardown the guest and
reclaim its memory when kvm_arch_destroy_vm() is called. The problem
with guestmem is that kvm_gmem_unbind() could get called before that
happens, after which the host might try to access the unbound guest
memory. Since the host hasn't reclaimed ownership of the guest memory
from hyp, hilarity ensues (it crashes).

Initially, I hooked reclaim guest memory to kvm_free_memslot(), but
then I needed to move the unbind later in the function. I realized
later that kvm_arch_guest_memory_reclaimed() gets called earlier (at
the right time), and is more aptly named.

Thanks,
/fuad
