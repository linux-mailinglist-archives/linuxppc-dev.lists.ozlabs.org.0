Return-Path: <linuxppc-dev+bounces-11179-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6544EB3081E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Aug 2025 23:16:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7GMf1STNz3bkb;
	Fri, 22 Aug 2025 07:16:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755810974;
	cv=none; b=XnqcBqftGjr3NiW3Ia3csj16x/XxrGY7RuKH6tg/xiaMEleEGakJvPmkPhiXeULxJzSh7b3JuXdZ/uOfmqkhiFUbaK+idUhRfzkZOZGrN200uT7WIt3vMljx+O+Z1XN1T3sxqxrkiwnso4TCmaHmGQ/b7ENWpIxghZQeSlkCiT3/DQEkPQLv2psOOt7y6ArYE3DGjFv9WF0ldXf1wds3MZoq6ufGGnHvwRxaaAF9OrY0PXzQqukWL97eJDyqNGIV0X9z8fjcwZWgbFiJekXUdsG9qlgM9m/t+59LZnB8Ya7EhSW/1oOsyZff1AzVp4pE+SYAmvRZhUZpgNrzF/LzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755810974; c=relaxed/relaxed;
	bh=uj+2zctA/B8YBGKL+tFXzZUHRtBm9aQ6xUhuVZMJ9EQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l7+R3fyKYmuS2xB44CrQk2NipaGl9Nt/WZkSyyppNkt44SmisAoEBmWo/Qg0BYs5EaeC8BSFAgeQ4qsPpxmLi6w3fxTlaRrfCTwHyd5iUngQBRNoj2vZykNKFySApg++f+b9SZpmPBgru/2VppQPQlS0Rb7anwA1mp2cK2WK+bT8uFU8U64L9mZsWFxk76thEvsLQ66SBVT/WZshoEk1TQtsEMv3EX6TV/HqQLoaAYXIAsqZYaISpqRlJtHw3x8CDTXht/uoesoN6cr4SbleCC7A7TEBGySwoDxOGstCgWr3QNX6bNYoGgW+OWoZgxDZyv/VjQ0Zth3CKgXoMWuUuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dz2OPjIC; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dz2OPjIC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7GMd4tmNz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 07:16:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA7E4601F8;
	Thu, 21 Aug 2025 21:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B20C4AF09;
	Thu, 21 Aug 2025 21:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755810971;
	bh=VGQQUffBKqpf2H5DeF+t1nkRASxbDSX8NAduqgnqPbk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dz2OPjICxh9rvlzA1oWyJydNTsN/KJBpcD7R933teboo6pz8NFaVzKPhAChC6iq14
	 FwZnGeeGI/9IqZwDuekx0JxcfFlgk2m73gb3cbvgr/nkAL+/Mg1Y8rdY/PTe+N3Uxo
	 RFVAWKLCZ5u7zg7/ms8djejWF8uS3pooOaJQWCKbb15NP9zuGmRF9yE0uNm4OEjijK
	 ChWjQMcqGP1FVnGCzYp7jNth24enrwHFLvlWNebGOlivrf8w/vR+Rylnm66O9m5Uiy
	 4XGUGj1CcmaoPPaukJSj7GFSkaJ2KBpDKlWqFmacbPF5eOUZKyupGpI6tHeo6pBwS5
	 hQqW0+uVafABA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 21 Aug 2025 14:15:43 -0700
Subject: [PATCH v2 06/12] powerpc: Drop unnecessary initializations in
 __copy_inst_from_kernel_nofault()
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-bump-min-llvm-ver-15-v2-6-635f3294e5f0@kernel.org>
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=nathan@kernel.org;
 h=from:subject:message-id; bh=VGQQUffBKqpf2H5DeF+t1nkRASxbDSX8NAduqgnqPbk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnLe5qsbnOnbElI2r/nStGKR7NVeD9fqqrOF4jTmqh6p
 HPr5fYHHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAie3IZGRpyXQzenGP5fUO5
 OWj37vqDApfD321/ON+1kq+JScZ2uiwjw8b/k05Y3dU1+vnpp/ZK+3d165qdtCziv4Vo3fZM1Zj
 nxggA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Now that the minimum supported version of LLVM for building the kernel
has been bumped to 15.0.0, the zero initializations of val and suffix
added by commit 0d76914a4c99 ("powerpc/inst: Optimise
copy_inst_from_kernel_nofault()") to avoid a bogus case of
-Wuninitialized can be dropped because the preprocessor condition is
always false.

Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/include/asm/inst.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 684d3f453282..ffa82167c860 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -143,10 +143,6 @@ static inline int __copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src)
 {
 	unsigned int val, suffix;
 
-/* See https://github.com/ClangBuiltLinux/linux/issues/1521 */
-#if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 140000
-	val = suffix = 0;
-#endif
 	__get_kernel_nofault(&val, src, u32, Efault);
 	if (IS_ENABLED(CONFIG_PPC64) && get_op(val) == OP_PREFIX) {
 		__get_kernel_nofault(&suffix, src + 1, u32, Efault);

-- 
2.50.1


