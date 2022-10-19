Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F35BE604A76
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 17:05:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsvDD04pDz3dsT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 02:05:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CJ0wkcfD;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4/3XcDP9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CJ0wkcfD;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4/3XcDP9;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsvCD266mz2yZd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 02:04:24 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1666191367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q43bR7EIdzwEejtqYY/+0pBZ/1DlBf/ms3Th4977RU4=;
	b=CJ0wkcfDAIYxYlfRDwtWDHTwKRBKnIGO7mDk96DEhEfPYYF1oPQuNnmaWMjNVFx82t2g2p
	vzwkF94n0h7nEyhv0U93cY/SDg0gFrPMaHBWZPIoWnM4PkhT8ENrt1zwlq56m266UfO6ok
	E2Pf4W9zbKKXLfOeDb67zW0A+t3HCRbpaPaonrDqlLifvlY/UNRbzMHnKW0rU52czq11LU
	2QA4703MQAMlTBiSbe41rKt7kIT0G7svma7Brz2sKaxLCd0oZwJQ/auRydmpv7zgddgQ7Z
	KT6cqgK7jbmb4Yo+LE3H9hyyE9UAia6OLCMO0LrI4vSPeblK36wIq1qdR3Gn5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1666191367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q43bR7EIdzwEejtqYY/+0pBZ/1DlBf/ms3Th4977RU4=;
	b=4/3XcDP9JpywLbtVPvYMt3perm+LULFBKeOfwGqUTnu4+/A8q5xycmiCMFah2+WEFeLmuc
	PyYB51N0P1g/zmCw==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH printk v2 10/38] tty: hvc: use console_is_enabled()
Date: Wed, 19 Oct 2022 17:01:32 +0206
Message-Id: <20221019145600.1282823-11-john.ogness@linutronix.de>
In-Reply-To: <20221019145600.1282823-1-john.ogness@linutronix.de>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
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
Cc: linuxppc-dev@lists.ozlabs.org, Xianting Tian <xianting.tian@linux.alibaba.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shile Zhang <shile.zhang@linux.alibaba.com>, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace (console->flags & CON_ENABLED) usage with console_is_enabled().

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/tty/hvc/hvc_console.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index 4802cfaa107f..6d1d7b72488c 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -265,7 +265,7 @@ static void hvc_port_destruct(struct tty_port *port)
 static void hvc_check_console(int index)
 {
 	/* Already enabled, bail out */
-	if (hvc_console.flags & CON_ENABLED)
+	if (console_is_enabled(&hvc_console))
 		return;
 
  	/* If this index is what the user requested, then register
-- 
2.30.2

