Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D394E6A104D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 20:12:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN2hr5QsZz3cj8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 06:12:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=illZ3Rsx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3alr3ywykdoevhdqmfjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=illZ3Rsx;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN2gx06wjz2xJ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 06:11:39 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536bfec4a66so139238917b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 11:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lgz23S0KW/3Vuh8fPybY+EaMWzwQFtPo75lQKh/z++I=;
        b=illZ3Rsxhz/9jljbLI+FUdfsGaNHQ+3fywMFYtiPdi4y1cf10XY7ukC5ghyLXOpRiX
         ECKpfvO4XF3GMAEqQtGTGUg1jqO+AbRdSqGFpyrvz1Y54kJ0qEPuz3ERkD1mNPRjChGr
         FIk8fspffno+cxbJIVBWXLSAjcURDSQfT0pVMLjA9MwRSCOas0U4UaV//I6oaWp4/jP8
         Nedf5FJP2yTEdqt4rNWa/GGGRcnTa9xaHgSx+sUBPJmKn+5OuioGUbjEJBaVHxmxHjpR
         JfrWlzWMnyD8o2vHK884xzIW6y4U6nk3QsjYBj1PHqc/oR+/TNHECEU3hASerxLBXfzT
         1/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lgz23S0KW/3Vuh8fPybY+EaMWzwQFtPo75lQKh/z++I=;
        b=gZ869AF8P0yn+ps4tYKqvcW2hLvZgAv8Ph5TxEuH5bYfHhjtIPIO2LZ5Zu8BzfB4T0
         4fqoGFe711BIAl67TedlMC0JjzqMBJ/5RqlhYbFawVWTvN2WEPpVcOnCoJyAppjz4agu
         UmirOKYErYOlTTd7FlrLZqGz8Szn/nx97oAWCrN7CPZhYdVXVAzgftoe9z0c/Kwq069f
         jK1zKhQp5a9lzr7CGJTDOoNpcdXJGmRGILH2FjQxv5jELdzN4hk0/mu1KQI6kVmxC7Hp
         Wn3CoKShwFpmfkRVRbmxYbzgSvAbXmdTpnmJE4YGiLuTZteqUivfY//KlE592TRIcb6m
         gB+Q==
X-Gm-Message-State: AO0yUKX10PJV087jVBNjgjPxOiRnz10joa2mS7DzEc2Kmkn9LdG8IScM
	FcIEBOxZLJDmHGVCeMFXlMPYyZLJUBA=
X-Google-Smtp-Source: AK7set9CAvBzEvzau8o9w7k/cYlwu85gWQxy7MQm2EeJKeyL2LgEayAQYJRKvwtnPY5l/Yt7cVb6SpmQxus=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a5b:50b:0:b0:a36:3875:564a with SMTP id
 o11-20020a5b050b000000b00a363875564amr1021123ybp.2.1677179496807; Thu, 23 Feb
 2023 11:11:36 -0800 (PST)
Date: Thu, 23 Feb 2023 11:11:35 -0800
In-Reply-To: <CAOUHufbAKpv95k6rVedstjD_7JzP0RrbOD652gyZh2vbAjGPOg@mail.gmail.com>
Mime-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-6-yuzhao@google.com>
 <Y/elw7CTvVWt0Js6@google.com> <CAOUHufbAKpv95k6rVedstjD_7JzP0RrbOD652gyZh2vbAjGPOg@mail.gmail.com>
