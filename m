Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E4E5AFCDC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 08:51:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMtG00mP8z3bsy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 16:51:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eP7QwmyY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMtFK58Zsz3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 16:51:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eP7QwmyY;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MMtFK43kJz4x1T;
	Wed,  7 Sep 2022 16:51:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662533461;
	bh=LXUy2xFnX+RIesyI1swZ7HpnqnHarr5QZ8Lv5ayXjkc=;
	h=From:To:Cc:Subject:Date:From;
	b=eP7QwmyYbcheoy95VXRAK3bRLRMiXX+H/INJNIZLH4i12j/sPEpwgQ6mKDX1GQFyj
	 n8KbaDcMKz0uMvCykCLvAuQJIxgNZ+M91aQZe0VLm5B67w36P5AhzXuMd6gjfUh6dH
	 GFXHRq5iNCoKwNM2VbuK9PHdiw+r4iOGTlAWlrBOexBRdtPQw+bXyO9F03YuuJ/aDK
	 4Wl1YUuLjNJLq3OJSlPWAfBy44OoI7Vzd2rBgkYYXks7uEffbjuNGgPzYiZSfOMzWn
	 ThM0yUD/gnhbaCd5G15EjBdz+vMZQR9ybDiRL01K/Q9CQENV+4E+y6K03dzyQEl5sT
	 nalGaAOsHskwQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/pseries: Fix plpks crash on non-pseries
Date: Wed,  7 Sep 2022 16:50:38 +1000
Message-Id: <20220907065038.1604504-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.2
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
Cc: nathan@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As reported[1] by Nathan, the recently added plpks driver will crash if
it's built into the kernel and booted on a non-pseries machine, eg
powernv:

  kernel BUG at arch/powerpc/kernel/syscall.c:39!
  Oops: Exception in kernel mode, sig: 5 [#1]
  LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
  ...
  NIP system_call_exception+0x90/0x3d0
  LR  system_call_common+0xec/0x250
  Call Trace:
    0xc0000000035c3e10 (unreliable)
    system_call_common+0xec/0x250
  --- interrupt: c00 at plpar_hcall+0x38/0x60
  NIP:  c0000000000e4300 LR: c00000000202945c CTR: 0000000000000000
  REGS: c0000000035c3e80 TRAP: 0c00   Not tainted  (6.0.0-rc4)
  MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 28000284  XER: 00000000
  ...
  NIP plpar_hcall+0x38/0x60
  LR  pseries_plpks_init+0x64/0x23c
  --- interrupt: c00

On powernv Linux is the hypervisor, so a hypercall just ends up going to
the syscall path, which BUGs if the syscall (hypercall) didn't come from
userspace.

The fix is simply to not probe the plpks driver on non-pseries machines.

[1] https://lore.kernel.org/linuxppc-dev/Yxe06fbq18Wv9y3W@dev-arch.thelio-3990X/

Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform KeyStore")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/pseries/plpks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 52aaa2894606..f4b5b5a64db3 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -17,6 +17,7 @@
 #include <linux/string.h>
 #include <linux/types.h>
 #include <asm/hvcall.h>
+#include <asm/machdep.h>
 
 #include "plpks.h"
 
@@ -457,4 +458,4 @@ static __init int pseries_plpks_init(void)
 
 	return rc;
 }
-arch_initcall(pseries_plpks_init);
+machine_arch_initcall(pseries, pseries_plpks_init);
-- 
2.37.2

