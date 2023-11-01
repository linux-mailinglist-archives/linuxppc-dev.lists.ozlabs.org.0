Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D597DE7BC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 22:56:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ig0q777y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLLSP0LNyz2ykC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 08:56:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ig0q777y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3zmlczqykddmhtpcyrvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLLRY42Fjz2xPb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Nov 2023 08:55:51 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da04fb79246so290033276.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Nov 2023 14:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698875748; x=1699480548; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PcqXHpLnYUoCfOstmB/gusaSnz1wSaaIZvticgi9YrM=;
        b=ig0q777ypHYle7BsYh1IBx32A3XxOrL6cxNpe4M2GF4AemUdQJRs6+/g4qiRoaHRK4
         7Xj8hV4d4MipHiACmp07gJ90L5mNLFuxyiKyXTX5mkMaQV8p9boSqeuOxBFDW25iZ+Lu
         ea4WBVD3/Jk/QYsvfnCJ1t6ovuIJi4U21lxs7SvYMz3bGrgiEF8I+eRv/wIiYJBr2AXV
         Et0CKt/A4SJKIsQwkeQnSTWMXuvajZFWK3uDCQYPxtT4nxRTQU7GjHmUra/vNrPYntFz
         wPJqw4+9OOhZIpdue8ggyj9ID5Vtxadkbr77YuT3eJqeuf47ubA8mJPtZOZeImtWExJ4
         pZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698875748; x=1699480548;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PcqXHpLnYUoCfOstmB/gusaSnz1wSaaIZvticgi9YrM=;
        b=MqQKARBI//vYFXmyNdEBh3PQsUJ+MmtoJahqpGZipSFyIsqDguy+JblnWh6FLkTRw1
         g1oKTJFTeAzizqID3BWgAotoCpmi//FqC3G+NREBELMIH0YqDP5HoPr4t7Jg+zb3+l2n
         u8F+X26r1GQS+kHTG/PNga23XxqD9yl/lrnhzx2YcJ9jZ9WrI3K2GNRczVDB81R+qZxy
         oqGWtWpumXiAyCqizwwLlRfS/avzz/Pt5qz+B0Wm1L8s7P4GfXkyGwyHRUYoqyNjJ5Ky
         PiAPgEVEJC+7q4E8yhkwn8i+3LRVFUYAH5yk7lKAeqYyikMsumrM3OxxGqQXx9/sUKP8
         DZ1Q==
X-Gm-Message-State: AOJu0Yw93ySjJhMlGnlIzjDk7pwwvq2XuX/FkgsGpJq1SKv+KgXfyeNG
	t7XE6jQHwyO0MyK34nJWNzYcaIAeZQg=
X-Google-Smtp-Source: AGHT+IE2sMY2tsOG0bVHgm+pvNoyezNqlGkOo8OmSBoeRdI+YDBZP5bgBr5ffHZ4bVc102IwBIrDYpGpUa8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1083:b0:d9a:c3b8:4274 with SMTP id
 v3-20020a056902108300b00d9ac3b84274mr405001ybu.7.1698875748263; Wed, 01 Nov
 2023 14:55:48 -0700 (PDT)
Date: Wed, 1 Nov 2023 14:55:46 -0700
In-Reply-To: <CA+EHjTwTT9cFzYTtwT43nLJS01Sgt0NqzUgKAnfo2fiV3tEvXg@mail.gmail.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <CA+EHjTzj4drYKONVOLP19DYpJ4O8kSXcFzw2AKier1QdcFKx_Q@mail.gmail.com>
 <ZUF8A5KpwpA6IKUH@google.com> <CA+EHjTwTT9cFzYTtwT43nLJS01Sgt0NqzUgKAnfo2fiV3tEvXg@mail.gmail.com>
Message-ID: <ZULJYg5cf1UrNq3e@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracl
 e.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 01, 2023, Fuad Tabba wrote:
> > > > @@ -1034,6 +1034,9 @@ static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
> > > >  /* This does not remove the slot from struct kvm_memslots data structures */
> > > >  static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
> > > >  {
> > > > +       if (slot->flags & KVM_MEM_PRIVATE)
> > > > +               kvm_gmem_unbind(slot);
> > > > +
> > >
> > > Should this be called after kvm_arch_free_memslot()? Arch-specific ode
> > > might need some of the data before the unbinding, something I thought
> > > might be necessary at one point for the pKVM port when deleting a
> > > memslot, but realized later that kvm_invalidate_memslot() ->
> > > kvm_arch_guest_memory_reclaimed() was the more logical place for it.
> > > Also, since that seems to be the pattern for arch-specific handlers in
> > > KVM.
> >
> > Maybe?  But only if we can about symmetry between the allocation and free paths
> > I really don't think kvm_arch_free_memslot() should be doing anything beyond a
> > "pure" free.  E.g. kvm_arch_free_memslot() is also called after moving a memslot,
> > which hopefully we never actually have to allow for guest_memfd, but any code in
> > kvm_arch_free_memslot() would bring about "what if" questions regarding memslot
> > movement.  I.e. the API is intended to be a "free arch metadata associated with
> > the memslot".
> >
> > Out of curiosity, what does pKVM need to do at kvm_arch_guest_memory_reclaimed()?
> 
> It's about the host reclaiming ownership of guest memory when tearing
> down a protected guest. In pKVM, we currently teardown the guest and
> reclaim its memory when kvm_arch_destroy_vm() is called. The problem
> with guestmem is that kvm_gmem_unbind() could get called before that
> happens, after which the host might try to access the unbound guest
> memory. Since the host hasn't reclaimed ownership of the guest memory
> from hyp, hilarity ensues (it crashes).
> 
> Initially, I hooked reclaim guest memory to kvm_free_memslot(), but
> then I needed to move the unbind later in the function. I realized
> later that kvm_arch_guest_memory_reclaimed() gets called earlier (at
> the right time), and is more aptly named.

Aha!  I suspected that might be the case.

TDX and SNP also need to solve the same problem of "reclaiming" memory before it
can be safely accessed by the host.  The plan is to add an arch hook (or two?)
into guest_memfd that is invoked when memory is freed from guest_memfd.

Hooking kvm_arch_guest_memory_reclaimed() isn't completely correct as deleting a
memslot doesn't *guarantee* that guest memory is actually reclaimed (which reminds
me, we need to figure out a better name for that thing before introducing
kvm_arch_gmem_invalidate()).

The effective false positives aren't fatal for the current usage because the hook
is used only for x86 SEV guests to flush caches.  An unnecessary flush can cause
performance issues, but it doesn't affect correctness. For TDX and SNP, and IIUC
pKVM, false positives are fatal because KVM could assign memory back to the host
that is still owned by guest_memfd.

E.g. a misbehaving userspace could prematurely delete a memslot.  And the more
fun example is intrahost migration, where the plan is to allow pointing multiple
guest_memfd files at a single guest_memfd inode:
https://lore.kernel.org/all/cover.1691446946.git.ackerleytng@google.com

There was a lot of discussion for this, but it's scattered all over the place.
The TL;DR is is that the inode will represent physical memory, and a file will
represent a given "struct kvm" instance's view of that memory.  And so the memory
isn't reclaimed until the inode is truncated/punched.

I _think_ this reflects the most recent plan from the guest_memfd side:
https://lore.kernel.org/all/1233d749211c08d51f9ca5d427938d47f008af1f.1689893403.git.isaku.yamahata@intel.com
