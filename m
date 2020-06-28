Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0EB20C5F1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 06:38:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vdCr35qVzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 14:38:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=telegraphics.com.au (client-ip=98.124.60.144;
 helo=kvm5.telegraphics.com.au; envelope-from=fthain@telegraphics.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=telegraphics.com.au
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 49vd4N4TmXzDr0v
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 14:31:48 +1000 (AEST)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 9C4E32970B; Sun, 28 Jun 2020 00:31:44 -0400 (EDT)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-Id: <754cddfa045e5bfa53e5da199831de02e7d2f27f.1593318192.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1593318192.git.fthain@telegraphics.com.au>
References: <cover.1593318192.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 5/9] macintosh/via-macii: Handle poll replies correctly
Date: Sun, 28 Jun 2020 14:23:12 +1000
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linuxppc-dev@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Userspace applications may use /dev/adb to send Talk requests. Such
requests always have req->reply_expected == 1. The same is true of Talk
requests sent by the kernel, except for poll requests queued internally
by the via-macii driver. Those requests have req->reply_expected == 0.

Consequently, poll reply packets get treated like autopoll reply packets.
(It doesn't make sense to try to distinguish them.) Always enter 'reading'
state after a poll request, so that the reply gets collected and passed
to adb_input(), and none go missing.

All Talk replies passed to adb_input() come from polling or autopolling,
so call adb_input() with the autopoll parameter set to 1.

Fixes: d95fd5fce88f0 ("m68k: Mac II ADB fixes") # v5.0+
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/macintosh/via-macii.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/macintosh/via-macii.c b/drivers/macintosh/via-macii.c
index d29c87943ca46..8d5ef77b4a435 100644
--- a/drivers/macintosh/via-macii.c
+++ b/drivers/macintosh/via-macii.c
@@ -463,6 +463,21 @@ static irqreturn_t macii_interrupt(int irq, void *arg)
 
 				via[ACR] &= ~SR_OUT;
 				x = via[SR];
+			} else if ((req->data[1] & OP_MASK) == TALK) {
+				macii_state = reading;
+
+				reading_reply = 0;
+				reply_ptr = reply_buf;
+				*reply_ptr = req->data[1];
+				reply_len = 1;
+
+				via[ACR] &= ~SR_OUT;
+				x = via[SR];
+
+				req->complete = 1;
+				current_req = req->next;
+				if (req->done)
+					(*req->done)(req);
 			} else {
 				macii_state = idle;
 
@@ -510,8 +525,9 @@ static irqreturn_t macii_interrupt(int irq, void *arg)
 					current_req = req->next;
 					if (req->done)
 						(*req->done)(req);
-				} else if (reply_len && autopoll_devs) {
-					adb_input(reply_buf, reply_len, 0);
+				} else if (reply_len && autopoll_devs &&
+					   reply_buf[0] == last_poll_cmd) {
+					adb_input(reply_buf, reply_len, 1);
 				}
 				break;
 			}
-- 
2.26.2

