Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5943FDFA5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 18:19:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H08Qf0g70z304t
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 02:19:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fSfVrc4c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fSfVrc4c; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H08PF3Ddhz2xh1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 02:18:25 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id v123so189008pfb.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Sep 2021 09:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oxgPHOcTvXn7ID9uIvueQgBl1RxjQyez3dSB0V/E5EQ=;
 b=fSfVrc4c2REacFAkl2uA4qMp5cPQdCSR3X4ZNIF/T6jozW7ic7H/9gGu8uCxaMRRCZ
 cfGfpkUAF83V6Owqc70BRYs2A2zfX7dqKYdIjESTUJxnpZ2zQl3PyDMxlN3Y7hUNoeVw
 1WYXCd5QMLDwPvySHpLYlrJ7ylx134Bo8GSlW7thmV3tJ+6m4bMBgGpCea/p29lg0SqD
 UzKKAg0vuMv29YUYTS55BW1j613mIrylm+eLPNB4u9D9qEevEXpb1p9Vfj+XhRW62K+b
 SBdKpnAqWEKHRVLhxn338/vdccXefmAdiZW9sQ1z+6Mp01XWV+WQTCEyMmPaGLHgkOto
 VgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oxgPHOcTvXn7ID9uIvueQgBl1RxjQyez3dSB0V/E5EQ=;
 b=BriHufGDWI+39iraYLatsvvENj45KD6e1IEiSdfvFdWOJC4TXrs+XGuhbbPb994CAi
 LgvExrqxqZUpWn85NJ1c4HvKqPaHcqq9+Qhl242p4BXS0f/1jRdYHrTig+AJoYWvyzos
 YfwkXk0+DgIeG5D9QwAijaVPiG7U3EGcSAJtHPmfiOLUHevvyEsvUXCnNKReXnSpu7r2
 cG+N/lVVkBvqRlPbMD3AzQc6k0msxkh/quB4WDYLVm6NSweEQrci1NzI+nsV3FfBrWTZ
 3ArjPjNMZ/ER21T7pgHJgXCKdbeQof03MjXWYpmCc9wZLCdy0hf48q/F5EDfGV+gTTva
 AM6g==
X-Gm-Message-State: AOAM532v2Oqn8LmYdkCPGDBiP0rnkMaoC43yi7+VY6UomLAHiQEnlv9o
 CMo1wdfKQUNkoSu1HKP6DOa/9Tjlm8Y=
X-Google-Smtp-Source: ABdhPJxyn1olEcb6RLNwdXYqF/+7ym9PxKOVXF2LzWEOkn4NqQ9Ac/G3Ismmkta/K2c4lpUcFqajVQ==
X-Received: by 2002:a63:230f:: with SMTP id j15mr234338pgj.9.1630513102417;
 Wed, 01 Sep 2021 09:18:22 -0700 (PDT)
Received: from bobo.ibm.com (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id d7sm155261pgu.78.2021.09.01.09.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 09:18:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 2/2] selftests/powerpc: Add scv versions of the basic TM
 syscall tests
Date: Thu,  2 Sep 2021 02:18:10 +1000
Message-Id: <20210901161810.1411015-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210901161810.1411015-1-npiggin@gmail.com>
References: <20210901161810.1411015-1-npiggin@gmail.com>
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
Cc: Eirik Fuller <efuller@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The basic TM vs syscall test code hard codes an sc instruction for the
system call, which fails to cover scv even when the userspace libc has
support for it.

Duplicate the tests with hard coded scv variants so both are tested
when possible.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .../selftests/powerpc/tm/tm-syscall-asm.S     | 46 +++++++++++++++++++
 .../testing/selftests/powerpc/tm/tm-syscall.c | 36 ++++++++++++---
 2 files changed, 75 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S b/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
index bd1ca25febe4..849316831e6a 100644
--- a/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
+++ b/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
@@ -2,6 +2,10 @@
 #include <ppc-asm.h>
 #include <asm/unistd.h>
 
+/* ppc-asm.h does not define r0 or r1 */
+#define r0 0
+#define r1 1
+
 	.text
 FUNC_START(getppid_tm_active)
 	tbegin.
