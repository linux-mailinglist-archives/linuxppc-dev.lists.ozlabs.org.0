Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD9C89BBC3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 11:32:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bfcnoJT+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCkQr2b01z3vX7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 19:32:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bfcnoJT+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=64.147.123.152; helo=wfhigh1-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCkQ56YX4z3d2S
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 19:32:11 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id 982A7180011C;
	Mon,  8 Apr 2024 05:32:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 08 Apr 2024 05:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1712568725; x=1712655125; bh=6/G3q7w8RbEyu
	FhhtNgh7QXuPLfMG6eTAQmhdSZyUho=; b=bfcnoJT+rIPCc9WTuyJZ90kzRHSOk
	v+HdMhdzUdfW1efA00XCKwkQ8HE2pIley67LOhz7uDQ7Joy0ssXOTiOFJnetet8f
	OPU1kLGvgZ4S/EMjd7drRpI/I3k8MNnzlliSGryYV7anYjGVX68bnGA5/iK5yFDw
	ibTmWDP5r0ZS+KD84fbg17nNd0AySMMahIuQMP8ZC5b71yESF23xkODHEyJ9v0+P
	EYy9uPmPpktdTQVI3ktZL/e4baRINJyS6uZ9qvZ9hMkE5Lx8PFsRcJZahpiiW+Jk
	u5bGiHNN5oqi5UdpevTgCFXWaDVsQckdS0XMFbh3RNxkNzrwTD6fBkSVQ==
X-ME-Sender: <xms:lLkTZplfTkJe9pJz1rCoJcDjpqTPcEmimm3apJ1VWnhupDQNmDWMQw>
    <xme:lLkTZk1GRLzKPlowigYZ6m6K0UgkKGYQxDQy4ap-9DXfsAIt8JCH3oZ8k6O3gNU-G
    1Xn662C0pCMADKLuD4>
X-ME-Received: <xmr:lLkTZvp0lwzhZ-PmP_u5fT5_hhN5T9m851Q89IkWCcU6nqdnr7cZ-5Nw1tyLCc0s-ah0DZUY8qNKYtuKxbBm4ANiFN491DxMMVI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudegiedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepvfevkffhufffsedttdertddttddtnecuhfhrohhmpefhihhnnhcuvfhhrghi
    nhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrh
    hnpefftdekheelvddvtdetudelhfehhfejjeeuudeileettdeuleeigeefkeehvdevffen
    ucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhi
    nhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:lLkTZpnW8FYJAYWpZVyqzrojcb1Fc33HlL8ue9PA3lQ0S-ekU02eHQ>
    <xmx:lLkTZn2ZqCSvTAindZMKK8DPQ5LaodKoVLxppVzNl3HpAbo1qw5Kpg>
    <xmx:lLkTZotE0nuRbO_nisM7Cgs213CsDO73U6X2vIL0rCBP0GOBg0htFA>
    <xmx:lLkTZrWi3c7DYC81O-MygdtBybl9EhatpQ6db1b6kgucHP5TOHSkOA>
    <xmx:lbkTZu1iukWOt7h6iHDq1vghN_guy7LnSoBqzAo8595fjpWle76hDS4o>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Apr 2024 05:32:00 -0400 (EDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Jiri Slaby <jirislaby@kernel.org>
Message-Id: <e853cf2c762f23101cd2ddec0cc0c2be0e72685f.1712568223.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v3] serial/pmac_zilog: Remove flawed mitigation for rx irq flood
Date: Mon, 08 Apr 2024 19:23:43 +1000
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
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, stable@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The mitigation was intended to stop the irq completely. That may be
better than a hard lock-up but it turns out that you get a crash anyway
if you're using pmac_zilog as a serial console:

ttyPZ0: pmz: rx irq flood !
BUG: spinlock recursion on CPU#0, swapper/0

That's because the pr_err() call in pmz_receive_chars() results in
pmz_console_write() attempting to lock a spinlock already locked in
pmz_interrupt(). With CONFIG_DEBUG_SPINLOCK=y, this produces a fatal
BUG splat. The spinlock in question is the one in struct uart_port.

Even when it's not fatal, the serial port rx function ceases to work.
Also, the iteration limit doesn't play nicely with QEMU, as can be
seen in the bug report linked below.

A web search for other reports of the error message "pmz: rx irq flood"
didn't produce anything. So I don't think this code is needed any more.
Remove it.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: stable@kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Link: https://github.com/vivier/qemu-m68k/issues/44
Link: https://lore.kernel.org/all/1078874617.9746.36.camel@gaston/
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
Changed since v1:
 - Reworked commit log according to comments from Andy Shevchenko.

Changed since v2:
 - Added Acked-by and Cc tags.
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

