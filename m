Return-Path: <linuxppc-dev+bounces-15753-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8DCD21E2F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 01:43:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds43w2m76z2xS3;
	Thu, 15 Jan 2026 11:43:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768437836;
	cv=none; b=UYr1cZwIWc24JluaCc8DOMvLwmGeFiPSj++iTPquU3v7OY2CxDMWOWiZSRa+Mc4TzfvlIDzZnjtrOwfCC9J8IlaV1ejRBjTwh7hhU++f7FMQCqcRn0ULZYWZ7pB5tg/PXsac4ISF3s+P1Jhwvha9uoBVx+Zb2Cy4XZiVXF5SbjzGSMDDC1DrBo6MrMBbMMs48cjVeYfndPNVt/JEyULRaTa1Wux/TTB+pGSZmbCWokVFZcl8NdHu5BgL7EcJwZ7Wb59Jvo5k4RVs1qlbnYJpUEJwe2vnsxTJ4owQbtgAyZj8E1ddbauenwii1xYfAnZAyluYCCL9nkMhiiTgUBf4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768437836; c=relaxed/relaxed;
	bh=gZMvfwQ4Hlm3TIovlOL6vMdTiejp6wE8OmDKDcw/1gY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=KLlYkGvoEGEv3ufiEraiDKwPNkHOFcvbSexIJtgWrA9c2fXg8N0SV2L3CsFSckF5mspLB3NSqRSiPEfrYIyOXk0JuvRTgrDvYPY+9M1Sg5aXxg1DnsY4TG/hqAocWlwEKM4W6LjEvVoV1HytaPF6XUhy7udScHeZ1e0xE1XOGOCZTPaLk+eIJLV8/WmeIPeVU4tk5X+yTGsMdCBKIxDMhpeVbIL94jz4zNh2aya7NoXgX2Wva/iEYMIfHTe72i2eef3lAJDVvGFtAW0RVqYWti1hlonqkIRRHW1v30XlYSc0dc4qle/NHXBLm7fhr6rY9asQSPma0Mp4lV8BFTf2aA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ROHcDVGR; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hyNHL5Xy; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ROHcDVGR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hyNHL5Xy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ds43s5w6vz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 11:43:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768437823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZMvfwQ4Hlm3TIovlOL6vMdTiejp6wE8OmDKDcw/1gY=;
	b=ROHcDVGR3TSdgJMnlAKdnNFDsVv85IXeBqcayCLCRWkEnIrFkc50Kk/cYlrJp0dkYNZl2g
	aC5Lw8FVo0aR2K/3uh2u16RkZDc7td6Jxj8jBNCps4yzKCOhlB1qlMlhF6fgqHOefL0ZUL
	Pk0cCE3ig4Nl7GeKFv/pnqN6CQEnel8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768437824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZMvfwQ4Hlm3TIovlOL6vMdTiejp6wE8OmDKDcw/1gY=;
	b=hyNHL5Xynm8JZqf4ocplid8BCtTdhsooDG12kEU3KTW2Pj0c47L9BHiUHuwPceGW+AUU3f
	sk/dN5fyUx6pbryC9qTi1olEh0wHi/QyjwAmLLfv8Vdpw7U6CQVhTa/lAfjXEtRUQThmYa
	AuhAD5W9PNdr9zm0p3UVLl49wE60SZw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-1ySNKYYrPJWoXJyJkG5_eg-1; Wed, 14 Jan 2026 19:43:42 -0500
X-MC-Unique: 1ySNKYYrPJWoXJyJkG5_eg-1
X-Mimecast-MFC-AGG-ID: 1ySNKYYrPJWoXJyJkG5_eg_1768437821
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c21341f56so556165a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 16:43:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768437819; x=1769042619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gZMvfwQ4Hlm3TIovlOL6vMdTiejp6wE8OmDKDcw/1gY=;
        b=D+DF+iJpp8SLfguqxhBjnVAcBW7siZ5ByXsBGCuwN2wJbbr5y4+Tv63tSITgBJNa20
         HkFQBDQfdCWg/jujlJ8YWrc39LCA7haY65+fdlfZYhu+jwl988j6LQGG6/DhXGBN/f6J
         iwSeq0yTw2XPHpa0De3fhvGqb9QTshqCjDnmIxFR+6jiJglWrz8mX1Zd47YhPG1joqu7
         00xQGoqm2DOyNy+fRvPw+kt0hS46o2pVyJSroqB4QR4EyyQzzqcc36imjSy95AwXWXrp
         RbnTvfk5tBtC0J7/PJuOsuJaXjGQvCcA2tvaBAdBzgLCXG/iCh69Wgps2dIg1ECiwqNu
         +NCw==
