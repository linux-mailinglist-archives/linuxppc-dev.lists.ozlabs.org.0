Return-Path: <linuxppc-dev+bounces-7643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12138A87269
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Apr 2025 17:44:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZbF9B4q6gz2yDD;
	Mon, 14 Apr 2025 01:44:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744559086;
	cv=none; b=kf4l4cuNt9CeN0RJYaK6VHB6jEe3ahNjgRUz3u2khKd809cFzms3FUhNuHZMMoZZnb1q+sVV/WVPivdGRaS1snOxGJqc9290wfCCXp0kYPPazB2hIvaV9Ddz0ZyHWI7i3n+PdKtYP9hUEIZU34x8VRxNAfG8dOPUnMcRoOaWq09vZCizK4cby502e+f/BRd0obRurK2LwTuRlVEQwiaXatAeurPDutuGBIXTjQThte98YrgMwyVWIp8/dMorqozPq6GCxKz4olxeCE/MWarUqXPD9j1nnat7KVRuo2QBEjhyw9BrOP+CbLWhfCd39Y2AUccy8nUtiFKeujvHQyYDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744559086; c=relaxed/relaxed;
	bh=Vf8ePKqTQLJS7KY6ZWBF5aGxh/LM6CQiXPPQq0q/eIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZBudesKa/MJHh0FBjt8hEPgCzj7OUv+KywLMQ94BOHnai/Sm+u8gM9cmm58Q11Jxkc6utEEgc2mM6/7KEl6yNq33hVd+gI5TbWDXVJdwWEax0e5FkM0lv8DtAfZJi0wAW7ZWokQFZ5Btp4uXRNRs86yz8g+5AySr5zcJYUrSikEKr36OAuZDv/aPdzVPJ1eAEbkTRlKEkPpXi+FtTXRKX+s2Uzm3g2meTDH8zf8/ptJV354TKEbBn8NtWdwUprSNFsyxCSd5X5ot02pZGPo/IfYcB2mdfcCKBY14gjkvlIB6d/Uzet7cY0qTs0sUFX6i1UliGewo8pJuHoJrsuSJiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JDwna0zr; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JDwna0zr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZbF992LtKz2xqJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Apr 2025 01:44:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B52F3A41BAB;
	Sun, 13 Apr 2025 15:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456E3C4CEDD;
	Sun, 13 Apr 2025 15:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744559078;
	bh=Q3pbBZfq4LkSSwii8rxYHn7G8WTtl1ZlV3cJjcDN4u0=;
	h=From:To:Cc:Subject:Date:From;
	b=JDwna0zrYAOhK3tZ5qTXnsHj/m8//yZi2GG7Fa6yOacOJ0ovfC4bF041jHOIMhzi6
	 q8IBg0tS0KLospth+KMpSYYsSiD3Yesq+l41uOziyt35gzzvp5khseW2PrfK0JL7ja
	 Kh44y7nSfCyUyog0VEPuaZsz2ZF0r/vZ/EJTgnaZy0GLfAROktSsA0Z72rsRnUVqsz
	 0BH0FPfNETMbZlqPdWVsZR7zhLSZlrmFKV/AjfrkrBhNOeNVDlQ2ldUVu89fclbgJg
	 rP9UoeH3mYoSVowF843cl6KeIDS46c3kl9N9IXHkGwU6ETRDxAbdzBrUcVfK23/M8k
	 nwhkgGKJ5HVeg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH] lib/crc: make the CPU feature static keys __ro_after_init
Date: Sun, 13 Apr 2025 08:43:50 -0700
Message-ID: <20250413154350.10819-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
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
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

All of the CRC library's CPU feature static_keys are initialized by
initcalls and never change afterwards, so there's no need for them to be
in the regular .data section.  Put them in .data..ro_after_init instead.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---

I'm planning to take this via the crc tree.

 arch/arm/lib/crc-t10dif-glue.c       | 4 ++--
 arch/arm/lib/crc32-glue.c            | 4 ++--
 arch/arm64/lib/crc-t10dif-glue.c     | 4 ++--
 arch/loongarch/lib/crc32-loongarch.c | 2 +-
 arch/mips/lib/crc32-mips.c           | 2 +-
 arch/powerpc/lib/crc-t10dif-glue.c   | 2 +-
 arch/powerpc/lib/crc32-glue.c        | 2 +-
 arch/s390/lib/crc32-glue.c           | 2 +-
 arch/sparc/lib/crc32_glue.c          | 2 +-
 arch/x86/lib/crc-t10dif-glue.c       | 2 +-
 arch/x86/lib/crc32-glue.c            | 4 ++--
 arch/x86/lib/crc64-glue.c            | 2 +-
 12 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/lib/crc-t10dif-glue.c b/arch/arm/lib/crc-t10dif-glue.c
