Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE78888F64A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 05:22:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dJV840id;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4r3J3J5Dz3vZ6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 15:22:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dJV840id;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=103.168.172.157; helo=fhigh6-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 472 seconds by postgrey-1.37 at boromir; Thu, 28 Mar 2024 15:21:25 AEDT
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4r2Y2B5Zz3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 15:21:24 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 24D1011400C2;
	Thu, 28 Mar 2024 00:13:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 28 Mar 2024 00:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1711599208; x=1711685608; bh=PFSjeCNInVlPz
	MwtfABdaCtL50AVt6DS4rR8uU9qVFA=; b=dJV840idAKbWgfPOKxQq5R3Ya2erO
	632BFa50LyB+rF/oXEgSO5eeYRy3wpb2k7AV0ZPL8hUZvY17q0BBcXT+2HL7MTC5
	fKr5bheHYLQOiTlmtDnRUg6e8oI8d3w5XgPjoVXgpQObuyCC8Poke7cYl8cWm3uA
	IxtylW9v7pUuSixm0jLn8I/sSZnYyLNGIF+HVC2qX3Rhu/t0/DlAW95oVlVilreL
	8rJzq3DQympuEUuRaxYsGs4DeMQtMX6XTgSATwgomS3xju1JJi8H80nR0tokO3a4
	ffoCR+F4BEuHdznGK0mXo/KgkfVss1FiYmT2Id/QQBdjVsns697Gx/8pA==
X-ME-Sender: <xms:Z-4EZtW9sGHkAE5P5IW9unHoHwXTVaEhFpGEa0ag4cXgrLjbfEMXDw>
    <xme:Z-4EZtlNIGGyFGa_PfauAIx939e0cTbWn9wQVTHdMb_Ddxbv27xsiwFbVXePT8X-2
    LztX84KvMvSi_kSmp0>
