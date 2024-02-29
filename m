Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2745F86C92F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 13:26:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BNlK/dFR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlr7T5nDlz3vdC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 23:26:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BNlK/dFR;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlr614XZmz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 23:25:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709209529;
	bh=d8DMBmw30boXs+gg+sMlFV3Oee8eKnf7k8zk1T/y2xM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BNlK/dFRLZ0iPQD8F/HHOvKJNwtzkTCjFQ3wV7WQ/LfB+D8mhxVTg6mWOQ0xCugwt
	 /YGjpb4ZrK0anxYySVXzdE6s55DfvfV/26pNYk0T+sOWM6f+5Kac2MjuEChtrRU4pC
	 D3NA9WjKDDgAXpjNJHCRd4kFRWFPMRjNzsvKYH9fSeIe4oia18YI0WDseNbullcRJg
	 YisGemZvvBV3wgNbROpfqJrMMH/YEXCQ9ts7rdofrzPfI92NZPQ5p+e/dcqBvg1HK6
	 o2YZlORRGkdlO3lPce3705h+cwovol6lI93k8Pa3TPWGfjzNrxtnENaD0HivPlm3mV
	 R7Z82nQPqNqYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tlr6138V3z4wcb;
	Thu, 29 Feb 2024 23:25:29 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/5] powerpc/fsl: Fix mfpmr build errors with newer binutils
Date: Thu, 29 Feb 2024 23:25:19 +1100
Message-ID: <20240229122521.762431-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240229122521.762431-1-mpe@ellerman.id.au>
References: <20240229122521.762431-1-mpe@ellerman.id.au>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Binutils 2.38 complains about the use of mfpmr when building
ppc6xx_defconfig:

    CC      arch/powerpc/kernel/pmc.o
  {standard input}: Assembler messages:
  {standard input}:45: Error: unrecognized opcode: `mfpmr'
  {standard input}:56: Error: unrecognized opcode: `mtpmr'

This is because by default the kernel is built with -mcpu=powerpc, and
the mt/mfpmr instructions are not defined.

It can be avoided by enabling CONFIG_E300C3_CPU, but just adding that to
the defconfig will leave open the possibility of randconfig failures.

So add machine directives around the mt/mfpmr instructions to tell
binutils how to assemble them.

Cc: stable@vger.kernel.org
Reported-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/reg_fsl_emb.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/reg_fsl_emb.h b/arch/powerpc/include/asm/reg_fsl_emb.h
index a21f529c43d9..8359c06d92d9 100644
--- a/arch/powerpc/include/asm/reg_fsl_emb.h
+++ b/arch/powerpc/include/asm/reg_fsl_emb.h
@@ -12,9 +12,16 @@
 #ifndef __ASSEMBLY__
 /* Performance Monitor Registers */
 #define mfpmr(rn)	({unsigned int rval; \
-			asm volatile("mfpmr %0," __stringify(rn) \
+			asm volatile(".machine push; " \
+				     ".machine e300; " \
+				     "mfpmr %0," __stringify(rn) ";" \
+				     ".machine pop; " \
 				     : "=r" (rval)); rval;})
-#define mtpmr(rn, v)	asm volatile("mtpmr " __stringify(rn) ",%0" : : "r" (v))
+#define mtpmr(rn, v)	asm volatile(".machine push; " \
+				     ".machine e300; " \
+				     "mtpmr " __stringify(rn) ",%0; " \
+				     ".machine pop; " \
+				     : : "r" (v))
 #endif /* __ASSEMBLY__ */
 
 /* Freescale Book E Performance Monitor APU Registers */
-- 
2.43.2