X-Forwarded-Encrypted: i=1; AJvYcCVi6L50JDSu95gM1S7S9HK7+c4PE6YSmRJJrBaPEswAn84nlTn1Qt5VRWM8UOq23TdepPVkxAPfeJfpF08=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxX2YURL++etc/w2En8yxt90d7JOqISt2v4Ror7vTjK9fz1Ftoe
	6UYYItDQrmJmv1jUHAur5cIkbsdkQjsSZOoiwAVs5sADfizhHSP/env+3GBJAr1IJGqzxJIGbJt
	NXdPwp5AC2ga0GK9/g44GnYP2AgGrV/rQsGiFoSk5S7OQWMiEUsn+E2vP/ebjY5gdhsk=
X-Gm-Gg: AY/fxX4BHff/a/AZBciWEnciCL5fBJZM3JSHx4CD8JK3/XKneAjS5G4O1e+Aeb+pYGR
	i2PknQnXBy7EJBh0ZhxVHzHs0T8c2E4psAw5lsDh+510QkrpqO9sLFlJ9DQPVYeJy9cJBgMSk3R
	NUB1Hx3xIQ3e1SS+udWPWYeuJt4lRVQa8sSLo8QmrOrpnk1JcXZ4vz6w/r1kHKgrBPuhv8xeVjE
	5iTKC/TAdOwHCdBzAmiFCbdr+fzVzAbPMBH2ISEDAEsvJCM15A0WojWIDwLht6WLzJxS5DB+UQR
	DYq27PyssftC/bn2D/Vni4NYlYW/1v0jbkoxHb5OVVI+DUxVY514UBMYoEhoXLinSDLkq9C6ZIf
	N
X-Received: by 2002:a17:90b:4b86:b0:341:8601:d77a with SMTP id 98e67ed59e1d1-35109137fb9mr4491757a91.29.1768437819000;
        Wed, 14 Jan 2026 16:43:39 -0800 (PST)
X-Received: by 2002:a17:90b:4b86:b0:341:8601:d77a with SMTP id 98e67ed59e1d1-35109137fb9mr4491722a91.29.1768437818367;
        Wed, 14 Jan 2026 16:43:38 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677ca9acsm511892a91.1.2026.01.14.16.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 16:43:38 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: linux-integrity@vger.kernel.org
Cc: Heiko Carstens <hca@linux.ibm.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-s390@vger.kernel.org (open list:S390 ARCHITECTURE),
	linux-efi@vger.kernel.org (open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)),
	linux-security-module@vger.kernel.org (open list:SECURITY SUBSYSTEM),
	keyrings@vger.kernel.org (open list:KEYS/KEYRINGS_INTEGRITY)
Subject: [PATCH 1/3] integrity: Make arch_ima_get_secureboot integrity-wide
Date: Thu, 15 Jan 2026 08:43:23 +0800
Message-ID: <20260115004328.194142-2-coxu@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115004328.194142-1-coxu@redhat.com>
References: <20260115004328.194142-1-coxu@redhat.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mxGWJo92F7QCkawJhtm05x_BXWm2P82dOs8FqDySz9M_1768437821
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

EVM and other LSMs need the ability to query the secure boot status of
the system, without directly calling the IMA arch_ima_get_secureboot
function. Refactor the secure boot status check into a general,
integrity-wide function named arch_integrity_get_secureboot.

Define a new Kconfig option CONFIG_INTEGRITY_SECURE_BOOT, which is
automatically configured by the supported architectures. The existing
IMA_SECURE_AND_OR_TRUSTED_BOOT Kconfig loads the architecture specific
IMA policy based on the refactored secure boot status code.

