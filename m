Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B84F3904AEF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 07:33:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WnAsk0iq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzZ2g4sDKz3g11
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 15:33:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WnAsk0iq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzYr550KLz3frP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 15:24:21 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1f44b594deeso54388265ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 22:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718169861; x=1718774661; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ov2H6CvAf7+nJ+8vHcgazEvP35meWrkDmpE16so9J0U=;
        b=WnAsk0iq9dfjWeu0+oBZsLubMo/43ed7iXsGcoKvLJ9nW+eMPniq14WW0Eb3Jp3e+I
         VU02s4ZpkiP6x8EnYp8RSuCUpI44ZDW94VrQZYoX9uyGpEVmpc7Wu7QMRZeQCnWnhPej
         r0S1R/LA6ytw2FLQz1Sne/WEXO7xCm2lLXys3G4nOCmjoPDBnlc4bbLcT6dcbZOyumpc
         A5+JP0+tuz1rYGiLB3Wj6bdUOEFjnQUvMHKDHE2u/ip+naYtwN/KdrtWMe4fjMRQBwlO
         IyTKYHQk1frfyxVieG+t9tkAus2V9O2dPyDGixX7aAhHGyuXCxogWAVqWxDFQY3lx0dq
         Pcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718169861; x=1718774661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ov2H6CvAf7+nJ+8vHcgazEvP35meWrkDmpE16so9J0U=;
        b=wvMGyAh8VfEvIm8bbEXkl9HDooX8s5t8F8j0hdkmG9eZwIg3BX2OqF42ZotVkU4AdG
         ygcb0KK9SCoMkRs6fiiExNAmUUKgDfLP1CMyigpxZvt0Lx7puHsItjEpll4JRJQEvCAk
         1EMpdi5M00IhTuv7RUnoJcwCRxwzKiudfzee3w2uTkdhLZVHKWT7ihrginfejT2s8H+X
         g3iRASbR8BekkpQ1KUDL7eqo6ULfHvwLu4hAJCeqgfMiTtrVKIrGJlrAYZUwHy+gs/TW
         xzFY+OSaRJfgNIpfA6lvoDtcJsdiXSytHVhd9L9XbgH9X60pIQMK7NCzNnkSw4/NB+2k
         S7Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWFT3fPVMPPENxzwtGZIo/uBJY7pY53epS3ILpEhiXeVWdY1P3I15rtqL1imKmoWp/4MhOZhE6JEqv5efVRVa8UrCxob7wkoJeCXgyVnA==
X-Gm-Message-State: AOJu0Yzv8w1c/E9MAwgNTOp1jME81oqII7sAs6j8LW2Jv00Pt56RwgpA
	WPZCqRp/gDKpqatP9ViWBEQ3vXo9ylfDRDyd3h5gqaK+ox7zZA7T
X-Google-Smtp-Source: AGHT+IFK+RWCn1upQXe3RKipRXNTH/O9r+U30yabOqdDmeKU44uJZ/dinNzYARKqzW7k18zx2pJJVQ==
X-Received: by 2002:a17:903:1c4:b0:1f7:178d:6990 with SMTP id d9443c01a7336-1f83b5eb0fdmr11078365ad.22.1718169860868;
        Tue, 11 Jun 2024 22:24:20 -0700 (PDT)
Received: from wheely.local0.net (220-235-199-47.tpgi.com.au. [220.235.199.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd75f711sm112170705ad.11.2024.06.11.22.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:24:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v10 13/15] powerpc: Add a panic test
Date: Wed, 12 Jun 2024 15:23:18 +1000
Message-ID: <20240612052322.218726-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612052322.218726-1-npiggin@gmail.com>
References: <20240612052322.218726-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds a simple panic test for pseries and powernv that works with
TCG (unlike the s390x panic tests), making it easier to test this part
of the harness code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/rtas.h |  1 +
 lib/powerpc/rtas.c     | 16 ++++++++++++++++
 powerpc/run            |  2 +-
 powerpc/selftest.c     | 18 ++++++++++++++++--
 powerpc/unittests.cfg  |  5 +++++
 5 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/lib/powerpc/asm/rtas.h b/lib/powerpc/asm/rtas.h
index 364bf9355..2dcb2f1b3 100644
--- a/lib/powerpc/asm/rtas.h
+++ b/lib/powerpc/asm/rtas.h
@@ -26,6 +26,7 @@ extern int rtas_call(int token, int nargs, int nret, int *outputs, ...);
 extern int rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret, int *outputs, ...);
 
 extern void rtas_power_off(void);
