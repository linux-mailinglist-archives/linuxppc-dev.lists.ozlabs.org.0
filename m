Return-Path: <linuxppc-dev+bounces-10540-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA47B19544
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Aug 2025 22:46:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwBXd4VYVz3bnJ;
	Mon,  4 Aug 2025 06:45:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754253937;
	cv=none; b=U+hnAoMQRHeFN70Hs4nJic4zU8TCXPR4azcWN8Q9s7rGKNgT06LL5racDKLrltbAnFMQLGouIm/0vfx9a7zzGe63576U8sJOhssxcMldlL9DFoKbHfS0RfrKTI4cL+cSS2SuVpagbdIWXyws2DUmT2rooBQpdrukW+U81UjYSE1meZMy9yH0kJKUcINytHm9YGgoWvqZGAJXKH4mjK8ikp/+BlN0w+lusOhpYrvfUmkkPLGxYCrJTfkGLmq0lXc7YUXkrk7dpYe6EnfohznZ4pZmia9b/j+UAn/aNzGxWsa1wO5kXQq8LpkQaaY7S+h6/UutJ/TwordwIrRuD6VTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754253937; c=relaxed/relaxed;
	bh=hmt3kB+P6nsG47XIZO64gX6GNVveIKuA3RcrTIHU97w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6VUJvzA7Ia5pFXcV6E10YD9LfSyx1//Q1b3p2duTfjwVoTzOBrDoNmtq28GxqNCv2wK+MoXQIdKVxxlEW7uCBCxgOguUbGbS7ulEke4ov4/rdl8wt0tnMPbxfJykv4dg8FLy8wZchHQctDXMVdO19D5xbvs724ySv4fx2+HagnsvI0rm7RBRO0TP9fkHm0jixFmFRPsKtUlJ37wqlgUsOehGf6Y8+zGJvdFfsMHwDYI3BMSz0UKC0mD1U6lB8avI2icPUSA6bjWuiy71nzEQwVM5RmnLaORfT9rdc2HCJT+jkwsitWWNjdkqztG46B7ANp/EKt79jJTWsM8PeaVcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=em3JLHcL; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=em3JLHcL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwBXb2YDMz2yQH
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 06:45:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E46B45BEA;
	Sun,  3 Aug 2025 20:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6172C4CEEB;
	Sun,  3 Aug 2025 20:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754253932;
	bh=WVzR/sPd61gpCZfbjnLKuwGbqa/5KZl8JqrIevNYQJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=em3JLHcLtmxSZWK3sYVpF8WjDvuR5tBSYkjsKrj753tYews9fL+SBR6QDzUxyfTYW
	 6dUr8h48QEQp0Yt7nCafb4/Y7a6zpEV0EYCIMYGU9MEu2jVvtE5Bj820QuMp9G+wwE
	 RMym8ucmrUAbUToZiQCoFocCuYcHeldhFBJEyCSBZ2fbCNmuLJtbl/pYq5wRt63CdO
	 PxVwWbhNMR5HaC4Vr5q4AVaTcnyEpm8wxqAc5tMMRd+W5V8n0hrWA87udqunvUyM/F
	 1bfRGzjm0BX01yBncYqBbZNyhCHBeeJ2UuBckN5JYNRtm9WdnjIRbLfJG3JEzyTtQp
	 XRLuNmk8+gJWg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5 code
Date: Sun,  3 Aug 2025 13:44:29 -0700
Message-ID: <20250803204433.75703-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803204433.75703-1-ebiggers@kernel.org>
References: <20250803204433.75703-1-ebiggers@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

MD5 is insecure, is no longer commonly used, and has never been
optimized for the most common architectures in the kernel.  Only mips,
powerpc, and sparc have optimized MD5 code in the kernel.  Of these,
only the powerpc one is actually testable in QEMU.  The mips one works
only on Cavium Octeon SoCs.

Taken together, it's clear that it's time to retire these additional MD5
implementations, and focus maintenance on the MD5 generic C code.

