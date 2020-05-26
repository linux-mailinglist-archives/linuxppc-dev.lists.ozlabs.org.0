Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C2B1E1B6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 08:35:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WPNp5418zDqNw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 16:35:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WPM44yPZzDqJM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 16:34:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ALlybOjw; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49WPM42RWyz9sRW; Tue, 26 May 2020 16:34:24 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49WPM41k0bz9sSk; Tue, 26 May 2020 16:34:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590474864;
 bh=oyjFs75wyy3sZIasq1IOMmZ15w5Je5v8A+L0QTRuz8c=;
 h=From:To:Subject:Date:From;
 b=ALlybOjw2HW4JAQndj2GzQW7wY5UqZKptxfqaMJaGAxhgsO1T0C9Wo27TJQloGOLR
 T+utK/MyX4lZRW3ZjrZFQGAqIghyTfbK9emCeDswEF6tc9m7no/CvNYtqoBlkNM8yF
 4FzWbQSrfmfBS4WSydEdTBJmZFdF5Ufzp5KZDe7n7ERXDh9w0fv12tXYyk1GfCtkRJ
 cA+2dvvbt52vzbu3ctZc37sNXBaspbJKYAMufNA4W4E13eJX2AXNfMpC3wQQO5xPQ/
 FlXeHFpam4J3cClWp0UDwFOi/p/Yq8M7aTfvfDVz9fAYpptqeVJ0tlNq8Tt5Ui3q5m
 FSsxrtBuSDZoQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/64: Remove unused generic_secondary_thread_init()
Date: Tue, 26 May 2020 16:34:46 +1000
Message-Id: <20200526063446.2476336-1-mpe@ellerman.id.au>
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

The last caller was removed in 2014 in commit fb5a515704d7 ("powerpc:
Remove platforms/wsp and associated pieces").

Once generic_secondary_thread_init() is removed there are no longer
any uses of book3e_secondary_thread_init() or
generic_secondary_common_init so remove them too.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/smp.h       |  1 -
 arch/powerpc/kernel/exceptions-64e.S |  4 ----
 arch/powerpc/kernel/head_64.S        | 18 ------------------
 3 files changed, 23 deletions(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index 49a25e2400f2..81a49566ccd8 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -243,7 +243,6 @@ extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
  * 64-bit but defining them all here doesn't harm
  */
 extern void generic_secondary_smp_init(void);
-extern void generic_secondary_thread_init(void);
 extern unsigned long __secondary_hold_spinloop;
 extern unsigned long __secondary_hold_acknowledge;
 extern char __secondary_hold;
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index d9ed79415100..9f9e8686798b 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -1814,10 +1814,6 @@ _GLOBAL(book3e_secondary_core_init)
 1:	mtlr	r28
 	blr
 
-_GLOBAL(book3e_secondary_thread_init)
-	mflr	r28
-	b	3b
-
 	.globl init_core_book3e
 init_core_book3e:
 	/* Establish the interrupt vector base */
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 0e05a9a47a4b..4ae2c18c5fc6 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -302,23 +302,6 @@ _GLOBAL(fsl_secondary_thread_init)
 1:
 #endif
 
-_GLOBAL(generic_secondary_thread_init)
-	mr	r24,r3
-
-	/* turn on 64-bit mode */
-	bl	enable_64b_mode
-
-	/* get a valid TOC pointer, wherever we're mapped at */
-	bl	relative_toc
-	tovirt(r2,r2)
-
-#ifdef CONFIG_PPC_BOOK3E
-	/* Book3E initialization */
-	mr	r3,r24
-	bl	book3e_secondary_thread_init
-#endif
-	b	generic_secondary_common_init
-
 /*
  * On pSeries and most other platforms, secondary processors spin
  * in the following code.
@@ -385,7 +368,6 @@ _GLOBAL(generic_secondary_smp_init)
 20:
 #endif
 
-generic_secondary_common_init:
 	/* Set up a paca value for this processor. Since we have the
 	 * physical cpu id in r24, we need to search the pacas to find
 	 * which logical id maps to our physical one.
-- 
2.25.1

