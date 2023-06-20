Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F2B7369E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 12:51:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fnS8a/4V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qlk2R54q1z30gw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 20:51:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fnS8a/4V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlk1S1dzyz2yyX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 20:50:18 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b5452b77b4so26951585ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 03:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687258214; x=1689850214;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7951XL+AGyfPDPVBcyQBGj0fPAuFilMzcMu5/OoYt74=;
        b=fnS8a/4VYBS/vSvyHGdyP24ps8Kq8sr63Wr4Cn+CKBIdCwmniMmjJQIShB7fHbhPok
         4Tz8DOApK/lZNktEbFb0CTD55Axu4zROPjHAYc6+zmDoDqX+AqohriDpOOaQN3d3t6YO
         WubwljD9DnaVkMpJ+ANgkaj8164ZY2AQrv3cSKs4osSMUdtI8cdJt59XQ6OQPKBDN4BA
         HGG2Pm6f8Vl5/IatHvIGVKuiGYw4tRpj875PHbwE+48tkD2gtAT0If5GHBzB/ngA9yVU
         rfO//WK2++e6S9Hf+ak9ebcfkvZQo9JogK4XbUn/3EtRLurzh5eH86GEuU3AVAYEbRDN
         BmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687258214; x=1689850214;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7951XL+AGyfPDPVBcyQBGj0fPAuFilMzcMu5/OoYt74=;
        b=D7+/9PCJvqKzbS8TR3PrCLaBGVsgpXyOrBigDp3K8k2Zkb3V3MKNezV4CY8+N1yMIC
         +F0/Zakt5s5BNpYyzs/fmxJJ+B9SynDN68gH7bjh08KSU4VEFFBAHEr5ym+XDvnU5d4f
         IcFEd/244I/PGB1mI4uRG75yILpHZd0mkCpRBkNoCYWxWCq4govZkUv8xE2qfOCF8wH0
         AZBiqHDZ/lN9jshJqiofg7oySRoWtxJMPYrPpp5vJjUkj11gnvUitjAN4qsMyJEcFEJR
         REFu9lBmrVJxXVIdG4G141kVG8xm9o6SsEr5Ufiy8hNSG6AyBvlUvaEGkH7eqWEbfjA4
         LgWg==
X-Gm-Message-State: AC+VfDwEbLYtgX3mLIEws8mGiPWTH1KkSWIBKM1uTXEzZmVwkhsI7boE
	MMxIRXwJhVD4t7q1WA5YDhM=
X-Google-Smtp-Source: ACHHUZ7CSMfgUHDwU9KLFxwcxS1szXOVyovRvhTVEH1gWS7z37bysU3PrZvvl2rPP84okj3F8GtMVA==
X-Received: by 2002:a17:902:6b8b:b0:1b2:1a79:147d with SMTP id p11-20020a1709026b8b00b001b21a79147dmr10591794plk.2.1687258214282;
        Tue, 20 Jun 2023 03:50:14 -0700 (PDT)
Received: from localhost ([124.170.190.103])
        by smtp.gmail.com with ESMTPSA id p2-20020a170902e74200b001b3c892c367sm1368654plf.63.2023.06.20.03.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 03:50:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jun 2023 20:49:56 +1000
Message-Id: <CTHF42QOSYR0.1Y16SFUF11F3X@wheely>
Subject: Re: [PATCH mm-unstable v2 06/10] kvm/powerpc: make radix page
 tables RCU safe
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Yu Zhao" <yuzhao@google.com>
X-Mailer: aerc 0.14.0
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-7-yuzhao@google.com>
 <CTH9N6UYDUM2.1974CRL32YFQC@wheely>
 <CAOUHufY8egkNrxQwd6ms4j6ziyUW5uDjD=yhkxHLqAAOGB4Ccw@mail.gmail.com>
