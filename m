Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4F81E9525
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 06:18:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ZQ5z5Ls9zDqR5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 14:18:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49ZPw76nP2zDqly
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 May 2020 14:09:59 +1000 (AEST)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 5FCE927F1F; Sat, 30 May 2020 19:20:33 -0400 (EDT)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-Id: <996f835d2f3d90baaaf9ee954e252d06e8886c6f.1590880623.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1590880623.git.fthain@telegraphics.com.au>
References: <cover.1590880623.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 2/8] macintosh/adb-iop: Correct comment text
Date: Sun, 31 May 2020 09:17:03 +1000
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
Cc: linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch improves comment style and corrects some misunderstandings
in the text.

Cc: Joshua Thompson <funaho@jurai.org>
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/macintosh/adb-iop.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/macintosh/adb-iop.c b/drivers/macintosh/adb-iop.c
index ce28ff40fb9c..ca3b411b0742 100644
--- a/drivers/macintosh/adb-iop.c
+++ b/drivers/macintosh/adb-iop.c
@@ -101,11 +101,10 @@ static void adb_iop_listen(struct iop_msg *msg)
 
 	req = current_req;
 
-	/* Handle a timeout. Timeout packets seem to occur even after */
-	/* we've gotten a valid reply to a TALK, so I'm assuming that */
-	/* a "timeout" is actually more like an "end-of-data" signal. */
-	/* We need to send back a timeout packet to the IOP to shut   */
-	/* it up, plus complete the current request, if any.          */
+	/* Handle a timeout. Timeout packets seem to occur even after
+	 * we've gotten a valid reply to a TALK, presumably because of
+	 * autopolling.
+	 */
 
 	if (amsg->flags & ADB_IOP_TIMEOUT) {
 		msg->reply[0] = ADB_IOP_TIMEOUT | ADB_IOP_AUTOPOLL;
@@ -115,9 +114,6 @@ static void adb_iop_listen(struct iop_msg *msg)
 			adb_iop_end_req(req, idle);
 		}
 	} else {
-		/* TODO: is it possible for more than one chunk of data  */
-		/*       to arrive before the timeout? If so we need to */
-		/*       use reply_ptr here like the other drivers do.  */
 		if ((adb_iop_state == awaiting_reply) &&
 		    (amsg->flags & ADB_IOP_EXPLICIT)) {
 			req->reply_len = amsg->count + 1;
@@ -152,23 +148,24 @@ static void adb_iop_start(void)
 
 	local_irq_save(flags);
 
-	/* The IOP takes MacII-style packets, so */
-	/* strip the initial ADB_PACKET byte.    */
-
+	/* The IOP takes MacII-style packets, so strip the initial
+	 * ADB_PACKET byte.
+	 */
 	amsg.flags = ADB_IOP_EXPLICIT;
 	amsg.count = req->nbytes - 2;
 
-	/* amsg.data immediately follows amsg.cmd, effectively making */
-	/* amsg.cmd a pointer to the beginning of a full ADB packet.  */
+	/* amsg.data immediately follows amsg.cmd, effectively making
+	 * &amsg.cmd a pointer to the beginning of a full ADB packet.
+	 */
 	memcpy(&amsg.cmd, req->data + 1, req->nbytes - 1);
 
 	req->sent = 1;
 	adb_iop_state = sending;
 	local_irq_restore(flags);
 
-	/* Now send it. The IOP manager will call adb_iop_complete */
-	/* when the packet has been sent.                          */
-
+	/* Now send it. The IOP manager will call adb_iop_complete
+	 * when the message has been sent.
+	 */
 	iop_send_message(ADB_IOP, ADB_CHAN, req, sizeof(amsg), (__u8 *)&amsg,
 			 adb_iop_complete);
 }
-- 
2.26.2

