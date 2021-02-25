Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C6C32495A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 04:22:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmJ4k0vhrz3dV3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:22:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=C60knqQj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C60knqQj; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmJ3X6X67z3d2t
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 14:21:28 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id o6so2687731pjf.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 19:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sx0tNC7dOxaRAkbvxUDLQUDuxGz5eZlIPspZdSojVyE=;
 b=C60knqQjUBY5yIoih3U/dmpU2w84Udk0wn54rQbwvHx+FFe0iIUBRnZlCzIlTqHApz
 5RqDuNUH5wvIrE/S3pTHhhI31tyU48A0dG4R3oB+24Y1q3eVMMm8N8m94a/sAnobonI/
 siKmrWNE8G8ZGvrj/G+QxMqlRmktGAAAwEJbYqwHREr6g8VOrw+7CBGwL6pYh7fdgRRA
 tFGsTs7W24MH41JpH5yIshhFfuG0Tq1FydvuJEaDhT1X9K1pmcvzLeNpsEHJzFyW3TQc
 2hsVwPW83VzGgXBgyZbt8DQWE+2NGW0PISERlbYXZNJnbmp1Tg3h2hjcyF5LFyeEkImM
 aq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sx0tNC7dOxaRAkbvxUDLQUDuxGz5eZlIPspZdSojVyE=;
 b=XPNhv/BrA0PHz8l/IjhTPSeIgshTUDy3RJfbeBw0F4FvQPqk/DlDbjNav958pbfU/v
 2JYYrhCXXZyNN+9wxKCHkEk7HB82zdgtUs9weE9qsX/e0Tnyi0CnkZ3J9e1GCmmd5xmd
 2dAPsiixFhT7It0+K2qlLFAiYzBG0mB8uLWNjC+eoL2c40+qIrGLcQ6cQZ9QLWOcTpUc
 ke5A8Kg1KJ+RVxhMBIHBiYAxtgcIt113q+5fAES9WAwSxy9Mf7VUHZRq7/uZcmZwqQFz
 IGIw8P1Rqmn++04+9agw2kfJf4qE8oERMeyMuJXK6Eu5ROl/dtbyqINBg4qSBTlJ/Dmp
 QwuQ==
X-Gm-Message-State: AOAM531rFvUBUENo3zniqKlZvoUXu6/5r+zgEqlBrXEbcqTnhAolfp1k
 TCywgVmpUOnxmcSiUyDHKN3TskyNxTU=
X-Google-Smtp-Source: ABdhPJyt8LX0PcHiDpdsYx9uS4vT/8kOScLvB+MJ8l7kTAE3bKZcMBToLmLxoid+NdCdbZWol/kNGQ==
X-Received: by 2002:a17:90a:a384:: with SMTP id
 x4mr1149588pjp.84.1614223286340; 
 Wed, 24 Feb 2021 19:21:26 -0800 (PST)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id b62sm4097993pga.8.2021.02.24.19.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 19:21:26 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/sstep: Always test lmw and stmw
Date: Thu, 25 Feb 2021 14:21:08 +1100
Message-Id: <20210225032108.1458352-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210225032108.1458352-1-jniethe5@gmail.com>
References: <20210225032108.1458352-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Load Multiple Word (lmw) and Store Multiple Word (stmw) will raise an
Alignment Exception:
  - Little Endian mode: always
  - Big Endian mode: address not word aligned

These conditions do not depend on cache inhibited memory. Test the
alignment handler emulation of these instructions regardless of if there
is cache inhibited memory available or not.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 .../powerpc/alignment/alignment_handler.c     | 96 ++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/alignment/alignment_handler.c b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
index f5eb5b85a2cf..c3003f95e043 100644
--- a/tools/testing/selftests/powerpc/alignment/alignment_handler.c
+++ b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
@@ -45,6 +45,7 @@
 #include <getopt.h>
 #include <setjmp.h>
 #include <signal.h>
+#include <errno.h>
 
 #include "utils.h"
 #include "instructions.h"
