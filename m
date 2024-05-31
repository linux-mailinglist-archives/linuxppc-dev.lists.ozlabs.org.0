Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD908D6B3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 23:08:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K3sN0AfG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrbLS73Kvz3fnq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 07:08:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K3sN0AfG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=dmatlack@google.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrbKl0jgVz3dV9
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 07:07:22 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-354f3f6c3b1so2234419f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 14:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717189638; x=1717794438; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xx3RPcl1E+PKSqvPm+Il1+elz18o0K6zeYgjqcWFZiw=;
        b=K3sN0AfGJYZ1Wp97SeZ04XIx154t7ixAxRuQc7fv4iVFMIFe53Uc6dI3lcoJeZa8sO
         HgQ4mH/5UpLFp7YE3EHkaW6M3lRQiQ3z7nOxht/4NOEsJW3IU2CQB8XH6ukA0GwHWA9E
         RayUWQayb7NHT/ksIQQeUEiyfQ+iTYGqUEDOqx16Al6d6psxAt+hxXhgh/9I8loXR1vf
         SRiZeNTPSYAdX3N9lhdvIyk6Dz6LqWO4Gx8sdnu2esWcsU9Xb5vSgLZVR+r/papctCWW
         4sg1QhgIHouAZOf39843VxkwgU75rLyayjydw/1leOdiQYSo7x4jK4z7u474z1TwZHVo
         T6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717189638; x=1717794438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xx3RPcl1E+PKSqvPm+Il1+elz18o0K6zeYgjqcWFZiw=;
        b=QXzR+rn/hpoOJtF8YiEPs0JwPiSeHh5O4mfdGrUsVz4yI0w/PR6OpfmaOcx19IVf0m
         2MZj+EVY4f6zcMXbJq98M+nbkqmbIpJJRwxebKTijHW6jyL2KYYfGi8RBmtHdw2ZpxPr
         4lD5AcwMMj4C2Tr8B8b/KHHCeJwzyqjJv0KSlMBJR2CNUhMyGvkaYCgX3MASV6wYMwUm
         WeXTSPIwPtLzWDjh8esaNiUEz78QeT8VercsXq9CiJIiNopth+A0J1ZA9/Lr8T7LzmpZ
         wYnI/QFjt10DFvHLVdR4u0yhjMIaPT8uZNDe4MMJKjKsaaCnfUpXs9O2sxEO9yB9hOtz
         Szrw==
X-Forwarded-Encrypted: i=1; AJvYcCW+wN6foj+wQas9f4r0NvWX9ROzwMvTg46hr18J74/s+7qbMqFFKxOeCvySQp9HN1yjraSYTxPfUNkw3u1mN9gwE7AnYq7Iw/vv5nH2gQ==
X-Gm-Message-State: AOJu0Yw+qx2schCgDBY6qkwsgfxLmF8r1QkO3he5pF5adIFv96T8CuUi
	4bxt9K59yXA+r7AaUd4f3gNWQts1DfL7M9mbKKbxM2qVYHLwoQ84ztHaX7fna8WwPK1DILyS52K
	r0mHFP5NyENxfY/P/H3jDiYySXXavFOVm1+1a
X-Google-Smtp-Source: AGHT+IE03rpUbTjyQuwZWIC8g/9gHa5mH+MWE/NTSPO8cSZrAXipu4jJgjC2128Si67H3Tnp43CK2uN+A9xSwuw2ufM=
X-Received: by 2002:a5d:4cc1:0:b0:34c:d9f5:a8e with SMTP id
 ffacd0b85a97d-35e0f25b1a0mr2178382f8f.7.1717189638221; Fri, 31 May 2024
 14:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <Zll7IuGYGG5uI20W@linux.dev> <CAOUHufa50Dy8CJ5+D10Khs4NU-3Pv0B8qi-GYkcppctTVUkPcA@mail.gmail.com>
In-Reply-To: <CAOUHufa50Dy8CJ5+D10Khs4NU-3Pv0B8qi-GYkcppctTVUkPcA@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 31 May 2024 14:06:49 -0700
Message-ID: <CALzav=e4PmGV6ayuMCwbKWq8EnOomYKBj-0Lj+gV-kPO=h156A@mail.gmail.com>
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

