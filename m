Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1D020C5F0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 06:36:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vdB26CjQzDrB4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 14:36:42 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49vd4M31KvzDr0y
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 14:31:47 +1000 (AEST)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 1353A29704; Sun, 28 Jun 2020 00:31:43 -0400 (EDT)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-Id: <6541fda1d8db3ae87c3abe17d189a10dc96e2382.1593318192.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1593318192.git.fthain@telegraphics.com.au>
References: <cover.1593318192.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 3/9] macintosh/via-macii: Handle /CTLR_IRQ signal correctly
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

I'm told that the /CTLR_IRQ signal from the ADB transceiver gets
interpreted by MacOS to mean SRQ, bus timeout or end-of-packet depending
on the circumstances, and that Linux's via-macii driver does not
correctly interpret this signal.

Instead, the via-macii driver interprets certain received byte values
(0x00 and 0xFF) as signalling end of packet and bus timeout
(respectively). Problem is, those values can also appear under other
circumstances.

This patch changes the bus timeout, end of packet and SRQ detection logic
to bring it closer to the logic that MacOS reportedly uses.

Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2") # v5.0+
Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/macintosh/via-macii.c | 166 ++++++++++++++++++++--------------
 1 file changed, 97 insertions(+), 69 deletions(-)

diff --git a/drivers/macintosh/via-macii.c b/drivers/macintosh/via-macii.c
index d4f1a65c5f1fd..6a5cd7de05baf 100644
--- a/drivers/macintosh/via-macii.c
+++ b/drivers/macintosh/via-macii.c
@@ -80,6 +80,8 @@ static volatile unsigned char *via;
 /* ADB command byte structure */
 #define ADDR_MASK	0xF0
 #define CMD_MASK	0x0F
+#define OP_MASK		0x0C
+#define TALK		0x0C
 
 static int macii_init_via(void);
 static void macii_start(void);
@@ -119,9 +121,10 @@ static int reading_reply;        /* store reply in reply_buf else req->reply */
 static int data_index;      /* index of the next byte to send from req->data */
 static int reply_len; /* number of bytes received in reply_buf or req->reply */
 static int status;          /* VIA's ADB status bits captured upon interrupt */
-static int last_status;              /* status bits as at previous interrupt */
-static int srq_asserted;     /* have to poll for the device that asserted it */
+static bool bus_timeout;                   /* no data was sent by the device */
+static bool srq_asserted;    /* have to poll for the device that asserted it */
 static u8 last_cmd;              /* the most recent command byte transmitted */
+static u8 last_talk_cmd;    /* the most recent Talk command byte transmitted */
 static u8 last_poll_cmd; /* the most recent Talk R0 command byte transmitted */
 static int autopoll_devs;      /* bits set are device addresses to be polled */
 
@@ -170,7 +173,6 @@ static int macii_init_via(void)
 
 	/* Set up state: idle */
 	via[B] |= ST_IDLE;
-	last_status = via[B] & (ST_MASK | CTLR_IRQ);
 
 	/* Shift register on input */
 	via[ACR] = (via[ACR] & ~SR_CTRL) | SR_EXT;
@@ -336,13 +338,6 @@ static void macii_start(void)
 	 * And req->nbytes is the number of bytes of real data plus one.
 	 */
 
-	/* store command byte */
-	last_cmd = req->data[1];
-
-	/* If this is a Talk Register 0 command, store the command byte */
-	if ((last_cmd & CMD_MASK) == ADB_READREG(0, 0))
-		last_poll_cmd = last_cmd;
-
 	/* Output mode */
 	via[ACR] |= SR_OUT;
 	/* Load data */
@@ -352,6 +347,9 @@ static void macii_start(void)
 
 	macii_state = sending;
 	data_index = 2;
