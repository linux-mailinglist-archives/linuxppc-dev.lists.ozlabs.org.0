Return-Path: <linuxppc-dev+bounces-2358-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F659A3022
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 23:55:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XV1qB5xgkz3bjb;
	Fri, 18 Oct 2024 08:55:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729202134;
	cv=none; b=dSv7kvHQmJlYtDVKM+10utjWUExRL3t7QI3IvzrA3fFjmMSfpDy33LzzgUZcXTPWoon3wWbM9yA/IN1cHXIFOV5wvfzJFMlSP7Xt5Q5HThLt4FtqGGYYP+iNeL5KchnOCY9GImsyuSHiz2LIzU2tLs8SvOHZkE0fzg+nG99n3aXXGm9tyGrgqEfMYGm8wdjKUpOT6Lq0fiA25UKMQg7tsLajY+qyXl4G8MBJ7MAYKdlVHsiyXCzP+hQzEGUmxG6zKvKBQey9P4kSWCjta43zw93KiAiO3dRpWsU6FGQBj7tQlSG9cM1M/0stLOjlmjyd8vvegtC9ywEDsTZ0tmtJJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729202134; c=relaxed/relaxed;
	bh=N7Ujn6q3OmLUGAa7ezEiS1HEORyBXoO92oufTsSydHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RNdgllPFx2dnq6MlfpN+JPSjNk+SgH88pzMwScagg5EBxD+P9OA+RrRaPR0ZTgX6tqoMJvezL3H01QPZPLnfa7rVGozlfDO8cRu7PMfAPXXTkFS9GmSinOw2pMguQZotJ/WKD7MhPLkXj2u7RVcCYS+1jrCH7mO4Yn4gHbgTc6FPI9SNgYRhw4D3nyIU6XGiMjjN55Q30Q8pyyDwWRKcR7aswlUJP/9XrCgrG2YYXM9mE7V34WLPaNYBsWU7GiSnUYwdntcaFku/5lG6uy/ZKZcTF9lsFXOY/4NUYvB/s/J8qU39jKyzrBeyyrzObxtqIAhKZY7sL+7w9TMMVjR48w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tAf3RJLG; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tAf3RJLG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XV1q82wc7z2yN4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 08:55:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 960E25C5A92;
	Thu, 17 Oct 2024 21:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54825C4CED2;
	Thu, 17 Oct 2024 21:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729202128;
	bh=xfgOc7lTaXmUYWAtPlY5EDc6fxKMFQn54g5tpKh/iYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tAf3RJLGarfzTLeMnQbadhPeskZRMtA2DGorwTgKO/UVRrLECKX9Jb53OUjyLQ5O+
	 RkMS9uNs6oHcwAc5nf9SB5TTqo/0q+P++YVF9PieqhHBFsJ2Nn02Vc/zATf8WMNWcz
	 6A3fk34YHGLyWGbMrzecfgFFgW+aaH/n3sO1DpZuPl71DDI7CTZA4NQnXre7u48w/+
	 tHTjzHDN8gLnQBYjN1UK5+GwCyXFeWQcQKOC3DYKqu6iGxuqv2vsi+5ltcUxGlZi4K
	 RqdTPM+H+IpoqnFYdA19gi+j6Oo8okTqCyrGJW6uWOuVKNAELOeDiY0xGGZ35JI8+2
	 XXGaZkCCJuo+Q==
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
Subject: [PATCH v2 2/6] x86/uaccess: Avoid barrier_nospec() in __get_user()
Date: Thu, 17 Oct 2024 14:55:21 -0700
Message-ID: <0777ac8e8c8d669fa56971dcba68b6f1c1980d39.1729201904.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729201904.git.jpoimboe@kernel.org>
References: <cover.1729201904.git.jpoimboe@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 64-bit, the barrier_nospec() in __get_user() is overkill and
painfully slow.  Instead, use pointer masking to force the user pointer
to a non-kernel value in speculative paths.

Doing so makes get_user() and __get_user() identical in behavior, so
converge their implementations.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/lib/getuser.S | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
index 094224ec9dca..7c9bf8f0b3ac 100644
--- a/arch/x86/lib/getuser.S
+++ b/arch/x86/lib/getuser.S
@@ -105,6 +105,26 @@ SYM_FUNC_START(__get_user_8)
 SYM_FUNC_END(__get_user_8)
 EXPORT_SYMBOL(__get_user_8)
 
+#ifdef CONFIG_X86_64
+
+/*
+ * On x86-64, get_user() does address masking rather than a conditional
+ * bounds check so there's no functional difference with __get_user().
+ */
+SYM_FUNC_ALIAS(__get_user_nocheck_1, __get_user_1);
+EXPORT_SYMBOL(__get_user_nocheck_1);
+
+SYM_FUNC_ALIAS(__get_user_nocheck_2, __get_user_2);
+EXPORT_SYMBOL(__get_user_nocheck_2);
+
+SYM_FUNC_ALIAS(__get_user_nocheck_4, __get_user_4);
+EXPORT_SYMBOL(__get_user_nocheck_4);
+
+SYM_FUNC_ALIAS(__get_user_nocheck_8, __get_user_8);
+EXPORT_SYMBOL(__get_user_nocheck_8);
+
+#else /* CONFIG_X86_32 */
+
 /* .. and the same for __get_user, just without the range checks */
 SYM_FUNC_START(__get_user_nocheck_1)
 	ASM_STAC
@@ -139,19 +159,16 @@ EXPORT_SYMBOL(__get_user_nocheck_4)
 SYM_FUNC_START(__get_user_nocheck_8)
 	ASM_STAC
 	ASM_BARRIER_NOSPEC
-#ifdef CONFIG_X86_64
-	UACCESS movq (%_ASM_AX),%rdx
-#else
 	xor %ecx,%ecx
 	UACCESS movl (%_ASM_AX),%edx
 	UACCESS movl 4(%_ASM_AX),%ecx
-#endif
 	xor %eax,%eax
 	ASM_CLAC
 	RET
 SYM_FUNC_END(__get_user_nocheck_8)
 EXPORT_SYMBOL(__get_user_nocheck_8)
 
+#endif /* CONFIG_X86_32 */
 
 SYM_CODE_START_LOCAL(__get_user_handle_exception)
 	ASM_CLAC
-- 
2.47.0


