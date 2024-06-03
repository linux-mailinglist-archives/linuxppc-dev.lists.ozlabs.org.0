Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B27598FA657
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 01:18:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SxaqibJz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtV546N31z3dD1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 09:18:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SxaqibJz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=jthoughton@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtV4L3MQPz3cBN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 09:17:21 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-43fe3289fc5so57821cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2024 16:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717456638; x=1718061438; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDykUGLfvL3M1lWs+oKStYngTbEIAr5rRwVrwRKKurY=;
        b=SxaqibJztEN4X7L3lI1thpiBaK9TT42H4yisTOz3/jLyzl3AmAkcKPYQsprNWi2Pgq
         GkAT8SNMdKxnYawU8QrJ1Lp42gIL084e1XfI8LijvKswDusYUVL45Lvx4R4sXNZIgMjW
         P9Ucd+kcmUnhD5yF9nSdpoJEteen68R6l851Vl2I8mPlxHnaGBJi5yWZkJK8eKdD4TeA
         j9bw3UwL901+kDjo6SOvtzZTaVNDnmApSaSdgTTkNt82i5vUkB1GAr7gXh6fC3ZbWW5b
         YXGxqJaC57GqjjuI9zoHMVBCoB2VQZmAkhov7i4XgThtpo5P4lD3P6ZSiSmffBT1de3S
         P8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717456638; x=1718061438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDykUGLfvL3M1lWs+oKStYngTbEIAr5rRwVrwRKKurY=;
        b=ttKQ78wZTra3XGv2t7kovbMwhb4siEFQpOvbNgpxo06BvZr8Zhux2s+1U97FMm/axR
         MefSFKs/JW+B5nIjhRLBrf2X00zsz7TWEoKVcqbpLsnPQyZbDPy3zXFotbTP7UY/z0VK
         XNc2WaCJWywmdbtdcFHr2UjQeO54oYfhSJGrNmUJSvS8An2VSIYv13u4aoeNRQGjyCru
         6Rfs7QOto9Jge7aOR1YTR3iHO4zmtvkMn3X8WLAEpEeBvY4lfCB5ZLKukbSIF5DI2amW
         XmVg7dSuTcv8oue2Ajrt71EzTpN5ij8M1Na6eOK8fbldh7+RnCeivN7pvssG9YdCP/5F
         GmQg==
X-Forwarded-Encrypted: i=1; AJvYcCVN6m16en5tWRq8eR06WHD96f/get/dP28KIdfjBje8IZZ8nWT6wQmoKAqs6pxzvr/CEtEaTwB5EjDXyWV+KrF5jBwj1uRUhnIXfxkGBA==
X-Gm-Message-State: AOJu0YyNY4ARRkV0Ie3f6StgNMiki2PMxfyWp+puT8UUPH2O4ZFtWAf2
	V+LnCu+h0d4I14+Jl/1N4Z6/W3bRRXic3HPEFX5lYvieMwvoAvHrAdvaB/cSARyzThLYuwoVYlv
	sXNvWEGuGGoH8ERl1oobwe5jdA8i00M5xZfMS
X-Google-Smtp-Source: AGHT+IERlDy+7BDKGdKU12nHNHCd2TlJ06DKBFhjKpTdcIQ5T8pyrt6cuvlCSmsOxFEEGgqtt5PP7LKTO7CDtdLxk+8=
X-Received: by 2002:a05:622a:4ccc:b0:43a:aa3f:917a with SMTP id
 d75a77b69052e-4401e68c145mr1144381cf.27.1717456637692; Mon, 03 Jun 2024
 16:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com> <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com>
 <CADrL8HW44Hx_Ejx_6+FVKt1V17PdgT6rw+sNtKzumqc9UCVDfA@mail.gmail.com> <Zl5LqcusZ88QOGQY@google.com>
In-Reply-To: <Zl5LqcusZ88QOGQY@google.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 3 Jun 2024 16:16:41 -0700
Message-ID: <CADrL8HU734C_OQhzszWJWMXEXLN6HkBo4yweN2fX4BbOegXrFA@mail.gmail.com>
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, David Rientjes <rientjes@google.com>, Zenghui Yu <yuzenghui@huawei.com>, Axel Rasmussen <axelrasmussen@google.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, David Matlack <dmatlack@google.com>, Palmer Dabbelt <palmer@dabbelt.com
 >, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Ankit Agrawal <ankita@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 3, 2024 at 4:03=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Mon, Jun 03, 2024, James Houghton wrote:
