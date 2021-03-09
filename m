Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF66331FB2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 08:16:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvmhn3NM6z3cPt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 18:16:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e6Nw1FhK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=e6Nw1FhK; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvmhN1Jd3z30Ml
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 18:15:47 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DvmhL3tQkz9sW8; Tue,  9 Mar 2021 18:15:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1615274146;
 bh=9KPDD/7V6VktUgFw80TCiG5C2Mv5H2uKMXrco0WtiqA=;
 h=From:To:Cc:Subject:Date:From;
 b=e6Nw1FhKvhMQ78elE0hMVPOuOSwHwF0/A1Eu6tNyg1KboE8JRAhdFThaPa+RqE6rk
 fWlEDkkY36NWus5yIsxEvpSrIVdEitXt2zNl5yIKHfyvOmGmwCkhqH2K50OFE8xYIK
 YGu76cW0UF7bcwSdzWEMeMHdRY0bry3THL7BPvG+97RLJhNo9jpugbOQo2BUF97uZy
 +fvVykf0a6KxPQ+IkZGVfdy36F9gShAuoMGT4jsHcq4AewusUPYh9/QUp/hrB5Evkc
 De1qQaQ1FLvmPpfRcwz5ummV4J2teLlZPCo0TdS63ZxwABG51dDjd9diEp0mETKmnX
 LvGqR3o2rEO8A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Use symbolic macros for function entry encoding
Date: Tue,  9 Mar 2021 18:15:44 +1100
Message-Id: <20210309071544.515303-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: naveen.n.rao@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In ppc_function_entry() we look for a specific set of instructions by
masking the instructions and comparing with a known value. Currently
those known values are just literal hex values, and we recently
discovered one of them was wrong.

Instead construct the values using the existing constants we have for
defining various fields of instructions.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/code-patching.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index d5b3c3bb95b4..f1d029bf906e 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -73,9 +73,10 @@ void __patch_exception(int exc, unsigned long addr);
 #endif
 
 #define OP_RT_RA_MASK	0xffff0000UL
-#define LIS_R2		0x3c400000UL
-#define ADDIS_R2_R12	0x3c4c0000UL
-#define ADDI_R2_R2	0x38420000UL
+#define LIS_R2		(PPC_INST_ADDIS | __PPC_RT(R2))
+#define ADDIS_R2_R12	(PPC_INST_ADDIS | __PPC_RT(R2) | __PPC_RA(R12))
+#define ADDI_R2_R2	(PPC_INST_ADDI  | __PPC_RT(R2) | __PPC_RA(R2))
+
 
 static inline unsigned long ppc_function_entry(void *func)
 {
-- 
2.25.1