@@ -434,7 +435,6 @@ int test_alignment_handler_integer(void)
 	LOAD_DFORM_TEST(ldu);
 	LOAD_XFORM_TEST(ldx);
 	LOAD_XFORM_TEST(ldux);
-	LOAD_DFORM_TEST(lmw);
 	STORE_DFORM_TEST(stb);
 	STORE_XFORM_TEST(stbx);
 	STORE_DFORM_TEST(stbu);
@@ -453,7 +453,6 @@ int test_alignment_handler_integer(void)
 	STORE_XFORM_TEST(stdx);
 	STORE_DFORM_TEST(stdu);
 	STORE_XFORM_TEST(stdux);
-	STORE_DFORM_TEST(stmw);
 
 	return rc;
 }
@@ -599,6 +598,97 @@ int test_alignment_handler_fp_prefix(void)
 	return rc;
 }
 
+int test_alignment_handler_multiple(void)
+{
+	int offset, width, r, rc = 0;
+	void *src1, *dst1, *src2, *dst2;
+
+	rc = posix_memalign(&src1, bufsize, bufsize);
+	if (rc) {
+		printf("\n");
+		return rc;
+	}
+
+	rc = posix_memalign(&dst1, bufsize, bufsize);
+	if (rc) {
+		printf("\n");
+		free(src1);
+		return rc;
+	}
+
+	src2 = malloc(bufsize);
+	if (!src2) {
+		printf("\n");
+		free(src1);
+		free(dst1);
+		return -ENOMEM;
+	}
+
+	dst2 = malloc(bufsize);
+	if (!dst2) {
+		printf("\n");
+		free(src1);
+		free(dst1);
+		free(src2);
+		return -ENOMEM;
+	}
+
+	/* lmw */
+	width = 4;
+	printf("\tDoing lmw:\t");
+	for (offset = 0; offset < width; offset++) {
+		preload_data(src1, offset, width);
+		preload_data(src2, offset, width);
+
+		asm volatile("lmw  31, 0(%0) ; std 31, 0(%1)"
+			     :: "r"(src1 + offset), "r"(dst1 + offset), "r"(0)
+			     : "memory", "r31");
+
+		memcpy(dst2 + offset, src1 + offset, width);
+
+		r = test_memcmp(dst1, dst2, width, offset, "test_lmw");
+		if (r && !debug) {
+			printf("FAILED: Wrong Data\n");
+			break;
+		}
+	}
+
+	if (!r)
+		printf("PASSED\n");
+	else
+		rc |= 1;
+
+	/* stmw */
+	width = 4;
+	printf("\tDoing stmw:\t");
+	for (offset = 0; offset < width; offset++) {
+		preload_data(src1, offset, width);
+		preload_data(src2, offset, width);
+
+		asm volatile("ld  31, 0(%0) ; stmw 31, 0(%1)"
+			     :: "r"(src1 + offset), "r"(dst1 + offset), "r"(0)
+			     : "memory", "r31");
+
+		memcpy(dst2 + offset, src1 + offset, width);
+
+		r = test_memcmp(dst1, dst2, width, offset, "test_stmw");
+		if (r && !debug) {
+			printf("FAILED: Wrong Data\n");
+			break;
+		}
+	}
+	if (!r)
+		printf("PASSED\n");
+	else
+		rc |= 1;
+
+	free(src1);
+	free(src2);
+	free(dst1);
+	free(dst2);
+	return rc;
+}
+
 void usage(char *prog)
 {
 	printf("Usage: %s [options] [path [offset]]\n", prog);
@@ -673,5 +763,7 @@ int main(int argc, char *argv[])
 			   "test_alignment_handler_fp_206");
 	rc |= test_harness(test_alignment_handler_fp_prefix,
 			   "test_alignment_handler_fp_prefix");
+	rc |= test_harness(test_alignment_handler_multiple,
+			   "test_alignment_handler_multiple");
 	return rc;
 }
-- 
2.25.1

