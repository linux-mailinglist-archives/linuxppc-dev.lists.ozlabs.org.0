Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B1D8A49E6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 10:12:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJ0JP44mlz3vc5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 18:12:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zte.com.cn (client-ip=63.216.63.40; helo=mxhk.zte.com.cn; envelope-from=li.hao40@zte.com.cn; receiver=lists.ozlabs.org)
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJ0Hx0gMhz2xWS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 18:11:41 +1000 (AEST)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4VJ0Hr0d3Jz8XrX5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 16:11:36 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4VJ0Hh3JRfz4x6Cv;
	Mon, 15 Apr 2024 16:11:28 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 43F8BAi3077398;
	Mon, 15 Apr 2024 16:11:10 +0800 (+08)
	(envelope-from li.hao40@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Mon, 15 Apr 2024 16:11:12 +0800 (CST)
Date: Mon, 15 Apr 2024 16:11:12 +0800 (CST)
X-Zmail-TransId: 2af9661ce120659-9735b
X-Mailer: Zmail v1.0
Message-ID: <20240415161112945aW_GWw4iCWkUKN0lMSy-k@zte.com.cn>
Mime-Version: 1.0
From: <li.hao40@zte.com.cn>
To: <jirislaby@kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYzXSB0dHk6IGh2Yzogd2FrZXVwIGh2YyBjb25zb2xlIGltbWVkaWF0ZWx5IHdoZW4gbmVlZGVk?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 43F8BAi3077398
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 661CE138.000/4VJ0Hr0d3Jz8XrX5
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
Cc: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Li Hao <li.hao40@zte.com.cn>

Cancel the do_wakeup flag in hvc_struct, and change it to immediately
wake up tty when hp->n_outbuf is 0 in hvc_push().

When we receive a key input character, the interrupt handling function
hvc_handle_interrupt() will be executed, and the echo thread
flush_to_ldisc() will be added to the queue.

If the user is currently using tcsetattr(), a hang may occur. tcsetattr()
enters kernel and waits for hp->n_outbuf to become 0 via
tty_wait_until_sent(). If the echo thread finishes executing before
reaching tty_wait_until_sent (for example, put_chars() takes too long),
it will cause while meeting the wakeup condition (hp->do_wakeup = 1),
tty_wait_until_sent() cannot be woken up (missed the tty_wakeup() of
this round's tty_poll). Unless the next key input character comes,
hvc_poll will be executed, and tty_wakeup() will be performed through
the do_wakeup flag.

Signed-off-by: Li Hao <li.hao40@zte.com.cn>
---
v2->v3:
According to:
https://lore.kernel.org/all/2024041531-caliber-overreach-2d4e@gregkh/
    no change,place version information below the "---" line
v1->v2:
Some fixes according to:
https://lore.kernel.org/all/75dff5cd-7b0e-4039-9157-8bf10cf7ba29@kernel.org/
    use tty_port_tty_wakeup() instead of tty_wakeup() to wake up tty

 drivers/tty/hvc/hvc_console.c | 10 +++-------
 drivers/tty/hvc/hvc_console.h |  1 -
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index cd1f657f7..cbd234847 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -480,7 +480,7 @@ static int hvc_push(struct hvc_struct *hp)
 	n = hp->ops->put_chars(hp->vtermno, hp->outbuf, hp->n_outbuf);
 	if (n <= 0) {
 		if (n == 0 || n == -EAGAIN) {
-			hp->do_wakeup = 1;
+			tty_port_tty_wakeup(&hp->port);
 			return 0;
 		}
 		/* throw away output on error; this happens when
@@ -491,7 +491,7 @@ static int hvc_push(struct hvc_struct *hp)
 	if (hp->n_outbuf > 0)
 		memmove(hp->outbuf, hp->outbuf + n, hp->n_outbuf);
 	else
-		hp->do_wakeup = 1;
+		tty_port_tty_wakeup(&hp->port);

 	return n;
 }
@@ -739,11 +739,7 @@ static int __hvc_poll(struct hvc_struct *hp, bool may_sleep)
 	poll_mask |= HVC_POLL_READ;

  out:
-	/* Wakeup write queue if necessary */
-	if (hp->do_wakeup) {
-		hp->do_wakeup = 0;
-		tty_wakeup(tty);
-	}
+	/* Wakeup in hvc_push */
  bail:
 	spin_unlock_irqrestore(&hp->lock, flags);

diff --git a/drivers/tty/hvc/hvc_console.h b/drivers/tty/hvc/hvc_console.h
index cf4c1af08..6622f71ba 100644
--- a/drivers/tty/hvc/hvc_console.h
+++ b/drivers/tty/hvc/hvc_console.h
@@ -36,7 +36,6 @@ struct hvc_struct {
 	struct tty_port port;
 	spinlock_t lock;
 	int index;
-	int do_wakeup;
 	int outbuf_size;
 	int n_outbuf;
 	uint32_t vtermno;
-- 
2.25.1
