Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E0E3CAC18
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 21:34:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQl1n33Q2z3bXj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 05:34:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=H1Slcp5v;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KhW3dN8M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=H1Slcp5v; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=KhW3dN8M; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQl1G1w8Gz2yNw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 05:34:10 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1626377641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=AlYsQuWcV07ceFNksYMnBsP5kyWUBQUeoD8kaOeX8A4=;
 b=H1Slcp5vR+s/qOKCOLfC9pox8PNkKoEZX8fxv9qmyD7nwiZLomLYup9Pb9FSsmnOQ+EPaJ
 Du1FIb9sBZPE8VTu1nJNL595Me3c0MZJjKkbHZrnXnF/9WNVx8xFDvTpj33GISk1s/v7Pm
 0xjM1na3FCAQFwxtGR9n+pmqGKbPqyn1XcKlFopRInV3uT9P8psg1163D7eL1MzzQJQxF9
 w5QYbOw3ajycAn9+z/aP9ORfvcr5gmQb9+b6REqz40z5gGn1ngTCuCBm8GzwrMKDYg5iQZ
 rvR6PNLVTwDg/7QK+YkTZ146g7FBStWXWMKo7L5tx9lYhzmJU99uLYpyoeLtQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1626377641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=AlYsQuWcV07ceFNksYMnBsP5kyWUBQUeoD8kaOeX8A4=;
 b=KhW3dN8MQmFGfyVll3Bd6RO29BZ6Hgev3jn4REDVIC0SszHesjcDnMLQfy1uO9iz382/CP
 tmAaxQ5nCOpMAaAg==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH printk v4 0/6] printk: remove safe buffers
Date: Thu, 15 Jul 2021 21:39:53 +0206
Message-Id: <20210715193359.25946-1-john.ogness@linutronix.de>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 Paul Mackerras <paulus@samba.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Daniel Borkmann <daniel@iogearbox.net>, Marc Zyngier <maz@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Peter Zijlstra <peterz@infradead.org>, Yue Hu <huyue2@yulong.com>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Valentin Schneider <valentin.schneider@arm.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vipin Sharma <vipinsh@google.com>, Frederic Weisbecker <frederic@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Terrell <terrelln@fb.com>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Nick Desaulniers <ndesaulniers@google.com>, Xiongwei Song <sxwjean@gmail.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Here is v4 of a series to remove the safe buffers. v3 can be
found here [0]. The safe buffers are no longer needed because
messages can be stored directly into the log buffer from any
context.

However, the safe buffers also provided a form of recursion
protection. For that reason, explicit recursion protection is
implemented for this series.

The safe buffers also implicitly provided serialization
between multiple CPUs executing in NMI context. This was
particularly necessary for the nmi_backtrace() output. This
serializiation is now preserved by using the printk cpulock.

With the removal of the safe buffers, there is no need for
extra NMI enter/exit tracking. So this is also removed
(which includes removing the config option CONFIG_PRINTK_NMI).

And finally, there are a few places in the kernel that need to
specify code blocks where all printk calls are to be deferred
printing. Previously the NMI tracking API was being (mis)used
for this purpose. This series introduces an official and
explicit interface for such cases. (Note that all deferred
printing will be removed anyway, once printing kthreads are
introduced.)

Changes since v3:

- Remove safe context tracking in vprintk().

- Add safe context tracking for @console_owner usage since that
  is also a component of the printing code.

- Refactor syslog_print() so that it is easier to understand
  and follow the locking logic.

- Introduce printk_deferred_enter/exit functions to be used by
  code that needs to specify code block where all printk calls
  are to be deferred printing.

John Ogness

[0] https://lore.kernel.org/lkml/20210624111148.5190-1-john.ogness@linutronix.de

John Ogness (6):
  lib/nmi_backtrace: explicitly serialize banner and regs
  printk: track/limit recursion
  printk: remove safe buffers
  printk: remove NMI tracking
  printk: convert @syslog_lock to mutex
  printk: syslog: close window between wait and read

 arch/arm/kernel/smp.c          |   4 +-
 arch/powerpc/kernel/traps.c    |   1 -
 arch/powerpc/kernel/watchdog.c |   5 -
 arch/powerpc/kexec/crash.c     |   2 +-
 include/linux/hardirq.h        |   2 -
 include/linux/printk.h         |  41 ++--
 init/Kconfig                   |   5 -
 kernel/kexec_core.c            |   1 -
 kernel/panic.c                 |   3 -
 kernel/printk/internal.h       |  25 ---
 kernel/printk/printk.c         | 268 ++++++++++++++----------
 kernel/printk/printk_safe.c    | 364 +--------------------------------
 kernel/trace/trace.c           |   4 +-
 lib/nmi_backtrace.c            |  13 +-
 14 files changed, 194 insertions(+), 544 deletions(-)


base-commit: 70333dec446292cd896cd051d2ebd6808b328949
-- 
2.20.1

