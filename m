Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3595215A3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 14:39:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyHfp0k07z3cM3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 22:39:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=Krqz6XaU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amazon.de (client-ip=207.171.188.200;
 helo=smtp-fw-9103.amazon.com; envelope-from=prvs=122be4948=graf@amazon.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256
 header.s=amazon201209 header.b=Krqz6XaU; 
 dkim-atps=neutral
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com
 [207.171.188.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyHf73SSzz2y7K
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 22:38:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1652186335; x=1683722335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bE2GOy6zlpqOoRX6zYpnJAL0E/MfIkSIFEmV3eldp8g=;
 b=Krqz6XaUUHZThkl/yRqUry7d1WENP04gEDbD5avnWSKaU2LaWxKvxjWZ
 S9odBy0+xePutiJ/wb4VJeLpxQD6c1QForL/d7G7B+HqkI+1FveFvZlN+
 2MiWBXn1GNP3UZEaMDC9F7TGstpXWWIlPZbb1CMU/UGxTMZCkyGA0I3AR U=;
X-IronPort-AV: E=Sophos;i="5.91,214,1647302400"; d="scan'208";a="1014326555"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-e6c05252.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-9103.sea19.amazon.com with ESMTP; 10 May 2022 12:37:27 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2a-e6c05252.us-west-2.amazon.com (Postfix) with
 ESMTPS id 0A4E441CEE; Tue, 10 May 2022 12:37:27 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.32; Tue, 10 May 2022 12:37:26 +0000
Received: from u79c5a0a55de558.ant.amazon.com (10.43.162.96) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1497.32; Tue, 10 May 2022 12:37:24 +0000
From: Alexander Graf <graf@amazon.com>
To: <kvm@vger.kernel.org>
Subject: [PATCH v3] KVM: PPC: Book3S PR: Enable MSR_DR for switch_mmu_context()
Date: Tue, 10 May 2022 14:37:17 +0200
Message-ID: <20220510123717.24508-1-graf@amazon.com>
X-Mailer: git-send-email 2.28.0.394.ge197136389
MIME-Version: 1.0
X-Originating-IP: [10.43.162.96]
X-ClientProxiedBy: EX13D03UWC002.ant.amazon.com (10.43.162.160) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Content-Type: text/plain; charset="us-ascii"
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

In addition, make sure to save/restore r12 on the stack, as it may get
clobbered by the C function.

Reported-by: Matt Evans <matt@ozlabs.org>
Fixes: 863771a28e27 ("powerpc/32s: Convert switch_mmu_context() to C")
Signed-off-by: Alexander Graf <graf@amazon.com>
Cc: stable@vger.kernel.org # v5.14+

---

v1 -> v2:

  - Save and restore R12, so that we don't touch volatile registers
    while calling into C.

v2 -> v3:

  - Save and restore R12 on the stack. SPRGs may be clobbered by
    page faults.
---
 arch/powerpc/kvm/book3s_32_sr.S | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_32_sr.S b/arch/powerpc/kvm/book3s_32_sr.S
index e3ab9df6cf19..6cfcd20d4668 100644
--- a/arch/powerpc/kvm/book3s_32_sr.S
+++ b/arch/powerpc/kvm/book3s_32_sr.S
@@ -122,11 +122,27 @@
 
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
+	/* switch_mmu_context() clobbers r12, rescue it */
+	SAVE_GPR(12, r1)
+
+	/* Calling switch_mmu_context(<inv>, current->mm, <inv>); */
+	lwz	r4, MM(r2)
 	bl	switch_mmu_context
 
+	/* restore r12 */
+	REST_GPR(12, r1)
+
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



