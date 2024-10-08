Return-Path: <linuxppc-dev+bounces-1807-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BF2993DE5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 06:22:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN2tR6Qhsz2yN4;
	Tue,  8 Oct 2024 15:22:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728361359;
	cv=none; b=TH372eQDZEFJ8tNBQ2DFg5CYaaz3T6x9amxuxkwl+KQew048NMATkVhHwexcdsucj/xif1NJWXJ2Ze8aZdIzol1jbk1oMm900I+cGZI+bQoxoxUllHujeSs9YK3d0/xVjOuacXBcSTghTycpKYmpdEy/UeRrkrWuzuIVEG5Cu4xQEjsK48unjfW//pT6gl14NIJMbZCsTZIJbQY7ajro3J+835yG1XQNWWvAO79zv/1UlDOHEbnUKgLxjjzxB8rk3yAoo60e49wFwnHjXyMl5tvvPqm4sQUm+jSbr5MGsZjY+X5QEcsE0wdvgErNj2Vc2XKv6QBxFqYw1gmYfa2tTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728361359; c=relaxed/relaxed;
	bh=kVHZvmi3RAHchenM0+mAuHPEj96XMUiEI7tBRSq52LU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j3xs1EK1nfaIqJ5XhgaN0kFdUOCXJgxReOcZ/3W88hf1EldOr9GsA0RaGsl+KXWP07kXs8L1NlEk+bUFq4f6tEj6bYTlQ9YtHqbCEk1ef5+Wsq2Chyyj/XSK9HYvXL7Zb4iqNqbalM9t3vu4zAQy9T8l0GEhUMVGcPkZ9Dmq5TqLFfL2FEj6NY7XiMOXlmYQBNW55cqy4UIOwzhfEPp0jsb+1PBsriGhRMZWoUK+Cnde5h8z/H7W7Uvh5z5tSr7jpCQ4kxZlQykQ5GLQg1tgMbLy5kbbuEBMO5OwEtm7wv14F4VPQXi/u3X+11aCmRM4NbBbIR5mxGre3NNEgNze/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fgj7pJKt; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fgj7pJKt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN2tP6zRRz2ysb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 15:22:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6FDC9A431DA;
	Tue,  8 Oct 2024 04:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08BF8C4CED1;
	Tue,  8 Oct 2024 04:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728361354;
	bh=CQpN5id32lq/DGrce8Pbuy5QP+ZsBWS9RkPNDANX6pw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fgj7pJKtimCDmlvDt49Vq++mtqYmEG0QETyNzqgwVWrlPznHZLVLNcewsCCjigoAQ
	 i2o1nlN7ZmN/do38C9SVxcErFNEYE6IIFFCLvP5bkjkpINwHiAQJtzs2TUCqcsjgfs
	 me9TBp291n1J6pVoCvqcT/SY0evtCjeLWSDVgZIpg4ay3jg3T3T5Qhqp48716Vjk3W
	 WonNEeVsdbW5i/JsiuDtOn4SuC6hinbvDvRsEwV4EE9Rg94awK6OyK3sYhis/bi5Wl
	 mkvAIvvPOV/bCHnLCstiawrOb4iCV7JsHwPuL8RinrtKWqFH9/ddVOdw0d0nkN6wfY
	 rNgoVftm09B6w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 07 Oct 2024 21:22:04 -0700
Subject: [PATCH 2/3] powerpc: Adjust adding stack protector flags to
 KBUILD_CLAGS for clang
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
Message-Id: <20241007-powerpc-fix-stackprotector-test-clang-v1-2-08c15b2694e4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2742; i=nathan@kernel.org;
 h=from:subject:message-id; bh=CQpN5id32lq/DGrce8Pbuy5QP+ZsBWS9RkPNDANX6pw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOksm9tfNopN8Alwn7wrreFtwtNGlX+XM+K/cOQn+vrbf
 lAvDb3ZUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACayO5Hhn4bRwTNsT95yL/A1
 mTj3sNDLlOkRln/F++1OaVWFvt7zXp+RYdti9qpJ9xZLLNPsX7kqMn9LQ9oPLfYPZm9ChPom1Mg
 nsgAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

After fixing the HAVE_STACKPROTECTER checks for clang's in-progress
per-task stack protector support [1], the build fails during prepare0
because '-mstack-protector-guard-offset' has not been added to
KBUILD_CFLAGS yet but the other '-mstack-protector-guard' flags have.

  clang: error: '-mstack-protector-guard=tls' is used without '-mstack-protector-guard-offset', and there is no default
  clang: error: '-mstack-protector-guard=tls' is used without '-mstack-protector-guard-offset', and there is no default
  make[4]: *** [scripts/Makefile.build:229: scripts/mod/empty.o] Error 1
  make[4]: *** [scripts/Makefile.build:102: scripts/mod/devicetable-offsets.s] Error 1

Mirror other architectures and add all '-mstack-protector-guard' flags
to KBUILD_CFLAGS atomically during stack_protector_prepare, which
resolves the issue and allows clang's implementation to fully work with
the kernel.

Link: https://github.com/llvm/llvm-project/pull/110928 [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/Makefile | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index bbfe4a1f06ef9db9b2f2e48e02096b1e0500a14b..8f9e387c4c7dd06d8756dca3eac808cc344a937d 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -100,13 +100,6 @@ KBUILD_AFLAGS	+= -m$(BITS)
 KBUILD_LDFLAGS	+= -m elf$(BITS)$(LDEMULATION)
 endif
 
-cflags-$(CONFIG_STACKPROTECTOR)	+= -mstack-protector-guard=tls
-ifdef CONFIG_PPC64
-cflags-$(CONFIG_STACKPROTECTOR)	+= -mstack-protector-guard-reg=r13
-else
-cflags-$(CONFIG_STACKPROTECTOR)	+= -mstack-protector-guard-reg=r2
-endif
-
 LDFLAGS_vmlinux-y := -Bstatic
 LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
 LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) += -z notext
@@ -402,9 +395,13 @@ prepare: stack_protector_prepare
 PHONY += stack_protector_prepare
 stack_protector_prepare: prepare0
 ifdef CONFIG_PPC64
-	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "PACA_CANARY") print $$3;}' include/generated/asm-offsets.h))
+	$(eval KBUILD_CFLAGS += -mstack-protector-guard=tls \
+				-mstack-protector-guard-reg=r13 \
+				-mstack-protector-guard-offset=$(shell awk '{if ($$2 == "PACA_CANARY") print $$3;}' include/generated/asm-offsets.h))
 else
-	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "TASK_CANARY") print $$3;}' include/generated/asm-offsets.h))
+	$(eval KBUILD_CFLAGS += -mstack-protector-guard=tls \
+				-mstack-protector-guard-reg=r2 \
+				-mstack-protector-guard-offset=$(shell awk '{if ($$2 == "TASK_CANARY") print $$3;}' include/generated/asm-offsets.h))
 endif
 endif
 

-- 
2.47.0


