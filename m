Return-Path: <linuxppc-dev+bounces-14300-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71437C69A4F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 14:42:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9m4y1n6qz2yvH;
	Wed, 19 Nov 2025 00:42:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.10.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763473346;
	cv=none; b=Rh2i+NOIZ90kTb/16/ZVt6T7pVXGKQoe8Aeo6EFPb/cnJ1plgTd8b7V1hTjhMvD+zf2JM4TK7MqZzv9vT3GbNacMnwzJ0p5N1W/YeqfgmiKeIx+0yJT4Fm10TtRWJoDz+UuEtP2pJ2ep6tky0xA58brX3TT43PS/hjWcQdEYnpx7yJ25zPT4JncW6sIdVT93/H8KImwMU/uWZnAPY8zKKJ/E0i3lAk7SpuQtNsE1SIG5irEfs+ylwZJDo2co28l0XJjNze/P/Taz26kC9N85lQsW3ZVO0TV8oR5Ov6lH54p4gxBQdFMCCiCWl7JW3rtnSGMWEKOaLtnoGJrJIvymKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763473346; c=relaxed/relaxed;
	bh=TLMMgXY7T7YKkp0qCQ+uy6SG59zpDtrehtQrclKo1Zo=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=WKqEypUxD0c9s+poFl0P8jp+jar/Zxk9UXH9132dmNKtADYjvkBFqEkbbFeWhPOLanwsZi2pZDTl6nL9T0EdtaG+ciMcXnbYgO/bhvUEpbYgf+UQg8IbNvcGUxgWrYwT4cKYuTonV3v+6AY3+cIr+mpfaAka8qiul2wJeIUeq8l0t9iUSnx9aXatXabPrBJE4pf+/8h8V16tauO+3KXM8ZBqTSbZ/6/pfBAupzcGFBIZxQHwOQpX69ZYZIjQe2dquctEgSYSpylLyAXTtCKJDZIdvAMV8gpqlLrcRAvC+hZPX/QLVq4lRRpWfI/9ytKvcH4J+cXtBEl/BnvOJh1lrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de; dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=YjJpfMjV; dkim-atps=neutral; spf=pass (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org) smtp.mailfrom=exactco.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=YjJpfMjV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exactco.de (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org)
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9m4v29GYz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 00:42:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=TLMMgXY7T7YKkp0qCQ+uy6SG59zpDtrehtQrclKo1Zo=; b=Y
	jJpfMjVdItjkYBXgrmdjWHg/J5R9Cow7BUDenmDLGfZY4bj6l1uxxxQhpnKa7uKpivMKn+QoN//jo
	p3E0VErvQJ26U7w6jMPgylsbc9NIym1gc1/xSkVR+18gM8q70Gzd8AMFBccZgw/oy3IrKbrZtUpVF
	CyKLqKwhW9PQmgJ273TpH68OjFZTQJn3D2CiqKpC9kpreZEK+elnxsy/3Tg8tsRFztwvzDIuqcxvz
	0BJ7fEfjsb7Rw4/grPaeyZ51ZBYNKVkR6RcqWPxV/3cK/qrq/bZtJAlmwC8CxQ2gSYBUloH1aN+wq
	8ckwCIkNEehTS6nufIchuwTFk45J+4D4w==;
Date: Tue, 18 Nov 2025 14:42:30 +0100 (CET)
Message-Id: <20251118.144230.697987246761031674.rene@exactco.de>
To: linuxppc-dev@lists.ozlabs.org
Cc: Geoff Levand <geoff@infradead.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: ppc/lv1call: Fix PS3 LV1 clobbering SRR
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

Since a while booting a PS3 instantly yields:

<4>SRR0 was: c0000000000971b4 should be: c0000000002d55c4
<4>SRR1 was: 8000000000008032 should be: 8000000000008032

Fix LV1 clobbering SRR by srr_regs_clobbered() each lv1 call.
Attribute srr_regs_clobbered always_inline for use by modules.

Signed-off-by: René Rebe <rene@exactco.de>
---
 arch/powerpc/include/asm/interrupt.h | 1 +
 arch/powerpc/include/asm/lv1call.h   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index eb0e4a20b818..783c6f32a395 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -106,6 +106,7 @@ static inline bool is_implicit_soft_masked(struct pt_regs *regs)
 	return search_kernel_soft_mask_table(regs->nip);
 }
 
+__attribute__((always_inline))
 static inline void srr_regs_clobbered(void)
 {
 	local_paca->srr_valid = 0;
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

