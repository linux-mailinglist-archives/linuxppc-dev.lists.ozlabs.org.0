Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF5B8FA633
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 01:03:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VLQYa8B5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtTmm0xgyz3d88
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 09:03:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VLQYa8B5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3q0tezgykdpqoawjfyckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtTlz6LXLz3cWv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 09:03:10 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1f6582eca2bso20013785ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2024 16:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717455788; x=1718060588; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0SJTxFtK/1G56YdHzcPYdHV7zjy1ZVa0L4hU78kSrI=;
        b=VLQYa8B5EOdp9sBbxFFkktIPgnOLpsJmTKOmyIipOauInO0xuQPLlqLlaciQHg4qba
         6qGbRYMRVtV8N4kBKO1RFqC37a/E1rSnTH2TLwHiLtYFOPjuaItBLZpP0rLWamuWNaL+
         CnKKDG2t89l7ifK3nAP/gJa1YeVanyRigjAlTBVjmy7ZFdOTcaSF6Oxg8p+LAkJBpXlH
         hZjwkwPQo509Ja9sbweq9BcR/MoIMvd8y27uR8Petz0V3hFDwC/FsDoBskB6KW935wTN
         cxHX1sfSu9mWP9rFxl3QCOVuOpdEs6y3VcxmuC7U3VsKlLOD3eyjtgN5oD85c2/siksK
         jitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717455788; x=1718060588;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w0SJTxFtK/1G56YdHzcPYdHV7zjy1ZVa0L4hU78kSrI=;
        b=ld3Lzpr+NqATNxNYOBX6qsSODKqde//U00Biyt+ZjFolYI6LsVQvG2mgdmmonVHhow
         KQ6FhHI3He0BrXRosu9poumFKzQ03beCWbDAi4tNvcHavkZYBcgqpF/O1x0uzVzCRefX
         OAaWav7c3KouXzstQLGMCT1/XE8p2euQevQgRro9AJDTfraIYjDtP9Ci+ed1oe9d5wIK
         n2CyT9Rkh1OyHxQM+/+iGok1Oicn375TKPieJapvbNeUF8QsY/cCp1DlFCJp2YRxU53K
         s8JDHrhkfl50sc4n60mbCZZeBNr/WpwmUCWPSxCcu47KU/HFdx60Dr6O6Mst39PqnYe7
         6t9A==
X-Forwarded-Encrypted: i=1; AJvYcCW4+Z3irfuZVKJXgY4RnyUlIZJHTFU879/0dYdqKBtgy30cosmVbHRUI7ovJfNg2h7GbqXoDo+KfKbAO1BDbJn+w1YlNNUMHBvO6dSNMg==
X-Gm-Message-State: AOJu0Yy0INyeV29Ba2L8pEOOQXMfjUVo5EhDKy3+0EyVpiCwPL4q0mY4
	Hb32yyLb6IrusbC/vNjbH7cep4n2oMilOrDy44DCiNPBDkfoQUuxhrzUEqssR81ovwVxr4Reoyw
	RGg==
X-Google-Smtp-Source: AGHT+IH9puzU5V8aMTwgzoabUylaHv5IhJEL6Kgk0jFfHrRaPIZ6XCL4YZWlIMRWpWZxlsRoR1ZSqKiiwm0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ea05:b0:1f6:3891:794a with SMTP id
 d9443c01a7336-1f638917b67mr7110545ad.10.1717455787406; Mon, 03 Jun 2024
 16:03:07 -0700 (PDT)
Date: Mon, 3 Jun 2024 16:03:05 -0700
In-Reply-To: <CADrL8HW44Hx_Ejx_6+FVKt1V17PdgT6rw+sNtKzumqc9UCVDfA@mail.gmail.com>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com> <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com> <CADrL8HW44Hx_Ejx_6+FVKt1V17PdgT6rw+sNtKzumqc9UCVDfA@mail.gmail.com>
Message-ID: <Zl5LqcusZ88QOGQY@google.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="utf-8"
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

On Mon, Jun 03, 2024, James Houghton wrote:
> On Thu, May 30, 2024 at 11:06=E2=80=AFPM Yu Zhao <yuzhao@google.com> wrot=
e:
> > What I don't think is acceptable is simplifying those optimizations
> > out without documenting your justifications (I would even call it a
> > design change, rather than simplification, from v3 to v4).
>=20
> I'll put back something similar to what you had before (like a
> test_clear_young() with a "fast" parameter instead of "bitmap"). I
> like the idea of having a new mmu notifier, like
> fast_test_clear_young(), while leaving test_young() and clear_young()
> unchanged (where "fast" means "prioritize speed over accuracy").

Those two statements are contradicting each other, aren't they?  Anyways, I=
 vote
for a "fast only" variant, e.g. test_clear_young_fast_only() or so.  gup() =
has
already established that terminology in mm/, so hopefully it would be famil=
iar
to readers.  We could pass a param, but then the MGLRU code would likely en=
d up
doing a bunch of useless indirect calls into secondary MMUs, whereas a dedi=
cated
hook allows implementations to nullify the pointer if the API isn't support=
ed
for whatever reason.

And pulling in Oliver's comments about locking, I think it's important that=
 the
mmu_notifier API express it's requirement that the operation be "fast", not=
 that
it be lockless.  E.g. if a secondary MMU can guarantee that a lock will be
contented only in rare, slow cases, then taking a lock is a-ok.  Or a secon=
dary
MMU could do try-lock and bail if the lock is contended.

That way KVM can honor the intent of the API with an implementation that wo=
rks
best for KVM _and_ for MGRLU.  I'm sure there will be future adjustments an=
d fixes,
but that's just more motivation for using something like "fast only" instea=
d of
"lockless".

> > > I made this logic change as part of removing batching.
> > >
> > > I'd really appreciate guidance on what the correct thing to do is.
> > >
> > > In my mind, what would work great is: by default, do aging exactly
> > > when KVM can do it locklessly, and then have a Kconfig to always have
> > > MGLRU to do aging with KVM if a user really cares about proactive
> > > reclaim (when the feature bit is set). The selftest can check the
> > > Kconfig + feature bit to know for sure if aging will be done.
> >
> > I still don't see how that Kconfig helps. Or why the new static branch
> > isn't enough?
>=20
> Without a special Kconfig, the feature bit just tells us that aging
> with KVM is possible, not that it will necessarily be done. For the
> self-test, it'd be good to know exactly when aging is being done or
> not, so having a Kconfig like LRU_GEN_ALWAYS_WALK_SECONDARY_MMU would
> help make the self-test set the right expectations for aging.
>=20
> The Kconfig would also allow a user to know that, no matter what,
> we're going to get correct age data for VMs, even if, say, we're using
> the shadow MMU.

Heh, unless KVM flushes, you won't get "correct" age data.

> This is somewhat important for me/Google Cloud. Is that reasonable? Maybe
> there's a better solution.

Hmm, no?  There's no reason to use a Kconfig, e.g. if we _really_ want to p=
rioritize
accuracy over speed, then a KVM (x86?) module param to have KVM walk nested=
 TDP
page tables would give us what we want.

But before we do that, I think we need to perform due dilegence (or provide=
 data)
showing that having KVM take mmu_lock for write in the "fast only" API prov=
ides
better total behavior.  I.e. that the additional accuracy is indeed worth t=
he cost.
