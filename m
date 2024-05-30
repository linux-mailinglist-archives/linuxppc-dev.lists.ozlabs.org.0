Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id DB6B98D4434
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 05:36:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=o6YZhAS/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqWsv42hDz7BLp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 13:28:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=o6YZhAS/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=jthoughton@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqWs70v4nz79LP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 13:27:21 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-43e14f0bd75so110761cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 20:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717039638; x=1717644438; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzO8DZyZzCqrZIAMGt7yPpLcZJsj3wUliJt03pVmX2A=;
        b=o6YZhAS/MIGpdPsP7uMYq63blbmfW3iociRZFqWv17i/V2mMIb8OuToTeYjku7u+1o
         wGxF+csIT3CbTcHT/98WvaxkAivrUUCDqBceszYXPZybsIOhnzgHjjDHW1xoGe5Mz7if
         Z4x8DApvKcU5KuZ3HK7sQiLuM+sNv1VZafrE0nfy0Sg4YxriiRp6fwgSv4nxxs8pmv2P
         itw9CA0nuqRzAJ/R1riIg5sXReiGP/yfs6UoxlzW/8JVfKucP4o6Xm9VPElhlXTub3mD
         WkRZdj7FwKxpPkOOwdoi5WIMUOpcttR+XfkrXUkoUPFuBIBuY5ICcf2XKwkc7CQFjR19
         J2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717039638; x=1717644438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzO8DZyZzCqrZIAMGt7yPpLcZJsj3wUliJt03pVmX2A=;
        b=rZgsPui+5xrvyt8jLyowdw5emW9Sm2LXwy2I3OeDU/xOM40LLCe7IbZ3xcwMua0ATV
         1BYoK3i5lLqtSi7LA55PJDBVujo25FUgZJ0Wef38sAaIyrLEEYl7hlyp3DNwWDFfoG6a
         R8jcewptqcHwmyPoEMggxt8hGZRc/gDRcs11tsRQePmTw4sx40WgbxHwXqzXiynbEDKZ
         hAyqpqWFCEel5wEgJ8eI6de2fh13f8dA8TQj5pCymbAUvsPHtJukSDVsCRX2xJ6imxjw
         pLHm0OuEQnvpBIwI4sS/4qg8cLD7vwPsS3jU0sB0BsMPrbTSeiwixR+ok/pioaB43Fdz
         msgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWExE5lmMC+LVHfs8Jmz5tpE3WAijtZFpl9hfmXkbWGfMU8Sx4BMcDDW0rJB9nv5NTXHDHHZAdrvRwybdS3/2AkvZ9DyNJrD0MSuYNFyw==
X-Gm-Message-State: AOJu0YwTdVewKCTifF5FbIlNW7wTodFNbJVeTQUKYXnWQsHHOE6B3DBL
	96okWUQb1XwsGhsiC/jH7quZ03F+r5/l+d280zD+9P/x1+GmYOZ05+RehicgVCCQp3KJPy5312+
	AvRliT4tkIukp7/KGuqXtSk+KKG5ES9nfmxQ4
X-Google-Smtp-Source: AGHT+IFVU+i/PACo9p4/Bfxh1CqiMIWSQeR950pdjWP8hj1BhsXnC5rRHtunLNirP/Gyt4FL6G7AiU0HcN3VuQYeCls=
X-Received: by 2002:a05:622a:a313:b0:43f:ebce:be50 with SMTP id
 d75a77b69052e-43febcebe65mr835941cf.16.1717039638165; Wed, 29 May 2024
 20:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-4-jthoughton@google.com> <ZlejXCYIuJ7_DlwL@google.com>
In-Reply-To: <ZlejXCYIuJ7_DlwL@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 29 May 2024 20:26:41 -0700
Message-ID: <CADrL8HUa9o+G6-Yn9oWt2LUgoVYGU=sYE2-JhkpoRgrS6Wi57g@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] KVM: Add lockless memslot walk to KVM
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, David Rientjes <rientjes@google.com>, Zenghui Yu <yuzenghui@huawei.com>, Axel Rasmussen <axelrasmussen@google.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, David Matlack <dmatlack@google.com>, Palmer Dabbelt <palmer@dabbelt.com
 >, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Ankit Agrawal <ankita@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2024 at 2:51=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, May 29, 2024, James Houghton wrote:
> > @@ -686,10 +694,12 @@ static __always_inline int kvm_handle_hva_range(s=
truct mmu_notifier *mn,
> >       return __kvm_handle_hva_range(kvm, &range).ret;
> >  }
> >
> > -static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_no=
tifier *mn,
> > -                                                      unsigned long st=
art,
> > -                                                      unsigned long en=
d,
> > -                                                      gfn_handler_t ha=
ndler)
> > +static __always_inline int kvm_handle_hva_range_no_flush(
> > +             struct mmu_notifier *mn,
> > +             unsigned long start,
> > +             unsigned long end,
> > +             gfn_handler_t handler,
> > +             bool lockless)
>
> Unnecessary and unwanted style change.

Sorry -- this will be fixed.

>
> >  {
> >       struct kvm *kvm =3D mmu_notifier_to_kvm(mn);
> >       const struct kvm_mmu_notifier_range range =3D {
> > @@ -699,6 +709,7 @@ static __always_inline int kvm_handle_hva_range_no_=
flush(struct mmu_notifier *mn
> >               .on_lock        =3D (void *)kvm_null_fn,
> >               .flush_on_ret   =3D false,
> >               .may_block      =3D false,
> > +             .lockless       =3D lockless,
>
> Why add @lockess to kvm_handle_hva_range_no_flush()?  Both callers immedi=
ately
> pass %false, and conceptually, locking is always optional for a "no flush=
" variant.

Right, this isn't needed in this patch. But I think I need it
eventually (like, in the next patch), so I'll move it where it is
really needed.



>
> >       };
> >
> >       return __kvm_handle_hva_range(kvm, &range).ret;
> > @@ -889,7 +900,8 @@ static int kvm_mmu_notifier_clear_young(struct mmu_=
notifier *mn,
> >        * cadence. If we find this inaccurate, we might come up with a
> >        * more sophisticated heuristic later.
> >        */
> > -     return kvm_handle_hva_range_no_flush(mn, start, end, kvm_age_gfn)=
;
> > +     return kvm_handle_hva_range_no_flush(mn, start, end,
> > +                                          kvm_age_gfn, false);
> >  }
> >
> >  static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
> > @@ -899,7 +911,7 @@ static int kvm_mmu_notifier_test_young(struct mmu_n=
otifier *mn,
> >       trace_kvm_test_age_hva(address);
> >
> >       return kvm_handle_hva_range_no_flush(mn, address, address + 1,
> > -                                          kvm_test_age_gfn);
> > +                                          kvm_test_age_gfn, false);
> >  }
> >
> >  static void kvm_mmu_notifier_release(struct mmu_notifier *mn,
> > --
> > 2.45.1.288.g0e0cd299f1-goog
> >
