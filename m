Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C6861F57C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 15:18:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5YHd15w3z3f3D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 01:18:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2DMdV6P5;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jYEgYMmb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2DMdV6P5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jYEgYMmb;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5YFj1kLlz3cGD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 01:16:57 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1667830600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zf2Nnq9aaBhq9OyJBdbPoPZazbYrZ5ZYcguoDhN8w38=;
	b=2DMdV6P5I8sPplJufSLuueHeVl4bvVMKaOCMLHG/8T/fwK7DAOABqqdX7aJ+59oIKbSeI/
	jxIUQ7vmqJIWBg5uBPUnLwho/ozyVcK4cifb7E8MZWqNAgvSZcTQkooqi2XOBJKmdFoPe0
	S/wZC7FHNIjNqHF8aKh2I4aJghp93sxvUy5SQTr2sLIW2gINDw/7UBtkXqGJH9YxH5hhOO
	0O67dTObUBp0/Va8bcvOAkYNduQYwv+rsV/BkAAXQ2emD/fAX8uWsiRgCCzSlHK71l+mxd
	DWhAO2yHDDwVwuy7tiy10mhyFAMcwaRZxpwSCRbmOIfW9QXr83hR7vV88Ebaiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1667830600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zf2Nnq9aaBhq9OyJBdbPoPZazbYrZ5ZYcguoDhN8w38=;
	b=jYEgYMmbvDXYj7DRG/zDjOcuyxgqHf6CJ4sMHlEhQTQPnAhOStcpCmHEsG9VmODdbETAmt
	FuRjrih+zd0krvCw==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH printk v3 00/40] reduce console_lock scope
Date: Mon,  7 Nov 2022 15:21:58 +0106
Message-Id: <20221107141638.3790965-1-john.ogness@linutronix.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>, kgdb-bugreport@lists.sourceforge.net, Lai Jiangshan <jiangshanlai@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, Joel Fernandes <joel@joelfernandes.org>, Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Daniel Thompson <daniel.thompson@linaro.org>, linux-samsung-soc@vger.kernel.org, Tom Rix <trix@redhat.com>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Peter Zijlstra <peterz@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org, Aaron Tomlin <atomlin@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@lin
 ux.intel.com>, Paolo Abeni <pabeni@redhat.com>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Michal Simek <michal.simek@xilinx.com>, "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, linux-um@lists.infradead.org, Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>, Lukas Wunner <lukas@wunner.de>, Thomas Zimmermann <tzimmermann@suse.de>, Jas
 on Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is v3 of a series to prepare for threaded/atomic
printing. v2 is here [0]. This series focuses on reducing the
scope of the BKL console_lock. It achieves this by switching to
SRCU and a dedicated mutex for console list iteration and
modification, respectively. The console_lock will no longer
offer this protection and is completely removed from
(un)register_console() and console_stop/start() code.

Also, during the review of v2 it came to our attention that
many console drivers are checking CON_ENABLED to see if they
are registered. Because this flag can change without
unregistering and because this flag does not represent an
atomic point when an (un)registration process is complete,
a new console_is_registered() function is introduced. This
function uses the console_list_lock to synchronize with the
(un)registration process to provide a reliable status.

All users of the console_lock for list iteration have been
modified. For the call sites where the console_lock is still
needed (because of other reasons), comments are added to
explain exactly why the console_lock was needed.

All users of CON_ENABLED for registration status have been
modified to use console_is_registered(). Note that there are
still users of CON_ENABLED, but this is for legitimate purposes
about a registered console being able to print.

The base commit for this series is from Paul McKenney's RCU tree
and provides an NMI-safe SRCU implementation [1]. Without the
NMI-safe SRCU implementation, this series is not less safe than
mainline. But we will need the NMI-safe SRCU implementation for
atomic consoles anyway, so we might as well get it in
now. Especially since it _does_ increase the reliability for
mainline in the panic path.

Changes since v3:

general:

- introduce a synchronized console_is_registered() to query if
  a console is registered, meant to replace CON_ENABLED
  (mis)use for this purpose

- directly read console->flags for registered consoles if it is
  race-free (and document that it is so)

- replace uart_console_enabled() with a new
  uart_console_registered() based on console_is_registered()

- change comments about why console_lock is used to synchronize
  console->device() by providing an example

registration check fixups:

- the following drivers were modified to use the new
  console_is_registered() instead of CON_ENABLED checks

   - arch/m68k/emu/nfcon.c
   - drivers/firmware/efi/earlycon.c
   - drivers/net/netconsole.c
   - drivers/tty/hvc/hvc_console.c
   - drivers/tty/serial/8250/8250_core.c
   - drivers/tty/serial/earlycon.c
   - drivers/tty/serial/pic32_uart.c
   - drivers/tty/serial/samsung_tty.c
   - drivers/tty/serial/serial_core.c
   - drivers/tty/serial/xilinx_uartps.c
   - drivers/usb/early/xhci-dbc.c

um: kmsg_dumper:

- change stdout dump criteria to match original intention

kgdb/kdb:

- in configure_kgdboc(), take console_list_lock to synchronize
  tty_find_polling_driver() against register_console()

