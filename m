Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF4B8FA604
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 00:47:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yYEftY3C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtTPn4Vr6z3d9V
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 08:47:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yYEftY3C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com; envelope-from=jthoughton@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtTNz3fTXz3ckp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 08:46:42 +1000 (AEST)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-43fe3289fc5so50581cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2024 15:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717454796; x=1718059596; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwApvMmCxi6kRvhFpeZNrHVjs/fSYi202Vq8O0y7Pvc=;
        b=yYEftY3CSZAyKxRE8yL1sqsGbtAQymUC3a+qtBB7IYeCipKFZi/rxh48BHVuMbmaXk
         6u37g7FhGzcM/cyckUkyIBTVlaF7f/KLc73YLywySECLbFd0evLQDNOuvqojAQuPX2Zk
         FeybKryl/VJTRcmooQUF1kNn2x6PJZAEozTZ0b372pQ0VbatgHtIWuTjPTgdpnX/rrDL
         xo3KTVOY/7ojiyVZnAdrwxSzLACCGvN/XLRB6J1Vw368tgHnNYycCJiZOrbQenVvz0ak
         2UTVq/K9yoFiNGcQK/Vh7kpv0V+Vb7n1u6UDhzg/t/dfIQd5FuyGh+nZOk5BuSdGPgj0
         A9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717454796; x=1718059596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwApvMmCxi6kRvhFpeZNrHVjs/fSYi202Vq8O0y7Pvc=;
        b=IKpzxXX6j5eU2lAz0UJwV8aQDJWEV2On08PnhvvlQlCdXvzhwPM7G4+CgeClhCM2gx
         xcqN+nJJsdBWhtjgeXd4cnttts0U+HjiZubjK2A8slHtcgHmhZ8fBWoWG/AyiZVpGl87
         Jcrc0HP89nQHw9s+fE7uCmWZkYabIiDWG7sjW4NOfuot4fhpUEcCkEwKeUkVKxY6DhUy
         FrvKVK+bD00H6xdP7TMt2nXHoy+YnGzePF5Dxt0vctGvKdBm1s8S4AINIBk8684INAbX
         dKf5C9tPsVxccZ8yE9XzFBgwiQ6Qvrt79uQzbnGxM5N6GOX9mwt8oXEsIvT/ljhFeVA3
         WRHw==
X-Forwarded-Encrypted: i=1; AJvYcCXojeX9kQOk33kxCQNyew4/jdUaaewe+xcO93KH4Jr0UlX5hU2sf9qwyl5jJPXi7dMoti5uMUpILjnDPOAV5s6lkT/v85Iwm4ZgiiIGaQ==
X-Gm-Message-State: AOJu0Ywg9RgcSDFNRfUKqJBIvg0CrWg5RdjCEQWexAYXdRCkJg8sf1l5
	AprxTbLrZPNf8At6dc27eRe1xUjCIwSRN5UjGKqLkgf1wSrdqv0bpCh5/bw8Jxsvm3yCS7EPv3G
	0lbUswTT9h9JSLGbMgcZto4e57X4U1E0lVm5D
X-Google-Smtp-Source: AGHT+IFNqO3Eeca3fb/gjbGejzk9epZFQKuRMTX94UERp2ub7SAJHzg0ElHPjQ2U8grOlDfvsiNhgYwFk5rOK4wQGMU=
X-Received: by 2002:a05:622a:59ce:b0:43f:ff89:dfb9 with SMTP id
 d75a77b69052e-4401bd281f4mr1732131cf.6.1717454795966; Mon, 03 Jun 2024
 15:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com> <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com>
In-Reply-To: <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 3 Jun 2024 15:45:59 -0700
Message-ID: <CADrL8HW44Hx_Ejx_6+FVKt1V17PdgT6rw+sNtKzumqc9UCVDfA@mail.gmail.com>
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, David Rientjes <rientjes@google.com>, Zenghui Yu <yuzenghui@huawei.com>, Axel Rasmussen <axelrasmussen@google.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Atish Patra <atishp@atishpatra.org>, David Matlack <dmatlack@google.com>, Palmer Dabbelt <palmer@dabbelt.c
 om>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Sean Christopherson <seanjc@google.com>, Ankit Agrawal <ankita@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 30, 2024 at 11:06=E2=80=AFPM Yu Zhao <yuzhao@google.com> wrote:
>
> On Wed, May 29, 2024 at 7:08=E2=80=AFPM James Houghton <jthoughton@google=
.com> wrote:
> >
> > Hi Yu, Sean,
> >
> > Perhaps I "simplified" this bit of the series a little bit too much.
> > Being able to opportunistically do aging with KVM (even without
> > setting the Kconfig) is valuable.
> >
> > IIUC, we have the following possibilities:
> > - v4: aging with KVM is done if the new Kconfig is set.
> > - v3: aging with KVM is always done.
>
> This is not true -- in v3, MGLRU only scans secondary MMUs if it can
> be done locklessly on x86. It uses a bitmap to imply this requirement.
>
> > - v2: aging with KVM is done when the architecture reports that it can
> > probably be done locklessly, set at KVM MMU init time.
>
> Not really -- it's only done if it can be done locklessly on both x86 and=
 arm64.
