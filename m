Return-Path: <linuxppc-dev+bounces-2655-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E27B39B3FF3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 02:56:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XctfK6RjVz2y8d;
	Tue, 29 Oct 2024 12:56:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730167001;
	cv=none; b=nnVTHkm4dpZUaeOCH8cDHhifqaI+uPs8O4uTV20vuinz5oRVZp/eplW0IHvVgVfT4JVLlN6+8N6DlZcaFeGSLRONI1o+YZbmBq2nNnvUjy0JmsSo87GuXYCUqlELj9O7LRHHzjnCsGg8krVoArsa5mNc5dqd+Eu1F8xFnhUbuokSVO+l98L+nMjvoE/CVQCpa8RzRugFq5fEc6Vydmt6CdJ27LlutJjvv6rTSaa15F0OfmuVijg04W/GMd2j4i+dBT4w3yEH1xY2yN6LjeaPcz5NbwTyvCURA0pMjuqrlwmobtkRoGgaBsyo4Cjk73bg0+eLBVGJEzzKozQkM70MqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730167001; c=relaxed/relaxed;
	bh=D0Kvt+r2II9l8nRQLU4K4JAyvaukHnWJxCbO+k3BMmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xhys9qOvsr/SA8ZlFapEU/5OOvmdkI+NeD4M5qgdfEfWHLgCL7wrxShL/jTPbQFYhE6aUrZJZth80/VSb0dUaTQ091OoQEdd0dcPbYVzzS356f4wvEXvYWor6LMlE9qqDZPBGntFu1LRPU3NRUkLIZ3tu36rFO5+up0miNVWMo5kF0LdJpUG6+SZOq8jd6WhEUR52tAYqrWgvRy+fYkL7HSxm6vYL2NFAoyBIx2+LUCj9s+F74OZGO/pCfjrdevjVFlfxKopOXNVsoI7oCBCQ3ze39TIfcIAqoOLEtL8NOXOCDPIcAHuusCoLMeOY6stvoxyTi2aNBSJQvINvngkTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hEx13d/g; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hEx13d/g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XctfJ6qJSz2xpl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 12:56:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C585B5C58C8;
	Tue, 29 Oct 2024 01:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4299C4CEE8;
	Tue, 29 Oct 2024 01:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730166998;
	bh=1HFVF/sthwuY/nVC5nB3Tk5D/RnkHEBPEeATrZPxBVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hEx13d/g9zNFzT2Tm1otgP9Q6bo86MvJMnE3VeZuPF+db0/rNspoRci34fi4xQ8/A
	 8KShpsxrYY3uamRJLnpeK7Gg7TqHo+S9jO19TL/Gijhmz785HmXFSRwcRRUTaAgBX9
	 FqqenAr2bOVk2zxF4rG6uBvzY0sZHl+CCZ2G3jWG1jX2fDyu8OW+5MuONEF9y53Yvk
	 t1MbquE+UDbl+kIl1RfltOEpe1tN8z/W5D6rBM1WB6qkl+HibSi9wE01rCh/hkhSyJ
	 xMbSHmFDSZT48TFuStkxHtqWqyQzTxwVo3kMViedmLL9/dLBqPQotuyLcNhOrXiP7r
	 GsiugLVijporg==
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
Subject: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit __get_user()
Date: Mon, 28 Oct 2024 18:56:15 -0700
Message-ID: <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
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

The barrier_nospec() in 64-bit __get_user() is slow.  Instead use
pointer masking to force the user pointer to all 1's if a previous
access_ok() mispredicted true for an invalid address.

Note that for safety on some AMD CPUs, this relies on recent commit
86e6b1547b3d ("x86: fix user address masking non-canonical speculation
issue").

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/lib/getuser.S | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
index 4357ec2a0bfc..998d5be6b794 100644
--- a/arch/x86/lib/getuser.S
+++ b/arch/x86/lib/getuser.S
@@ -112,8 +112,12 @@ EXPORT_SYMBOL(__get_user_8)
 
 /* .. and the same for __get_user, just without the range checks */
 SYM_FUNC_START(__get_user_nocheck_1)
-	ASM_STAC
+#ifdef CONFIG_X86_64
+	check_range size=1
+#else
 	ASM_BARRIER_NOSPEC
+#endif
+	ASM_STAC
 	UACCESS movzbl (%_ASM_AX),%edx
 	xor %eax,%eax
 	ASM_CLAC
@@ -122,8 +126,12 @@ SYM_FUNC_END(__get_user_nocheck_1)
 EXPORT_SYMBOL(__get_user_nocheck_1)
 
 SYM_FUNC_START(__get_user_nocheck_2)
-	ASM_STAC
+#ifdef CONFIG_X86_64
+	check_range size=2
+#else
 	ASM_BARRIER_NOSPEC
+#endif
+	ASM_STAC
 	UACCESS movzwl (%_ASM_AX),%edx
 	xor %eax,%eax
 	ASM_CLAC
@@ -132,8 +140,12 @@ SYM_FUNC_END(__get_user_nocheck_2)
 EXPORT_SYMBOL(__get_user_nocheck_2)
 
 SYM_FUNC_START(__get_user_nocheck_4)
-	ASM_STAC
+#ifdef CONFIG_X86_64
+	check_range size=4
+#else
 	ASM_BARRIER_NOSPEC
+#endif
+	ASM_STAC
 	UACCESS movl (%_ASM_AX),%edx
 	xor %eax,%eax
 	ASM_CLAC
@@ -142,8 +154,12 @@ SYM_FUNC_END(__get_user_nocheck_4)
 EXPORT_SYMBOL(__get_user_nocheck_4)
 
 SYM_FUNC_START(__get_user_nocheck_8)
-	ASM_STAC
+#ifdef CONFIG_X86_64
+	check_range size=8
+#else
 	ASM_BARRIER_NOSPEC
+#endif
+	ASM_STAC
 #ifdef CONFIG_X86_64
 	UACCESS movq (%_ASM_AX),%rdx
 #else
-- 
2.47.0