Message-ID: <Y/e6Z+KIl6sYJoRg@google.com>
Subject: Re: [PATCH mm-unstable v1 5/5] mm: multi-gen LRU: use mmu_notifier_test_clear_young()
From: Sean Christopherson <seanjc@google.com>
To: Yu Zhao <yuzhao@google.com>
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
Cc: linux-mm@google.com, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023, Yu Zhao wrote:
> On Thu, Feb 23, 2023 at 10:43=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
> >
> > On Thu, Feb 16, 2023, Yu Zhao wrote:
> > >   kswapd (MGLRU before)
> > >     100.00%  balance_pgdat
> > >       100.00%  shrink_node
> > >         100.00%  shrink_one
> > >           99.97%  try_to_shrink_lruvec
> > >             99.06%  evict_folios
> > >               97.41%  shrink_folio_list
> > >                 31.33%  folio_referenced
> > >                   31.06%  rmap_walk_file
> > >                     30.89%  folio_referenced_one
> > >                       20.83%  __mmu_notifier_clear_flush_young
> > >                         20.54%  kvm_mmu_notifier_clear_flush_young
> > >   =3D>                      19.34%  _raw_write_lock
> > >
> > >   kswapd (MGLRU after)
> > >     100.00%  balance_pgdat
> > >       100.00%  shrink_node
> > >         100.00%  shrink_one
> > >           99.97%  try_to_shrink_lruvec
> > >             99.51%  evict_folios
> > >               71.70%  shrink_folio_list
> > >                 7.08%  folio_referenced
> > >                   6.78%  rmap_walk_file
> > >                     6.72%  folio_referenced_one
> > >                       5.60%  lru_gen_look_around
> > >   =3D>                    1.53%  __mmu_notifier_test_clear_young
> >
> > Do you happen to know how much of the improvement is due to batching, a=
nd how
> > much is due to using a walkless walk?
>=20
> No. I have three benchmarks running at the moment:
> 1. Windows SQL server guest on x86 host,
> 2. Apache Spark guest on arm64 host, and
> 3. Memcached guest on ppc64 host.
>=20
> If you are really interested in that, I can reprioritize -- I need to
> stop 1) and use that machine to get the number for you.

After looking at the "MGLRU before" stack again, it's definitely worth gett=
ing
those numbers.  The "before" isn't just taking mmu_lock, it's taking mmu_lo=
ck for
write _and_ flushing remote TLBs on _every_ PTE.  I suspect the batching is=
 a
tiny percentage of the overall win (might be larger with RETPOLINE and frie=
nds),
and that the bulk of the improvement comes from avoiding the insanity of
kvm_mmu_notifier_clear_flush_young().

Speaking of which, what would it take to drop mmu_notifier_clear_flush_youn=
g()
entirely?  I.e. why can MGLRU tolerate stale information but !MGLRU cannot?=
  If
we simply deleted mmu_notifier_clear_flush_young() and used mmu_notifier_cl=
ear_young()
instead, would anyone notice, let alone care?

> > > @@ -5699,6 +5797,9 @@ static ssize_t show_enabled(struct kobject *kob=
j, struct kobj_attribute *attr, c
> > >       if (arch_has_hw_nonleaf_pmd_young() && get_cap(LRU_GEN_NONLEAF_=
YOUNG))
> > >               caps |=3D BIT(LRU_GEN_NONLEAF_YOUNG);
> > >
> > > +     if (kvm_arch_has_test_clear_young() && get_cap(LRU_GEN_SPTE_WAL=
K))
> > > +             caps |=3D BIT(LRU_GEN_SPTE_WALK);
> >
> > As alluded to in patch 1, unless batching the walks even if KVM does _n=
ot_ support
> > a lockless walk is somehow _worse_ than using the existing mmu_notifier=
_clear_flush_young(),
> > I think batching the calls should be conditional only on LRU_GEN_SPTE_W=
ALK.  Or
> > if we want to avoid batching when there are no mmu_notifier listeners, =
probe
> > mmu_notifiers.  But don't call into KVM directly.
>=20
> I'm not sure I fully understand. Let's present the problem on the MM
> side: assuming KVM supports lockless walks, batching can still be
> worse (very unlikely), because GFNs can exhibit no memory locality at
> all. So this option allows userspace to disable batching.

I'm asking the opposite.  Is there a scenario where batching+lock is worse =
than
!batching+lock?  If not, then don't make batching depend on lockless walks.

> I fully understand why you don't want MM to call into KVM directly. No
> acceptable ways to set up a clear interface between MM and KVM other
> than the MMU notifier?

There are several options I can think of, but before we go spend time desig=
ning
the best API, I'd rather figure out if we care in the first place.
