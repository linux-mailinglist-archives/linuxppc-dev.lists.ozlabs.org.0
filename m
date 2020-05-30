Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E90F01E9529
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 06:24:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ZQDy1hk4zDqtG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 14:24:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49ZPw81WflzDqmJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 May 2020 14:09:59 +1000 (AEST)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 3748E27FAD; Sat, 30 May 2020 19:20:33 -0400 (EDT)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-Id: <25edf4450abd20e002b166ba3a11189dc1efa906.1590880623.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1590880623.git.fthain@telegraphics.com.au>
References: <cover.1590880623.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 5/8] macintosh/adb-iop: Resolve static checker warnings
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

drivers/macintosh/adb-iop.c:215:28: warning: Using plain integer as NULL pointer
drivers/macintosh/adb-iop.c:170:5: warning: symbol 'adb_iop_probe' was not declared. Should it be static?
drivers/macintosh/adb-iop.c:177:5: warning: symbol 'adb_iop_init' was not declared. Should it be static?
drivers/macintosh/adb-iop.c:184:5: warning: symbol 'adb_iop_send_request' was not declared. Should it be static?
drivers/macintosh/adb-iop.c:230:5: warning: symbol 'adb_iop_autopoll' was not declared. Should it be static?
drivers/macintosh/adb-iop.c:236:6: warning: symbol 'adb_iop_poll' was not declared. Should it be static?
drivers/macintosh/adb-iop.c:241:5: warning: symbol 'adb_iop_reset_bus' was not declared. Should it be static?

Cc: Joshua Thompson <funaho@jurai.org>
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/macintosh/adb-iop.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/macintosh/adb-iop.c b/drivers/macintosh/adb-iop.c
index 7ecc41bc7358..a2b28e09f2ce 100644
--- a/drivers/macintosh/adb-iop.c
+++ b/drivers/macintosh/adb-iop.c
@@ -166,21 +166,21 @@ static void adb_iop_start(void)
 			 adb_iop_complete);
 }
 
-int adb_iop_probe(void)
+static int adb_iop_probe(void)
 {
 	if (!iop_ism_present)
 		return -ENODEV;
 	return 0;
 }
 
-int adb_iop_init(void)
+static int adb_iop_init(void)
 {
 	pr_info("adb: IOP ISM driver v0.4 for Unified ADB\n");
 	iop_listen(ADB_IOP, ADB_CHAN, adb_iop_listen, "ADB");
 	return 0;
 }
 
-int adb_iop_send_request(struct adb_request *req, int sync)
+static int adb_iop_send_request(struct adb_request *req, int sync)
 {
 	int err;
 
@@ -211,7 +211,7 @@ static int adb_iop_write(struct adb_request *req)
 
 	local_irq_save(flags);
 
-	if (current_req != 0) {
+	if (current_req) {
 		last_req->next = req;
 		last_req = req;
 	} else {
@@ -227,18 +227,18 @@ static int adb_iop_write(struct adb_request *req)
 	return 0;
 }
 
-int adb_iop_autopoll(int devs)
+static int adb_iop_autopoll(int devs)
 {
 	/* TODO: how do we enable/disable autopoll? */
 	return 0;
 }
 
-void adb_iop_poll(void)
+static void adb_iop_poll(void)
 {
 	iop_ism_irq_poll(ADB_IOP);
 }
 
-int adb_iop_reset_bus(void)
+static int adb_iop_reset_bus(void)
 {
 	struct adb_request req;
 
-- 
2.26.2

