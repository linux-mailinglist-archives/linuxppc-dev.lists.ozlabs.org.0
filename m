Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E78FF454
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 18:25:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Fhtc6w6tzF4Xq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2019 04:25:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="cmVjvydM"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ffpq3zcFzF3vN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2019 02:51:47 +1100 (AEDT)
Received: from sasha-vm.mshome.net (unknown [50.234.116.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E56B20859;
 Sat, 16 Nov 2019 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573919505;
 bh=tGyuerj4tgHb0qQhYD5ienk8WW7ZV2NkS0UB4aqLey4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cmVjvydMFz2JEeQvBZUNL2REv+4XMpbh9/c88ADtbPTGngJCpUS2ZkZam8jo5quau
 HvdM5Q5ImnKjaX2F/z+HE41Ywdm8NtmDJpxFmvaU6OwCCat8gj5ajz5rSZEpLLC5Qz
 J+u3krxsi5rm+Uk3bTzkyVo/yBZq1BYdJwCqrSC0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 30/99] macintosh/windfarm_smu_sat: Fix debug output
Date: Sat, 16 Nov 2019 10:49:53 -0500
Message-Id: <20191116155103.10971-30-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191116155103.10971-1-sashal@kernel.org>
References: <20191116155103.10971-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>

[ Upstream commit fc0c8b36d379a046525eacb9c3323ca635283757 ]

There's some antiquated debug output that's trying
to do a hand-made hexdump and turning into horrible
1-byte-per-line output these days.

Use print_hex_dump() instead

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/macintosh/windfarm_smu_sat.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/macintosh/windfarm_smu_sat.c b/drivers/macintosh/windfarm_smu_sat.c
index ad6223e883404..3d310dd60a0be 100644
--- a/drivers/macintosh/windfarm_smu_sat.c
+++ b/drivers/macintosh/windfarm_smu_sat.c
@@ -22,14 +22,6 @@
 
 #define VERSION "1.0"
 
-#define DEBUG
-
-#ifdef DEBUG
-#define DBG(args...)	printk(args)
-#else
-#define DBG(args...)	do { } while(0)
-#endif
-
 /* If the cache is older than 800ms we'll refetch it */
 #define MAX_AGE		msecs_to_jiffies(800)
 
@@ -106,13 +98,10 @@ struct smu_sdbp_header *smu_sat_get_sdb_partition(unsigned int sat_id, int id,
 		buf[i+2] = data[3];
 		buf[i+3] = data[2];
 	}
-#ifdef DEBUG
-	DBG(KERN_DEBUG "sat %d partition %x:", sat_id, id);
-	for (i = 0; i < len; ++i)
-		DBG(" %x", buf[i]);
-	DBG("\n");
-#endif
 
+	printk(KERN_DEBUG "sat %d partition %x:", sat_id, id);
+	print_hex_dump(KERN_DEBUG, "  ", DUMP_PREFIX_OFFSET,
+		       16, 1, buf, len, false);
 	if (size)
 		*size = len;
 	return (struct smu_sdbp_header *) buf;
@@ -132,13 +121,13 @@ static int wf_sat_read_cache(struct wf_sat *sat)
 	if (err < 0)
 		return err;
 	sat->last_read = jiffies;
+
 #ifdef LOTSA_DEBUG
 	{
 		int i;
-		DBG(KERN_DEBUG "wf_sat_get: data is");
-		for (i = 0; i < 16; ++i)
-			DBG(" %.2x", sat->cache[i]);
-		DBG("\n");
+		printk(KERN_DEBUG "wf_sat_get: data is");
+		print_hex_dump(KERN_DEBUG, "  ", DUMP_PREFIX_OFFSET,
+			       16, 1, sat->cache, 16, false);
 	}
 #endif
 	return 0;
-- 
2.20.1

