Return-Path: <linuxppc-dev+bounces-2356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6719A301F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 23:55:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XV1qB169Sz3bbW;
	Fri, 18 Oct 2024 08:55:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729202134;
	cv=none; b=obpCNGKwJg9A8qwcpDDxXihQJvX00Op7zqsIvhA0ncRGpyz09JQKe059i+hUpskqmMhG6m6ntQjfkQRFXpJB0IjrweIKA2+XZ2KBZSdqnfv7nbJ6kGmpmi7kf5u3LunXwB8KCEwn4kx2eAJqicQ06I6i8Etpo26Y/hLSkgxSYKHCMzR4/UDnq/WI4E70XMrsg0wU/gwTSxnYBANL1NJJTfsBNg3SKqRaWh/KjzBAyMS3j37Eq8bNV04qcoGnJjzfixNato0blxTyNjsq7m4MqJuScGeZw9heeLjVGuzp2azs9xa0NvVQ1tnw95+vXB6YllogkF0FsgwGHtZMjhCF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729202134; c=relaxed/relaxed;
	bh=/jmJa/gwHFWlu3zXGxyo3KrVsPwIWewIXZFfCfaPzA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CutvdTvrs7oU/iQGTtHPFUFySdwJARkutcLr0ylwBJT93Xc134/QuUEogHlDrOvvr0CA+VKGMsMp5jnrAGoDCVJrkHARw7XvUlz1sGeNTmLMjlacc/AvP0FEveeWb6yl0AHRjfnJpKdc4NI4qKaPKKiPguQomyIPPvVD60ACMmlMn3xuBA6VcKLV1x1xQIC+uLxvKUv8KDYjNNW0Q8Z7vgQmuqHffXDoavbCBNPCEhTlMG6rL8R6wpv+ZSew4eA2dtqDxF17zGTC3A6yTwrf/LldbveA7ch7fd9s/YnZUkljKsCD8fl453MbYzFEeoHRi0dj+fQaKRQMOPNh5YkDNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RwSRDs6W; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RwSRDs6W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XV1q80Mvnz2yGZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 08:55:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2FF4A444A9;
	Thu, 17 Oct 2024 21:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E136DC4CED0;
	Thu, 17 Oct 2024 21:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729202129;
	bh=+NVAfBL5XC4O3/+bvmSlB+aCF1KvxK5rqTMlDvFps8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RwSRDs6W96PHO2LRpbnWJ0OAi+5QM78NCMgPnwsZ6OZ0V7sPQULC5WebYPZVd5d3l
	 FEbxM2R0ClBXjbJm5zZ85m/WdRyqIGWUpJG/xqyxJHWhKORX+n8iGN4M6qwy7uf8s1
	 /YDH9Ssdat0h9Zn+uKLHRCPkjKL0FtvgGVq0TvnDjm2Uy1Qpqp4d7T5E6kHkevZe2g
	 E72VfcMW9JI8XGhLsRfh/X5RIhe9aMYhRvjmDchnYZg2OEwwYPL0YBiLJKd8BTVkBm
	 r84u32waSE4V6iFBM1gjUKQTZ6gCjonbVPlRHOtWM6g8iJpjGXgSOKuqqbdAWwXPP6
	 vbrG1Orde5mXw==
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
Subject: [PATCH v2 3/6] x86/uaccess: Rearrange putuser.S
Date: Thu, 17 Oct 2024 14:55:22 -0700
Message-ID: <7818233ecd726628a3eb9cbb5ed0ba831e69af4b.1729201904.git.jpoimboe@kernel.org>
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

Separate __put_user_*() from __put_user_nocheck_*() to make the layout
similar to getuser.S.  This will also make it easier to do a subsequent
change.  No functional changes.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/lib/putuser.S | 67 ++++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/arch/x86/lib/putuser.S b/arch/x86/lib/putuser.S
index 09b7e37934ab..cb137e0286be 100644
--- a/arch/x86/lib/putuser.S
+++ b/arch/x86/lib/putuser.S
@@ -54,59 +54,32 @@ SYM_FUNC_START(__put_user_1)
 SYM_FUNC_END(__put_user_1)
 EXPORT_SYMBOL(__put_user_1)
 
-SYM_FUNC_START(__put_user_nocheck_1)
-	ASM_STAC
-2:	movb %al,(%_ASM_CX)
-	xor %ecx,%ecx
-	ASM_CLAC
-	RET
-SYM_FUNC_END(__put_user_nocheck_1)
-EXPORT_SYMBOL(__put_user_nocheck_1)
-
 SYM_FUNC_START(__put_user_2)
 	check_range size=2
 	ASM_STAC
