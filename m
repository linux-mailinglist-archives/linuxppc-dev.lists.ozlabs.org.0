Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E181357D6B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 09:34:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGCgz38fjz3bvZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 17:34:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VPzMe9QU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VPzMe9QU; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGCgY0w3xz304Y
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 17:34:00 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so2688195pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Apr 2021 00:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=b1oLjlIsgitDb5EJtnbTFGlBtjw+XjDzzBBpX2iJwBY=;
 b=VPzMe9QUBkn9qJfqHorOnyqESfqCO0bxrO4dY1yt3RWimBcpjEbEgWdGImU3j0BR3w
 yDEbpzzGqut4358jwhL5xaUnYJaOGYymHonVBB0jNlYsI4H0aodFCLTajF6Ijnba35PA
 k4owITnJswQslKK15oBLvoWmsU5XIu1kynuvvqG5guLzoRS8jqiUJURz2uGd6NG0r2R+
 nous2z5+BTgYscnfh7cbOQhPm16B5HWbJOrJC2lrfJNEaeYMDijNKmwfK4JC+Hx8m9of
 wj9TXgZAaZiyhRAmkH9zW+lfu5c6aMIA9o+4o5jbQ+xsyQYIPq0Ne+4+xV5pMrCq3BsK
 Bc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=b1oLjlIsgitDb5EJtnbTFGlBtjw+XjDzzBBpX2iJwBY=;
 b=iQFgqTvPu7XViJbnNBgGs9RpStexsNCMjTmoo1+NGtulz4bTq3VZzqzmn3/gwaJdzy
 FpsMrHRpRRbbtMSOU3Sygs6t+JcOiLMllnAS6OYegJlCNc45CiljBqKz0wpOxrWRSw8z
 3ZgUr7+5zQReIeUuRzNEkEooAbcFjg+EcJACOiKkGzXMWRq9gL7oY7VJHEWtRP5XcpbA
 JGRgfxDBY5t4Swr7kooc34kBJhj99dbuqts0WZTbI4dR6+WPdj5ZgPHAeJ3svaFY+B9j
 EWw55FU7WstV1AWFfpIX+H2nDM6/4RtvD1OjnJeRlyTdSrDhnxBpjbohIUyMUAe6yBrI
 LXRQ==
X-Gm-Message-State: AOAM532FF9NlufyfRn9pfTSArT7ItLLG8Snv7tBBMYp+QQ0K3u0BfO8f
 xl3VbvV2fWHbkHXBORHl2SY=
X-Google-Smtp-Source: ABdhPJwxD3KihNbb56pJTvytWfoled7A0JyKnIF/FN3FEKfLz1VZiF9auQQMyIIqyJ3zgG76Gh24Kw==
X-Received: by 2002:a17:90a:d350:: with SMTP id
 i16mr7158192pjx.226.1617867237041; 
 Thu, 08 Apr 2021 00:33:57 -0700 (PDT)
Received: from localhost (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id d13sm24310988pgb.6.2021.04.08.00.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 00:33:56 -0700 (PDT)
Date: Thu, 08 Apr 2021 17:33:50 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 00/48] KVM: PPC: Book3S: C-ify the P9 entry/exit code
To: kvm-ppc@vger.kernel.org
References: <20210405011948.675354-1-npiggin@gmail.com>
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
MIME-Version: 1.0
Message-Id: <1617865149.sj1ljwsvhh.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of April 5, 2021 11:19 am:
> Git tree here
>=20
> https://github.com/npiggin/linux/tree/kvm-in-c-v6
>=20

In the interest of making things more managable, I would like to submit=20
some initial things for merge, which have mostly had pretty good review
(I'll repost them in a new series or set of series if there is no
objection, rather than pick from this series).

