Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F32363FE07B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 18:55:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H09DH5zy8z304w
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 02:55:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZnfkKAQh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZnfkKAQh; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H09Bw054cz2xsd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 02:54:31 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id fz10so39576pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Sep 2021 09:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oxgPHOcTvXn7ID9uIvueQgBl1RxjQyez3dSB0V/E5EQ=;
 b=ZnfkKAQhvyhlG2ndtunjseb0aGWNFG848OwhzoPIdj/IaifK3y77JlJ6iP6sQ3K3j3
 1XyEQx+kM+RbLMpVGWlcmgWwAX9DPbiZLG9H6+dEeq/DoD0JeCF7Fy3X9THQBT8W/P6n
 /Z7fuvr5TFgN7POxnouftm2xk33MfW6tgiJrenh3cOe5EnnzaclsoIJAFxynr38xkI7F
 nSWUWgAQCIJurwjI85JtBLXOAg+k0yh9pBzWE2ZuWGM65tqrX1sxp5UgTJv3RgwOFEJh
 J5yuBgSAK3FFdjmCikP4/tSNLtWjCnJSJduqHYsjw868VZ5bwNO9108PjNgU8VfPDeII
 dcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oxgPHOcTvXn7ID9uIvueQgBl1RxjQyez3dSB0V/E5EQ=;
 b=hfzRHaBfgSSWZtLFos32GZ/InRSoegz7umA1MGz6lvIaujCyx0jOA3qOSPGqSu2MCk
 uvn+DJ+4rqCe8UHW+SaYQuDyAtxLZ9oNH16xHdykLJl9XOLLplbkc5CAoXYqsW0ww5Fd
 V6KBSWlHLl3LFx3onP7p1ZP3Hq4bPWmOFl+9BgQrHFDI7VmRCADh7fAlhyEtdIPNx9KH
 MGmlxQkpnK6wfavrSLPR6uBA/z42audoVQ0fMF1xWLcenug32lYwuvs9xePggBNFnrqU
 d2fvrHhcifMSLjt8663GqWkq0bOpZyLGFceOoavCb8Lwq6SF7hhZif8ABUlAoqgMWeCZ
 UPYg==
X-Gm-Message-State: AOAM533i9yddvBStCvguTeXgR9Z+0CPMhBzpG8fS6E4RvIBOnmPfHS+4
 jWlBAhIS1SYPuiRqnCA4XcGnZbCa4cw=
X-Google-Smtp-Source: ABdhPJx9gj0igu+rJ/LwdEkeqqSV89RtCdujf1lmTiULVOQYaCLEsakWmNJCrUg8NcNAE9W0Sjigdw==
X-Received: by 2002:a17:90b:1e08:: with SMTP id pg8mr350079pjb.3.1630515268797; 
 Wed, 01 Sep 2021 09:54:28 -0700 (PDT)
Received: from bobo.ibm.com (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id m64sm221824pga.55.2021.09.01.09.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 09:54:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] selftests/powerpc: Add scv versions of the basic TM
 syscall tests
Date: Thu,  2 Sep 2021 02:54:18 +1000
Message-Id: <20210901165418.1412891-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210901165418.1412891-1-npiggin@gmail.com>
References: <20210901165418.1412891-1-npiggin@gmail.com>
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

