Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EE27DF457
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 14:53:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=iYuIM0Y7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLlht4N7Vz3cbQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 00:53:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=iYuIM0Y7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLlh215vcz3cQD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 00:53:04 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-66d0ea3e5b8so5837826d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 06:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698933181; x=1699537981; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MiH+OD80Lz6N2WkoQWVzzSH5wdFrVwABmyWNvMjndg=;
        b=iYuIM0Y7l5sU8uXFetoWgExToEOQEUiUHbWVpxk+Cxe4QjOPSUzRc+yPmrVhOs0k15
         Ycijk6VaxHKBZWiej7Xv9vSY/oizb929qI8j1alRNQ2E24j5XSdt9Qm28xNTnmtRD+85
         9B6ZBmDknN0IXNTZiUdfnxkhGtutAJbD4Ssh1lwxG+SzoJvjC21tci5J4Ugr0VE2LHw0
         N4WKcUpgCFw/3m+xvKW9F4SNxnt6kGGdsKpGdDoaQcNki/kSyS0wv3N81EA+9/V5veY3
         htltNSYuPraXcm27YYtx3UrTDIQZBpmwJJXMxy8rGs5bnhv/aix0gw5piZG8UHvsqlDd
         K3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933181; x=1699537981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MiH+OD80Lz6N2WkoQWVzzSH5wdFrVwABmyWNvMjndg=;
        b=WgIfllARwgSbC426ljCiZXtzC+rF6zvU1DIw69k8fb1LXXMshqaoONL3/wtawbnQ4f
         p4Lp2hCIeSjaYLg3RHVJRFgKDYses/76qBKqPu27EcPEK4p9M9F5u/aXuDbx7Ccej19W
         pHY1dd9pQc2s2Imzw9wDUsq9wo6IAodLAde7jaAqmdvLbG1S+hMAlpuOwqJWWIH5krCn
         3iLXcmrqEGladlPPfs0hERvDWfK6FRm/iZK5EgQJrmfGcKNe0swKw9+iay8+K6SoKWOF
         99vNJxMK7GL+eC4kxqwYh5dYYqbaSRiPSXNC/abaAdzNm8WK2Q+RcPtqkAvBZVqByB5p
         Vj4A==
X-Gm-Message-State: AOJu0YxIZijDuRxzDChoYY2pzaucN5MSwREjXVXia35XGG+BSNiK1RfS
	F+YmmC1YjpWdCKh3M3/rbH4SZEqjfYo9Bvy0FGGGiw==
X-Google-Smtp-Source: AGHT+IHABEQi7q2gF4GYbu+6KWyVOhp4LTc7vcuWRR/ds6omy7P2Nr93O+4ItCwG4g8ZUZhgbGUZVOPe8u3aj0mVGQs=
X-Received: by 2002:ad4:5761:0:b0:672:4e8c:9aa5 with SMTP id
 r1-20020ad45761000000b006724e8c9aa5mr14682447qvx.47.1698933180583; Thu, 02
 Nov 2023 06:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <CA+EHjTzj4drYKONVOLP19DYpJ4O8kSXcFzw2AKier1QdcFKx_Q@mail.gmail.com>
 <ZUF8A5KpwpA6IKUH@google.com> <CA+EHjTwTT9cFzYTtwT43nLJS01Sgt0NqzUgKAnfo2fiV3tEvXg@mail.gmail.com>
 <ZULJYg5cf1UrNq3e@google.com>
In-Reply-To: <ZULJYg5cf1UrNq3e@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 2 Nov 2023 13:52:23 +0000
Message-ID: <CA+EHjTzGzXnfXHh0m5iHt9m3BxerkUS56EVPDA_az6n2FRnk3w@mail.gmail.com>
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

On Wed, Nov 1, 2023 at 9:55=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Wed, Nov 01, 2023, Fuad Tabba wrote:
> > > > > @@ -1034,6 +1034,9 @@ static void kvm_destroy_dirty_bitmap(struct=
 kvm_memory_slot *memslot)
