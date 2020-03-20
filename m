Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A9018C5B0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 04:23:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k8HR3cfDzDrgX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 14:23:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k8F82fpDzDrRl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 14:21:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=h+fErYYh; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48k8F81GHyz9sSQ; Fri, 20 Mar 2020 14:21:16 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48k8F80MLVz9sSR; Fri, 20 Mar 2020 14:21:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584674476;
 bh=QjnDbFCzqqy0Z/urlya/V3pJ+tngwgk/6NpyZYY+jOQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h+fErYYhaPfLjONPpPYOWrlGhizPairAmPy9md5fqFa7WtBjrbdiMxAeN0TQzFV4M
 pFc3GDbZc2PPHAGRMwfDg78l2yl4k/R4dDEfdHq3kEl0X7YX7KHqZoGCkxe1g9enY2
 8KNhiMlstBI/iLuTFZZ+IhsAHGml3MTCqtnSZuH8zTf6zVXWdcDpQnA4yNX3tH54MI
 WX3GOm4S1mi+lr2pwu4wfB2XyWcpSyGdnxa1k3yOASM8WylUYEjipvvn87uBIJmaBl
 sJfmSL11KGpwWWBAkOgvU5sAh0yjXWvMUUrDmWAhvecXmp9mPRvDFri9WkrA4bUg9K
 J1medTmtWyrTA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v6 2/2] powerpc/64: Prevent stack protection in early boot
Date: Fri, 20 Mar 2020 14:21:16 +1100
Message-Id: <20200320032116.1024773-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200320032116.1024773-1-mpe@ellerman.id.au>
References: <20200320032116.1024773-1-mpe@ellerman.id.au>
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
Cc: npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The previous commit reduced the amount of code that is run before we
setup a paca. However there are still a few remaining functions that
run with no paca, or worse, with an arbitrary value in r13 that will
be used as a paca pointer.

In particular the stack protector canary is stored in the paca, so if
stack protector is activated for any of these functions we will read
the stack canary from wherever r13 points. If r13 happens to point
outside of memory we will get a machine check / checkstop.

For example if we modify initialise_paca() to trigger stack
protection, and then boot in the mambo simulator with r13 poisoned in
skiboot before calling the kernel:

  DEBUG: 19952232: (19952232): INSTRUCTION: PC=0xC0000000191FC1E8: [0x3C4C006D]: addis   r2,r12,0x6D [fetch]
  DEBUG: 19952236: (19952236): INSTRUCTION: PC=0xC00000001807EAD8: [0x7D8802A6]: mflr    r12 [fetch]
  FATAL ERROR: 19952276: (19952276): Check Stop for 0:0: Machine Check with ME bit of MSR off
  DEBUG: 19952276: (19952276): INSTRUCTION: PC=0xC0000000191FCA7C: [0xE90D0CF8]: ld      r8,0xCF8(r13) [Instruction Failed]
  INFO: 19952276: (19952277): ** Execution stopped: Mambo Error, Machine Check Stop,  **
  systemsim % bt
  pc:                             0xC0000000191FCA7C      initialise_paca+0x54
  lr:                             0xC0000000191FC22C      early_setup+0x44
  stack:0x00000000198CBED0        0x0     +0x0
  stack:0x00000000198CBF00        0xC0000000191FC22C      early_setup+0x44
  stack:0x00000000198CBF90        0x1801C968      +0x1801C968

So annotate the relevant functions to ensure stack protection is never
enabled for them.

Fixes: 06ec27aea9fc ("powerpc/64: add stack protector support")
Cc: stable@vger.kernel.org # v4.20+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/paca.c     | 4 ++--
 arch/powerpc/kernel/setup.h    | 6 ++++++
 arch/powerpc/kernel/setup_64.c | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

v6: Clang doesn't understand the stack protector attribute, so ifdef to avoid
    breaking the clang build.

diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 0ee6308541b1..3f91ccaa9c74 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -176,7 +176,7 @@ static struct slb_shadow * __init new_slb_shadow(int cpu, unsigned long limit)
 struct paca_struct **paca_ptrs __read_mostly;
 EXPORT_SYMBOL(paca_ptrs);
 
-void __init initialise_paca(struct paca_struct *new_paca, int cpu)
+void __init __nostackprotector initialise_paca(struct paca_struct *new_paca, int cpu)
 {
 #ifdef CONFIG_PPC_PSERIES
 	new_paca->lppaca_ptr = NULL;
@@ -205,7 +205,7 @@ void __init initialise_paca(struct paca_struct *new_paca, int cpu)
 }
 
 /* Put the paca pointer into r13 and SPRG_PACA */
-void setup_paca(struct paca_struct *new_paca)
+void __nostackprotector setup_paca(struct paca_struct *new_paca)
 {
 	/* Setup r13 */
 	local_paca = new_paca;
diff --git a/arch/powerpc/kernel/setup.h b/arch/powerpc/kernel/setup.h
index 2dd0d9cb5a20..2ec835574cc9 100644
--- a/arch/powerpc/kernel/setup.h
+++ b/arch/powerpc/kernel/setup.h
@@ -8,6 +8,12 @@
 #ifndef __ARCH_POWERPC_KERNEL_SETUP_H
 #define __ARCH_POWERPC_KERNEL_SETUP_H
 
+#ifdef CONFIG_CC_IS_CLANG
+#define __nostackprotector
+#else
+#define __nostackprotector __attribute__((__optimize__("no-stack-protector")))
+#endif
+
 void initialize_cache_info(void);
 void irqstack_early_init(void);
 
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 17886d147dd0..438a9befce41 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -279,7 +279,7 @@ void __init record_spr_defaults(void)
  * device-tree is not accessible via normal means at this point.
  */
 
-void __init early_setup(unsigned long dt_ptr)
+void __init __nostackprotector early_setup(unsigned long dt_ptr)
 {
 	static __initdata struct paca_struct boot_paca;
 
-- 
2.25.1

