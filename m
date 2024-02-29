Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 282BD86C92E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 13:26:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QLO6sVEW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlr6j1FNSz3fFT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 23:26:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QLO6sVEW;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlr611Q6Lz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 23:25:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709209529;
	bh=14+QqclUsCi4yH6p5bv4Pi+DXwSgycFxCOP9S2+vvoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QLO6sVEWC4XB6PNIQ+3jq21IDOAEbpu/WPyavQpXfyGtA+fvzF3611Cti4E7V5R6U
	 vYU+e0SlKDJcK9njUr4TStNJd6XBowANg1zAddOQ3vLVOT0ZwV2be0PREkZVPv2h8N
	 j9lHh8pMEM0jnY3bXGlvSQ9lzpxyWGDwN/QwZ4TnyWtvI2e2HLvOS0RgoN0FGDX4xg
	 2g7qM/DGvAe+gbVRyqnaPcW3DDwNo8if236PQmytqY+QOasUvnrpbIhpKh0bhmdq4T
	 epMOwEN85ZjtJ4EEnQUu9E0G9/BZvpwLOj6t8hD5F++ksH+ioE5S39H0VhNlrTW5zr
	 5kfXbkcLpHvrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tlr6103QJz4wc9;
	Thu, 29 Feb 2024 23:25:28 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/5] powerpc/64s: Use .machine power4 around dcbt
Date: Thu, 29 Feb 2024 23:25:18 +1100
Message-ID: <20240229122521.762431-2-mpe@ellerman.id.au>
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

There are multiple decodings for the "dcbt" mnemonic, so the assembler
has to pick one.

That requires passing -many to the assembler, which is not recommended.

Without -many the clang 14 / binutils 2.38 build fails with:

  arch/powerpc/kernel/exceptions-64s.S:2976: Error: junk at end of line: `0b01010'
  clang: error: assembler command failed with exit code 1 (use -v to see invocation)

Fix it by adding .machine directives around the use of dcbt to specify
which encoding is desired.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/ppc_asm.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 78c7548eac1e..1d1018c1e482 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -508,11 +508,16 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
  */
 #define DCBT_BOOK3S_STOP_ALL_STREAM_IDS(scratch)	\
        lis     scratch,0x60000000@h;			\
-       dcbt    0,scratch,0b01010
+       .machine push;					\
+       .machine power4;					\
+       dcbt    0,scratch,0b01010;			\
+       .machine pop;
 
 #define DCBT_SETUP_STREAMS(from, from_parms, to, to_parms, scratch)	\
 	lis	scratch,0x8000;	/* GO=1 */				\
 	clrldi	scratch,scratch,32;					\
+	.machine push;							\
+	.machine power4;						\
 	/* setup read stream 0 */					\
 	dcbt	0,from,0b01000;		/* addr from */			\
 	dcbt	0,from_parms,0b01010;	/* length and depth from */	\
@@ -520,7 +525,8 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 	dcbtst	0,to,0b01000;		/* addr to */			\
 	dcbtst	0,to_parms,0b01010;	/* length and depth to */	\
 	eieio;								\
-	dcbt	0,scratch,0b01010;	/* all streams GO */
+	dcbt	0,scratch,0b01010;	/* all streams GO */		\
+	.machine pop;
 
 /*
  * toreal/fromreal/tophys/tovirt macros. 32-bit BookE makes them
-- 
2.43.2