index 6efad3d78284..382437094bdd 100644
--- a/arch/arm/lib/crc-t10dif-glue.c
+++ b/arch/arm/lib/crc-t10dif-glue.c
@@ -14,12 +14,12 @@
 #include <crypto/internal/simd.h>
 
 #include <asm/neon.h>
 #include <asm/simd.h>
 
-static DEFINE_STATIC_KEY_FALSE(have_neon);
-static DEFINE_STATIC_KEY_FALSE(have_pmull);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
 
 #define CRC_T10DIF_PMULL_CHUNK_SIZE	16U
 
 asmlinkage u16 crc_t10dif_pmull64(u16 init_crc, const u8 *buf, size_t len);
 asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
diff --git a/arch/arm/lib/crc32-glue.c b/arch/arm/lib/crc32-glue.c
index 4340351dbde8..7ef7db9c0de7 100644
--- a/arch/arm/lib/crc32-glue.c
+++ b/arch/arm/lib/crc32-glue.c
@@ -16,12 +16,12 @@
 
 #include <asm/hwcap.h>
 #include <asm/neon.h>
 #include <asm/simd.h>
 
-static DEFINE_STATIC_KEY_FALSE(have_crc32);
-static DEFINE_STATIC_KEY_FALSE(have_pmull);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
 
 #define PMULL_MIN_LEN	64	/* min size of buffer for pmull functions */
 
 asmlinkage u32 crc32_pmull_le(const u8 buf[], u32 len, u32 init_crc);
 asmlinkage u32 crc32_armv8_le(u32 init_crc, const u8 buf[], u32 len);
diff --git a/arch/arm64/lib/crc-t10dif-glue.c b/arch/arm64/lib/crc-t10dif-glue.c
index bacd18f23168..99d0b5668a28 100644
--- a/arch/arm64/lib/crc-t10dif-glue.c
+++ b/arch/arm64/lib/crc-t10dif-glue.c
@@ -15,12 +15,12 @@
 #include <crypto/internal/simd.h>
 
 #include <asm/neon.h>
 #include <asm/simd.h>
 
-static DEFINE_STATIC_KEY_FALSE(have_asimd);
-static DEFINE_STATIC_KEY_FALSE(have_pmull);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_asimd);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
 
 #define CRC_T10DIF_PMULL_CHUNK_SIZE	16U
 
 asmlinkage void crc_t10dif_pmull_p8(u16 init_crc, const u8 *buf, size_t len,
 				    u8 out[16]);
diff --git a/arch/loongarch/lib/crc32-loongarch.c b/arch/loongarch/lib/crc32-loongarch.c
index c44ee4f32557..8e6d1f517e73 100644
--- a/arch/loongarch/lib/crc32-loongarch.c
+++ b/arch/loongarch/lib/crc32-loongarch.c
@@ -24,11 +24,11 @@ do {							\
 } while (0)
 
 #define CRC32(crc, value, size)		_CRC32(crc, value, size, crc)
 #define CRC32C(crc, value, size)	_CRC32(crc, value, size, crcc)
 
-static DEFINE_STATIC_KEY_FALSE(have_crc32);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
 
 u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!static_branch_likely(&have_crc32))
 		return crc32_le_base(crc, p, len);
diff --git a/arch/mips/lib/crc32-mips.c b/arch/mips/lib/crc32-mips.c
index 676a4b3e290b..84df361e7181 100644
--- a/arch/mips/lib/crc32-mips.c
+++ b/arch/mips/lib/crc32-mips.c
@@ -60,11 +60,11 @@ do {							\
 	_CRC32(crc, value, size, crc32)
 
 #define CRC32C(crc, value, size) \
 	_CRC32(crc, value, size, crc32c)
 
-static DEFINE_STATIC_KEY_FALSE(have_crc32);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
 
 u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!static_branch_likely(&have_crc32))
 		return crc32_le_base(crc, p, len);
diff --git a/arch/powerpc/lib/crc-t10dif-glue.c b/arch/powerpc/lib/crc-t10dif-glue.c
index f411b0120cc5..ddd5c4088f50 100644
--- a/arch/powerpc/lib/crc-t10dif-glue.c
+++ b/arch/powerpc/lib/crc-t10dif-glue.c
@@ -19,11 +19,11 @@
 #define VMX_ALIGN		16
 #define VMX_ALIGN_MASK		(VMX_ALIGN-1)
 
 #define VECTOR_BREAKPOINT	64
 