> > > > >  /* This does not remove the slot from struct kvm_memslots data s=
tructures */
> > > > >  static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_=
slot *slot)
> > > > >  {
> > > > > +       if (slot->flags & KVM_MEM_PRIVATE)
> > > > > +               kvm_gmem_unbind(slot);
> > > > > +
> > > >
> > > > Should this be called after kvm_arch_free_memslot()? Arch-specific =
ode
> > > > might need some of the data before the unbinding, something I thoug=
ht
> > > > might be necessary at one point for the pKVM port when deleting a
> > > > memslot, but realized later that kvm_invalidate_memslot() ->
> > > > kvm_arch_guest_memory_reclaimed() was the more logical place for it=
.
> > > > Also, since that seems to be the pattern for arch-specific handlers=
 in
> > > > KVM.
> > >
> > > Maybe?  But only if we can about symmetry between the allocation and =
free paths
> > > I really don't think kvm_arch_free_memslot() should be doing anything=
 beyond a
> > > "pure" free.  E.g. kvm_arch_free_memslot() is also called after movin=
g a memslot,
> > > which hopefully we never actually have to allow for guest_memfd, but =
any code in
> > > kvm_arch_free_memslot() would bring about "what if" questions regardi=
ng memslot
> > > movement.  I.e. the API is intended to be a "free arch metadata assoc=
iated with
> > > the memslot".
> > >
> > > Out of curiosity, what does pKVM need to do at kvm_arch_guest_memory_=
reclaimed()?
> >
> > It's about the host reclaiming ownership of guest memory when tearing
> > down a protected guest. In pKVM, we currently teardown the guest and
> > reclaim its memory when kvm_arch_destroy_vm() is called. The problem
> > with guestmem is that kvm_gmem_unbind() could get called before that
> > happens, after which the host might try to access the unbound guest
> > memory. Since the host hasn't reclaimed ownership of the guest memory
> > from hyp, hilarity ensues (it crashes).
> >
> > Initially, I hooked reclaim guest memory to kvm_free_memslot(), but
> > then I needed to move the unbind later in the function. I realized
> > later that kvm_arch_guest_memory_reclaimed() gets called earlier (at
> > the right time), and is more aptly named.
>
> Aha!  I suspected that might be the case.
>
> TDX and SNP also need to solve the same problem of "reclaiming" memory be=
fore it
> can be safely accessed by the host.  The plan is to add an arch hook (or =
two?)
> into guest_memfd that is invoked when memory is freed from guest_memfd.
>
> Hooking kvm_arch_guest_memory_reclaimed() isn't completely correct as del=
eting a
> memslot doesn't *guarantee* that guest memory is actually reclaimed (whic=
h reminds
> me, we need to figure out a better name for that thing before introducing
> kvm_arch_gmem_invalidate()).

I see. I'd assumed that that was what you're using. I agree that it's
not completely correct, so for the moment, I assume that if that
happens we have a misbehaving host, teardown the guest and reclaim its
memory.

> The effective false positives aren't fatal for the current usage because =
the hook
> is used only for x86 SEV guests to flush caches.  An unnecessary flush ca=
n cause
> performance issues, but it doesn't affect correctness. For TDX and SNP, a=
nd IIUC
> pKVM, false positives are fatal because KVM could assign memory back to t=
he host
> that is still owned by guest_memfd.

Yup.

> E.g. a misbehaving userspace could prematurely delete a memslot.  And the=
 more
> fun example is intrahost migration, where the plan is to allow pointing m=
ultiple
> guest_memfd files at a single guest_memfd inode:
> https://lore.kernel.org/all/cover.1691446946.git.ackerleytng@google.com
>
> There was a lot of discussion for this, but it's scattered all over the p=
lace.
> The TL;DR is is that the inode will represent physical memory, and a file=
 will
> represent a given "struct kvm" instance's view of that memory.  And so th=
e memory
> isn't reclaimed until the inode is truncated/punched.
>
> I _think_ this reflects the most recent plan from the guest_memfd side:
> https://lore.kernel.org/all/1233d749211c08d51f9ca5d427938d47f008af1f.1689=
893403.git.isaku.yamahata@intel.com

Thanks for pointing that out. I think this might be the way to go.
I'll have a closer look at this and see how to get it to work with
pKVM.

Cheers,
/fuad
