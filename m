Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D90A4C3127
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 17:24:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4JC23qZhz3cY7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 03:24:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m/r5a9Wy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=m/r5a9Wy; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4J911dn6z30DX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 03:22:44 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id d23so4729239lfv.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 08:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8iFz8OejFA6DX9qXi4bQtBNaigBN1GDlBFEToUXGY3Q=;
 b=m/r5a9WyEVahimcDrZ+I4kJ+LN5cBWUrcwkSOYJNGjLFuEihkwHAmdn4TmcJQatFmI
 iJxxXr3qTsESDM74BAln0qM6OAD6wcNOTgIt+Pi5Uf46pLxlbvkff+J5tfM09G7NRc/K
 pMyLOVPaPukn9OTEQrvxsNvp+jhK1d4R2CKv0MZCys2z0XWqYOZYUI1vJ3DGr8sN4a/w
 TzxvadnG+pes4kBwh0Slizq3PEfC1CBU4zNlGoNDM4DDrDfjbAnyUwLV9ZqgJrHtOkTw
 7sPw6x6j+46l2j40lcmS6ciEvtj1buqo5Vh66VgSW53OOnYIpDMhP3ZG7bhuWj2OWnQT
 XRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8iFz8OejFA6DX9qXi4bQtBNaigBN1GDlBFEToUXGY3Q=;
 b=L6U5kC7mldsaX2Z7vf8EdKhhzBWPS/sLmYgPssN5CZVd7lfX8kUwgUMtFLzcyvm989
 TdzlKTvQKirQZeEVY3RR6vG9TPNWLHDSZwnOynCHJVw/+DXfd84mln8ZU5VmpvSHpvkE
 Frlm9ZvGPkxRFFtVwMMIlXvk833lR/TS6y7NLoSqNyg8DE/cEC2zzf0UQilENAXcl3Fw
 WKYkTX6Z7cz/FZtWKE97wFRGGeWZ8xNEbLMyj9i9EKjgumQVVRc27PREm0OxyO1K4n4X
 GQFB7T+bc35A5VoWuaJPBVbaNWPPUql90ZMW5Ud5EbEfjHluPzUS0QiHAXpTrLQXk0K6
 A3Yw==
X-Gm-Message-State: AOAM531LpBk3xbqXx9nli+S+27T0gsxrVpR3M1MGmVXfLqajvXpUu+0Q
 lI/OcjHTRi41paGD0tkAckYIOg==
X-Google-Smtp-Source: ABdhPJxM9Mr69FsUxMrjzwl+vN04ZCx0HQBkHsmr2jnNDhpL/c69hBp6L0yBwPwPAABLQy5SGzYEoA==
X-Received: by 2002:a05:6512:2306:b0:443:3db8:d6c8 with SMTP id
 o6-20020a056512230600b004433db8d6c8mr2302641lfu.161.1645719757815; 
 Thu, 24 Feb 2022 08:22:37 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id i17sm241327lfu.207.2022.02.24.08.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 08:22:37 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: mpe@ellerman.id.au