>
> > - Another possibility?: aging with KVM is only done exactly when it
> > can be done locklessly (i.e., mmu_notifier_test/clear_young() called
> > such that it will not grab any locks).
>
> This is exactly the case for v2.

Thanks for clarifying; sorry for getting this wrong.

>
> > I like the v4 approach because:
> > 1. We can choose whether or not to do aging with KVM no matter what
> > architecture we're using (without requiring userspace be aware to
> > disable the feature at runtime with sysfs to avoid regressing
> > performance if they don't care about proactive reclaim).
> > 2. If we check the new feature bit (0x8) in sysfs, we can know for
> > sure if aging is meant to be working or not. The selftest changes I
> > made won't work properly unless there is a way to be sure that aging
> > is working with KVM.
>
> I'm not convinced, but it doesn't mean your point of view is invalid.
> If you fully understand the implications of your design choice and
> document them, I will not object.
>
> All optimizations in v2 were measured step by step. Even that bitmap,
> which might be considered overengineered, brought a readily
> measuarable 4% improvement in memcached throughput on Altra Max
> swapping to Optane:
>
> Using the bitmap (64 KVM PTEs for each call)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Type         Ops/sec     Hits/sec   Misses/sec    Avg. Latency     p50
> Latency     p99 Latency   p99.9 Latency       KB/sec
> -------------------------------------------------------------------------=
---------------------------------------------------
> Sets            0.00          ---          ---             ---
>     ---             ---             ---         0.00
> Gets      1012801.92    431436.92     14965.11         0.06246
> 0.04700         0.16700         4.31900     39635.83
> Waits           0.00          ---          ---             ---
>     ---             ---             ---          ---
> Totals    1012801.92    431436.92     14965.11         0.06246
> 0.04700         0.16700         4.31900     39635.83
>
>
> Not using the bitmap (1 KVM PTEs for each call)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Type         Ops/sec     Hits/sec   Misses/sec    Avg. Latency     p50
> Latency     p99 Latency   p99.9 Latency       KB/sec
> -------------------------------------------------------------------------=
---------------------------------------------------
> Sets            0.00          ---          ---             ---
>     ---             ---             ---         0.00
> Gets       968210.02    412443.85     14303.89         0.06517
> 0.04700         0.15900         7.42300     37890.74
> Waits           0.00          ---          ---             ---
>     ---             ---             ---          ---
> Totals     968210.02    412443.85     14303.89         0.06517
> 0.04700         0.15900         7.42300     37890.74
>
>
> FlameGraphs with bitmap (1.svg) and without bitmap (2.svg) attached.
>
> What I don't think is acceptable is simplifying those optimizations
> out without documenting your justifications (I would even call it a
> design change, rather than simplification, from v3 to v4).

I'll put back something similar to what you had before (like a
test_clear_young() with a "fast" parameter instead of "bitmap"). I
like the idea of having a new mmu notifier, like
fast_test_clear_young(), while leaving test_young() and clear_young()
unchanged (where "fast" means "prioritize speed over accuracy"). It
seems a little more straightforward that way.

>
> > For look-around at eviction time:
> > - v4: done if the main mm PTE was young and no MMU notifiers are subscr=
ibed.
> > - v2/v3: done if the main mm PTE was young or (the SPTE was young and
> > the MMU notifier was lockless/fast).
>
> The host and secondary MMUs are two *independent* cases, IMO:
> 1. lookaround the host MMU if the PTE mapping the folio under reclaim is =
young.
> 2. lookaround the secondary MMU if it can be done locklessly.
>
> So the v2/v3 behavior sounds a lot more reasonable to me.

I'll restore the v2/v3 behavior. I initially removed it because,
without batching, we (mostly) lose the spatial locality that, IIUC,
look-around is designed to exploit.

>
> Also a nit -- don't use 'else' in the following case (should_look_around(=
)):
>
>   if (foo)
>     return bar;
>   else
>     do_something();

Oh, yes, sorry. I wrote and rewrote should_look_around() quite a few
times while trying to figure out what made sense in a no-batching
series. I'll fix this.

>
> > I made this logic change as part of removing batching.
> >
> > I'd really appreciate guidance on what the correct thing to do is.
> >
> > In my mind, what would work great is: by default, do aging exactly
> > when KVM can do it locklessly, and then have a Kconfig to always have
> > MGLRU to do aging with KVM if a user really cares about proactive
> > reclaim (when the feature bit is set). The selftest can check the
> > Kconfig + feature bit to know for sure if aging will be done.
>
> I still don't see how that Kconfig helps. Or why the new static branch
> isn't enough?

Without a special Kconfig, the feature bit just tells us that aging
with KVM is possible, not that it will necessarily be done. For the
self-test, it'd be good to know exactly when aging is being done or
not, so having a Kconfig like LRU_GEN_ALWAYS_WALK_SECONDARY_MMU would
help make the self-test set the right expectations for aging.

The Kconfig would also allow a user to know that, no matter what,
we're going to get correct age data for VMs, even if, say, we're using
the shadow MMU. This is somewhat important for me/Google Cloud. Is
that reasonable? Maybe there's a better solution.
