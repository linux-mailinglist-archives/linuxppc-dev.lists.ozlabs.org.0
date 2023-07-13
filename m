Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D4C752B7A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 22:13:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=sq8DoIAk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R25QX07Jqz3cF2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 06:13:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=sq8DoIAk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R25Pd1mMSz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 06:12:35 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-c5cf26e9669so998094276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 13:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689279150; x=1691871150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJH06eQc+B3mlka9ca3yWe/BFaVZyKNH/FYbTdupon0=;
        b=sq8DoIAkiJTqj/hA0HbPY+Du/lUKvsOypg9bWyJovvwhPvhZLs9OnAATt6DyWj3fhk
         rMqRmV+ckvKtX3mqEovL47UsfIWG+DISWqHsS1jzloQgfd80YPjUGEY2gPScLUzXv3aj
         bEKoTztrMYpGlhl7OU1cNI+EkY48vwK5Af5vcxbKGaAcx3oeCKF43vTk9dp0Os+ehnOh
         4Vot+I5Pq1W7h0Qif76nH99c7qDXBLn72YuUgO10h1+BnKw70/5dvPpRQiXxmJnABb9F
         k/FYmn1X8GMw43PAkTPuZbREEdx6SXIktOvGYFRyjOtq0ls4Ne1B0u4C5shdFL81lA90
         k6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689279150; x=1691871150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJH06eQc+B3mlka9ca3yWe/BFaVZyKNH/FYbTdupon0=;
        b=BJyYs1X/SCOiSYMvgQlhab+DCpRJxdqCeS/UFURkBmRP4ahCEe3hjqWaCvCwzfOhZ4
         wDMeM9OzoZbULvogOrqNZ+odum9b+3hem9yG8esmnln2ImweyPkIoNYowZjYh5zk0b0z
         5q5X9gjHnFwTSCL08x1ffXgqvaXmWcULoBxLbeuHEVetTHgXiRIAqZE67R3XnZwbzHNa
         E5RqEmV0jTgPBj6ObvR2PUPn5y/diBp9sLGXbn2ghUkwwRe4pMoO58qvTfh1GFNETso0
         3nfcYwrt790pYWeyCjyJ72ZWt/JAw0TBU8ULon239JIxK70B5FcQby09C0qpQtOU+Jw2
         4kbQ==
X-Gm-Message-State: ABy/qLbNHH3WvokBTDCGcTOE1jO4+WnD6pg2+CeqFXFvxb7u8x/LYuhQ
	ZGo1Jo3fQ0FpCtg/MSH2Df71OhZTMjRE8nyJ6+Uylw==
X-Google-Smtp-Source: APBJJlHsBJjb/bCQUIDnbMcslY/+BRvpuOtfSJIDEY65ZXVL8Q9oqboC4ArbmfQevCrjLrPcX1Bsga2B7wxkVG3h+b4=
X-Received: by 2002:a25:317:0:b0:c67:d3cd:6989 with SMTP id
 23-20020a250317000000b00c67d3cd6989mr2431008ybd.21.1689279150076; Thu, 13 Jul
 2023 13:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
 <20230713095339.189715-2-wangkefeng.wang@huawei.com> <ZLAjFQGgcjt4ykS7@casper.infradead.org>
In-Reply-To: <ZLAjFQGgcjt4ykS7@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 13 Jul 2023 13:12:15 -0700
Message-ID: <CAJuCfpGBaAJof=5-Xh1saoN9dhOauMiHBZzb0crVNn9OyOeZHw@mail.gmail.com>
Subject: Re: [PATCH rfc -next 01/10] mm: add a generic VMA lock-based page
 fault handler
To: Matthew Wilcox <willy@infradead.org>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, loongarch@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-s390@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt
 .com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 13, 2023 at 9:15=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> > +int try_vma_locked_page_fault(struct vm_locked_fault *vmlf, vm_fault_t=
 *ret)
> > +{
> > +     struct vm_area_struct *vma;
> > +     vm_fault_t fault;
>
>
> On Thu, Jul 13, 2023 at 05:53:29PM +0800, Kefeng Wang wrote:
> > +#define VM_LOCKED_FAULT_INIT(_name, _mm, _address, _fault_flags, _vm_f=
lags, _regs, _fault_code) \
> > +     _name.mm                =3D _mm;                  \
> > +     _name.address           =3D _address;             \
> > +     _name.fault_flags       =3D _fault_flags;         \
> > +     _name.vm_flags          =3D _vm_flags;            \
> > +     _name.regs              =3D _regs;                \
> > +     _name.fault_code        =3D _fault_code
>
> More consolidated code is a good idea; no question.  But I don't think
> this is the right way to do it.
>
> > +int __weak arch_vma_check_access(struct vm_area_struct *vma,
> > +                              struct vm_locked_fault *vmlf);
>
> This should be:
>
> #ifndef vma_check_access
> bool vma_check_access(struct vm_area_struct *vma, )
> {
>         return (vma->vm_flags & vm_flags) =3D=3D 0;
> }
> #endif
>
> and then arches which want to do something different can just define
> vma_check_access.
>
> > +int try_vma_locked_page_fault(struct vm_locked_fault *vmlf, vm_fault_t=
 *ret)
> > +{
> > +     struct vm_area_struct *vma;
> > +     vm_fault_t fault;
>
> Declaring the vmf in this function and then copying it back is just wrong=
.
> We need to declare vm_fault_t earlier (in the arch fault handler) and
> pass it in.

Did you mean to say "we need to declare vmf (struct vm_fault) earlier
(in the arch fault handler) and pass it in." ?

>  I don't think that creating struct vm_locked_fault is the
> right idea either.
>
> > +     if (!(vmlf->fault_flags & FAULT_FLAG_USER))
> > +             return -EINVAL;
> > +
> > +     vma =3D lock_vma_under_rcu(vmlf->mm, vmlf->address);
> > +     if (!vma)
> > +             return -EINVAL;
> > +
> > +     if (arch_vma_check_access(vma, vmlf)) {
> > +             vma_end_read(vma);
> > +             return -EINVAL;
> > +     }
> > +
> > +     fault =3D handle_mm_fault(vma, vmlf->address,
> > +                             vmlf->fault_flags | FAULT_FLAG_VMA_LOCK,
> > +                             vmlf->regs);
> > +     *ret =3D fault;
> > +
> > +     if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
> > +             vma_end_read(vma);
> > +
> > +     if ((fault & VM_FAULT_RETRY))
> > +             count_vm_vma_lock_event(VMA_LOCK_RETRY);
> > +     else
> > +             count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> > +
> > +     return 0;
> > +}
> > +
> >  #endif /* CONFIG_PER_VMA_LOCK */
> >
> >  #ifndef __PAGETABLE_P4D_FOLDED
> > --
> > 2.27.0
> >
> >
