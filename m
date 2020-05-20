Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF54D1DA7C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 04:13:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rbs03xxtzDqWk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 12:13:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=csN6erST; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rbpz5gx7zDqNZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 12:11:55 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id f6so737295pgm.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 19:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MCQs6WCSxLu68CJI3911LbYL7H/2A8MHcRow4LsRDhw=;
 b=csN6erSTz8bABOq3AdvrM1f8roE8iBjnpvy44RnXVe/fe6wRPoX91zuH3IrI3dqQ8/
 VapbVokvdSkspNimoDbC/Depsh/SRVTx05JtuxS16dSJ55bKLhGvegEnHQfaNsOqQnOv
 Fct3FBY0/mwaF6JJqpj952t9MU2SAK011nw8CY0/KnhHhVjRaR309RrTwtPgzXXraIOK
 DUrMyehKj6pt9W8TWpIZfH7xWROxOkqGkyan5ZZLizFkqmoKN+AS3cbuJorlw0eAWQgc
 z2GdffAyLMrKKlnc7R6mvEWZaXYFzVViJ28BrhlcYtBVhQ/6xPvm0D1hhTaXhS+7ehA3
 wRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MCQs6WCSxLu68CJI3911LbYL7H/2A8MHcRow4LsRDhw=;
 b=O5YDdjbwew9q566thJVQ4j8dVeBFIsOsT1MITZi4X5nDcrCSWmD/PANooiGinyUCfj
 2tF9kVLEM3Li1wQk8iqqILJGEzcjeBqaIkJDAMjRZ5bnv3PB3EdxMsCuatRR2+FbOa7J
 eKzIJPpXQTIF6yZ6yN1SdgJTKYlk6coysaZt3wjSD1PJl0++w3we8cI5v8NA3HlcGCLe
 vn4XwdsYKdIZcb7ZlAYewI0X/ZH0eU4ukNElAM7DlBU73KFuN6e95tkI9yECbFLQO6YG
 nW/4tYkBHslyXkfGf58DJSjY+/1j5PvAeFn+5tnkIf4moGKGuXvnQbYkndTNmyV/qdH3
 lzrw==
X-Gm-Message-State: AOAM5318+pznT7msZugy71n7xxe3M5Q7YmKCfayF0sEjoRb0XyWSPLR+
 2ttKp+Ec8XlFeg4UgnSHn0kZ2pqvPVE=
X-Google-Smtp-Source: ABdhPJwoRCm3gjloZeLdqb/tPQLIW4+HlYBDszlxXoc7ATWQnDIRd3KNPWTRuILikSGUrJtfJPR4Ew==
X-Received: by 2002:a05:6a00:1342:: with SMTP id
 k2mr2013483pfu.32.1589940712189; 
 Tue, 19 May 2020 19:11:52 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id y5sm619600pff.150.2020.05.19.19.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 19:11:51 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] selftests/powerpc: Allow choice of CI memory location in
 alignment_handler test
Date: Wed, 20 May 2020 12:11:02 +1000
Message-Id: <20200520021103.19798-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The alignment handler selftest needs cache-inhibited memory and
currently /dev/fb0 is relied on to provided this. This prevents running
the test on systems without /dev/fb0 (e.g., mambo). Read the commandline
arguments for an optional path to be used instead, as well as an
optional offset to be for mmaping this path.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 .../powerpc/alignment/alignment_handler.c     | 63 ++++++++++++-------
 1 file changed, 42 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/powerpc/alignment/alignment_handler.c b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
index 0453c50c949c..eb6aba323f8b 100644
--- a/tools/testing/selftests/powerpc/alignment/alignment_handler.c
+++ b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
@@ -9,7 +9,17 @@
  * This selftest exercises the powerpc alignment fault handler.
  *
  * We create two sets of source and destination buffers, one in regular memory,
- * the other cache-inhibited (we use /dev/fb0 for this).
+ * the other cache-inhibited (by default we use /dev/fb0 for this, but an
+ * alterative path for cache-inhibited memory may be provided).
+ *
+ * One way to get cache-inhibited memory is to use the "mem" kernel parameter
+ * to limit the kernel to less memory than actually exists.  Addresses above
+ * the limit may still be accessed but will be treated as cache-inhibited. For
+ * example, if there is actually 4GB of memory and the parameter "mem=3GB" is
+ * used, memory from address 0xC0000000 onwards is treated as cache-inhibited.
+ * To access this region /dev/mem is used. The kernel should be configured
+ * without CONFIG_STRICT_DEVMEM. In this case use:
+ *         ./alignment_handler /dev/mem 0xc0000000
  *
  * We initialise the source buffers, then use whichever set of load/store
  * instructions is under test to copy bytes from the source buffers to the
@@ -53,6 +63,8 @@ int bufsize;
 int debug;
 int testing;
 volatile int gotsig;