X-ME-Received: <xmr:Z-4EZpZzHkqoYVk8I6XXnR1VFpzOenAP1fYsZJNhYJAV4X0IG0dCI-xK7-7JrDUdOYQiNNoCn4JuCj6jwMlR-mjMiseG0C4-eO8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddukedgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepvfevkffhufffsedttdertddttddtnecuhfhrohhmpefhihhnnhcuvfhhrghi
    nhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrh
    hnpefftdekheelvddvtdetudelhfehhfejjeeuudeileettdeuleeigeefkeehvdevffen
    ucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhi
    nhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:Z-4EZgVn-9FX5IVSZ4KdzMDQxfE5zO7GOMUlocXThVU6ex-10moDGg>
    <xmx:Z-4EZnkfedE5vA1LimZh1WjTvnrTtIIjOHdqqPXatJ3MHSluaTdbMw>
    <xmx:Z-4EZte4S3VfBZ1_bnG8adCaT5QwilkhMKulm3usniKos_G7gyhBbQ>
    <xmx:Z-4EZhFvIERXJczd-lxGK2mkHZkUOKOEG9yxy0q4pVTGPGvhiSTfNQ>
    <xmx:aO4EZq9VeudhiX1tmT6VOSH7ouy7St9EA7KWmtlRji4NmFwB4enYBA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Mar 2024 00:13:24 -0400 (EDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Jiri Slaby <jirislaby@kernel.org>
Message-Id: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq flood
Date: Thu, 28 Mar 2024 15:11:33 +1100
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
Cc: linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-m68k@lists.linux-m68k.org, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The mitigation was intended to stop the irq completely. That might have
been better than a hard lock-up but it turns out that you get a crash
anyway if you're using pmac_zilog as a serial console.

That's because the pr_err() call in pmz_receive_chars() results in
pmz_console_write() attempting to lock a spinlock already locked in
pmz_interrupt(). With CONFIG_DEBUG_SPINLOCK=y, this produces a fatal
BUG splat like the one below. (The spinlock at 0x62e140 is the one in
struct uart_port.)

Even when it's not fatal, the serial port rx function ceases to work.
Also, the iteration limit doesn't play nicely with QEMU. Please see
bug report linked below.

A web search for reports of the error message "pmz: rx irq flood" didn't
produce anything. So I don't think this code is needed any more. Remove it.

[   14.560000] ttyPZ0: pmz: rx irq flood !
[   14.560000] BUG: spinlock recursion on CPU#0, swapper/0
[   14.560000]  lock: 0x62e140, .magic: dead4ead, .owner: swapper/0, .owner_cpu: 0
[   14.560000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.8.0-mac-dbg-preempt-00004-g4143b7b9144a #1
[   14.560000] Stack from 0059bcc4:
[   14.560000]         0059bcc4 0056316f 0056316f 00002700 004b6444 0059bce4 004ad8c6 0056316f
[   14.560000]         0059bd10 004a6546 00556759 0062e140 dead4ead 0059f892 00000000 00000000
[   14.560000]         0062e140 0059bde8 005c03d0 0059bd24 0004daf6 0062e140 005567bf 0062e140
[   14.560000]         0059bd34 004b64c2 0062e140 00000001 0059bd50 002e15ea 0062e140 00000001
[   14.560000]         0059bde7 0059bde8 005c03d0 0059bdac 0005124e 005c03d0 005cdc00 0000002b
[   14.560000]         005a3caa 005a3caa 00000000 0059bde8 0004ff00 0059be8b 00038200 000529ba
[   14.560000] Call Trace: [<00002700>] ret_from_kernel_thread+0xc/0x14
[   14.560000]  [<004b6444>] _raw_spin_lock+0x0/0x28
[   14.560000]  [<004ad8c6>] dump_stack+0x10/0x16
[   14.560000]  [<004a6546>] spin_dump+0x6e/0x7c
[   14.560000]  [<0004daf6>] do_raw_spin_lock+0x9c/0xa6
[   14.560000]  [<004b64c2>] _raw_spin_lock_irqsave+0x2a/0x34
[   14.560000]  [<002e15ea>] pmz_console_write+0x32/0x9a
[   14.560000]  [<0005124e>] console_flush_all+0x112/0x3a2
[   14.560000]  [<0004ff00>] console_trylock+0x0/0x7a
[   14.560000]  [<00038200>] parameq+0x48/0x6e
[   14.560000]  [<000529ba>] __printk_safe_enter+0x0/0x36
[   14.560000]  [<0005113c>] console_flush_all+0x0/0x3a2
[   14.560000]  [<000542c4>] prb_read_valid+0x0/0x1a
[   14.560000]  [<004b65a4>] _raw_spin_unlock+0x0/0x38
[   14.560000]  [<0005151e>] console_unlock+0x40/0xb8
[   14.560000]  [<00038200>] parameq+0x48/0x6e
[   14.560000]  [<002c778c>] __tty_insert_flip_string_flags+0x0/0x14e
[   14.560000]  [<00051798>] vprintk_emit+0x156/0x238
[   14.560000]  [<00051894>] vprintk_default+0x1a/0x1e
[   14.560000]  [<000529a8>] vprintk+0x74/0x86
[   14.560000]  [<004a6596>] _printk+0x12/0x16
[   14.560000]  [<002e23be>] pmz_receive_chars+0x1cc/0x394
[   14.560000]  [<004b6444>] _raw_spin_lock+0x0/0x28
[   14.560000]  [<00038226>] parse_args+0x0/0x3a6
[   14.560000]  [<004b6466>] _raw_spin_lock+0x22/0x28
[   14.560000]  [<002e26b4>] pmz_interrupt+0x12e/0x1e0
[   14.560000]  [<00048680>] arch_cpu_idle_enter+0x0/0x8
[   14.560000]  [<00054ebc>] __handle_irq_event_percpu+0x24/0x106
[   14.560000]  [<004ae576>] default_idle_call+0x0/0x46
[   14.560000]  [<00055020>] handle_irq_event+0x30/0x90
[   14.560000]  [<00058320>] handle_simple_irq+0x5e/0xc0
[   14.560000]  [<00048688>] arch_cpu_idle_exit+0x0/0x8
[   14.560000]  [<00054800>] generic_handle_irq+0x3c/0x4a
[   14.560000]  [<00002978>] do_IRQ+0x24/0x3a
[   14.560000]  [<004ae508>] cpu_idle_poll.isra.0+0x0/0x6e
[   14.560000]  [<00002874>] auto_irqhandler_fixup+0x4/0xc
[   14.560000]  [<004ae508>] cpu_idle_poll.isra.0+0x0/0x6e
[   14.560000]  [<004ae576>] default_idle_call+0x0/0x46
[   14.560000]  [<004ae598>] default_idle_call+0x22/0x46
[   14.560000]  [<00048710>] do_idle+0x6a/0xf0
[   14.560000]  [<000486a6>] do_idle+0x0/0xf0
[   14.560000]  [<000367d2>] find_task_by_pid_ns+0x0/0x2a
[   14.560000]  [<0005d064>] __rcu_read_lock+0x0/0x12
[   14.560000]  [<00048a5a>] cpu_startup_entry+0x18/0x1c
[   14.560000]  [<00063a06>] __rcu_read_unlock+0x0/0x26
[   14.560000]  [<004ae65a>] kernel_init+0x0/0xfa
[   14.560000]  [<0049c5a8>] strcpy+0x0/0x1e
[   14.560000]  [<004a6584>] _printk+0x0/0x16
[   14.560000]  [<0049c72a>] strlen+0x0/0x22
[   14.560000]  [<006452d4>] memblock_alloc_try_nid+0x0/0x82
[   14.560000]  [<0063939a>] arch_post_acpi_subsys_init+0x0/0x8
[   14.560000]  [<0063991e>] console_on_rootfs+0x0/0x60
[   14.560000]  [<00638410>] _sinittext+0x410/0xadc
[   14.560000]

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: linux-m68k@lists.linux-m68k.org
Link: https://github.com/vivier/qemu-m68k/issues/44
Link: https://lore.kernel.org/all/1078874617.9746.36.camel@gaston/
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 drivers/tty/serial/pmac_zilog.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
index c8bf08c19c64..77691fbbf779 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -210,7 +210,6 @@ static bool pmz_receive_chars(struct uart_pmac_port *uap)
 {
 	struct tty_port *port;
 	unsigned char ch, r1, drop, flag;
-	int loops = 0;
 
 	/* Sanity check, make sure the old bug is no longer happening */
 	if (uap->port.state == NULL) {
@@ -291,24 +290,11 @@ static bool pmz_receive_chars(struct uart_pmac_port *uap)
 		if (r1 & Rx_OVR)
 			tty_insert_flip_char(port, 0, TTY_OVERRUN);
 	next_char:
-		/* We can get stuck in an infinite loop getting char 0 when the
-		 * line is in a wrong HW state, we break that here.
-		 * When that happens, I disable the receive side of the driver.
-		 * Note that what I've been experiencing is a real irq loop where
-		 * I'm getting flooded regardless of the actual port speed.
-		 * Something strange is going on with the HW
-		 */
-		if ((++loops) > 1000)
-			goto flood;
 		ch = read_zsreg(uap, R0);
 		if (!(ch & Rx_CH_AV))
 			break;
 	}
 
-	return true;
- flood:
-	pmz_interrupt_control(uap, 0);
-	pmz_error("pmz: rx irq flood !\n");
 	return true;
 }
 
-- 
2.39.3

