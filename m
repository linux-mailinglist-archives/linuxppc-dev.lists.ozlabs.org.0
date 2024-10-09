Return-Path: <linuxppc-dev+bounces-1908-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 533889975AA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 21:26:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XP2tl69XHz3bcj;
	Thu, 10 Oct 2024 06:26:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728501983;
	cv=none; b=cw8NMyH1SifIa8z+Uw2Pau3VbYrvdNTC9FrrbPAMJAj2PEI9p/9IOyfYXiiuBYoQgsKC05f5SCKscpMA1i4nwk0m/TbiqDZQp4h1gseQgrpBgDFTyV7AovjDO4DYndL7eap7tObR2icn9gO5/+oVIMJwSGONotONluK7LqUvme1b5++1/XeZVz74jFTxlwrMoifSucp2Y+/3YeQCicHw9cSKnZCEom1sEEw/M8k0w00zNm5c21Zf9RDxNtoTQdPEjAP07VcwK+/hbzIiAyhl3QfZkFBN9BMXQ57FI/Elt8WxknBPfSrAQW55R7sjSkafq8D++kFV0A5ju0ffkC+alw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728501983; c=relaxed/relaxed;
	bh=JL9xA8RPnvp3Oe1P6yT9eiMIA/VF/YmftCbFnKbTHYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ORO62rPRuYZ/6yryV1RsaQD479KRVtVa0Yb68QIzY6YN+oeCLQhC+XjZrtpX7NUTZkjj1zDTSF1HNK8DfcnRlhbHPBdhqbMa2rMyPn4f2w49Hgnu0Ou6OuUzqJWAIcLTZYKxRnIPR/RDrm2QLOF/z4v0cADloNR7pOFFfwmJ6iSw8IhQSGiL7zdLVuUx0f/I6ujrYpfVPNZwQozT5YaAII550fjbg38h471X0H63joR+MwiIzl3SyCyh0VwH7E8OfA0RSGkdWuoPURfjHxoBdcaDa7QzquhrPvW6j33CwCbX1Md9klE4nAxh9y9A5u7kyKqVlww7EfOFzrjkm5ujoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t+uUmnmx; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t+uUmnmx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XP2tk3RBNz3bdq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 06:26:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6724BA44497;
	Wed,  9 Oct 2024 19:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B69C4AF0B;
	Wed,  9 Oct 2024 19:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728501979;
	bh=mj4tC05Afjr4W0qf5XiO9k6e8T16uFW78MQG6sHQpQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t+uUmnmxQyKFIlYgKdT/7gd9p9P+vVf4557pYJH7PGvuMA4HZT4tYoCelXRWBtiPV
	 Ma8dkiV4TgVqWkh5qveUQdivE+oWm3hcPLZ5GxzZg2nJ943izEkBsq5c+cE8JEht3t
	 iU+2nWgi2Fn3AvAZ1MPiBYxr38w+tEUM3iciSTljg7+OuiIu5jikpSB1sYX/N0X+f3
	 sV5cxYMfTZ6Jxh221V+QLS/pLuGETNFU3izpHjsQS/RhcFeQ+MRQL6iL4QnNrpUV/g
	 uLd3C3EJDonD+LpxJAy5xs+dHD4gXiF+2vaDZK6TH0qI2eg720eEiehWP0OGRw4ylF
	 EZeYdipUcgR2w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 09 Oct 2024 12:26:09 -0700
Subject: [PATCH v2 2/2] powerpc: Adjust adding stack protector flags to
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
Message-Id: <20241009-powerpc-fix-stackprotector-test-clang-v2-2-12fb86b31857@kernel.org>
References: <20241009-powerpc-fix-stackprotector-test-clang-v2-0-12fb86b31857@kernel.org>
In-Reply-To: <20241009-powerpc-fix-stackprotector-test-clang-v2-0-12fb86b31857@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Keith Packard <keithp@keithp.com>, linuxppc-dev@lists.ozlabs.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2853; i=nathan@kernel.org;
 h=from:subject:message-id; bh=mj4tC05Afjr4W0qf5XiO9k6e8T16uFW78MQG6sHQpQY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOlsN26saTolY5mtmWK72uQd3081W2El+2R99xcT/7hIW
 7pn3DvXUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACaixcjIcGr639tKLc56+6Rc
 xC6WJOd43T7wNFX5efS76ZK3Jd7M02b4p1w0cXf35f9uNZf3fTymkSP2XWy9TtCp4lMv7BXvXJ2
 4hhEA
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

Cc: stable@vger.kernel.org # 6.1+
Link: https://github.com/llvm/llvm-project/pull/110928 [1]
Reviewed-by: Keith Packard <keithp@keithp.com>
Tested-by: Keith Packard <keithp@keithp.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/Makefile | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index bbfe4a1f06ef9db9b2f2e48e02096b1e0500a14b..cbb353ddacb7adc5de28cd1fde893de3efdd8272 100644
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
@@ -402,9 +395,11 @@ prepare: stack_protector_prepare
 PHONY += stack_protector_prepare
 stack_protector_prepare: prepare0
 ifdef CONFIG_PPC64
-	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "PACA_CANARY") print $$3;}' include/generated/asm-offsets.h))
+	$(eval KBUILD_CFLAGS += -mstack-protector-guard=tls -mstack-protector-guard-reg=r13 \
+				-mstack-protector-guard-offset=$(shell awk '{if ($$2 == "PACA_CANARY") print $$3;}' include/generated/asm-offsets.h))
 else
-	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "TASK_CANARY") print $$3;}' include/generated/asm-offsets.h))
+	$(eval KBUILD_CFLAGS += -mstack-protector-guard=tls -mstack-protector-guard-reg=r2 \
+				-mstack-protector-guard-offset=$(shell awk '{if ($$2 == "TASK_CANARY") print $$3;}' include/generated/asm-offsets.h))
 endif
 endif
 

-- 
2.47.0


