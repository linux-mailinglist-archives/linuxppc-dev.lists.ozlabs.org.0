Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C65B89A4FB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 21:32:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=la9buEdi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VB7sq0ZCPz3vj6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 06:32:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=la9buEdi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VB7s36YSBz3vdh
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Apr 2024 06:31:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3BA46CE25CB;
	Fri,  5 Apr 2024 19:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2D5C433F1;
	Fri,  5 Apr 2024 19:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712345491;
	bh=mcHa8E2wMvHirG3Mz0WBJUwRUj2+EY6b29WpKMTq2oo=;
	h=From:Date:Subject:To:Cc:From;
	b=la9buEdiiWXnCF+EY1rlq48u/vV8KcmM3HksMr7eGGWuWgB0vQX+9hVTplQne7rEu
	 XJeZdkV95kXtn13j7qH70nmG+YJEwJmUe1NH8TZEo3899vyRHYsteYm3zbNfBwEzva
	 OCUMPPR+5UVI/QopysTEERQSuwRvCrlnQ1gRjDLcPXek7V8MhivuOxPRJNwu6HNSDb
	 kKl7FYr9pk58FHv6oxog/+bTn+HNXgr4/n5+Y8DQC3A5I/kAyHHxfrRxZFMSfFdJCO
	 luEiIT2SoIPUaEaWyrM44M/wLp98BGwZJeZ6gOx8MpEyBgspsjYJFWxmb/IN/DNCdK
	 JkU4BkjcnCDUg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 05 Apr 2024 12:31:22 -0700
Subject: [PATCH] powerpc: Fix fatal warnings flag for LLVM's integrated
 assembler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240405-ppc-fix-wa-fatal-warnings-clang-v1-1-bdcd969f2ef0@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIlREGYC/x2NQQqAMAwEvyI5G4hWPfgV8VBrqgGppRUVxL8bv
 O3AMPtA5iScoS8eSHxKlj0oVGUBbrVhYZRZGWqqG2qoxRgdernxsujtYTcdKUhYMrpNfezIeOJ
 posoY0EpMrPr/MIzv+wFxgQ4KcQAAAA==
To: mpe@ellerman.id.au
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225; i=nathan@kernel.org;
 h=from:subject:message-id; bh=mcHa8E2wMvHirG3Mz0WBJUwRUj2+EY6b29WpKMTq2oo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGkCgZP8buuU9mXWO53Qqd4Qz1AmZMvTckLlQoZcyuLve
 wuLy191lLIwiHExyIopslQ/Vj1uaDjnLOONU5Ng5rAygQxh4OIUgImcvMLwV0i5d+lrn9C1+WK/
 wop1RXa2dB7YVdY6+/sdg9hpNysYHjH8d63360lLENe61FK3++fXyH+hng8r2duEL9lpfdkpqGb
 CBQA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: justinstitt@google.com, ajd@linux.ibm.com, llvm@lists.linux.dev, patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, morbo@google.com, bgray@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building with LLVM_IAS=1, there is an error because
'-fatal-warnings' is not recognized as a valid flag:

  clang: error: unsupported argument '-fatal-warnings' to option '-Wa,'

Use the double hyphen version of the flag, '--fatal-warnings', which
works with both the GNU assembler and LLVM's integrated assembler.

Fixes: 608d4a5ca563 ("powerpc: Error on assembly warnings")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/Kbuild | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kbuild b/arch/powerpc/Kbuild
index da862e9558bc..571f260b0842 100644
--- a/arch/powerpc/Kbuild
+++ b/arch/powerpc/Kbuild
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-subdir-ccflags-$(CONFIG_PPC_WERROR) := -Werror -Wa,-fatal-warnings
-subdir-asflags-$(CONFIG_PPC_WERROR) := -Wa,-fatal-warnings
+subdir-ccflags-$(CONFIG_PPC_WERROR) := -Werror -Wa,--fatal-warnings
+subdir-asflags-$(CONFIG_PPC_WERROR) := -Wa,--fatal-warnings
 
 obj-y += kernel/
 obj-y += mm/

---
base-commit: bfe51886ca544956eb4ff924d1937ac01d0ca9c8
change-id: 20240405-ppc-fix-wa-fatal-warnings-clang-603f0ebb0133

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

