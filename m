Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3B8109E76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 14:02:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MkbG0D9JzDqQ8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 00:02:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="F+CezjWa"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Mk0g0kLPzDqDB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 23:36:18 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47Mk0Z3Hlmz9v0G8;
 Tue, 26 Nov 2019 13:36:14 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=F+CezjWa; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5NS0X-0jvC8c; Tue, 26 Nov 2019 13:36:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47Mk0Z2F25z9v0G3;
 Tue, 26 Nov 2019 13:36:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1574771774; bh=SuQxAQ4l/1mHGi45aVKRS3CT3WsuP/jKyi3kssGze6g=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=F+CezjWaWcLVWwfzSbZHbxkNkW2eY/uQkx1c6+/ORauptQeeDq/bsmg1Xi1F4jEQ+
 YskD5wLgPMujZJMHQFfDf0v1sbPXZw9UF0LDlh/NdqEE4uJpVhhkawjz2Jm/TqJBEd
 V+UuRUJpq1oREQ/aC85ATds8+wi8jrcWF55Ee2tw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D43B8B7FC;
 Tue, 26 Nov 2019 13:36:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4rld6BwlFtzU; Tue, 26 Nov 2019 13:36:15 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6526D8B771;
 Tue, 26 Nov 2019 13:36:15 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EA2866B76A; Tue, 26 Nov 2019 12:36:14 +0000 (UTC)
Message-Id: <c893bfdf0ff385427f8013a2faa2643f6a7df6c7.1574771541.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1574771539.git.christophe.leroy@c-s.fr>
References: <cover.1574771539.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 11/16] powerpc/8xx: move DataStoreTLBMiss perf handler
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 26 Nov 2019 12:36:14 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move DataStoreTLBMiss perf handler in order to cope
with future growing exception prolog.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_8xx.S | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 5aa63693f790..1e718e47fe3c 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -166,18 +166,6 @@ SystemCall:
  */
 	EXCEPTION(0x1000, SoftEmu, program_check_exception, EXC_XFER_STD)
 
-/* Called from DataStoreTLBMiss when perf TLB misses events are activated */
-#ifdef CONFIG_PERF_EVENTS
-	patch_site	0f, patch__dtlbmiss_perf
-0:	lwz	r10, (dtlb_miss_counter - PAGE_OFFSET)@l(0)
-	addi	r10, r10, 1
-	stw	r10, (dtlb_miss_counter - PAGE_OFFSET)@l(0)
-	mfspr	r10, SPRN_DAR
-	mtspr	SPRN_DAR, r11	/* Tag DAR */
-	mfspr	r11, SPRN_M_TW
-	rfi
-#endif
-
 	. = 0x1100
 /*
  * For the MPC8xx, this is a software tablewalk to load the instruction
@@ -486,6 +474,18 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	/* 0x300 is DataAccess exception, needed by bad_page_fault() */
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
+/* Called from DataStoreTLBMiss when perf TLB misses events are activated */
+#ifdef CONFIG_PERF_EVENTS
+	patch_site	0f, patch__dtlbmiss_perf
+0:	lwz	r10, (dtlb_miss_counter - PAGE_OFFSET)@l(0)
+	addi	r10, r10, 1
+	stw	r10, (dtlb_miss_counter - PAGE_OFFSET)@l(0)
+	mfspr	r10, SPRN_DAR
+	mtspr	SPRN_DAR, r11	/* Tag DAR */
+	mfspr	r11, SPRN_M_TW
+	rfi
+#endif
+
 /* On the MPC8xx, these next four traps are used for development
  * support of breakpoints and such.  Someday I will get around to
  * using them.
-- 
2.13.3

