Return-Path: <linuxppc-dev+bounces-256-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0CA9594F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 08:47:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpcND2w8Cz2xWT;
	Wed, 21 Aug 2024 16:47:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpcND0Ycsz2xTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 16:47:54 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WpcN82Jcxz9sSL;
	Wed, 21 Aug 2024 08:47:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qc2-O7sfsnYc; Wed, 21 Aug 2024 08:47:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WpcN81cTSz9sSK;
	Wed, 21 Aug 2024 08:47:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 28BBC8B778;
	Wed, 21 Aug 2024 08:47:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Jv9pzxhi_2wt; Wed, 21 Aug 2024 08:47:52 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 07DC78B763;
	Wed, 21 Aug 2024 08:47:52 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Remove LHZX_BE macro
Date: Wed, 21 Aug 2024 08:47:51 +0200
Message-ID: <fd332b01c47bb9cb6c3af1696a2e109be655f5b5.1724222856.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724222871; l=929; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=QzA1iwpdIWaUpbbbRXkE+PetQ+6HUMW3FsrcPJprMhM=; b=8iRP43m8ZL0jcO70Bsi7+2lojNQMCS/Vvqf4b5qQeMWKdybzhsOeHxKfIbRd4ZDb8LAB4R3Zc aOHtIj+eQ5XC4J0kCEAxtxPc1eZTCDAXz8LIcC/h/ewVzeenJp/sVGm
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

LHZX_BE has been unused since commit dbf44daf7c88 ("bpf, ppc64: remove
ld_abs/ld_ind")

Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/asm-compat.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-compat.h b/arch/powerpc/include/asm/asm-compat.h
index 2bc53c646ccd..b0b209c1df50 100644
--- a/arch/powerpc/include/asm/asm-compat.h
+++ b/arch/powerpc/include/asm/asm-compat.h
@@ -26,13 +26,11 @@
 #define PPC_MIN_STKFRM	112
 
 #ifdef __BIG_ENDIAN__
-#define LHZX_BE	stringify_in_c(lhzx)
 #define LWZX_BE	stringify_in_c(lwzx)
 #define LDX_BE	stringify_in_c(ldx)
 #define STWX_BE	stringify_in_c(stwx)
 #define STDX_BE	stringify_in_c(stdx)
 #else
-#define LHZX_BE	stringify_in_c(lhbrx)
 #define LWZX_BE	stringify_in_c(lwbrx)
 #define LDX_BE	stringify_in_c(ldbrx)
 #define STWX_BE	stringify_in_c(stwbrx)
-- 
2.44.0


