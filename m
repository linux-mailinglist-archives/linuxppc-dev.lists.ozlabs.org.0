Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A2D32B67C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 11:15:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dr8z00KvWz3d31
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 21:15:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PqRXCroI;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=QohrIoky;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=PqRXCroI; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=QohrIoky; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dr8yZ2X0wz30Nb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 21:15:34 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614766529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=N/VAkqWLBfS766I7n05L//Xhy4zYhpBosb29O0wTdfI=;
 b=PqRXCroIP1umtmHt8c1ZfO2I6XBiNXbdZol38HcPrbsLXce6jhNCPzL73X+NxuMXd9VicB
 2GT3tLSfL/RPGsg1xcWreJMLgg7ctu4acVEggflP6m0fWffYMd9g5MMJYZbQSUhV7/BhCl
 kObz+ZwiKqb9Arvy5udqLHUz3XGQeyi3ynwoKTYlr/mBTmlLtXFKolBpnxCqntVZOwFOhw
 jtZVyEPv9Z+rfaHWSPfE1AJbPHUkZwnEIzm3d+WghCeafjzT1gbK+JpBQah2oWq42SpmX6
 1EVYua2XPXwecaqR+MUsx3IazCaXKtWyRAm/rrlJNOayG6J8ZhCn5m4arNTfaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614766529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=N/VAkqWLBfS766I7n05L//Xhy4zYhpBosb29O0wTdfI=;
 b=QohrIokyE6gvAlbHH+2ScIj3BnDnIlGTQqJn9ICwNv8CCj3w8J2dv2/UuBk4gUkvEzJngE
 +7ihcslvjpCg8LCQ==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH next v4 00/15] printk: remove logbuf_lock
Date: Wed,  3 Mar 2021 11:15:13 +0100
Message-Id: <20210303101528.29901-1-john.ogness@linutronix.de>
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
 Douglas Anderson <dianders@chromium.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Meyer <thomas@m3y3r.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 Jordan Niethe <jniethe5@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Wei Li <liwei391@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 Alistair Popple <alistair@popple.id.au>, Jeff Dike <jdike@addtoit.com>,
 Colin Cross <ccross@android.com>, linux-um@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Nicholas Piggin <npiggin@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Sumit Garg <sumit.garg@linaro.org>,
 Tony Luck <tony.luck@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Here is v4 of a series to remove @logbuf_lock, exposing the
ringbuffer locklessly to both readers and writers. v3 is
here [0].

Since @logbuf_lock was protecting much more than just the
ringbuffer, this series clarifies and cleans up the various
protections using comments, lockless accessors, atomic types,
and a new finer-grained @syslog_lock.

Removing @logbuf_lock required changing the semantics of the
kmsg_dumper callback in order to work locklessly. This series
adjusts all kmsg_dumpers and users of the kmsg_dump_get_*()
functions for the new semantics.

This series is based on next-20210303.

Changes since v3:

- disable interrupts in the arch/um kmsg_dumper

- reduce CONSOLE_LOG_MAX value from 4096 back to 1024 to revert
  the increasd 3KiB static memory footprint

- change the kmsg_dumper() callback prototype back to how it
  was because some dumpers need the registered object for
  container_of() usage

- for kmsg_dump_get_line()/kmsg_dump_get_buffer() restrict the
  minimal allowed sequence number to the cleared sequence number

John Ogness

[0] https://lore.kernel.org/lkml/20210225202438.28985-1-john.ogness@linutronix.de/

John Ogness (15):
  um: synchronize kmsg_dumper
  mtd: mtdoops: synchronize kmsg_dumper
  printk: limit second loop of syslog_print_all
  printk: kmsg_dump: remove unused fields
  printk: refactor kmsg_dump_get_buffer()
  printk: consolidate kmsg_dump_get_buffer/syslog_print_all code
  printk: introduce CONSOLE_LOG_MAX
  printk: use seqcount_latch for clear_seq
  printk: use atomic64_t for devkmsg_user.seq
  printk: add syslog_lock
  printk: kmsg_dumper: remove @active field
  printk: introduce a kmsg_dump iterator
  printk: remove logbuf_lock
  printk: kmsg_dump: remove _nolock() variants
  printk: console: remove unnecessary safe buffer usage

 arch/powerpc/kernel/nvram_64.c |   8 +-
 arch/powerpc/xmon/xmon.c       |   6 +-
 arch/um/kernel/kmsg_dump.c     |  13 +-
 drivers/hv/vmbus_drv.c         |   4 +-
 drivers/mtd/mtdoops.c          |  17 +-
 fs/pstore/platform.c           |   5 +-
 include/linux/kmsg_dump.h      |  47 ++--
 kernel/debug/kdb/kdb_main.c    |  10 +-
 kernel/printk/internal.h       |   4 +-
 kernel/printk/printk.c         | 464 +++++++++++++++++----------------
 kernel/printk/printk_safe.c    |  27 +-
 11 files changed, 310 insertions(+), 295 deletions(-)

-- 
2.20.1

