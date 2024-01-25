Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6936283CFC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 23:57:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eCwoJwnY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLbnf3swQz3vl4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 09:57:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eCwoJwnY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLblp6rl6z3bn6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 09:56:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4ABFA62373;
	Thu, 25 Jan 2024 22:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5F3C43141;
	Thu, 25 Jan 2024 22:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706223365;
	bh=6wq1GuvDlEslZKmrg6tmS3nUaar/vpxm/uhXrm7yG3M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eCwoJwnYFU9XS3munio2UjVcIivKmI2PwjQ22ghkTjNo8XlOpXypa9AYIREAyQAN4
	 21iGjuR68kHSLLGm7wHTcZLQC0m2slQoqlH3ziAelVTKbqgGM8jEL5SW8lcfx60IRg
	 jjAOdK58VBZkJrgq1TmcDz6sylZLkD9FTdn2cd0jvlf5NDIBAdlgI+OSoxw9biFRiV
	 Z03FwGhsZDcxccCRZj6ORNakIPiQvwwlJEwbmjdwaCa2GmM51au7ZYjoDS7+cJt+C+
	 4PEwkum142q73TJuru5DRbygyCWAMn5M3KTCjqNlZHdl/nyhyG97QiODY3zr7Bgu53
	 YxVobvzS2X+IQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 25 Jan 2024 15:55:12 -0700
Subject: [PATCH 06/11] powerpc: Kconfig: Remove tautology in CONFIG_COMPAT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240125-bump-min-llvm-ver-to-13-0-1-v1-6-f5ff9bda41c5@kernel.org>
References: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
In-Reply-To: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
To: akpm@linux-foundation.org, masahiroy@kernel.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039; i=nathan@kernel.org;
 h=from:subject:message-id; bh=6wq1GuvDlEslZKmrg6tmS3nUaar/vpxm/uhXrm7yG3M=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKmbnv1TnCfHLDdjGruCEvPaHoOZztX5V6ZdWlK4/Weru
 9jnj1HVHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiMlEM/2sfzzHaUhLHYsQk
 pLiXLerRRKGXamf1bTn6wt2CEmKnzWRkWBrPG3WE1XGKp9rBogOTPwUxql+sPrnK8nZlQe/fxCM
 qvAA=
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
Cc: aneesh.kumar@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, npiggin@gmail.com, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 6fcb574125e6 ("powerpc: Kconfig: disable
CONFIG_COMPAT for clang < 12").

Now that the minimum supported version of LLVM for building the kernel
has been bumped to 13.0.1, this condition is always true, as the build
will fail during the configuration stage for older LLVM versions. Remove
it.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: mpe@ellerman.id.au
Cc: npiggin@gmail.com
Cc: aneesh.kumar@kernel.org
Cc: naveen.n.rao@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b9fc064d38d2..86da0d01365a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -333,7 +333,6 @@ config PANIC_TIMEOUT
 config COMPAT
 	bool "Enable support for 32bit binaries"
 	depends on PPC64
-	depends on !CC_IS_CLANG || CLANG_VERSION >= 120000
 	default y if !CPU_LITTLE_ENDIAN
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT_OLD_SIGACTION

-- 
2.43.0