> Nicholas Piggin (48):
>   KVM: PPC: Book3S HV: Nested move LPCR sanitising to sanitise_hv_regs
>   KVM: PPC: Book3S HV: Add a function to filter guest LPCR bits
>   KVM: PPC: Book3S HV: Disallow LPCR[AIL] to be set to 1 or 2
>   KVM: PPC: Book3S HV: Prevent radix guests setting LPCR[TC]
>   KVM: PPC: Book3S HV: Remove redundant mtspr PSPB
>   KVM: PPC: Book3S HV: remove unused kvmppc_h_protect argument
>   KVM: PPC: Book3S HV: Fix CONFIG_SPAPR_TCE_IOMMU=3Dn default hcalls
>   powerpc/64s: Remove KVM handler support from CBE_RAS interrupts
>   powerpc/64s: remove KVM SKIP test from instruction breakpoint handler
>   KVM: PPC: Book3S HV: Ensure MSR[ME] is always set in guest MSR
>   KVM: PPC: Book3S HV: Ensure MSR[HV] is always clear in guest MSR

1-11 are pretty small, mostly isolated improvements.

>   KVM: PPC: Book3S 64: move KVM interrupt entry to a common entry point
>   KVM: PPC: Book3S 64: Move GUEST_MODE_SKIP test into KVM
>   KVM: PPC: Book3S 64: add hcall interrupt handler
>   KVM: PPC: Book3S 64: Move hcall early register setup to KVM
>   KVM: PPC: Book3S 64: Move interrupt early register setup to KVM
>   KVM: PPC: Book3S 64: move bad_host_intr check to HV handler
>   KVM: PPC: Book3S 64: Minimise hcall handler calling convention
>     differences

12-18 includes all the exception-64s.S <-> KVM API changes required. I=20
think these changes are improvements in their own right, certainly the=20
exception-64s.S side is far nicer.

>   KVM: PPC: Book3S HV P9: Move radix MMU switching instructions together

19 I would like to include because these MMU SPRs have a special=20
relationship that can't just be set in any order. This code is also much=20
better suited to sim and prototyping work for proposed changes to the=20
MMU context switching architecture.

>   KVM: PPC: Book3S HV P9: implement kvmppc_xive_pull_vcpu in C
>   KVM: PPC: Book3S HV P9: Move xive vcpu context management into
>     kvmhv_p9_guest_entry

20-21 are stand-alone, I think they're good. Existing asm is duplicated=20
in C but the C documents it and anyway matches its inverse which is=20
already in C.

And I think it's better to be doing CI MMIOs while we're still mostly in=20
host context.

>   KVM: PPC: Book3S HV P9: Stop handling hcalls in real-mode in the P9
>     path

22 move down together with Implement the rest of the P9 path in C.

>   KVM: PPC: Book3S HV P9: Move setting HDEC after switching to guest
>     LPCR
>   KVM: PPC: Book3S HV P9: Use large decrementer for HDEC
>   KVM: PPC: Book3S HV P9: Use host timer accounting to avoid decrementer
>     read
>   KVM: PPC: Book3S HV P9: Reduce mftb per guest entry/exit
>   KVM: PPC: Book3S HV P9: Reduce irq_work vs guest decrementer races
>   KMV: PPC: Book3S HV: Use set_dec to set decrementer to host
>   powerpc/time: add API for KVM to re-arm the host timer/decrementer

23-29 try to get all these timekeeping things in. They ended up being=20
mostly unrelated to the C conversion but the way I started out writing=20
the C conversion, these changes fell out and ended up collecting here. I=20
think they're generally improvements.

That leaves about 20 patches remaining. Of those, only about the first 5=20
are necessary to reimplement the existing P9 path functionality in C,=20
which is a lot less scary than nearly 50.

Thanks,
Nick