@@ -26,3 +30,45 @@ FUNC_START(getppid_tm_suspended)
 1:
 	li	r3, -1
 	blr
+
+FUNC_START(getppid_scv_tm_active)
+	mflr	r0
+	std	r0,16(r1)
+	stdu	r1,-32(r1)
+	tbegin.
+	beq 1f
+	li	r0, __NR_getppid
+	scv	0
+	tend.
+	addi	r1,r1,32
+	ld	r0,16(r1)
+	mtlr	r0
+	blr
+1:
+	li	r3, -1
+	addi	r1,r1,32
+	ld	r0,16(r1)
+	mtlr	r0
+	blr
+
+FUNC_START(getppid_scv_tm_suspended)
+	mflr	r0
+	std	r0,16(r1)
+	stdu	r1,-32(r1)
+	tbegin.
+	beq 1f
+	li	r0, __NR_getppid
+	tsuspend.
+	scv	0
+	tresume.
+	tend.
+	addi	r1,r1,32
+	ld	r0,16(r1)
+	mtlr	r0
+	blr
+1:
+	li	r3, -1
+	addi	r1,r1,32
+	ld	r0,16(r1)
+	mtlr	r0
+	blr
diff --git a/tools/testing/selftests/powerpc/tm/tm-syscall.c b/tools/testing/selftests/powerpc/tm/tm-syscall.c
index becb8207b432..9a822208680e 100644
--- a/tools/testing/selftests/powerpc/tm/tm-syscall.c
+++ b/tools/testing/selftests/powerpc/tm/tm-syscall.c
@@ -19,24 +19,37 @@
 #include "utils.h"
 #include "tm.h"
 
+#ifndef PPC_FEATURE2_SCV
+#define PPC_FEATURE2_SCV               0x00100000 /* scv syscall */
+#endif
+
 extern int getppid_tm_active(void);
 extern int getppid_tm_suspended(void);
+extern int getppid_scv_tm_active(void);
+extern int getppid_scv_tm_suspended(void);
 
 unsigned retries = 0;
 
 #define TEST_DURATION 10 /* seconds */
 #define TM_RETRIES 100
 
-pid_t getppid_tm(bool suspend)
+pid_t getppid_tm(bool scv, bool suspend)
 {
 	int i;
 	pid_t pid;
 
 	for (i = 0; i < TM_RETRIES; i++) {
-		if (suspend)
-			pid = getppid_tm_suspended();
-		else
-			pid = getppid_tm_active();
+		if (suspend) {
+			if (scv)
+				pid = getppid_scv_tm_suspended();
+			else
+				pid = getppid_tm_suspended();
+		} else {
+			if (scv)
+				pid = getppid_scv_tm_active();
+			else
+				pid = getppid_tm_active();
+		}
 
 		if (pid >= 0)
 			return pid;
@@ -82,15 +95,24 @@ int tm_syscall(void)
 		 * Test a syscall within a suspended transaction and verify
 		 * that it succeeds.
 		 */
-		FAIL_IF(getppid_tm(true) == -1); /* Should succeed. */
+		FAIL_IF(getppid_tm(false, true) == -1); /* Should succeed. */
 
 		/*
 		 * Test a syscall within an active transaction and verify that
 		 * it fails with the correct failure code.
 		 */
-		FAIL_IF(getppid_tm(false) != -1);  /* Should fail... */
+		FAIL_IF(getppid_tm(false, false) != -1);  /* Should fail... */
 		FAIL_IF(!failure_is_persistent()); /* ...persistently... */
 		FAIL_IF(!failure_is_syscall());    /* ...with code syscall. */
+
+		/* Now do it all again with scv if it is available. */
+		if (have_hwcap2(PPC_FEATURE2_SCV)) {
+			FAIL_IF(getppid_tm(true, true) == -1); /* Should succeed. */
+			FAIL_IF(getppid_tm(true, false) != -1);  /* Should fail... */
+			FAIL_IF(!failure_is_persistent()); /* ...persistently... */
+			FAIL_IF(!failure_is_syscall());    /* ...with code syscall. */
+		}
+
 		gettimeofday(&now, 0);
 	}
 
-- 
2.23.0