This commit removes the PowerPC optimized MD5 code.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/powerpc/configs/powernv_defconfig |   1 -
 arch/powerpc/configs/ppc64_defconfig   |   1 -
 arch/powerpc/crypto/Kconfig            |   8 -
 arch/powerpc/crypto/Makefile           |   2 -
 arch/powerpc/crypto/md5-asm.S          | 235 -------------------------
 arch/powerpc/crypto/md5-glue.c         |  99 -----------
 6 files changed, 346 deletions(-)
 delete mode 100644 arch/powerpc/crypto/md5-asm.S
 delete mode 100644 arch/powerpc/crypto/md5-glue.c

diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index d06388b0f66e3..bd4685612de6d 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -318,11 +318,10 @@ CONFIG_FTR_FIXUP_SELFTEST=y
 CONFIG_MSI_BITMAP_SELFTEST=y
 CONFIG_XMON=y
 CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_MD5_PPC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_BLOWFISH=m
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index ce34597e9f3e1..2d92c11eea7e4 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -385,11 +385,10 @@ CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_LZO=m
-CONFIG_CRYPTO_MD5_PPC=m
 CONFIG_CRYPTO_AES_GCM_P10=m
 CONFIG_CRYPTO_DEV_NX=y
 CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
 CONFIG_CRYPTO_DEV_VMX=y
 CONFIG_SYSTEM_TRUSTED_KEYRING=y
diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index cfe39fc221cf8..f4b779c7352de 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -13,18 +13,10 @@ config CRYPTO_CURVE25519_PPC64
 	  Curve25519 algorithm
 
 	  Architecture: PowerPC64
 	  - Little-endian
 
-config CRYPTO_MD5_PPC
-	tristate "Digests: MD5"
-	select CRYPTO_HASH
-	help
-	  MD5 message digest algorithm (RFC1321)
-
-	  Architecture: powerpc
-
 config CRYPTO_AES_PPC_SPE
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (SPE)"
 	depends on SPE
 	select CRYPTO_SKCIPHER
 	help
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index bc8fd27344b8b..9eb59dce67f36 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -4,17 +4,15 @@
 #
 # Arch-specific CryptoAPI modules.
 #
 
 obj-$(CONFIG_CRYPTO_AES_PPC_SPE) += aes-ppc-spe.o
-obj-$(CONFIG_CRYPTO_MD5_PPC) += md5-ppc.o
 obj-$(CONFIG_CRYPTO_AES_GCM_P10) += aes-gcm-p10-crypto.o
 obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
 obj-$(CONFIG_CRYPTO_CURVE25519_PPC64) += curve25519-ppc64le.o
 
 aes-ppc-spe-y := aes-spe-core.o aes-spe-keys.o aes-tab-4k.o aes-spe-modes.o aes-spe-glue.o
