Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 698656987C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:23:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHCKL27nmz3chK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 09:23:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lgMebc9/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=dnx9=6l=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lgMebc9/;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHCJL4Ctlz3cCn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 09:22:58 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B7B60B82373;
	Wed, 15 Feb 2023 22:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAD0C433D2;
	Wed, 15 Feb 2023 22:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676499772;
	bh=3/B+NZRwzEkNo04hOsRXt8MwWSjpYxIfsEH4O0Y0Iy0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=lgMebc9/PyCNI2WQWQFGhJ6pEjvuGS4FIDV8Hndf+NKrHLS1WG/DGBpNgqf8fOyYC
	 y8+V3Q2tj+S2zmKUBdMwoObfAcO+heEDDn/va0AU2ijfCtQ4tDaxjdOoA+qCu96qJu
	 tkWdqqKZlqO1cHNQGCQ3kzUKY7M1SSh9fmDTqH1qGb+lN/kKUpvSTLbTM6FeL2JzDg
	 3qeqvtZTigjAwCmsYZOm8DYFJHs+rNCQMwz1iolZjE/BUncjAH+Fit4Bh2Gox6pFxx
	 1CSx3J/q9TyNq1z7sg7E7kSGGeSWuf8YWJVgL80Qlbz1kmmdtCqghuKDCBxMa4nZ97
	 KwdXvAMHmGl/A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D10DF5C0F9D; Wed, 15 Feb 2023 14:22:49 -0800 (PST)
Date: Wed, 15 Feb 2023 14:22:49 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v2 00/24] cpu,sched: Mark arch_cpu_idle_dead() __noreturn
Message-ID: <20230215222249.GM2948950@paulmck-ThinkPad-P17-Gen-1>
References: <cover.1676358308.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
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
Reply-To: paulmck@kernel.org
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 13, 2023 at 11:05:34PM -0800, Josh Poimboeuf wrote:
> v2:
> - make arch_call_rest_init() and rest_init() __noreturn
> - make objtool 'global_returns' work for weak functions
> - rebase on tip/objtool/core with dependencies merged in (mingo)
> - add acks
> 
> v1.1:
> - add __noreturn to all arch_cpu_idle_dead() implementations (mpe)

With this, rcutorture no longer gets objtool complaints on x86, thank you!

Tested-by: Paul E. McKenney <paulmck@kernel.org>

> Josh Poimboeuf (24):
>   alpha/cpu: Expose arch_cpu_idle_dead()'s prototype declaration
>   alpha/cpu: Make sure arch_cpu_idle_dead() doesn't return
>   arm/cpu: Make sure arch_cpu_idle_dead() doesn't return
>   arm64/cpu: Mark cpu_die() __noreturn
>   csky/cpu: Make sure arch_cpu_idle_dead() doesn't return
>   ia64/cpu: Mark play_dead() __noreturn
>   loongarch/cpu: Make sure play_dead() doesn't return
>   loongarch/cpu: Mark play_dead() __noreturn
>   mips/cpu: Expose play_dead()'s prototype definition
>   mips/cpu: Make sure play_dead() doesn't return
>   mips/cpu: Mark play_dead() __noreturn
>   powerpc/cpu: Mark start_secondary_resume() __noreturn
>   sh/cpu: Make sure play_dead() doesn't return
>   sh/cpu: Mark play_dead() __noreturn
>   sh/cpu: Expose arch_cpu_idle_dead()'s prototype definition
>   sparc/cpu: Mark cpu_play_dead() __noreturn
>   x86/cpu: Make sure play_dead() doesn't return
>   x86/cpu: Mark play_dead() __noreturn
>   xtensa/cpu: Make sure cpu_die() doesn't return
>   xtensa/cpu: Mark cpu_die() __noreturn
>   sched/idle: Make sure weak version of arch_cpu_idle_dead() doesn't
>     return
>   objtool: Include weak functions in 'global_noreturns' check
>   init: Make arch_call_rest_init() and rest_init() __noreturn
>   sched/idle: Mark arch_cpu_idle_dead() __noreturn
> 
>  arch/alpha/kernel/process.c      |  4 +++-
>  arch/arm/kernel/smp.c            |  4 +++-
>  arch/arm64/include/asm/smp.h     |  2 +-
>  arch/arm64/kernel/process.c      |  2 +-
>  arch/csky/kernel/smp.c           |  4 +++-
>  arch/ia64/kernel/process.c       |  6 +++---
>  arch/loongarch/include/asm/smp.h |  2 +-
>  arch/loongarch/kernel/process.c  |  2 +-
>  arch/loongarch/kernel/smp.c      |  2 +-
>  arch/mips/include/asm/smp.h      |  2 +-
>  arch/mips/kernel/process.c       |  2 +-
>  arch/mips/kernel/smp-bmips.c     |  3 +++
>  arch/mips/loongson64/smp.c       |  1 +
>  arch/parisc/kernel/process.c     |  2 +-
>  arch/powerpc/include/asm/smp.h   |  2 +-
>  arch/powerpc/kernel/smp.c        |  2 +-
>  arch/riscv/kernel/cpu-hotplug.c  |  2 +-
>  arch/s390/kernel/idle.c          |  2 +-
>  arch/s390/kernel/setup.c         |  2 +-
>  arch/sh/include/asm/smp-ops.h    |  5 +++--
>  arch/sh/kernel/idle.c            |  3 ++-
>  arch/sparc/include/asm/smp_64.h  |  2 +-
>  arch/sparc/kernel/process_64.c   |  2 +-
>  arch/x86/include/asm/smp.h       |  3 ++-
>  arch/x86/kernel/process.c        |  4 ++--
>  arch/xtensa/include/asm/smp.h    |  2 +-
>  arch/xtensa/kernel/smp.c         |  4 +++-
>  include/linux/cpu.h              |  2 +-
>  include/linux/start_kernel.h     |  4 ++--
>  init/main.c                      |  4 ++--
>  kernel/sched/idle.c              |  2 +-
>  tools/objtool/check.c            | 11 +++++++----
>  32 files changed, 57 insertions(+), 39 deletions(-)
> 
> -- 
> 2.39.1
> 
