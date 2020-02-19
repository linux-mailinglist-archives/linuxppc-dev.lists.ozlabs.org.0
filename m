Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D8C1642D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 12:02:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Mvv527G5zDqhS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 22:02:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MvsW4kbLzDqHZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 22:01:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hutV3Uhm; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48MvsW31vDz9sRG; Wed, 19 Feb 2020 22:01:03 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48MvsW2MBTz9sRJ; Wed, 19 Feb 2020 22:01:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582110063;
 bh=Y4+oA3ly/73Ak6uCeQ9+TZleM3BDZHQ2Ely+H8t82rE=;
 h=From:To:Subject:Date:From;
 b=hutV3UhmIMVyX4zsym5OjqcEWPON1gpoix8HTNMfK2DN1NpPl68lmwP5nwvu2mV+Y
 2GLD4cuvuPZczur/hgR8zO+nUeniCZ2vBbNL3krdXP0jglaOmhQxgStXWEO4esmOd2
 n5T2r+jM+3k2zaldXPm9F94j5K6PVs02gQzKiwVY3eoFneEAlZe1LSXyCNgky3qMPG
 tKxfLkffzLNobi/yVdKUKU80HIjdQ6nUS+vFxz00+XYscSuQwKQ85SIcxSS0z8VpyD
 mgQg1Nsil7Er7ssq/Cqjkzwo8r+DeU2jET+TAHkFw1v5AP4+l54FPe08kuG9yluWGp
 C6p1eiyWaOQLw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/xmon: Lower limits on nidump and ndump
Date: Wed, 19 Feb 2020 22:00:07 +1100
Message-Id: <20200219110007.31195-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In xmon we have two variables that are used by the dump commands.
There's ndump which is the number of bytes to dump using 'd', and
nidump which is the number of instructions to dump using 'di'.

ndump starts as 64 and nidump starts as 16, but both can be set by the
user.

It's fairly common to be pasting addresses into xmon when trying to
debug something, and if you inadvertently double paste an address like
so:

  0:mon> di c000000002101f6c c000000002101f6c

The second value is interpreted as the number of instructions to dump.

Luckily it doesn't dump 13 quintrillion instructions, the value is
limited to MAX_DUMP (128K). But as each instruction is dumped on a
single line, that's still a lot of output. If you're on a slow console
that can take multiple minutes to print. If you were "just popping in
and out of xmon quickly before the RCU/hardlockup detector fires" you
are now having a bad day.

Things are not as bad with 'd' because we print 16 bytes per line, so
it's fewer lines. But it's still quite a lot.

So shrink the maximum for 'd' to 64K (one page), which is 4096 lines.
For 'di' add a new limit which is the above / 4 - because instructions
are 4 bytes, meaning again we can dump one page.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/xmon/xmon.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index e8c84d265602..722bf7ed0eda 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -81,8 +81,9 @@ static bool xmon_is_ro = IS_ENABLED(CONFIG_XMON_DEFAULT_RO_MODE);
 
 static unsigned long adrs;
 static int size = 1;
-#define MAX_DUMP (128 * 1024)
+#define MAX_DUMP (64 * 1024)
 static unsigned long ndump = 64;
+#define MAX_IDUMP (MAX_DUMP >> 2)
 static unsigned long nidump = 16;
 static unsigned long ncsum = 4096;
 static int termch;
@@ -2756,8 +2757,8 @@ dump(void)
 		scanhex(&nidump);
 		if (nidump == 0)
 			nidump = 16;
-		else if (nidump > MAX_DUMP)
-			nidump = MAX_DUMP;
+		else if (nidump > MAX_IDUMP)
+			nidump = MAX_IDUMP;
 		adrs += ppc_inst_dump(adrs, nidump, 1);
 		last_cmd = "di\n";
 	} else if (c == 'l') {
-- 
2.21.1

