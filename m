Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE6F6959BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 08:07:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGC2h10hcz3cGH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 18:07:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FeDhahtj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FeDhahtj;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGC1m203fz3c63
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 18:06:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 050EC60E8C;
	Tue, 14 Feb 2023 07:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD53CC433EF;
	Tue, 14 Feb 2023 07:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676358408;
	bh=RKzZmEQ0aGTy+gbzBwQMcZ+ax04gqBZYglhP2Mxomuo=;
	h=From:To:Cc:Subject:Date:From;
	b=FeDhahtj5zTcKfS87v8/QfdL3FiuaRKBYgvZJuSr3uTqDOUDpR9xAIwfSUUl+xCQ4
	 r7S+eXVH1xqLNIUZnh/cHtuO1wDJDQW64m8IJbGmNTGNy+/CBDE3sNH46BYhM8ZJzq
	 hySTqkxhjf0gavLtGi4niNQiqmOkWmn2no49fQG3W+sIsnBFMBNtI28+cWarf+lgjw
	 EkIBlAg10MBeQ6FOIITajEZQjSMDxh0fHI3x8obz1DyGtW5I15c9zlJwXVZxpo4sQS
	 v0B/B1Cs/GdU7oUHS5iP/TM7GdZXf5Rr8enZUnuUAzcybm31QTM4L2TA1DoDr3aD30
	 9f3vJpb0gcS8w==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/24] cpu,sched: Mark arch_cpu_idle_dead() __noreturn
Date: Mon, 13 Feb 2023 23:05:34 -0800
Message-Id: <cover.1676358308.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.39.1
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

v2:
- make arch_call_rest_init() and rest_init() __noreturn
- make objtool 'global_returns' work for weak functions
- rebase on tip/objtool/core with dependencies merged in (mingo)
- add acks

v1.1:
- add __noreturn to all arch_cpu_idle_dead() implementations (mpe)

Josh Poimboeuf (24):
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
  objtool: Include weak functions in 'global_noreturns' check
  init: Make arch_call_rest_init() and rest_init() __noreturn
  sched/idle: Mark arch_cpu_idle_dead() __noreturn

 arch/alpha/kernel/process.c      |  4 +++-
 arch/arm/kernel/smp.c            |  4 +++-
 arch/arm64/include/asm/smp.h     |  2 +-
 arch/arm64/kernel/process.c      |  2 +-
 arch/csky/kernel/smp.c           |  4 +++-
 arch/ia64/kernel/process.c       |  6 +++---
 arch/loongarch/include/asm/smp.h |  2 +-
 arch/loongarch/kernel/process.c  |  2 +-
 arch/loongarch/kernel/smp.c      |  2 +-
 arch/mips/include/asm/smp.h      |  2 +-
 arch/mips/kernel/process.c       |  2 +-
 arch/mips/kernel/smp-bmips.c     |  3 +++
 arch/mips/loongson64/smp.c       |  1 +
 arch/parisc/kernel/process.c     |  2 +-
 arch/powerpc/include/asm/smp.h   |  2 +-
 arch/powerpc/kernel/smp.c        |  2 +-
 arch/riscv/kernel/cpu-hotplug.c  |  2 +-
 arch/s390/kernel/idle.c          |  2 +-
 arch/s390/kernel/setup.c         |  2 +-
 arch/sh/include/asm/smp-ops.h    |  5 +++--
 arch/sh/kernel/idle.c            |  3 ++-
 arch/sparc/include/asm/smp_64.h  |  2 +-
 arch/sparc/kernel/process_64.c   |  2 +-
 arch/x86/include/asm/smp.h       |  3 ++-
 arch/x86/kernel/process.c        |  4 ++--
 arch/xtensa/include/asm/smp.h    |  2 +-
 arch/xtensa/kernel/smp.c         |  4 +++-
 include/linux/cpu.h              |  2 +-
 include/linux/start_kernel.h     |  4 ++--
 init/main.c                      |  4 ++--
 kernel/sched/idle.c              |  2 +-
 tools/objtool/check.c            | 11 +++++++----
 32 files changed, 57 insertions(+), 39 deletions(-)

-- 
2.39.1

