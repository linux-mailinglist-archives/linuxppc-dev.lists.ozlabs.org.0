Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C4186C933
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 13:27:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pL/5I1eT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlr8H20KCz3vcb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 23:27:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pL/5I1eT;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlr6205tFz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 23:25:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709209529;
	bh=xJ0KqZuJexjoP5fwcg64Z1r4LBQ/eOyhSEoObgqjc4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pL/5I1eTQeF/20PJyyFoWvrrmog4Rc75QkQ2sSTlAAChnZC49ux4C850dHhqsCFPH
	 1akJOz0gEwl1a6oQVZ33uh6froSUSZfsBqmVGZGExVTYSIlv4my23HS3IYeDGcJ12X
	 ibTJPLyTH54smFxNOPn5LempsOmRxbqBeU00HnvnFBA4LLIoYjZeoeXUXkabRWf00R
	 OcTw1/8AQulwP2tFVg9gK0gXb/XHjnhZZj6nWv6uSIBPXi+kioGCm37JDO0doYKCUF
	 qXNE7hrr3MB1AdG0VAbD1orvk3SjUWgyKDI4mXiflsXkVmGIaSa5mpmBc9gVuFkfJ/
	 8Z9SCfv+s6xaQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tlr616JL0z4wcq;
	Thu, 29 Feb 2024 23:25:29 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 4/5] powerpc/fsl: Modernise mt/mfpmr
Date: Thu, 29 Feb 2024 23:25:20 +1100
Message-ID: <20240229122521.762431-4-mpe@ellerman.id.au>
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

With the addition of the machine directives, these are no longer simple
1-2 liner macros. So modernise them to be static inlines and use named
asm parameters.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/reg_fsl_emb.h | 32 +++++++++++++++++---------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/reg_fsl_emb.h b/arch/powerpc/include/asm/reg_fsl_emb.h
index 8359c06d92d9..b0563c30b062 100644
--- a/arch/powerpc/include/asm/reg_fsl_emb.h
+++ b/arch/powerpc/include/asm/reg_fsl_emb.h
@@ -11,17 +11,27 @@
 
 #ifndef __ASSEMBLY__
 /* Performance Monitor Registers */
-#define mfpmr(rn)	({unsigned int rval; \
-			asm volatile(".machine push; " \
-				     ".machine e300; " \
-				     "mfpmr %0," __stringify(rn) ";" \
-				     ".machine pop; " \
-				     : "=r" (rval)); rval;})
-#define mtpmr(rn, v)	asm volatile(".machine push; " \
-				     ".machine e300; " \
-				     "mtpmr " __stringify(rn) ",%0; " \
-				     ".machine pop; " \
-				     : : "r" (v))
+static inline unsigned int mfpmr(unsigned int rn)
+{
+	unsigned int rval;
+
+	asm (".machine push; "
+	     ".machine e300; "
+	     "mfpmr %[rval], %[rn];"
+	     ".machine pop;"
+	     : [rval] "=r" (rval) : [rn] "i" (rn));
+
+	return rval;
+}
+
+static inline void mtpmr(unsigned int rn, unsigned int val)
+{
+	asm (".machine push; "
+	     ".machine e300; "
+	     "mtpmr %[rn], %[val];"
+	     ".machine pop;"
+	     : [val] "=r" (val) : [rn] "i" (rn));
+}
 #endif /* __ASSEMBLY__ */
 
 /* Freescale Book E Performance Monitor APU Registers */
-- 
2.43.2