-md5-ppc-y := md5-asm.o md5-glue.o
 aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp10-ppc.o aesp10-ppc.o
 vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
 curve25519-ppc64le-y := curve25519-ppc64le-core.o curve25519-ppc64le_asm.o
 
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
diff --git a/arch/powerpc/crypto/md5-asm.S b/arch/powerpc/crypto/md5-asm.S
deleted file mode 100644
index fa6bc440cf4ac..0000000000000
--- a/arch/powerpc/crypto/md5-asm.S
+++ /dev/null
@@ -1,235 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Fast MD5 implementation for PPC
- *
- * Copyright (c) 2015 Markus Stockhausen <stockhausen@collogia.de>
- */
-#include <asm/ppc_asm.h>
-#include <asm/asm-offsets.h>
-#include <asm/asm-compat.h>
-
-#define rHP	r3
-#define rWP	r4
-
-#define rH0	r0
-#define rH1	r6
-#define rH2	r7
-#define rH3	r5
-
-#define rW00	r8
-#define rW01	r9
-#define rW02	r10
-#define rW03	r11
-#define rW04	r12
-#define rW05	r14
-#define rW06	r15
-#define rW07	r16
-#define rW08	r17
-#define rW09	r18
-#define rW10	r19
-#define rW11	r20
-#define rW12	r21
-#define rW13	r22
-#define rW14	r23
-#define rW15	r24
-
-#define rT0	r25
-#define rT1	r26
-
-#define INITIALIZE \
-	PPC_STLU r1,-INT_FRAME_SIZE(r1); \
-	SAVE_GPRS(14, 26, r1)		/* push registers onto stack	*/
-
-#define FINALIZE \
-	REST_GPRS(14, 26, r1);		/* pop registers from stack	*/ \
-	addi	r1,r1,INT_FRAME_SIZE
-
-#ifdef __BIG_ENDIAN__
-#define LOAD_DATA(reg, off) \
-	lwbrx		reg,0,rWP;	/* load data			*/
-#define INC_PTR \
-	addi		rWP,rWP,4;	/* increment per word		*/
-#define NEXT_BLOCK			/* nothing to do		*/
-#else
-#define LOAD_DATA(reg, off) \
-	lwz		reg,off(rWP);	/* load data			*/
-#define INC_PTR				/* nothing to do		*/
-#define NEXT_BLOCK \
-	addi		rWP,rWP,64;	/* increment per block		*/
-#endif
-
-#define R_00_15(a, b, c, d, w0, w1, p, q, off, k0h, k0l, k1h, k1l) \
-	LOAD_DATA(w0, off)		/*    W				*/ \
-	and		rT0,b,c;	/* 1: f = b and c		*/ \
-	INC_PTR				/*    ptr++			*/ \
-	andc		rT1,d,b;	/* 1: f' = ~b and d		*/ \
-	LOAD_DATA(w1, off+4)		/*    W				*/ \
-	or		rT0,rT0,rT1;	/* 1: f = f or f'		*/ \
-	addi		w0,w0,k0l;	/* 1: wk = w + k		*/ \
-	add		a,a,rT0;	/* 1: a = a + f			*/ \
-	addis		w0,w0,k0h;	/* 1: wk = w + k'		*/ \
-	addis		w1,w1,k1h;	/* 2: wk = w + k		*/ \
-	add		a,a,w0;		/* 1: a = a + wk		*/ \
-	addi		w1,w1,k1l;	/* 2: wk = w + k'		*/ \
-	rotrwi		a,a,p;		/* 1: a = a rotl x		*/ \
-	add		d,d,w1;		/* 2: a = a + wk		*/ \
-	add		a,a,b;		/* 1: a = a + b			*/ \
-	and		rT0,a,b;	/* 2: f = b and c		*/ \
-	andc		rT1,c,a;	/* 2: f' = ~b and d		*/ \
-	or		rT0,rT0,rT1;	/* 2: f = f or f'		*/ \
-	add		d,d,rT0;	/* 2: a = a + f			*/ \
-	INC_PTR				/*    ptr++			*/ \
-	rotrwi		d,d,q;		/* 2: a = a rotl x		*/ \
-	add		d,d,a;		/* 2: a = a + b			*/
-
-#define R_16_31(a, b, c, d, w0, w1, p, q, k0h, k0l, k1h, k1l) \
-	andc		rT0,c,d;	/* 1: f = c and ~d		*/ \
-	and		rT1,b,d;	/* 1: f' = b and d		*/ \
-	addi		w0,w0,k0l;	/* 1: wk = w + k		*/ \
-	or		rT0,rT0,rT1;	/* 1: f = f or f'		*/ \
-	addis		w0,w0,k0h;	/* 1: wk = w + k'		*/ \
-	add		a,a,rT0;	/* 1: a = a + f			*/ \
-	addi		w1,w1,k1l;	/* 2: wk = w + k		*/ \
-	add		a,a,w0;		/* 1: a = a + wk		*/ \
-	addis		w1,w1,k1h;	/* 2: wk = w + k'		*/ \
-	andc		rT0,b,c;	/* 2: f = c and ~d		*/ \
-	rotrwi		a,a,p;		/* 1: a = a rotl x		*/ \
-	add		a,a,b;		/* 1: a = a + b			*/ \
-	add		d,d,w1;		/* 2: a = a + wk		*/ \
-	and		rT1,a,c;	/* 2: f' = b and d		*/ \
-	or		rT0,rT0,rT1;	/* 2: f = f or f'		*/ \
-	add		d,d,rT0;	/* 2: a = a + f			*/ \
-	rotrwi		d,d,q;		/* 2: a = a rotl x		*/ \
-	add		d,d,a;		/* 2: a = a +b			*/
-
-#define R_32_47(a, b, c, d, w0, w1, p, q, k0h, k0l, k1h, k1l) \
-	xor		rT0,b,c;	/* 1: f' = b xor c		*/ \
-	addi		w0,w0,k0l;	/* 1: wk = w + k		*/ \
-	xor		rT1,rT0,d;	/* 1: f = f xor f'		*/ \
-	addis		w0,w0,k0h;	/* 1: wk = w + k'		*/ \
-	add		a,a,rT1;	/* 1: a = a + f			*/ \
-	addi		w1,w1,k1l;	/* 2: wk = w + k		*/ \
-	add		a,a,w0;		/* 1: a = a + wk		*/ \
-	addis		w1,w1,k1h;	/* 2: wk = w + k'		*/ \
-	rotrwi		a,a,p;		/* 1: a = a rotl x		*/ \
-	add		d,d,w1;		/* 2: a = a + wk		*/ \
-	add		a,a,b;		/* 1: a = a + b			*/ \
-	xor		rT1,rT0,a;	/* 2: f = b xor f'		*/ \
-	add		d,d,rT1;	/* 2: a = a + f			*/ \
-	rotrwi		d,d,q;		/* 2: a = a rotl x		*/ \
-	add		d,d,a;		/* 2: a = a + b			*/
-
-#define R_48_63(a, b, c, d, w0, w1, p, q, k0h, k0l, k1h, k1l) \
-	addi		w0,w0,k0l;	/* 1: w = w + k			*/ \
-	orc		rT0,b,d;	/* 1: f = b or ~d		*/ \
-	addis		w0,w0,k0h;	/* 1: w = w + k'		*/ \
-	xor		rT0,rT0,c;	/* 1: f = f xor c		*/ \
-	add		a,a,w0;		/* 1: a = a + wk		*/ \
-	addi		w1,w1,k1l;	/* 2: w = w + k			*/ \
-	add		a,a,rT0;	/* 1: a = a + f			*/ \
-	addis		w1,w1,k1h;	/* 2: w = w + k'		*/ \
-	rotrwi		a,a,p;		/* 1: a = a rotl x		*/ \
-	add		a,a,b;		/* 1: a = a + b			*/ \
-	orc		rT0,a,c;	/* 2: f = b or ~d		*/ \
-	add		d,d,w1;		/* 2: a = a + wk		*/ \
-	xor		rT0,rT0,b;	/* 2: f = f xor c		*/ \
-	add		d,d,rT0;	/* 2: a = a + f			*/ \
-	rotrwi		d,d,q;		/* 2: a = a rotl x		*/ \
-	add		d,d,a;		/* 2: a = a + b			*/
-
-_GLOBAL(ppc_md5_transform)
-	INITIALIZE
-
-	mtctr		r5
-	lwz		rH0,0(rHP)
-	lwz		rH1,4(rHP)
-	lwz		rH2,8(rHP)
-	lwz		rH3,12(rHP)
-
-ppc_md5_main:
-	R_00_15(rH0, rH1, rH2, rH3, rW00, rW01, 25, 20, 0,
-		0xd76b, -23432, 0xe8c8, -18602)
-	R_00_15(rH2, rH3, rH0, rH1, rW02, rW03, 15, 10, 8,
-		0x2420, 0x70db, 0xc1be, -12562)
-	R_00_15(rH0, rH1, rH2, rH3, rW04, rW05, 25, 20, 16,
-		0xf57c, 0x0faf, 0x4788, -14806)
-	R_00_15(rH2, rH3, rH0, rH1, rW06, rW07, 15, 10, 24,
-		0xa830, 0x4613, 0xfd47, -27391)
-	R_00_15(rH0, rH1, rH2, rH3, rW08, rW09, 25, 20, 32,
-		0x6981, -26408, 0x8b45,  -2129)
-	R_00_15(rH2, rH3, rH0, rH1, rW10, rW11, 15, 10, 40,
-		0xffff, 0x5bb1, 0x895d, -10306)
-	R_00_15(rH0, rH1, rH2, rH3, rW12, rW13, 25, 20, 48,
-		0x6b90, 0x1122, 0xfd98, 0x7193)
-	R_00_15(rH2, rH3, rH0, rH1, rW14, rW15, 15, 10, 56,
-		0xa679, 0x438e, 0x49b4, 0x0821)
-
-	R_16_31(rH0, rH1, rH2, rH3, rW01, rW06, 27, 23,
-		0x0d56, 0x6e0c, 0x1810, 0x6d2d)
-	R_16_31(rH2, rH3, rH0, rH1, rW11, rW00, 18, 12,
-		0x9d02, -32109, 0x124c, 0x2332)
-	R_16_31(rH0, rH1, rH2, rH3, rW05, rW10, 27, 23,
-		0x8ea7, 0x4a33, 0x0245, -18270)
-	R_16_31(rH2, rH3, rH0, rH1, rW15, rW04, 18, 12,
-		0x8eee,  -8608, 0xf258,  -5095)
-	R_16_31(rH0, rH1, rH2, rH3, rW09, rW14, 27, 23,
-		0x969d, -10697, 0x1cbe, -15288)
-	R_16_31(rH2, rH3, rH0, rH1, rW03, rW08, 18, 12,
-		0x3317, 0x3e99, 0xdbd9, 0x7c15)
-	R_16_31(rH0, rH1, rH2, rH3, rW13, rW02, 27, 23,
-		0xac4b, 0x7772, 0xd8cf, 0x331d)
-	R_16_31(rH2, rH3, rH0, rH1, rW07, rW12, 18, 12,
-		0x6a28, 0x6dd8, 0x219a, 0x3b68)
-
-	R_32_47(rH0, rH1, rH2, rH3, rW05, rW08, 28, 21,
-		0x29cb, 0x28e5, 0x4218,  -7788)
-	R_32_47(rH2, rH3, rH0, rH1, rW11, rW14, 16,  9,
-		0x473f, 0x06d1, 0x3aae, 0x3036)
-	R_32_47(rH0, rH1, rH2, rH3, rW01, rW04, 28, 21,
-		0xaea1, -15134, 0x640b, -11295)
-	R_32_47(rH2, rH3, rH0, rH1, rW07, rW10, 16,  9,
-		0x8f4c, 0x4887, 0xbc7c, -22499)
-	R_32_47(rH0, rH1, rH2, rH3, rW13, rW00, 28, 21,
-		0x7eb8, -27199, 0x00ea, 0x6050)
-	R_32_47(rH2, rH3, rH0, rH1, rW03, rW06, 16,  9,
-		0xe01a, 0x22fe, 0x4447, 0x69c5)
-	R_32_47(rH0, rH1, rH2, rH3, rW09, rW12, 28, 21,
-		0xb7f3, 0x0253, 0x59b1, 0x4d5b)
-	R_32_47(rH2, rH3, rH0, rH1, rW15, rW02, 16,  9,
-		0x4701, -27017, 0xc7bd, -19859)
-
-	R_48_63(rH0, rH1, rH2, rH3, rW00, rW07, 26, 22,
-		0x0988,  -1462, 0x4c70, -19401)
-	R_48_63(rH2, rH3, rH0, rH1, rW14, rW05, 17, 11,
-		0xadaf,  -5221, 0xfc99, 0x66f7)
-	R_48_63(rH0, rH1, rH2, rH3, rW12, rW03, 26, 22,
-		0x7e80, -16418, 0xba1e, -25587)
-	R_48_63(rH2, rH3, rH0, rH1, rW10, rW01, 17, 11,
-		0x4130, 0x380d, 0xe0c5, 0x738d)
-	lwz		rW00,0(rHP)
-	R_48_63(rH0, rH1, rH2, rH3, rW08, rW15, 26, 22,
-		0xe837, -30770, 0xde8a, 0x69e8)
-	lwz		rW14,4(rHP)
-	R_48_63(rH2, rH3, rH0, rH1, rW06, rW13, 17, 11,
-		0x9e79, 0x260f, 0x256d, -27941)
-	lwz		rW12,8(rHP)
-	R_48_63(rH0, rH1, rH2, rH3, rW04, rW11, 26, 22,
-		0xab75, -20775, 0x4f9e, -28397)
-	lwz		rW10,12(rHP)
-	R_48_63(rH2, rH3, rH0, rH1, rW02, rW09, 17, 11,
-		0x662b, 0x7c56, 0x11b2, 0x0358)
-
-	add		rH0,rH0,rW00
-	stw		rH0,0(rHP)
-	add		rH1,rH1,rW14
-	stw		rH1,4(rHP)
-	add		rH2,rH2,rW12
-	stw		rH2,8(rHP)
-	add		rH3,rH3,rW10
-	stw		rH3,12(rHP)
-	NEXT_BLOCK
-
-	bdnz		ppc_md5_main
-
-	FINALIZE
-	blr
diff --git a/arch/powerpc/crypto/md5-glue.c b/arch/powerpc/crypto/md5-glue.c
deleted file mode 100644
index 204440a90cd84..0000000000000
--- a/arch/powerpc/crypto/md5-glue.c
+++ /dev/null
@@ -1,99 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Glue code for MD5 implementation for PPC assembler
- *
- * Based on generic implementation.
- *
- * Copyright (c) 2015 Markus Stockhausen <stockhausen@collogia.de>
- */
-
-#include <crypto/internal/hash.h>
-#include <crypto/md5.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
-
-extern void ppc_md5_transform(u32 *state, const u8 *src, u32 blocks);
-
-static int ppc_md5_init(struct shash_desc *desc)
-{
-	struct md5_state *sctx = shash_desc_ctx(desc);
-
-	sctx->hash[0] = MD5_H0;
-	sctx->hash[1] = MD5_H1;
-	sctx->hash[2] = MD5_H2;
-	sctx->hash[3] =	MD5_H3;
-	sctx->byte_count = 0;
-
-	return 0;
-}
-
-static int ppc_md5_update(struct shash_desc *desc, const u8 *data,
-			unsigned int len)
-{
-	struct md5_state *sctx = shash_desc_ctx(desc);
-
-	sctx->byte_count += round_down(len, MD5_HMAC_BLOCK_SIZE);
-	ppc_md5_transform(sctx->hash, data, len >> 6);
-	return len - round_down(len, MD5_HMAC_BLOCK_SIZE);
-}
-
-static int ppc_md5_finup(struct shash_desc *desc, const u8 *src,
-			 unsigned int offset, u8 *out)
-{
-	struct md5_state *sctx = shash_desc_ctx(desc);
-	__le64 block[MD5_BLOCK_WORDS] = {};
-	u8 *p = memcpy(block, src, offset);
-	__le32 *dst = (__le32 *)out;
-	__le64 *pbits;
-
-	src = p;
-	p += offset;
-	*p++ = 0x80;
-	sctx->byte_count += offset;
-	pbits = &block[(MD5_BLOCK_WORDS / (offset > 55 ? 1 : 2)) - 1];
-	*pbits = cpu_to_le64(sctx->byte_count << 3);
-	ppc_md5_transform(sctx->hash, src, (pbits - block + 1) / 8);
-	memzero_explicit(block, sizeof(block));
-
-	dst[0] = cpu_to_le32(sctx->hash[0]);
-	dst[1] = cpu_to_le32(sctx->hash[1]);
-	dst[2] = cpu_to_le32(sctx->hash[2]);
-	dst[3] = cpu_to_le32(sctx->hash[3]);
-	return 0;
-}
-
-static struct shash_alg alg = {
-	.digestsize	=	MD5_DIGEST_SIZE,
-	.init		=	ppc_md5_init,
-	.update		=	ppc_md5_update,
-	.finup		=	ppc_md5_finup,
-	.descsize	=	MD5_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"md5",
-		.cra_driver_name=	"md5-ppc",
-		.cra_priority	=	200,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	MD5_HMAC_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static int __init ppc_md5_mod_init(void)
-{
-	return crypto_register_shash(&alg);
-}
-
-static void __exit ppc_md5_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_init(ppc_md5_mod_init);
-module_exit(ppc_md5_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("MD5 Secure Hash Algorithm, PPC assembler");
-
-MODULE_ALIAS_CRYPTO("md5");
-MODULE_ALIAS_CRYPTO("md5-ppc");
-- 
2.50.1