+
+	bus_timeout = false;
+	srq_asserted = false;
 }
 
 /*
@@ -360,15 +358,17 @@ static void macii_start(void)
  * generating shift register interrupts (SR_INT) for us. This means there has
  * to be activity on the ADB bus. The chip will poll to achieve this.
  *
- * The basic ADB state machine was left unchanged from the original MacII code
- * by Alan Cox, which was based on the CUDA driver for PowerMac.
- * The syntax of the ADB status lines is totally different on MacII,
- * though. MacII uses the states Command -> Even -> Odd -> Even ->...-> Idle
- * for sending and Idle -> Even -> Odd -> Even ->...-> Idle for receiving.
- * Start and end of a receive packet are signalled by asserting /IRQ on the
- * interrupt line (/IRQ means the CTLR_IRQ bit in port B; not to be confused
- * with the VIA shift register interrupt. /IRQ never actually interrupts the
- * processor, it's just an ordinary input.)
+ * The VIA Port B output signalling works as follows. After the ADB transceiver
+ * sees a transition on the PB4 and PB5 lines it will crank over the VIA shift
+ * register which eventually raises the SR_INT interrupt. The PB4/PB5 outputs
+ * are toggled with each byte as the ADB transaction progresses.
+ *
+ * Request with no reply expected (and empty transceiver buffer):
+ *     CMD -> IDLE
+ * Request with expected reply packet (or with buffered autopoll packet):
+ *     CMD -> EVEN -> ODD -> EVEN -> ... -> IDLE
+ * Unsolicited packet:
+ *     IDLE -> EVEN -> ODD -> EVEN -> ... -> IDLE
  */
 static irqreturn_t macii_interrupt(int irq, void *arg)
 {
@@ -388,31 +388,31 @@ static irqreturn_t macii_interrupt(int irq, void *arg)
 		}
 	}
 
