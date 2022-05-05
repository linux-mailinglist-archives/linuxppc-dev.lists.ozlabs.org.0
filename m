Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DA951BFDD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 14:52:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvD9f0Rn3z3bx8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 22:52:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MNMW6Xqv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvD922Wk4z3bkv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 22:51:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MNMW6Xqv; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KvD912Bcwz4x7V;
 Thu,  5 May 2022 22:51:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651755093;
 bh=sji0xzBiYEtjDzYHRPtYyc+hLhCR46cOmSmiDGv7lNA=;
 h=From:To:Cc:Subject:Date:From;
 b=MNMW6XqvCFNs4TRfjW4X0WwbwfDrtbS/NICBT5GlE9X5MotXCMNYXziabKSu32cOg
 zdt0+9BItayFwBfbVP4EbBc+acXLV7fz1KLYh+B1VQt9gUXN76efezyFoBnvaiAtX9
 RELATlO/ufjSA7CweABYWuUYyOdpqdXaDDBZAIdK8ldFJcNr9OpO6/fRnKYbijwKRW
 oyHL3Ehv0tj4VQbZr7aYn06o8/uZwoG647lEKinH99YeyQDEel5yRb/w7qHVARHpHF
 qdLcF1CYRc9f6BK5YyPRlAiZ2ig/t3x8pcq0xOnmPctLX2FsDu9D3s5Uaad71UOH8w
 awFq0wetKugzg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] powerpc: Add generic PAGE_SIZE config symbols
Date: Thu,  5 May 2022 22:51:22 +1000
Message-Id: <20220505125123.2088143-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Other arches (sh, mips, hexagon) use standard names for PAGE_SIZE
related config symbols.

Add matching symbols for powerpc, which are enabled by default but
depend on our architecture specific PAGE_SIZE symbols.

This allows generic/driver code to express dependencies on the PAGE_SIZE
without needing to refer to architecture specific config symbols.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 145af02df3dc..02994361cc7a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -759,6 +759,22 @@ config PPC_256K_PAGES
 
 endchoice
 
+config PAGE_SIZE_4KB
+	def_bool y
+	depends on PPC_4K_PAGES
+
+config PAGE_SIZE_16KB
+	def_bool y
+	depends on PPC_16K_PAGES
+
+config PAGE_SIZE_64KB
+	def_bool y
+	depends on PPC_64K_PAGES
+
+config PAGE_SIZE_256KB
+	def_bool y
+	depends on PPC_256K_PAGES
+
 config PPC_PAGE_SHIFT
 	int
 	default 18 if PPC_256K_PAGES
-- 
2.35.1