-static DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
 
 u32 __crct10dif_vpmsum(u32 crc, unsigned char const *p, size_t len);
 
 u16 crc_t10dif_arch(u16 crci, const u8 *p, size_t len)
 {
diff --git a/arch/powerpc/lib/crc32-glue.c b/arch/powerpc/lib/crc32-glue.c
index dbd10f339183..42f2dd3c85dd 100644
--- a/arch/powerpc/lib/crc32-glue.c
+++ b/arch/powerpc/lib/crc32-glue.c
@@ -11,11 +11,11 @@
 #define VMX_ALIGN		16
 #define VMX_ALIGN_MASK		(VMX_ALIGN-1)
 
 #define VECTOR_BREAKPOINT	512
 
-static DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
 
 u32 __crc32c_vpmsum(u32 crc, const u8 *p, size_t len);
 
 u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
diff --git a/arch/s390/lib/crc32-glue.c b/arch/s390/lib/crc32-glue.c
index 124214a27340..8f20a8e595c3 100644
--- a/arch/s390/lib/crc32-glue.c
+++ b/arch/s390/lib/crc32-glue.c
@@ -16,11 +16,11 @@
 
 #define VX_MIN_LEN		64
 #define VX_ALIGNMENT		16L
 #define VX_ALIGN_MASK		(VX_ALIGNMENT - 1)
 
-static DEFINE_STATIC_KEY_FALSE(have_vxrs);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vxrs);
 
 /*
  * DEFINE_CRC32_VX() - Define a CRC-32 function using the vector extension
  *
  * Creates a function to perform a particular CRC-32 computation. Depending
diff --git a/arch/sparc/lib/crc32_glue.c b/arch/sparc/lib/crc32_glue.c
index a70752c729cf..d34e7cc7e1a1 100644
--- a/arch/sparc/lib/crc32_glue.c
+++ b/arch/sparc/lib/crc32_glue.c
@@ -15,11 +15,11 @@
 #include <linux/kernel.h>
 #include <linux/crc32.h>
 #include <asm/pstate.h>
 #include <asm/elf.h>
 
-static DEFINE_STATIC_KEY_FALSE(have_crc32c_opcode);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32c_opcode);
 
 u32 crc32_le_arch(u32 crc, const u8 *data, size_t len)
 {
 	return crc32_le_base(crc, data, len);
 }
diff --git a/arch/x86/lib/crc-t10dif-glue.c b/arch/x86/lib/crc-t10dif-glue.c
index f89c335cde3c..d073b3678edc 100644
--- a/arch/x86/lib/crc-t10dif-glue.c
+++ b/arch/x86/lib/crc-t10dif-glue.c
@@ -7,11 +7,11 @@
 
 #include <linux/crc-t10dif.h>
 #include <linux/module.h>
 #include "crc-pclmul-template.h"
 
-static DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
 
 DECLARE_CRC_PCLMUL_FUNCS(crc16_msb, u16);
 
 u16 crc_t10dif_arch(u16 crc, const u8 *p, size_t len)
 {
diff --git a/arch/x86/lib/crc32-glue.c b/arch/x86/lib/crc32-glue.c
index e3f93b17ac3f..e6a6285cfca8 100644
--- a/arch/x86/lib/crc32-glue.c
+++ b/arch/x86/lib/crc32-glue.c
@@ -9,12 +9,12 @@
 
 #include <linux/crc32.h>
 #include <linux/module.h>
 #include "crc-pclmul-template.h"
 
-static DEFINE_STATIC_KEY_FALSE(have_crc32);
-static DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
 
 DECLARE_CRC_PCLMUL_FUNCS(crc32_lsb, u32);
 
 u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
diff --git a/arch/x86/lib/crc64-glue.c b/arch/x86/lib/crc64-glue.c
index b0e1b719ecbf..1214ee726c16 100644
--- a/arch/x86/lib/crc64-glue.c
+++ b/arch/x86/lib/crc64-glue.c
@@ -7,11 +7,11 @@
 
 #include <linux/crc64.h>
 #include <linux/module.h>
 #include "crc-pclmul-template.h"
 
-static DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
 
 DECLARE_CRC_PCLMUL_FUNCS(crc64_msb, u64);
 DECLARE_CRC_PCLMUL_FUNCS(crc64_lsb, u64);
 
 u64 crc64_be_arch(u64 crc, const u8 *p, size_t len)

base-commit: e8c24520a1338f938774268a9bafb679ace93b76
-- 
2.49.0