> > On Thu, May 30, 2024 at 11:06=E2=80=AFPM Yu Zhao <yuzhao@google.com> wr=
ote:
> > > What I don't think is acceptable is simplifying those optimizations
> > > out without documenting your justifications (I would even call it a
> > > design change, rather than simplification, from v3 to v4).
> >
> > I'll put back something similar to what you had before (like a
> > test_clear_young() with a "fast" parameter instead of "bitmap"). I
> > like the idea of having a new mmu notifier, like
> > fast_test_clear_young(), while leaving test_young() and clear_young()
> > unchanged (where "fast" means "prioritize speed over accuracy").
>
> Those two statements are contradicting each other, aren't they?

I guess it depends on how you define "similar". :)

> Anyways, I vote
> for a "fast only" variant, e.g. test_clear_young_fast_only() or so.  gup(=
) has
> already established that terminology in mm/, so hopefully it would be fam=
iliar
> to readers.  We could pass a param, but then the MGLRU code would likely =
end up
> doing a bunch of useless indirect calls into secondary MMUs, whereas a de=
dicated
> hook allows implementations to nullify the pointer if the API isn't suppo=
rted
> for whatever reason.
>
> And pulling in Oliver's comments about locking, I think it's important th=
at the
> mmu_notifier API express it's requirement that the operation be "fast", n=
ot that
> it be lockless.  E.g. if a secondary MMU can guarantee that a lock will b=
e
> contented only in rare, slow cases, then taking a lock is a-ok.  Or a sec=
ondary
> MMU could do try-lock and bail if the lock is contended.
>
> That way KVM can honor the intent of the API with an implementation that =
works
> best for KVM _and_ for MGRLU.  I'm sure there will be future adjustments =
and fixes,
> but that's just more motivation for using something like "fast only" inst=
ead of
> "lockless".

Yes, thanks, this is exactly what I meant. I really should have "only"
in the name to signify that it is a requirement that it be fast.
Thanks for wording it so clearly.

>
> > > > I made this logic change as part of removing batching.
> > > >
> > > > I'd really appreciate guidance on what the correct thing to do is.
> > > >
> > > > In my mind, what would work great is: by default, do aging exactly
> > > > when KVM can do it locklessly, and then have a Kconfig to always ha=
ve
> > > > MGLRU to do aging with KVM if a user really cares about proactive
> > > > reclaim (when the feature bit is set). The selftest can check the
> > > > Kconfig + feature bit to know for sure if aging will be done.
> > >
> > > I still don't see how that Kconfig helps. Or why the new static branc=
h
> > > isn't enough?
> >
> > Without a special Kconfig, the feature bit just tells us that aging
> > with KVM is possible, not that it will necessarily be done. For the
> > self-test, it'd be good to know exactly when aging is being done or
> > not, so having a Kconfig like LRU_GEN_ALWAYS_WALK_SECONDARY_MMU would
> > help make the self-test set the right expectations for aging.
> >
> > The Kconfig would also allow a user to know that, no matter what,
> > we're going to get correct age data for VMs, even if, say, we're using
> > the shadow MMU.
>
> Heh, unless KVM flushes, you won't get "correct" age data.
>
> > This is somewhat important for me/Google Cloud. Is that reasonable? May=
be
> > there's a better solution.
>
> Hmm, no?  There's no reason to use a Kconfig, e.g. if we _really_ want to=
 prioritize
> accuracy over speed, then a KVM (x86?) module param to have KVM walk nest=
ed TDP
> page tables would give us what we want.
>
> But before we do that, I think we need to perform due dilegence (or provi=
de data)
> showing that having KVM take mmu_lock for write in the "fast only" API pr=
ovides
> better total behavior.  I.e. that the additional accuracy is indeed worth=
 the cost.

That sounds good to me. I'll drop the Kconfig. I'm not really sure
what to do about the self-test, but that's not really all that
important.