+char *cipath = "/dev/fb0";
+long cioffset;
 
 void sighandler(int sig, siginfo_t *info, void *ctx)
 {
@@ -195,17 +207,18 @@ int do_test(char *test_name, void (*test_func)(char *, char *))
 
 	printf("\tDoing %s:\t", test_name);
 
-	fd = open("/dev/fb0", O_RDWR);
+	fd = open(cipath, O_RDWR);
 	if (fd < 0) {
 		printf("\n");
-		perror("Can't open /dev/fb0 now?");
+		perror("Can't open ci file now?");
 		return 1;
 	}
 
-	ci0 = mmap(NULL, bufsize, PROT_WRITE, MAP_SHARED,
-		   fd, 0x0);
-	ci1 = mmap(NULL, bufsize, PROT_WRITE, MAP_SHARED,
-		   fd, bufsize);
+	ci0 = mmap(NULL, bufsize, PROT_WRITE | PROT_READ, MAP_SHARED,
+		   fd, cioffset);
+	ci1 = mmap(NULL, bufsize, PROT_WRITE | PROT_READ, MAP_SHARED,
+		   fd, cioffset + bufsize);
+
 	if ((ci0 == MAP_FAILED) || (ci1 == MAP_FAILED)) {
 		printf("\n");
 		perror("mmap failed");
@@ -270,11 +283,11 @@ int do_test(char *test_name, void (*test_func)(char *, char *))
 	return rc;
 }
 
-static bool can_open_fb0(void)
+static bool can_open_cifile(void)
 {
 	int fd;
 
-	fd = open("/dev/fb0", O_RDWR);
+	fd = open(cipath, O_RDWR);
 	if (fd < 0)
 		return false;
 
@@ -286,7 +299,7 @@ int test_alignment_handler_vsx_206(void)
 {
 	int rc = 0;
 
-	SKIP_IF(!can_open_fb0());
+	SKIP_IF(!can_open_cifile());
 	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06));
 
 	printf("VSX: 2.06B\n");
@@ -304,7 +317,7 @@ int test_alignment_handler_vsx_207(void)
 {
 	int rc = 0;
 
-	SKIP_IF(!can_open_fb0());
+	SKIP_IF(!can_open_cifile());
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_2_07));
 
 	printf("VSX: 2.07B\n");
@@ -320,7 +333,7 @@ int test_alignment_handler_vsx_300(void)
 {
 	int rc = 0;
 
-	SKIP_IF(!can_open_fb0());
+	SKIP_IF(!can_open_cifile());
 
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_00));
 	printf("VSX: 3.00B\n");
@@ -352,7 +365,7 @@ int test_alignment_handler_integer(void)
 {
 	int rc = 0;
 
-	SKIP_IF(!can_open_fb0());
+	SKIP_IF(!can_open_cifile());
 
 	printf("Integer\n");
 	LOAD_DFORM_TEST(lbz);
@@ -408,7 +421,7 @@ int test_alignment_handler_integer_206(void)
 {
 	int rc = 0;
 
-	SKIP_IF(!can_open_fb0());
+	SKIP_IF(!can_open_cifile());
 	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06));
 
 	printf("Integer: 2.06\n");
@@ -423,7 +436,7 @@ int test_alignment_handler_vmx(void)
 {
 	int rc = 0;
 
-	SKIP_IF(!can_open_fb0());
+	SKIP_IF(!can_open_cifile());
 	SKIP_IF(!have_hwcap(PPC_FEATURE_HAS_ALTIVEC));
 
 	printf("VMX\n");
@@ -451,7 +464,7 @@ int test_alignment_handler_fp(void)
 {
 	int rc = 0;
 
-	SKIP_IF(!can_open_fb0());
+	SKIP_IF(!can_open_cifile());
 
 	printf("Floating point\n");
 	LOAD_FLOAT_DFORM_TEST(lfd);
@@ -479,7 +492,7 @@ int test_alignment_handler_fp_205(void)
 {
 	int rc = 0;
 
-	SKIP_IF(!can_open_fb0());
+	SKIP_IF(!can_open_cifile());
 	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_05));
 
 	printf("Floating point: 2.05\n");
@@ -497,7 +510,7 @@ int test_alignment_handler_fp_206(void)
 {
 	int rc = 0;
 
-	SKIP_IF(!can_open_fb0());
+	SKIP_IF(!can_open_cifile());
 	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06));
 
 	printf("Floating point: 2.06\n");
@@ -509,11 +522,12 @@ int test_alignment_handler_fp_206(void)
 
 void usage(char *prog)
 {
-	printf("Usage: %s [options]\n", prog);
+	printf("Usage: %s [options] [path [offset]]\n", prog);
 	printf("  -d	Enable debug error output\n");
 	printf("\n");
-	printf("This test requires a POWER8 or POWER9 CPU and a usable ");
-	printf("framebuffer at /dev/fb0.\n");
+	printf("This test requires a POWER8 or POWER9 CPU and either a ");
+	printf("usable framebuffer at /dev/fb0 or the path to usable ");
+	printf("cache-inhibited memory and optional offset to be provided\n");
 }
 
 int main(int argc, char *argv[])
@@ -533,6 +547,13 @@ int main(int argc, char *argv[])
 			exit(1);
 		}
 	}
+	argc -= optind;
+	argv += optind;
+
+	if (argc > 0)
+		cipath = argv[0];
+	if (argc > 1)
+		cioffset = strtol(argv[1], 0, 0x10);
 
 	bufsize = getpagesize();
 
-- 
2.17.1

