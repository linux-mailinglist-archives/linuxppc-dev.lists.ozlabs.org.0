Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DA920C5F5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 06:39:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vdFZ2zYFzDqXM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 14:39:46 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49vd4N4PbyzDr0p
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 14:31:48 +1000 (AEST)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id B339B2970D; Sun, 28 Jun 2020 00:31:44 -0400 (EDT)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-Id: <779551219a11b19e574dfcd87e4ef60af08c4fc3.1593318192.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1593318192.git.fthain@telegraphics.com.au>
References: <cover.1593318192.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 6/9] macintosh/via-macii: Use bool type for reading_reply
 variable
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

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/macintosh/via-macii.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/macintosh/via-macii.c b/drivers/macintosh/via-macii.c
index 8d5ef77b4a435..e143ddb81de34 100644
--- a/drivers/macintosh/via-macii.c
+++ b/drivers/macintosh/via-macii.c
@@ -116,7 +116,7 @@ static struct adb_request *current_req; /* first request struct in the queue */
 static struct adb_request *last_req;     /* last request struct in the queue */
 static unsigned char reply_buf[16];        /* storage for autopolled replies */
 static unsigned char *reply_ptr;     /* next byte in reply_buf or req->reply */
-static int reading_reply;        /* store reply in reply_buf else req->reply */
+static bool reading_reply;       /* store reply in reply_buf else req->reply */
 static int data_index;      /* index of the next byte to send from req->data */
 static int reply_len; /* number of bytes received in reply_buf or req->reply */
 static int status;          /* VIA's ADB status bits captured upon interrupt */
@@ -394,7 +394,7 @@ static irqreturn_t macii_interrupt(int irq, void *arg)
 		WARN_ON((status & ST_MASK) != ST_IDLE);
 
 		reply_ptr = reply_buf;
-		reading_reply = 0;
+		reading_reply = false;
 
 		bus_timeout = false;
 		srq_asserted = false;
@@ -442,7 +442,7 @@ static irqreturn_t macii_interrupt(int irq, void *arg)
 			 */
 			macii_state = reading;
 
-			reading_reply = 0;
+			reading_reply = false;
 			reply_ptr = reply_buf;
 			*reply_ptr = last_talk_cmd;
 			reply_len = 1;
@@ -456,7 +456,7 @@ static irqreturn_t macii_interrupt(int irq, void *arg)
 			if (req->reply_expected) {
 				macii_state = reading;
 
-				reading_reply = 1;
+				reading_reply = true;
 				reply_ptr = req->reply;
 				*reply_ptr = req->data[1];
 				reply_len = 1;
@@ -466,7 +466,7 @@ static irqreturn_t macii_interrupt(int irq, void *arg)
 			} else if ((req->data[1] & OP_MASK) == TALK) {
 				macii_state = reading;
 
-				reading_reply = 0;
+				reading_reply = false;
 				reply_ptr = reply_buf;
 				*reply_ptr = req->data[1];
 				reply_len = 1;
-- 
2.26.2

