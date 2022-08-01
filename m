Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADC55870C7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 21:03:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxSF76b19z3bbl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 05:03:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ee7sS+Wj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ee7sS+Wj;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxSDX1C0tz2xHD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 05:02:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA5D961218;
	Mon,  1 Aug 2022 19:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624A3C433D6;
	Mon,  1 Aug 2022 19:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659380552;
	bh=8TuZYBANaANy8tBI2NDEhOSwYzvW/85ai8F71UZsmK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ee7sS+WjoKsphXm66prEadyQX1DQgMBZO1yMuoKsg6JsJdFBn7zgDeBDDoMeny9S3
	 Vc+qqsVb2sX+q/6wcgD3dA1vhXPagwHjH0/7fHeu+T4HznDsUqJGu/UvZa+eBQo/Sz
	 uLmHke+6xZjCfAwZZ0+7eTn+GeE9aAFJIbBdGTj22J7HivLtZbheHphFLgVU5DXgGo
	 WVZi107lIHUjT0Mn3c70laXxR8Wltjys+ddE7HqIJyhm7yJf93jaOCJSf6ftwYfDfu
	 O+f3tq7iogbHnLFCKnEfXpB5alNEuN8luqlXTsxCxWaaRBOVibmAXN0t3KbqTFh4Y6
	 10FM5iORe/t+g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 04/10] powerpc/64s: Disable stack variable initialisation for prom_init
Date: Mon,  1 Aug 2022 15:02:16 -0400
Message-Id: <20220801190222.3818378-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220801190222.3818378-1-sashal@kernel.org>
References: <20220801190222.3818378-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, peterz@infradead.org, masahiroy@kernel.org, ast@kernel.org, npiggin@gmail.com, aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit be640317a1d0b9cf42fedb2debc2887a7cfa38de ]

With GCC 12 allmodconfig prom_init fails to build:

  Error: External symbol 'memset' referenced from prom_init.c
  make[2]: *** [arch/powerpc/kernel/Makefile:204: arch/powerpc/kernel/prom_init_check] Error 1

The allmodconfig build enables KASAN, so all calls to memset in
prom_init should be converted to __memset by the #ifdefs in
asm/string.h, because prom_init must use the non-KASAN instrumented
versions.

The build failure happens because there's a call to memset that hasn't
been caught by the pre-processor and converted to __memset. Typically
that's because it's a memset generated by the compiler itself, and that
is the case here.

With GCC 12, allmodconfig enables CONFIG_INIT_STACK_ALL_PATTERN, which
causes the compiler to emit memset calls to initialise on-stack
variables with a pattern.

Because prom_init is non-user-facing boot-time only code, as a
workaround just disable stack variable initialisation to unbreak the
build.

Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220718134418.354114-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 4ddd161aef32..63c384c3e6d4 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -20,6 +20,7 @@ CFLAGS_prom.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
 CFLAGS_prom_init.o += -fno-stack-protector
 CFLAGS_prom_init.o += -DDISABLE_BRANCH_PROFILING
 CFLAGS_prom_init.o += -ffreestanding
+CFLAGS_prom_init.o += $(call cc-option, -ftrivial-auto-var-init=uninitialized)
 
 ifdef CONFIG_FUNCTION_TRACER
 # Do not trace early boot code
-- 
2.35.1

