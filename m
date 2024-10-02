Return-Path: <linuxppc-dev+bounces-1721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C68E698CEF1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 10:39:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJSsq118lz2yPD;
	Wed,  2 Oct 2024 18:39:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727858382;
	cv=none; b=SXP2NrDnM94NWEOcEm46PaEZFDiwQxumZF5HMNh8DoceZ4ziKbntQwFEOAkXjBV8s7E971UFFTM6EwxsI+KJGs7NYRdfnXW2XkXQQYB+mGT7FyO8i5QQmUxvHxb1cLMdmJD8now6vYl12vgwKK8Whwuw3s4lxFx0mbUWxrrW0OsMswrv/e4rUKgpmSUH+ie3YPEqDfxpxEMl2sTMDB/QjPt1up/dLnQ5PV61yJNWEKtwQuTAvoimmClhX63O9ZIr2sY75w8Ulud21EsgwSacze99kQJjYmDkhuxXG7DvvQps5z3BRwXj5/auHLpSP1KsnM0J5BNwQYgaUyttVJ4Aiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727858382; c=relaxed/relaxed;
	bh=NBjldMN5IVCBH+uapDoDebq9FgEt5eqhKbqxD1Qhnvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g70CAZfyAhPORzgsGTWYRetZCsRpXnjHq61Kt1aaQhBu3ndWqAuIKOnF3z2a5mBLkv1D5fihdZejYyE44sdVTmqZLaRzrMBcAQVDKBLbqAK9D4LVI4tDCF4sj0E8TmirmAjTe6csa1Qx9TjNkYcprYw2rzwMntd89wIcOZkWbCATXg21omh2e1JOqZWuOaI0lEgV4BiSDs/b+OzOG+x/DYBZxmfUwXC09JktjECg2i04suAkApSiUWu+KlXkfSVfaGtT6VwLdSwxg+NQBHV4irRWYlf7UzCMfKN5CnQ+mlxROpVLtBHRInuzj8VUOxktW4vCZwyD7IspdTiO9Drc2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJSsp3WfGz2xZj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 18:39:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XJSsb6nN6z9sRk;
	Wed,  2 Oct 2024 10:39:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2DmTPm4dC-nN; Wed,  2 Oct 2024 10:39:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XJSsb5lcvz9rvV;
	Wed,  2 Oct 2024 10:39:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B41E48B766;
	Wed,  2 Oct 2024 10:39:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id dXdr3hYcVVcU; Wed,  2 Oct 2024 10:39:31 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.39])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 628228B763;
	Wed,  2 Oct 2024 10:39:31 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Jason@zx2c4.com
Subject: [PATCH 2/2] powerpc/vdso: Implement __arch_get_vdso_rng_data()
Date: Wed,  2 Oct 2024 10:39:29 +0200
Message-ID: <a1a9bd0df508f1b5c04684b7366940577dfc6262.1727858295.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
References: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727858369; l=4123; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=JzDBdvC4YvowjeOLvmzIUrVV6f0CO+QwXA1RW6itCK4=; b=CAJXwT5W+IyMvgWwGaVWRrGQ63Iatp6sYeqEWkqxDbP9BeHK2vTNxlaV6/k9wbD/bBhApWu+e QeOcmy3vUglAXXM/9X579wHXS7HCDY9J42QCgw99FfXRS6NaSiZTyit
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

VDSO time functions do not call any other function, so they don't
need to save/restore LR. However, retrieving the address of VDSO data
page requires using LR hence saving then restoring it, which can be
heavy on some CPUs. On the other hand, VDSO functions on powerpc are
not standard functions and require a wrapper function to call C VDSO
functions. And that wrapper has to save and restore LR in order to
call the C VDSO function, so retrieving VDSO data page address in that
wrapper doesn't require additional save/restore of LR.

For random VDSO functions it is a bit different. Because the function
calls __arch_chacha20_blocks_nostack(), it saves and restores LR.
Retrieving VDSO data page address can then be done there without
additional save/restore of LR.