Subject: [PATCHv2 2/3] powerpc: fix build errors
Date: Thu, 24 Feb 2022 17:22:14 +0100
Message-Id: <20220224162215.3406642-2-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220224162215.3406642-1-anders.roxell@linaro.org>
References: <20220224162215.3406642-1-anders.roxell@linaro.org>
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
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
Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/powerpc/include/asm/io.h        | 40 ++++++++++++++++++++++------
 arch/powerpc/include/asm/uaccess.h   |  3 +++
 arch/powerpc/platforms/powernv/rng.c |  6 ++++-
 3 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index beba4979bff9..fee979d3a1aa 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -359,25 +359,37 @@ static inline void __raw_writeq_be(unsigned long v, volatile void __iomem *addr)
  */
 static inline void __raw_rm_writeb(u8 val, volatile void __iomem *paddr)
 {
-	__asm__ __volatile__("stbcix %0,0,%1"
+	__asm__ __volatile__(".machine push;   \
+			      .machine power6; \
+			      stbcix %0,0,%1;  \
+			      .machine pop;"
 		: : "r" (val), "r" (paddr) : "memory");
 }
 
 static inline void __raw_rm_writew(u16 val, volatile void __iomem *paddr)
 {
-	__asm__ __volatile__("sthcix %0,0,%1"
+	__asm__ __volatile__(".machine push;   \
+			      .machine power6; \
+			      sthcix %0,0,%1;  \
+			      .machine pop;"
 		: : "r" (val), "r" (paddr) : "memory");
 }
 
 static inline void __raw_rm_writel(u32 val, volatile void __iomem *paddr)
 {
-	__asm__ __volatile__("stwcix %0,0,%1"
+	__asm__ __volatile__(".machine push;   \
+			      .machine power6; \
+			      stwcix %0,0,%1;  \
+			      .machine pop;"
 		: : "r" (val), "r" (paddr) : "memory");
 }
 
 static inline void __raw_rm_writeq(u64 val, volatile void __iomem *paddr)
 {
-	__asm__ __volatile__("stdcix %0,0,%1"
+	__asm__ __volatile__(".machine push;   \
+			      .machine power6; \
+			      stdcix %0,0,%1;  \
+			      .machine pop;"
 		: : "r" (val), "r" (paddr) : "memory");
 }
 
@@ -389,7 +401,10 @@ static inline void __raw_rm_writeq_be(u64 val, volatile void __iomem *paddr)
 static inline u8 __raw_rm_readb(volatile void __iomem *paddr)
 {
 	u8 ret;
-	__asm__ __volatile__("lbzcix %0,0, %1"
+	__asm__ __volatile__(".machine push;   \
+			      .machine power6; \
+			      lbzcix %0,0, %1; \
+			      .machine pop;"
 			     : "=r" (ret) : "r" (paddr) : "memory");
 	return ret;
 }
@@ -397,7 +412,10 @@ static inline u8 __raw_rm_readb(volatile void __iomem *paddr)
 static inline u16 __raw_rm_readw(volatile void __iomem *paddr)
 {
 	u16 ret;
-	__asm__ __volatile__("lhzcix %0,0, %1"
+	__asm__ __volatile__(".machine push;   \
+			      .machine power6; \
+			      lhzcix %0,0, %1; \
+			      .machine pop;"
 			     : "=r" (ret) : "r" (paddr) : "memory");
 	return ret;
 }
@@ -405,7 +423,10 @@ static inline u16 __raw_rm_readw(volatile void __iomem *paddr)
 static inline u32 __raw_rm_readl(volatile void __iomem *paddr)
 {
 	u32 ret;
-	__asm__ __volatile__("lwzcix %0,0, %1"
+	__asm__ __volatile__(".machine push;   \
+			      .machine power6; \
+			      lwzcix %0,0, %1; \
+			      .machine pop;"
 			     : "=r" (ret) : "r" (paddr) : "memory");
 	return ret;
 }
@@ -413,7 +434,10 @@ static inline u32 __raw_rm_readl(volatile void __iomem *paddr)
 static inline u64 __raw_rm_readq(volatile void __iomem *paddr)
 {
 	u64 ret;
-	__asm__ __volatile__("ldcix %0,0, %1"
+	__asm__ __volatile__(".machine push;   \
+			      .machine power6; \
+			      ldcix %0,0, %1;  \
+			      .machine pop;"
 			     : "=r" (ret) : "r" (paddr) : "memory");
 	return ret;
 }
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 63316100080c..4a35423f766d 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -125,8 +125,11 @@ do {								\
  */
 #define __get_user_atomic_128_aligned(kaddr, uaddr, err)		\
 	__asm__ __volatile__(				\
+		".machine push\n"			\
+		".machine altivec\n"			\
 		"1:	lvx  0,0,%1	# get user\n"	\
 		" 	stvx 0,0,%2	# put kernel\n"	\
+		".machine pop\n"			\
 		"2:\n"					\
 		".section .fixup,\"ax\"\n"		\
 		"3:	li %0,%3\n"			\
diff --git a/arch/powerpc/platforms/powernv/rng.c b/arch/powerpc/platforms/powernv/rng.c
index b4386714494a..e3d44b36ae98 100644
--- a/arch/powerpc/platforms/powernv/rng.c
+++ b/arch/powerpc/platforms/powernv/rng.c
@@ -43,7 +43,11 @@ static unsigned long rng_whiten(struct powernv_rng *rng, unsigned long val)
 	unsigned long parity;
 
 	/* Calculate the parity of the value */
-	asm ("popcntd %0,%1" : "=r" (parity) : "r" (val));
+	asm (".machine push;   \
+	      .machine power7; \
+	      popcntd %0,%1;   \
+	      .machine pop;"
+	     : "=r" (parity) : "r" (val));
 
 	/* xor our value with the previous mask */
 	val ^= rng->mask;
-- 
2.34.1

