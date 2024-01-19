Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 123C38327AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 11:30:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=uOy0TYn5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGbV56vhmz3cXr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 21:30:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=uOy0TYn5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGbRP4nwJz3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 21:28:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Date:To:Subject:From:References:
	In-Reply-To:Message-Id:Sender:Reply-To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2AYUPFf9nWJVN5cttdQ2o2SVkudo7AHk41xlbkZNkoo=; b=uOy0TYn52G4YTSTs/MzcqBqPUw
	R8b6xEjEa+/vIXe/OUv/3lWkphz5IL7ZT1jua3qwr5N4p7/Cvr+I7L6Lx0sUKaPPAk6YokuaL0dln
	MefBDjrQWf5zw5/sYhmmglvOtNWLP/Mwo5kjo1ZVd795bPXDxP/KTIz7CFQT8n71H23+hHAkPLAiJ
	B+xhRRg8eLBFE4NFX07JquuETHfpoQG3zh9RyCCMNtbLsIC4vj6EwOcJdy0csYxhSfOO02MRF6ypl
	YBWxprc3noNXi+g9Ck9SiN7rBWDBxTnvVxm9yfC0/QjOZHmWjO+1OQD4oJXNbKop6h7Y4N9trIiSk
	3LSqXCCA==;
Received: from geoff by merlin.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rQm6J-00000000F9t-48Bo;
	Fri, 19 Jan 2024 10:27:52 +0000
Message-Id: <3114bac82fb0a019a0e2da4173b7b8209342f9c1.1705654669.git.geoff@infradead.org>
In-Reply-To: <cover.1705654669.git.geoff@infradead.org>
References: <cover.1705654669.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Wed, 27 Dec 2023 17:24:03 +1000
Subject: [PATCH 1/4] powerpc/ps3: Fix lv1 hcall assembly for ELFv2 calling
 convention
To: Michael Ellerman <mpe@ellerman.id.au>,
    Nicholas Piggin <npiggin@gmail.com>,
    linuxppc-dev@lists.ozlabs.org
Date: Fri, 19 Jan 2024 10:27:51 +0000
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

Stack-passed parameters begin at a different offset in the caller's
stack in the ELFv2 ABI.

Reported-by: Geoff Levand <geoff@infradead.org>
Fixes: 8c5fa3b5c4df ("powerpc/64: Make ELFv2 the default for big-endian builds")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/include/asm/ppc_asm.h  |  6 ++++--
 arch/powerpc/platforms/ps3/hvcall.S | 18 +++++++++---------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index e7792aa13510..041ee2595520 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -201,11 +201,13 @@
 
 #ifdef CONFIG_PPC64_ELF_ABI_V2
 #define STK_GOT		24
-#define __STK_PARAM(i)	(32 + ((i)-3)*8)
+#define STK_PARAM_AREA	32
 #else
 #define STK_GOT		40
-#define __STK_PARAM(i)	(48 + ((i)-3)*8)
+#define STK_PARAM_AREA	48
 #endif
+
+#define __STK_PARAM(i)	(STK_PARAM_AREA + ((i)-3)*8)
 #define STK_PARAM(i)	__STK_PARAM(__REG_##i)
 
 #ifdef CONFIG_PPC64_ELF_ABI_V2
diff --git a/arch/powerpc/platforms/ps3/hvcall.S b/arch/powerpc/platforms/ps3/hvcall.S
index 509e30ad01bb..59ea569debf4 100644
--- a/arch/powerpc/platforms/ps3/hvcall.S
+++ b/arch/powerpc/platforms/ps3/hvcall.S
@@ -714,7 +714,7 @@ _GLOBAL(_##API_NAME)				\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
 	std	r5, 0(r11);			\
-	ld	r11, 48+8*8(r1);		\
+	ld	r11, STK_PARAM_AREA+8*8(r1);	\
 	std	r6, 0(r11);			\
 						\
 	ld	r0, 16(r1);			\
@@ -746,22 +746,22 @@ _GLOBAL(_##API_NAME)				\
 	mflr	r0;				\
 	std	r0, 16(r1);			\
 						\
-	std	r10, 48+8*7(r1);		\
+	std	r10, STK_PARAM_AREA+8*7(r1);	\
 						\
 	li	r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	ld	r11, 48+8*7(r1);		\
+	ld	r11, STK_PARAM_AREA+8*7(r1);	\
 	std	r4, 0(r11);			\
-	ld	r11, 48+8*8(r1);		\
+	ld	r11, STK_PARAM_AREA+8*8(r1);	\
 	std	r5, 0(r11);			\
-	ld	r11, 48+8*9(r1);		\
+	ld	r11, STK_PARAM_AREA+8*9(r1);	\
 	std	r6, 0(r11);			\
-	ld	r11, 48+8*10(r1);		\
+	ld	r11, STK_PARAM_AREA+8*10(r1);	\
 	std	r7, 0(r11);			\
-	ld	r11, 48+8*11(r1);		\
+	ld	r11, STK_PARAM_AREA+8*11(r1);	\
 	std	r8, 0(r11);			\
-	ld	r11, 48+8*12(r1);		\
+	ld	r11, STK_PARAM_AREA+8*12(r1);	\
 	std	r9, 0(r11);			\
 						\
 	ld	r0, 16(r1);			\
@@ -777,7 +777,7 @@ _GLOBAL(_##API_NAME)				\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	ld	r11, 48+8*8(r1);		\
+	ld	r11, STK_PARAM_AREA+8*8(r1);	\
 	std	r4, 0(r11);			\
 						\
 	ld	r0, 16(r1);			\
-- 
2.34.1


