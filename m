Return-Path: <linuxppc-dev+bounces-2803-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E80759BA8CD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 23:33:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhTr85YKxz306d;
	Mon,  4 Nov 2024 09:32:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730673160;
	cv=none; b=iqPrh10cJomiEgOl37BslHXHZbNnFpVMcHc0WyzpoVG6FtJSfhvz5St/Y5q4P7Tmz+x75zLkgMeonadxztOBtwug7PG1bPFmkadq0+eIayBdQsMzL/KFSVvHB5+UUkadS2X+Mk5GLCYyWw56QrpQoM1TWYf9Ir4MtRG+nyeWTvG+rYkGTLPBZkMyuKJha/C8fpakIYOuceN+atEn0ODQUEQvuTXI69qZ5LQ3efRE+x36pXYeizeM0fk1C5yPsi2xfagJhTOgWcKb5ufssKmeCnAOXnTM7EH3f6rjHJsYXA63MW5VZbYWiFZ/VNQ15ltECSXwGU9FYGh7+djcu+9yFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730673160; c=relaxed/relaxed;
	bh=dvjZkh3zkAhMlbw52j1ldldjhDmcPTBwWYL8Z0l92B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPdFj8JmrP53DtT2IKMMYA3+96t1a5u6Sf+vrhSUEP/Hs/CoSSW46/EDN0gLCAGHc7fAYjyv4kYxesH4iOMtQZeT8wL1XCTU0m9oe3k+VkzlcBWstZgfFjmKXK37O8QsFByeisyJdnN1MoJuxtkZHvYlyyoFLuB02YyaPnjGtkDV8vRrL6PUymT+HGafAOcUgNhXPriLsyYscb/P3k0CUUI0TH8KLnoDMtC7EEKszYG1ilQgDp+pfLBpK50Y1h/kNA3gKgiMTtWUN5s4wWRcFroNV+djIEvH9pkwRFQwaD83fuQP/+BIYbl4wqgK9JhOrKQGX9GI5zdHMtTitZvH+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gDJYU9Vd; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gDJYU9Vd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhTr54xWxz2yXm
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 09:32:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AD645A41F27;
	Sun,  3 Nov 2024 22:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1B1C4CED5;
	Sun,  3 Nov 2024 22:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730673150;
	bh=kHWHhodawY/PaSA95ElCxVPVWHZVNPifFLwbM7bCJig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gDJYU9VdynkbrvLTjDKcTxSufZxtp+Z/zMYrGwL5d2/F5cTIiZu1Wiw+ZESK7zmQS
	 +FFVnjuv4vyOUFtNqcdFrGqLx5zsxKvE3A/xalMHiUtHdDZkIjSfdPYQrmB+6ySqN+
	 ddALTCJazXYVXhJOLaKgL3dfJtSCjV81z+BsXvYwPjGClNzLQ4cQVDO2B3vdW7vngf
	 Ygplb6uFLVhngaCOPYPIZPgRzKkBx/DiAHo4iNxyCSe/0PUKsaXTUY0emAEWvjikbw
	 EnEr47Hb2cCBNuPm9gE5gZTGCE0N5bdYov6knFp5JgN+MZa5XIQpyBQ3L84i8WidC1
	 QmT6y3lT/YF/w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v3 12/18] x86/crc32: update prototype for crc32_pclmul_le_16()
Date: Sun,  3 Nov 2024 14:31:48 -0800
Message-ID: <20241103223154.136127-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103223154.136127-1-ebiggers@kernel.org>
References: <20241103223154.136127-1-ebiggers@kernel.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

- Change the len parameter from unsigned int to size_t, so that the
  library function which takes a size_t can safely use this code.

- Move the crc parameter to the front, as this is the usual convention.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/crypto/crc32-pclmul_asm.S  | 19 +++++++++----------
 arch/x86/crypto/crc32-pclmul_glue.c |  4 ++--
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/x86/crypto/crc32-pclmul_asm.S b/arch/x86/crypto/crc32-pclmul_asm.S
index 5d31137e2c7d..f9637789cac1 100644
--- a/arch/x86/crypto/crc32-pclmul_asm.S
+++ b/arch/x86/crypto/crc32-pclmul_asm.S
@@ -56,30 +56,29 @@
 	.octa 0x00000001F701164100000001DB710641
 
 #define CONSTANT %xmm0
 
 #ifdef __x86_64__
-#define BUF     %rdi
-#define LEN     %rsi
-#define CRC     %edx
+#define CRC     %edi
+#define BUF     %rsi
+#define LEN     %rdx
 #else
-#define BUF     %eax
-#define LEN     %edx
-#define CRC     %ecx
+#define CRC     %eax
+#define BUF     %edx
+#define LEN     %ecx
 #endif
 
 
 
 .text
 /**
  *      Calculate crc32
- *      BUF - buffer (16 bytes aligned)
- *      LEN - sizeof buffer (16 bytes aligned), LEN should be grater than 63
  *      CRC - initial crc32
+ *      BUF - buffer (16 bytes aligned)
+ *      LEN - sizeof buffer (16 bytes aligned), LEN should be greater than 63
  *      return %eax crc32
- *      uint crc32_pclmul_le_16(unsigned char const *buffer,
- *	                     size_t len, uint crc32)
+ *      u32 crc32_pclmul_le_16(u32 crc, const u8 *buffer, size_t len);
  */
 
 SYM_FUNC_START(crc32_pclmul_le_16) /* buffer and buffer size are 16 bytes aligned */
 	movdqa  (BUF), %xmm1
 	movdqa  0x10(BUF), %xmm2
diff --git a/arch/x86/crypto/crc32-pclmul_glue.c b/arch/x86/crypto/crc32-pclmul_glue.c
index 9f5e342b9845..9d14eac51c5b 100644
--- a/arch/x86/crypto/crc32-pclmul_glue.c
+++ b/arch/x86/crypto/crc32-pclmul_glue.c
@@ -44,11 +44,11 @@
 #define PCLMUL_MIN_LEN		64L     /* minimum size of buffer
 					 * for crc32_pclmul_le_16 */
 #define SCALE_F			16L	/* size of xmm register */
 #define SCALE_F_MASK		(SCALE_F - 1)
 
-u32 crc32_pclmul_le_16(unsigned char const *buffer, size_t len, u32 crc32);
+u32 crc32_pclmul_le_16(u32 crc, const u8 *buffer, size_t len);
 
 static u32 __attribute__((pure))
 	crc32_pclmul_le(u32 crc, unsigned char const *p, size_t len)
 {
 	unsigned int iquotient;
@@ -69,11 +69,11 @@ static u32 __attribute__((pure))
 	}
 	iquotient = len & (~SCALE_F_MASK);
 	iremainder = len & SCALE_F_MASK;
 
 	kernel_fpu_begin();
-	crc = crc32_pclmul_le_16(p, iquotient, crc);
+	crc = crc32_pclmul_le_16(crc, p, iquotient);
 	kernel_fpu_end();
 
 	if (iremainder)
 		crc = crc32_le(crc, p + iquotient, iremainder);
 
-- 
2.47.0


