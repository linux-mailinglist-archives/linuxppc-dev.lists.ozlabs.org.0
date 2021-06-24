Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDAC3B2F0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 14:34:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9fj93Kgkz3byx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 22:34:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a3t1Medc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=a3t1Medc; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9fhg2N9tz2yXP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 22:34:27 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G9fhc1h0Rz9sjD; Thu, 24 Jun 2021 22:34:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1624538064;
 bh=LV4uiCu8omrGoOXVQDGAw4VN79ERHHioEYwFHmHjWTw=;
 h=From:To:Cc:Subject:Date:From;
 b=a3t1MedcQJxW+qgQFs7972uAUVrUIf27mvD32pH+7q49CwiTLIzFw4464LBp4h9GC
 wXIS0vYaWEr0xzPfCIrFtgWJzo/VqKOTceRa6V8brbL4VAN3a1e5FCxLFCV/fuv8Zy
 eO27oBrDl9WHjjcC+QCG67cpl6y9h/QPAuzjsjm82IFqq3+I0yFxUi/SbXuc/wpBbB
 aNOSfbOcBwhtHnBqaB1C2eYUvYNgS1wk8f8GMCBPQHPmTPUESW0sT6zVcZqEy94CAu
 pM++e4o5SgnrHxADFIbhHTZIRdgxnkD5ZEO8e4dTZbSQx6y8oz5WhI8LGqs3E224xP
 V1/D4P4MxZ09g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Fix boot failure with 4K Radix
Date: Thu, 24 Jun 2021 22:34:20 +1000
Message-Id: <20210624123420.2784187-1-mpe@ellerman.id.au>
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
Cc: dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When using the Radix MMU our PGD is always 64K, and must be naturally
aligned.

For a 4K page size kernel that means page alignment of swapper_pg_dir is
not sufficient, leading to failure to boot.

Use the existing MAX_PTRS_PER_PGD which has the correct value, and
avoids us hard-coding 64K here.

Fixes: e72421a085a8 ("powerpc: Define swapper_pg_dir[] in C")
Reported-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/pgtable.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 1707ab580ee2..cd16b407f47e 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -28,7 +28,13 @@
 #include <asm/hugetlb.h>
 #include <asm/pte-walk.h>
 
-pgd_t swapper_pg_dir[MAX_PTRS_PER_PGD] __page_aligned_bss;
+#ifdef CONFIG_PPC64
+#define PGD_ALIGN (sizeof(pgd_t) * MAX_PTRS_PER_PGD)
+#else
+#define PGD_ALIGN PAGE_SIZE
+#endif
+
+pgd_t swapper_pg_dir[MAX_PTRS_PER_PGD] __section(".bss..page_aligned") __aligned(PGD_ALIGN);
 
 static inline int is_exec_fault(void)
 {
-- 
2.25.1

