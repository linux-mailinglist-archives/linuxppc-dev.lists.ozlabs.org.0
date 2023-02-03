Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B96CD68A5A2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 23:08:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7qXz41H5z3fDC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 09:08:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hT/RSWKO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hT/RSWKO;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7qV360y9z3f66
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 09:05:47 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6F7D0B82C1E;
	Fri,  3 Feb 2023 22:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C488C433EF;
	Fri,  3 Feb 2023 22:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675461941;
	bh=Yfz7LDRr9C5stKW6l039uMgeR9w4g6B/htPQVWCmvo0=;
	h=From:To:Cc:Subject:Date:From;
	b=hT/RSWKOfEB8jVVNR5UZ+ZbSj3FXLQ0xxyrY0heskGWE6khYrrAFQ76LYykM4i9o8
	 irBoG35w/xMGiAEWy8hEkn9Q1tIzJzxmXAljxc/iWYKnUXFrHhRYGep0nxJSoT9spP
	 4dB2u1vvWVrwhpcumbKdCJR0B2wTRgDCB5121JafDUwhKmELKjCdPeOrwXK5eLJDjK
	 tyz30wSd9T+Wd8Rt8ftd27zDruJpmQXIwZCt+CSiXATiejyCyi516LIlzhPyorZH8T
	 WTNmRq1LmErrBsj/ynnHP8Qccsk6gRrw9tAaXNUSu/osCJkwqecmj01XHOVKQ9ef7f
	 Ezggi0dcZPCBQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/22] cpu,sched: Mark arch_cpu_idle_dead() __noreturn
Date: Fri,  3 Feb 2023 14:05:09 -0800
Message-Id: <cover.1675461757.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-mips@vger.kernel.org, linux-alph
 a@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are some minor changes to enable the __noreturn attribute for
arch_cpu_idle_dead().  (If there are no objections, I can merge the
entire set through the tip tree.)

Until recently [1], in Xen, when a previously offlined CPU was brought
back online, it unexpectedly resumed execution where it left off in the
middle of the idle loop by returning from play_dead() and its caller
arch_cpu_idle_dead().

There were some clever hacks to make that work, but the behavior was
surprising as do_idle() doesn't expect an offlined CPU to return from
the dead in the middle of the function.

Now that Xen has been fixed, make sure arch_cpu_idle_dead() never
returns by marking it __noreturn.  This causes the compiler to complain
if an arch-specific implementation might return.  It also improves code
generation for both caller and callee.

Patches 1-20 update the arch-specific implementations of the function so
they don't actually return (even in error cases), and make that visible
to the compiler.  That's typically done by ending the function with a
call to another noreturn function, or with a BUG().

Patch 21 fixes the weak implementation.

Patch 22 actually adds the __noreturn attribute.

[1] 076cbf5d2163 ("x86/xen: don't let xen_pv_play_dead() return")

Josh Poimboeuf (22):
  alpha/cpu: Expose arch_cpu_idle_dead()'s prototype declaration
  alpha/cpu: Make sure arch_cpu_idle_dead() doesn't return
  arm/cpu: Make sure arch_cpu_idle_dead() doesn't return
  arm64/cpu: Mark cpu_die() __noreturn
  csky/cpu: Make sure arch_cpu_idle_dead() doesn't return
  ia64/cpu: Mark play_dead() __noreturn
  loongarch/cpu: Make sure play_dead() doesn't return
  loongarch/cpu: Mark play_dead() __noreturn
  mips/cpu: Expose play_dead()'s prototype definition
  mips/cpu: Make sure play_dead() doesn't return
  mips/cpu: Mark play_dead() __noreturn
  powerpc/cpu: Mark start_secondary_resume() __noreturn
  sh/cpu: Make sure play_dead() doesn't return
  sh/cpu: Mark play_dead() __noreturn
  sh/cpu: Expose arch_cpu_idle_dead()'s prototype definition
  sparc/cpu: Mark cpu_play_dead() __noreturn
  x86/cpu: Make sure play_dead() doesn't return
  x86/cpu: Mark play_dead() __noreturn
  xtensa/cpu: Make sure cpu_die() doesn't return
  xtensa/cpu: Mark cpu_die() __noreturn
  sched/idle: Make sure weak version of arch_cpu_idle_dead() doesn't
    return
  sched/idle: Mark arch_cpu_idle_dead() __noreturn

 arch/alpha/kernel/process.c      | 2 ++
 arch/arm/kernel/smp.c            | 2 ++
 arch/arm64/include/asm/smp.h     | 2 +-
 arch/csky/kernel/smp.c           | 2 ++
 arch/ia64/kernel/process.c       | 4 ++--
 arch/loongarch/include/asm/smp.h | 2 +-
 arch/loongarch/kernel/smp.c      | 2 +-
 arch/mips/include/asm/smp.h      | 2 +-
 arch/mips/kernel/smp-bmips.c     | 3 +++
 arch/mips/loongson64/smp.c       | 1 +
 arch/powerpc/include/asm/smp.h   | 2 +-
 arch/sh/include/asm/smp-ops.h    | 5 +++--
 arch/sh/kernel/idle.c            | 1 +
 arch/sparc/include/asm/smp_64.h  | 2 +-
 arch/x86/include/asm/smp.h       | 3 ++-
 arch/x86/kernel/process.c        | 2 +-
 arch/xtensa/include/asm/smp.h    | 2 +-
 arch/xtensa/kernel/smp.c         | 2 ++
 include/linux/cpu.h              | 2 +-
 kernel/sched/idle.c              | 2 +-
 tools/objtool/check.c            | 1 +
 21 files changed, 31 insertions(+), 15 deletions(-)

-- 
2.39.0

