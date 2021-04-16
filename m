Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A433361EEE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 13:42:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMDp72jwcz30B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 21:42:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Q1z7mG0Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Q1z7mG0Y; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMDnk0SMfz2xy4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 21:41:46 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FMDnj5fBbz9sWD; Fri, 16 Apr 2021 21:41:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618573305;
 bh=WBBIGQ2fT+Sp1x6fhOgL9Y1xhCfM6CIl6f9YJWTQkk4=;
 h=From:To:Subject:Date:From;
 b=Q1z7mG0YyTda1vNu4X2WdwHBzFziJ6GXKPDR1gWBL6acJKmuIdvzSOBa9hF9htphK
 7uvLBXoZbEcWI10cBVycxYwXPW9MaIi5pfIcwvUOT4+NKVkLcciB0E/P8P50CFbUk7
 s1lCMIoaCKAbVtnwCnjKkvpn+4ii9XMzjni057gGDX8Pf3xU3vLIapx0+E8uosQcOM
 LU9TaDCIFBKkP10KoFaSh90ZKwvuCHtHlDAN26aPlw5zLTxV737DFWdwyZYPF4vxk9
 WUvZus+sCyRDyFZkCdhC1HJgG65/XYJI0muo0MtVk9kRFRbqEt5RmAxoIlV1H/p/Ra
 0CmWHIjJr/bhA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] macintosh/via-pmu: Fix build warning
Date: Fri, 16 Apr 2021 21:41:39 +1000
Message-Id: <20210416114139.772236-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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

Now that __fake_sleep is static, we get a warning about it being unused
in some configurations:

  drivers/macintosh/via-pmu.c:190:12: warning: '__fake_sleep' defined but not used
    190 | static int __fake_sleep;

Move it inside the ifdef where it's used to avoid the warning.

Fixes: 95d143923379 ("macintosh/via-pmu: Make some symbols static")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/macintosh/via-pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index 478766434919..4bdd4c45e7a7 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -187,7 +187,6 @@ static int query_batt_timer = BATTERY_POLLING_COUNT;
 static struct adb_request batt_req;
 static struct proc_dir_entry *proc_pmu_batt[PMU_MAX_BATTERIES];
 
-static int __fake_sleep;
 int asleep;
 
 #ifdef CONFIG_ADB
@@ -1833,6 +1832,7 @@ pmu_present(void)
  */
  
 static u32 save_via[8];
+static int __fake_sleep;
 
 static void
 save_via_state(void)
-- 
2.25.1

