Return-Path: <linuxppc-dev+bounces-11103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A1FB2B0F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 20:58:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5MRg46y2z3cfy;
	Tue, 19 Aug 2025 04:58:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755543487;
	cv=none; b=TbjfoEFL7Qc+93CPrwDfdJ3DHjn5mUD6mWqeEqpk2k9DSyaqTy0kWzZ7Oa6QhtuzTa2b+dQIgEYlKv/XwR0HuSj+QnGCTtIR3pY+R8OTu9I6bSpn9k+tdURKeOOEErR9+Oox0Mk5O9AnXysN2xgcouIcVj6YLfi9A32akQJNCBKp6xnNiDdv1PXKdRqJURZzCU/n+KcvGZ63t0Apuqt+xJYDlPlLdq4qFB/+ZTE0sh/j0ZlCVtNtsKfljCfSlAKU0niFwovUT1xm+KPvfCArc6xcR06KnGK1ekkAjxunc6Fj9oMINuOSYTUgwF0F3f5LfCIc+EYZ6Oocg3M0mirCug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755543487; c=relaxed/relaxed;
	bh=F44jMz9Hsa1vKmywJPEZgV4lEqpxYtIZH2O2br8S0xA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jUMdHEMDJdFrCpOB0iHCh1333rOAb3lhrlGm2D6NkXsGKJoIOhP4ImfNkTrO80lYp8n0OtYic16LBhDKEqWO2JUB+b1vWoSgvrMffd3G6Ii/8FOWC6JgnW35Vux2ROkalCsmX/t3K9d8G6eiB8UyfsjfC/NdTdPurHyuZwm7t1Zh6YFYl7Kgj2/zeGcyP3cIsUCMohEaKQ3OxVN+csir9R/B1CckdUOyTUGQGNnmx8dUBPxlmaLxy8Rl4iZggxto6WJEYUyBvb79rkK1WQ1vKBZxX8ykPJ1nPCl0YCptSlXTXof7dVuPuKYGDUiifvjlLYYxn9Gu16ykdS30qlLBOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z6e3LWLq; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z6e3LWLq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5MRg03zSz3cfj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 04:58:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 78F0545F97;
	Mon, 18 Aug 2025 18:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B057C4CEF1;
	Mon, 18 Aug 2025 18:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755543484;
	bh=Lo/ub4li53YNr1WaIGrKXm3nOcZoyqX45dFKpUE/HGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z6e3LWLqwJMq1KH+qj0/Fmu8yDb1BBX9t4FTH54hI4h973CZnTpMdQe0yFL/IH9tA
	 pCsSjXQo6APZddUNk0sy+2JT+p4C2qxmY791U2XOl3xcp+7M94oDFd68hAWk99eBnk
	 NPkceO3ksRPXfp7ZCgh8lhQOMQ7v3MLGRhXBoF43I8oCa2iHIZ3kHqbp+LrPZ4X/AH
	 uRG8bXG/fozVd8mjyYR/r0rex+Hr5EjOZHmgITuMF1sGZKgSoNXmhC5VjkQEz+0uKB
	 kvqdj+Ha5FSRV2uynB83jevrQFdWxurd7TSK/FoyQMRhWdAgM0fq63IJ81wAnKKPO5
	 8RvV5nFCkZ6DQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 18 Aug 2025 11:57:22 -0700
Subject: [PATCH 06/10] powerpc: Drop unnecessary initializations in
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
Message-Id: <20250818-bump-min-llvm-ver-15-v1-6-c8b1d0f955e0@kernel.org>
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
In-Reply-To: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Lo/ub4li53YNr1WaIGrKXm3nOcZoyqX45dFKpUE/HGc=;
 b=kA0DAAoWHWsmkXHAGpYByyZiAGijd6LIRMAmizf05GAFI656eYaM6oZfysm97od+caMT+X1qh
 Ih1BAAWCgAdFiEEe+MlxzExnM0B2MqSHWsmkXHAGpYFAmijd6IACgkQHWsmkXHAGpbCRQEAhZUJ
 c5moRU96wqS6sel3EZtjKLlCUhQfKQ+4rjjsf6AA/3YwNtKRMEcuUOZ/r8iucyJ4g/oC9S/y29F
 RkRUcIb0B
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