So lets implement __arch_get_vdso_rng_data() and simplify the wrapper.

It starts paving the way for the day powerpc will implement a more
standard ABI for VDSO functions.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso/getrandom.h | 15 +++++++++++++--
 arch/powerpc/kernel/asm-offsets.c         |  1 -
 arch/powerpc/kernel/vdso/getrandom.S      |  1 -
 arch/powerpc/kernel/vdso/vgetrandom.c     |  4 ++--
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso/getrandom.h b/arch/powerpc/include/asm/vdso/getrandom.h
index 501d6bb14e8a..4302e7c67aa5 100644
--- a/arch/powerpc/include/asm/vdso/getrandom.h
+++ b/arch/powerpc/include/asm/vdso/getrandom.h
@@ -7,6 +7,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <asm/vdso_datapage.h>
+
 static __always_inline int do_syscall_3(const unsigned long _r0, const unsigned long _r3,
 					const unsigned long _r4, const unsigned long _r5)
 {
@@ -43,11 +45,20 @@ static __always_inline ssize_t getrandom_syscall(void *buffer, size_t len, unsig
 
 static __always_inline struct vdso_rng_data *__arch_get_vdso_rng_data(void)
 {
-	return NULL;
+	struct vdso_arch_data *data;
+
+	asm(
+		"	bcl	20, 31, .+4\n"
+		"0:	mflr	%0\n"
+		"	addis	%0, %0, (_vdso_datapage - 0b)@ha\n"
+		"	addi	%0, %0, (_vdso_datapage - 0b)@l\n"
+	: "=r" (data) :: "lr");
+
+	return &data->rng_data;
 }
 
 ssize_t __c_kernel_getrandom(void *buffer, size_t len, unsigned int flags, void *opaque_state,
-			     size_t opaque_len, const struct vdso_rng_data *vd);
+			     size_t opaque_len);
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 131a8cc10dbe..7b3feb6bc210 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -335,7 +335,6 @@ int main(void)
 
 	/* datapage offsets for use by vdso */
 	OFFSET(VDSO_DATA_OFFSET, vdso_arch_data, data);
-	OFFSET(VDSO_RNG_DATA_OFFSET, vdso_arch_data, rng_data);
 	OFFSET(CFG_TB_TICKS_PER_SEC, vdso_arch_data, tb_ticks_per_sec);
 #ifdef CONFIG_PPC64
 	OFFSET(CFG_ICACHE_BLOCKSZ, vdso_arch_data, icache_block_size);
diff --git a/arch/powerpc/kernel/vdso/getrandom.S b/arch/powerpc/kernel/vdso/getrandom.S
index 3deddcf89f99..a80d9fb436f7 100644
--- a/arch/powerpc/kernel/vdso/getrandom.S
+++ b/arch/powerpc/kernel/vdso/getrandom.S
@@ -31,7 +31,6 @@
 	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
   .cfi_rel_offset r2, PPC_MIN_STKFRM + STK_GOT
 #endif
-	get_datapage	r8 VDSO_RNG_DATA_OFFSET
 	bl		CFUNC(DOTSYM(\funct))
 	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
 #ifdef __powerpc64__
diff --git a/arch/powerpc/kernel/vdso/vgetrandom.c b/arch/powerpc/kernel/vdso/vgetrandom.c
index 5f855d45fb7b..cc79b960a541 100644
--- a/arch/powerpc/kernel/vdso/vgetrandom.c
+++ b/arch/powerpc/kernel/vdso/vgetrandom.c
@@ -8,7 +8,7 @@
 #include <linux/types.h>
 
 ssize_t __c_kernel_getrandom(void *buffer, size_t len, unsigned int flags, void *opaque_state,
-			     size_t opaque_len, const struct vdso_rng_data *vd)
+			     size_t opaque_len)
 {
-	return __cvdso_getrandom_data(vd, buffer, len, flags, opaque_state, opaque_len);
+	return __cvdso_getrandom(buffer, len, flags, opaque_state, opaque_len);
 }
-- 
2.44.0


