Return-Path: <linuxppc-dev+bounces-8600-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55091AB86B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 May 2025 14:47:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyqjP5L4Kz2ynf;
	Thu, 15 May 2025 22:47:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747313225;
	cv=none; b=KzjgSOIzwJlSqNt9CacVJZDaiCV+tVAgGBckLC+L+C/BLAG5so3WxnsgL85aFrr7ZTUEu0put7zatPR3/zZne2yEVDQfMB2BYSxjYSb4CHdEaVg3M4mLtVAVvvbHc6K/x/utGYqTfT129/CGclVxCMAqBBMI4OHHR53uu47WehmSYKtVt1QE0uoS5LJXXHwsdXo17pKawDv5BrnS/U3+RTUQ6L6IyrmnTbHevwptyW28Fu6HQ8voHMX/p7a4hymuynze6eCebEHf1+L8knio2aSDzx4b0bKLOux3nAIyI3/Y0NN/MtVHPN7IIPa5Y4z2ZAHGL/9S3dK4OUT9eDhJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747313225; c=relaxed/relaxed;
	bh=14/I2vUSCiyO5j1IOkvxYrGtCA+2mtBdP57/Lx/iExs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=klk9GsMuEodDWjAKe7NVl71iCv6NqxpySmLfBFlGPv0bayJCKmO/MT1qBtvJNr6o3q6dGNJeFBgbTlY4gwZyswQDgxyD5pWj/S/XMuM4rU5fIvd+LftQQPF9qd9ubzr0Pr7yIud3qQQ0QyDMLbpnNBEyQ+yGgg3iwZaGhrqYdrYS6XYuVK4tdHOWBIGuYpi8Cuu9BvLDa9M+VFj0opNrqL/wcGdHpZw8MDMeO2I8tPgfxx05vHscXOuPLcF/Vy53faD8O9Bcl0K+KzZjBJY8zESMNn+z0gUnETo8vznzhVJZQ8b0QU/m8fifVdliGplRS7z4hbMC9XrJUUc1BmjIVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lvGjfJ3+; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mingo@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lvGjfJ3+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mingo@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyqjN4kTwz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 22:47:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D254DA4C7B9;
	Thu, 15 May 2025 12:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090E0C4CEE7;
	Thu, 15 May 2025 12:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747313221;
	bh=lbZJml6REyBa5Wqf6whljObeSVlpAH/8U8yaPU9LXBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lvGjfJ3+EMr+uThtbSsCLWplsyajkQuighLyuqIHxjI/QTGyU5o7NouA+rn+vY1zw
	 0L0KEvo0UrWNGFIuG45GV2iNuIxDfKoSMSP1cE4VPu+eSQkh4VMiaCTEvBORAAyVLb
	 vd2mi3FCKISGyZHf43JJO/bWvm8JS9pxrQk1AyK1m0N7QoOHcDgjeikARN0j1UvM0V
	 FZG/2msPM1vzG8ods1SSdxYDFr6vgbdY79IdMvaJo//+BL3+Bzhr7CWj+XJuNT2a18
	 yJkykgWgUD+uhBf9ThEu209dO3XCx1VP49sgM7mUhdDiTfNqswLXC7Jloq3TViA84p
	 J0cPuGFlvvzTA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arch@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/15] bugs/powerpc: Pass in 'cond_str' to BUG_ENTRY()
Date: Thu, 15 May 2025 14:46:35 +0200
Message-ID: <20250515124644.2958810-7-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515124644.2958810-1-mingo@kernel.org>
References: <20250515124644.2958810-1-mingo@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Pass in the condition string from __WARN_FLAGS(), WARN_ON()
and BUG_ON(), but don't use it yet.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: <linux-arch@vger.kernel.org>
---
 arch/powerpc/include/asm/bug.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 34d39ec79720..b5537ba176b5 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -51,7 +51,7 @@
 	".previous\n"
 #endif
 
-#define BUG_ENTRY(insn, flags, ...)			\
+#define BUG_ENTRY(cond_str, insn, flags, ...)		\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
 		_EMIT_BUG_ENTRY				\
@@ -67,12 +67,12 @@
  */
 
 #define BUG() do {						\
-	BUG_ENTRY("twi 31, 0, 0", 0);				\
+	BUG_ENTRY("", "twi 31, 0, 0", 0);			\
 	unreachable();						\
 } while (0)
 #define HAVE_ARCH_BUG
 
-#define __WARN_FLAGS(cond_str, flags) BUG_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags))
+#define __WARN_FLAGS(cond_str, flags) BUG_ENTRY(cond_str, "twi 31, 0, 0", BUGFLAG_WARNING | (flags))
 
 #ifdef CONFIG_PPC64
 #define BUG_ON(x) do {						\
@@ -80,7 +80,7 @@
 		if (x)						\
 			BUG();					\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0", 0, "r" ((__force long)(x)));	\
+		BUG_ENTRY(#x, PPC_TLNEI " %4, 0", 0, "r" ((__force long)(x)));	\
 	}							\
 } while (0)
 
@@ -90,7 +90,7 @@
 		if (__ret_warn_on)				\
 			__WARN();				\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0",			\
+		BUG_ENTRY(#x, PPC_TLNEI " %4, 0",			\
 			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
 			  "r" (__ret_warn_on));	\
 	}							\
-- 
2.45.2


