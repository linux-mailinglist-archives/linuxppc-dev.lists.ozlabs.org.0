Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CCD3A7646
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 07:10:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3xGy6n3Wz3bt4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 15:10:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jpwBzrYF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jpwBzrYF; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3xGS3gghz3018
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 15:10:22 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id m2so3761474pgk.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 22:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cly/O/fjnkwpaCSph5DraWZ+l9KVsLXN8AqoZkjIbLY=;
 b=jpwBzrYFwe7MjDOEjMGcw0e+ECPA4KZwhUznxe0A1N1Pvfi8xdyJ7ie9IiVpyQe+ZY
 bZ0JD9Ca0Ie2BARjrvazwAgEhddograjsFLCZiAGjpJv4rGLN9KqwQ0bZY1xopoxozTs
 MCrjTEWy6Wq7UbXVuaxkAS3qIU1TBoHuBIF6WCuF1T1rO98JZWh3i5JfgYGpJBSWw0y1
 CnOfAd61D3ni77AXz/r3P/0Fm8++M1ILr5WmTyQPvWwbHUSGizpIhpx1rdQXfbu3mUGE
 j7pxSwyPvFM73xun4Vgvlxbe6bqwbqc+O7H+vkNRiun+P8OTGEh5i/m8Dp1iP/tqqQ4H
 CB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cly/O/fjnkwpaCSph5DraWZ+l9KVsLXN8AqoZkjIbLY=;
 b=fkxpoF+/AAMNa/WEz4ld7+UbCUYIE/YqOmkzOFkkWlf86bGNbTxXAD7w6taiT2+ajQ
 dsoEqtZ8BfEuocPCe9NgPVSAEjbgYuOtWH5EmuBE2kxc+8fWsoaKseHwCjn6kVZ/Hoh4
 n2pcG+YxxhhX1JOQuwWgrDQRzi+SikgHaiWeU1z8MMmiVV6lNZTLqChpjB+pW/RAMIUd
 SwN7FrHbzpRz+N6/55zLA3a3Ca94cRFLG4hvdi93wvNgXHIxNhlxwjLvDb6Qvw/8mO6u
 Vq0+TKvifKgL1HugypvSHhaI4ET79c/RtzAeGvUKhpYA9yndva1YcvTvyCxOeKp82Zgm
 IMTA==
X-Gm-Message-State: AOAM5334VhuTwCX9T4TddjPbrYqJjyb81xKBx0MUYuFP+2kwE+8Uon6y
 43MoVea5P5JO7P3RPdW7In8cUC2Q3z0=
X-Google-Smtp-Source: ABdhPJxbylAKV99sEHmgzbgGZ6612/WZFX6ehO4DU7HzCWQUR8tW0B75lLgK5I/EXZh7bO4Dqu1Ybg==
X-Received: by 2002:a65:6a12:: with SMTP id m18mr1808838pgu.229.1623733816880; 
 Mon, 14 Jun 2021 22:10:16 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id d3sm14350535pfn.141.2021.06.14.22.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 22:10:16 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] selftests/powerpc: Always test lmw and stmw
Date: Tue, 15 Jun 2021 15:10:09 +1000
Message-Id: <20210615051009.538197-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Commit dd3a44c06f7b ("selftests/powerpc: Only test lwm/stmw on big
endian") stopped testing lmw/stmw on little endian because newer
binutils (>= 2.36) will not assemble them in little endian mode. The
kernel still emulates these instructions in little endian mode so use
macros to generate them and test them.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: Use macros for lmw/stmw
---
 .../powerpc/alignment/alignment_handler.c     | 101 +++++++++++++++++-
 .../selftests/powerpc/include/instructions.h  |  10 ++
 2 files changed, 106 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/powerpc/alignment/alignment_handler.c b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
index 33ee34fc0828..26878147f389 100644
--- a/tools/testing/selftests/powerpc/alignment/alignment_handler.c
+++ b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
@@ -45,6 +45,7 @@
 #include <getopt.h>
 #include <setjmp.h>
 #include <signal.h>
+#include <errno.h>
 
 #include "utils.h"
 #include "instructions.h"
@@ -453,11 +454,6 @@ int test_alignment_handler_integer(void)
 	STORE_DFORM_TEST(stdu);
 	STORE_XFORM_TEST(stdux);
 
-#ifdef __BIG_ENDIAN__
-	LOAD_DFORM_TEST(lmw);
-	STORE_DFORM_TEST(stmw);
-#endif
-
 	return rc;
 }
 
@@ -602,6 +598,99 @@ int test_alignment_handler_fp_prefix(void)
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
+		asm volatile(LMW(31, %0, 0)
+			     "std 31, 0(%1)"
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
+		asm volatile("ld  31, 0(%0) ;"
+			     STMW(31, %1, 0)
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
@@ -676,5 +765,7 @@ int main(int argc, char *argv[])
 			   "test_alignment_handler_fp_206");
 	rc |= test_harness(test_alignment_handler_fp_prefix,
 			   "test_alignment_handler_fp_prefix");
+	rc |= test_harness(test_alignment_handler_multiple,
+			   "test_alignment_handler_multiple");
 	return rc;
 }
diff --git a/tools/testing/selftests/powerpc/include/instructions.h b/tools/testing/selftests/powerpc/include/instructions.h
index 4efa6314bd96..60605e2bbd3c 100644
--- a/tools/testing/selftests/powerpc/include/instructions.h
+++ b/tools/testing/selftests/powerpc/include/instructions.h
@@ -143,4 +143,14 @@ static inline int paste_last(void *i)
 #define PSTXV0(s, a, r, d)		PREFIX_8LS(0xd8000000, s, a, r, d)
 #define PSTXV1(s, a, r, d)		PREFIX_8LS(0xdc000000, s, a, r, d)
 
+/* Load and Store Multiple Instructions */
+#define LMW(t, a, d)			stringify_in_c(.long (46 << 26) |		\
+						       __PPC_RT(t) |			\
+						       __PPC_RA(a) |			\
+						       ((d) & 0xffff);\n)
+#define STMW(t, a, d)			stringify_in_c(.long (47 << 26) |		\
+						       __PPC_RT(t) |			\
+						       __PPC_RA(a) |			\
+						       ((d) & 0xffff);\n)
+
 #endif /* _SELFTESTS_POWERPC_INSTRUCTIONS_H */
-- 
2.25.1

