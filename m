Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3F63257CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 21:36:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dml1S5TTdz3dCM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 07:36:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Itg1HgnA;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=R+fgiTn8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=Itg1HgnA; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=R+fgiTn8; 
 dkim-atps=neutral
X-Greylist: delayed 606 seconds by postgrey-1.36 at boromir;
 Fri, 26 Feb 2021 07:34:57 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dml013ltgz3cYQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 07:34:57 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614284679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qDVKAKnnfPFs0Dxv5+kX2VVyNzrYE33K+BDYTVeJME8=;
 b=Itg1HgnAQey3puEfZXpKRRf1RkHbrPWXsodppd3f9/agHLs59mQxmZvHrDVfXhn7TF2e+X
 YgctQb8llo4ek4IXOH40pHKrSlSJUv+qmqSuRbNPlwERu5vmF3/VXIexN4FpY+8WHM5d4n
 3zHVITkWvbjhosz0zzfOytwQyTccmRTsG9uKDQ/PoVKslKdevkHeAS8FY/vBbTk7ZYAmwx
 j9C6lcv4wUAstQLOYdbQOINDWx2UjXbjMRmTNEt/9KnzbRIvSmj2EXQuCLrXAd5jyQHGnB
 6degQSHuHB1F0v3eFX0HxngBtbRJympKrqQjrUQzvVBIk1MNI805LQYIDMpUAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614284679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qDVKAKnnfPFs0Dxv5+kX2VVyNzrYE33K+BDYTVeJME8=;
 b=R+fgiTn80NtyboUkoI+34S01BUhJK8k4MSy2VNzuYCNOKjN83g0YvSMQCLvesqnrTwxeYZ
 t+PogSzB5duz2fCg==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH next v3 00/15] printk: remove logbuf_lock
Date: Thu, 25 Feb 2021 21:24:23 +0100
Message-Id: <20210225202438.28985-1-john.ogness@linutronix.de>
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
Cc: linux-hyperv@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Douglas Anderson <dianders@chromium.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Meyer <thomas@m3y3r.de>,
 Kees Cook <keescook@chromium.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 Joel Stanley <joel@jms.id.au>, Jordan Niethe <jniethe5@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Wei Li <liwei391@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Alistair Popple <alistair@popple.id.au>, Jeff Dike <jdike@addtoit.com>,
 Colin Cross <ccross@android.com>, linux-um@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Nicholas Piggin <npiggin@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Sumit Garg <sumit.garg@linaro.org>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Here is v3 of a series to remove @logbuf_lock, exposing the
ringbuffer locklessly to both readers and writers. v2 is here [0].

Since @logbuf_lock was protecting much more than just the
ringbuffer, this series clarifies and cleans up the various
protections using comments, lockless accessors, atomic types, and a
new finer-grained @syslog_lock.

Removing @logbuf_lock required changing the semantics of the
kmsg_dumper callback in order to work locklessly. Since this
involved touching all the kmsg_dump users, we also decided [1] to
use this opportunity to clean up and clarify the kmsg_dump semantics
in general.

This series is based on next-20210225.

Changes since v2:

- use get_maintainer.pl to get the full list of developers that
  should at least see the changes in their respective areas

- do not disable interrupts in arch/um kmsg_dumper (because there is
  no need to)

- protect the mtd/mtdoops kmsg_dumper buffer against concurrent
  dumps

- update kerneldoc for kmsg_dump_get_line() (@len_out)

- remove ksmg_dump's @active flag

- change kmsg_dumper callback to:
  void (*dump)(enum kmsg_dump_reason reason);

- rename kmsg_dumper_iter to kmsg_dump_iter

- update kmsg_dumpers to use their own kmsg_dump_iter (and
  initialize it with kmsg_dump_rewind() if necessary)

John Ogness

[0] https://lkml.kernel.org/r/20210218081817.28849-1-john.ogness@linutronix.de
[1] https://lkml.kernel.org/r/YDeZAA08NKCHa4s%2F@alley

John Ogness (15):
  um: synchronize kmsg_dumper
  mtd: mtdoops: synchronize kmsg_dumper
  printk: limit second loop of syslog_print_all
  printk: kmsg_dump: remove unused fields
  printk: refactor kmsg_dump_get_buffer()
  printk: consolidate kmsg_dump_get_buffer/syslog_print_all code
  printk: introduce CONSOLE_LOG_MAX for improved multi-line support
  printk: use seqcount_latch for clear_seq
  printk: use atomic64_t for devkmsg_user.seq
  printk: add syslog_lock
  printk: kmsg_dumper: remove @active field
  printk: introduce a kmsg_dump iterator
  printk: remove logbuf_lock
  printk: kmsg_dump: remove _nolock() variants
  printk: console: remove unnecessary safe buffer usage

 arch/powerpc/kernel/nvram_64.c             |  14 +-
 arch/powerpc/platforms/powernv/opal-kmsg.c |   3 +-
 arch/powerpc/xmon/xmon.c                   |   6 +-
 arch/um/kernel/kmsg_dump.c                 |  15 +-
 drivers/hv/vmbus_drv.c                     |   7 +-
 drivers/mtd/mtdoops.c                      |  20 +-
 fs/pstore/platform.c                       |   8 +-
 include/linux/kmsg_dump.h                  |  49 +--
 kernel/debug/kdb/kdb_main.c                |  10 +-
 kernel/printk/internal.h                   |   4 +-
 kernel/printk/printk.c                     | 456 ++++++++++-----------
 kernel/printk/printk_safe.c                |  27 +-
 12 files changed, 309 insertions(+), 310 deletions(-)

-- 
2.20.1

