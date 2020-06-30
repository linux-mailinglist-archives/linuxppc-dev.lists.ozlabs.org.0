Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDF520E9DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 02:03:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wl2L18yPzDqdD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 10:03:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wl0Y1W3rzDqPn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 10:02:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=CJwH8GPT; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49wl0X2L9pz9s6w;
 Tue, 30 Jun 2020 10:02:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1593475340; bh=3qhHICBSUpoNEKl+1Xj3DnsLi1zArFwHdb27g/ovd5w=;
 h=Date:From:To:Cc:Subject:From;
 b=CJwH8GPTuVmhub+ccSnNyNu9s9kKFAcF+IP6YrV17PT8Vq3YrHJsMy2BotAHl1XTk
 HitvBuYHehyKKfuR2pQ23TDlqZwp7l103cSmgipBAfL+ILHLrBMYCJRKsCFu/kZwTk
 5GjXErX0qtMQZ+Gi536LZcuhdAwUx8MKtmtZb5WZ+3+FELza1uTrsT48yagETW0htX
 2xUqmcdtm2DFU4CuRE+G6WKCnRdqcMB7Dip86dk/2ON9GiaElWIMfE7B4R04SVPrwK
 5NLocunpVNHopHt1OOiP353IWjilqctc7ab0ki2E6JQHv+xRzJ3WeHFtkQBtH4x+1x
 hSNt2Tm48FoUQ==
Date: Tue, 30 Jun 2020 10:02:18 +1000
From: Anton Blanchard <anton@ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] xmon: Reset RCU and soft lockup watchdogs
Message-ID: <20200630100218.62a3c3fb@kryten.localdomain>
X-Mailer: Mutt/1.8.0 (2017-02-23)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I'm seeing RCU warnings when exiting xmon. xmon resets the NMI watchdog,
but does nothing with the RCU stall or soft lockup watchdogs. Add a
helper function that handles all three.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 arch/powerpc/xmon/xmon.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 7efe4bc3ccf6..d27944e38b04 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -481,6 +481,13 @@ static inline int unrecoverable_excp(struct pt_regs *regs)
 #endif
 }
 
+static void xmon_touch_watchdogs(void)
+{
+	touch_softlockup_watchdog_sync();
+	rcu_cpu_stall_reset();
+	touch_nmi_watchdog();
+}
+
 static int xmon_core(struct pt_regs *regs, int fromipi)
 {
 	int cmd = 0;
@@ -718,7 +725,7 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 	else
 		insert_cpu_bpts();
 
-	touch_nmi_watchdog();
+	xmon_touch_watchdogs();
 	local_irq_restore(flags);
 
 	return cmd != 'X' && cmd != EOF;
-- 
2.26.2

