Return-Path: <linuxppc-dev+bounces-2657-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1AF9B3FF8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 02:57:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XctfM5HX8z2yRG;
	Tue, 29 Oct 2024 12:56:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730167003;
	cv=none; b=mRc8OljZCbyU/X9Ji8+QGbFAdNo1ZC69d/NzZVtKAjA9+SSEkPs63n5fo3vHW3jvMKvhgB9smqwN1fuTffJAgkiFchm61xBhHhexTelzltEB655EpLW5lCNDOYKJz3vqqgny5UHQrtwPxVJfESG+/MW3nlcqjeKe1RFuoA/SbsEQzNtvtW2641WkQFIr60NClaBugjFye4axLpe86G5ATTjBvNCzymUJtG/EBvuQUHn+RB/3XEejtFFcBSNLN0JWIEGliYsja0mymZ2F9Izlwp+6wEmS6JFhSTFIWc2Zt507ZN2Z/hrrYWdYLB96FfFB6ZlEqwHzHxj+Gg0m1PBdbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730167003; c=relaxed/relaxed;
	bh=lgS9tTl1x2VY8Ji/gmMgyNrR3r3Mg5RErO5Cb1VYpZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsXtWEbB/JqMh3AHSP7qmxuem1a89iyUCnNyaCD0XK7RX74ZY3CndTmIRWinqhiY1pLqd1GVDmTjBRsXvCDeWZV3GEesMrBUxqbXLgOZfeHJCHJGdG4RDxC1UzcBh5m5zF5tWzeZ2706hb4EHXluMPz5rvU0Kq/YeZq0+KZsAhadEs51ifXPlxqxY7l7/9peP3RWL+eBW+Hr3Aa8HmWjjilNyIT9A0m4ClXm2mhABTaP5bIx7fY+9t5HVA28qULxJ+w1vRxt4aJ3hNAAN18DUVu/UM8UiIis1jqb/kpmPKsr4dYYEQkDwccsPX7DqAeG4QMB+F0vkUCHgRe7IWQOfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p/i3rg0+; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p/i3rg0+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XctfL2GM0z2yJL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 12:56:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32BA25C596B;
	Tue, 29 Oct 2024 01:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773E1C4CEED;
	Tue, 29 Oct 2024 01:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730167000;
	bh=QREw5gInShg8RlBYBO/KbmEW/aIWpa9O4n4WwbznW28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p/i3rg0+GcboI8N2njvDewhf3Lx5tOneAJUvhe41ZjYhpb3nvfEGe6J3McphwC/wh
	 bXu7gyst9fK9MmRzhBOwhUEQrC6FOuzH6CnEuN8wQSqFWo2/WRywMbL+VzO/FRGbLW
	 ruB6Rjg1NFeygp1gYm7/HQlDhoFVS/XpgBROvm6Do1otTwtq8YuaZxpd0subXgDJz3
	 11hyZ4dzXXR0XUdgzdSSqCWzENIO6taqHERFvTQ/J6twLdZqbzaZcj5NxQsetiRRMj
	 yWKT9T/MdJ7VfBPmNVGTY+WcV56uJuL7FEOpFa6d3BwaSk6y2OBZmcUPD8+Yn327At
	 5QxKLc3K+1nEQ==
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
Subject: [PATCH v3 4/6] x86/uaccess: Convert 32-bit get_user() to unconditional pointer masking
Date: Mon, 28 Oct 2024 18:56:17 -0700
Message-ID: <088fc8f27c278791f3af29f94e09278b5fa07bea.1730166635.git.jpoimboe@kernel.org>
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
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Convert the 32-bit get_user() implementations to use the new
unconditional masking scheme for consistency with 64-bit.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/lib/getuser.S | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
index 998d5be6b794..5bce27670baa 100644
--- a/arch/x86/lib/getuser.S
+++ b/arch/x86/lib/getuser.S
@@ -37,22 +37,19 @@
 
 #define ASM_BARRIER_NOSPEC ALTERNATIVE "", "lfence", X86_FEATURE_LFENCE_RDTSC
 
