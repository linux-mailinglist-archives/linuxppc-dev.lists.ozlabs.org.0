Return-Path: <linuxppc-dev+bounces-849-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EF6967B87
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Sep 2024 19:40:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WxfLR0qP7z2xrM;
	Mon,  2 Sep 2024 03:40:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725212447;
	cv=none; b=EpVKIF7ziF2JYFwu5dMmsotdNTAPztdcrpTYp5ddKZ9rskADPdb1Aqa9rUyodgvy2UyKld4Or0EXlbGDhS6lUBiJXOHK5DeFaEONCd+wTUDMm4ZNMCE+7yDpQMngxXnFQ8Nwoq3OI75WGrhiMYf5tXKVKvDjj198unyFEcG6hnf8R0ADmJqQABwGnSTekKFuw7vN4D78f+tQYstZPXGOTaXCjZbB8xptW0YPaaTOdVCGsPbGluJ+ggxTVsPDpY8oQNEzU5Y/Zf0lZUP5MampU3iflLwJwcvKIi5jUg9ghNw85DHEvFJk4nkdg4CpGEmGc6DanNYNZGszGcudTBKa9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725212447; c=relaxed/relaxed;
	bh=0f+2SEqkrMFk4VFVsbr0jDNTPcKozPIwuBZt97A1msY=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding; b=chG8Yhw7lDA2+fR36dMYemmi9JsolL0Zn8DcyF3rLbLzWLCvPy2NnNYhyN+CGb9oHNmQ4CQ5fp0Sn735ckQQROuz1J80FHYdwNJGM8DgiCWuL5V0h4S7AYi4er9RCFe7VyUudwSg15p+vQTvUt0EnpwScRdYKNfjH9MA7Xg9jHLqjOEviXIYgjOyFUlEosfl2FGBPhfxmDoGPMO5zNZ7tU4Cf3BG49oXlPu7+pfD5eU6YSFY+0DMYbGQnuzjHR2pUpkB7ydd51IHg+YjstvlqeSRDAcrr4Hyrw/xKMqqGjXYmomnWQITPSR3LmGwDWpeIcD+Wnn4u1fspwYHx9X+1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WxfLQ5h4xz2xnc
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 03:40:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WxfLM0dd8z9sSN;
	Sun,  1 Sep 2024 19:40:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ls-C2eSZZ_8S; Sun,  1 Sep 2024 19:40:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WxfLL6vmFz9sSK;
	Sun,  1 Sep 2024 19:40:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DE0588B767;
	Sun,  1 Sep 2024 19:40:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Nf7_4M6aqOFL; Sun,  1 Sep 2024 19:40:42 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.154])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C7518B763;
	Sun,  1 Sep 2024 19:40:42 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Shuah Khan <shuah@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests: vDSO: Also test counter in vdso_test_chacha
Date: Sun,  1 Sep 2024 19:40:33 +0200
Message-ID: <f9f64c5ded3925ae408f01c1c61e2fdf6f645a71.1725212364.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725212433; l=4431; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=PHtUPU44VJFtzSXOcuumwF4SxIcugVWr0CGUnXoZGaw=; b=kozjp6TIT5Z6o97Fzq42YN3zXL/6TDVJKww3C/AonWORE7rQibXbhGN+4grmNc48D/b8CPzll mX0qccNo+tGC5wR+VczRIhIK8hLahJg6zHOBu8hzRl5452CiYnK/1Tm
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

The chacha vDSO selftest doesn't check the way the counter is handled
by __arch_chacha20_blocks_nostack(). It indirectly checks that the
counter is writen on exit and read back on new entry, but it doesn't
check that the format is correct. It has led to an invisible erroneous
implementation on powerpc where the counter was writen and read in
wrong byte order.

Also, the counter uses two words, but the tests with a zero counter
and uses a small amount of blocks so at the end the upper part of the
counter is always 0 so it is not checked.

Add a verification of counter's content in addition to the
verification of the output.

Also add two tests where the counter crosses the u32 upper limit. The
first test verifies that the function properly writes back the upper
word, the second test verifies that the function properly reads back
the upper word.

