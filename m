Return-Path: <linuxppc-dev+bounces-1862-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 648F8995B51
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 01:06:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNWq95Dgyz30PD;
	Wed,  9 Oct 2024 10:06:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728428789;
	cv=none; b=fPja1HxuSjhccuMg2z3D3tp/zS8kPZxgZ91mDhJY8A0ri8d/xNSozVPEuTDYd/P5zTEMODCtK8TI7DbDtBy06MlX12YP3Dtbq+ekgQeps0fLVPXpFqS+fDOScmLjsdG+oaa7nWn3qPY0KWz5Ygl80fbsDy6NF/j6sfrBGE/qS62znSiv4529M8unTSqhd0gA9zzNdu1m1EbgfICelBvWyQvi9uW5PV9miN31jcnExUP5Aw02k20ZS230pn0HZ/Pz2gpvxovvqLjbslUA71PCeUuF1c5eKjG9rI0tT9No1hCX/SI0fpBgTwOB7YSJSQvYmc/MR/fGxckSjaoRv/rJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728428789; c=relaxed/relaxed;
	bh=gohZxMcF9bQwlJ/9all6pCsMcrNWJmn1NA1843oqvR0=;
	h=Message-ID:Date:From:To:Cc:Subject; b=U7asM5ZdDKQK+CGhRswXMvWQSgXwyzTzPP6qqhMhM7dYdLcTbTtKpX+5uzavndep207kVwmnUCLzRapOD+5/gUykXCq2tlJpmYA3A1eqBphRwr0oBTzXECoUTXhxjB//91hUwNQ0Dug13Ssy7sY/GbntNwPN/eMyLIXOgKL9np4GunkhK4Zh+wUFm4oxn8tjenQQS8ZqbMsjpM+BJElyIOUvg7yDaX0Yl7tJIgQjk8tdyyVO7ZjmKVnJr2KcDzCqYJgW2MbFneBzohkjFsMuQek0+x2rGlUGYHVMDpbXF90ngdtHnoWyumE9cES2MN90mGc1wrtIzJMO3QjZV8uBNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=jrpr=re=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=jrpr=re=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNWq73D0pz2y8r
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 10:06:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9FFA5C5480;
	Tue,  8 Oct 2024 23:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8738C4CEC7;
	Tue,  8 Oct 2024 23:06:24 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1syJHg-00000001164-3tWc;
	Tue, 08 Oct 2024 19:06:28 -0400
Message-ID: <20241008230527.674939311@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 08 Oct 2024 19:05:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Paul  Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas  Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>,
 Borislav  Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH v2 0/2] ftrace: Make ftrace_regs abstract and consolidate code
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>


This is based on:

  https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/
     ftrace/for-next

ftrace_regs was created to hold registers that store information to save
function parameters, return value and stack. Since it is a subset of
pt_regs, it should only be used by its accessor functions. But because
pt_regs can easily be taken from ftrace_regs (on most archs), it is
tempting to use it directly. But when running on other architectures, it
may fail to build or worse, build but crash the kernel!

Instead, make struct ftrace_regs an empty structure and have the
architectures define __arch_ftrace_regs and all the accessor functions
will typecast to it to get to the actual fields. This will help avoid
usage of ftrace_regs directly.

I again compiled all the affected architectures (except for 32bit ppc).
I got s390 built when disabling bcachefs.

Changes since v1: https://lore.kernel.org/all/20241007204743.41314f1d@gandalf.local.home/

- Moved the non ftrace args code from asm-generic/ftrace.h to linux/ftrace.h
  those archs have their own asm/ftrace.h and are not using asm-generic.
  The default has to be in linux/ftrace.h

- simplified arch_ftrace_get_regs() and made it a static inline function

- Added a second patch that consolidates a lot of the duplicate code
  when an architecture has pt_regs embedded in the ftrace_regs.

Steven Rostedt (2):
      ftrace: Make ftrace_regs abstract from direct use
      ftrace: Consolidate ftrace_regs accessor functions for archs using pt_regs

----
 arch/arm64/include/asm/ftrace.h          | 21 +++++++++--------
 arch/arm64/kernel/asm-offsets.c          | 22 +++++++++---------
 arch/arm64/kernel/ftrace.c               | 10 ++++----
 arch/loongarch/include/asm/ftrace.h      | 29 ++++--------------------
 arch/loongarch/kernel/ftrace_dyn.c       |  2 +-
 arch/powerpc/include/asm/ftrace.h        | 27 +++-------------------
 arch/powerpc/kernel/trace/ftrace.c       |  4 ++--
 arch/powerpc/kernel/trace/ftrace_64_pg.c |  2 +-
 arch/riscv/include/asm/ftrace.h          | 22 ++++++++++--------
 arch/riscv/kernel/asm-offsets.c          | 28 +++++++++++------------
 arch/riscv/kernel/ftrace.c               |  2 +-
 arch/s390/include/asm/ftrace.h           | 29 ++++--------------------
 arch/s390/kernel/asm-offsets.c           |  4 ++--
 arch/s390/kernel/ftrace.c                |  2 +-
 arch/s390/lib/test_unwind.c              |  4 ++--
 arch/x86/include/asm/ftrace.h            | 30 ++++++------------------
 arch/x86/kernel/ftrace.c                 |  2 +-
 include/linux/ftrace.h                   | 39 +++++++++++++++-----------------
 include/linux/ftrace_regs.h              | 36 +++++++++++++++++++++++++++++
 kernel/trace/ftrace.c                    |  2 +-
 20 files changed, 139 insertions(+), 178 deletions(-)
 create mode 100644 include/linux/ftrace_regs.h

