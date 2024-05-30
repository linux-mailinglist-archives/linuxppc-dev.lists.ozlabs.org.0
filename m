Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB5C8D42C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 03:16:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cB+56OzU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqSp653bkz7BPc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 11:09:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cB+56OzU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=jthoughton@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqSnK0ddWz7B1l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 11:08:52 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-43f87dd6866so167851cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 18:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717031324; x=1717636124; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNCYiTPJ+jmwqf05JMT+AdSr7J72TbIz2CKFhve3Jy0=;
        b=cB+56OzURiwvmPcYwpspUZgSFvWAwElWi5/wTBwRGem/yURsTzy1pgrgVheqOtbXIP
         P9KRD1fgSAsduDOlGamXIdQ5pJwYWVItpWWtewR0LAJZBySA1iF3DlagJ4988RnyfIpQ
         xk1lg/SCysZ72Zqbr+5bQdhFsh3xiWSU8Qd6vtYnPpqrmiZU2ww4fXOFWZOMXrrmE3YR
         Ifpm2pxdkHvd7yMq9DGksloYQXadSLfDJzhCcQKsrEsA+JklRci+qa2JFVASRBNPCr06
         XUZLlhpTIQbJ5x8psk8NQ3oyPL6YY3cpzN53Bnb1/ELTxOazdxk9QeRQRFd6S9z+VimJ
         Nx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717031324; x=1717636124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNCYiTPJ+jmwqf05JMT+AdSr7J72TbIz2CKFhve3Jy0=;
        b=vxFWrkH/bl3vJgXeiOTw8WG3vxuyEBJjyqbpzWVgoay6vzluwVlGLQzu5NxnzFKLBa
         zKk9P3hsZj4g2EEvziKVjIhNb8JoVgwg05dbYIpxTai9dXuFzN4yvjPSGJxutA+Nvk77
         1F/snFE3HlN9/5zrrEGYKWlI+vWGXdsZhNdSfgC0FW18ZG7zrPHZ+lgWHc12Rj5bP2br
         l6Ar8svdb37+8XBCJU5KLMN1bdTs+rZwn4s7B0tIGozsQqJf6ZosOAGjEkuhGF6mF4y+
         3Dnv6pJ+PCkOXwgSbuPoH3R4xju1vgPMY6/sBGPlbsIkpS3hOUujGDGkjPqLpNXH6Til
         SMnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoj4fPvJVfpoXneFstbwSLSQjIhyj5w/ZARtzvZN265GAkSxGHMgPLmEyHqPncKtyk2F0nmLkNwUtEJ43c1foDu/8MXQ7UZeztXh9nNw==
X-Gm-Message-State: AOJu0YzDalGibcwqkcxXOm+jBpM6R/J+xU89uZEb3i0kdzC2pZkNClJq
	wMfKuxcgE26nCQLvQabdFCajXMSBy9HtvSOXO3AEi0yARnK1y76z+tSOi2Dpfhnb/jtAuKP+yb7
	3ezylC4tV82+SodjDefD4zX56RLpGzCXl/E+a
X-Google-Smtp-Source: AGHT+IFJBPRQlkDyYJeSsGM/RxiiiLg1VsLLsha8SGwYsobiZXs39Abfff+lsGr1GDYLgVu96Cm8k7GvNnaVZDK3Ruk=
X-Received: by 2002:a05:622a:5509:b0:43b:6b6:8cad with SMTP id
 d75a77b69052e-43fe8e0b1dfmr1268341cf.10.1717031323987; Wed, 29 May 2024
 18:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com>
In-Reply-To: <Zley-u_dOlZ-S-a6@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 29 May 2024 18:08:06 -0700
Message-ID: <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
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

On Wed, May 29, 2024 at 3:58=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, May 29, 2024, Yu Zhao wrote:
> > On Wed, May 29, 2024 at 3:59=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > On Wed, May 29, 2024, Yu Zhao wrote:
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
> > > IIUC, by "existing approach" you mean completely ignore secondary MMU=
s that
> > > don't implement a lockless walk?
> >
> > No, the existing approach only checks secondary MMUs for LRU folios,
> > i.e., those at the end of the LRU list. It might not find the best
> > candidates (the coldest ones) on the entire list, but it doesn't pay
> > as much for the locking. MGLRU can *optionally* scan MMUs (secondary
> > included) to find the best candidates, but it can only be a win if the
> > scanning incurs a relatively low overhead, e.g., done locklessly for
> > the secondary MMU. IOW, this is a balance between the cost of
> > reclaiming not-so-cold (warm) folios and that of finding the coldest
> > folios.
>
> Gotcha.
>
> I tend to agree with Yu, driving the behavior via a Kconfig may generate =
simpler
> _code_, but I think it increases the overall system complexity.  E.g. dis=
tros
> will likely enable the Kconfig, and in my experience people using KVM wit=
h a
> distro kernel usually aren't kernel experts, i.e. likely won't know that =
there's
> even a decision to be made, let alone be able to make an informed decisio=
n.
>
> Having an mmu_notifier hook that is conditionally implemented doesn't see=
m overly
> complex, e.g. even if there's a runtime aspect at play, it'd be easy enou=
gh for
> KVM to nullify its mmu_notifier hook during initialization.  The hardest =
part is
> likely going to be figuring out the threshold for how much overhead is to=
o much.

Hi Yu, Sean,

Perhaps I "simplified" this bit of the series a little bit too much.
Being able to opportunistically do aging with KVM (even without
setting the Kconfig) is valuable.

IIUC, we have the following possibilities:
- v4: aging with KVM is done if the new Kconfig is set.
- v3: aging with KVM is always done.
- v2: aging with KVM is done when the architecture reports that it can
probably be done locklessly, set at KVM MMU init time.
- Another possibility?: aging with KVM is only done exactly when it
can be done locklessly (i.e., mmu_notifier_test/clear_young() called
such that it will not grab any locks).

I like the v4 approach because:
1. We can choose whether or not to do aging with KVM no matter what
architecture we're using (without requiring userspace be aware to
disable the feature at runtime with sysfs to avoid regressing
performance if they don't care about proactive reclaim).
2. If we check the new feature bit (0x8) in sysfs, we can know for
sure if aging is meant to be working or not. The selftest changes I
made won't work properly unless there is a way to be sure that aging
is working with KVM.

For look-around at eviction time:
- v4: done if the main mm PTE was young and no MMU notifiers are subscribed=
.
- v2/v3: done if the main mm PTE was young or (the SPTE was young and
the MMU notifier was lockless/fast).

I made this logic change as part of removing batching.

I'd really appreciate guidance on what the correct thing to do is.

In my mind, what would work great is: by default, do aging exactly
when KVM can do it locklessly, and then have a Kconfig to always have
MGLRU to do aging with KVM if a user really cares about proactive
reclaim (when the feature bit is set). The selftest can check the
Kconfig + feature bit to know for sure if aging will be done.

I'm not sure what the exact right thing to do for look-around is.

Thanks for the quick feedback.
