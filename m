Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB54034ECAF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 17:36:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8tpZ6rYfz3cLF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 02:36:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qQDflIkA;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=DAWOFKfB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=qQDflIkA; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=DAWOFKfB; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8tn84Fgwz3bpP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 02:35:23 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1617118514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YPYdY00O6y5AyCUxqpuYCSP5+y//XPdG6L9507cj5Ic=;
 b=qQDflIkAz51LrvGLUrPwJwlERwWmT6hRYLbUtz0Trgd18/qLrOCW3YJxVb2jNAurM81TyI
 3AsXxivkW9AuZRb35RUNhV/DFicFLJm/ny52MZHlxV7nYaB82D7yRtI4eJOR3/A6GZI+4W
 Oj90Fp+qLdueXya9Nqaj7zUEgUAq3I566RihuuDiupy7dG0M1LBtHXzJHIUGFj2fBotjoc
 m2sdVo64AJACocszlTWXWkB3zjWrA7HaH4WgN9u85YOkFnQ/JYc9BcjSaehTMGu0Tieka6
 Qum9ld/CWbuBmTjG8QIJS2kuF/+SwuV/YneE4CHchkQF8b8DmaCwDpcuT+u3QQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1617118514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YPYdY00O6y5AyCUxqpuYCSP5+y//XPdG6L9507cj5Ic=;
 b=DAWOFKfBAuSGqLOlxY962SnoWviQuD0AGtEm319HtzpL33OlIzgLcrRMou9nKTPDT+oWj6
 VfRxVIoORXq20wCQ==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH printk v2 0/5] printk: remove safe buffers
Date: Tue, 30 Mar 2021 17:35:07 +0200
Message-Id: <20210330153512.1182-1-john.ogness@linutronix.de>
MIME-Version: 1.0
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
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Alexei Starovoitov <ast@kernel.org>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Will Deacon <will@kernel.org>,
 Rafael Aquini <aquini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Peter Zijlstra <peterz@infradead.org>, Yue Hu <huyue2@yulong.com>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alistair Popple <alistair@popple.id.au>,
 Frederic Weisbecker <frederic@kernel.org>,
 "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Terrell <terrelln@fb.com>, Steven Rostedt <rostedt@goodmis.org>,
 Andy Lutomirski <luto@kernel.org>, Leonardo Bras <leobras.c@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Here is v2 of a series to remove the safe buffers. v1 can be
found here [0]. The safe buffers are no longer needed because
messages can be stored directly into the log buffer from any
context.

However, the safe buffers also provided a form of recursion
protection. For that reason, explicit recursion protection is
also implemented for this series.

And finally, with the removal of the safe buffers, there is no
need for extra NMI enter/exit tracking. So this is also removed
(which includes removing config option CONFIG_PRINTK_NMI).

This series is based on the printk-rework branch of
printk/linux.git:

    commit acebb5597ff1 ("kernel/printk.c: Fixed mundane typos")

Changes since v1:

- remove the printk nmi enter/exit tracking

- remove CONFIG_PRINTK_NMI config option

- use in_nmi() to detect NMI context

- remove unused printk_safe_enter/exit macros

- after switching to the dynamic buffer, copy over NMI records
  that may have arrived during the switch window

- use local_irq_*() instead of printk_safe_*() for console
  spinning

- use separate variables rather than arrays for the per-cpu
  recursion tracking

- make @syslog_lock a mutex instead of a spin_lock

- close the wait-read window for SYSLOG_ACTION_READ

- adjust various comments and commit messages as requested

John Ogness

[0] https://lore.kernel.org/lkml/20210316233326.10778-1-john.ogness@linutronix.de

John Ogness (5):
  printk: track/limit recursion
  printk: remove safe buffers
  printk: remove NMI tracking
  printk: convert @syslog_lock to mutex
  printk: syslog: close window between wait and read

 arch/arm/kernel/smp.c          |   2 -
 arch/powerpc/kernel/traps.c    |   1 -
 arch/powerpc/kernel/watchdog.c |   5 -
 arch/powerpc/kexec/crash.c     |   3 -
 include/linux/hardirq.h        |   2 -
 include/linux/printk.h         |  22 --
 init/Kconfig                   |   5 -
 kernel/kexec_core.c            |   1 -
 kernel/panic.c                 |   3 -
 kernel/printk/internal.h       |  23 ---
 kernel/printk/printk.c         | 281 +++++++++++++++----------
 kernel/printk/printk_safe.c    | 362 +--------------------------------
 kernel/trace/trace.c           |   2 -
 lib/nmi_backtrace.c            |   6 -
 14 files changed, 171 insertions(+), 547 deletions(-)

-- 
2.20.1