While at it, remove 'nonce' which is not unused anymore after the
replacement of libsodium by open coded chacha implementation.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../testing/selftests/vDSO/vdso_test_chacha.c | 39 ++++++++++++++-----
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_chacha.c b/tools/testing/selftests/vDSO/vdso_test_chacha.c
index 9d18d49a82f8..ed6cf372d9ee 100644
--- a/tools/testing/selftests/vDSO/vdso_test_chacha.c
+++ b/tools/testing/selftests/vDSO/vdso_test_chacha.c
@@ -17,11 +17,12 @@ static uint32_t rol32(uint32_t word, unsigned int shift)
 	return (word << (shift & 31)) | (word >> ((-shift) & 31));
 }
 
-static void reference_chacha20_blocks(uint8_t *dst_bytes, const uint32_t *key, size_t nblocks)
+static void reference_chacha20_blocks(uint8_t *dst_bytes, const uint32_t *key, uint32_t *counter, size_t nblocks)
 {
 	uint32_t s[16] = {
 		0x61707865U, 0x3320646eU, 0x79622d32U, 0x6b206574U,
-		key[0], key[1], key[2], key[3], key[4], key[5], key[6], key[7]
+		key[0], key[1], key[2], key[3], key[4], key[5], key[6], key[7],
+		counter[0], counter[1],
 	};
 
 	while (nblocks--) {
@@ -52,6 +53,8 @@ static void reference_chacha20_blocks(uint8_t *dst_bytes, const uint32_t *key, s
 		if (!++s[12])
 			++s[13];
 	}
+	counter[0] = s[12];
+	counter[1] = s[13];
 }
 
 typedef uint8_t u8;
@@ -66,8 +69,7 @@ typedef uint64_t u64;
 int main(int argc, char *argv[])
 {
 	enum { TRIALS = 1000, BLOCKS = 128, BLOCK_SIZE = 64 };
-	static const uint8_t nonce[8] = { 0 };
-	uint32_t counter[2];
+	uint32_t counter1[2], counter2[2];
 	uint32_t key[8];
 	uint8_t output1[BLOCK_SIZE * BLOCKS], output2[BLOCK_SIZE * BLOCKS];
 
@@ -84,17 +86,36 @@ int main(int argc, char *argv[])
 			printf("getrandom() failed!\n");
 			return KSFT_SKIP;
 		}
-		reference_chacha20_blocks(output1, key, BLOCKS);
+		memset(counter1, 0, sizeof(counter1));
+		reference_chacha20_blocks(output1, key, counter1, BLOCKS);
 		for (unsigned int split = 0; split < BLOCKS; ++split) {
 			memset(output2, 'X', sizeof(output2));
-			memset(counter, 0, sizeof(counter));
+			memset(counter2, 0, sizeof(counter2));
 			if (split)
-				__arch_chacha20_blocks_nostack(output2, key, counter, split);
-			__arch_chacha20_blocks_nostack(output2 + split * BLOCK_SIZE, key, counter, BLOCKS - split);
-			if (memcmp(output1, output2, sizeof(output1)))
+				__arch_chacha20_blocks_nostack(output2, key, counter2, split);
+			__arch_chacha20_blocks_nostack(output2 + split * BLOCK_SIZE, key, counter2, BLOCKS - split);
+			if (memcmp(output1, output2, sizeof(output1)) ||
+			    memcmp(counter2, counter2, sizeof(counter1)))
 				return KSFT_FAIL;
 		}
 	}
+	memset(counter1, 0, sizeof(counter1));
+	counter1[0] = (uint32_t)-BLOCKS + 2;
+	memset(counter2, 0, sizeof(counter2));
+	counter2[0] = (uint32_t)-BLOCKS + 2;
+
+	reference_chacha20_blocks(output1, key, counter1, BLOCKS);
+	__arch_chacha20_blocks_nostack(output2, key, counter2, BLOCKS);
+	if (memcmp(output1, output2, sizeof(output1)) ||
+	    memcmp(counter2, counter2, sizeof(counter1)))
+		return KSFT_FAIL;
+
+	reference_chacha20_blocks(output1, key, counter1, BLOCKS);
+	__arch_chacha20_blocks_nostack(output2, key, counter2, BLOCKS);
+	if (memcmp(output1, output2, sizeof(output1)) ||
+	    memcmp(counter2, counter2, sizeof(counter1)))
+		return KSFT_FAIL;
+
 	ksft_test_result_pass("chacha: PASS\n");
 	return KSFT_PASS;
 }
-- 
2.44.0


