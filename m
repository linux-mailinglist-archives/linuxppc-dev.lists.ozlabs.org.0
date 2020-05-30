Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C13441E9521
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 06:13:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ZQ0Q1JzmzDqlr
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 14:13:42 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49ZPw62YZGzDqll
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 May 2020 14:09:58 +1000 (AEST)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 4FC8B27FE0; Sat, 30 May 2020 19:20:34 -0400 (EDT)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-Id: <dedcdfc62f43e85cc4c2a8d211a7e2fec7bc7c1a.1590880623.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1590880623.git.fthain@telegraphics.com.au>
References: <cover.1590880623.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 6/8] macintosh/adb-iop: Implement idle -> sending state
 transition
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

In the present algorithm, the 'idle' state transition does not take
place until there's a bus timeout. Once idle, the driver does not
automatically proceed with the next request.

Change the algorithm so that queued ADB requests will be sent as soon as
the driver becomes idle. This is to take place after the current IOP
message is completed.

Cc: Joshua Thompson <funaho@jurai.org>
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/macintosh/adb-iop.c | 43 +++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/macintosh/adb-iop.c b/drivers/macintosh/adb-iop.c
index a2b28e09f2ce..f22792c95d4f 100644
--- a/drivers/macintosh/adb-iop.c
+++ b/drivers/macintosh/adb-iop.c
@@ -54,13 +54,19 @@ struct adb_driver adb_iop_driver = {
 	.reset_bus    = adb_iop_reset_bus
 };
 
-static void adb_iop_end_req(struct adb_request *req, int state)
+static void adb_iop_done(void)
 {
+	struct adb_request *req = current_req;
+
+	adb_iop_state = idle;
+
 	req->complete = 1;
 	current_req = req->next;
 	if (req->done)
 		(*req->done)(req);
-	adb_iop_state = state;
+
+	if (adb_iop_state == idle)
+		adb_iop_start();
 }
 
 /*
@@ -94,37 +100,36 @@ static void adb_iop_complete(struct iop_msg *msg)
 static void adb_iop_listen(struct iop_msg *msg)
 {
 	struct adb_iopmsg *amsg = (struct adb_iopmsg *)msg->message;
-	struct adb_request *req;
 	unsigned long flags;
+	bool req_done = false;
 
 	local_irq_save(flags);
 
-	req = current_req;
-
 	/* Handle a timeout. Timeout packets seem to occur even after
 	 * we've gotten a valid reply to a TALK, presumably because of
 	 * autopolling.
 	 */
 
-	if (amsg->flags & ADB_IOP_TIMEOUT) {
-		msg->reply[0] = ADB_IOP_TIMEOUT | ADB_IOP_AUTOPOLL;
-		msg->reply[1] = 0;
-		msg->reply[2] = 0;
-		if (req && (adb_iop_state != idle)) {
-			adb_iop_end_req(req, idle);
-		}
-	} else {
-		if ((adb_iop_state == awaiting_reply) &&
-		    (amsg->flags & ADB_IOP_EXPLICIT)) {
+	if (amsg->flags & ADB_IOP_EXPLICIT) {
+		if (adb_iop_state == awaiting_reply) {
+			struct adb_request *req = current_req;
+
 			req->reply_len = amsg->count + 1;
 			memcpy(req->reply, &amsg->cmd, req->reply_len);
-		} else {
-			adb_input(&amsg->cmd, amsg->count + 1,
-				  amsg->flags & ADB_IOP_AUTOPOLL);
+
+			req_done = true;
 		}
-		memcpy(msg->reply, msg->message, IOP_MSG_LEN);
+	} else if (!(amsg->flags & ADB_IOP_TIMEOUT)) {
+		adb_input(&amsg->cmd, amsg->count + 1,
+			  amsg->flags & ADB_IOP_AUTOPOLL);
 	}
+
+	msg->reply[0] = ADB_IOP_AUTOPOLL;
 	iop_complete_message(msg);
+
+	if (req_done)
+		adb_iop_done();
+
 	local_irq_restore(flags);
 }
 
-- 
2.26.2

