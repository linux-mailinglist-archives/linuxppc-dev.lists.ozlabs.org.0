Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1FD69931F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 12:30:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHXmd581rz3f5k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 22:30:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ntZaZ/Dx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHXlj3xksz3cCn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 22:29:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ntZaZ/Dx;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PHXlj2l34z4x5R;
	Thu, 16 Feb 2023 22:29:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676546961;
	bh=MJg+NVCptueTf11a8bGsZHZAeSYHrag0mf9uzld260c=;
	h=From:To:Subject:Date:From;
	b=ntZaZ/DxUC+oUBtiWjiC+CPe76LCXVZzSDbOE3+6MVXLjdrYqGguBYMOaYzFdiCdv
	 BLRpVAbzcFn5yecVZogqXtfq2hUci5mSb34kuOCeq+OM8MIbzNWsWjclShqfEvGPYM
	 v8oIJ7L4alfsWpYIlDGEDkcurK0WBbeEdIcko9rzA/MVFvoZBks0KfEMdAlN+BVkMn
	 +V7C8/r6Kx2w387FD2+0+zNjfZ+rS4suQ8yXINHtBhiPSsOj35xyq+2h4tjpxT3QpB
	 +uLC2e8hNIjHYvkIxU4FE1EcUc2PRjxUjGkjXwCLOY/wMK6m+CDuwhxjVqkXUqMTcs
	 kpHXENJgS8nDg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/nohash: Fix build with llvm-as
Date: Thu, 16 Feb 2023 22:29:15 +1100
Message-Id: <20230216112915.1681631-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.1
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

When using the LLVM integrated assembler (llvm-as), the book3e build
fails with:

  arch/powerpc/mm/nohash/tlb_low_64e.S:354:2: error: invalid instruction
   tlbilxva 0,%r15
   ^

tlbilxva is an extended mnemonic for tlbilx, but llvm-as also doesn't
support tlbilx, despite it being an e500mc instruction.

Fix it by using the existing PPC_TLBILX_VA macro. The resulting binary
is identical when building with binutils.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/nohash/tlb_low_64e.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index 76cf456d7976..7e0b8fe1c279 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -351,7 +351,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_EMB_HV,CPU_FTR_EMB_HV,532)
 
 	mfspr	r15,SPRN_MAS2
 	isync
-	tlbilxva 0,r15
+	PPC_TLBILX_VA(0,R15)
 	isync
 
 	mtspr	SPRN_MAS6,r10
-- 
2.39.1

