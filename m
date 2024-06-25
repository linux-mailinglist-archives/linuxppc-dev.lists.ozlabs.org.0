Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2F991692F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 15:41:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R2U6Qcqw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7mFp2bCnz3fwl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 23:41:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R2U6Qcqw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7mF65Kwmz3fpQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 23:40:56 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f480624d0dso46607425ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 06:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719322855; x=1719927655; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NzZWI/ny9IvttLiNIxBGjf7ya3tIZCby6YI7nuT0ogM=;
        b=R2U6QcqwiI0a+9iC5twHVXpP6AfVogotw35AK/t1904ZSIuNoMSLj+touzekJKPfgz
         WSDC85tVswyj3qvbL+aRlsqb9trbnA9kTw2Z3+FkyYULEjvHfb+05u5I5FPGHM15lDyU
         aTujTet51DyJ/F25ad89fKuEVFs6vFGAfsVS4AEZdOri4FcOxKCwgXk+ADThuhi1Hi+H
         PhSIQ8+HDLPJFY6xtAFQDacSfoHy2ZeJZUvL4AgBG8oOVoBt1GIGHN6HcsJ6ijZ3bK5w
         i0rxLN/XComuDK6TVWTpMLWKxgBvVVRa+JgxyLZZU+m3UaKO1qedxpcrIdUVHtdGgfD2
         P/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719322855; x=1719927655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzZWI/ny9IvttLiNIxBGjf7ya3tIZCby6YI7nuT0ogM=;
        b=LGuMqx7RYUEVPnHaSlty2U/n4+wSmenRna0TRESF68lUHpgBQxgiZcrN/bkeGBVX0/
         UDGtrvKd0IAzQ+tItowL3ekXmWTJ0j116MsQuYvf9a81ljEptErA/Lov4jtA6zWeaGsq
         6/75p8JuFgvFmeTxi9Etq4soyntxMKbkjffMbYDBwrg2SD0PvtV1ehgTziHf0ban8DYc
         Fm0vpWsZWwm/yn2+aVLZIhGzhyHnDfpQ/NRZjPQFfex1K2O5HCugAA/Gyov6TOhIn++b
         zt/tzqb+flxpfPh94NaQwXqrLpiZFgPDQROtuo40hnqQjqH2SdTs1Pzkx/j4j1fCe/Yy
         ibRw==
X-Gm-Message-State: AOJu0YzVc4UrdYJJw2K074bvICbJ3GIBbN0J8vr3feCTSBGb+xuSgncb
	W2xj03znvGZPS9TVu1wbrqMXEyXEBTDFRGSYXLNFajpAiK19tZAuf1uMjw==
X-Google-Smtp-Source: AGHT+IGy6D92Zsw/NmrA9WWv+0IXRfgWAV79k50kcl8MtZxnQX0G1+jNrFqApPFK347/11rw/ql/Wg==
X-Received: by 2002:a17:902:e80c:b0:1fa:199d:6d66 with SMTP id d9443c01a7336-1fa23f1f71dmr109890705ad.59.1719322854918;
        Tue, 25 Jun 2024 06:40:54 -0700 (PDT)
Received: from wheely.local0.net (118-211-5-80.tpgi.com.au. [118.211.5.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb2f2a40sm81710525ad.45.2024.06.25.06.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 06:40:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: Fix scv instruction crash with kexec
Date: Tue, 25 Jun 2024 23:40:47 +1000
Message-ID: <20240625134047.298759-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.45.1
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
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kexec on pseries disables AIL (reloc_on_exc), required for scv
instruction support, before other CPUs have been shut down. This means
they can execute scv instructions after AIL is disabled, which causes an
interrupt at an unexpected entry location that crashes the kernel.

Change the kexec sequence to disable AIL after other CPUs have been
brought down.

As a refresher, the real-mode scv interrupt vector is 0x17000, and the
fixed-location head code probably couldn't easily deal with implementing
such high addresses so it was just decided not to support that interrupt
at all.

Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Fixes: 7fa95f9adaee7 ("powerpc/64s: system call support for scv/rfscv instructions")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kexec/core_64.c             | 11 +++++++++++
 arch/powerpc/platforms/pseries/kexec.c   |  8 --------
 arch/powerpc/platforms/pseries/pseries.h |  1 -
 arch/powerpc/platforms/pseries/setup.c   |  1 -
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 85050be08a23..72b12bc10f90 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -27,6 +27,7 @@
 #include <asm/paca.h>
 #include <asm/mmu.h>
 #include <asm/sections.h>	/* _end */
+#include <asm/setup.h>
 #include <asm/smp.h>
 #include <asm/hw_breakpoint.h>
 #include <asm/svm.h>
@@ -317,6 +318,16 @@ void default_machine_kexec(struct kimage *image)
 	if (!kdump_in_progress())
 		kexec_prepare_cpus();
 
+#ifdef CONFIG_PPC_PSERIES
+	/*
+	 * This must be done after other CPUs have shut down, otherwise they
+	 * could execute the 'scv' instruction, which is not supported with
+	 * reloc disabled (see configure_exceptions()).
+	 */
+	if (firmware_has_feature(FW_FEATURE_SET_MODE))
+		pseries_disable_reloc_on_exc();
+#endif
+
 	printk("kexec: Starting switchover sequence.\n");
 
 	/* switch to a staticly allocated stack.  Based on irq stack code.
diff --git a/arch/powerpc/platforms/pseries/kexec.c b/arch/powerpc/platforms/pseries/kexec.c
index 096d09ed89f6..431be156ca9b 100644
--- a/arch/powerpc/platforms/pseries/kexec.c
+++ b/arch/powerpc/platforms/pseries/kexec.c
@@ -61,11 +61,3 @@ void pseries_kexec_cpu_down(int crash_shutdown, int secondary)
 	} else
 		xics_kexec_teardown_cpu(secondary);
 }
-
-void pseries_machine_kexec(struct kimage *image)
-{
-	if (firmware_has_feature(FW_FEATURE_SET_MODE))
-		pseries_disable_reloc_on_exc();
-
-	default_machine_kexec(image);
-}
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index bba4ad192b0f..3968a6970fa8 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -38,7 +38,6 @@ static inline void smp_init_pseries(void) { }
 #endif
 
 extern void pseries_kexec_cpu_down(int crash_shutdown, int secondary);
-void pseries_machine_kexec(struct kimage *image);
 
 extern void pSeries_final_fixup(void);
 
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 284a6fa04b0c..b44de0f0822f 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -1159,7 +1159,6 @@ define_machine(pseries) {
 	.machine_check_exception = pSeries_machine_check_exception,
 	.machine_check_log_err	= pSeries_machine_check_log_err,
 #ifdef CONFIG_KEXEC_CORE
-	.machine_kexec          = pseries_machine_kexec,
 	.kexec_cpu_down         = pseries_kexec_cpu_down,
 #endif
 #ifdef CONFIG_MEMORY_HOTPLUG
-- 
2.45.1

