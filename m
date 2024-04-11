Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6986E8A21EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 00:53:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFw366hlHz3vdF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 08:53:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zte.com.cn (client-ip=58.251.27.85; helo=mxct.zte.com.cn; envelope-from=li.hao40@zte.com.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 602 seconds by postgrey-1.37 at boromir; Fri, 12 Apr 2024 00:00:44 AEST
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFhDX6xk1z3cT2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 00:00:43 +1000 (AEST)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4VFh0m2txQz5Sfs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 21:50:32 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4VFh0k5Tntz6Tjrk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 21:50:30 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4VFh0V5pn9z8XrRB;
	Thu, 11 Apr 2024 21:50:18 +0800 (CST)
Received: from xaxapp03.zte.com.cn ([10.88.97.17])
	by mse-fl1.zte.com.cn with SMTP id 43BDoDmT006048;
	Thu, 11 Apr 2024 21:50:13 +0800 (+08)
	(envelope-from li.hao40@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid31;
	Thu, 11 Apr 2024 21:50:17 +0800 (CST)
Date: Thu, 11 Apr 2024 21:50:17 +0800 (CST)
X-Zmail-TransId: 2afa6617ea99ffffffffb9d-ff120
X-Mailer: Zmail v1.0
Message-ID: <20240411215017604oDcKsSipiLnfwd2SzAnsj@zte.com.cn>
Mime-Version: 1.0
From: <li.hao40@zte.com.cn>
To: <jirislaby@kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSB0dHk6IGh2Yzogd2FrZXVwIGh2YyBjb25zb2xlIGltbWVkaWF0ZWx5IHdoZW4gbmVlZGVk?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 43BDoDmT006048
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6617EAA7.000/4VFh0m2txQz5Sfs
X-Mailman-Approved-At: Fri, 12 Apr 2024 08:53:00 +1000
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
this round&apos;s tty_poll). Unless the next key input character comes,
hvc_poll will be executed, and tty_wakeup() will be performed through
the do_wakeup flag.

Signed-off-by: Li Hao
---
drivers/tty/hvc/hvc_console.c | 12 +++++-------
drivers/tty/hvc/hvc_console.h |  1 -
2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index cdcc64ea2554..4f06aead690a 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -476,11 +476,13 @@ static void hvc_hangup(struct tty_struct *tty)
static int hvc_push(struct hvc_struct *hp)
{
 	int n;
+	struct tty_struct *tty;

 	n = hp->ops->put_chars(hp->vtermno, hp->outbuf, hp->n_outbuf);
+	tty = tty_port_tty_get(&hp->port);
 	if (n <= 0) {
 		if (n == 0 || n == -EAGAIN) {
-			hp->do_wakeup = 1;
+			tty_wakeup(tty);
 			return 0;
 		}
 		/* throw away output on error; this happens when
@@ -491,7 +493,7 @@ static int hvc_push(struct hvc_struct *hp)
 	if (hp->n_outbuf > 0)
 		memmove(hp->outbuf, hp->outbuf + n, hp->n_outbuf);
 	else
-		hp->do_wakeup = 1;
+		tty_wakeup(tty);

 	return n;
}
@@ -739,11 +741,7 @@ static int __hvc_poll(struct hvc_struct *hp, bool may_sleep)
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
index 18d005814e4b..164ae2c82b98 100644
--- a/drivers/tty/hvc/hvc_console.h
+++ b/drivers/tty/hvc/hvc_console.h
@@ -36,7 +36,6 @@ struct hvc_struct {
 	struct tty_port port;
 	spinlock_t lock;
 	int index;
-	int do_wakeup;
 	char *outbuf;
 	int outbuf_size;
 	int n_outbuf;
--
2.25.1
