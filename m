Return-Path: <linuxppc-dev+bounces-2442-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D109A57CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 02:30:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWx652mPsz2xs4;
	Mon, 21 Oct 2024 11:30:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729470605;
	cv=none; b=b0JcuKhyjFpfuyiJqcn5ava003EM6ewOgqHjIi0WVGVO/gxU2RM8px4rdrlVgaz3ujYdjINVEnLplEsQ3EQ8mbzQXei+GDGPH7FGsqP03oON9B5SvYEDQqX9DV5Z2LKaJT6gXRUvt9xU/wDTF90Y13H2DYzIbGQSzcj96ywbqEP/T7YCpkNv1VEpJgTkdiegpYmBAJFjxZOKrfPfrloN5yFNzVmmHo7ioLbePCM7o+He0JcldRzDc3y+gONccZoWMDTU+FaxRogsxaKSGTKQbdgsBzAuCteZdXLmMkTPKMV7weBj2u0d5wIgRMfxiZ84BKlJZwDQPV5nzUPC7kgccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729470605; c=relaxed/relaxed;
	bh=m3rDfm4UhSvYDcfD2TRBOyv9VM37DFuFe+84hesOZ54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RkjBX0OcxYjSqZe21BuDZX8FauysyJenHoLbY3rO/ytUMYhsU5hKGp/enHUHEN9kjRHg7LHfXJlVBznEc+znfkCdphLcxJ46reBTgmtxfS/ptwLIeonbjA2NDkjXuxvogKVvyUqv1DaDslgFMCVESjLVtg+9d/29DjWf3Gci0pQcdXJVXSaPyVCBoRahyuyNwEgLrC5avZNL7Q+/t/y+Bo+dsoHqf+mMKEwZtIXdULOnL1g8+afg5vz2wNV8GwKUarTHvl7HqcCavZ2rA2RrQyu74M29TXy+YMNe/c2K2hNgVWbZb+sSgQLopm3E4tg3SH+bmgqQdww5Wv9YS5bTyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GZ1FeJTr; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GZ1FeJTr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWx5y5qPzz2yR3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 11:29:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 454285C58D3;
	Mon, 21 Oct 2024 00:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FCCC4CEF6;
	Mon, 21 Oct 2024 00:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729470596;
	bh=AME2Y9rGG1BidsZz5nyWy4uPywdMlCj30lctBBonXoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GZ1FeJTr79DIGfhSNnnohZQidrpLUDVGtJGQtNO2L6b37sY4w4ee+R5ExaFPh8kvd
	 6D8uuQHeMOi4LE1rrir8M2SOyLv9IS+w6dNvRPpiCNolOmTIPDYpA0/EjR99DxqGly
	 A1Gtyrzusjzd6qlJj69X2P92pZsd9IlpdaCUNpsNlIEYMpuETvOpGcllZLICy7Jshf
	 5iPmCj7NhIC1t8UGXPS5Vkc3WlhqBhjSu8MlCHnHFn7c2DbWJGZKCyvbLACn8/18B1
	 R0mKDvJ5oaKqIlp7l9EK5yI9CMa5fTRTG78L3kKpF5+1zNhwmAZ0mYnicgFWQkhpuD
	 yF/OK73SRunbA==
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
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 10/15] x86/crc32: update prototype for crc32_pclmul_le_16()
Date: Sun, 20 Oct 2024 17:29:30 -0700
Message-ID: <20241021002935.325878-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021002935.325878-1-ebiggers@kernel.org>
References: <20241021002935.325878-1-ebiggers@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

- Change the len parameter from unsigned int to size_t, so that the
  library function which takes a size_t can safely use this code.

- Move the crc parameter to the front, as this is the usual convention.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/crypto/crc32-pclmul_asm.S  | 19 +++++++++----------
 arch/x86/crypto/crc32-pclmul_glue.c |  4 ++--
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/x86/crypto/crc32-pclmul_asm.S b/arch/x86/crypto/crc32-pclmul_asm.S
index 5d31137e2c7df..f9637789cac19 100644
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
index 9f5e342b9845d..9d14eac51c5bb 100644
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


