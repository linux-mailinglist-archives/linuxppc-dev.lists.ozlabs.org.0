Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F176A01A6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 05:00:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMfSH5wQKz3cK6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 15:00:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=V4Q5l6WL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e33; helo=mail-vs1-xe33.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=V4Q5l6WL;
	dkim-atps=neutral
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMfRP0fsGz3bhH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 14:59:27 +1100 (AEDT)
Received: by mail-vs1-xe33.google.com with SMTP id f31so13018713vsv.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 19:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677124763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H32nxJKYLFgX94VN5oR58FHUZwCnE+gpSinuTrZzCc0=;
        b=V4Q5l6WLAj/WwxnVZRzvheA/iOME8vS7OMCgLQWsVt/tZ1p+FehahQQjYkfBEwnn5l
         TKqvMJ4ouOnvNtwLpkdvRKTTNQhJdK8GWjwAgSM5gu2EhnU0opER4l31mwe55domXE0w
         Hh/RGdOf2a1K2z7Re8lyE0yCVzCTzILxkZUcQXewKdfJ3nDh+Cx8jTMdJZGQX0pZkZUY
         4CAifutvKd9vpOwllaoBeMHWTAZ8SHL+wtWN3Q2twnpq3HAsmolU0vVpaO0k7gzLbvmc
         s3sDmxNfwKOsOYTnd2jaudx9jqxs70BYLlpqGNm2hwnZxrqrv9nxqoKIAVBvW5yE8AKf
         bHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677124763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H32nxJKYLFgX94VN5oR58FHUZwCnE+gpSinuTrZzCc0=;
        b=eXSR2n7nV4YDE9ulLeMsePQPMzHNCBxfuKXLCNQg5xcvp4+YzlJ/YzL/3mVhyaPEQE
         +XsJNYimNzmQ1X8AEaKZ9iYy087sSGZ69FSECMM7S6U98Vg5+vV05sDGJaCWpyTB6M0Y
         cnwxkVRly9TlmeGknnPtKqGELMr4l2uf/tuA6FiAMhdoayAbPc6HkOU2pyr3Ww2rrK0e
         +txfyyUGy0uoTuOC63vK3RkYnm2jPnWMADLZ/wOvNpNG356m9EZ2ErZoKgZMO2cQBXNF
         c2JD0mw7qZPOdH+ZPO3rX5eedBZPBZfEQTmgdTngS6ohV+qihYKw4s0UiibcycVHUYFD
         NbUA==
X-Gm-Message-State: AO0yUKWsRNSx5ldtkGfWCVkpuxIG8JMjGKMREfoJtnBvel7mHMM+Ajw3
	CXZh/fkH5cwFZhl5DXf1wYbqUisdtyuvDPcenFcX7g==
X-Google-Smtp-Source: AK7set8d4Kt8nwIvSPEaytrIpcGaTkhsSfI3kbZZEBvM/1NXFxRlVl/iWmVtGErpsTF5b/RMhuHUh6LwD5LpoKFSFjM=
X-Received: by 2002:a1f:aa41:0:b0:412:948:73ff with SMTP id
 t62-20020a1faa41000000b00412094873ffmr143108vke.13.1677124763494; Wed, 22 Feb
 2023 19:59:23 -0800 (PST)
MIME-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-4-yuzhao@google.com>
 <CAOUHufYSx-edDVCZSauOzwOJG6Av0++0TFT4ko8qWq7vLi_mjw@mail.gmail.com> <86lekwy8d7.wl-maz@kernel.org>
In-Reply-To: <86lekwy8d7.wl-maz@kernel.org>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 22 Feb 2023 20:58:47 -0700
Message-ID: <CAOUHufbbs2gG+DPvSOw_N_Kx7FWdZvpdJUvLzko-BDQ8vfd6Xg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 3/5] kvm/arm64: add kvm_arch_test_clear_young()
To: Marc Zyngier <maz@kernel.org>
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
Cc: linux-mm@google.com, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 17, 2023 at 2:00=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Fri, 17 Feb 2023 04:21:28 +0000,
> Yu Zhao <yuzhao@google.com> wrote:
> >
> > On Thu, Feb 16, 2023 at 9:12 PM Yu Zhao <yuzhao@google.com> wrote:
> > >
> > > This patch adds kvm_arch_test_clear_young() for the vast majority of
> > > VMs that are not pKVM and run on hardware that sets the accessed bit
> > > in KVM page tables.
>
> I'm really interested in how you can back this statement. 90% of the
> HW I have access to is not FEAT_HWAFDB capable, either because it
> predates the feature or because the feature is too buggy to be useful.

This is my expericen too -- most devices are pre v8.2.

> Do you have numbers?

Let's do a quick market survey by segment. The following only applies
to ARM CPUs:

1. Phones: none of the major Android phone vendors sell phones running
VMs; no other major Linux phone vendors.
2. Laptops: only a very limited number of Chromebooks run VMs, namely
ACRVM. No other major Linux laptop vendors.
3. Desktops: no major Linux desktop vendors.
4. Embedded/IoT/Router: no major Linux vendors run VMs (Android Auto
can be a VM guest on QNX host).
5. Cloud: this is where the vast majority VMs come from. Among the
vendors available to the general public, Ampere is the biggest player.
Here [1] is a list of its customers. The A-bit works well even on its
EVT products (Neoverse cores).

[1] https://en.wikipedia.org/wiki/Ampere_Computing

> > > It relies on two techniques, RCU and cmpxchg, to safely test and clea=
r
> > > the accessed bit without taking the MMU lock. The former protects KVM
> > > page tables from being freed while the latter clears the accessed bit
> > > atomically against both the hardware and other software page table
> > > walkers.
> > >
> > > Signed-off-by: Yu Zhao <yuzhao@google.com>
> > > ---
> > >  arch/arm64/include/asm/kvm_host.h       |  7 +++
> > >  arch/arm64/include/asm/kvm_pgtable.h    |  8 +++
> > >  arch/arm64/include/asm/stage2_pgtable.h | 43 ++++++++++++++
> > >  arch/arm64/kvm/arm.c                    |  1 +
> > >  arch/arm64/kvm/hyp/pgtable.c            | 51 ++--------------
> > >  arch/arm64/kvm/mmu.c                    | 77 +++++++++++++++++++++++=
+-
> > >  6 files changed, 141 insertions(+), 46 deletions(-)
> >
> > Adding Marc and Will.
> >
> > Can you please add other interested parties that I've missed?
>
> The MAINTAINERS file has it all:
>
> KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)
> M:      Marc Zyngier <maz@kernel.org>
> M:      Oliver Upton <oliver.upton@linux.dev>
> R:      James Morse <james.morse@arm.com>
> R:      Suzuki K Poulose <suzuki.poulose@arm.com>
> R:      Zenghui Yu <yuzenghui@huawei.com>
> L:      kvmarm@lists.linux.dev
>
> May I suggest that you repost your patch and Cc the interested
> parties yourself? I guess most folks will want to see this in context,
> and not as a random, isolated change with no rationale.

This clarified it. Thanks. (I was hesitant to spam people with the
entire series containing changes to other architectures.)
