Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F19E785916
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 15:22:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW6MX1j8wz3c1P
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 23:22:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW6Ly6Dhwz2xdc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 23:21:59 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RW6Lp1v7Lz9w91;
	Wed, 23 Aug 2023 15:21:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1c17_9wbE0m; Wed, 23 Aug 2023 15:21:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RW6Lp0z4nz9w90;
	Wed, 23 Aug 2023 15:21:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D1F28B77C;
	Wed, 23 Aug 2023 15:21:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id EIDC-UGBUuDB; Wed, 23 Aug 2023 15:21:54 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EF48A8B766;
	Wed, 23 Aug 2023 15:21:53 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37NDLqhA1216463
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 15:21:52 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37NDLptD1216455;
	Wed, 23 Aug 2023 15:21:51 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Noah Goldstein <goldstein.w.n@gmail.com>
Subject: [PATCH net-next] kunit: Fix checksum tests on big endian CPUs
Date: Wed, 23 Aug 2023 15:21:43 +0200
Message-ID: <fe8a302c25bd0380ca030735a1383288a89adb11.1692796810.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692796902; l=7718; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=uXazXcdhB09nhwzipSWjqcji5o3m5f3NYxL6yjh+gQY=; b=Tu8L74wzQhY2cDa93pD8pHbiXEZ5l1RNQBKgIUTXdk5WX58RqAzba/j8KJ8HsAewS8CL+vXBK PnFrr+SFz+yCWmvrEcAaN1PKFUM9VZ2Oqk0JcY4ncaOa3FlQI2kXG7Q
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On powerpc64le checksum kunit tests work:

[    2.011457][    T1]     KTAP version 1
[    2.011662][    T1]     # Subtest: checksum
[    2.011848][    T1]     1..3
[    2.034710][    T1]     ok 1 test_csum_fixed_random_inputs
[    2.079325][    T1]     ok 2 test_csum_all_carry_inputs
[    2.127102][    T1]     ok 3 test_csum_no_carry_inputs
[    2.127202][    T1] # checksum: pass:3 fail:0 skip:0 total:3
[    2.127533][    T1] # Totals: pass:3 fail:0 skip:0 total:3
[    2.127956][    T1] ok 1 checksum

But on powerpc64 and powerpc32 they fail:

[    1.859890][    T1]     KTAP version 1
[    1.860041][    T1]     # Subtest: checksum
[    1.860201][    T1]     1..3
[    1.861927][   T58]     # test_csum_fixed_random_inputs: ASSERTION FAILED at lib/checksum_kunit.c:243
[    1.861927][   T58]     Expected result == expec, but
[    1.861927][   T58]         result == 54991 (0xd6cf)
[    1.861927][   T58]         expec == 33316 (0x8224)
[    1.863742][    T1]     not ok 1 test_csum_fixed_random_inputs
[    1.864520][   T60]     # test_csum_all_carry_inputs: ASSERTION FAILED at lib/checksum_kunit.c:267
[    1.864520][   T60]     Expected result == expec, but
[    1.864520][   T60]         result == 255 (0xff)
[    1.864520][   T60]         expec == 65280 (0xff00)
[    1.868820][    T1]     not ok 2 test_csum_all_carry_inputs
[    1.869977][   T62]     # test_csum_no_carry_inputs: ASSERTION FAILED at lib/checksum_kunit.c:306
[    1.869977][   T62]     Expected result == expec, but
[    1.869977][   T62]         result == 64515 (0xfc03)
[    1.869977][   T62]         expec == 0 (0x0)
[    1.872060][    T1]     not ok 3 test_csum_no_carry_inputs
[    1.872102][    T1] # checksum: pass:0 fail:3 skip:0 total:3
[    1.872458][    T1] # Totals: pass:0 fail:3 skip:0 total:3
[    1.872791][    T1] not ok 3 checksum

This is because all expected values were calculated for X86 which
is little endian. On big endian systems all precalculated 16 bits
halves must be byte swapped.

