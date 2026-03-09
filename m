Return-Path: <linuxppc-dev+bounces-17932-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EqIBYQvr2nFPQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17932-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 21:37:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C81CC240ED9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 21:37:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV82N5J7nz3c9r;
	Tue, 10 Mar 2026 07:37:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773088636;
	cv=none; b=GZkC9fi9dSywKpCjXRwpJn4pwRnEG+ODig7gX30REeJ8nHUucUQRqh4+R2DKz+FYMe9QZfp2PnrSfFqNy4gshoiSdJAYntSRsjzoMTLpl0uVhKlxXhr0oqI5exEBvFGoWTkjz7qp9qrSfLqiNa4VrlS5QXnbh4mfUXNZz7MfVE/gUOudBlFEC9LFn7N7zkf2FXRS6M7nQpQFc8x+hNV2QINd7GgSDKrzDMYTx2pfrO7Hm57vFYHHsXpiTxIDuwibAp7WXlj7lNlrZ4i7bla2WcFnUP1LqCCNs8OsSCHVAlwOFUaIJmbaPms0EyAt4Pl/Q8zzE98S9myDWW1Dus0+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773088636; c=relaxed/relaxed;
	bh=4r4uecneHTv0hOUPXyMbeoJRsbjDg47CUu0h1wDFLV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m4VgHfZWB+wHIytXgV4dsKmZxhJSqvomQrEiGsiY14MLfpEAGKeqCpPzXrbiApShxIbsK8E5j+SfxxK4227RbrLYo4IZPYPTs6/nJejAjet0MQMjnhZu1r8gr4kcBGSkW3EnyHip7jeu8LlVpJarvrZ9VtZcEN3y4KHsgdH3YJ1uietUu2UIuSWpa3UGayQpK8T6vLYM/WeHMTdeYOog1/nBN+r34O/pOoGpl63X8b7JU934l8NzbQ47tKTbyWqieTFUz0H+BSwhd3vmlWttWOrEFOC80GjuNzKj1uc9WSXpJLh1Xc++ROp0XvrpJYAEQtuLt3xkbBoDLvOUYIwudw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MAPPmBl1; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MAPPmBl1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV82M5XfBz3c8h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 07:37:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85EE660097;
	Mon,  9 Mar 2026 20:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4013C4CEF7;
	Mon,  9 Mar 2026 20:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773088632;
	bh=y6yHZjzRHz8qgrcVZjbW20G4/s3LnaHOsPnyYMHI7zw=;
	h=From:Date:Subject:To:Cc:From;
	b=MAPPmBl1JEkdt+MdYLrh8LOhqW7t70Ogyy64+Fv/8uJQ0nJQZCId999gytuCojVTO
	 xKrS8qpflGUOaOIsEQ1CVym33M3fPKps7eMPxWXZAeLCQWWhTsK8SJKe5FMY5NWE0x
	 UhXmq+G3q82WjBvg4aQgLnjs8CsxvAHot7g733S068lD14JuAuzFarpGIna2oZcYmE
	 SnP9f3VuwiW0YMyjKWrhl7jfyRbLrtklYlUlLZv922BWBa97cikr3f8gqpylWsK6eo
	 RIFsDbM0kGqeTL4jVBPmin+DdHcEvqUP/516KFaZvMj+Kwy1mvWH9lEWHeZRZX12ef
	 vcXF9qExdSBQQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 09 Mar 2026 13:37:02 -0700
Subject: [PATCH] integrity: Eliminate weak definition of
 arch_get_secureboot()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-integrity-drop-weak-arch-get-secureboot-v1-1-6460d5c4bb89@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNyw6CMBBG4Vchs3aSWoyxvopxUdqfMppQMi1eQ
 nh3UZff5pyFClRQ6NwspHhIkTxu2O8aCoMfE1jiZrLGHk1rHMtYkVTqm6PmiZ/wd/YaBk6oXBB
 mRZdz5QAfrTvFg2t72mqTopfX73S5/l3m7oZQv3la1w8uN0CXiwAAAA==
X-Change-ID: 20260309-integrity-drop-weak-arch-get-secureboot-cead298d493f
To: Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
 Coiby Xu <coxu@redhat.com>, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, 
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5057; i=nathan@kernel.org;
 h=from:subject:message-id; bh=y6yHZjzRHz8qgrcVZjbW20G4/s3LnaHOsPnyYMHI7zw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJnr9Yv5y4oyL1hnRjjflo6Pt/JVilJ7sKTBr+rB3goL6
 dqpXxM6SlkYxLgYZMUUWaofqx43NJxzlvHGqUkwc1iZQIYwcHEKwESOLWH4w2+zVHOSfUm70YJP
 opIlZQlJvywEF+b/yrafbVA+vaPiFsP/9LOPU3ii9T5fzLevWvhn0Wmbt03zdj4/wejyZXHLdZ7
 J/AA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: C81CC240ED9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17932-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:arnd@arndb.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:coxu@redhat.com,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-integrity@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:llvm@lists.linux.dev,m:nathan@kernel.org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.ibm.com,huawei.com,gmail.com,oracle.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,paul-moore.com,namei.org,hallyn.com,redhat.com,vger.kernel.org,lists.ozlabs.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

