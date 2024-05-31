Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1C38D6ABD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 22:32:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=c+fYHPRq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrZYq6828z3dVv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 06:32:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=c+fYHPRq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrZY45H1jz3dKd
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 06:32:07 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-41fef5dda72so4005e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 13:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717187516; x=1717792316; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InPM3IgrwlWAIe+nSHKsuhmVDndDnlj7rMcdOWuFi5w=;
        b=c+fYHPRqq48j/YYH4h0kbuTIygm5/HAraAGSjvs7WkfzHX7ThrT/pn0VuoqQ4rnf0n
         9fF5/izHXv9wacTuEiHw6Ypeiz6BsTnkpk05zu6++8MBIrdddAVvkit68TNlwjXaUHvT
         iHHCWXXRxU583s+ZSLDcAObyPu0XvYVzntDSeD5P7UUfeLRY6IPuH5uSIrsYERY45rPt
         rWpanl4x8zmuvGP5DjnDhuJs7j1CjeTt04+p4Wwp1nLFDF38RveIlC+97M18MffiwvAR
         VVKsn4xZITZmf9cn1N9knUpubouH92lluPSRYB4q2JYgClddo7NfVvs3CQxl5OQ9POmq
         O4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717187516; x=1717792316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InPM3IgrwlWAIe+nSHKsuhmVDndDnlj7rMcdOWuFi5w=;
        b=GBzz7gh3+TXYwWV7bcbRnrcPeUbDrT5DICDWM/jvMrDqki6TSvpef4drhnXn3nMhuQ
         FMY3aMZ8xqX+4p1RcV12EFsT5LiHG2MMsRnXNQHueMi6VGUVrbsn81YD0JW0tUN79e9E
         i/T0X173GQxgqRZAbvbOx6oXuYXyDR6LR6fWA+iwtjDKnOG2Qrah27GXuI31h2GJuwQH
         puTcrXi0Nx4bw1u2SLRDzjPO5inCofTxPMuQ1iH1W9sQVzMG8llFYoUbyRnMT2puXD+6
         x2yPZhIdGZxULfO/R8leKrEUFKyaA0OyEyn/F74sWnm6qsgJS+PNIK5dXPJROkCv4egS
         FMxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgD3JCVtSDZu2KmM/LVtD2KnQvfiE1X9YptBm8dzGxx9q/roF2tsU74f3eQG+YNCil/BDTD9O2nBdbEw+fv98fcBfsX9s2Go0ieXSRNQ==
X-Gm-Message-State: AOJu0YwE98Z/CDyZE0160WkRD1CUObDFe3C7Apm+hxozmjhVmPaas/4Z
	CPYf3TBI8HhqpDEx68C9xLM8IXcz2lFza0EUd12/yy0PAQk25ixd/oA1piiGd/V71LxFWFVPmOV
	o/PG1r6qGWcxMRlpoIkkSTZQzvSo7JhJtbG22
X-Google-Smtp-Source: AGHT+IECr7zScct/L9KDZG2FMT9+ZV9pueXumB1G4qrj8mkBEYnZr/Z/kM44zsq5c/gUQqURoi9spkN6RMIRJ4Ct+FE=
X-Received: by 2002:a05:600c:299:b0:418:97c6:188d with SMTP id
 5b1f17b1804b1-421358ce41bmr41075e9.7.1717187515962; Fri, 31 May 2024 13:31:55
 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <Zll7IuGYGG5uI20W@linux.dev>
In-Reply-To: <Zll7IuGYGG5uI20W@linux.dev>
From: Yu Zhao <yuzhao@google.com>
Date: Fri, 31 May 2024 14:31:17 -0600
Message-ID: <CAOUHufa50Dy8CJ5+D10Khs4NU-3Pv0B8qi-GYkcppctTVUkPcA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
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
Cc: James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, David Rientjes <rientjes@google.com>, Zenghui Yu <yuzenghui@huawei.com>, Axel Rasmussen <axelrasmussen@google.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, David Matlack <dmatlack@google.com>, Palmer Dabbelt <palmer@
 dabbelt.com>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Sean Christopherson <seanjc@google.com>, Ankit Agrawal <ankita@nvidia.com>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2024 at 1:24=E2=80=AFAM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> On Wed, May 29, 2024 at 03:03:21PM -0600, Yu Zhao wrote:
> > On Wed, May 29, 2024 at 12:05=E2=80=AFPM James Houghton <jthoughton@goo=
gle.com> wrote:
> > >
> > > Secondary MMUs are currently consulted for access/age information at
> > > eviction time, but before then, we don't get accurate age information=
.
> > > That is, pages that are mostly accessed through a secondary MMU (like
> > > guest memory, used by KVM) will always just proceed down to the oldes=
t
> > > generation, and then at eviction time, if KVM reports the page to be
> > > young, the page will be activated/promoted back to the youngest
> > > generation.
> >
> > Correct, and as I explained offline, this is the only reasonable
> > behavior if we can't locklessly walk secondary MMUs.
> >
> > Just for the record, the (crude) analogy I used was:
> > Imagine a large room with many bills ($1, $5, $10, ...) on the floor,
> > but you are only allowed to pick up 10 of them (and put them in your
> > pocket). A smart move would be to survey the room *first and then*
> > pick up the largest ones. But if you are carrying a 500 lbs backpack,
> > you would just want to pick up whichever that's in front of you rather
> > than walk the entire room.
> >
> > MGLRU should only scan (or lookaround) secondary MMUs if it can be
> > done lockless. Otherwise, it should just fall back to the existing
> > approach, which existed in previous versions but is removed in this
> > version.
>
> Grabbing the MMU lock for write to scan sucks, no argument there. But
> can you please be specific about the impact of read lock v. RCU in the
> case of arm64? I had asked about this before and you never replied.
>
> My concern remains that adding support for software table walkers
> outside of the MMU lock entirely requires more work than just deferring
> the deallocation to an RCU callback. Walkers that previously assumed
> 'exclusive' access while holding the MMU lock for write must now cope
> with volatile PTEs.
>
> Yes, this problem already exists when hardware sets the AF, but the
> lock-free walker implementation needs to be generic so it can be applied
> for other PTE bits.

Direct reclaim is multi-threaded and each reclaimer can take the mmu
lock for read (testing the A-bit) or write (unmapping before paging
out) on arm64. The fundamental problem of using the readers-writer
lock in this case is priority inversion: the readers have lower
priority than the writers, so ideally, we don't want the readers to
block the writers at all.

Using my previous (crude) analogy: puting the bill right in front of
you (the writers) profits immediately whereas searching for the
largest bill (the readers) can be futile.

As I said earlier, I prefer we drop the arm64 support for now, but I
will not object to taking the mmu lock for read when clearing the
A-bit, as long as we fully understand the problem here and document it
clearly.
