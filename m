Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9706FE380
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 19:55:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGjNw1khHz3fXG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 03:55:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AHwG8gve;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AHwG8gve;
	dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGfKF5PHBz3f7V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 01:37:03 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-965a68abfd4so1390217766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683733019; x=1686325019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzhn1S4hfKcOd1E/ek0bvXDc8iMvqfYzj4agdzIw7zg=;
        b=AHwG8gveN/Sg48pq3Bi+RCPgFW4c5/vjnBNZaZtiOX+H1eniPqcHH2h47flp+IgolD
         OojnwgIzuTEDXBI7m3WjvoiRU0iJ2CnMjt2jPPo8AQ4I72cULzkq/s8jWODDXz1PJGnw
         pDJ/Hjitae6B+YFSMcD1owFeaskv3W2z+3i1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683733019; x=1686325019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzhn1S4hfKcOd1E/ek0bvXDc8iMvqfYzj4agdzIw7zg=;
        b=gQTFjbPB17UW82ZNrzrxLhxPrIS2p3GOcvwOUFYB1iNg2pIrU8ke8Xn6qycPwZSV9I
         xTodT4JyYaq4GZtQQt3vBBVKDdnyT5G0baARc2LJ4U1CcNNlxU2LyeQc2/fkxf8Fo9pr
         4vwxPNQ8MEuYAW1U9fZW2bPchqbHREqWaHUbCIAxdX3zQ6R3CkbW1oYL1kXL9e/1JlAe
         yHykWXoOEBYka2mVMk0DjmTTsF78Kq7CkSrci8y6LLmR2Pr1fBqVbM3qLxKxtcDsY8Nr
         PLJh8PIZyIgoFQc2UzGgNunoQhE4dACyxyYttT5QQSH9dW22H4JhpQu7EnmCTgVifquV
         Vw8Q==
X-Gm-Message-State: AC+VfDyhPUPqBoosMSSI44zjk08ECTPG30aWQV/66Z4GRx78aigjnogA
	XThv1/yVfB2yzkSDRARlwz1nE/4DUbfnqggpqLnm7w==
X-Google-Smtp-Source: ACHHUZ44AKzcYvZ8R6u3rMuAyAXhpvgH7jEECmUIlsAUpu79435YlXOHoy2r3XNMORu0jfl3oIsHRg==
X-Received: by 2002:a17:907:2687:b0:961:a67:29c with SMTP id bn7-20020a170907268700b009610a67029cmr14808544ejc.70.1683733019137;
        Wed, 10 May 2023 08:36:59 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id ty20-20020a170907c71400b0096621340285sm2794441ejc.198.2023.05.10.08.36.59
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 08:36:59 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f2548256d0so120175e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 08:36:59 -0700 (PDT)
X-Received: by 2002:a05:600c:600f:b0:3f1:6fe9:4a98 with SMTP id
 az15-20020a05600c600f00b003f16fe94a98mr178073wmb.5.1683732511119; Wed, 10 May
 2023 08:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230419225604.21204-1-dianders@chromium.org>
In-Reply-To: <20230419225604.21204-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 May 2023 08:28:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
Message-ID: <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] arm64: Add framework to turn an IPI as NMI
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sumit Garg <sumit.garg@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 11 May 2023 03:54:00 +1000
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Huacai Chen <chenhuacai@kernel.org>, Jinyang He <hejinyang@loongson.cn>, Lecopzer Chen <lecopzer.chen@mediatek.com>, Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net, Dave Hansen <dave.hansen@linux.intel.com>, Qing Zhang <zhangqing@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, Gaosheng Cui <cuigaosheng1@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Masayoshi Mizuma <msys.mizuma@gmail.com>, Ingo Molnar <mingo@kernel.org>, Pierre Gondois <Pierre.Gondo
 is@arm.com>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Stephen Boyd <swboyd@chromium.org>, loongarch@lists.linux.dev, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Jianmin Lv <lvjianmin@loongson.cn>, Borislav Petkov <bp@alien8.de>, Joey Gouly <joey.gouly@arm.com>, Ben Dooks <ben-linux@fluff.org>, Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>, x86@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ito-yuichi@fujitsu.com, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, linux-perf-users@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, "Eric W. Biederman" <ebiederm@xmission.com>, "Gautham R. Shenoy" <
 gautham.shenoy@amd.com>, Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, Apr 19, 2023 at 3:57=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> This is an attempt to resurrect Sumit's old patch series [1] that
