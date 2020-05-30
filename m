Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 568F91E9523
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 06:17:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ZQ494ynHzDqc4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 14:16:57 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49ZPw70x0XzDqlr
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 May 2020 14:09:58 +1000 (AEST)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 0A05327EFD; Sat, 30 May 2020 19:20:32 -0400 (EDT)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-Id: <7720ffb559c334504e16b24d9c2f3b8973d2d674.1590880623.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1590880623.git.fthain@telegraphics.com.au>
References: <cover.1590880623.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 1/8] macintosh/adb-iop: Remove dead and redundant code
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

Cc: Joshua Thompson <funaho@jurai.org>
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/macintosh/adb-iop.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/macintosh/adb-iop.c b/drivers/macintosh/adb-iop.c
index fca31640e3ef..ce28ff40fb9c 100644
--- a/drivers/macintosh/adb-iop.c
+++ b/drivers/macintosh/adb-iop.c
@@ -18,24 +18,16 @@
 #include <linux/mm.h>
 #include <linux/delay.h>
 #include <linux/init.h>
-#include <linux/proc_fs.h>
 
 #include <asm/macintosh.h>
 #include <asm/macints.h>
 #include <asm/mac_iop.h>
-#include <asm/mac_oss.h>
 #include <asm/adb_iop.h>
 
 #include <linux/adb.h>
 
-/*#define DEBUG_ADB_IOP*/
-
 static struct adb_request *current_req;
 static struct adb_request *last_req;
-#if 0
-static unsigned char reply_buff[16];
-static unsigned char *reply_ptr;
-#endif
 
 static enum adb_iop_state {
 	idle,
@@ -104,22 +96,11 @@ static void adb_iop_listen(struct iop_msg *msg)
 	struct adb_iopmsg *amsg = (struct adb_iopmsg *)msg->message;
 	struct adb_request *req;
 	unsigned long flags;
-#ifdef DEBUG_ADB_IOP
-	int i;
-#endif
 
 	local_irq_save(flags);
 
 	req = current_req;
 
-#ifdef DEBUG_ADB_IOP
-	printk("adb_iop_listen %p: rcvd packet, %d bytes: %02X %02X", req,
-	       (uint)amsg->count + 2, (uint)amsg->flags, (uint)amsg->cmd);
-	for (i = 0; i < amsg->count; i++)
-		printk(" %02X", (uint)amsg->data[i]);
-	printk("\n");
-#endif
-
 	/* Handle a timeout. Timeout packets seem to occur even after */
 	/* we've gotten a valid reply to a TALK, so I'm assuming that */
 	/* a "timeout" is actually more like an "end-of-data" signal. */
@@ -163,9 +144,6 @@ static void adb_iop_start(void)
 	unsigned long flags;
 	struct adb_request *req;
 	struct adb_iopmsg amsg;
-#ifdef DEBUG_ADB_IOP
-	int i;
-#endif
 
 	/* get the packet to send */
 	req = current_req;
@@ -174,13 +152,6 @@ static void adb_iop_start(void)
 
 	local_irq_save(flags);
 
-#ifdef DEBUG_ADB_IOP
-	printk("adb_iop_start %p: sending packet, %d bytes:", req, req->nbytes);
-	for (i = 0; i < req->nbytes; i++)
-		printk(" %02X", (uint)req->data[i]);
-	printk("\n");
-#endif
-
 	/* The IOP takes MacII-style packets, so */
 	/* strip the initial ADB_PACKET byte.    */
 
-- 
2.26.2

