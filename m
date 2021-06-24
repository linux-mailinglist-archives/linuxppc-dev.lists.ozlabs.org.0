Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4446B3B2DAE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 13:20:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9d2l06h4z3c3r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 21:19:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IHgUrWjq;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=UgtDgR4w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=IHgUrWjq; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=UgtDgR4w; 
 dkim-atps=neutral
X-Greylist: delayed 450 seconds by postgrey-1.36 at boromir;
 Thu, 24 Jun 2021 21:19:26 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9d2605tSz3bvZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 21:19:25 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1624533109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cfuNbKyCExwbvfLByUf+i4tJc2rm0rFQn9eWtArqDyU=;
 b=IHgUrWjqvTv9XAnW/euiKoHwCs22cXM582fYW7cdZ/gzfBxO7r+42lCoPz/6AoII5OD3vC
 WUMEZkEBldDcku57tVr2rvTpeuygcckemySzvQ3FLrfSxnbxJcIsRMx4luDvkBtYFr1lHl
 Z1kclDpHstTRIFFbNIhgx2OMOe37Y2xiSjQUVkH1DiOYeK8BC30dH6MP3hEBxi+TINnr65
 iFZdoBNAxFkiZMnbkkiL640e/KxI47jyT+B3b83bn9FXtsxdoVP9qYsozOKunTnMD+kMmU
 XdLGN1R2U9qscSjODZFD9WlP7BF7bv6uHjZjAQKqiaskUoJoReN0NHjL6mXugA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1624533109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cfuNbKyCExwbvfLByUf+i4tJc2rm0rFQn9eWtArqDyU=;
 b=UgtDgR4w/gAEfRB86XFxI5AihfurAOaChSakPiA9vEn2TUKTUSjCSlzlcmPcUfDeZYBtLI
 Ez3uSiW3f8JSHYCg==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH printk v3 0/6] printk: remove safe buffers
Date: Thu, 24 Jun 2021 13:17:42 +0206
Message-Id: <20210624111148.5190-1-john.ogness@linutronix.de>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Alexei Starovoitov <ast@kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 Paul Mackerras <paulus@samba.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Peter Zijlstra <peterz@infradead.org>,
 Yue Hu <huyue2@yulong.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Sami Tolvanen <samitolvanen@google.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Here is v3 of a series to remove the safe buffers. v2 can be
found here [0]. The safe buffers are no longer needed because
messages can be stored directly into the log buffer from any
context.

However, the safe buffers also provided a form of recursion
protection. For that reason, explicit recursion protection is
implemented for this series.

The safe buffers also implicitly provided serialization
between multiple CPUs executing in NMI context. This was
particularly necessary for the nmi_backtrace() output. This
serializiation is now preserved by using the printk_cpu_lock.

And finally, with the removal of the safe buffers, there is no
need for extra NMI enter/exit tracking. So this is also removed
(which includes removing config option CONFIG_PRINTK_NMI).

Changes since v2:

- Move irq disabling/enabling out of the
  console_lock_spinning_*() functions to simplify the patches
  keep the function prototypes simple.

- Change printk_enter_irqsave()/printk_exit_irqrestore() to
  macros to allow a more common calling convention for irq
  flags.

- Use the counter pointer from printk_enter_irqsave() in
  printk_exit_irqrestore() rather than fetching it again. This
  avoids any possible race conditions when printk's percpu
  flag is set.

- Use the printk_cpu_lock to serialize banner and regs with
  the stack dump in nmi_cpu_backtrace().

John Ogness

[0] https://lore.kernel.org/lkml/20210330153512.1182-1-john.ogness@linutronix.de

John Ogness (6):
  lib/nmi_backtrace: explicitly serialize banner and regs
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
 kernel/printk/printk.c         | 273 +++++++++++++++----------
 kernel/printk/printk_safe.c    | 361 +--------------------------------
 kernel/trace/trace.c           |   2 -
 lib/nmi_backtrace.c            |  13 +-
 14 files changed, 176 insertions(+), 540 deletions(-)


base-commit: 48e72544d6f06daedbf1d9b14610be89dba67526
-- 
2.20.1

