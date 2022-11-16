Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE5162C41F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:23:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7cz4X5bz3f4t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:22:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GzY5cgND;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vFkQ9WmG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GzY5cgND;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vFkQ9WmG;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7c25Y4fz3bYF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:22:10 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668615717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VtCslIGlEzy614T2a8IHyZzYUS3h+qQy0DKVc9BzNdg=;
	b=GzY5cgNDoWBa/lbOwfd9mX/PwG123YTrjFa/2RWy/MxTGTTbo5ThPzbyy9v6dG3zYsF1pZ
	N+iegswchbcXUAHRtbTykseR0L6W+HQIgfgiX9SSYYN5RgrOfoZwE1DQPFiaVifugRbmwD
	AyBCdUHkwK+OSb4pBPykW240H0ST1UqF503Aq8rnG+/8xoyKFITxQ5Wo6+vQYoyof/YpGg
	mwgQRVb20rIizIFIJqJNAksD+xCwoZHyDaiU+3Ezmava1OwpI8+ReSgzmSupdlYX72TX7m
	HSxs3KVDXxdWRzVgOd+h/0zRrlR+P8zbX1vczS2jWcXMvKgDHE79PmhU5YDATQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668615717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VtCslIGlEzy614T2a8IHyZzYUS3h+qQy0DKVc9BzNdg=;
	b=vFkQ9WmGMftRn2ZYMrgPBYAnAbFOKcqTla1ih+Fi5GvDPVQBXzB/7++jTAHdNGmTFP2e82
	KdXuR59uIU7zsfBw==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH printk v5 00/40] reduce console_lock scope
Date: Wed, 16 Nov 2022 17:27:12 +0106
Message-Id: <20221116162152.193147-1-john.ogness@linutronix.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net, dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Daniel Thompson <daniel.thompson@linaro.org>, linux-samsung-soc@vger.kernel.org, Tom Rix <trix@redhat.com>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org, Aaron Tomlin <atomlin@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Paolo Abeni <pabeni@redhat.com>, Michal Simek <michal.simek@xilinx.com>, linux-um@lists.
 infradead.org, Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org, Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>, Lukas Wunner <lukas@wunner.de>, Thomas Zimmermann <tzimmermann@suse.de>, Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is v5 of a series to prepare for threaded/atomic
printing. v4 is here [0]. This series focuses on reducing the
scope of the BKL console_lock. It achieves this by switching to
SRCU and a dedicated mutex for console list iteration and
modification, respectively. The console_lock will no longer
offer this protection.

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
needed (for other reasons), comments are added to explain
exactly why the console_lock is needed.

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

Changes since v4:

printk:

- Introduce console_init_seq() to handle the now rather complex
  procedure to find an appropriate start sequence number for a
  new console upon registration.

- When registering a non-boot console and boot consoles are
  registered, try to flush all the consoles to get the next @seq
  value before falling back to use the @seq of the enabled boot
  console that is furthest behind.

- For console_force_preferred_locked(), make the console the
  head of the console list.

John Ogness

[0] https://lore.kernel.org/lkml/20221114162932.141883-1-john.ogness@linutronix.de
[1] https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/log/?h=srcunmisafe.2022.11.09a

John Ogness (38):
  printk: Prepare for SRCU console list protection
  printk: register_console: use "registered" for variable names
  printk: move @seq initialization to helper
  printk: fix setting first seq for consoles
  um: kmsg_dump: only dump when no output console available
  tty: serial: kgdboc: document console_lock usage
  tty: tty_io: document console_lock usage
  proc: consoles: document console_lock usage
  printk: introduce console_list_lock
  console: introduce wrappers to read/write console flags
  um: kmsg_dumper: use srcu console list iterator
  kdb: use srcu console list iterator
  printk: console_flush_all: use srcu console list iterator
  printk: __pr_flush: use srcu console list iterator
  printk: console_is_usable: use console_srcu_read_flags
  printk: console_unblank: use srcu console list iterator
  printk: console_flush_on_panic: use srcu console list iterator
  printk: console_device: use srcu console list iterator
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
  tty: serial: kgdboc: use srcu console list iterator
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
 arch/m68k/emu/nfcon.c               |   9 +-
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
 drivers/tty/serial/sh-sci.c         |  20 +-
 drivers/tty/serial/xilinx_uartps.c  |   2 +-
 drivers/tty/tty_io.c                |  18 +-
 drivers/usb/early/xhci-dbc.c        |   2 +-
 drivers/video/fbdev/xen-fbfront.c   |  12 +-
 fs/proc/consoles.c                  |  21 +-
 include/linux/console.h             | 129 +++++++-
 include/linux/serial_core.h         |  10 +-
 kernel/debug/kdb/kdb_io.c           |  18 +-
 kernel/printk/printk.c              | 493 +++++++++++++++++++++-------
 22 files changed, 680 insertions(+), 184 deletions(-)


base-commit: f733615e39aa2d6ddeef33b7b2c9aa6a5a2c2785
-- 
2.30.2