On Fri, May 31, 2024 at 1:31=E2=80=AFPM Yu Zhao <yuzhao@google.com> wrote:
>
> On Fri, May 31, 2024 at 1:24=E2=80=AFAM Oliver Upton <oliver.upton@linux.=
dev> wrote:
> >
> > On Wed, May 29, 2024 at 03:03:21PM -0600, Yu Zhao wrote:
> > > On Wed, May 29, 2024 at 12:05=E2=80=AFPM James Houghton <jthoughton@g=
oogle.com> wrote:
> > > >
> > > > Secondary MMUs are currently consulted for access/age information a=
t
> > > > eviction time, but before then, we don't get accurate age informati=
on.
> > > > That is, pages that are mostly accessed through a secondary MMU (li=
ke
> > > > guest memory, used by KVM) will always just proceed down to the old=
est
> > > > generation, and then at eviction time, if KVM reports the page to b=
e
> > > > young, the page will be activated/promoted back to the youngest
> > > > generation.
> > >
> > > Correct, and as I explained offline, this is the only reasonable
> > > behavior if we can't locklessly walk secondary MMUs.
> > >
> > > Just for the record, the (crude) analogy I used was:
> > > Imagine a large room with many bills ($1, $5, $10, ...) on the floor,
> > > but you are only allowed to pick up 10 of them (and put them in your
> > > pocket). A smart move would be to survey the room *first and then*
> > > pick up the largest ones. But if you are carrying a 500 lbs backpack,
> > > you would just want to pick up whichever that's in front of you rathe=
r
> > > than walk the entire room.
> > >
> > > MGLRU should only scan (or lookaround) secondary MMUs if it can be
> > > done lockless. Otherwise, it should just fall back to the existing
> > > approach, which existed in previous versions but is removed in this
> > > version.
> >
> > Grabbing the MMU lock for write to scan sucks, no argument there. But
> > can you please be specific about the impact of read lock v. RCU in the
> > case of arm64? I had asked about this before and you never replied.
> >
> > My concern remains that adding support for software table walkers
> > outside of the MMU lock entirely requires more work than just deferring
> > the deallocation to an RCU callback. Walkers that previously assumed
> > 'exclusive' access while holding the MMU lock for write must now cope
> > with volatile PTEs.
> >
> > Yes, this problem already exists when hardware sets the AF, but the
> > lock-free walker implementation needs to be generic so it can be applie=
d
> > for other PTE bits.
>
> Direct reclaim is multi-threaded and each reclaimer can take the mmu
> lock for read (testing the A-bit) or write (unmapping before paging
> out) on arm64. The fundamental problem of using the readers-writer
> lock in this case is priority inversion: the readers have lower
> priority than the writers, so ideally, we don't want the readers to
> block the writers at all.
>
> Using my previous (crude) analogy: puting the bill right in front of
> you (the writers) profits immediately whereas searching for the
> largest bill (the readers) can be futile.
>
> As I said earlier, I prefer we drop the arm64 support for now, but I
> will not object to taking the mmu lock for read when clearing the
> A-bit, as long as we fully understand the problem here and document it
> clearly.

FWIW, Google Cloud has been doing proactive reclaim and kstaled-based
aging (a Google-internal page aging daemon, for those outside of
Google) for many years on x86 VMs with the A-bit harvesting
under the write-lock. So I'm skeptical that making ARM64 lockless is
necessary to allow Secondary MMUs to participate in MGLRU aging with
acceptable performance for Cloud usecases. I don't even think it's
necessary on x86 but it's a simple enough change that we might as well
just do it.

I suspect under pathological conditions (host under intense memory
pressure and high rate of reclaim occurring) making A-bit harvesting
lockless will perform better. But under such conditions VM performance
is likely going to suffer regardless. In a Cloud environment we deal
with that through other mechanisms to reduce the rate of reclaim and
make the host healthy.

For these reasons, I think there's value in giving users the option to
enable Secondary MMUs participation MGLRU aging even when A-bit
test/clearing is not done locklessly. I believe this was James' intent
with the Kconfig. Perhaps a default-off writable module parameter
would be better to avoid distros accidentally turning it on?

If and when there is a usecase for optimizing VM performance under
pathological reclaim conditions on ARM, we can make it lockless then.
