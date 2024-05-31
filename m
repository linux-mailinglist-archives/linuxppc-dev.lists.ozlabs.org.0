Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 780748D6B4B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 23:11:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Pr2/eo6M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrbPv4zKwz3flp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 07:10:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Pr2/eo6M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=dmatlack@google.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrbP86CFQz3dLc
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 07:10:20 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-35dcff36522so1368488f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 14:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717189816; x=1717794616; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2tq10nFX29kQGqNAS352osxyUaVdPznDkZxoHpHfa8=;
        b=Pr2/eo6MVMqzX3RmmHCcLEsE058WVLluOMBvPCfxw2QSrf81aPaXSO6ukkKM3wf1nh
         viwVErJ0/LJSj0wmkZm0YcqDuExm6bkcwWi63h6wxWxIjKukDjmJY317BXh4IQFY58iw
         RIzWAhVK5pUk+uOybqL3YctGGk9aeYToztp9uG46eQcnatfLtRchg30z5BDJShAu5ckM
         xHK/Z4iGFp5yA3iGe64qBPhp/8YKWkUQZbSXMwKQvBz/RECC6e9+Xj15ksxSKewPiXe2
         ICb8RaU7pTABWvCTe5zVenH7RtxJBkcTDWV0liBqKMKZgoG6yBRSHoFaqkyMSQ7EjFeM
         FQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717189816; x=1717794616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2tq10nFX29kQGqNAS352osxyUaVdPznDkZxoHpHfa8=;
        b=loTov+vT3oosiR09lIIjLrNdR1utv4q1CljYadpyhWlqc5Pmj8xdpOC6Bskol2s36o
         qKV6UzY34B5++2LoV5kJ82qlTJ2dxQR280Aw/RUnGujTHCjTunHkJY4d1es+MjpzMrjv
         qaNlDZHFseiIDuqbfJ5IG+kuBTFF8Kk0tHizWUL6HeIt/enICcUhzx31hBjN1VjZE9Hb
         6Zxuc+ElSb7vC/zgItQ29k++pQkr18Kl50I+S4135EvZwhy3zHg+bkrpH0QRjU2PuCY1
         /JG9gxbjs5MegfBu2x+KAm4c/ZjcguA3A9arw9xkh/LpWIZ5+8J103iISAMJhUq/22H4
         3QRg==
X-Forwarded-Encrypted: i=1; AJvYcCVhhTYWKoKYA1Dh20aQqBAKZbVtfv2Rfn5oJCJc/t1wY/6Kh0VXkfJ5RR16AmOxkNGi2uVrXrJfx0cLkAydnnm/nggO8M/aA3zJYFHm0w==
X-Gm-Message-State: AOJu0YyOBOcf1rva6IlklhSZDMtrdcifRF7eIlhAYB18AL4WARt8nhUh
	g0Wry3gcb58P6ZYx/v4K9lS9BQFW3CIGuFGjXUsznMdwqtw/NUFRF69k2FZinle/1sCvCoicLGE
	d9SVlLl+9S4m/IjCLY9Wwn/j4ciFsdQFhPk0F
X-Google-Smtp-Source: AGHT+IGBXgQKGvGpLJLkAZRNkN3pvPdaYlgrwH8luU8wCcE+kb/FtudP+b0UHW6VTmsTqjv8AVqi9KSPou5NOiUNmXY=
X-Received: by 2002:a05:6000:1b09:b0:357:ca29:f1ca with SMTP id
 ffacd0b85a97d-35e0f2869c8mr2259497f8f.32.1717189815401; Fri, 31 May 2024
 14:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <Zll7IuGYGG5uI20W@linux.dev> <CAOUHufa50Dy8CJ5+D10Khs4NU-3Pv0B8qi-GYkcppctTVUkPcA@mail.gmail.com>
 <CALzav=e4PmGV6ayuMCwbKWq8EnOomYKBj-0Lj+gV-kPO=h156A@mail.gmail.com>
In-Reply-To: <CALzav=e4PmGV6ayuMCwbKWq8EnOomYKBj-0Lj+gV-kPO=h156A@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 31 May 2024 14:09:49 -0700
Message-ID: <CALzav=dgV55gwhUdXh9T5k29JrcheAgJooHFodvf=u3YuookHg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: Yu Zhao <yuzhao@google.com>
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
Cc: James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, David Rientjes <rientjes@google.com>, Zenghui Yu <yuzenghui@huawei.com>, Axel Rasmussen <axelrasmussen@google.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, linux-
 arm-kernel@lists.infradead.org, Sean Christopherson <seanjc@google.com>, Ankit Agrawal <ankita@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2024 at 2:06=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On Fri, May 31, 2024 at 1:31=E2=80=AFPM Yu Zhao <yuzhao@google.com> wrote=
