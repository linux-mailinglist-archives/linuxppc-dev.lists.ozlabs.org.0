Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B34667A952
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 04:39:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1qMG1r0cz3cdD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 14:39:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P9J1452o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P9J1452o;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1qLH65lxz3bh4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 14:38:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E55146143D;
	Wed, 25 Jan 2023 03:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1AAC433A0;
	Wed, 25 Jan 2023 03:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674617892;
	bh=7M3ieHPKjncgevNaIxm++BYHAAhc0S9LqYRA8tUI6Pc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P9J1452odLsdx9doxYgTkxrLdCcOxbiWEcNN3c1SS4mdkU1oxRzvV4a4XV/0BbQ9l
	 SBxFaspcH9MniyYLQbBXgGXc/40u0BVnlosMkZ59hGsQD2ZtlCSgjxkQ6YRqMLPlSZ
	 PrGLsThlzNCrIgruY4wNOh2EKMnjXOqodtyk565vVkwRA9c3ZM9fgB+A5DldgqdSYt
	 tQw6v6Rp0lqJA5umtMy0jcsmp3utJc6DJPUHg7Qip/IOYG6z7+TqLVowgk8ynnZS3N
	 8r+3N4ZEqgI0VoBXDnvPlvm6BvZES1t+sHzbRcI1WtgVfxlZ53ysJD7yxDpif/2MR6
	 Y9i+Oqrub8C7Q==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/2] powerpc/module_64: Fix "expected nop" error on module re-patching
Date: Tue, 24 Jan 2023 19:38:05 -0800
Message-Id: <2f6329ffd9674df6ff57e03edeb2ca54414770ab.1674617130.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674617130.git.jpoimboe@kernel.org>
References: <cover.1674617130.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-type: text/plain
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
Cc: linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a module with a livepatched function is unloaded and then reloaded,
klp attempts to dynamically re-patch it.  On ppc64, that fails with the
following error:

  module_64: livepatch_nfsd: Expected nop after call, got e8410018 at e_show+0x60/0x548 [livepatch_nfsd]
  livepatch: failed to initialize patch 'livepatch_nfsd' for module 'nfsd' (-8)
  livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusing to load module 'nfsd'

The error happens because the restore r2 instruction had already
previously been written into the klp module's replacement function when
the original function was patched the first time.  So the instruction
wasn't a nop as expected.

When the restore r2 instruction has already been patched in, detect that
and skip the warning and the instruction write.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/powerpc/kernel/module_64.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 016e79bba531..bf1da99fff74 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -502,6 +502,7 @@ static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
 static int restore_r2(const char *name, u32 *instruction, struct module *me)
 {
 	u32 *prev_insn = instruction - 1;
+	u32 insn_val = *instruction;
 
 	if (is_mprofile_ftrace_call(name))
 		return 0;
@@ -514,9 +515,18 @@ static int restore_r2(const char *name, u32 *instruction, struct module *me)
 	if (!instr_is_relative_link_branch(ppc_inst(*prev_insn)))
 		return 0;
 
-	if (*instruction != PPC_RAW_NOP()) {
+	/*
+	 * For livepatch, the restore r2 instruction might have already been
+	 * written previously, if the referenced symbol is in a previously
+	 * unloaded module which is now being loaded again.  In that case, skip
+	 * the warning and the instruction write.
+	 */
+	if (insn_val == PPC_INST_LD_TOC)
+		return 0;
+
+	if (insn_val != PPC_RAW_NOP()) {
 		pr_err("%s: Expected nop after call, got %08x at %pS\n",
-			me->name, *instruction, instruction);
+			me->name, insn_val, instruction);
 		return -ENOEXEC;
 	}
 
-- 
2.39.0

