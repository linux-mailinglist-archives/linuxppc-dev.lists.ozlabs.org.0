Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D6D5209CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 02:04:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxyvY71Rvz3fFL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 10:04:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=R4xQzwtx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amazon.de (client-ip=207.171.190.10;
 helo=smtp-fw-33001.amazon.com; envelope-from=prvs=121c1e825=graf@amazon.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256
 header.s=amazon201209 header.b=R4xQzwtx; 
 dkim-atps=neutral
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com
 [207.171.190.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxt2t3VRhz3bYq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 06:25:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1652127927; x=1683663927;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cbosptKrbMIe8k/Gv5F/V00Xlc9whGQqaQE8iFl+sCE=;
 b=R4xQzwtxcW1N0pi1gYUHadMX+pRTNfDmjzGnb1q9BcmzH0WGe90RvJop
 +kRzce1LK6EodqbOzl3Y8LRUQtJLJ6GhjulGbNjTX5pGkhcD2F0DAX5fu
 SSdTDLC3swj3nZCeIapvvOhoi9oun1ZQ1LRMinrkw/ssnKLAxejL7zSZ6 Q=;
X-IronPort-AV: E=Sophos;i="5.91,212,1647302400"; d="scan'208";a="193768546"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-2dbf0206.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-33001.sea14.amazon.com with ESMTP; 09 May 2022 20:24:06 +0000
Received: from EX13MTAUWC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2a-2dbf0206.us-west-2.amazon.com (Postfix) with
 ESMTPS id 39CADA2846; Mon,  9 May 2022 20:24:05 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.32; Mon, 9 May 2022 20:24:04 +0000
Received: from u79c5a0a55de558.ant.amazon.com (10.43.160.180) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1497.32; Mon, 9 May 2022 20:24:02 +0000
From: Alexander Graf <graf@amazon.com>
To: <kvm@vger.kernel.org>
Subject: [PATCH] KVM: PPC: Book3S PR: Enable MSR_DR for switch_mmu_context()
Date: Mon, 9 May 2022 22:23:55 +0200
Message-ID: <20220509202355.13985-1-graf@amazon.com>
X-Mailer: git-send-email 2.28.0.394.ge197136389
MIME-Version: 1.0
X-Originating-IP: [10.43.160.180]
X-ClientProxiedBy: EX13D01UWA002.ant.amazon.com (10.43.160.74) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 May 2022 09:58:00 +1000
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
Cc: Matt Evans <matt@ozlabs.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 863771a28e27 ("powerpc/32s: Convert switch_mmu_context() to C")
moved the switch_mmu_context() to C. While in principle a good idea, it
meant that the function now uses the stack. The stack is not accessible
from real mode though.

So to keep calling the function, let's turn on MSR_DR while we call it.
That way, all pointer references to the stack are handled virtually.

Reported-by: Matt Evans <matt@ozlabs.org>
Fixes: 863771a28e27 ("powerpc/32s: Convert switch_mmu_context() to C")
Signed-off-by: Alexander Graf <graf@amazon.com>
Cc: stable@vger.kernel.org
---
 arch/powerpc/kvm/book3s_32_sr.S | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_32_sr.S b/arch/powerpc/kvm/book3s_32_sr.S
index e3ab9df6cf19..bd4f798f7a46 100644
--- a/arch/powerpc/kvm/book3s_32_sr.S
+++ b/arch/powerpc/kvm/book3s_32_sr.S
@@ -122,11 +122,21 @@
 
 	/* 0x0 - 0xb */
 
-	/* 'current->mm' needs to be in r4 */
-	tophys(r4, r2)
-	lwz	r4, MM(r4)
-	tophys(r4, r4)
-	/* This only clobbers r0, r3, r4 and r5 */
+	/* switch_mmu_context() needs paging, let's enable it */
+	mfmsr   r9
+	ori     r11, r9, MSR_DR
+	mtmsr   r11
+	sync
+
+	/* Calling switch_mmu_context(<inv>, current->mm, <inv>); */
+	lwz	r4, MM(r2)
 	bl	switch_mmu_context
 
+	/* Disable paging again */
+	mfmsr   r9
+	li      r6, MSR_DR
+	andc    r9, r9, r6
+	mtmsr	r9
+	sync
+
 .endm
-- 
2.28.0.394.ge197136389




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