>   KVM: PPC: Book3S HV P9: Implement the rest of the P9 path in C
>   KVM: PPC: Book3S HV P9: inline kvmhv_load_hv_regs_and_go into
>     __kvmhv_vcpu_entry_p9
>   KVM: PPC: Book3S HV P9: Read machine check registers while MSR[RI] is
>     0
>   KVM: PPC: Book3S HV P9: Improve exit timing accounting coverage
>   KVM: PPC: Book3S HV P9: Move SPR loading after expiry time check
>   KVM: PPC: Book3S HV P9: Add helpers for OS SPR handling
>   KVM: PPC: Book3S HV P9: Switch to guest MMU context as late as
>     possible
>   KVM: PPC: Book3S HV: Implement radix prefetch workaround by disabling
>     MMU
>   KVM: PPC: Book3S HV: Remove support for dependent threads mode on P9
>   KVM: PPC: Book3S HV: Remove radix guest support from P7/8 path
>   KVM: PPC: Book3S HV: Remove virt mode checks from real mode handlers
>   KVM: PPC: Book3S HV: Remove unused nested HV tests in XICS emulation
>   KVM: PPC: Book3S HV P9: Allow all P9 processors to enable nested HV
>   KVM: PPC: Book3S HV: small pseries_do_hcall cleanup
>   KVM: PPC: Book3S HV: add virtual mode handlers for HPT hcalls and page
>     faults
>   KVM: PPC: Book3S HV P9: Reflect userspace hcalls to hash guests to
>     support PR KVM
>   KVM: PPC: Book3S HV P9: implement hash guest support
>   KVM: PPC: Book3S HV P9: implement hash host / hash guest support
>   KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1 support from P7/8 path
>=20
>  arch/powerpc/include/asm/asm-prototypes.h |   3 +-
>  arch/powerpc/include/asm/exception-64s.h  |  13 +
>  arch/powerpc/include/asm/kvm_asm.h        |   3 +-
>  arch/powerpc/include/asm/kvm_book3s.h     |   2 +
>  arch/powerpc/include/asm/kvm_book3s_64.h  |   8 +
>  arch/powerpc/include/asm/kvm_host.h       |   8 +-
>  arch/powerpc/include/asm/kvm_ppc.h        |  21 +-
>  arch/powerpc/include/asm/mmu_context.h    |   6 -
>  arch/powerpc/include/asm/time.h           |  11 +
>  arch/powerpc/kernel/asm-offsets.c         |   1 -
>  arch/powerpc/kernel/exceptions-64s.S      | 257 ++-----
>  arch/powerpc/kernel/security.c            |   5 +-
>  arch/powerpc/kernel/time.c                |  43 +-
>  arch/powerpc/kvm/Makefile                 |   4 +
>  arch/powerpc/kvm/book3s.c                 |  17 +-
>  arch/powerpc/kvm/book3s_64_entry.S        | 409 +++++++++++
>  arch/powerpc/kvm/book3s_64_vio_hv.c       |  12 -
>  arch/powerpc/kvm/book3s_hv.c              | 782 ++++++++++++----------
>  arch/powerpc/kvm/book3s_hv_builtin.c      | 138 +---
>  arch/powerpc/kvm/book3s_hv_interrupt.c    | 529 +++++++++++++++
>  arch/powerpc/kvm/book3s_hv_interrupts.S   |   9 +-
>  arch/powerpc/kvm/book3s_hv_nested.c       |  37 +-
>  arch/powerpc/kvm/book3s_hv_ras.c          |   2 +
>  arch/powerpc/kvm/book3s_hv_rm_mmu.c       |  15 +-
>  arch/powerpc/kvm/book3s_hv_rm_xics.c      |  15 -
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 682 +------------------
>  arch/powerpc/kvm/book3s_segment.S         |   3 +
>  arch/powerpc/kvm/book3s_xive.c            | 113 +++-
>  arch/powerpc/kvm/book3s_xive.h            |   7 -
>  arch/powerpc/kvm/book3s_xive_native.c     |  10 -
>  arch/powerpc/mm/book3s64/radix_pgtable.c  |  27 +-
>  arch/powerpc/mm/book3s64/radix_tlb.c      |  46 --
>  arch/powerpc/mm/mmu_context.c             |   4 +-
>  arch/powerpc/platforms/powernv/idle.c     |  52 +-
>  34 files changed, 1735 insertions(+), 1559 deletions(-)
>  create mode 100644 arch/powerpc/kvm/book3s_64_entry.S
>  create mode 100644 arch/powerpc/kvm/book3s_hv_interrupt.c
>=20
> --=20
> 2.23.0
>=20
>=20
