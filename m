Return-Path: <linuxppc-dev+bounces-14308-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB74C6B0BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 18:48:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9sYJ5NJqz2yvH;
	Wed, 19 Nov 2025 04:48:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.10.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763488132;
	cv=none; b=fegfrTDVejVL03Mx0ggyyPEqfLwfSTsi7IuN+k1tx0dh4+9hj8+j22k46cSESwUk0dSXq6/78fAaulnl5uAN/3zIovnPFx4maGxAt7pB8dpP2CxYbgDh0i//jouh3J7ryZmJE9nENknFotFbkA8RaY1h7ox5DNHAQBxNevuNOXuPtu60pNpiM7g/92/s6SWJ9RQx0uBWgWmSKtqcBxCYKI/wiDAri1b/8aTTxNdQLEC//oOo5D33dw4p+t4wOsQMsNGISySiLS/f9w3tyWpYBizGQUsZzYPQ5p6c3ma0KkHBUbH0Lyd5Ft4771u3MHWpQOtgDxp4KoKfT6kqBx2e/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763488132; c=relaxed/relaxed;
	bh=YbV6MkfaKUUx/SlA4/SKnss3jBlz8gieISHTe7/Bl6g=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=mw+FFpRiHQTR5s3OBjaIamFfZx5w0kxv+4sraQVVhgcQ3KzXyIwIre1DM+GJAxscsrazGpVrWBdDSInjfu0yo0fzecQZwPGKWxQBZWI/6s/Xh7PChDDIRAG810RLI2jtU3FVX2D3FcyuZ1HztRrPIRsSNm/G148Ki9+MoAEVjp9zxpPQEQoZ+MtMMtScJqYbmtnIqkfoZ8a9eotg4i3IULRFRcBGuKazDDIOtX3n5UCZNVxdIqWdckmec0dx8TWr47Nj1cHaTpQ/exQydq86m991kW+EO7MfW4Cpvc+9MjWYd1++LlDZ48MbgGpKu+uT1g27K/JelciZtn6Lj2s02A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de; dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=a7NjVcK4; dkim-atps=neutral; spf=pass (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org) smtp.mailfrom=exactco.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=a7NjVcK4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exactco.de (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org)
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9sYH5PL1z2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 04:48:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=YbV6MkfaKUUx/SlA4/SKnss3jBlz8gieISHTe7/Bl6g=; b=a
	7NjVcK4731/yfJ/7Tj1u+1yVCSSz76NObxPc3oMJrPMo0dyf1H0ScOVtXYqO6gwLwaWefIXM9o3DD
	fqIUOJrqHR+ot5IIQL41QOi93zA0Fe2xvhKrprVXWhNIyeMg66TIG84eHsA4TpQE0XAkN32Z0Kms8
	kWF5Q6XYjJpnbrCaal1dk2hhPCHHe5RbWHPD7L3uC9pZSIOnHTYUByW5K7UF8p1zxVTAKNQCR4UIa
	0HCNPVkn13q6GhewzrXkARMxR8eAKHLOwq136CNf0953kFjGxBQbYHISgY1lln/GQp1Ne2azkiAix
	ctmM6IADDYyyyJP/ZgS4y8qdnvBG+P7Ig==;
Date: Tue, 18 Nov 2025 18:49:01 +0100 (CET)
Message-Id: <20251118.184901.486820791149579338.rene@exactco.de>
To: linuxppc-dev@lists.ozlabs.org
Cc: Geoff Levand <geoff@infradead.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH V2] ppc64/lv1call: Fix PS3 LV1 clobbering SRR
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
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
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

For a while, likely since 6eaaf9de3599 ("powerpc/64s/interrupt: Check
and fix srr_valid without crashing") booting a PS3 instantly yields:

<4>SRR0 was: c0000000000971b4 should be: c0000000002d55c4
<4>SRR1 was: 8000000000008032 should be: 8000000000008032

Fix LV1 HV clobbering SRR by srr_regs_clobbered() each lv1 call.
Attribute srr_regs_clobbered __always_inline as used by modules.

Fixes: 6eaaf9de3599 ("powerpc/64s/interrupt: Check and fix srr_valid without crashing")
Signed-off-by: René Rebe <rene@exactco.de>
---
v2: use __always_inline, ppc64, Fixes:
---
 arch/powerpc/include/asm/interrupt.h | 1 +
 arch/powerpc/include/asm/lv1call.h   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index eb0e4a20b818..783c6f32a395 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -106,6 +106,6 @@ static inline bool is_implicit_soft_masked(struct pt_regs *regs)
 	return search_kernel_soft_mask_table(regs->nip);
 }
 
-static inline void srr_regs_clobbered(void)
+static __always_inline void srr_regs_clobbered(void)
 {
 	local_paca->srr_valid = 0;
 	local_paca->hsrr_valid = 0;
diff --git a/arch/powerpc/include/asm/lv1call.h b/arch/powerpc/include/asm/lv1call.h
index ae70120953a8..48dd55a2b72e 100644
--- a/arch/powerpc/include/asm/lv1call.h
+++ b/arch/powerpc/include/asm/lv1call.h
@@ -14,6 +14,7 @@
 
 #include <linux/types.h>
 #include <linux/export.h>
+#include <asm/interrupt.h>
 
 /* lv1 call declaration macros */
 
@@ -208,7 +209,7 @@
 #define LV1_CALL(name, in, out, num)                               \
   extern s64 _lv1_##name(LV1_##in##_IN_##out##_OUT_ARG_DECL);      \
   static inline int lv1_##name(LV1_##in##_IN_##out##_OUT_ARG_DECL) \
-    {return _lv1_##name(LV1_##in##_IN_##out##_OUT_ARGS);}
+    {srr_regs_clobbered(); return _lv1_##name(LV1_##in##_IN_##out##_OUT_ARGS);}
 #endif
 
 #endif /* !defined(__ASSEMBLER__) */
-- 
2.46.0

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

