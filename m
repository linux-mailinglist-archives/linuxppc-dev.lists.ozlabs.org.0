Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3E4716E5C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 22:08:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QW3P40m04z3fCB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 06:08:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=DtfynU88;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=DtfynU88;
	dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QW3NB4VMhz3c9s
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 06:07:37 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-3f6a6e9d90dso57881cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 13:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685477252; x=1688069252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnJw+gna055xgPY4k/D+ZQZ+/+poCudJDicda2AGR3k=;
        b=DtfynU88O3z0/4oFgDiYM7qy14b7RLg4yomBzxL0dog8TFdWbHyo2tpb/B1SOYXfmp
         NSRsIG+eVwPFOobh1xJCt8kwErPgylGUweOcutP0ywct+6P+S2IjeaikfhAUmhYPV+uH
         Mv+j09gZh5WjQDA3Z/2Gy9TgffLJonGspryTqmY7mSq0d2Id3AeV0HEZ5ulNgRW7LXMq
         4JCJAWgEwKAWSjc16VpDrPx50NJw92bJUlL+d9zw+H+Lfu/l9dON3ftxIU/zENGgXs4K
         1cHj3nLx36gvePguvMtotajaF04WFwISrYvt1J6cDwX3ikwzIPGkd33waRKuVJi8J5gu
         uXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685477252; x=1688069252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnJw+gna055xgPY4k/D+ZQZ+/+poCudJDicda2AGR3k=;
        b=hyVCNZFmTgcbBHMWHvkgKIE/YEMzikguwWK3E3+I7dM7vKH4xaELi3YOv6dm2Eyfd2
         l51/Hb+qcB6H7snEeH3z/zonrlpKJNRIZtYpl0mtXIZVBQPzesrG1zPYYzIMlw08TK1p
         /6stYrcIfl++JhSTsNq2ZUbe3WvTHQ1Q8a2RR0UOTjqlvTXLGRghb1j+TlSBDpkEkQx7
         BaYA/1F+U04rP2oVcHSOL9222KSZ3bd7rle+0lAZPJhqyD66UafVjCytB4mp9sW70GEF
         UpOPgtvQrF6PEexZfPuvCz4CPLEc6raSHqi7jnzVIKsXgVo+5HxiaD/UCsSeiK/j4rpg
         zYuA==
X-Gm-Message-State: AC+VfDx41BynxNlr6YntS9k2kV4U0E2126jsR3tG8uUMCQYQq1xSQgjH
	+dFRfwusNipUQwkZSgIzxlm8AFy84BbQE80Qj1d8kg==
X-Google-Smtp-Source: ACHHUZ6GXKZ8JX2tTyi2dAoKnrLtSo8EMFYdPNZnbJmbRABrmf7MX05SzfLq0yw9C6unlnFwzm3TaQimSQte4R7XEoY=
X-Received: by 2002:a05:622a:1012:b0:3ef:2f55:2204 with SMTP id
 d18-20020a05622a101200b003ef2f552204mr6506qte.6.1685477252408; Tue, 30 May
 2023 13:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com> <20230526234435.662652-5-yuzhao@google.com>
 <ZHJHJPBF6euzOFdw@linux.dev> <CAOUHufa74CufHziHSquO5bZwbFXz2MNssBzW+AH7=Xo5RCnQ0A@mail.gmail.com>
 <ZHZQdQAApIrw6fBu@linux.dev>
In-Reply-To: <ZHZQdQAApIrw6fBu@linux.dev>
From: Yu Zhao <yuzhao@google.com>
Date: Tue, 30 May 2023 14:06:55 -0600
Message-ID: <CAOUHufZOkBmZJgCU2xW2B8S3P3TWERHezy0xKWY9_TeyV9K7Rg@mail.gmail.com>
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

On Tue, May 30, 2023 at 1:37=E2=80=AFPM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> Hi Yu,
>
> On Sat, May 27, 2023 at 02:13:07PM -0600, Yu Zhao wrote:
> > On Sat, May 27, 2023 at 12:08=E2=80=AFPM Oliver Upton <oliver.upton@lin=
ux.dev> wrote:
> > > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtabl=
e.c
> > > index 3d61bd3e591d..bfbebdcb4ef0 100644
> > > --- a/arch/arm64/kvm/hyp/pgtable.c
> > > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > > @@ -1019,7 +1019,7 @@ static int stage2_unmap_walker(const struct kvm=
_pgtable_visit_ctx *ctx,
> > >                                                kvm_granule_size(ctx->=
level));
> > >
> > >         if (childp)
> > > -               mm_ops->put_page(childp);
> > > +               mm_ops->free_removed_table(childp, ctx->level);
> >
> > Thanks, Oliver.
> >
> > A couple of things I haven't had the chance to verify -- I'm hoping
> > you could help clarify:
> > 1. For unmapping, with free_removed_table(), wouldn't we have to look
> > into the table we know it's empty unnecessarily?
>
> As it is currently implemented, yes. But, there's potential to fast-path
> the implementation by checking page_count() before starting the walk.

Do you mind posting another patch? I'd be happy to ack it, as well as
the one you suggested above.

> > 2. For remapping and unmapping, how does free_removed_table() put the
> > final refcnt on the table passed in? (Previously we had
> > put_page(childp) in stage2_map_walk_table_post(). So I'm assuming we'd
> > have to do something equivalent with free_removed_table().)
>
> Heh, that's a bug, and an embarrassing one at that!
>
> Sent out a fix for that, since it would appear we leak memory on
> table->block transitions. PTAL if you have a chance.
>
> https://lore.kernel.org/all/20230530193213.1663411-1-oliver.upton@linux.d=
ev/

Awesome.
