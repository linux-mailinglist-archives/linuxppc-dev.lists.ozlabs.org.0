Return-Path: <linuxppc-dev+bounces-1869-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C457995EE0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 07:18:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNh4R3jqTz2yG9;
	Wed,  9 Oct 2024 16:18:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728451111;
	cv=none; b=Bf3ndsG7sv1xRziET/2Mq9N0p5xPBBB6Dgj5qVN53fozAFB1MBQRmL86RiN9nsaGHcwlua659P7kn8Wt/EsfPVCx4lhzYEf7cFgwTyNOSB/5/F8aI+fBci12jbQWbeUjSZ2YXJhmNWKqus9BRkUZYSdZBHVuFpMy4G1HItuZRkOKQpCTb29kipY60aPcP2oqexOYq2HJE+kOWvwd4TBqXLpsHHfvnS9X3uBZKWs1sNfP49dU+iktHVOz1xy76u0ujRTiMyBGHhj9eUXxFMGon3h3V5EV+KACYkEGV3uJE4PAlhHerfQy9fR7F8Ngksmp/hZVqrFkGRJimJQ4UfbPLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728451111; c=relaxed/relaxed;
	bh=/2fdo1k4hKJkz1aBMESfCkRGljgvCeelgkI8u7WzoGM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Dk7/iKzDIlKHOjftZL/l9lGequ51i3dHItc8QaWiAVpriUSRdmLQIPc5ZHno8qIS0E66vJkSnzCN7UTMmv6yuTsqr5vahRpC5kyJ3bTg/fEslynrXZg37ajB73IgZfeSbMtLbGChTOzBlwuXnMMjA+HKldCHv9kmYwor0BLX5XQJt24T1od3yRBLiobIy2Hds3AwGLPIhzl4pGD4q2EofEImkI0Po8r3iCFhhjUdiYBudrn28JhHvW6zyllmXT4XR2UpLXuXBDnkUdCc+iUsXjmulSwfNL97smwl7FO/8FRc6rTg7vZMLk0D3wwO8fSjH90ssJhLGprJYIfPbKrD8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lZ+ZIZ86; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lZ+ZIZ86;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNh4Q5q5kz2xks
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 16:18:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728451110;
	bh=/2fdo1k4hKJkz1aBMESfCkRGljgvCeelgkI8u7WzoGM=;
	h=From:To:Subject:Date:From;
	b=lZ+ZIZ861742w7kXYzNu+34K1Zk6CoLupWXQyhA2E4es8XF5/eKkPpAd0zZFJxRs2
	 l7UPezbUikZeLBb6a3RzvZ9U8VhGcNdb0mzNDO8zV6OtM4iD7FO/Ar7u5MXzGOXgfC
	 1+Y7ZXs2a0HxngTktEJPhTHW8ci/SCYSUzeSQUyctjN5AIx5g9JSZnuKnl4i5C15RH
	 ZpkGznbXKtH/wAC1nmaIkIKHODE50w/9bSHXhNtiEGscu/Z6IcPBRZL26/f3yvL3rM
	 bO/hy1FpxSPcpJTVhQYvZzRi+iPSpIGpxWGhyDibWPb6LBbbsIqT1GlgWCtKat2Ici
	 k+X9up8HCTBbA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNh4P6nRCz4wy9;
	Wed,  9 Oct 2024 16:18:29 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] powerpc/machdep: Drop include of seq_file.h
Date: Wed,  9 Oct 2024 16:18:25 +1100
Message-ID: <20241009051826.132805-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Drop the include of seq_file.h in machdep.h, replace it with a forward
declaration of struct seq_file, which is all that's required.

Add direct includes of seq_file.h to some files that were getting
seq_file.h via machdep.h.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/machdep.h               | 2 +-
 arch/powerpc/platforms/52xx/efika.c              | 1 +
 arch/powerpc/platforms/embedded6xx/linkstation.c | 1 +
 arch/powerpc/platforms/embedded6xx/mvme5100.c    | 1 +
 arch/powerpc/platforms/pseries/lpar.c            | 1 +
 arch/powerpc/platforms/pseries/msi.c             | 1 +
 arch/powerpc/platforms/pseries/papr_scm.c        | 1 +
 arch/powerpc/sysdev/xive/spapr.c                 | 1 +
 8 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 1862f94335ee..3326730cd300 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -4,7 +4,6 @@
 #ifdef __KERNEL__
 
 #include <linux/compiler.h>
-#include <linux/seq_file.h>
 #include <linux/init.h>
 #include <linux/dma-mapping.h>
 #include <linux/export.h>
@@ -18,6 +17,7 @@ struct file;
 struct pci_controller;
 struct kimage;
 struct pci_host_bridge;
+struct seq_file;
 
 struct machdep_calls {
 	const char	*name;
diff --git a/arch/powerpc/platforms/52xx/efika.c b/arch/powerpc/platforms/52xx/efika.c
index 37a67120f257..a7172f9ebaad 100644
--- a/arch/powerpc/platforms/52xx/efika.c
+++ b/arch/powerpc/platforms/52xx/efika.c
@@ -13,6 +13,7 @@
 #include <generated/utsrelease.h>
 #include <linux/pci.h>
 #include <linux/of.h>
+#include <linux/seq_file.h>
 #include <asm/dma.h>
 #include <asm/time.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/platforms/embedded6xx/linkstation.c b/arch/powerpc/platforms/embedded6xx/linkstation.c
index e265f026eee2..4012f206ec63 100644
--- a/arch/powerpc/platforms/embedded6xx/linkstation.c
+++ b/arch/powerpc/platforms/embedded6xx/linkstation.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/initrd.h>
 #include <linux/of_platform.h>
+#include <linux/seq_file.h>
 
 #include <asm/time.h>
 #include <asm/mpic.h>
diff --git a/arch/powerpc/platforms/embedded6xx/mvme5100.c b/arch/powerpc/platforms/embedded6xx/mvme5100.c
index 00bec0f051be..5ca41972ef22 100644
--- a/arch/powerpc/platforms/embedded6xx/mvme5100.c
+++ b/arch/powerpc/platforms/embedded6xx/mvme5100.c
@@ -14,6 +14,7 @@
 
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/seq_file.h>
 
 #include <asm/i8259.h>
 #include <asm/pci-bridge.h>
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index c1d8bee8f701..0c428f1ae712 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -16,6 +16,7 @@
 #include <linux/export.h>
 #include <linux/jump_label.h>
 #include <linux/delay.h>
+#include <linux/seq_file.h>
 #include <linux/stop_machine.h>
 #include <linux/spinlock.h>
 #include <linux/cpuhotplug.h>
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index 6dfb55b52d36..fdc2f7f38dc9 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -9,6 +9,7 @@
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/msi.h>
+#include <linux/seq_file.h>
 
 #include <asm/rtas.h>
 #include <asm/hw_irq.h>
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 9e297f88adc5..f84ac9fbe203 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -6,6 +6,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/ioport.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/ndctl.h>
 #include <linux/sched.h>
diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index f2fa985a2c77..5aedbe3e8e6a 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -7,6 +7,7 @@
 
 #include <linux/types.h>
 #include <linux/irq.h>
+#include <linux/seq_file.h>
 #include <linux/smp.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
-- 
2.46.2


