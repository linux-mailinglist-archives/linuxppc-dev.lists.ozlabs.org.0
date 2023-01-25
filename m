Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AEC67A955
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 04:40:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1qPG0q5lz3cgy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 14:40:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QQ5MUOhZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QQ5MUOhZ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1qLJ6yDFz3bhx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 14:38:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3D769B816DA;
	Wed, 25 Jan 2023 03:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA63EC4339B;
	Wed, 25 Jan 2023 03:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674617891;
	bh=ruVwyKu5r4Ho2K3Po1rwNTyU1GonlvOJe83MwngFuEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QQ5MUOhZsTGTNvx7meE+NywZEQQIvOZZka611CH+C5ghKPCbcIScqQ2e+k1N4h/vy
	 Bc8eHDGq19u7fMKXy/f5BsHXtm8MxeAVAqamvYn7GDTbpKj6FIitkVWiNZiPNYJHOz
	 UcHudz0NMmCYZcV3+45a0E9FISyJrgUnrJs30QzyeK79da3K7qdSDw0Y+gXPMfQCnM
	 TCqRQdXphPGuN/bvq/VkvzMPDN77GbcRzG8sFnOzMsLzm7vA7+jH1hbOfxXapiAXyL
	 Z2OFRHjhIpvbAJ2Wc1AJXhpu2ZvbowIKuJlC8labNnEkDlnPT0xqBjAarIwBFMJ0Q1
	 MH55q5qylN0lw==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc/module_64: Improve restore_r2() return semantics
Date: Tue, 24 Jan 2023 19:38:04 -0800
Message-Id: <15baf76c271a0ae09f7b8556e50f2b4251e7049d.1674617130.git.jpoimboe@kernel.org>
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

restore_r2() returns 1 on success, which is surprising for a non-boolean
function.  Change it to return 0 on success and -errno on error to match
kernel coding convention.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/powerpc/kernel/module_64.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 1096d6b3a62c..016e79bba531 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -504,7 +504,7 @@ static int restore_r2(const char *name, u32 *instruction, struct module *me)
 	u32 *prev_insn = instruction - 1;
 
 	if (is_mprofile_ftrace_call(name))
-		return 1;
+		return 0;
 
 	/*
 	 * Make sure the branch isn't a sibling call.  Sibling calls aren't
@@ -512,19 +512,16 @@ static int restore_r2(const char *name, u32 *instruction, struct module *me)
 	 * restore afterwards.
 	 */
 	if (!instr_is_relative_link_branch(ppc_inst(*prev_insn)))
-		return 1;
+		return 0;
 
 	if (*instruction != PPC_RAW_NOP()) {
 		pr_err("%s: Expected nop after call, got %08x at %pS\n",
 			me->name, *instruction, instruction);
-		return 0;
+		return -ENOEXEC;
 	}
 
 	/* ld r2,R2_STACK_OFFSET(r1) */
-	if (patch_instruction(instruction, ppc_inst(PPC_INST_LD_TOC)))
-		return 0;
-
-	return 1;
+	return patch_instruction(instruction, ppc_inst(PPC_INST_LD_TOC));
 }
 
 int apply_relocate_add(Elf64_Shdr *sechdrs,
@@ -648,8 +645,8 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 						strtab + sym->st_name);
 				if (!value)
 					return -ENOENT;
-				if (!restore_r2(strtab + sym->st_name,
-							(u32 *)location + 1, me))
+				if (restore_r2(strtab + sym->st_name,
+					       (u32 *)location + 1, me))
 					return -ENOEXEC;
 			} else
 				value += local_entry_offset(sym);
-- 
2.39.0

