Return-Path: <linuxppc-dev+bounces-17825-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBsZIwjtqmmOYAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17825-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 16:04:40 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1F222362D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 16:04:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS8nw0Nffz30T9;
	Sat, 07 Mar 2026 02:04:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772809475;
	cv=none; b=ZrDj3lyBa6M6VeBY3tTJYS/LvHkMFZW+xGBxeqzbf7pKUvMa8HS5w2S/Qz+LFovqZzhgSP0Yoj/X7+rHV4cZ+6b0d3ST8txwaF3EFuokIxvUZEIuj68CvMF8wwBUkJHFn90XA4ge2n3teQ8/+dZhrppt55SW1tRNqyKPSHGqrP33MQfhStWb/3yb0Cbc54IN84PLLhEbc/9CxG5ahm7mICj9667DZUo7esMUz6lhy55B8XpkMHHjAnFG9SH8M64Fy6HJicl4sDtbibUFkmQS54BwdFbXMKbzAPxlyMyHyr29W00bqsKW6FZRuX0YKUwpQWKW3O7jZiW7yeRWUWdIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772809475; c=relaxed/relaxed;
	bh=kWkqAWhJ2arHOPG/MP72bMgLHzSneb4Uqrx4KzqS3Jc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zvgj6aJATKtZIJHHs19RifsREveNitl2nWQE81V40nGN2g6hbztfuSOOT++RZG1kUdOQPvekhCmoFJ887afnkhHYYkH1ewxYdOcPcMLM53ao/sHjSio2rEHkYi6Uz9QA1MG25yIcsZP1RFigzpkmBtFpQgxdQ28vd6c7e4EjkW2mqF11TcQhIbL+oxUIoV/Nc9o7PjU1d9gM59bEvsFxON40tFoaLCaHqRrYxsai2vDnAVWAcFjEn1uJ/owlFmPDXPcz9FgoEFBzvq7Mm9Oj8cBdDLXHLA/LH0VxEL1JpuihiarSbP4bI1V9AWxUA1/5K0TOutbraM1XyP1r3dhK+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l00mYyAe; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l00mYyAe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS8nt6Fkfz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 02:04:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F83040DCD;
	Fri,  6 Mar 2026 15:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2D7C4CEF7;
	Fri,  6 Mar 2026 15:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772809471;
	bh=25CPe4EGSUbqlSDNHofrLGG8PR/WzU7sNEADToXqfos=;
	h=From:To:Cc:Subject:Date:From;
	b=l00mYyAeVzZNhOkHGoBqNdxgrGLiNdHhVl3kHwWYeL1Y9cFWXVlXooc68wEuF7L0Q
	 OF2NVmz98U+4tMbNLueBvXb1fQq7cXDImpDKIGf4tKnWW++vZxu/EY+wexkETnxwFD
	 MWqyCam4Ic8JyGq5WqejMJe9U3A1XlNrnepTU7jea0jQaiV8DaUy+MCEWae68Risxu
	 qkBXP3twWnqgmthNNhGJ5AZYReddCWjdC3dgnUrpIrec7ooGju9tx+THX/KeuImLH8
	 yhx06aMwr48pfMFdKNoEE3NgYZYj6wC+11wNOWM+t5CSAxsd0lxY8gLOiIilbMEZIm
	 dZ/eso6rn5L2w==
