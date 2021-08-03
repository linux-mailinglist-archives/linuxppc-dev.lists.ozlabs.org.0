Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 858003DFAE2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 07:06:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GffpN2VLlz3cSn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 15:06:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zk5sPz0A;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eiwsN3XD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=zk5sPz0A; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=eiwsN3XD; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfFfw2GDVz307C
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Aug 2021 23:13:12 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1627996383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zratP/d2dqbzr5A3KZPCTDEa+UpOjiFaTT3D2EIH/Pg=;
 b=zk5sPz0A/N68QiMZNa4XnUH53XQGAkBgxmMF9RdDFSoOGdHXqC//ofK9o10vkQtIIgxpxy
 o3gzfJIWcGuD/7CJSo5P2+b6eNhxoNOxZol539AjZC3laI2y9WkzZGJ7p/8XuGC/SI6py5
 6Mpztfu+HxmsRcOTqIZJcFq3yrOVV08E2vhgrY8or5Z3uRGykD2IiT/TXmzbGy4LL+sBHS
 cGTPp1pxVnfmrDUBXMNIf7pO9xGKJUUaHa3+Iftq3TyMFoNPnqWV077wktj4wMXkILY+0N
 qrvzjb5E1n/5VK5Jn8gch/Yneaa2fDy8JybmbeFc/b2DSqzfflXIeOBn73Azfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1627996383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zratP/d2dqbzr5A3KZPCTDEa+UpOjiFaTT3D2EIH/Pg=;
 b=eiwsN3XDO7gIOKIO/tyPKCl9YBM/K+0P9ejFJ1AFeHJgY6RpWMpxmcaTC14bbaMpVCrVQI
 kAWF+aftd/6aNtAw==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH printk v1 00/10] printk: introduce atomic consoles and sync
 mode
Date: Tue,  3 Aug 2021 15:18:51 +0206
Message-Id: <20210803131301.5588-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Aug 2021 15:05:41 +1000
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Al Cooper <alcooperx@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Cengiz Can <cengiz@kernel.wtf>,
 Chengyang Fan <cy.fan@huawei.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, Changbin Du <changbin.du@intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
 linux-mediatek@lists.infradead.org,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, linux-mips@vger.kernel.org,
 Wang Qing <wangqing@vivo.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Johan Hovold <johan@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sedat Dilek <sedat.dilek@gmail.com>, Claire Chang <tientzu@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrij Abyzov <aabyzov@slb.com>, linux-arm-kernel@lists.infradead.org,
 Sumit Garg <sumit.garg@linaro.org>,
 kuldip dwivedi <kuldip.dwivedi@puresoftware.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zhang Qilong <zhangqilong3@huawei.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Guenter Roeck <linux@roeck-us.net>, Jason Wessel <jason.wessel@windriver.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, linuxppc-dev@lists.ozlabs.org,
 Vitor Massaru Iha <vitor@massaru.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This is the next part of our printk-rework effort (points 3 and
4 of the LPC 2019 summary [0]).

Here the concept of "atomic consoles" is introduced through  a
new (optional) write_atomic() callback for console drivers. This
callback must be implemented as an NMI-safe variant of the
write() callback, meaning that it can function from any context
without relying on questionable tactics such as ignoring locking
and also without relying on the synchronization of console
semaphore.

As an example of how such an atomic console can look like, this
series implements write_atomic() for the 8250 UART driver.

This series also introduces a new console printing mode called
"sync mode" that is only activated when the kernel is about to
end (such as panic, oops, shutdown, reboot). Sync mode can only
be activated if atomic consoles are available. A system without
registered atomic consoles will be unaffected by this series.

When in sync mode, the console printing behavior becomes:

- only consoles implementing write_atomic() will be called

- printing occurs within vprintk_store() instead of
  console_unlock(), since the console semaphore is irrelevant
  for atomic consoles

For systems that have registered atomic consoles, this series
improves the reliability of seeing crash messages by using new
locking techniques rather than "ignoring locks and hoping for
the best". In particular, atomic consoles rely on the
CPU-reentrant spinlock (i.e. the printk cpulock) for
synchronizing console output.

John Ogness

[0] https://lore.kernel.org/lkml/87k1acz5rx.fsf@linutronix.de/

John Ogness (10):
  printk: relocate printk cpulock functions
  printk: rename printk cpulock API and always disable interrupts
  kgdb: delay roundup if holding printk cpulock
  printk: relocate printk_delay()
  printk: call boot_delay_msec() in printk_delay()
  printk: use seqcount_latch for console_seq
  console: add write_atomic interface
  printk: introduce kernel sync mode
  kdb: if available, only use atomic consoles for output mirroring
  serial: 8250: implement write_atomic

 arch/powerpc/include/asm/smp.h         |   1 +
 arch/powerpc/kernel/kgdb.c             |  10 +-
 arch/powerpc/kernel/smp.c              |   5 +
 arch/x86/kernel/kgdb.c                 |   9 +-
 drivers/tty/serial/8250/8250.h         |  47 ++-
 drivers/tty/serial/8250/8250_core.c    |  17 +-
 drivers/tty/serial/8250/8250_fsl.c     |   9 +
 drivers/tty/serial/8250/8250_ingenic.c |   7 +
 drivers/tty/serial/8250/8250_mtk.c     |  29 +-
 drivers/tty/serial/8250/8250_port.c    |  92 ++--
 drivers/tty/serial/8250/Kconfig        |   1 +
 include/linux/console.h                |  32 ++
 include/linux/kgdb.h                   |   3 +
 include/linux/printk.h                 |  57 +--
 include/linux/serial_8250.h            |   5 +
 kernel/debug/debug_core.c              |  45 +-
 kernel/debug/kdb/kdb_io.c              |  16 +
 kernel/printk/printk.c                 | 554 +++++++++++++++++--------
 lib/Kconfig.debug                      |   3 +
 lib/dump_stack.c                       |   4 +-
 lib/nmi_backtrace.c                    |   4 +-
 21 files changed, 684 insertions(+), 266 deletions(-)


base-commit: 23d8adcf8022b9483605531d8985f5b77533cb3a
-- 
2.20.1

