Return-Path: <linuxppc-dev+bounces-2660-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C41EF9B3FFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 02:57:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XctfP57Dxz2xpl;
	Tue, 29 Oct 2024 12:56:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730167005;
	cv=none; b=WyXzRymjYsEG9nIERnzIZaa1CfXZy1/M4ElbZCIV7xASQDtV9mnBrldMOIYkL8JCe8rJ0rM5TqbfoSKlypSfMU+hPSRPTIruDIQGtwn61hep658j0l5Vgf7q+5sYPWmsXgX7a5uLP2HyeCHuMEJqMYnF3hcUZaBp78R1gWWf3Zt/LfJlYSaWdB71JDNHzHOR9Jo9rdSghQo/V8LGI2ng+t93cGwO/tTo5h7yaie+wEkLcLxqTE9WXG8KeTblfELttc+T8U2bCC/B083zqPW0WzXvJs4Aok/83a2vikC+CA26hf6Kq2PaqraoLcwkTCwahOEdQz3h/MCb1evuzQOeng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730167005; c=relaxed/relaxed;
	bh=1lFW7oeJd3eefnx8YstMi7VL+eIHzcS0mETkH7TPca4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijkY4xdTY5KUXo5zxQobPUAjUo2NNpL9VHUVDz2pizdkglwptiPf27J295nEwdM6IDXl/kloFSNdO6E045wbm0Q1eMfVETgwigz+lWUxBbsd5t9gcdr7a5z4igZk50vYflLMOFlisVCWKPyVEug4RVMon6mbDCJsEXZF6yhzEVrSM0aeRjgLkLao4P7tMGQ9CEaUKo8vnoNACk803NWFT2iMZiiLjCQlXDI/gPXSXg6jon3p/o+Bgh4J4fV/DhsjQKAg67x4k0h/X9/LK2yroq31HI9k2RWYMwywRhnp9tyEQwSTZwsi7CqxqulZSMFRldU+ZX94VLQwvwBM4HeJ9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vP6NtVLO; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vP6NtVLO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XctfM4BdTz2xy7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 12:56:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06180A41355;
	Tue, 29 Oct 2024 01:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7E1C4CEE9;
	Tue, 29 Oct 2024 01:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730167000;
	bh=IE8lVpfvQw2PdSSBXAG4ZavNEB/AEx7acTSv9OtsKdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vP6NtVLOF5MSVKXfLbiGaQ7rBrz+nwyn8OXmIPidSHqN94Ang0Ey0IFWTqlQK1Y0v
	 V1YUzspWLwVcW+caX08qDq9t+paQGzRtumCwpcxsaU4+P0U+u7Q5y5Phy8Q3imUW8m
	 zxIW5wlVIcBdkGg52Rk3zm/U6tVT4iD9LMDOtGItWX+1MBjIT9VgEkGjLW6DajtVe/
	 7xXxdQ78h4plFwmfB1nMdTs/1fryGbDiMkZ3EduhzgoHB5FruTbTRfgGGFQgm946dh
	 0dsmcqJ37mPTRF42IIebnKYp8XbTcyzaWb882nZlhGRmM0OHPvG0B59kJVNh/rqpK7
	 1tYWuy5PrYXRg==
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
Subject: [PATCH v3 5/6] x86/uaccess: Avoid barrier_nospec() in 32-bit __get_user()
Date: Mon, 28 Oct 2024 18:56:18 -0700
Message-ID: <967768924bd5295c231b6bfd37e3cbf85dad3cb2.1730166635.git.jpoimboe@kernel.org>
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

The barrier_nospec() in 34-bit __get_user() is slow.  Instead use
pointer masking to force the user pointer to all 1's if the access_ok()
mispredicted true for an invalid address.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/lib/getuser.S | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
index 5bce27670baa..7da4fc75eba9 100644
--- a/arch/x86/lib/getuser.S
+++ b/arch/x86/lib/getuser.S
@@ -35,8 +35,6 @@
 #include <asm/asm.h>
 #include <asm/smap.h>
 
-#define ASM_BARRIER_NOSPEC ALTERNATIVE "", "lfence", X86_FEATURE_LFENCE_RDTSC
-
 .macro mask_user_address size:req
 .if IS_ENABLED(CONFIG_X86_64)
 	movq $0x0123456789abcdef,%rdx
@@ -107,11 +105,7 @@ EXPORT_SYMBOL(__get_user_8)
 
 /* .. and the same for __get_user, just without the range checks */
 SYM_FUNC_START(__get_user_nocheck_1)
-#ifdef CONFIG_X86_64
 	mask_user_address size=1
-#else
-	ASM_BARRIER_NOSPEC
-#endif
 	ASM_STAC
 	UACCESS movzbl (%_ASM_AX),%edx
 	xor %eax,%eax
@@ -121,11 +115,7 @@ SYM_FUNC_END(__get_user_nocheck_1)
 EXPORT_SYMBOL(__get_user_nocheck_1)
 
 SYM_FUNC_START(__get_user_nocheck_2)
-#ifdef CONFIG_X86_64
 	mask_user_address size=2
-#else
-	ASM_BARRIER_NOSPEC
-#endif
 	ASM_STAC
 	UACCESS movzwl (%_ASM_AX),%edx
 	xor %eax,%eax
@@ -135,11 +125,7 @@ SYM_FUNC_END(__get_user_nocheck_2)
 EXPORT_SYMBOL(__get_user_nocheck_2)
 
 SYM_FUNC_START(__get_user_nocheck_4)
-#ifdef CONFIG_X86_64
 	mask_user_address size=4
-#else
-	ASM_BARRIER_NOSPEC
-#endif
 	ASM_STAC
 	UACCESS movl (%_ASM_AX),%edx
 	xor %eax,%eax
@@ -149,11 +135,7 @@ SYM_FUNC_END(__get_user_nocheck_4)
 EXPORT_SYMBOL(__get_user_nocheck_4)
 
 SYM_FUNC_START(__get_user_nocheck_8)
-#ifdef CONFIG_X86_64
 	mask_user_address size=8
-#else
-	ASM_BARRIER_NOSPEC
-#endif
 	ASM_STAC
 #ifdef CONFIG_X86_64
 	UACCESS movq (%_ASM_AX),%rdx
-- 
2.47.0


