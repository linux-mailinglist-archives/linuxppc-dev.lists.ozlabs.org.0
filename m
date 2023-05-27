Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAF1713663
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 22:14:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QTCgY5lmzz3fGg
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 06:14:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=QKnbpAkf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=QKnbpAkf;
	dkim-atps=neutral
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QTCfj4T83z3f3p
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 06:13:48 +1000 (AEST)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-33164ec77ccso110235ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 13:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685218424; x=1687810424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hK0j7POD8nRAsgGVVyJyo0UAU2zdW6aeJVN1+UjYElg=;
        b=QKnbpAkfLda1TvWrqaHzwSET9fcih+s5ib+TdEQpynJiDGgVyvcDWnq3f1jN8iSFFh
         i4wFHU4TObni6/73zZFM2D/pTSqgWk3+PPUYZMhIR48y37fhDEuDC9+d1+t2fRyrNgkr
         ayuCVtu0XYwZQdosz7e+wfHDnmUd/KZvqBq519Uy5lfqbbTbuuKK9L+bNXaHlLVwpoUG
         cBLrrDoSDWDEZ8OZLuLbQmUVgsGX8ts8KOPplFja+x5y6f4LRsCZW4nMJ6qgcp4bf8BG
         SEOtEkefIHI1t2fsfFozpr5n9BYz9LMkdnQOauJRbx9hSkM/0nH1fRNwjjqiDsKIVZLy
         cqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685218424; x=1687810424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hK0j7POD8nRAsgGVVyJyo0UAU2zdW6aeJVN1+UjYElg=;
        b=AJBtKqcBn43QUfTmsLuAY8CgqiNQ46uAH/TUfhIBt07/CdqbdGfR/QNOTw7wkPWsML
         p7W/ep0kwweoYm4FunaZ/NV8Q1MjHWN2qJnNhHm6RrjROT94Vhf1lDQIEcrnzLQHg+tX
         rQCzu/3BrnMsVC0jaJVdiA68jUV4PZFYGO/fLUrfstPZh6rVlcqu0QZXngqolYOR8+vE
         APP/aMAQR6FQUcHzuv+z3yMsEiXR8eUQGdzPIQpHq3Dh+tnHnKBJVJPuzWUu52JQjgoP
         67kJu/WR0QdxbmO6NApHP3ugkKtLf7Qi8nB3BlUFpxmjL3pcWoYgckveuZHOgDo0Hvlp
         5GaA==
X-Gm-Message-State: AC+VfDxgHVdCH07OPHTBcciGgQOChjpzxAY2x+Ts7gOFhHSAf23UIpso
	KMdFQ7ZM7mcZLK5JarO4Et8Q4WVcPJA7CY8Gn+5qxw==
X-Google-Smtp-Source: ACHHUZ5RLdNfCuhTMMzeLnK0AkjXh46hEGbQ5DPXaiuA4QGSm27lLMiJSKz6HarBK0wHhmVvVqcZAJpytCQ/s6idEUA=
X-Received: by 2002:a05:6e02:2185:b0:337:c9ec:4ca with SMTP id
 j5-20020a056e02218500b00337c9ec04camr138001ila.2.1685218423829; Sat, 27 May
 2023 13:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com> <20230526234435.662652-5-yuzhao@google.com>
 <ZHJHJPBF6euzOFdw@linux.dev>
In-Reply-To: <ZHJHJPBF6euzOFdw@linux.dev>
From: Yu Zhao <yuzhao@google.com>
Date: Sat, 27 May 2023 14:13:07 -0600
Message-ID: <CAOUHufa74CufHziHSquO5bZwbFXz2MNssBzW+AH7=Xo5RCnQ0A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 04/10] kvm/arm64: make stage2 page tables
 RCU safe
To: Oliver Upton <oliver.upton@linux.dev>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fab
 iano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 27, 2023 at 12:08=E2=80=AFPM Oliver Upton <oliver.upton@linux.d=
ev> wrote:
>
> Yu,
>
> On Fri, May 26, 2023 at 05:44:29PM -0600, Yu Zhao wrote:
> > Stage2 page tables are currently not RCU safe against unmapping or VM
> > destruction. The previous mmu_notifier_ops members rely on
> > kvm->mmu_lock to synchronize with those operations.
> >
> > However, the new mmu_notifier_ops member test_clear_young() provides
> > a fast path that does not take kvm->mmu_lock. To implement
> > kvm_arch_test_clear_young() for that path, unmapped page tables need
> > to be freed by RCU and kvm_free_stage2_pgd() needs to be after
> > mmu_notifier_unregister().
> >
> > Remapping, specifically stage2_free_removed_table(), is already RCU
> > safe.
> >
> > Signed-off-by: Yu Zhao <yuzhao@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_pgtable.h |  2 ++
> >  arch/arm64/kvm/arm.c                 |  1 +
> >  arch/arm64/kvm/hyp/pgtable.c         |  8 ++++++--
> >  arch/arm64/kvm/mmu.c                 | 17 ++++++++++++++++-
> >  4 files changed, 25 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/=
asm/kvm_pgtable.h
> > index ff520598b62c..5cab52e3a35f 100644
> > --- a/arch/arm64/include/asm/kvm_pgtable.h
> > +++ b/arch/arm64/include/asm/kvm_pgtable.h
> > @@ -153,6 +153,7 @@ static inline bool kvm_level_supports_block_mapping=
(u32 level)
> >   * @put_page:                        Decrement the refcount on a page.=
 When the
> >   *                           refcount reaches 0 the page is automatica=
lly
> >   *                           freed.
> > + * @put_page_rcu:            RCU variant of the above.
>
> You don't need to add yet another hook to implement this. I was working
> on lock-free walks in a separate context and arrived at the following:
>
> commit f82d264a37745e07ee28e116c336f139f681fd7f
> Author: Oliver Upton <oliver.upton@linux.dev>
> Date:   Mon May 1 08:53:37 2023 +0000
>
>     KVM: arm64: Consistently use free_removed_table() for stage-2
>
>     free_removed_table() is essential to the RCU-protected parallel walki=
ng
>     scheme, as behind the scenes the cleanup is deferred until an RCU gra=
ce
>     period. Nonetheless, the stage-2 unmap path calls put_page() directly=
,
>     which leads to table memory being freed inline with the table walk.
>
>     This is safe for the time being, as the stage-2 unmap walker is calle=
d
>     while holding the write lock. A future change to KVM will further rel=
ax
>     the locking mechanics around the stage-2 page tables to allow lock-fr=
ee
>     walkers protected only by RCU. As such, switch to the RCU-safe mechan=
ism
>     for freeing table memory.
>
>     Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
>
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 3d61bd3e591d..bfbebdcb4ef0 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -1019,7 +1019,7 @@ static int stage2_unmap_walker(const struct kvm_pgt=
able_visit_ctx *ctx,
>                                                kvm_granule_size(ctx->leve=
l));
>
>         if (childp)
> -               mm_ops->put_page(childp);
> +               mm_ops->free_removed_table(childp, ctx->level);

Thanks, Oliver.

A couple of things I haven't had the chance to verify -- I'm hoping
you could help clarify:
1. For unmapping, with free_removed_table(), wouldn't we have to look
into the table we know it's empty unnecessarily?
2. For remapping and unmapping, how does free_removed_table() put the
final refcnt on the table passed in? (Previously we had
put_page(childp) in stage2_map_walk_table_post(). So I'm assuming we'd
have to do something equivalent with free_removed_table().)