-3:	movw %ax,(%_ASM_CX)
+2:	movw %ax,(%_ASM_CX)
 	xor %ecx,%ecx
 	ASM_CLAC
 	RET
 SYM_FUNC_END(__put_user_2)
 EXPORT_SYMBOL(__put_user_2)
 
-SYM_FUNC_START(__put_user_nocheck_2)
-	ASM_STAC
-4:	movw %ax,(%_ASM_CX)
-	xor %ecx,%ecx
-	ASM_CLAC
-	RET
-SYM_FUNC_END(__put_user_nocheck_2)
-EXPORT_SYMBOL(__put_user_nocheck_2)
-
 SYM_FUNC_START(__put_user_4)
 	check_range size=4
 	ASM_STAC
-5:	movl %eax,(%_ASM_CX)
+3:	movl %eax,(%_ASM_CX)
 	xor %ecx,%ecx
 	ASM_CLAC
 	RET
 SYM_FUNC_END(__put_user_4)
 EXPORT_SYMBOL(__put_user_4)
 
-SYM_FUNC_START(__put_user_nocheck_4)
-	ASM_STAC
-6:	movl %eax,(%_ASM_CX)
-	xor %ecx,%ecx
-	ASM_CLAC
-	RET
-SYM_FUNC_END(__put_user_nocheck_4)
-EXPORT_SYMBOL(__put_user_nocheck_4)
-
 SYM_FUNC_START(__put_user_8)
 	check_range size=8
 	ASM_STAC
-7:	mov %_ASM_AX,(%_ASM_CX)
+4:	mov %_ASM_AX,(%_ASM_CX)
 #ifdef CONFIG_X86_32
-8:	movl %edx,4(%_ASM_CX)
+5:	movl %edx,4(%_ASM_CX)
 #endif
 	xor %ecx,%ecx
 	ASM_CLAC
@@ -114,6 +87,34 @@ SYM_FUNC_START(__put_user_8)
 SYM_FUNC_END(__put_user_8)
 EXPORT_SYMBOL(__put_user_8)
 
+/* .. and the same for __put_user, just without the range checks */
+SYM_FUNC_START(__put_user_nocheck_1)
+	ASM_STAC
+6:	movb %al,(%_ASM_CX)
+	xor %ecx,%ecx
+	ASM_CLAC
+	RET
+SYM_FUNC_END(__put_user_nocheck_1)
+EXPORT_SYMBOL(__put_user_nocheck_1)
+
+SYM_FUNC_START(__put_user_nocheck_2)
+	ASM_STAC
+7:	movw %ax,(%_ASM_CX)
+	xor %ecx,%ecx
+	ASM_CLAC
+	RET
+SYM_FUNC_END(__put_user_nocheck_2)
+EXPORT_SYMBOL(__put_user_nocheck_2)
+
+SYM_FUNC_START(__put_user_nocheck_4)
+	ASM_STAC
+8:	movl %eax,(%_ASM_CX)
+	xor %ecx,%ecx
+	ASM_CLAC
+	RET
+SYM_FUNC_END(__put_user_nocheck_4)
+EXPORT_SYMBOL(__put_user_nocheck_4)
+
 SYM_FUNC_START(__put_user_nocheck_8)
 	ASM_STAC
 9:	mov %_ASM_AX,(%_ASM_CX)
@@ -137,11 +138,13 @@ SYM_CODE_END(__put_user_handle_exception)
 	_ASM_EXTABLE_UA(2b, __put_user_handle_exception)
 	_ASM_EXTABLE_UA(3b, __put_user_handle_exception)
 	_ASM_EXTABLE_UA(4b, __put_user_handle_exception)
+#ifdef CONFIG_X86_32
 	_ASM_EXTABLE_UA(5b, __put_user_handle_exception)
+#endif
 	_ASM_EXTABLE_UA(6b, __put_user_handle_exception)
 	_ASM_EXTABLE_UA(7b, __put_user_handle_exception)
+	_ASM_EXTABLE_UA(8b, __put_user_handle_exception)
 	_ASM_EXTABLE_UA(9b, __put_user_handle_exception)
 #ifdef CONFIG_X86_32
-	_ASM_EXTABLE_UA(8b, __put_user_handle_exception)
 	_ASM_EXTABLE_UA(10b, __put_user_handle_exception)
 #endif
-- 
2.47.0