Reported-and-suggested-by: Mimi Zohar <zohar@linux.ibm.com>
Suggested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 arch/arm64/Kconfig                            |  1 +
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/kernel/Makefile                  |  2 +-
 arch/powerpc/kernel/ima_arch.c                |  5 --
 arch/powerpc/kernel/integrity_sb_arch.c       | 13 +++++
 arch/s390/Kconfig                             |  1 +
 arch/s390/kernel/Makefile                     |  1 +
 arch/s390/kernel/ima_arch.c                   |  6 --
 arch/s390/kernel/integrity_sb_arch.c          |  9 +++
 arch/x86/Kconfig                              |  1 +
 arch/x86/include/asm/efi.h                    |  4 +-
 arch/x86/platform/efi/efi.c                   |  2 +-
 include/linux/ima.h                           |  7 +--
 include/linux/integrity.h                     |  8 +++
 security/integrity/Kconfig                    |  6 ++
 security/integrity/Makefile                   |  3 +
 security/integrity/efi_secureboot.c           | 56 +++++++++++++++++++
 security/integrity/ima/ima_appraise.c         |  2 +-
 security/integrity/ima/ima_efi.c              | 47 +---------------
 security/integrity/ima/ima_main.c             |  4 +-
 security/integrity/platform_certs/load_uefi.c |  2 +-
 21 files changed, 111 insertions(+), 70 deletions(-)
 create mode 100644 arch/powerpc/kernel/integrity_sb_arch.c
 create mode 100644 arch/s390/kernel/integrity_sb_arch.c
 create mode 100644 security/integrity/efi_secureboot.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 93173f0a09c7..4c265b7386bb 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2427,6 +2427,7 @@ config EFI
 	select EFI_STUB
 	select EFI_GENERIC_STUB
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT
+	imply INTEGRITY_SECURE_BOOT
 	default y
 	help
 	  This option provides support for runtime services provided
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9537a61ebae0..878f752c35fb 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1058,6 +1058,7 @@ config PPC_SECURE_BOOT
 	depends on PPC_POWERNV || PPC_PSERIES
 	depends on IMA_ARCH_POLICY
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT
+	imply INTEGRITY_SECURE_BOOT
 	select PSERIES_PLPKS if PPC_PSERIES
 	help
 	  Systems with firmware secure boot enabled need to define security
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 2f0a2e69c607..3bb1fb9a1e0e 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -168,7 +168,7 @@ ifneq ($(CONFIG_PPC_POWERNV)$(CONFIG_PPC_SVM),)
 obj-y				+= ucall.o
 endif
 
-obj-$(CONFIG_PPC_SECURE_BOOT)	+= secure_boot.o ima_arch.o secvar-ops.o
+obj-$(CONFIG_PPC_SECURE_BOOT)	+= secure_boot.o ima_arch.o integrity_sb_arch.o secvar-ops.o
 obj-$(CONFIG_PPC_SECVAR_SYSFS)	+= secvar-sysfs.o
 
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
index b7029beed847..0d8892a03526 100644
--- a/arch/powerpc/kernel/ima_arch.c
+++ b/arch/powerpc/kernel/ima_arch.c
@@ -7,11 +7,6 @@
 #include <linux/ima.h>
 #include <asm/secure_boot.h>
 
-bool arch_ima_get_secureboot(void)
-{
-	return is_ppc_secureboot_enabled();
-}
-
 /*
  * The "secure_rules" are enabled only on "secureboot" enabled systems.
  * These rules verify the file signatures against known good values.
diff --git a/arch/powerpc/kernel/integrity_sb_arch.c b/arch/powerpc/kernel/integrity_sb_arch.c
new file mode 100644
index 000000000000..29f9494391a3
--- /dev/null
+++ b/arch/powerpc/kernel/integrity_sb_arch.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 IBM Corporation
+ * Author: Nayna Jain
+ */
+
+#include <linux/integrity.h>
+#include <asm/secure_boot.h>
+
+bool arch_integrity_get_secureboot(void)
+{
+	return is_ppc_secureboot_enabled();
+}
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 0e5fad5f06ca..db0383b19493 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -78,6 +78,7 @@ config S390
 	# Note: keep this list sorted alphabetically
 	#
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT
+	imply INTEGRITY_SECURE_BOOT
 	select ALTERNATE_USER_ADDRESS_SPACE
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
diff --git a/arch/s390/kernel/Makefile b/arch/s390/kernel/Makefile
index 42c83d60d6fa..ee976a27e677 100644
--- a/arch/s390/kernel/Makefile
+++ b/arch/s390/kernel/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_KEXEC_FILE)	+= machine_kexec_file.o kexec_image.o
 obj-$(CONFIG_KEXEC_FILE)	+= kexec_elf.o
 obj-$(CONFIG_CERT_STORE)	+= cert_store.o
 obj-$(CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT)	+= ima_arch.o
