Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DCE2C561C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 14:43:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Chf9J31glzDr0L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 00:43:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChdR25YRszDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 00:10:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=a89dLY0W; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4ChdR113XQz9sVm; Fri, 27 Nov 2020 00:10:21 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4ChdQz6cBZz9sW8; Fri, 27 Nov 2020 00:10:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606396219;
 bh=ccwRf4yyAQVimmUS04TbcdN2F1vSIan/H4HcS06ythc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a89dLY0WTYGY0wkvTMXBBV8qn0fex2czjXb8XhmQFFOhtnRFmrj+O40y7LaqggUAW
 c5qg9WBjwC+FTpbHBBLhX8aiV0yFg0WmJe31AniskmVT+kzb/9SP96boAhb1WJXiZS
 D+T1Bhs0PNOvHvfMSsv3/kL1SBsSzNYGkFt4+11ubdUFdcqBII0xNx8l3NIqpGP2/4
 IpWlZsIALcLCUvFdoR6KkxfnxBylrSW4b3ofLD0Xb6ejc90oM+Hd9mYtp26V4dUCjJ
 VxBff6lIHcrQdBMO4qii6ajm1Ptf+2BGWIMTGH5EoZRJq8AGT04fddpl+1igpXPC/x
 FndTmIAd22Haw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v14 4/9] powerpc/time: Fix mftb()/get_tb() for use with the
 compat VDSO
Date: Fri, 27 Nov 2020 00:10:01 +1100
Message-Id: <20201126131006.2431205-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126131006.2431205-1-mpe@ellerman.id.au>
References: <20201126131006.2431205-1-mpe@ellerman.id.au>
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

When we're building the compat VDSO we are building 32-bit code but in
the context of a 64-bit kernel configuration.

To make this work we need to be careful in some places when using
ifdefs to differentiate between CONFIG_PPC64 and __powerpc64__.

CONFIG_PPC64 indicates the kernel we're building is 64-bit, but it
doesn't tell us that we're currently building 64-bit code - we could
be building 32-bit code for the compat VDSO.

On the other hand __powerpc64__ tells us that we are currently
building 64-bit code (and therefore we must also be building a 64-bit
kernel).

In the case of get_tb() we want to use the 32-bit code sequence
regardless of whether the kernel we're building for is 64-bit or
32-bit, what matters is the word size of the current object. So we
need to check __powerpc64__ to decide if we use mftb() or the
mftbu()/mftb() sequence.

For mftb() the logic for CPU_FTR_CELL_TB_BUG only makes sense if we're
building 64-bit code, so guard that with a __powerpc64__ check.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/vdso/timebase.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

v14: new

diff --git a/arch/powerpc/include/asm/vdso/timebase.h b/arch/powerpc/include/asm/vdso/timebase.h
index ac6769b348c6..b558b07959ce 100644
--- a/arch/powerpc/include/asm/vdso/timebase.h
+++ b/arch/powerpc/include/asm/vdso/timebase.h
@@ -8,7 +8,11 @@
 
 #include <asm/reg.h>
 
-#if defined(CONFIG_PPC_CELL) || defined(CONFIG_E500)
+/*
+ * We use __powerpc64__ here because we want the compat VDSO to use the 32-bit
+ * version below in the else case of the ifdef.
+ */
+#if defined(__powerpc64__) && (defined(CONFIG_PPC_CELL) || defined(CONFIG_E500))
 #define mftb()		({unsigned long rval;				\
 			asm volatile(					\
 				"90:	mfspr %0, %2;\n"		\
@@ -49,7 +53,11 @@ static inline u64 get_tb(void)
 {
 	unsigned int tbhi, tblo, tbhi2;
 
-	if (IS_ENABLED(CONFIG_PPC64))
+	/*
+	 * We use __powerpc64__ here not CONFIG_PPC64 because we want the compat
+	 * VDSO to use the 32-bit compatible version in the while loop below.
+	 */
+	if (__is_defined(__powerpc64__))
 		return mftb();
 
 	do {
-- 
2.25.1

