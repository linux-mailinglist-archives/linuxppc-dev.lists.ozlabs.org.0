Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 478E6628570
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 17:31:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9vvd10clz3f3W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 03:31:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AqUN9haB;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=mZitRJc9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AqUN9haB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=mZitRJc9;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9vsl1bVkz2xJ7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 03:29:47 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668443384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WoAi/IMpBqhMANDygn8dBGFjZ2GQ0xeR1eRQRwl7/a4=;
	b=AqUN9haBzsP/HqmGWn7LninVTZwjqkkysLnOs9sIGh9FQdeeoKz7Gzt8aR3TUbQRR01ZD0
	4fbSxfS2xwqbCSk4MGPZ/h9nKiWaZCjsUIYMtNaGYmCBLCtSYOMuMh/nWAMO/VbVximvSY
	qhW7QXGBolQdpr6mlObUNHsK8ptW93CSvfm/UHosiEe1R7oHb4NKrx2oEcBhHONoCsUtip
	WtYNXCCYjG94gDQtWriUL2ugK+/1sNbhHMGID8IONHOaIp2MmkGweRmUbLmExqlun3O0/3
	16w4tC2pTh/0J4jTDAOoYO6LCO0OnMhXfiIRwUwS9CBL567Glz7vkU5qaYTNSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668443384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WoAi/IMpBqhMANDygn8dBGFjZ2GQ0xeR1eRQRwl7/a4=;
	b=mZitRJc9FS7M35SEGDgcrp6yBIpx7ZU+LTSfluPEhBlQEioB3RYMPItGTx/ey2cplmPiur
	1rbpiEy4260r+8BA==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH printk v4 24/39] tty: hvc: use console_is_registered()
Date: Mon, 14 Nov 2022 17:35:17 +0106
Message-Id: <20221114162932.141883-25-john.ogness@linutronix.de>
In-Reply-To: <20221114162932.141883-1-john.ogness@linutronix.de>
References: <20221114162932.141883-1-john.ogness@linutronix.de>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is not reliable to check for CON_ENABLED in order to identify if a
console is registered. Use console_is_registered() instead.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 drivers/tty/hvc/hvc_console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index 4802cfaa107f..a683e21df19c 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -264,8 +264,8 @@ static void hvc_port_destruct(struct tty_port *port)
 
 static void hvc_check_console(int index)
 {
-	/* Already enabled, bail out */
-	if (hvc_console.flags & CON_ENABLED)
+	/* Already registered, bail out */
+	if (console_is_registered(&hvc_console))
 		return;
 
  	/* If this index is what the user requested, then register
-- 
2.30.2