> allowed us to use the arm64 pseudo-NMI to get backtraces of CPUs and
> also to round up CPUs in kdb/kgdb. The last post from Sumit that I
> could find was v7, so I called this series v8. I haven't copied all of
> his old changelongs here, but you can find them from the link.
>
> Since v7, I have:
> * Addressed the small amount of feedback that was there for v7.
> * Rebased.
> * Added a new patch that prevents us from spamming the logs with idle
>   tasks.
> * Added an extra patch to gracefully fall back to regular IPIs if
>   pseudo-NMIs aren't there.
>
> Since there appear to be a few different patches series related to
> being able to use NMIs to get stack traces of crashed systems, let me
> try to organize them to the best of my understanding:
>
> a) This series. On its own, a) will (among other things) enable stack
>    traces of all running processes with the soft lockup detector if
>    you've enabled the sysctl "kernel.softlockup_all_cpu_backtrace". On
>    its own, a) doesn't give a hard lockup detector.
>
> b) A different recently-posted series [2] that adds a hard lockup
>    detector based on perf. On its own, b) gives a stack crawl of the
>    locked up CPU but no stack crawls of other CPUs (even if they're
>    locked too). Together with a) + b) we get everything (full lockup
>    detect, full ability to get stack crawls).
>
> c) The old Android "buddy" hard lockup detector [3] that I'm
>    considering trying to upstream. If b) lands then I believe c) would
>    be redundant (at least for arm64). c) on its own is really only
>    useful on arm64 for platforms that can print CPU_DBGPCSR somehow
>    (see [4]). a) + c) is roughly as good as a) + b).
>
> [1] https://lore.kernel.org/linux-arm-kernel/1604317487-14543-1-git-send-=
email-sumit.garg@linaro.org/
> [2] https://lore.kernel.org/linux-arm-kernel/20220903093415.15850-1-lecop=
zer.chen@mediatek.com/
> [3] https://issuetracker.google.com/172213097
> [4] https://issuetracker.google.com/172213129
>
> Changes in v8:
> - dynamic_ipi_setup() and dynamic_ipi_teardown() no longer take cpu param
> - dynamic_ipi_setup() and dynamic_ipi_teardown() no longer take cpu param
> - Add loongarch support, too
> - Removed "#ifdef CONFIG_SMP" since arm64 is always SMP
> - "Tag the arm64 idle functions as __cpuidle" new for v8
> - "Provide a stub kgdb_nmicallback() if !CONFIG_KGDB" new for v8
> - "Fallback to a regular IPI if NMI isn't enabled" new for v8
>
> Douglas Anderson (3):
>   arm64: idle: Tag the arm64 idle functions as __cpuidle
>   kgdb: Provide a stub kgdb_nmicallback() if !CONFIG_KGDB
>   arm64: ipi_nmi: Fallback to a regular IPI if NMI isn't enabled
>
> Sumit Garg (7):
>   arm64: Add framework to turn IPI as NMI
>   irqchip/gic-v3: Enable support for SGIs to act as NMIs
>   arm64: smp: Assign and setup an IPI as NMI
>   nmi: backtrace: Allow runtime arch specific override
>   arm64: ipi_nmi: Add support for NMI backtrace
>   kgdb: Expose default CPUs roundup fallback mechanism
>   arm64: kgdb: Roundup cpus using IPI as NMI
>
>  arch/arm/include/asm/irq.h       |   2 +-
>  arch/arm/kernel/smp.c            |   3 +-
>  arch/arm64/include/asm/irq.h     |   4 ++
>  arch/arm64/include/asm/nmi.h     |  17 +++++
>  arch/arm64/kernel/Makefile       |   2 +-
>  arch/arm64/kernel/idle.c         |   4 +-
>  arch/arm64/kernel/ipi_nmi.c      | 103 +++++++++++++++++++++++++++++++
>  arch/arm64/kernel/kgdb.c         |  18 ++++++
>  arch/arm64/kernel/smp.c          |   8 +++
>  arch/loongarch/include/asm/irq.h |   2 +-
>  arch/loongarch/kernel/process.c  |   3 +-
>  arch/mips/include/asm/irq.h      |   2 +-
>  arch/mips/kernel/process.c       |   3 +-
>  arch/powerpc/include/asm/nmi.h   |   2 +-
>  arch/powerpc/kernel/stacktrace.c |   3 +-
>  arch/sparc/include/asm/irq_64.h  |   2 +-
>  arch/sparc/kernel/process_64.c   |   4 +-
>  arch/x86/include/asm/irq.h       |   2 +-
>  arch/x86/kernel/apic/hw_nmi.c    |   3 +-
>  drivers/irqchip/irq-gic-v3.c     |  29 ++++++---
>  include/linux/kgdb.h             |  13 ++++
>  include/linux/nmi.h              |  12 ++--
>  kernel/debug/debug_core.c        |   8 ++-
>  23 files changed, 217 insertions(+), 32 deletions(-)

It's been 3 weeks and I haven't heard a peep on this series. That
means nobody has any objections and it's all good to land, right?
Right? :-P

Seriously, though, I really think we should figure out how to get this
landed. There's obviously interest from several different parties and
I'm chomping at the bit waiting to spin this series according to your
wishes. I also don't think there's anything super scary/ugly here. IMO
the ideal situation is that folks are OK with the idea presented in
the last patch in the series ("arm64: ipi_nmi: Fallback to a regular
IPI if NMI isn't enabled") and then I can re-spin this series to be
_much_ simpler. That being said, I'm also OK with dropping that patch
and starting the discussion for how to land the rest of the patches in
the series.

Please let me know!

-Doug