+extern void rtas_os_panic(void);
 extern void rtas_stop_self(void);
 #endif /* __ASSEMBLY__ */
 
diff --git a/lib/powerpc/rtas.c b/lib/powerpc/rtas.c
index 9c1e0affc..98eee24f4 100644
--- a/lib/powerpc/rtas.c
+++ b/lib/powerpc/rtas.c
@@ -182,3 +182,19 @@ void rtas_power_off(void)
 	ret = rtas_call_unlocked(&args, token, 2, 1, NULL, -1, -1);
 	printf("RTAS power-off returned %d\n", ret);
 }
+
+void rtas_os_panic(void)
+{
+	struct rtas_args args;
+	uint32_t token;
+	int ret;
+
+	ret = rtas_token("ibm,os-term", &token);
+	if (ret) {
+		puts("RTAS ibm,os-term not available\n");
+		return;
+	}
+
+	ret = rtas_call_unlocked(&args, token, 1, 1, NULL, "rtas_os_panic");
+	printf("RTAS ibm,os-term returned %d\n", ret);
+}
diff --git a/powerpc/run b/powerpc/run
index 27abf1ef6..4cdc7d16c 100755
--- a/powerpc/run
+++ b/powerpc/run
@@ -56,7 +56,7 @@ fi
 
 command="$qemu -nodefaults $A $M $B $D"
 command+=" -display none -serial stdio -kernel"
-command="$(migration_cmd) $(timeout_cmd) $command"
+command="$(panic_cmd) $(migration_cmd) $(timeout_cmd) $command"
 
 # powerpc tests currently exit with rtas-poweroff, which exits with 0.
 # run_qemu treats that as a failure exit and returns 1, so we need
diff --git a/powerpc/selftest.c b/powerpc/selftest.c
index 8d1a2c767..101cfcdef 100644
--- a/powerpc/selftest.c
+++ b/powerpc/selftest.c
@@ -7,6 +7,7 @@
  */
 #include <libcflat.h>
 #include <util.h>
+#include <asm/rtas.h>
 #include <asm/setup.h>
 #include <asm/smp.h>
 
@@ -47,6 +48,17 @@ static void check_setup(int argc, char **argv)
 		report_abort("missing input");
 }
 
+static void do_panic(void)
+{
+	if (machine_is_pseries()) {
+		rtas_os_panic();
+	} else {
+		/* Cause a checkstop with MSR[ME] disabled */
+		*((char *)0x10000000000) = 0;
+	}
+	report_fail("survived panic");
+}
+
 int main(int argc, char **argv)
 {
 	report_prefix_push("selftest");
@@ -57,9 +69,11 @@ int main(int argc, char **argv)
 	report_prefix_push(argv[1]);
 
 	if (strcmp(argv[1], "setup") == 0) {
-
 		check_setup(argc-2, &argv[2]);
-
+	} else if (strcmp(argv[1], "panic") == 0) {
+		do_panic();
+	} else {
+		report_abort("unknown test %s", argv[1]);
 	}
 
 	return report_summary();
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 89455b618..9e7df22f4 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -18,6 +18,11 @@ smp = 2
 extra_params = -m 1g -append 'setup smp=2 mem=1024'
 groups = selftest gitlab-ci
 
+[selftest-panic]
+file = selftest.elf
+extra_params = -append 'panic'
+groups = selftest panic gitlab-ci
+
 [selftest-migration]
 file = selftest-migration.elf
 machine = pseries
-- 
2.45.1

