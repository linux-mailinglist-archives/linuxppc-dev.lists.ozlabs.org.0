Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAF820C5F8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 06:42:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vdK46jNBzDqc3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 14:42:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49vd4N704ZzDr30
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 14:31:48 +1000 (AEST)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 7CEFD2972A; Sun, 28 Jun 2020 00:31:45 -0400 (EDT)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-Id: <a40f80dde90991757007b6962c386a208c970586.1593318192.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1593318192.git.fthain@telegraphics.com.au>
References: <cover.1593318192.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 8/9] macintosh/via-macii: Use the stack for reset request
 storage
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

The adb_request struct can be stored on the stack because the request
is synchronous and is completed before the function returns.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/macintosh/via-macii.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/via-macii.c b/drivers/macintosh/via-macii.c
index 447273967e1e8..2f9be4ec7d345 100644
--- a/drivers/macintosh/via-macii.c
+++ b/drivers/macintosh/via-macii.c
@@ -313,7 +313,7 @@ static void macii_poll(void)
 /* Reset the bus */
 static int macii_reset_bus(void)
 {
-	static struct adb_request req;
+	struct adb_request req;
 
 	/* Command = 0, Address = ignored */
 	adb_request(&req, NULL, ADBREQ_NOSEND, 1, ADB_BUSRESET);
-- 
2.26.2

