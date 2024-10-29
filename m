Return-Path: <linuxppc-dev+bounces-2661-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BD59B3FFD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 02:57:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XctfP5Msvz2yVd;
	Tue, 29 Oct 2024 12:56:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730167005;
	cv=none; b=KIosvDOXW0plhDW+iXQL5jkF4QfiWCIkqqdWVmdhwi3ZP8QDOE0WI+WA0m34TTs83hiQtasGJSkC1n4wnPwVniShIi5DI2d8s/6zkt5MD76muovDeHsraIFnFgM49z3tgvEoD2T3JMZLTd8/XiaBkbkj55Q3f7uwDtW5ktU3K3nkVehSTn8xEPYxw06Zs59zkwHVM+sKEgpMCJM5Iq8gI46hwc5i1i7sr/wEMBmj2fqb3Fd/Th2n8QX2cnxms3q/TCKOmwT05IFLqGrWjxVkDAgKQ4xSPA+0nllq+qIUl5mwnaK6IoWkwbbXxayWR8neaU5b4Fv0N4wnejoj1VLg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730167005; c=relaxed/relaxed;
	bh=oTi68xHxhgw6rJrow0qOHghKPBNKqM8C9D9GMNVkDbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=df/RKPN8bifxgpT0SHQ0X0HWROsKPMDLELXxwv6T0WYC+DhnBlEuX5C0Bt8TT3o5f9OlvDpt/DrBbvCpkrFa7CQkN9TAuXhDaJA1+EROlUV2eal/y1HnjRZDeFucWoie16Jc8X5EK9C2VHNP/siGxiuCNZWIzd5Z2OR/dSPXrvHhUYbTWE34UF05Es2vSrtX99ZYwGA0V4pCaO25+Oh8c/qCJ9Vble0ipb+zPoaDdZgdfyGcEltbpffRpg5nDGo795VoeTNuqVLkHpbeeKaygIZP9TrFuk+S8Za4WevZpmZ49P3IkLo3zLlHLHUWDZ/QlFPgqPIQ1yHcO+PymNQymQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X2peZm0O; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X2peZm0O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XctfM6lQcz2yRd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 12:56:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C039FA41348;
	Tue, 29 Oct 2024 01:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F036DC4CEF0;
	Tue, 29 Oct 2024 01:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730167001;
	bh=IH1dsBAzC1/NpJlrtMMREhzqss6Zpig4JOkpaJnGywY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X2peZm0O71m3epHvfIPaBj3APxpxfGhiAsSTBzDsBoPz7gMoTX2iJ8O7bUUwXqf41
	 FFG4jMF9Bc1/4auMk4Cow8uemoyn2VKep/jQAqriZNwKcKiLM2vQGlQQ4BTS0SanDH
	 cXqkPX8mSf9NeN9bHG/7jZ5oVITF942ntMW2U9lBnmr4Fyn2EhGuGzXuEtGca7XYPf
	 WL3qXZLipOH8LC+/mFN64Pt6/hS6JJYtYPCO4Iq9dT62GTtejsVShVWu8spWELKt+w
	 c7FhnzmjYsirTRtAGVHh3TEuwKi6BX0hJ1j+D/UGtQXkAI7EdDVKVmoZUzlFKlbKfX
	 xo2dlU2WSsCHg==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>
Subject: [PATCH v3 6/6] x86/uaccess: Converge [__]get_user() implementations
Date: Mon, 28 Oct 2024 18:56:19 -0700
Message-ID: <d8fcb2f521c5186639d1cfd296ddc672d9c224f4.1730166635.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1730166635.git.jpoimboe@kernel.org>
References: <cover.1730166635.git.jpoimboe@kernel.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The x86 implementations of get_user() and __get_user() are now
identical.  Merge their implementations and make the __get_user()
implementations aliases of their get_user() counterparts.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/lib/getuser.S | 58 +++++++++---------------------------------
 1 file changed, 12 insertions(+), 46 deletions(-)

diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
index 7da4fc75eba9..6f4dcb80dd46 100644
--- a/arch/x86/lib/getuser.S
+++ b/arch/x86/lib/getuser.S
@@ -103,53 +103,19 @@ SYM_FUNC_START(__get_user_8)
 SYM_FUNC_END(__get_user_8)
 EXPORT_SYMBOL(__get_user_8)
 
-/* .. and the same for __get_user, just without the range checks */
-SYM_FUNC_START(__get_user_nocheck_1)
-	mask_user_address size=1
-	ASM_STAC
-	UACCESS movzbl (%_ASM_AX),%edx
-	xor %eax,%eax
-	ASM_CLAC
-	RET
-SYM_FUNC_END(__get_user_nocheck_1)
-EXPORT_SYMBOL(__get_user_nocheck_1)
-
-SYM_FUNC_START(__get_user_nocheck_2)
-	mask_user_address size=2
-	ASM_STAC
-	UACCESS movzwl (%_ASM_AX),%edx
-	xor %eax,%eax
-	ASM_CLAC
-	RET
-SYM_FUNC_END(__get_user_nocheck_2)
-EXPORT_SYMBOL(__get_user_nocheck_2)
-
-SYM_FUNC_START(__get_user_nocheck_4)
-	mask_user_address size=4
-	ASM_STAC
-	UACCESS movl (%_ASM_AX),%edx
-	xor %eax,%eax
-	ASM_CLAC
-	RET
-SYM_FUNC_END(__get_user_nocheck_4)
-EXPORT_SYMBOL(__get_user_nocheck_4)
-
-SYM_FUNC_START(__get_user_nocheck_8)
-	mask_user_address size=8
-	ASM_STAC
-#ifdef CONFIG_X86_64
-	UACCESS movq (%_ASM_AX),%rdx
-#else
-	xor %ecx,%ecx
-	UACCESS movl (%_ASM_AX),%edx
-	UACCESS movl 4(%_ASM_AX),%ecx
-#endif
-	xor %eax,%eax
-	ASM_CLAC
-	RET
-SYM_FUNC_END(__get_user_nocheck_8)
-EXPORT_SYMBOL(__get_user_nocheck_8)
+/*
+ * On x86-64, get_user() does address masking rather than a conditional bounds
+ * check so there's no functional difference compared to __get_user().
+ */
+SYM_FUNC_ALIAS(__get_user_nocheck_1, __get_user_1);
+SYM_FUNC_ALIAS(__get_user_nocheck_2, __get_user_2);
+SYM_FUNC_ALIAS(__get_user_nocheck_4, __get_user_4);
+SYM_FUNC_ALIAS(__get_user_nocheck_8, __get_user_8);
 
+EXPORT_SYMBOL(__get_user_nocheck_1);
+EXPORT_SYMBOL(__get_user_nocheck_2);
+EXPORT_SYMBOL(__get_user_nocheck_4);
+EXPORT_SYMBOL(__get_user_nocheck_8);
 
 SYM_CODE_START_LOCAL(__get_user_handle_exception)
 	ASM_CLAC
-- 
2.47.0


