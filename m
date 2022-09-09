Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4723C5B2E17
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 07:26:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP4Gz1tWSz3bqx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 15:26:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K5NPQOoD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K5NPQOoD;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP4GK4NpXz302x
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 15:26:01 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id z21so903729edi.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 22:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cKunQQ0ZtQ4nnTnNWhEV+IwjuR7Legc2WXx2uSMRff4=;
        b=K5NPQOoD2unggSwwL1R9l1FwEM796OlvgFahRNG76jAXm6Fu9iMvOVLWbCimG2ht+T
         LKzy9J/hTCSyCTF/rQrr0bpa2Y9KKyCMWf9MijKRMruE755hBY69pl/f+hD4IS5d+FuO
         k6tS+UWr5kPeids83zMaAoi0kUvkkRYTHPE+EYrET3hBQFXhbJaUNxbinszB5XrleIQg
         PYyk2MrpBbW1FZa9yhZtC0pyxBX+8cbWZRwzJ4JPWiH+uHyU7vTEeQ06A4uCtTqD1bo/
         go0f0JeVm/zjkhF7LI/kCMxxI68r3aApEKLi7PFVol74wzV96P9w1ZZoRLSK0sh81p0I
         a4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cKunQQ0ZtQ4nnTnNWhEV+IwjuR7Legc2WXx2uSMRff4=;
        b=KbhYq9aUURMJsq92CXsZEAzrqsb33w7p7t/6zNfdh+iUr6ye4egI01DtKHF2VxcHyd
         EBv6t6PrPfjzY0A3PuivJqoAv1MlC90jwNDBrFpoL9uyXDUXyQfS/Tu29xvKG0lt8eWK
         RKmL4+r0rlnkQ3Crqzvu/gs8rxU26Zia6gPHaZOHkfwh96ZTNTZ129NIzP1mCQPDLnx6
         icmo+sKz5u2cqMip7WhZqzX+8Xv0qIVamHpaim1o1NHdEz+3bA6hITvpZw+e3LTkjAmF
         OpzLMMn/BkOFL+wcH1+E4pBfxcTgOhUn7mjhBExUdWD/lYtyrdaHFysawux6u71I9nYQ
         7XbA==
X-Gm-Message-State: ACgBeo2DnUNsg+G1+wwkLutQcNzjnbShMCShsg/SZySiNq9QT2AFRQJp
	H3oRC+65JPP8FO6SRypUsiR/KlV/jv3FrYCZ6Bw=
X-Google-Smtp-Source: AA6agR7i5YbyJh5uFUq/HewUo3qsQmRLHmO66JkCO6+jFdtZyHpagVWgUZsTDLOc6vdsVMb1Fp03UDprdSw68rIMZbM=
X-Received: by 2002:aa7:cb87:0:b0:43b:e650:6036 with SMTP id
 r7-20020aa7cb87000000b0043be6506036mr10106507edt.350.1662701157430; Thu, 08
 Sep 2022 22:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220822082120.8347-1-yangyicong@huawei.com> <20220822082120.8347-4-yangyicong@huawei.com>
 <b621dbb6-a98f-003e-3578-fc8b0f512d4a@arm.com>
In-Reply-To: <b621dbb6-a98f-003e-3578-fc8b0f512d4a@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 Sep 2022 17:25:46 +1200
Message-ID: <CAGsJ_4wW3FM5WLxYnGnwOn-rnc-3Jz_0Oq89GPqx6Rn6Od0U6Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] mm: rmap: Extend tlbbatch APIs to fit new platforms
To: Anshuman Khandual <anshuman.khandual@arm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, Dave Hansen <dave.hansen@linux.intel.com>, yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, "H. Peter Anvin" <hpa@zytor.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, darren@os.amperecomputing.com, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 9, 2022 at 4:51 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 8/22/22 13:51, Yicong Yang wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > Add uaddr to tlbbatch APIs so that platforms like ARM64 are
>
> I guess 'uaddr' refers to a virtual address from the process address
> space itself ? Please be more specific.
>
> > able to apply this on their specific hardware features. For
> > ARM64, this could be sending tlbi into hardware queues for
> > the page with this particular uaddr.
>
> This subject line and commit message here are misleading. The patch
> adds an address argument to arch callback arch_tlbbatch_add_mm() as
> arm64 platform could use that to perform the TLB flush batching ?
>
> This patch can be folded into the next one, so that the requirement
> for an additional argument 'uaddr' in the arch callback will be self
> evident. OR if this is going to be a preparatory patch, then it must
> explain how 'uaddr' argument is helpful on platforms like arm64 while
> performing TLB flush batching. But TBH, just folding it to next patch
> explains the context better.

The intention was to keep each change small, while still functionally
independent,
so that it was easier to be reviewed.

but yes, i agree in this particular case, if we fold this one to the
last one, we are
actually able to make the modification self-evident while the new patch seems
still small.

>
> >
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Cc: Nadav Amit <namit@vmware.com>
> > Cc: Mel Gorman <mgorman@suse.de>
> > Tested-by: Xin Hao <xhao@linux.alibaba.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > ---
> >  arch/x86/include/asm/tlbflush.h |  3 ++-
> >  mm/rmap.c                       | 10 ++++++----
> >  2 files changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> > index 8a497d902c16..5bd78ae55cd4 100644
> > --- a/arch/x86/include/asm/tlbflush.h
> > +++ b/arch/x86/include/asm/tlbflush.h
> > @@ -264,7 +264,8 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
> >  }
> >
> >  static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
> > -                                     struct mm_struct *mm)
> > +                                     struct mm_struct *mm,
> > +                                     unsigned long uaddr)
> >  {
> >       inc_mm_tlb_gen(mm);
> >       cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index a17a004550c6..7187a72b63b1 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -642,12 +642,13 @@ void try_to_unmap_flush_dirty(void)
> >  #define TLB_FLUSH_BATCH_PENDING_LARGE                        \
> >       (TLB_FLUSH_BATCH_PENDING_MASK / 2)
> >
> > -static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
> > +static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
> > +                                   unsigned long uaddr)
> >  {
> >       struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
> >       int batch, nbatch;
> >
> > -     arch_tlbbatch_add_mm(&tlb_ubc->arch, mm);
> > +     arch_tlbbatch_add_mm(&tlb_ubc->arch, mm, uaddr);
> >       tlb_ubc->flush_required = true;
> >
> >       /*
> > @@ -725,7 +726,8 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
> >       }
> >  }
> >  #else
> > -static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
> > +static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
> > +                                   unsigned long uaddr)
> >  {
> >  }
> >
> > @@ -1587,7 +1589,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
> >                                */
> >                               pteval = ptep_get_and_clear(mm, address, pvmw.pte);
> >
> > -                             set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
> > +                             set_tlb_ubc_flush_pending(mm, pte_dirty(pteval), address);
> >                       } else {
> >                               pteval = ptep_clear_flush(vma, address, pvmw.pte);
> >                       }

Thanks
Barry
