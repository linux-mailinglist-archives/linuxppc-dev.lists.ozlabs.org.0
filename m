Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 464702C5529
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 14:22:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChdjH1PfWzDqwH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 00:22:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChdQx5SflzDqdq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 00:10:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pz3+/NEp; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4ChdQt6sHhz9sWH; Fri, 27 Nov 2020 00:10:14 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4ChdQt3t82z9sW0; Fri, 27 Nov 2020 00:10:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606396214;
 bh=qq7hhLkC8qUdifQdMcKmS47IL7EP4lwe09j/aldKieg=;
 h=From:To:Cc:Subject:Date:From;
 b=pz3+/NEpX+PddoqsuZ8vYQ/9MSHz/mr2gKgKycsLCdFob5T2ux/GMaeCXo2ova0sl
 chETkwOh/8nYhJ9z2FYBNaNbqBST+gUPRkdhzUG6EJGjiqTQWRWnbLzLBzizvnP4Gz
 OAavn03DykaYv8G5/GJkfMz6NENqLmVU7tE0BtrDZTfjSU3ySORSZA6lOoWJlt2we5
 LUqoYHbtXxlEIhYt34iqVWhFxaJNiSizvVN1ytG5LE278/D4aQOEDHatBEQDvE8D0Y
 fUtmrD5gyGBFcx7X+/DgPemOzVDhkehpBH+jY4bxdx7EBUSOubccHOfr7bXNdFd9FW
 cHykfNyNH9jOg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v14 1/9] powerpc/feature: Use CONFIG_PPC64 instead of
 __powerpc64__ to define possible features
Date: Fri, 27 Nov 2020 00:09:58 +1100
Message-Id: <20201126131006.2431205-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

In order to build VDSO32 for PPC64, we need to have CPU_FTRS_POSSIBLE
and CPU_FTRS_ALWAYS independant of whether we are building the
32 bits VDSO or the 64 bits VDSO.

Use #ifdef CONFIG_PPC64 instead of #ifdef __powerpc64__

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/08ffecd31403b3c692f25f97b07a378ba784873e.1604426550.git.christophe.leroy@csgroup.eu
---
 arch/powerpc/include/asm/cputable.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

v14: unchanged

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 5e31960a56a9..e069a2d9f7c1 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -488,7 +488,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_PURR | CPU_FTR_REAL_LE | CPU_FTR_DABRX)
 #define CPU_FTRS_COMPATIBLE	(CPU_FTR_PPCAS_ARCH_V2)
 
-#ifdef __powerpc64__
+#ifdef CONFIG_PPC64
 #ifdef CONFIG_PPC_BOOK3E
 #define CPU_FTRS_POSSIBLE	(CPU_FTRS_E6500 | CPU_FTRS_E5500)
 #else
@@ -545,7 +545,7 @@ enum {
 };
 #endif /* __powerpc64__ */
 
-#ifdef __powerpc64__
+#ifdef CONFIG_PPC64
 #ifdef CONFIG_PPC_BOOK3E
 #define CPU_FTRS_ALWAYS		(CPU_FTRS_E6500 & CPU_FTRS_E5500)
 #else
-- 
2.25.1

