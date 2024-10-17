Return-Path: <linuxppc-dev+bounces-2357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D359A3020
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 23:55:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XV1qB2WVJz3bgf;
	Fri, 18 Oct 2024 08:55:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729202134;
	cv=none; b=fz51H+CBWgrxGel+q5PncMeZYqpS0LI1W7xlXy94lBKKS2lUShQi/d0XSN+dMrkIXynxXx7FJwJEgv/eZco4ZqtplEoORn7buNkmRru2tCbrChFavuCbLwf6pyfelRfOExD+odw2TVhmry1VmZiv0hs1Ih9AOBH3yZxvV+CTf2kv57zGUMksAZZxvV47QgSWyZJy2lK1lVX4jzxaV1Cgrz7h/IQ35mGpHw7ZHmdjf9X86TnHxhtNybnD9rZ/0qosuS8qi8qrFO8Upidam4ieWEGgPYHQKO0R/4vu0JhBzpPPjhyEcMI0sWt6VjadPseIMiYxhnodXAH/oX+jlyMCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729202134; c=relaxed/relaxed;
	bh=iUfPZ2q+NIS2dyY6unsVAimEzY3gCmEEgLnL341hcno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SYR2P3BD5sgLBnd1WOLKAfU4GzBlCAjiU6bMv8CpajS2176GHLrugYKxfTyXozZk40ObSJGgWYgscRuJEj1qvseodIveH57kt4x8WXm4QmKVBlj70acPE9Yeh9d/uiCAMuStLEUcaCaBB0RevjDvEtmPMHTwxNAdZiIe7QelwqXSuIaC7AfhPkhWpi1s2zT3hUJY0y3SyvvdlwORR4BpeLCniofkorT5ACkUPkv2eaL7xWZCy9Pp1Yom7Mv5qhFTZnOnfUHtdYRxepSYI3y6d2Lv9E/rvxtfsTzYtR+0xLHvC6Dg3EdHhGjODLLuDyvOQP+hUHWn2ufQapTFoTdyLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kMzCg3kq; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kMzCg3kq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XV1q85MKmz2yQn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 08:55:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1EC42A444AF;
	Thu, 17 Oct 2024 21:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A02EC4CED4;
	Thu, 17 Oct 2024 21:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729202129;
	bh=NMUERTfe8IitvLeucMcKK8QffKkIIRs7lelNieDdT8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kMzCg3kqxX5332ygSUeJINGDmjiYNVsMfc7/7dzsAm06HCcjkVGMntsgcp+IjM/hL
	 RWPWigIMfoZYM/d8HrkVmaWzOWlxpmFWU+0rbXuGpt/rbahjspkRqroToOQK7omUQ0
	 CWgPseIrIFd1H+4fxrsVmrG/4XMCBQKu/BjkSyy9/H784GkUvxWYX+1c7y4jtYw8xz
	 S1ZgR2yDDjpu2629dLL8w54cSK2EIS4rdxvQ4vQO/Hksj4o5MokUFoSuMrhT91SS8v
	 oMDBzwzfliCdS/84MB41FTSlPz99wiwk7WJV0Z3ZdtGpx+p7eqbS+1o5RAP8MuGZ47
	 OnD3DSEsxO3fg==
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
Subject: [PATCH v2 4/6] x86/uaccess: Add user pointer masking to __put_user()
Date: Thu, 17 Oct 2024 14:55:23 -0700
Message-ID: <fee7ce8f16355ad8e8be4fae8a10ea49a6e25d69.1729201904.git.jpoimboe@kernel.org>
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
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add user pointer masking to __put_user() to mitigate Spectre v1.

A write in a mispredicted access_ok() branch to a user-controlled kernel
address can populate the rest of the affected cache line with kernel
data.

This makes its behavior identical to put_user(), so converge their
implementations.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/lib/putuser.S | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/x86/lib/putuser.S b/arch/x86/lib/putuser.S
index cb137e0286be..1b122261b7aa 100644
--- a/arch/x86/lib/putuser.S
+++ b/arch/x86/lib/putuser.S
@@ -87,7 +87,26 @@ SYM_FUNC_START(__put_user_8)
 SYM_FUNC_END(__put_user_8)
 EXPORT_SYMBOL(__put_user_8)
 
-/* .. and the same for __put_user, just without the range checks */
+#ifdef CONFIG_X86_64
+
+/*
+ * On x86-64, put_user() does address masking rather than a conditional
+ * bounds check so there's no functional difference with __put_user().
+ */
+SYM_FUNC_ALIAS(__put_user_nocheck_1, __put_user_1);
+EXPORT_SYMBOL(__put_user_nocheck_1);
+
+SYM_FUNC_ALIAS(__put_user_nocheck_2, __put_user_2);
+EXPORT_SYMBOL(__put_user_nocheck_2);
+
+SYM_FUNC_ALIAS(__put_user_nocheck_4, __put_user_4);
+EXPORT_SYMBOL(__put_user_nocheck_4);
+
+SYM_FUNC_ALIAS(__put_user_nocheck_8, __put_user_8);
+EXPORT_SYMBOL(__put_user_nocheck_8);
+
+#else /* CONFIG_X86_32 */
+
 SYM_FUNC_START(__put_user_nocheck_1)
 	ASM_STAC
 6:	movb %al,(%_ASM_CX)
@@ -118,15 +137,15 @@ EXPORT_SYMBOL(__put_user_nocheck_4)
 SYM_FUNC_START(__put_user_nocheck_8)
 	ASM_STAC
 9:	mov %_ASM_AX,(%_ASM_CX)
-#ifdef CONFIG_X86_32
 10:	movl %edx,4(%_ASM_CX)
-#endif
 	xor %ecx,%ecx
 	ASM_CLAC
 	RET
 SYM_FUNC_END(__put_user_nocheck_8)
 EXPORT_SYMBOL(__put_user_nocheck_8)
 
+#endif /* CONFIG_X86_32 */
+
 SYM_CODE_START_LOCAL(__put_user_handle_exception)
 	ASM_CLAC
 .Lbad_put_user:
@@ -140,11 +159,9 @@ SYM_CODE_END(__put_user_handle_exception)
 	_ASM_EXTABLE_UA(4b, __put_user_handle_exception)
 #ifdef CONFIG_X86_32
 	_ASM_EXTABLE_UA(5b, __put_user_handle_exception)
-#endif
 	_ASM_EXTABLE_UA(6b, __put_user_handle_exception)
 	_ASM_EXTABLE_UA(7b, __put_user_handle_exception)
 	_ASM_EXTABLE_UA(8b, __put_user_handle_exception)
 	_ASM_EXTABLE_UA(9b, __put_user_handle_exception)
-#ifdef CONFIG_X86_32
 	_ASM_EXTABLE_UA(10b, __put_user_handle_exception)
 #endif
-- 
2.47.0


