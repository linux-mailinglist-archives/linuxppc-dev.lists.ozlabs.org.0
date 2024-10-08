Return-Path: <linuxppc-dev+bounces-1806-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA833993DE3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 06:22:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN2tR1r2zz301w;
	Tue,  8 Oct 2024 15:22:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728361359;
	cv=none; b=mBylJruFqCrLkfECVUj1RWDDUv1jzYgRXQ42us48EwwTVlzZI+5jOQd0rl6TWgA0FWXEzBHX6wpIZm4JL80dAvgXZmo1biTiKfswvZdeHzR0Vm92fR7KJR1WCIfPGMAyWvyq5CsdAXpJ7wnJ1o3uHPN+eTVuIBuEU6P/epvOexNnVXFV3OdTHueE+0aZVY8UUVbj9tphvk+o1+qg0g3jOTINpwS1RI+g9sTxk0Fw9QYmNTrrlHudP79SaYdnbwfIYBg64TF4fvJQSQfonfTdVuMIXKQ2ON61WXkEthGR73i5fgnvfvdkDz3c7we5NsQgVqXRGGxX+tq79X+ErjArxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728361359; c=relaxed/relaxed;
	bh=EcoVwAUxN8nYSw+6gjdzqaO7nEImvZ1dzO1lLph7nH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OZxuFiI1hR8eIfiwvfciXTfjYWwLyTzC13WWcV/Pfzjro2OD5+ZmGodjtkGm1GgbsKkv+BzFXl5DxoAx/GTd2UC4UnxHv25uarLCzwhDHKtrTyhp+71zl3n6umaPiGw7ff1X5PodWL8ncRBdL+Utqa35EOTiQux7G+w33IDw5gxaGOQPTulJGAgB4pdiDPkBU8yyVHA90KdIhjGsi/os2nYgUbzoxLiXIO/K/e8W8GVl/TUszltaluTIjsf4P18GONh2ZW9vVsCCgymfWCJXcCx1+veGVmQb+OKGHc1oxnF4ipXIphobdkGT0giLYAlxQ+q3pl10M6H9z3Zi7qbL1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gthp3Bj0; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gthp3Bj0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN2tP6tmvz2yN4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 15:22:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8ED3BA431D7;
	Tue,  8 Oct 2024 04:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27873C4CECC;
	Tue,  8 Oct 2024 04:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728361353;
	bh=+wY/P7Mzm/p1v2vQEghvlVOqCHOLAZoABB4rJCcKJzw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gthp3Bj0P2AIZDnyPvPDLU5BmlPwq0tkbebnzUDYhbZ0quFE3mS9Z/hCEbP3Jrf2d
	 1ojun3a306we9Zrn0f+yEuJpDwK+34DhKew3o5il85jQq7pSHjUqMYpifqfIEjdkdy
	 aAj/nbJuv87EDF+XUXrCXPNOZkU8t61CGDRfLoVoyVwn3tixuPgkccLwps5aS0zD8T
	 OXeeuMQi/9wPPbYv/CemMHHbqlY4U2jChy8Jyqmyte+8jJW+XV9fHMcdnkxTeqbuey
	 VYSZQdtbHgw5rGxhGFfeD+vDfElwjG9DCeJ0UqdTyASQ3zi1uvuqkz6Dk7I0eiscKP
	 tLXynFvQKvuHQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 07 Oct 2024 21:22:03 -0700
Subject: [PATCH 1/3] powerpc: Fix stack protector Kconfig test for clang
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-powerpc-fix-stackprotector-test-clang-v1-1-08c15b2694e4@kernel.org>
References: <20241007-powerpc-fix-stackprotector-test-clang-v1-0-08c15b2694e4@kernel.org>
In-Reply-To: <20241007-powerpc-fix-stackprotector-test-clang-v1-0-08c15b2694e4@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Keith Packard <keithp@keithp.com>, linuxppc-dev@lists.ozlabs.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2181; i=nathan@kernel.org;
 h=from:subject:message-id; bh=+wY/P7Mzm/p1v2vQEghvlVOqCHOLAZoABB4rJCcKJzw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOksm9ufuT3Z4dui5vaR+eQnZn6u/ilr5kbkLllTuyLWh
 VFi3bHDHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiP/Yz/K9eZ7fa//CFlVr9
 MWoKFcJGFyPOd6hHa836+1T7e9sPLhWG/+WVS96c/fgieYHAubu3dtsmP+R/12xSwrRK9LDBNJb
 7z7gB
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Clang's in-progress per-task stack protector support [1] does not work
with the current Kconfig checks because '-mstack-protector-guard-offset'
is not provided, unlike all other architecture Kconfig checks.

  $ fd Kconfig -x rg -l mstack-protector-guard-offset
  ./arch/arm/Kconfig
  ./arch/riscv/Kconfig
  ./arch/arm64/Kconfig

This produces an error from clang, which is interpreted as the flags not
being supported at all when they really are.

  $ clang --target=powerpc64-linux-gnu \
          -mstack-protector-guard=tls \
          -mstack-protector-guard-reg=r13 \
          -c -o /dev/null -x c /dev/null
  clang: error: '-mstack-protector-guard=tls' is used without '-mstack-protector-guard-offset', and there is no default

This argument will always be provided by the build system, so mirror
other architectures and use '-mstack-protector-guard-offset=0' for
testing support, which fixes the issue for clang and does not regress
support with GCC.

Link: https://github.com/llvm/llvm-project/pull/110928 [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8094a01974cca1d27002720e706f66bec2a2d035..eb98050b8c016bb23887a9d669d29e69d933c9c8 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -275,8 +275,8 @@ config PPC
 	select HAVE_RSEQ
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
-	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
-	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
+	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2 -mstack-protector-guard-offset=0)
+	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13 -mstack-protector-guard-offset=0)
 	select HAVE_STATIC_CALL			if PPC32
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING

-- 
2.47.0


