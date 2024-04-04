Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E81F899221
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 01:32:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bVtCQEka;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9dDw5PR5z3vZV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:32:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bVtCQEka;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=103.168.172.153; helo=fhigh2-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9dD41Kywz3cGY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 10:31:14 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 7F3841140105;
	Thu,  4 Apr 2024 19:31:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 04 Apr 2024 19:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1712273470; x=1712359870; bh=pK0jqIblLjOpZ
	HzUGqOIz32gEstS475diijrXkvB3eA=; b=bVtCQEkankDw3t6RGYiDd8/EY4b+5
	OzQ9bQO+z+fvSgLNl4Hihj/3+1Iyt/j/7mRvoNEdx9nq0mzoPY82XWtyZ6CSelPJ
	hTMmdx59Zi1PlM439ffPVs8D6dHkR2+WxZxgJlt/NR3Ad1oBZUAh9wSbEnd6Abiw
	eZiiU7nZQmEespjylXWF4NzO3fpesz6tvLToDVZwG0/Kjyudz/odn0nT26lnK+m+
	EzMUyA2YkcTH03g6pmPgKPNIwAh14/8ZpFNQvnv7YvVLYtcqXpGRYXUQsicsQQLL
	60/U1Av/QVDDm7Xuzzq2wfz2uYrvA/Dsa++yY9htMb+aLQzBwGBfaUGlQ==
X-ME-Sender: <xms:PTgPZiIYUQgfXdEe2xMm6RNyfQ9Ax0Tys96XO8zAiceVf7ZEVrmsdw>
    <xme:PTgPZqLug2l4k5bBmMT7AD0W_AlvjhEHFlW3copE2AghsDdWIV4ay6MPjgLElFJ2g
    JaX5IP8W_fOczojAag>
X-ME-Received: <xmr:PTgPZit_SuYal7Dwk2kbRLRnYZP7JMuu0UwIps91x6C4ER09IjsEvH6sygZj46dOB8DrcWkWPzAW3iRUKjVVz_Q8wQnX50hILEs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudefledgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepvfevkffhufffsedttdertddttddtnecuhfhrohhmpefhihhnnhcuvfhhrghi
    nhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrh
    hnpefftdekheelvddvtdetudelhfehhfejjeeuudeileettdeuleeigeefkeehvdevffen
    ucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhi
    nhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:PTgPZnYzgMZqTR9eF0t2MW4RQMMnH5xqPRNnqU0AnmpCIYqoUvnT_A>
    <xmx:PTgPZpax3bPUEitnmylwi9RrEP0uTOGwHsuDo3ZplnQqvvPXd0f_QQ>
    <xmx:PTgPZjD9Hw4wmx-HpbYzcz-5yMeY0kIz_0QGqEcP2rsyMf3ndWf0Tw>
    <xmx:PTgPZvZ-9TuHrTyx0lF6wnPMq_srWjKCDVH-0PJoQ9ruq4NwESpiTw>
    <xmx:PjgPZtpVPFHDMi94NCjMIl9Z1y5zCPxerLPUSPRZGYZ9sMIgh69zrJHO>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Apr 2024 19:31:07 -0400 (EDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Jiri Slaby <jirislaby@kernel.org>
Message-Id: <0df45bedded1249f6c6ec2c2fb0d9879da1841b7.1712273040.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v2] serial/pmac_zilog: Remove flawed mitigation for rx irq flood
Date: Fri, 05 Apr 2024 10:24:00 +1100
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
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-m68k@lists.linux-m68k.org, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
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

Link: https://github.com/vivier/qemu-m68k/issues/44
Link: https://lore.kernel.org/all/1078874617.9746.36.camel@gaston/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
Changed since v1:
 - Reworked commit log according to comments from Andy Shevchenko.
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