-.macro check_range size:req
+.macro mask_user_address size:req
 .if IS_ENABLED(CONFIG_X86_64)
 	movq $0x0123456789abcdef,%rdx
   1:
   .pushsection runtime_ptr_USER_PTR_MAX,"a"
 	.long 1b - 8 - .
   .popsection
-	cmp %rax, %rdx
-	sbb %rdx, %rdx
-	or %rdx, %rax
 .else
-	cmp $TASK_SIZE_MAX-\size+1, %eax
-	jae .Lbad_get_user
-	sbb %edx, %edx		/* array_index_mask_nospec() */
-	and %edx, %eax
+	mov $TASK_SIZE_MAX-\size, %edx
 .endif
+	cmp %_ASM_AX, %_ASM_DX
+	sbb %_ASM_DX, %_ASM_DX
+	or  %_ASM_DX, %_ASM_AX
 .endm
 
 .macro UACCESS op src dst
@@ -63,7 +60,7 @@
 
 	.text
 SYM_FUNC_START(__get_user_1)
-	check_range size=1
+	mask_user_address size=1
 	ASM_STAC
 	UACCESS movzbl (%_ASM_AX),%edx
 	xor %eax,%eax
@@ -73,7 +70,7 @@ SYM_FUNC_END(__get_user_1)
 EXPORT_SYMBOL(__get_user_1)
 
 SYM_FUNC_START(__get_user_2)
-	check_range size=2
+	mask_user_address size=2
 	ASM_STAC
 	UACCESS movzwl (%_ASM_AX),%edx
 	xor %eax,%eax
@@ -83,7 +80,7 @@ SYM_FUNC_END(__get_user_2)
 EXPORT_SYMBOL(__get_user_2)
 
 SYM_FUNC_START(__get_user_4)
-	check_range size=4
+	mask_user_address size=4
 	ASM_STAC
 	UACCESS movl (%_ASM_AX),%edx
 	xor %eax,%eax
@@ -93,14 +90,12 @@ SYM_FUNC_END(__get_user_4)
 EXPORT_SYMBOL(__get_user_4)
 
 SYM_FUNC_START(__get_user_8)
-#ifndef CONFIG_X86_64
-	xor %ecx,%ecx
-#endif
-	check_range size=8
+	mask_user_address size=8
 	ASM_STAC
 #ifdef CONFIG_X86_64
 	UACCESS movq (%_ASM_AX),%rdx
 #else
+	xor %ecx,%ecx
 	UACCESS movl (%_ASM_AX),%edx
 	UACCESS movl 4(%_ASM_AX),%ecx
 #endif
@@ -113,7 +108,7 @@ EXPORT_SYMBOL(__get_user_8)
 /* .. and the same for __get_user, just without the range checks */
 SYM_FUNC_START(__get_user_nocheck_1)
 #ifdef CONFIG_X86_64
-	check_range size=1
+	mask_user_address size=1
 #else
 	ASM_BARRIER_NOSPEC
 #endif
@@ -127,7 +122,7 @@ EXPORT_SYMBOL(__get_user_nocheck_1)
 
 SYM_FUNC_START(__get_user_nocheck_2)
 #ifdef CONFIG_X86_64
-	check_range size=2
+	mask_user_address size=2
 #else
 	ASM_BARRIER_NOSPEC
 #endif
@@ -141,7 +136,7 @@ EXPORT_SYMBOL(__get_user_nocheck_2)
 
 SYM_FUNC_START(__get_user_nocheck_4)
 #ifdef CONFIG_X86_64
-	check_range size=4
+	mask_user_address size=4
 #else
 	ASM_BARRIER_NOSPEC
 #endif
@@ -155,7 +150,7 @@ EXPORT_SYMBOL(__get_user_nocheck_4)
 
 SYM_FUNC_START(__get_user_nocheck_8)
 #ifdef CONFIG_X86_64
-	check_range size=8
+	mask_user_address size=8
 #else
 	ASM_BARRIER_NOSPEC
 #endif
-- 
2.47.0


