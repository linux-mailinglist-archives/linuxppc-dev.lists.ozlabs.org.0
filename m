Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E59834C14F3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 15:01:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3d4T240zz3cbG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 01:01:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dsv3iiad;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dsv3iiad; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3d1S6fJNz30RR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 00:58:51 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id bu29so31336186lfb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 05:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CSKUh2BU9xMq0DVX1xdjzBHoNW9smB7DNxTj2AmX0xo=;
 b=dsv3iiadpfx0IcM/ZUgUymrBslVkMhGi5b5L7Pumfi7n3wxnbh/nnZfbLb5gBuk1zr
 GK0PVGUn5QzmDMwiA7i03tT/sngigsiv2rty4N2Y5EGR8XVoTnDOZrmbq0raIFaU7LGY
 bChdcqfgZYxtFgc1AFQz+WgSpZ4kFa3KEYAWUTe9UzPaQo3PqqoaoUazKUxWIVbcDFgg
 MHX4x6GcC6jM3Y/S8r4v18gShToXcD31EG8PeIUjKM9R66rBmd2LsTOxTpxifbMCkaXW
 OtlzdhKGSnlBNQ/nQjxjiPJPF4SC9r0C1wX3Ka9TuI+3dSsnEVV/tbOIj661IumtYdjh
 SuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CSKUh2BU9xMq0DVX1xdjzBHoNW9smB7DNxTj2AmX0xo=;
 b=ZIiAAFaGH2XaOfy1zoEY5Vcnbp7arBOIQKnoJxru/b0P/eig6Mcp0cgFRN+ZoQ/7WV
 xcoCWcKi0l00RDGYmsw2IyY+90e4/CXzc6vDho0jMWmgR5548cpq7D9/yYLtzPUj8kja
 kF/PG5Y+Oar0cVHO0tNKmTfVrSvcghSv+bYd8sDxtR2er+hnPZHdnomgtfLocGhYufiR
 OxTYtRTKRiM/NjMODl8JDnHeADTzkUaYITjA4Yw+4WYxEO1wmW7XvM9eKjJMwX8FsyZs
 GtSSfYTHbHipBp9Qu0DYPysg5cXJOzm3QLi0yDMXEKff2IKCPEEqftr7Hc9trI4bUnst
 e8vQ==
X-Gm-Message-State: AOAM530V9OAA/FtZd+KAbNadKH65aQvdiFkGqwQa3S3MGio9Wl8j8q/F
 rUSWZeBlWzlZBwLrYky6wxVaxA==
X-Google-Smtp-Source: ABdhPJydAB/8N133DHLT7WvH+zYQH2vOgCi4oOdyd7w/3PUAYN9MzkGpnIxwgGf00sw1mGvM7X3mTA==
X-Received: by 2002:a05:6512:3d90:b0:437:73cb:8e76 with SMTP id
 k16-20020a0565123d9000b0043773cb8e76mr20951209lfv.187.1645624724990; 
 Wed, 23 Feb 2022 05:58:44 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id c14sm994079lfs.275.2022.02.23.05.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 05:58:44 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: mpe@ellerman.id.au