And this is confirmed by a huge amount of sparse errors when building
with C=2

So fix all sparse errors and it will naturally work on all endianness.

Fixes: 688eb8191b47 ("x86/csum: Improve performance of `csum_partial`")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 lib/checksum_kunit.c | 54 +++++++++++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 16 deletions(-)

diff --git a/lib/checksum_kunit.c b/lib/checksum_kunit.c
index ace3c4799fe1..0eed92b77ba3 100644
--- a/lib/checksum_kunit.c
+++ b/lib/checksum_kunit.c
@@ -10,7 +10,8 @@
 #define MAX_ALIGN 64
 #define TEST_BUFLEN (MAX_LEN + MAX_ALIGN)
 
-static const __wsum random_init_sum = 0x2847aab;
+/* Values for a little endian CPU. Byte swap each half on big endian CPU. */
+static const u32 random_init_sum = 0x2847aab;
 static const u8 random_buf[] = {
 	0xac, 0xd7, 0x76, 0x69, 0x6e, 0xf2, 0x93, 0x2c, 0x1f, 0xe0, 0xde, 0x86,
 	0x8f, 0x54, 0x33, 0x90, 0x95, 0xbf, 0xff, 0xb9, 0xea, 0x62, 0x6e, 0xb5,
@@ -56,7 +57,9 @@ static const u8 random_buf[] = {
 	0xe1, 0xdf, 0x4b, 0xe1, 0x81, 0xe2, 0x17, 0x02, 0x7b, 0x58, 0x8b, 0x92,
 	0x1a, 0xac, 0x46, 0xdd, 0x2e, 0xce, 0x40, 0x09
 };
-static const __sum16 expected_results[] = {
+
+/* Values for a little endian CPU. Byte swap on big endian CPU. */
+static const u16 expected_results[] = {
 	0x82d0, 0x8224, 0xab23, 0xaaad, 0x41ad, 0x413f, 0x4f3e, 0x4eab, 0x22ab,
 	0x228c, 0x428b, 0x41ad, 0xbbac, 0xbb1d, 0x671d, 0x66ea, 0xd6e9, 0xd654,
 	0x1754, 0x1655, 0x5d54, 0x5c6a, 0xfa69, 0xf9fb, 0x44fb, 0x4428, 0xf527,
@@ -115,7 +118,9 @@ static const __sum16 expected_results[] = {
 	0x1d47, 0x3c46, 0x3bc5, 0x59c4, 0x59ad, 0x57ad, 0x5732, 0xff31, 0xfea6,
 	0x6ca6, 0x6c8c, 0xc08b, 0xc045, 0xe344, 0xe316, 0x1516, 0x14d6,
 };
-static const __wsum init_sums_no_overflow[] = {
+
+/* Values for a little endian CPU. Byte swap each half on big endian CPU. */
+static const u32 init_sums_no_overflow[] = {
 	0xffffffff, 0xfffffffb, 0xfffffbfb, 0xfffffbf7, 0xfffff7f7, 0xfffff7f3,
 	0xfffff3f3, 0xfffff3ef, 0xffffefef, 0xffffefeb, 0xffffebeb, 0xffffebe7,
 	0xffffe7e7, 0xffffe7e3, 0xffffe3e3, 0xffffe3df, 0xffffdfdf, 0xffffdfdb,
@@ -208,7 +213,21 @@ static u8 tmp_buf[TEST_BUFLEN];
 
 #define full_csum(buff, len, sum) csum_fold(csum_partial(buff, len, sum))
 
-#define CHECK_EQ(lhs, rhs) KUNIT_ASSERT_EQ(test, lhs, rhs)
+#define CHECK_EQ(lhs, rhs) KUNIT_ASSERT_EQ(test, (__force u64)lhs, (__force u64)rhs)
+
+static __sum16 to_sum16(u16 x)
+{
+	return (__force __sum16)le16_to_cpu((__force __le16)x);
+}
+
+/* This function swaps the bytes inside each half of a __wsum */
+static __wsum to_wsum(u32 x)
+{
+	u16 hi = le16_to_cpu((__force __le16)(x >> 16));
+	u16 lo = le16_to_cpu((__force __le16)x);
+
+	return (__force __wsum)((hi << 16) | lo);
+}
 
 static void assert_setup_correct(struct kunit *test)
 {
@@ -226,7 +245,8 @@ static void assert_setup_correct(struct kunit *test)
 static void test_csum_fixed_random_inputs(struct kunit *test)
 {
 	int len, align;
-	__wsum result, expec, sum;
+	__wsum sum;
+	__sum16 result, expec;
 
 	assert_setup_correct(test);
 	for (align = 0; align < TEST_BUFLEN; ++align) {
@@ -237,9 +257,9 @@ static void test_csum_fixed_random_inputs(struct kunit *test)
 			/*
 			 * Test the precomputed random input.
 			 */
-			sum = random_init_sum;
+			sum = to_wsum(random_init_sum);
 			result = full_csum(&tmp_buf[align], len, sum);
-			expec = expected_results[len];
+			expec = to_sum16(expected_results[len]);
 			CHECK_EQ(result, expec);
 		}
 	}
@@ -251,7 +271,8 @@ static void test_csum_fixed_random_inputs(struct kunit *test)
 static void test_csum_all_carry_inputs(struct kunit *test)
 {
 	int len, align;
-	__wsum result, expec, sum;
+	__wsum sum;
+	__sum16 result, expec;
 
 	assert_setup_correct(test);
 	memset(tmp_buf, 0xff, TEST_BUFLEN);
@@ -261,9 +282,9 @@ static void test_csum_all_carry_inputs(struct kunit *test)
 			/*
 			 * All carries from input and initial sum.
 			 */
-			sum = 0xffffffff;
+			sum = to_wsum(0xffffffff);
 			result = full_csum(&tmp_buf[align], len, sum);
-			expec = (len & 1) ? 0xff00 : 0;
+			expec = to_sum16((len & 1) ? 0xff00 : 0);
 			CHECK_EQ(result, expec);
 
 			/*
@@ -272,11 +293,11 @@ static void test_csum_all_carry_inputs(struct kunit *test)
 			sum = 0;
 			result = full_csum(&tmp_buf[align], len, sum);
 			if (len & 1)
-				expec = 0xff00;
+				expec = to_sum16(0xff00);
 			else if (len)
 				expec = 0;
 			else
-				expec = 0xffff;
+				expec = to_sum16(0xffff);
 			CHECK_EQ(result, expec);
 		}
 	}
@@ -290,7 +311,8 @@ static void test_csum_all_carry_inputs(struct kunit *test)
 static void test_csum_no_carry_inputs(struct kunit *test)
 {
 	int len, align;
-	__wsum result, expec, sum;
+	__wsum sum;
+	__sum16 result, expec;
 
 	assert_setup_correct(test);
 	memset(tmp_buf, 0x4, TEST_BUFLEN);
@@ -300,7 +322,7 @@ static void test_csum_no_carry_inputs(struct kunit *test)
 			/*
 			 * Expect no carries.
 			 */
-			sum = init_sums_no_overflow[len];
+			sum = to_wsum(init_sums_no_overflow[len]);
 			result = full_csum(&tmp_buf[align], len, sum);
 			expec = 0;
 			CHECK_EQ(result, expec);
@@ -308,9 +330,9 @@ static void test_csum_no_carry_inputs(struct kunit *test)
 			/*
 			 * Expect one carry.
 			 */
-			sum = init_sums_no_overflow[len] + 1;
+			sum = to_wsum(init_sums_no_overflow[len] + 1);
 			result = full_csum(&tmp_buf[align], len, sum);
-			expec = len ? 0xfffe : 0xffff;
+			expec = to_sum16(len ? 0xfffe : 0xffff);
 			CHECK_EQ(result, expec);
 		}
 	}
-- 
2.41.0