+obj-$(CONFIG_INTEGRITY_SECURE_BOOT)	+= integrity_sb_arch.o
 
 obj-$(CONFIG_PERF_EVENTS)	+= perf_event.o
 obj-$(CONFIG_PERF_EVENTS)	+= perf_cpum_cf.o perf_cpum_sf.o
diff --git a/arch/s390/kernel/ima_arch.c b/arch/s390/kernel/ima_arch.c
index f3c3e6e1c5d3..6ccbe34ce408 100644
--- a/arch/s390/kernel/ima_arch.c
+++ b/arch/s390/kernel/ima_arch.c
@@ -1,12 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/ima.h>
-#include <asm/boot_data.h>
-
-bool arch_ima_get_secureboot(void)
-{
-	return ipl_secure_flag;
-}
 
 const char * const *arch_get_ima_policy(void)
 {
diff --git a/arch/s390/kernel/integrity_sb_arch.c b/arch/s390/kernel/integrity_sb_arch.c
new file mode 100644
index 000000000000..208a28cb9961
--- /dev/null
+++ b/arch/s390/kernel/integrity_sb_arch.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/integrity.h>
+#include <asm/boot_data.h>
+
+bool arch_integrity_get_secureboot(void)
+{
+	return ipl_secure_flag;
+}
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 80527299f859..5051cc80309a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -330,6 +330,7 @@ config X86
 	select FUNCTION_ALIGNMENT_16B		if X86_64 || X86_ALIGNMENT_16
 	select FUNCTION_ALIGNMENT_4B
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
+	imply INTEGRITY_SECURE_BOOT             if EFI
 	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
 	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
 	select ARCH_SUPPORTS_SCHED_SMT		if SMP
diff --git a/arch/x86/include/asm/efi.h b/arch/x86/include/asm/efi.h
index f227a70ac91f..d409f11da331 100644
--- a/arch/x86/include/asm/efi.h
+++ b/arch/x86/include/asm/efi.h
@@ -401,9 +401,9 @@ extern int __init efi_memmap_split_count(efi_memory_desc_t *md,
 extern void __init efi_memmap_insert(struct efi_memory_map *old_memmap,
 				     void *buf, struct efi_mem_range *mem);
 
-extern enum efi_secureboot_mode __x86_ima_efi_boot_mode(void);
+enum efi_secureboot_mode __x86_integrity_efi_boot_mode(void);
 
-#define arch_ima_efi_boot_mode	__x86_ima_efi_boot_mode()
+#define arch_integrity_efi_boot_mode __x86_integrity_efi_boot_mode()
 
 #ifdef CONFIG_EFI_RUNTIME_MAP
 int efi_get_runtime_map_size(void);
diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
index 463b784499a8..94704858f17a 100644
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@ -921,7 +921,7 @@ umode_t efi_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
 	return attr->mode;
 }
 
-enum efi_secureboot_mode __x86_ima_efi_boot_mode(void)
+enum efi_secureboot_mode __x86_integrity_efi_boot_mode(void)
 {
 	return boot_params.secure_boot;
 }
diff --git a/include/linux/ima.h b/include/linux/ima.h
index 8e29cb4e6a01..fc0ce1e27a2f 100644
--- a/include/linux/ima.h
+++ b/include/linux/ima.h
@@ -11,6 +11,7 @@
 #include <linux/fs.h>
 #include <linux/security.h>
 #include <linux/kexec.h>
+#include <linux/integrity.h>
 #include <crypto/hash_info.h>
 struct linux_binprm;
 
@@ -72,14 +73,8 @@ int __init ima_get_kexec_buffer(void **addr, size_t *size);
 #endif
 
 #ifdef CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT
-extern bool arch_ima_get_secureboot(void);
 extern const char * const *arch_get_ima_policy(void);
 #else
-static inline bool arch_ima_get_secureboot(void)
-{
-	return false;
-}
-
 static inline const char * const *arch_get_ima_policy(void)
 {
 	return NULL;
diff --git a/include/linux/integrity.h b/include/linux/integrity.h
index f5842372359b..39e8961b58dd 100644
--- a/include/linux/integrity.h
+++ b/include/linux/integrity.h
@@ -61,5 +61,13 @@ integrity_inode_attrs_changed(const struct integrity_inode_attributes *attrs,
 		!inode_eq_iversion(inode, attrs->version));
 }
 
+#ifdef CONFIG_INTEGRITY_SECURE_BOOT
+bool arch_integrity_get_secureboot(void);
+#else
+static inline bool arch_integrity_get_secureboot(void)
+{
+	return false;
+}
+#endif
 
 #endif /* _LINUX_INTEGRITY_H */
diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
index 916d4f2bfc44..1c3e54df3b73 100644
--- a/security/integrity/Kconfig
+++ b/security/integrity/Kconfig
@@ -97,6 +97,12 @@ config INTEGRITY_CA_MACHINE_KEYRING_MAX
 	  will not be loaded. The remaining MOK keys are loaded into the
 	  .platform keyring.
 
+config INTEGRITY_SECURE_BOOT
+       bool
+       help
+          This option is selected by architectures to provide secure boot
+          related helper functions.
+
 config LOAD_UEFI_KEYS
 	depends on INTEGRITY_PLATFORM_KEYRING
 	depends on EFI
diff --git a/security/integrity/Makefile b/security/integrity/Makefile
index 92b63039c654..08622460e6fd 100644
--- a/security/integrity/Makefile
+++ b/security/integrity/Makefile
@@ -18,6 +18,9 @@ integrity-$(CONFIG_LOAD_IPL_KEYS) += platform_certs/load_ipl_s390.o
 integrity-$(CONFIG_LOAD_PPC_KEYS) += platform_certs/efi_parser.o \
                                      platform_certs/load_powerpc.o \
                                      platform_certs/keyring_handler.o
+ifeq ($(CONFIG_EFI),y)
+integrity-$(CONFIG_INTEGRITY_SECURE_BOOT) += efi_secureboot.o
+endif
 # The relative order of the 'ima' and 'evm' LSMs depends on the order below.
 obj-$(CONFIG_IMA)			+= ima/
 obj-$(CONFIG_EVM)			+= evm/
diff --git a/security/integrity/efi_secureboot.c b/security/integrity/efi_secureboot.c
new file mode 100644
index 000000000000..93d5086217d2
--- /dev/null
+++ b/security/integrity/efi_secureboot.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-1.0+
+/*
+ * Copyright (C) 2018 IBM Corporation
+ */
+#include <linux/efi.h>
+#include <linux/integrity.h>
+#include <asm/efi.h>
+
+#ifndef arch_integrity_efi_boot_mode
+#define arch_integrity_efi_boot_mode efi_secureboot_mode_unset
+#endif
+
+static enum efi_secureboot_mode get_sb_mode(void)
+{
+	enum efi_secureboot_mode mode;
+
+	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE)) {
+		pr_info("integrity: secureboot mode unknown, no efi\n");
+		return efi_secureboot_mode_unknown;
+	}
+
+	mode = efi_get_secureboot_mode(efi.get_variable);
+	if (mode == efi_secureboot_mode_disabled)
+		pr_info("integrity: secureboot mode disabled\n");
+	else if (mode == efi_secureboot_mode_unknown)
+		pr_info("integrity: secureboot mode unknown\n");
+	else
+		pr_info("integrity: secureboot mode enabled\n");
+	return mode;
+}
+
+/*
+ * Query secure boot status
+ *
+ * Note don't call this function too early e.g. in __setup hook otherwise the
+ * kernel may hang when calling efi_get_secureboot_mode.
+ *
+ */
+bool arch_integrity_get_secureboot(void)
+{
+	static enum efi_secureboot_mode sb_mode;
+	static bool initialized;
+
+	if (!initialized && efi_enabled(EFI_BOOT)) {
+		sb_mode = arch_integrity_efi_boot_mode;
+
+		if (sb_mode == efi_secureboot_mode_unset)
+			sb_mode = get_sb_mode();
+		initialized = true;
+	}
+
+	if (sb_mode == efi_secureboot_mode_enabled)
+		return true;
+	else
+		return false;
+}
diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index 5149ff4fd50d..f45106cad443 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -27,7 +27,7 @@ core_param(ima_appraise, ima_appraise_cmdline_default, charp, 0);
 void __init ima_appraise_parse_cmdline(void)
 {
 	const char *str = ima_appraise_cmdline_default;
-	bool sb_state = arch_ima_get_secureboot();
+	bool sb_state = arch_integrity_get_secureboot();
 	int appraisal_state = ima_appraise;
 
 	if (!str)
diff --git a/security/integrity/ima/ima_efi.c b/security/integrity/ima/ima_efi.c
index 138029bfcce1..d6545ae446c7 100644
--- a/security/integrity/ima/ima_efi.c
+++ b/security/integrity/ima/ima_efi.c
@@ -2,52 +2,8 @@
 /*
  * Copyright (C) 2018 IBM Corporation
  */
-#include <linux/efi.h>
 #include <linux/module.h>
 #include <linux/ima.h>
-#include <asm/efi.h>
-
-#ifndef arch_ima_efi_boot_mode
-#define arch_ima_efi_boot_mode efi_secureboot_mode_unset
-#endif
-
-static enum efi_secureboot_mode get_sb_mode(void)
-{
-	enum efi_secureboot_mode mode;
-
-	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE)) {
-		pr_info("ima: secureboot mode unknown, no efi\n");
-		return efi_secureboot_mode_unknown;
-	}
-
-	mode = efi_get_secureboot_mode(efi.get_variable);
-	if (mode == efi_secureboot_mode_disabled)
-		pr_info("ima: secureboot mode disabled\n");
-	else if (mode == efi_secureboot_mode_unknown)
-		pr_info("ima: secureboot mode unknown\n");
-	else
-		pr_info("ima: secureboot mode enabled\n");
-	return mode;
-}
-
-bool arch_ima_get_secureboot(void)
-{
-	static enum efi_secureboot_mode sb_mode;
-	static bool initialized;
-
-	if (!initialized && efi_enabled(EFI_BOOT)) {
-		sb_mode = arch_ima_efi_boot_mode;
-
-		if (sb_mode == efi_secureboot_mode_unset)
-			sb_mode = get_sb_mode();
-		initialized = true;
-	}
-
-	if (sb_mode == efi_secureboot_mode_enabled)
-		return true;
-	else
-		return false;
-}
 
 /* secureboot arch rules */
 static const char * const sb_arch_rules[] = {
@@ -67,7 +23,8 @@ static const char * const sb_arch_rules[] = {
 
 const char * const *arch_get_ima_policy(void)
 {
-	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_ima_get_secureboot()) {
+	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) &&
+	    arch_integrity_get_secureboot()) {
 		if (IS_ENABLED(CONFIG_MODULE_SIG))
 			set_module_sig_enforced();
 		if (IS_ENABLED(CONFIG_KEXEC_SIG))
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 5770cf691912..3f267557dfbe 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -949,8 +949,8 @@ static int ima_load_data(enum kernel_load_data_id id, bool contents)
 
 	switch (id) {
 	case LOADING_KEXEC_IMAGE:
-		if (IS_ENABLED(CONFIG_KEXEC_SIG)
-		    && arch_ima_get_secureboot()) {
+		if (IS_ENABLED(CONFIG_KEXEC_SIG) &&
+		    arch_integrity_get_secureboot()) {
 			pr_err("impossible to appraise a kernel image without a file descriptor; try using kexec_file_load syscall.\n");
 			return -EACCES;
 		}
diff --git a/security/integrity/platform_certs/load_uefi.c b/security/integrity/platform_certs/load_uefi.c
index d1fdd113450a..3042a0c536d6 100644
--- a/security/integrity/platform_certs/load_uefi.c
+++ b/security/integrity/platform_certs/load_uefi.c
@@ -212,7 +212,7 @@ static int __init load_uefi_certs(void)
 	}
 
 	/* the MOK/MOKx can not be trusted when secure boot is disabled */
-	if (!arch_ima_get_secureboot())
+	if (!arch_integrity_get_secureboot())
 		return 0;
 
 	mokx = get_cert_list(L"MokListXRT", &mok_var, &mokxsize, &status);
-- 
2.52.0


