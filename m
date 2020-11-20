Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E1E2BA194
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 05:57:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcknG23kpzDqjg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 15:57:38 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 4CckfM5c36zDqw9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 15:51:39 +1100 (AEDT)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 2F5FA2A45C; Thu, 19 Nov 2020 23:51:37 -0500 (EST)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Message-Id: <58bba4310da4c29b068345a4b36af8a531397ff7.1605847196.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] macintosh/adb-iop: Send correct poll command
Date: Fri, 20 Nov 2020 15:39:56 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The behaviour of the IOP firmware is not well documented but we do know
that IOP message reply data can be used to issue new ADB commands.
Use the message reply to better control autopoll behaviour by sending
a Talk Register 0 command after every ADB response, not unlike the
algorithm in the via-macii driver. This poll command is addressed to
that device which last received a Talk command (explicit or otherwise).

Cc: Joshua Thompson <funaho@jurai.org>
Fixes: fa3b5a9929fc ("macintosh/adb-iop: Implement idle -> sending state transition")
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/macintosh/adb-iop.c | 40 +++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/macintosh/adb-iop.c b/drivers/macintosh/adb-iop.c
index f3d1a460fbce..6b26b6a2c463 100644
--- a/drivers/macintosh/adb-iop.c
+++ b/drivers/macintosh/adb-iop.c
@@ -25,6 +25,7 @@
 static struct adb_request *current_req;
 static struct adb_request *last_req;
 static unsigned int autopoll_devs;
+static u8 autopoll_addr;
 
 static enum adb_iop_state {
 	idle,
@@ -41,6 +42,11 @@ static int adb_iop_autopoll(int);
 static void adb_iop_poll(void);
 static int adb_iop_reset_bus(void);
 
+/* ADB command byte structure */
+#define ADDR_MASK       0xF0
+#define OP_MASK         0x0C
+#define TALK            0x0C
+
 struct adb_driver adb_iop_driver = {
 	.name         = "ISM IOP",
 	.probe        = adb_iop_probe,
@@ -96,17 +102,24 @@ static void adb_iop_complete(struct iop_msg *msg)
 static void adb_iop_listen(struct iop_msg *msg)
 {
 	struct adb_iopmsg *amsg = (struct adb_iopmsg *)msg->message;
+	u8 addr = (amsg->cmd & ADDR_MASK) >> 4;
+	u8 op = amsg->cmd & OP_MASK;
 	unsigned long flags;
 	bool req_done = false;
 
 	local_irq_save(flags);
 
-	/* Handle a timeout. Timeout packets seem to occur even after
-	 * we've gotten a valid reply to a TALK, presumably because of
-	 * autopolling.
+	/* Responses to Talk commands may be unsolicited as they are
+	 * produced when the IOP polls devices. They are mostly timeouts.
 	 */
-
-	if (amsg->flags & ADB_IOP_EXPLICIT) {
+	if (op == TALK && ((1 << addr) & autopoll_devs))
+		autopoll_addr = addr;
+
+	switch (amsg->flags & (ADB_IOP_EXPLICIT |
+			       ADB_IOP_AUTOPOLL |
+			       ADB_IOP_TIMEOUT)) {
+	case ADB_IOP_EXPLICIT:
+	case ADB_IOP_EXPLICIT | ADB_IOP_TIMEOUT:
 		if (adb_iop_state == awaiting_reply) {
 			struct adb_request *req = current_req;
 
@@ -115,12 +128,16 @@ static void adb_iop_listen(struct iop_msg *msg)
 
 			req_done = true;
 		}
-	} else if (!(amsg->flags & ADB_IOP_TIMEOUT)) {
-		adb_input(&amsg->cmd, amsg->count + 1,
-			  amsg->flags & ADB_IOP_AUTOPOLL);
+		break;
+	case ADB_IOP_AUTOPOLL:
+		if (((1 << addr) & autopoll_devs) &&
+		    amsg->cmd == ADB_READREG(addr, 0))
+			adb_input(&amsg->cmd, amsg->count + 1, 1);
+		break;
 	}
-
-	msg->reply[0] = autopoll_devs ? ADB_IOP_AUTOPOLL : 0;
+	msg->reply[0] = autopoll_addr ? ADB_IOP_AUTOPOLL : 0;
+	msg->reply[1] = 0;
+	msg->reply[2] = autopoll_addr ? ADB_READREG(autopoll_addr, 0) : 0;
 	iop_complete_message(msg);
 
 	if (req_done)
@@ -233,6 +250,9 @@ static void adb_iop_set_ap_complete(struct iop_msg *msg)
 	struct adb_iopmsg *amsg = (struct adb_iopmsg *)msg->message;
 
 	autopoll_devs = (amsg->data[1] << 8) | amsg->data[0];
+	if (autopoll_devs & (1 << autopoll_addr))
+		return;
+	autopoll_addr = autopoll_devs ? (ffs(autopoll_devs) - 1) : 0;
 }
 
 static int adb_iop_autopoll(int devs)
-- 
2.26.2

