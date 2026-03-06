Return-Path: <linuxppc-dev+bounces-17855-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJewAMRbq2nTcQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17855-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 23:57:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E039B2286FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 23:57:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSMH15B0Nz3c9y;
	Sat, 07 Mar 2026 09:57:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772837821;
	cv=none; b=JKWu4NL0dc3/6994k5NTSHFVk7KrgRm7zmPAzy+TMZVU7juiQ3isfrBbPOhX1SxNIe3k4mhim0sP5L4LlWW0PT/szyZCev++bYp5lE0mUdjDLdGgAaOaq1iV4Bhl5eCAXXvUHq6bmb0kCPwCxKXknYZ3+HU4+9vlhVHlTPD5pFvVMQMULLcjJkeHz3LGzEWNZ6Adpz6RwbyZgiDNjx1trPx4ROt/uFAA5ivlT0OrLiOR63g91FDTlOhJF8BxSYVBu+x8S455oeH+HiuXfPOQ2q6DehC6krsR5kkY7aGfiKzdLuCI+a51mksw6UNjKpL/WeupPCsDXih0PASIGIF71w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772837821; c=relaxed/relaxed;
	bh=7JGQKUk+JRnBcfYnQ09CQ84qhAM4DdC8nGdFjT3s3J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFXj+CV+kkBqucABq7g6mMl4kN+gjS3t+J1ylmoSP87q6yhD0ClNxngZvLoaV/sUm/M60ow1qUx42PiveEUfySUcDbz37gHJhlPLmryJpHVLaYoU7E7Jt06E4xHQHdBf1kHNhal9spbJdgFxm0+wBmNGI5fOtVz4IBuLGJ6ygQkeVhGLUm2Gn9Lewc1cK+1vwyJeGzPZcEsSrPyAB70kbA8uL03trP7+W30UZRCAUD3tUOdA1SROqFFQI6eGucDB0LQ0JzZsuntpLK3s/tWgWRxy7rCNdugQ4B0ST4/OlozthrIqGwV2HTmtGyjRB5Mr1JyPAp8W6AdaLx7fak3fEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ctqwQye5; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ctqwQye5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSMH064LTz3bcf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 09:57:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 193B660018;
	Fri,  6 Mar 2026 22:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B463DC4CEF7;
	Fri,  6 Mar 2026 22:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772837816;
	bh=Z22ghlULx44oqzYfZ0VFpWlMBSswAPSxWRRAMOClw4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ctqwQye5tirMLMlcZHWP/msUzGRRcYMTOoMXTj300K9pQMQIBT+yINiB7xXl179o3
	 /iMofptHLhehAjXDzL6/d18ATABHM17bI+2aLpZslxIUR50vxUDcNmLkGwcU/s9Rzf
	 VgDfE6LI3aRz93CaakBU8wyz0/gY3mOFpY5Xcu1cVd2Hnot7lXwzo/0YyGkZebWJFf
	 zo3KLreu2aKEhid9DfKNkZ7DdiZU9MXVDkYaK3H57jYXnUGYqu+EwyM8te85nRWV1H
	 a05oZxPyxETLpeu7hw5P+FpmjTxRuNt4wG/dmp/v1hE1XDXSXyT89NRC2z3ZTOc7Rb
	 wYLvB7Ti8IdMg==
Date: Fri, 6 Mar 2026 15:56:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Coiby Xu <coxu@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] integrity: avoid using __weak functions
Message-ID: <20260306225648.GC2746259@ax162>
References: <20260306150421.270124-1-arnd@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306150421.270124-1-arnd@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: E039B2286FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17855-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:arnd@arndb.de,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:jarkko@kernel.org,m:ardb@kernel.org,m:coxu@redhat.com,m:npiggin@gmail.com,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:eric.snowberg@oracle.com,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:ajd@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-integrity@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:keyrings@vger.kernel.org,m:llvm@lists.linux.dev,m:dmitrykasatkin@gmail.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_SENDER(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,arndb.de,huawei.com,gmail.com,paul-moore.com,namei.org,hallyn.com,kernel.org,redhat.com,oracle.com,google.com,lists.ozlabs.org,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 04:03:24PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The security/integrity/secure_boot.c file containing only a __weak function
> leads to a build failure with clang:
> 
> Cannot find symbol for section 2: .text.
> security/integrity/secure_boot.o: failed
> 
> Moving the function into another file that has at least one non-__weak
> symbol would solve this, but this is always fragile.
> 
> Avoid __weak definitions entirely and instead move the stub helper into
> an asm-generic header that gets used by default on architectures that
> do not provide their own version. This is consistent with how a lot
> of other architecture specific functionality works, and is more reliable.
> 
> Fixes: a0f87ede3bf4 ("integrity: Make arch_ima_get_secureboot integrity-wide")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This is a larger change than I had hoped for.
> 
> If you prefer a different way to address the build failure, please
> treat this as a Reported-by when you apply your own fix
> ---
>  arch/powerpc/include/asm/secure_boot.h        |  6 +++
>  arch/powerpc/kernel/secure_boot.c             |  1 -
>  arch/s390/include/asm/secure_boot.h           |  9 +++++
>  include/asm-generic/Kbuild                    |  1 +
>  include/asm-generic/secure_boot.h             | 37 +++++++++++++++++++
>  include/linux/secure_boot.h                   |  8 +---
>  security/integrity/Makefile                   |  2 +-
>  .../integrity/platform_certs/load_powerpc.c   |  2 +-
>  security/integrity/secure_boot.c              | 16 --------
>  9 files changed, 56 insertions(+), 26 deletions(-)
>  create mode 100644 arch/s390/include/asm/secure_boot.h
>  create mode 100644 include/asm-generic/secure_boot.h
>  delete mode 100644 security/integrity/secure_boot.c

Thanks, I noticed this as well. The version I came up with and have been
locally testing is the following, which is a little bit more compact.

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
index c28776660246..e76d6cf0c403 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1062,6 +1062,7 @@ config PPC_SECURE_BOOT
 	depends on IMA_ARCH_POLICY
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT
 	select PSERIES_PLPKS if PPC_PSERIES
+	select HAVE_ARCH_GET_SECUREBOOT
 	help
 	  Systems with firmware secure boot enabled need to define security
 	  policies to extend secure boot to the OS. This config allows a user
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 24695ea29d5b..76f191dd208b 100644
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

