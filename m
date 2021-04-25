Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE0436A6F8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Apr 2021 13:59:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FSmlW1txCz30GH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Apr 2021 21:59:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iIwbRred;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iIwbRred; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FSml83PrXz2xyB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Apr 2021 21:58:44 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FSml65gvSz9sVq; Sun, 25 Apr 2021 21:58:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1619351922;
 bh=X8ErhSMrLcRZewhiPBOUJLceKdSv3+WYhMIEMsszqn4=;
 h=From:To:Subject:Date:From;
 b=iIwbRredwQ6BP+0d6ABi4Z1eKeVQ119yzrdGYvUlo5PYd6PU5G1HF4XKm3A1pi0w1
 ME2E+1fM9Bi+WxrPbnsB5yc04FAkeopi6lXglLolpbAvNU9NFnBmmRz8S3aomJTr+C
 Jezl8qksGFBXX7EjgQe7Nj41zx7RtyTEk55v1jM75xZ3/HKql7a7/vYmc9+Hhy88jP
 8eAwErTvm8A6WXPSHkK2pVfDUcxNWm1QyIvWd2S2SaY3DfqQZAm5YLkHQ0U62C3G15
 kzvG1RloFer08/YndgTMz0rj2np5b227Ed2ERAs9XMrmIm10cRHoUypPQgVJrOz2c4
 zfNMUurtpAiww==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/kvm: Fix build error when PPC_MEM_KEYS/PPC_PSERIES=n
Date: Sun, 25 Apr 2021 21:58:31 +1000
Message-Id: <20210425115831.2818434-1-mpe@ellerman.id.au>
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

lkp reported a randconfig failure:

     In file included from arch/powerpc/include/asm/book3s/64/pkeys.h:6,
                    from arch/powerpc/kvm/book3s_64_mmu_host.c:15:
     arch/powerpc/include/asm/book3s/64/hash-pkey.h: In function 'hash__vmflag_to_pte_pkey_bits':
  >> arch/powerpc/include/asm/book3s/64/hash-pkey.h:10:23: error: 'VM_PKEY_BIT0' undeclared
        10 |  return (((vm_flags & VM_PKEY_BIT0) ? H_PTE_PKEY_BIT0 : 0x0UL) |
         |                       ^~~~~~~~~~~~

We added the include of book3s/64/pkeys.h for pte_to_hpte_pkey_bits(),
but that header on its own should only be included when PPC_MEM_KEYS=y.
Instead include linux/pkeys.h, which brings in the right definitions
when PPC_MEM_KEYS=y and also provides empty stubs when PPC_MEM_KEYS=n.

Fixes: e4e8bc1df691 ("powerpc/kvm: Fix PR KVM with KUAP/MEM_KEYS enabled")
Cc: stable@vger.kernel.org # v5.11+
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kvm/book3s_64_mmu_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_host.c b/arch/powerpc/kvm/book3s_64_mmu_host.c
index 5ac66be1cb3c..c3e31fef0be1 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_host.c
@@ -8,11 +8,11 @@
  */
 
 #include <linux/kvm_host.h>
+#include <linux/pkeys.h>
 
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
 #include <asm/book3s/64/mmu-hash.h>
-#include <asm/book3s/64/pkeys.h>
 #include <asm/machdep.h>
 #include <asm/mmu_context.h>
 #include <asm/hw_irq.h>
-- 
2.25.1