-	last_status = status;
 	status = via[B] & (ST_MASK | CTLR_IRQ);
 
 	switch (macii_state) {
 	case idle:
-		if (reading_reply) {
-			reply_ptr = current_req->reply;
-		} else {
-			WARN_ON(current_req);
-			reply_ptr = reply_buf;
-		}
+		WARN_ON((status & ST_MASK) != ST_IDLE);
+
+		reply_ptr = reply_buf;
+		reading_reply = 0;
+
+		bus_timeout = false;
+		srq_asserted = false;
 
 		x = via[SR];
 
-		if ((status & CTLR_IRQ) && (x == 0xFF)) {
-			/* Bus timeout without SRQ sequence:
-			 *     data is "FF" while CTLR_IRQ is "H"
+		if (!(status & CTLR_IRQ)) {
+			/* /CTLR_IRQ asserted in idle state means we must
+			 * read an autopoll reply from the transceiver buffer.
 			 */
-			reply_len = 0;
-			srq_asserted = 0;
-			macii_state = read_done;
-		} else {
 			macii_state = reading;
 			*reply_ptr = x;
 			reply_len = 1;
+		} else {
+			/* bus timeout */
+			macii_state = read_done;
+			reply_len = 0;
 		}
 
 		/* set ADB state = even for first data byte */
@@ -421,13 +421,52 @@ static irqreturn_t macii_interrupt(int irq, void *arg)
 
 	case sending:
 		req = current_req;
-		if (data_index >= req->nbytes) {
+
+		if (status == (ST_CMD | CTLR_IRQ)) {
+			/* /CTLR_IRQ de-asserted after the command byte means
+			 * the host can continue with the transaction.
+			 */
+
+			/* Store command byte */
+			last_cmd = req->data[1];
+			if ((last_cmd & OP_MASK) == TALK) {
+				last_talk_cmd = last_cmd;
+				if ((last_cmd & CMD_MASK) == ADB_READREG(0, 0))
+					last_poll_cmd = last_cmd;
+			}
+		}
+
+		if (status == ST_CMD) {
+			/* /CTLR_IRQ asserted after the command byte means we
+			 * must read an autopoll reply. The first byte was
+			 * lost because the shift register was an output.
+			 */
+			macii_state = reading;
+
+			reading_reply = 0;
+			reply_ptr = reply_buf;
+			*reply_ptr = last_talk_cmd;
+			reply_len = 1;
+
+			/* reset to shift in */
+			via[ACR] &= ~SR_OUT;
+			x = via[SR];
+		} else if (data_index >= req->nbytes) {
 			req->sent = 1;
-			macii_state = idle;
 
 			if (req->reply_expected) {
+				macii_state = reading;
+
 				reading_reply = 1;
+				reply_ptr = req->reply;
+				*reply_ptr = req->data[1];
+				reply_len = 1;
+
+				via[ACR] &= ~SR_OUT;
+				x = via[SR];
 			} else {
+				macii_state = idle;
+
 				req->complete = 1;
 				current_req = req->next;
 				if (req->done)
@@ -438,25 +477,26 @@ static irqreturn_t macii_interrupt(int irq, void *arg)
 
 				if (current_req && macii_state == idle)
 					macii_start();
-			}
 
-			if (macii_state == idle) {
-				/* reset to shift in */
-				via[ACR] &= ~SR_OUT;
-				x = via[SR];
-				/* set ADB state idle - might get SRQ */
-				via[B] = (via[B] & ~ST_MASK) | ST_IDLE;
+				if (macii_state == idle) {
+					/* reset to shift in */
+					via[ACR] &= ~SR_OUT;
+					x = via[SR];
+					/* set ADB state idle - might get SRQ */
+					via[B] = (via[B] & ~ST_MASK) | ST_IDLE;
+				}
+				break;
 			}
 		} else {
 			via[SR] = req->data[data_index++];
+		}
 
-			if ((via[B] & ST_MASK) == ST_CMD) {
-				/* just sent the command byte, set to EVEN */
-				via[B] = (via[B] & ~ST_MASK) | ST_EVEN;
-			} else {
-				/* invert state bits, toggle ODD/EVEN */
-				via[B] ^= ST_MASK;
-			}
+		if ((via[B] & ST_MASK) == ST_CMD) {
+			/* just sent the command byte, set to EVEN */
+			via[B] = (via[B] & ~ST_MASK) | ST_EVEN;
+		} else {
+			/* invert state bits, toggle ODD/EVEN */
+			via[B] ^= ST_MASK;
 		}
 		break;
 
@@ -465,28 +505,13 @@ static irqreturn_t macii_interrupt(int irq, void *arg)
 		WARN_ON((status & ST_MASK) == ST_CMD ||
 			(status & ST_MASK) == ST_IDLE);
 
-		/* Bus timeout with SRQ sequence:
-		 *     data is "XX FF"      while CTLR_IRQ is "L L"
-		 * End of packet without SRQ sequence:
-		 *     data is "XX...YY 00" while CTLR_IRQ is "L...H L"
-		 * End of packet SRQ sequence:
-		 *     data is "XX...YY 00" while CTLR_IRQ is "L...L L"
-		 * (where XX is the first response byte and
-		 * YY is the last byte of valid response data.)
-		 */
-
-		srq_asserted = 0;
 		if (!(status & CTLR_IRQ)) {
-			if (x == 0xFF) {
-				if (!(last_status & CTLR_IRQ)) {
-					macii_state = read_done;
-					reply_len = 0;
-					srq_asserted = 1;
-				}
-			} else if (x == 0x00) {
+			if (status == ST_EVEN && reply_len == 1) {
+				bus_timeout = true;
+			} else if (status == ST_ODD && reply_len == 2) {
+				srq_asserted = true;
+			} else {
 				macii_state = read_done;
-				if (!(last_status & CTLR_IRQ))
-					srq_asserted = 1;
 			}
 		}
 
@@ -504,6 +529,9 @@ static irqreturn_t macii_interrupt(int irq, void *arg)
 	case read_done:
 		x = via[SR];
 
+		if (bus_timeout)
+			reply_len = 0;
+
 		if (reading_reply) {
 			reading_reply = 0;
 			req = current_req;
-- 
2.26.2

