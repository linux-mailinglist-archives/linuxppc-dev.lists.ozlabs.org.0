Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id CC3BD8D4167
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 00:31:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Ix6d/ZNp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqP5y0xxgz88G8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 08:23:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Ix6d/ZNp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqP5237lCz87qf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 08:22:14 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42012c85e61so30105e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 15:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717021323; x=1717626123; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXNFpCWaiUyGAgeRu6GIx1Hrfse/W7At5lQK/blkjT8=;
        b=Ix6d/ZNpEo5IU6yj6tG2RnUyUH1NRilaWZUmsscIwss7MpwMbCyp0UphJpR6O/bhLi
         vdP9YamcO4DSZwrdSez1M9NSXOe6Tg3iDpD/1Igf6aDEVD2q+iQvAnw2lLyp6S/eKsBl
         CpgFxL+ey2QmMUD1HFpy769q8RaZfNOMYoaPGz8+xjuO1kp45IRuG7hPU1JzX5Q1KMFV
         ZMzxz8I3kTSCEjPYaKh75ojoUwynkzeNVR13EseGzrXK0+yWGjVmUsaHHRzZLAyCnrXx
         f1B4qOHpBnihG6xPzYiv2dqlkA8d55qniSlegxn76yugSrtihCSPIgG5848F3q69zFe4
         Tagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717021323; x=1717626123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXNFpCWaiUyGAgeRu6GIx1Hrfse/W7At5lQK/blkjT8=;
        b=cJybxbM7YoHYXriQGs9FZ5kOT/9xgtlqFaYJhDGH5w5TrtE/NWMOzJvIOnR1dabO6C
         2EV3ZESo6lHEur7bTGiu+8ZU0cg5UPpf6kHmzo5oSakrrwpTT5rmRi7Up6uGv7wvoIrW
         GgpWg1GpS//OPZBBu/kgYry7AwJc45d6XOwXIlmQybGNT26GWMNnM6nXtPj0RGfxLuTd
         UN+3iE5Gowz5wxqz99IGLdVWV0G+mJyFywEkDzHDesddleTViA1fD8Nc/B92SKVQ2Z0L
         e2pPA9JnIBaGGW84XGj855YVr+FcVadekrvsTMzhguYTC9bfTaRYu0s2iwBnGfRbjxTZ
         mS4w==
X-Forwarded-Encrypted: i=1; AJvYcCW2kVIsPl6yzog3vs22tHncGb/Vjr/jx9TeFhCyKsSI353npJv8AdScOrurGR0tO9oFHQ/+mXt5YSncdGwob4gB7wOj6DwznMEgLTeRDQ==
X-Gm-Message-State: AOJu0Yy3cRUSxn2IgyDnAiLUrRKYD794OAizj7oD2WAaCFbGQxCxttjj
	/PE4yTtSyJ9cYTmNM43ltQhfQYUoseGfn84+DmW7bBfvFL4x612eC3at1J/9quINa0e4dPWU6WG
	W3X8TYYgxVMJyZkyZxhhbkNWnFAU/3L3V8qES
X-Google-Smtp-Source: AGHT+IFqO7VFkypiYSn9vKfdPJnK37iD9z235VYJwF+JX9IAWq7RbNTOv7CYeuUojcdBQo9JI7fHcGh5LBFn8OI6V7U=
X-Received: by 2002:a05:600c:2146:b0:41b:8715:1158 with SMTP id
 5b1f17b1804b1-4212761becfmr670735e9.6.1717021322997; Wed, 29 May 2024
 15:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com>
In-Reply-To: <ZlelW93_T6P-ZuSZ@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 29 May 2024 16:21:24 -0600
Message-ID: <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
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
Cc: James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, David Rientjes <rientjes@google.com>, Zenghui Yu <yuzenghui@huawei.com>, Axel Rasmussen <axelrasmussen@google.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, David Matlack <dmatlack@google.com>, Palmer Dabbelt <palmer@
 dabbelt.com>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Ankit Agrawal <ankita@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2024 at 3:59=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, May 29, 2024, Yu Zhao wrote:
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
> IIUC, by "existing approach" you mean completely ignore secondary MMUs th=
at don't
> implement a lockless walk?

No, the existing approach only checks secondary MMUs for LRU folios,
i.e., those at the end of the LRU list. It might not find the best
candidates (the coldest ones) on the entire list, but it doesn't pay
as much for the locking. MGLRU can *optionally* scan MMUs (secondary
included) to find the best candidates, but it can only be a win if the
scanning incurs a relatively low overhead, e.g., done locklessly for
the secondary MMU. IOW, this is a balance between the cost of
reclaiming not-so-cold (warm) folios and that of finding the coldest
folios.

Scanning host MMUs is likely to be a win because 1) there is usually
access locality 2) there is no coarsed locking. If neither holds,
scanning secondary MMUs would likely be a loss. And 1) is generally
weaker for secondary MMUs, since it's about (guest) physical address
space.
