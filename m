Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BDE224AB3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 12:41:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B84Kz0pV0zDqT4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 20:41:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=al2klimov.de
 (client-ip=78.46.175.9; helo=smtp.al2klimov.de;
 envelope-from=grandmaster@al2klimov.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=al2klimov.de
Received: from smtp.al2klimov.de (smtp.al2klimov.de [78.46.175.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B84JD21ZBzDqSM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 20:40:12 +1000 (AEST)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by smtp.al2klimov.de (Postfix) with ESMTPA id 3D570BC064;
 Sat, 18 Jul 2020 10:40:05 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 corbet@lwn.net, herbert@gondor.apana.org.au, davem@davemloft.net,
 leitao@debian.org, nayna@linux.ibm.com, pfsmorigo@gmail.com,
 grandmaster@al2klimov.de, linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Subject: [PATCH] powerpc: Replace HTTP links with HTTPS ones
Date: Sat, 18 Jul 2020 12:39:58 +0200
Message-Id: <20200718103958.5455-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp.al2klimov.de;
 auth=pass smtp.auth=aklimov@al2klimov.de
 smtp.mailfrom=grandmaster@al2klimov.de
X-Spamd-Bar: /
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

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master

 If there are any URLs to be removed completely
 or at least not (just) HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.


 Documentation/powerpc/mpc52xx.rst       | 2 +-
 arch/powerpc/crypto/crc32-vpmsum_core.S | 2 +-
 arch/powerpc/include/asm/hydra.h        | 2 +-
 drivers/crypto/vmx/aesp8-ppc.pl         | 2 +-
 drivers/crypto/vmx/ghashp8-ppc.pl       | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/powerpc/mpc52xx.rst b/Documentation/powerpc/mpc52xx.rst
index 8676ac63e077..30260707c3fe 100644
--- a/Documentation/powerpc/mpc52xx.rst
+++ b/Documentation/powerpc/mpc52xx.rst
@@ -2,7 +2,7 @@
 Linux 2.6.x on MPC52xx family
 =============================
 
-For the latest info, go to http://www.246tNt.com/mpc52xx/
+For the latest info, go to https://www.246tNt.com/mpc52xx/
 
 To compile/use :
 
diff --git a/arch/powerpc/crypto/crc32-vpmsum_core.S b/arch/powerpc/crypto/crc32-vpmsum_core.S
index c3524eba4d0d..a16a717c809c 100644
--- a/arch/powerpc/crypto/crc32-vpmsum_core.S
+++ b/arch/powerpc/crypto/crc32-vpmsum_core.S
@@ -19,7 +19,7 @@
  * We then use fixed point Barrett reduction to compute a mod n over GF(2)
  * for n = CRC using POWER8 instructions. We use x = 32.
  *
- * http://en.wikipedia.org/wiki/Barrett_reduction
+ * https://en.wikipedia.org/wiki/Barrett_reduction
  *
  * Copyright (C) 2015 Anton Blanchard <anton@au.ibm.com>, IBM
 */
diff --git a/arch/powerpc/include/asm/hydra.h b/arch/powerpc/include/asm/hydra.h
index b3b0f2d020f0..ae02eb53d6ef 100644
--- a/arch/powerpc/include/asm/hydra.h
+++ b/arch/powerpc/include/asm/hydra.h
@@ -10,7 +10,7 @@
  *
  *	© Copyright 1995 Apple Computer, Inc. All rights reserved.
  *
- *  It's available online from http://www.cpu.lu/~mlan/ftp/MacTech.pdf
+ *  It's available online from https://www.cpu.lu/~mlan/ftp/MacTech.pdf
  *  You can obtain paper copies of this book from computer bookstores or by
  *  writing Morgan Kaufmann Publishers, Inc., 340 Pine Street, Sixth Floor, San
  *  Francisco, CA 94104. Reference ISBN 1-55860-393-X.
diff --git a/drivers/crypto/vmx/aesp8-ppc.pl b/drivers/crypto/vmx/aesp8-ppc.pl
index db874367b602..50a0a18f35da 100644
--- a/drivers/crypto/vmx/aesp8-ppc.pl
+++ b/drivers/crypto/vmx/aesp8-ppc.pl
@@ -50,7 +50,7 @@
 # Written by Andy Polyakov <appro@openssl.org> for the OpenSSL
 # project. The module is, however, dual licensed under OpenSSL and
 # CRYPTOGAMS licenses depending on where you obtain it. For further
-# details see http://www.openssl.org/~appro/cryptogams/.
+# details see https://www.openssl.org/~appro/cryptogams/.
 # ====================================================================
 #
 # This module implements support for AES instructions as per PowerISA
diff --git a/drivers/crypto/vmx/ghashp8-ppc.pl b/drivers/crypto/vmx/ghashp8-ppc.pl
index 38b06503ede0..09bba1852eec 100644
--- a/drivers/crypto/vmx/ghashp8-ppc.pl
+++ b/drivers/crypto/vmx/ghashp8-ppc.pl
@@ -13,7 +13,7 @@
 # Written by Andy Polyakov <appro@openssl.org> for the OpenSSL
 # project. The module is, however, dual licensed under OpenSSL and
 # CRYPTOGAMS licenses depending on where you obtain it. For further
-# details see http://www.openssl.org/~appro/cryptogams/.
+# details see https://www.openssl.org/~appro/cryptogams/.
 # ====================================================================
 #
 # GHASH for for PowerISA v2.07.
-- 
2.27.0