Subject: [PATCH 2/3] powerpc: fix build errors
Date: Wed, 23 Feb 2022 14:58:19 +0100
Message-Id: <20220223135820.2252470-2-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220223135820.2252470-1-anders.roxell@linaro.org>
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building tinyconfig with gcc (Debian 11.2.0-16) and assembler (Debian
2.37.90.20220207) the following build error shows up:

 {standard input}: Assembler messages:
 {standard input}:1190: Error: unrecognized opcode: `stbcix'
 {standard input}:1433: Error: unrecognized opcode: `lwzcix'
 {standard input}:1453: Error: unrecognized opcode: `stbcix'
 {standard input}:1460: Error: unrecognized opcode: `stwcix'
 {standard input}:1596: Error: unrecognized opcode: `stbcix'
 ...

Rework to add assembler directives [1] around the instruction. Going
through the them one by one shows that the changes should be safe.  Like
__get_user_atomic_128_aligned() is only called in p9_hmi_special_emu(),
which according to the name is specific to power9.  And __raw_rm_read*()
are only called in things that are powernv or book3s_hv specific.

[1] https://sourceware.org/binutils/docs/as/PowerPC_002dPseudo.html#PowerPC_002dPseudo

Cc: <stable@vger.kernel.org>
Co-developed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/powerpc/include/asm/io.h        | 46 +++++++++++++++++++++++-----
 arch/powerpc/include/asm/uaccess.h   |  3 ++
 arch/powerpc/platforms/powernv/rng.c |  6 +++-
 3 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index beba4979bff9..5ff6dec489f8 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -359,25 +359,37 @@ static inline void __raw_writeq_be(unsigned long v, volatile void __iomem *addr)
  */
 static inline void __raw_rm_writeb(u8 val, volatile void __iomem *paddr)
 {
-	__asm__ __volatile__("stbcix %0,0,%1"
+	__asm__ __volatile__(".machine \"push\"\n"
+			     ".machine \"power6\"\n"
+			     "stbcix %0,0,%1\n"
+			     ".machine \"pop\"\n"
 		: : "r" (val), "r" (paddr) : "memory");
 }
 
 static inline void __raw_rm_writew(u16 val, volatile void __iomem *paddr)
 {
-	__asm__ __volatile__("sthcix %0,0,%1"
+	__asm__ __volatile__(".machine \"push\"\n"
+			     ".machine \"power6\"\n"
+			     "sthcix %0,0,%1\n"
+			     ".machine \"pop\"\n"
 		: : "r" (val), "r" (paddr) : "memory");
 }
 
 static inline void __raw_rm_writel(u32 val, volatile void __iomem *paddr)
 {
-	__asm__ __volatile__("stwcix %0,0,%1"
+	__asm__ __volatile__(".machine \"push\"\n"
+			     ".machine \"power6\"\n"
+			     "stwcix %0,0,%1\n"
+			     ".machine \"pop\"\n"
 		: : "r" (val), "r" (paddr) : "memory");
 }
 
 static inline void __raw_rm_writeq(u64 val, volatile void __iomem *paddr)
 {
-	__asm__ __volatile__("stdcix %0,0,%1"
+	__asm__ __volatile__(".machine \"push\"\n"
+			     ".machine \"power6\"\n"
+			     "stdcix %0,0,%1\n"
+			     ".machine \"pop\"\n"
 		: : "r" (val), "r" (paddr) : "memory");
 }
 
@@ -389,7 +401,10 @@ static inline void __raw_rm_writeq_be(u64 val, volatile void __iomem *paddr)
 static inline u8 __raw_rm_readb(volatile void __iomem *paddr)
 {
 	u8 ret;
-	__asm__ __volatile__("lbzcix %0,0, %1"
+	__asm__ __volatile__(".machine \"push\"\n"
+			     ".machine \"power6\"\n"
+			     "lbzcix %0,0, %1\n"
+			     ".machine \"pop\"\n"
 			     : "=r" (ret) : "r" (paddr) : "memory");
 	return ret;
 }
@@ -397,7 +412,10 @@ static inline u8 __raw_rm_readb(volatile void __iomem *paddr)
 static inline u16 __raw_rm_readw(volatile void __iomem *paddr)
 {
 	u16 ret;
-	__asm__ __volatile__("lhzcix %0,0, %1"
+	__asm__ __volatile__(".machine \"push\"\n"
+			     ".machine \"power6\"\n"
+			     "lhzcix %0,0, %1\n"
+			     ".machine \"pop\"\n"
 			     : "=r" (ret) : "r" (paddr) : "memory");
 	return ret;
 }
@@ -405,7 +423,10 @@ static inline u16 __raw_rm_readw(volatile void __iomem *paddr)
 static inline u32 __raw_rm_readl(volatile void __iomem *paddr)
 {
 	u32 ret;
-	__asm__ __volatile__("lwzcix %0,0, %1"
+	__asm__ __volatile__(".machine \"push\"\n"
+			     ".machine \"power6\"\n"
+			     "lwzcix %0,0, %1\n"
+			     ".machine \"pop\"\n"
 			     : "=r" (ret) : "r" (paddr) : "memory");
 	return ret;
 }
@@ -413,7 +434,10 @@ static inline u32 __raw_rm_readl(volatile void __iomem *paddr)
 static inline u64 __raw_rm_readq(volatile void __iomem *paddr)
 {
 	u64 ret;
-	__asm__ __volatile__("ldcix %0,0, %1"
+	__asm__ __volatile__(".machine \"push\"\n"
+			     ".machine \"power6\"\n"
+			     "ldcix %0,0, %1\n"
+			     ".machine \"pop\"\n"
 			     : "=r" (ret) : "r" (paddr) : "memory");
 	return ret;
 }
@@ -441,7 +465,10 @@ static inline unsigned int name(unsigned int port)	\
 	unsigned int x;					\
 	__asm__ __volatile__(				\
 		"sync\n"				\
+		".machine \"push\"\n"			\
+		".machine \"power6\"\n"			\
 		"0:"	op "	%0,0,%1\n"		\
+		".machine \"pop\"\n"			\
 		"1:	twi	0,%0,0\n"		\
 		"2:	isync\n"			\
 		"3:	nop\n"				\
@@ -465,7 +492,10 @@ static inline void name(unsigned int val, unsigned int port) \
 {							\
 	__asm__ __volatile__(				\
 		"sync\n"				\
+		".machine \"push\"\n"			\
+		".machine \"power6\"\n"			\
 		"0:" op " %0,0,%1\n"			\
+		".machine \"pop\"\n"			\
 		"1:	sync\n"				\
 		"2:\n"					\
 		EX_TABLE(0b, 2b)			\
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 63316100080c..03ea552d535b 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -125,8 +125,11 @@ do {								\
  */
 #define __get_user_atomic_128_aligned(kaddr, uaddr, err)		\
 	__asm__ __volatile__(				\
+		".machine \"push\"\n"			\
+		".machine \"altivec\"\n"			\
 		"1:	lvx  0,0,%1	# get user\n"	\
 		" 	stvx 0,0,%2	# put kernel\n"	\
+		".machine \"pop\"\n"			\
 		"2:\n"					\
 		".section .fixup,\"ax\"\n"		\
 		"3:	li %0,%3\n"			\
diff --git a/arch/powerpc/platforms/powernv/rng.c b/arch/powerpc/platforms/powernv/rng.c
index b4386714494a..5bf30ef6d928 100644
--- a/arch/powerpc/platforms/powernv/rng.c
+++ b/arch/powerpc/platforms/powernv/rng.c
@@ -43,7 +43,11 @@ static unsigned long rng_whiten(struct powernv_rng *rng, unsigned long val)
 	unsigned long parity;
 
 	/* Calculate the parity of the value */
-	asm ("popcntd %0,%1" : "=r" (parity) : "r" (val));
+	asm (".machine \"push\"\n"
+	     ".machine \"power7\"\n"
+	     "popcntd %0,%1\n"
+	     ".machine \"pop\"\n"
+	     : "=r" (parity) : "r" (val));
 
 	/* xor our value with the previous mask */
 	val ^= rng->mask;
-- 
2.34.1

