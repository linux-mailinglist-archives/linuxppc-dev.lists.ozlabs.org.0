Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 487F4736599
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 10:02:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=6oEmMLuU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlfHW1LsFz30g2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 18:02:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=6oEmMLuU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlfGZ3rdTz2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 18:01:26 +1000 (AEST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-3ff25ca795eso288871cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 01:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687248083; x=1689840083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0soM3eBW17TUN7zlLidBNvK+EaFBcT8rKMwsr5hx58=;
        b=6oEmMLuUKY8JFmpDg5+v8E4MdTfurRjLoX1ABWiD8rzU/LoDjwWm0ElBunYvvTrVA9
         8jootSjhRUZ8mYyleJGBxXK5CcUGV9LC89/FsE1fwM3MFc18DbQLdNMT/KUlg2oXiLnf
         3hYu82RMtbq9gvVpHdRYAhY1c5cul9XOj4lfNfa8XuMmfActB+whqEOf7AttaUfJ7c0C
         3vzpiNwE1EtKzD+/va+/gJE+1XGIbiurMGkbGIv3LXcIiB+WsYskiA7/AEN02+rUbgu0
         NlCzIuWkeu5kq2y4PCTaglIB6hcUeYig1h/77sLoDyWgn/n47w+phuzDHthZW/SS7dfY
         7K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687248083; x=1689840083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0soM3eBW17TUN7zlLidBNvK+EaFBcT8rKMwsr5hx58=;
        b=VSMAL3acsinpTzyxiAdfLKEzfm0BFg8sd3DrAQCKCHpRY2AXGHLm+bVo/xZ2IOMmnn
         yRjDDMqQxpL8gyyPld1w5VUg9Hdl0cWylBJTov5u4pLzY5LnAIrvOL3S7jJh2VZWKhth
         hznXm5C2bHGyFwAqyTUP54R6VhedXJclh49S3JFfrX1y2R+uoBquwiv0BkntI7WgEI00
         RVSN7lwQB2M/pilWvvWARE6zyShX5CNexo3pEijlYu4WlPjuanmzg/AIIawJLecV0yG4
         syvmtV6jVeJHt+p2yn2kNoURP+mPT9qABUVT5IO0zbDJ9cFKu/rag0NupP8JJYGELL8H
         o+mg==
X-Gm-Message-State: AC+VfDzBWIUZP5jeCIHnvlwbNKY7Me3Kbt3N9iKxIVY0D7u0ftPb9cRC
	NxPdX17jXcPnFsDVc1JiGZwrsSw9X98s3DmqgoNNoQ==
X-Google-Smtp-Source: ACHHUZ4xBX0RlLFDAXi6zryiB7+5YG80ltFJqS/gHVwlzdVsIwOci9YnZ/I3ji95of7DLw9rWv+GufohPkCcn7y0vzA=
X-Received: by 2002:a05:622a:589:b0:3ed:210b:e698 with SMTP id
 c9-20020a05622a058900b003ed210be698mr1007941qtb.7.1687248082908; Tue, 20 Jun
 2023 01:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com> <20230526234435.662652-7-yuzhao@google.com>
 <CTH9N6UYDUM2.1974CRL32YFQC@wheely>
In-Reply-To: <CTH9N6UYDUM2.1974CRL32YFQC@wheely>
From: Yu Zhao <yuzhao@google.com>
Date: Tue, 20 Jun 2023 02:00:46 -0600
Message-ID: <CAOUHufY8egkNrxQwd6ms4j6ziyUW5uDjD=yhkxHLqAAOGB4Ccw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 06/10] kvm/powerpc: make radix page tables
 RCU safe
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 20, 2023 at 12:33=E2=80=AFAM Nicholas Piggin <npiggin@gmail.com=
> wrote:
>
> On Sat May 27, 2023 at 9:44 AM AEST, Yu Zhao wrote:
> > KVM page tables are currently not RCU safe against remapping, i.e.,
> > kvmppc_unmap_free_pmd_entry_table() et al. The previous
>
> Minor nit but the "page table" is not RCU-safe against something. It
> is RCU-freed, and therefore some algorithm that accesses it can have
> the existence guarantee provided by RCU (usually there still needs
> to be more to it).
>
> > mmu_notifier_ops members rely on kvm->mmu_lock to synchronize with
> > that operation.
> >
> > However, the new mmu_notifier_ops member test_clear_young() provides
> > a fast path that does not take kvm->mmu_lock. To implement
> > kvm_arch_test_clear_young() for that path, orphan page tables need to
> > be freed by RCU.
>
> Short version: clear the referenced bit using RCU instead of MMU lock
> to protect against page table freeing, and there is no problem with
> clearing the bit in a table that has been freed.
>
> Seems reasonable.

Thanks. All above points taken.

> > Unmapping, specifically kvm_unmap_radix(), does not free page tables,
> > hence not a concern.
>
> Not sure if you really need to make the distinction about why the page
> table is freed, we might free them via unmapping. The point is just
> anything that frees them while there can be concurrent access, right?

Correct.

> > Signed-off-by: Yu Zhao <yuzhao@google.com>
> > ---
> >  arch/powerpc/kvm/book3s_64_mmu_radix.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/=
book3s_64_mmu_radix.c
> > index 461307b89c3a..3b65b3b11041 100644
> > --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> > +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> > @@ -1469,13 +1469,15 @@ int kvmppc_radix_init(void)
> >  {
> >       unsigned long size =3D sizeof(void *) << RADIX_PTE_INDEX_SIZE;
> >
> > -     kvm_pte_cache =3D kmem_cache_create("kvm-pte", size, size, 0, pte=
_ctor);
> > +     kvm_pte_cache =3D kmem_cache_create("kvm-pte", size, size,
> > +                                       SLAB_TYPESAFE_BY_RCU, pte_ctor)=
;
> >       if (!kvm_pte_cache)
> >               return -ENOMEM;
> >
> >       size =3D sizeof(void *) << RADIX_PMD_INDEX_SIZE;
> >
> > -     kvm_pmd_cache =3D kmem_cache_create("kvm-pmd", size, size, 0, pmd=
_ctor);
> > +     kvm_pmd_cache =3D kmem_cache_create("kvm-pmd", size, size,
> > +                                       SLAB_TYPESAFE_BY_RCU, pmd_ctor)=
;
> >       if (!kvm_pmd_cache) {
> >               kmem_cache_destroy(kvm_pte_cache);
> >               return -ENOMEM;
>
> KVM PPC HV radix PUD level page tables use the arch/powerpc allocators
> (for some reason), which are not RCU freed. I think you need them too?

We don't. The use of the arch/powerpc allocator for PUD tables seems
appropriate to me because, unlike PMD/PTE tables, we never free PUD
tables during the lifetime of a VM:
* We don't free PUD/PMD/PTE tables when they become empty, i.e., not
mapping any pages but still attached. (We could in theory, as
x86/aarch64 do.)
* We have to free PMD/PTE tables when we replace them with 1GB/2MB
pages. (Otherwise we'd lose track of detached tables.) And we
currently don't support huge pages at P4D level, so we never detach
and free PUD tables.
