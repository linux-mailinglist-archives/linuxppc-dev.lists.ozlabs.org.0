Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819F5EC734
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 17:05:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McNGb0tkjz3cBK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 01:05:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=A5kQB/cq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McNFN70Stz2xy4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 01:04:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=A5kQB/cq;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4McNFM5Y11z4x1G;
	Wed, 28 Sep 2022 01:04:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664291063;
	bh=upU1w49APxlT8HT6dYAVXpqdESYFhvRCGAGzgqHKNFg=;
	h=From:To:Cc:Subject:Date:From;
	b=A5kQB/cqZV6ufUGRWV7HN71jfX0pdfgA1SdBO0TtH8DQwAIJEhG6cs/9nIYHHn644
	 oDEBwr1giIqcKtfnViCqt8ib9/qpnGENg5O21W8F3/H5o2VB+4otQnm79uwW2X33g3
	 iDGU8bP3WWnPgmulIuyzn1L0wpl2pmLFqTSqDGXIS9JnG4UeGpwcbVMNyZYC6oRP22
	 K5+JF3NktIuuEGU9TqcA8cIfRiWetvuIdY6OLDZBaPBIyhtAIMS/Ju+wFElZG4XYRu
	 4yz8qpYlqffGQ6s85KVn+ihGikewmJXdrJPtJ1s0L3nNE8XxfH8m3MzQgBZnsgU8HQ
	 mPQRX5MFCTDtg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] powerpc: Make stack frame marker upper case
Date: Wed, 28 Sep 2022 01:04:18 +1000
Message-Id: <20220927150419.1503001-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that the stack frame regs marker is only 32-bits it is not as
obvious in memory dumps and easier to miss, eg:

  c000000004733e40 0000000000000000 0000000000000000  |................|
  c000000004733e50 0000000000000000 0000000000000000  |................|
  c000000004733e60 0000000000000000 0000000000000000  |................|
  c000000004733e70 7367657200000000 0000000000000000  |sger............|
  c000000004733e80 a700000000000000 708897f7ff7f0000  |........p.......|
  c000000004733e90 0073428fff7f0000 208997f7ff7f0000  |.sB..... .......|
  c000000004733ea0 0100000000000000 ffffffffffffffff  |................|
  c000000004733eb0 0000000000000000 0000000000000000  |................|

So make it upper case to make it stand out a bit more:

  c000000004733e70 5347455200000000 0000000000000000  |SGER............|

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/ptrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 5b496e589d54..6c23d1d25dc7 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -99,7 +99,7 @@ struct pt_regs
 
 #define STACK_FRAME_WITH_PT_REGS (STACK_FRAME_OVERHEAD + sizeof(struct pt_regs))
 
-#define STACK_FRAME_REGS_MARKER	ASM_CONST(0x72656773)
+#define STACK_FRAME_REGS_MARKER	ASM_CONST(0x52454753)
 
 #ifdef __powerpc64__
 
-- 
2.37.3