:
> >
> > On Fri, May 31, 2024 at 1:24=E2=80=AFAM Oliver Upton <oliver.upton@linu=
x.dev> wrote:
> > >
> > > On Wed, May 29, 2024 at 03:03:21PM -0600, Yu Zhao wrote:
> > > > On Wed, May 29, 2024 at 12:05=E2=80=AFPM James Houghton <jthoughton=
@google.com> wrote:
> > > > >
> > > > > Secondary MMUs are currently consulted for access/age information=
 at
> > > > > eviction time, but before then, we don't get accurate age informa=
tion.
> > > > > That is, pages that are mostly accessed through a secondary MMU (=
like
> > > > > guest memory, used by KVM) will always just proceed down to the o=
ldest
> > > > > generation, and then at eviction time, if KVM reports the page to=
 be
> > > > > young, the page will be activated/promoted back to the youngest
> > > > > generation.
> > > >
> > > > Correct, and as I explained offline, this is the only reasonable
> > > > behavior if we can't locklessly walk secondary MMUs.
> > > >
> > > > Just for the record, the (crude) analogy I used was:
> > > > Imagine a large room with many bills ($1, $5, $10, ...) on the floo=
r,
> > > > but you are only allowed to pick up 10 of them (and put them in you=
r
> > > > pocket). A smart move would be to survey the room *first and then*
> > > > pick up the largest ones. But if you are carrying a 500 lbs backpac=
k,
> > > > you would just want to pick up whichever that's in front of you rat=
her
> > > > than walk the entire room.
> > > >
> > > > MGLRU should only scan (or lookaround) secondary MMUs if it can be
> > > > done lockless. Otherwise, it should just fall back to the existing
> > > > approach, which existed in previous versions but is removed in this
> > > > version.
> > >
> > > Grabbing the MMU lock for write to scan sucks, no argument there. But
> > > can you please be specific about the impact of read lock v. RCU in th=
e
> > > case of arm64? I had asked about this before and you never replied.
> > >
> > > My concern remains that adding support for software table walkers
> > > outside of the MMU lock entirely requires more work than just deferri=
ng
> > > the deallocation to an RCU callback. Walkers that previously assumed
> > > 'exclusive' access while holding the MMU lock for write must now cope
> > > with volatile PTEs.
> > >
> > > Yes, this problem already exists when hardware sets the AF, but the
> > > lock-free walker implementation needs to be generic so it can be appl=
ied
> > > for other PTE bits.
> >
> > Direct reclaim is multi-threaded and each reclaimer can take the mmu
> > lock for read (testing the A-bit) or write (unmapping before paging
> > out) on arm64. The fundamental problem of using the readers-writer
> > lock in this case is priority inversion: the readers have lower
> > priority than the writers, so ideally, we don't want the readers to
> > block the writers at all.
> >
> > Using my previous (crude) analogy: puting the bill right in front of
> > you (the writers) profits immediately whereas searching for the
> > largest bill (the readers) can be futile.
> >
> > As I said earlier, I prefer we drop the arm64 support for now, but I
> > will not object to taking the mmu lock for read when clearing the
> > A-bit, as long as we fully understand the problem here and document it
> > clearly.
>
> FWIW, Google Cloud has been doing proactive reclaim and kstaled-based
> aging (a Google-internal page aging daemon, for those outside of
> Google) for many years on x86 VMs with the A-bit harvesting
> under the write-lock. So I'm skeptical that making ARM64 lockless is
> necessary to allow Secondary MMUs to participate in MGLRU aging with
> acceptable performance for Cloud usecases. I don't even think it's
> necessary on x86 but it's a simple enough change that we might as well
> just do it.

The obvious caveat here: If MGLRU aging and kstaled aging are
substantially different in how frequently they trigger mmu_notifiers,
then my analysis may not be correct. I'm hoping Yu you can shed some
light on that. I'm also operating under the assumption that Secondary
MMUs are only participating in aging, and not look-around (i.e. what
is implemented in v4).

>
> I suspect under pathological conditions (host under intense memory
> pressure and high rate of reclaim occurring) making A-bit harvesting
> lockless will perform better. But under such conditions VM performance
> is likely going to suffer regardless. In a Cloud environment we deal
> with that through other mechanisms to reduce the rate of reclaim and
> make the host healthy.
>
> For these reasons, I think there's value in giving users the option to
> enable Secondary MMUs participation MGLRU aging even when A-bit
> test/clearing is not done locklessly. I believe this was James' intent
> with the Kconfig. Perhaps a default-off writable module parameter
> would be better to avoid distros accidentally turning it on?
>
> If and when there is a usecase for optimizing VM performance under
> pathological reclaim conditions on ARM, we can make it lockless then.
