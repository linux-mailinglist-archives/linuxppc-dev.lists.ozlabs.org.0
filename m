Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 801211DAF0F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 11:41:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rnnj081pzDqVK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 19:41:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=jslaby@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rnkq0BN9zDqVF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 19:38:58 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EFB83AC61;
 Wed, 20 May 2020 09:38:57 +0000 (UTC)
Subject: Re: [PATCH] tty: hvc: Fix data abort due to race in hvc_open
To: rananta@codeaurora.org, Greg KH <gregkh@linuxfoundation.org>
References: <20200428032601.22127-1-rananta@codeaurora.org>
 <20200506094851.GA2787548@kroah.com>
 <98bbe7afabf48d8e8fe839fdc9e836a5@codeaurora.org>
 <20200510064819.GB3400311@kroah.com>
 <77d889be4e0cb0e6e30f96199e2d843d@codeaurora.org>
 <20200511073913.GA1347819@kroah.com>
 <0f7791f5-0a53-59f6-7277-247a789f30c2@suse.cz>
 <20200512082551.GA3526567@kroah.com>
 <417b1d320bda37410788430979dd708d@codeaurora.org>
 <20200513070403.GB764901@kroah.com>
 <0ab0b49f19b824ac1c4db4c4937ed388@codeaurora.org>
From: Jiri Slaby <jslaby@suse.cz>
Autocrypt: addr=jslaby@suse.cz; prefer-encrypt=mutual; keydata=
 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
Message-ID: <cb5bd2b2-f33a-b541-ed3c-70da14c7252d@suse.cz>
Date: Wed, 20 May 2020 11:38:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <0ab0b49f19b824ac1c4db4c4937ed388@codeaurora.org>
Content-Type: multipart/mixed; boundary="------------37BE8DE752E63BA265E3EAA7"
Content-Language: en-US
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
Cc: andrew@daynix.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------37BE8DE752E63BA265E3EAA7
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

On 15. 05. 20, 1:22, rananta@codeaurora.org wrote:
> On 2020-05-13 00:04, Greg KH wrote:
>> On Tue, May 12, 2020 at 02:39:50PM -0700, rananta@codeaurora.org wrote:
>>> On 2020-05-12 01:25, Greg KH wrote:
>>> > On Tue, May 12, 2020 at 09:22:15AM +0200, Jiri Slaby wrote:
>>> > > commit bdb498c20040616e94b05c31a0ceb3e134b7e829
>>> > > Author: Jiri Slaby <jslaby@suse.cz>
>>> > > Date:   Tue Aug 7 21:48:04 2012 +0200
>>> > >
>>> > >     TTY: hvc_console, add tty install
>>> > >
>>> > > added hvc_install but did not move 'tty->driver_data = NULL;' from
>>> > > hvc_open's fail path to hvc_cleanup.
>>> > >
>>> > > IOW hvc_open now NULLs tty->driver_data even for another task which
>>> > > opened the tty earlier. The same holds for
>>> > > "tty_port_tty_set(&hp->port,
>>> > > NULL);" there. And actually "tty_port_put(&hp->port);" is also
>>> > > incorrect
>>> > > for the 2nd task opening the tty.
>>> > >

...

> These are the traces you get when the issue happens:
> [  154.212291] hvc_install called for pid: 666
> [  154.216705] hvc_open called for pid: 666
> [  154.233657] hvc_open: request_irq failed with rc -22.
> [  154.238934] hvc_open called for pid: 678
> [  154.243012] Unable to handle kernel NULL pointer dereference at
> virtual address 00000000000000c4
> # hvc_install isn't called for pid: 678 as the file wasn't closed yet.

Nice. Does the attached help?

I wonder how comes the tty_port_put in hvc_open does not cause a UAF? I
would say hvc_open fails, tty_port_put is called. It decrements the
reference taken in hvc_install. So far so good.

Now, this should happen IMO:
tty_open
  -> hvc_open (fails)
    -> tty_port_put
  -> tty_release
    -> tty_release_struct
      -> tty_kref_put
        -> queue_release_one_tty
SCHEDULED WORKQUEUE
release_one_tty
  -> hvc_cleanup
    -> tty_port_put (should die terrible death now)

What am I missing?

thanks,
-- 
js
suse labs

--------------37BE8DE752E63BA265E3EAA7
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-hvc_console-fix-open.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-hvc_console-fix-open.patch"

From d891cdfcbd3b41eb23ddfc8d9e6cbe038ff8fb72 Mon Sep 17 00:00:00 2001
From: Jiri Slaby <jslaby@suse.cz>
Date: Wed, 20 May 2020 11:29:25 +0200
Subject: [PATCH] hvc_console: fix open

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
---
 drivers/tty/hvc/hvc_console.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index 436cc51c92c3..cdcc64ea2554 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -371,15 +371,14 @@ static int hvc_open(struct tty_struct *tty, struct file * filp)
 	 * tty fields and return the kref reference.
 	 */
 	if (rc) {
-		tty_port_tty_set(&hp->port, NULL);
-		tty->driver_data = NULL;
-		tty_port_put(&hp->port);
 		printk(KERN_ERR "hvc_open: request_irq failed with rc %d.\n", rc);
-	} else
+	} else {
 		/* We are ready... raise DTR/RTS */
 		if (C_BAUD(tty))
 			if (hp->ops->dtr_rts)
 				hp->ops->dtr_rts(hp, 1);
+		tty_port_set_initialized(&hp->port, true);
+	}
 
 	/* Force wakeup of the polling thread */
 	hvc_kick();
@@ -389,22 +388,12 @@ static int hvc_open(struct tty_struct *tty, struct file * filp)
 
 static void hvc_close(struct tty_struct *tty, struct file * filp)
 {
-	struct hvc_struct *hp;
+	struct hvc_struct *hp = tty->driver_data;
 	unsigned long flags;
 
 	if (tty_hung_up_p(filp))
 		return;
 
-	/*
-	 * No driver_data means that this close was issued after a failed
-	 * hvc_open by the tty layer's release_dev() function and we can just
-	 * exit cleanly because the kref reference wasn't made.
-	 */
-	if (!tty->driver_data)
-		return;
-
-	hp = tty->driver_data;
-
 	spin_lock_irqsave(&hp->port.lock, flags);
 
 	if (--hp->port.count == 0) {
@@ -412,6 +401,9 @@ static void hvc_close(struct tty_struct *tty, struct file * filp)
 		/* We are done with the tty pointer now. */
 		tty_port_tty_set(&hp->port, NULL);
 
+		if (!tty_port_initialized(&hp->port))
+			return;
+
 		if (C_HUPCL(tty))
 			if (hp->ops->dtr_rts)
 				hp->ops->dtr_rts(hp, 0);
@@ -428,6 +420,7 @@ static void hvc_close(struct tty_struct *tty, struct file * filp)
 		 * waking periodically to check chars_in_buffer().
 		 */
 		tty_wait_until_sent(tty, HVC_CLOSE_WAIT);
+		tty_port_set_initialized(&hp->port, false);
 	} else {
 		if (hp->port.count < 0)
 			printk(KERN_ERR "hvc_close %X: oops, count is %d\n",
-- 
2.26.2


--------------37BE8DE752E63BA265E3EAA7--
