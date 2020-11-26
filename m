Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA73D2C56A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 15:07:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Chfhn6lcJzDqyn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 01:07:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChdR6223nzDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 00:10:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=N7NTn7SZ; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4ChdR473PBz9sWj; Fri, 27 Nov 2020 00:10:24 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4ChdR42zxmz9sWl; Fri, 27 Nov 2020 00:10:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606396224;
 bh=D4Tj+4ewClMPea9V7YkAsshAAfx6uDceCKghlKAKxBU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N7NTn7SZnwkIAil/G1sv6RF2Bjv6KzhPaHxDfq1lIyf47TxM6ASImG4K07yfvSAo8
 9WZGpg9byh7SgrKMoD32Q+sajcK0y0TUyX17P5sObJIOUAKi/inBGca5/CiquQsGgg
 Bdw9lRbRZ46rIEmGOBa2bGX3G8IkYtunHbBNVRvFsvrndVkFfe6snjQx8uJDDYHThK
 oyl0TvYCupYI5smPGDWQQxbj2TVf3Beu097tVUoqHq84r/v9b6fYlFPOKey414Nc3/
 Oc05oqxsZBgkhqltuFpUX/WPZr5qKpFNu7ZiUNnoj0sMoSZUxWQB+A45OIVRWb2RDu
 wznvhbKQNk5mw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v14 7/9] powerpc/vdso: Save and restore TOC pointer on PPC64
Date: Fri, 27 Nov 2020 00:10:04 +1100
Message-Id: <20201126131006.2431205-7-mpe@ellerman.id.au>
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

From: Christophe Leroy <christophe.leroy@csgroup.eu>

On PPC64, the TOC pointer needs to be saved and restored.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/bf21fd9762a124ce3afec34a8e403a44dfdf2f84.1604426550.git.christophe.leroy@csgroup.eu
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

v14: unchanged

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index 43dd1dc47c37..6f56a6bce615 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -19,10 +19,16 @@
   .cfi_register lr, r0
 	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
 	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
+#ifdef __powerpc64__
+	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
+#endif
 	get_datapage	r5, r0
 	addi		r5, r5, VDSO_DATA_OFFSET
 	bl		DOTSYM(\funct)
 	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
+#ifdef __powerpc64__
+	PPC_LL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
+#endif
 	cmpwi		r3, 0
 	mtlr		r0
   .cfi_restore lr
@@ -42,10 +48,16 @@
   .cfi_register lr, r0
 	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
 	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
+#ifdef __powerpc64__
+	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
+#endif
 	get_datapage	r4, r0
 	addi		r4, r4, VDSO_DATA_OFFSET
 	bl		DOTSYM(\funct)
 	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
+#ifdef __powerpc64__
+	PPC_LL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
+#endif
 	crclr		so
 	mtlr		r0
   .cfi_restore lr
-- 
2.25.1