security/integrity/secure_boot.c contains a single __weak function,
which breaks recordmcount when building with clang:

  $ make -skj"$(nproc)" ARCH=powerpc LLVM=1 ppc64_defconfig security/integrity/secure_boot.o
  Cannot find symbol for section 2: .text.
  security/integrity/secure_boot.o: failed

Introduce a Kconfig symbol, CONFIG_HAVE_ARCH_GET_SECUREBOOT, to indicate
that an architecture provides a definition of arch_get_secureboot().
Provide a static inline stub when this symbol is not defined to achieve
the same effect as the __weak function, allowing secure_boot.c to be
removed altogether. Move the s390 definition of arch_get_secureboot()
out of the CONFIG_KEXEC_FILE block to ensure it is always available, as
it does not actually depend on KEXEC_FILE.

Fixes: 31a6a07eefeb ("integrity: Make arch_ima_get_secureboot integrity-wide")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/Kconfig                     |  3 +++
 arch/powerpc/Kconfig             |  1 +
 arch/s390/Kconfig                |  1 +
 arch/s390/kernel/ipl.c           | 10 +++++-----
 include/linux/secure_boot.h      |  4 ++++
 security/integrity/Makefile      |  2 +-
 security/integrity/secure_boot.c | 16 ----------------
 7 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 102ddbd4298e..a6d1c8cc1d64 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1841,4 +1841,7 @@ config ARCH_WANTS_PRE_LINK_VMLINUX
 config ARCH_HAS_CPU_ATTACK_VECTORS
 	bool
 
+config HAVE_ARCH_GET_SECUREBOOT
+	def_bool EFI
+
 endmenu
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ad7a2fe63a2a..da1eafb64354 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1061,6 +1061,7 @@ config PPC_SECURE_BOOT
 	depends on IMA_ARCH_POLICY
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT
 	select PSERIES_PLPKS if PPC_PSERIES
+	select HAVE_ARCH_GET_SECUREBOOT
 	help
 	  Systems with firmware secure boot enabled need to define security
 	  policies to extend secure boot to the OS. This config allows a user
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 2101cc738b5e..4197c20d34b4 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -181,6 +181,7 @@ config S390
 	select GENERIC_IOREMAP if PCI
 	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
+	select HAVE_ARCH_GET_SECUREBOOT
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN
diff --git a/arch/s390/kernel/ipl.c b/arch/s390/kernel/ipl.c
index 2d01a1713938..3c346b02ceb9 100644
--- a/arch/s390/kernel/ipl.c
+++ b/arch/s390/kernel/ipl.c
@@ -2388,6 +2388,11 @@ void __no_stack_protector s390_reset_system(void)
 	diag_amode31_ops.diag308_reset();
 }
 
+bool arch_get_secureboot(void)
+{
+	return ipl_secure_flag;
+}
+
 #ifdef CONFIG_KEXEC_FILE
 
 int ipl_report_add_component(struct ipl_report *report, struct kexec_buf *kbuf,
@@ -2505,11 +2510,6 @@ void *ipl_report_finish(struct ipl_report *report)
 	return buf;
 }
 
-bool arch_get_secureboot(void)
-{
-	return ipl_secure_flag;
-}
-
 int ipl_report_free(struct ipl_report *report)
 {
 	struct ipl_report_component *comp, *ncomp;
diff --git a/include/linux/secure_boot.h b/include/linux/secure_boot.h
index 3ded3f03655c..d17e92351567 100644
--- a/include/linux/secure_boot.h
+++ b/include/linux/secure_boot.h
@@ -10,10 +10,14 @@
 
 #include <linux/types.h>
 
+#ifdef CONFIG_HAVE_ARCH_GET_SECUREBOOT
 /*
  * Returns true if the platform secure boot is enabled.
  * Returns false if disabled or not supported.
  */
 bool arch_get_secureboot(void);
+#else
+static inline bool arch_get_secureboot(void) { return false; }
+#endif
 
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

---
base-commit: 870819434c8dfcc3158033b66e7851b81bb17e21
change-id: 20260309-integrity-drop-weak-arch-get-secureboot-cead298d493f

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