From: Arnd Bergmann <arnd@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Coiby Xu <coxu@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	keyrings@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] integrity: avoid using __weak functions
Date: Fri,  6 Mar 2026 16:03:24 +0100
Message-Id: <20260306150421.270124-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: DD1F222362D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17825-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:arnd@arndb.de,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:jarkko@kernel.org,m:nathan@kernel.org,m:ardb@kernel.org,m:coxu@redhat.com,m:npiggin@gmail.com,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:eric.snowberg@oracle.com,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:ajd@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-integrity@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:keyrings@vger.kernel.org,m:llvm@lists.linux.dev,m:dmitrykasatkin@gmail.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[arnd@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,arndb.de,huawei.com,gmail.com,paul-moore.com,namei.org,hallyn.com,kernel.org,redhat.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.ibm.com,oracle.com,google.com,lists.ozlabs.org,vger.kernel.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

The security/integrity/secure_boot.c file containing only a __weak function
leads to a build failure with clang:

Cannot find symbol for section 2: .text.
security/integrity/secure_boot.o: failed

Moving the function into another file that has at least one non-__weak
symbol would solve this, but this is always fragile.

Avoid __weak definitions entirely and instead move the stub helper into
an asm-generic header that gets used by default on architectures that
do not provide their own version. This is consistent with how a lot
of other architecture specific functionality works, and is more reliable.

Fixes: a0f87ede3bf4 ("integrity: Make arch_ima_get_secureboot integrity-wide")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This is a larger change than I had hoped for.

If you prefer a different way to address the build failure, please
treat this as a Reported-by when you apply your own fix
---
 arch/powerpc/include/asm/secure_boot.h        |  6 +++
 arch/powerpc/kernel/secure_boot.c             |  1 -
 arch/s390/include/asm/secure_boot.h           |  9 +++++
 include/asm-generic/Kbuild                    |  1 +
 include/asm-generic/secure_boot.h             | 37 +++++++++++++++++++
 include/linux/secure_boot.h                   |  8 +---
 security/integrity/Makefile                   |  2 +-
 .../integrity/platform_certs/load_powerpc.c   |  2 +-
 security/integrity/secure_boot.c              | 16 --------
 9 files changed, 56 insertions(+), 26 deletions(-)
 create mode 100644 arch/s390/include/asm/secure_boot.h
 create mode 100644 include/asm-generic/secure_boot.h
 delete mode 100644 security/integrity/secure_boot.c

diff --git a/arch/powerpc/include/asm/secure_boot.h b/arch/powerpc/include/asm/secure_boot.h
index a2ff556916c6..db72dcdf5bb3 100644
--- a/arch/powerpc/include/asm/secure_boot.h
+++ b/arch/powerpc/include/asm/secure_boot.h
@@ -10,11 +10,17 @@
 
 #ifdef CONFIG_PPC_SECURE_BOOT
 
+bool arch_get_secureboot(void);
 bool is_ppc_secureboot_enabled(void);
 bool is_ppc_trustedboot_enabled(void);
 
 #else
 
+static inline bool arch_get_secureboot(void)
+{
+	return false;
+}
+
 static inline bool is_ppc_secureboot_enabled(void)
 {
 	return false;
diff --git a/arch/powerpc/kernel/secure_boot.c b/arch/powerpc/kernel/secure_boot.c
index 28436c1599e0..e3ea46124180 100644
--- a/arch/powerpc/kernel/secure_boot.c
+++ b/arch/powerpc/kernel/secure_boot.c
@@ -7,7 +7,6 @@
 #include <linux/of.h>
 #include <linux/secure_boot.h>
 #include <linux/string_choices.h>
-#include <asm/secure_boot.h>
 
 static struct device_node *get_ppc_fw_sb_node(void)
 {
diff --git a/arch/s390/include/asm/secure_boot.h b/arch/s390/include/asm/secure_boot.h
new file mode 100644
index 000000000000..4086fdfb9e5c
--- /dev/null
+++ b/arch/s390/include/asm/secure_boot.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_S390_SECURE_BOOT_H
+#define _ASM_S390_SECURE_BOOT_H
+
+#include <linux/types.h
+
+bool arch_get_secureboot(void);
+
+#endif
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 0f97f7b594c3..8c0a499141fb 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -51,6 +51,7 @@ mandatory-y += rqspinlock.h
 mandatory-y += runtime-const.h
 mandatory-y += rwonce.h
 mandatory-y += sections.h
+mandatory-y += secure_boot.h
 mandatory-y += serial.h
 mandatory-y += shmparam.h
 mandatory-y += simd.h
diff --git a/include/asm-generic/secure_boot.h b/include/asm-generic/secure_boot.h
new file mode 100644
index 000000000000..08d8e294576c
--- /dev/null
+++ b/include/asm-generic/secure_boot.h
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Red Hat, Inc. All Rights Reserved.
+ *
+ * Author: Coiby Xu <coxu@redhat.com>
+ */
+#ifndef _ASM_SECURE_BOOT_H
+#define _ASM_SECURE_BOOT_H
+
+
+#include <linux/types.h>
+
+#ifdef CONFIG_EFI
+
+/*
+ * Default implementation.
+ * Architectures that support secure boot must override this.
+ *
+ * Returns true if the platform secure boot is enabled.
+ * Returns false if disabled or not supported.
+ */
+bool arch_get_secureboot(void);
+
+#else
+
+/*
+ * Default implementation.
+ * Architectures that support secure boot must override this.
+ */
+static inline bool arch_get_secureboot(void)
+{
+	return false;
+}
+
+#endif
+
+#endif
diff --git a/include/linux/secure_boot.h b/include/linux/secure_boot.h
index 3ded3f03655c..9ddfbe109b1d 100644
--- a/include/linux/secure_boot.h
+++ b/include/linux/secure_boot.h
@@ -8,12 +8,6 @@
 #ifndef _LINUX_SECURE_BOOT_H
 #define _LINUX_SECURE_BOOT_H
 
-#include <linux/types.h>
-
-/*
- * Returns true if the platform secure boot is enabled.
- * Returns false if disabled or not supported.
- */
-bool arch_get_secureboot(void);
+#include <asm/secure_boot.h>
 
 #endif /* _LINUX_SECURE_BOOT_H */
diff --git a/security/integrity/Makefile b/security/integrity/Makefile
index 548665e2b702..45dfdedbdad4 100644
--- a/security/integrity/Makefile
+++ b/security/integrity/Makefile
@@ -5,7 +5,7 @@
 
 obj-$(CONFIG_INTEGRITY) += integrity.o
 
-integrity-y := iint.o secure_boot.o
+integrity-y := iint.o
 integrity-$(CONFIG_INTEGRITY_AUDIT) += integrity_audit.o
 integrity-$(CONFIG_INTEGRITY_SIGNATURE) += digsig.o
 integrity-$(CONFIG_INTEGRITY_ASYMMETRIC_KEYS) += digsig_asymmetric.o
diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
index 714c961a00f5..ab74e947a8bc 100644
--- a/security/integrity/platform_certs/load_powerpc.c
+++ b/security/integrity/platform_certs/load_powerpc.c
@@ -10,7 +10,7 @@
 #include <linux/cred.h>
 #include <linux/err.h>
 #include <linux/slab.h>
-#include <asm/secure_boot.h>
+#include <linux/secure_boot.h>
 #include <asm/secvar.h>
 #include "keyring_handler.h"
 #include "../integrity.h"
diff --git a/security/integrity/secure_boot.c b/security/integrity/secure_boot.c
deleted file mode 100644
index fc2693c286f8..000000000000
--- a/security/integrity/secure_boot.c
+++ /dev/null
@@ -1,16 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2026 Red Hat, Inc. All Rights Reserved.
- *
- * Author: Coiby Xu <coxu@redhat.com>
- */
-#include <linux/secure_boot.h>
-
-/*
- * Default weak implementation.
- * Architectures that support secure boot must override this.
- */
-__weak bool arch_get_secureboot(void)
-{
-	return false;
-}
-- 
2.39.5


