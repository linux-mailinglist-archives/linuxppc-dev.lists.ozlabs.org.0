Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AAD5BC280
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 07:28:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWCrs5JVKz3bmC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 15:28:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PnN2hYob;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWCrD1Kz5z2yng
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 15:28:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PnN2hYob;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MWCr64NBrz4xG7;
	Mon, 19 Sep 2022 15:28:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663565287;
	bh=CjNaQA63u69dhCFibvVCgS21xz2Yq1hEiJYwePE/MuI=;
	h=From:To:Cc:Subject:Date:From;
	b=PnN2hYobSPLd1iU77wdN8l8XWpowJVfI9kH874jUCcg/sThBI/ib374IDF8Mg0kZx
	 fLFSqhYFWB0MupgxYerCXHxNdj7tpCLLlzMruLpkPgElk/GJ2fOXq2xEOWWBpjnuMp
	 c0d9QK8HqhMG2iDNwRZ5cO9VDAzr5KJrLkaLaULWT42EAnvUkHuRZHYTNw+L9sCPJr
	 s6ar8NPxg0NygDIVcgE6LvEFQvSlRGL9OQbhB3BsUVgk2WcsC2u69AX40XK1RC4OB5
	 GxbkMqHEOSj7JwYeE6CvDla8s8/zNcnqAKdr6VGq2LgEn13YtBMVyL3jSloJ44TCkm
	 EZNwCw00LuuLA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/microwatt: Remove unused early debug code
Date: Mon, 19 Sep 2022 15:27:55 +1000
Message-Id: <20220919052755.800907-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.2
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
Cc: lukas.bulwahn@gmail.com, andrew.donnellan@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The original microwatt submission[1] included some early debug code for
using the Microwatt "potato" UART.

The series that was eventually merged switched to using a standard UART,
and so doesn't need any special early debug handling. But some of the
original code was merged accidentally under the non-existent
CONFIG_PPC_EARLY_DEBUG_MICROWATT.

Drop the unused code.

1: https://lore.kernel.org/linuxppc-dev/20200509050340.GD1464954@thinks.paulus.ozlabs.org/

Fixes: 48b545b8018d ("powerpc/microwatt: Use standard 16550 UART for console")
Reported-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/udbg_16550.c | 39 --------------------------------
 1 file changed, 39 deletions(-)

diff --git a/arch/powerpc/kernel/udbg_16550.c b/arch/powerpc/kernel/udbg_16550.c
index d3942de254c6..ddfbc74bf85f 100644
--- a/arch/powerpc/kernel/udbg_16550.c
+++ b/arch/powerpc/kernel/udbg_16550.c
@@ -296,42 +296,3 @@ void __init udbg_init_40x_realmode(void)
 }
 
 #endif /* CONFIG_PPC_EARLY_DEBUG_40x */
-
-#ifdef CONFIG_PPC_EARLY_DEBUG_MICROWATT
-
-#define UDBG_UART_MW_ADDR	((void __iomem *)0xc0002000)
-
-static u8 udbg_uart_in_isa300_rm(unsigned int reg)
-{
-	uint64_t msr = mfmsr();
-	uint8_t  c;
-
-	mtmsr(msr & ~(MSR_EE|MSR_DR));
-	isync();
-	eieio();
-	c = __raw_rm_readb(UDBG_UART_MW_ADDR + (reg << 2));
-	mtmsr(msr);
-	isync();
-	return c;
-}
-
-static void udbg_uart_out_isa300_rm(unsigned int reg, u8 val)
-{
-	uint64_t msr = mfmsr();
-
-	mtmsr(msr & ~(MSR_EE|MSR_DR));
-	isync();
-	eieio();
-	__raw_rm_writeb(val, UDBG_UART_MW_ADDR + (reg << 2));
-	mtmsr(msr);
-	isync();
-}
-
-void __init udbg_init_debug_microwatt(void)
-{
-	udbg_uart_in = udbg_uart_in_isa300_rm;
-	udbg_uart_out = udbg_uart_out_isa300_rm;
-	udbg_use_uart();
-}
-
-#endif /* CONFIG_PPC_EARLY_DEBUG_MICROWATT */
-- 
2.37.2