- add comments explaining why calling console->write() without
  locking might work

tty: sh-sci:

- use a setup() callback to setup the early console

fbdev: xen:

- implement a cleaner approach for
  console_force_preferred_locked()

rcu:

- implement debug_lockdep_rcu_enabled() for
  !CONFIG_DEBUG_LOCK_ALLOC

printk:

- check CONFIG_DEBUG_LOCK_ALLOC for srcu_read_lock_held()
  availability

- for console_lock/_trylock/_unlock, replace "lock the console
  system" language with "block the console subsystem from
  printing"

- use WRITE_ONCE() for updating console->flags of registered
  consoles

- expand comments of synchronize_srcu() calls to explain why
  they are needed, and also expand comments to explain when it
  is not needed

- change CON_BOOT consoles to always begin at earliest message

- for non-BOOT/non-PRINTBUFFER consoles, initialize @seq to the
  minimal @seq of any of the enabled boot consoles

- add comments and lockdep assertion to
  unregister_console_locked() because it is not clear from the
  name which lock is implied

- dropped patches that caused unnecessary churn in the series

John Ogness

[0] https://lore.kernel.org/lkml/20221019145600.1282823-1-john.ogness@linutronix.de
[1] https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/log/?h=srcunmisafe.2022.10.21a

John Ogness (38):
  rcu: implement lockdep_rcu_enabled for !CONFIG_DEBUG_LOCK_ALLOC
  printk: Prepare for SRCU console list protection
  printk: fix setting first seq for consoles
  um: kmsg_dump: only dump when no output console available
  console: introduce console_is_enabled() wrapper
  printk: use console_is_enabled()
  um: kmsg_dump: use console_is_enabled()
  kdb: kdb_io: use console_is_enabled()
  um: kmsg_dumper: use srcu console list iterator
  tty: serial: kgdboc: document console_lock usage
  tty: tty_io: document console_lock usage
  proc: consoles: document console_lock usage
  kdb: use srcu console list iterator
  printk: console_flush_all: use srcu console list iterator
  printk: console_unblank: use srcu console list iterator
  printk: console_flush_on_panic: use srcu console list iterator
  printk: console_device: use srcu console list iterator
  printk: __pr_flush: use srcu console list iterator
  printk: introduce console_list_lock
  console: introduce console_is_registered()
  serial_core: replace uart_console_enabled() with
    uart_console_registered()
  tty: nfcon: use console_is_registered()
  efi: earlycon: use console_is_registered()
  tty: hvc: use console_is_registered()
  tty: serial: earlycon: use console_is_registered()
  tty: serial: pic32_uart: use console_is_registered()
  tty: serial: samsung_tty: use console_is_registered()
  tty: serial: xilinx_uartps: use console_is_registered()
  usb: early: xhci-dbc: use console_is_registered()
  netconsole: avoid CON_ENABLED misuse to track registration
  printk, xen: fbfront: create/use safe function for forcing preferred
  tty: tty_io: use console_list_lock for list synchronization
  proc: consoles: use console_list_lock for list iteration
  tty: serial: kgdboc: use console_list_lock for list traversal
  tty: serial: kgdboc: synchronize tty_find_polling_driver() and
    register_console()
  tty: serial: kgdboc: use console_list_lock to trap exit
  printk: relieve console_lock of list synchronization duties
  tty: serial: sh-sci: use setup() callback for early console

Thomas Gleixner (2):
  serial: kgdboc: Lock console list in probe function
  printk: Convert console_drivers list to hlist

 .clang-format                       |   1 +
 arch/m68k/emu/nfcon.c               |  10 +-
 arch/um/kernel/kmsg_dump.c          |  24 +-
 drivers/firmware/efi/earlycon.c     |   8 +-
 drivers/net/netconsole.c            |  21 +-
 drivers/tty/hvc/hvc_console.c       |   4 +-
 drivers/tty/serial/8250/8250_core.c |   2 +-
 drivers/tty/serial/earlycon.c       |   4 +-
 drivers/tty/serial/kgdboc.c         |  46 ++-
 drivers/tty/serial/pic32_uart.c     |   4 +-
 drivers/tty/serial/samsung_tty.c    |   2 +-
 drivers/tty/serial/serial_core.c    |  14 +-
 drivers/tty/serial/sh-sci.c         |  17 +-
 drivers/tty/serial/xilinx_uartps.c  |   2 +-
 drivers/tty/tty_io.c                |  18 +-
 drivers/usb/early/xhci-dbc.c        |   2 +-
 drivers/video/fbdev/xen-fbfront.c   |  12 +-
 fs/proc/consoles.c                  |  21 +-
 include/linux/console.h             | 111 +++++++-
 include/linux/rcupdate.h            |   5 +
 include/linux/serial_core.h         |  15 +-
 kernel/debug/kdb/kdb_io.c           |  14 +-
 kernel/printk/printk.c              | 424 +++++++++++++++++++++-------
 23 files changed, 605 insertions(+), 176 deletions(-)


base-commit: e29a4915db1480f96e0bc2e928699d086a71f43c
-- 
2.30.2