In-Reply-To: <CAOUHufY8egkNrxQwd6ms4j6ziyUW5uDjD=yhkxHLqAAOGB4Ccw@mail.gmail.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc
 Zyngier <maz@kernel.org>, "H. Peter
 Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas
 Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver
 Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Jun 20, 2023 at 6:00 PM AEST, Yu Zhao wrote:
> On Tue, Jun 20, 2023 at 12:33=E2=80=AFAM Nicholas Piggin <npiggin@gmail.c=
om> wrote:
> >
> > On Sat May 27, 2023 at 9:44 AM AEST, Yu Zhao wrote:
> > > KVM page tables are currently not RCU safe against remapping, i.e.,
> > > kvmppc_unmap_free_pmd_entry_table() et al. The previous
> >
> > Minor nit but the "page table" is not RCU-safe against something. It
> > is RCU-freed, and therefore some algorithm that accesses it can have
> > the existence guarantee provided by RCU (usually there still needs
> > to be more to it).
> >
> > > mmu_notifier_ops members rely on kvm->mmu_lock to synchronize with
> > > that operation.
> > >
> > > However, the new mmu_notifier_ops member test_clear_young() provides
> > > a fast path that does not take kvm->mmu_lock. To implement
> > > kvm_arch_test_clear_young() for that path, orphan page tables need to
> > > be freed by RCU.
> >
> > Short version: clear the referenced bit using RCU instead of MMU lock
> > to protect against page table freeing, and there is no problem with
> > clearing the bit in a table that has been freed.
> >
> > Seems reasonable.
>
> Thanks. All above points taken.
>
> > > Unmapping, specifically kvm_unmap_radix(), does not free page tables,
> > > hence not a concern.
> >
> > Not sure if you really need to make the distinction about why the page
> > table is freed, we might free them via unmapping. The point is just
> > anything that frees them while there can be concurrent access, right?
>
> Correct.
>
> > > Signed-off-by: Yu Zhao <yuzhao@google.com>
> > > ---
> > >  arch/powerpc/kvm/book3s_64_mmu_radix.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kv=
m/book3s_64_mmu_radix.c
> > > index 461307b89c3a..3b65b3b11041 100644
> > > --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> > > +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> > > @@ -1469,13 +1469,15 @@ int kvmppc_radix_init(void)
> > >  {
> > >       unsigned long size =3D sizeof(void *) << RADIX_PTE_INDEX_SIZE;
> > >
> > > -     kvm_pte_cache =3D kmem_cache_create("kvm-pte", size, size, 0, p=
te_ctor);
> > > +     kvm_pte_cache =3D kmem_cache_create("kvm-pte", size, size,
> > > +                                       SLAB_TYPESAFE_BY_RCU, pte_cto=
r);
> > >       if (!kvm_pte_cache)
> > >               return -ENOMEM;
> > >
> > >       size =3D sizeof(void *) << RADIX_PMD_INDEX_SIZE;
> > >
> > > -     kvm_pmd_cache =3D kmem_cache_create("kvm-pmd", size, size, 0, p=
md_ctor);
> > > +     kvm_pmd_cache =3D kmem_cache_create("kvm-pmd", size, size,
> > > +                                       SLAB_TYPESAFE_BY_RCU, pmd_cto=
r);
> > >       if (!kvm_pmd_cache) {
> > >               kmem_cache_destroy(kvm_pte_cache);
> > >               return -ENOMEM;
> >
> > KVM PPC HV radix PUD level page tables use the arch/powerpc allocators
> > (for some reason), which are not RCU freed. I think you need them too?
>
> We don't. The use of the arch/powerpc allocator for PUD tables seems
> appropriate to me because, unlike PMD/PTE tables, we never free PUD
> tables during the lifetime of a VM:

Ah you're right, the pud_free only comes from the double alloc case
so it's never visible to concurrent threads.

> * We don't free PUD/PMD/PTE tables when they become empty, i.e., not
> mapping any pages but still attached. (We could in theory, as
> x86/aarch64 do.)

We may try to do that at some point, but that's not related to your
patch for now so no worries.

Thanks,
Nick
