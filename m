Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB4B718EF8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 01:12:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWlQr0GDPz3fCH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 09:12:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Fl9wqKb8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Fl9wqKb8;
	dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWlPx3Ff0z3cjY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 09:11:32 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-3f81ffc9065so39961cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 16:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685574688; x=1688166688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/MWN6rejTskcfCq1jo0OT/p1QBXsLATfA+P3wCJaoY=;
        b=Fl9wqKb8OYiVPVPir2ykRI7L87RcY3p24K4mWUjopqQTvt6/CSKSwE9qVHRGO6ZIyW
         IGgJ7ajDetdyJJ3J0awBrq/8PPsnnFT2U0Y+VQZlF3ypjJSsz6wb3/99o33RUgdV8q9D
         LxgAmYusm5FQ9UhHpudVCbDtgWoGgI+YBGozKHPGQpt2VgcJVtpWrvFEyOgNyTyxzZmg
         y4FzNbCCExTZsYgnHR8rb0eLgQOqCa2HOYwcjAeJPG8Rf8wPXO/lWazTGQJhdwBxCct5
         ro3o47PFqt8NJqRflzi2ECtQf6klWmKPHu/KYN9vgBMNLtr5ELk17kW3gYx2FDQJWqVF
         wK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685574688; x=1688166688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/MWN6rejTskcfCq1jo0OT/p1QBXsLATfA+P3wCJaoY=;
        b=l78H9rKZHQNpdhDkVImseCSN/MU20zSO8Cr94JQ2jXbcSds4mNBEoAeVEFiWouBnJF
         ZokSCm1DSuU1P4HxcdhSGAtIHBhTNt5uDwD+XwHjH2bSj1ZwfyBnVrK+h0z1JdPfb57u
         o7y2MER3Q+csl19kaWruUeF/MrB1SeijpPLQrGdiVlhGTePEbiCDmPMS+h76OC7nAX7O
         8YOny2TOcEY2fL9wxUcMIzFM1z/p00blNEXVHGyff3/azMZbNtxXS8DrwFnxMqb3YvnX
         4+1J2jI1pgw0S1VyeW3DmWtfErr13AOChN1ZcyTraAK5V+jdu3iustnc8l8hmI4EYwH8
         IZgw==
X-Gm-Message-State: AC+VfDwTMAPsjOeCCijzSd6jmambaKYfatmvh4P56XdcOJH/KnWGK7no
	mxLBiuLp5yOXkZcucUEI/q2y5EcudjZDqeL1Nyndww==
X-Google-Smtp-Source: ACHHUZ4fYvopsUDf0tKZluhlRdIiL+dMyvw/iJd7HM69nbbpN2GCk7JOyoWyB+QIJLSvn8t1n1/kKB5iqs8Czcu+kSs=
X-Received: by 2002:ac8:4e45:0:b0:3db:1c01:9d95 with SMTP id
 e5-20020ac84e45000000b003db1c019d95mr104964qtw.4.1685574688480; Wed, 31 May
 2023 16:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com> <20230526234435.662652-5-yuzhao@google.com>
 <ZHJHJPBF6euzOFdw@linux.dev> <CAOUHufa74CufHziHSquO5bZwbFXz2MNssBzW+AH7=Xo5RCnQ0A@mail.gmail.com>
 <ZHZQdQAApIrw6fBu@linux.dev> <CAOUHufZOkBmZJgCU2xW2B8S3P3TWERHezy0xKWY9_TeyV9K7Rg@mail.gmail.com>
 <ZHef0VsZvZ1Vnz0u@linux.dev>
In-Reply-To: <ZHef0VsZvZ1Vnz0u@linux.dev>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 31 May 2023 17:10:52 -0600
Message-ID: <CAOUHufZrfnfcbrqSzmHkejR5MA2gmGKZ3LMRhbLHV+1427z=Tw@mail.gmail.com>
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

On Wed, May 31, 2023 at 1:28=E2=80=AFPM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> On Tue, May 30, 2023 at 02:06:55PM -0600, Yu Zhao wrote:
> > On Tue, May 30, 2023 at 1:37=E2=80=AFPM Oliver Upton <oliver.upton@linu=
x.dev> wrote:
> > >
> > > Hi Yu,
> > >
> > > On Sat, May 27, 2023 at 02:13:07PM -0600, Yu Zhao wrote:
> > > > On Sat, May 27, 2023 at 12:08=E2=80=AFPM Oliver Upton <oliver.upton=
@linux.dev> wrote:
> > > > > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pg=
table.c
> > > > > index 3d61bd3e591d..bfbebdcb4ef0 100644
> > > > > --- a/arch/arm64/kvm/hyp/pgtable.c
> > > > > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > > > > @@ -1019,7 +1019,7 @@ static int stage2_unmap_walker(const struct=
 kvm_pgtable_visit_ctx *ctx,
> > > > >                                                kvm_granule_size(c=
tx->level));
> > > > >
> > > > >         if (childp)
> > > > > -               mm_ops->put_page(childp);
> > > > > +               mm_ops->free_removed_table(childp, ctx->level);
> > > >
> > > > Thanks, Oliver.
> > > >
> > > > A couple of things I haven't had the chance to verify -- I'm hoping
> > > > you could help clarify:
> > > > 1. For unmapping, with free_removed_table(), wouldn't we have to lo=
ok
> > > > into the table we know it's empty unnecessarily?
> > >
> > > As it is currently implemented, yes. But, there's potential to fast-p=
ath
> > > the implementation by checking page_count() before starting the walk.
> >
> > Do you mind posting another patch? I'd be happy to ack it, as well as
> > the one you suggested above.
>
> I'd rather not take such a patch independent of the test_clear_young
> series if you're OK with that. Do you mind implementing something
> similar to the above patch w/ the proposed optimization if you need it?

No worries. I can take the above together with the following, which
would form a new series with its own merits, since apparently you
think the !AF case is important.

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 26a8d955b49c..6ce73ce9f146 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1453,10 +1453,10 @@ static void handle_access_fault(struct
kvm_vcpu *vcpu, phys_addr_t fault_ipa)

        trace_kvm_access_fault(fault_ipa);

-       read_lock(&vcpu->kvm->mmu_lock);
+       rcu_read_lock();
        mmu =3D vcpu->arch.hw_mmu;
        pte =3D kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa);
-       read_unlock(&vcpu->kvm->mmu_lock);
+       rcu_read_unlock();

        if (kvm_pte_valid(pte))
                kvm_set_pfn_accessed(kvm_pte_to_pfn(pte));
