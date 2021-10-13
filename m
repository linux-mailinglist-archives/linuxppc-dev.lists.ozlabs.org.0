Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B45B642B13F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 02:55:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTYxL2mhyz2ym5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 11:55:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jFHSO8pg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jFHSO8pg; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTYwk2dpLz2xt2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 11:55:18 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2985B60F23;
 Wed, 13 Oct 2021 00:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634086515;
 bh=7F79+adAXo2DKX0MNT60cPRlQ6fnJL0fGrfJkwn9OV0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jFHSO8pgmRuKlRSnym8yUydaSQI9DPzybk0m6CKXGCFMwGY16T8MqWHWqe2WQa0KH
 qS6bW7XgHndqPYXwTZFuVSowtmGlO3qgprHdeEKBy26oSnmAwrRvltbivqVky6ugpt
 evja8kGMbwxraNoPy6KqEzBa80yUERj4bFG5JQ7I3LXZ79F6qRX4vhKl9l7Id/iW59
 VtqboESehn5n4IzWNRL7mAG2NFt9zuFKo8v5qEqo5hdjQUQCNZtJLdgrXLi2p7Wt1p
 ileBFO7afl5QnTizYSI5pOYI6GH7JyOffQl0A7vhAvZ/uwn2B8Bkgy+4cMffls1rTM
 mdj+QOItewEZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 13/17] powerpc/lib: Add helper to check if offset
 is within conditional branch range
Date: Tue, 12 Oct 2021 20:54:37 -0400
Message-Id: <20211013005441.699846-13-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013005441.699846-1-sashal@kernel.org>
References: <20211013005441.699846-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Song Liu <songliubraving@fb.com>,
 daniel@iogearbox.net, linuxppc-dev@lists.ozlabs.org, ast@kernel.org,
 andrii@kernel.org, netdev@vger.kernel.org, naveen.n.rao@linux.ibm.com,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, jniethe5@gmail.com,
 bpf@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>

[ Upstream commit 4549c3ea3160fa8b3f37dfe2f957657bb265eda9 ]

Add a helper to check if a given offset is within the branch range for a
powerpc conditional branch instruction, and update some sites to use the
new helper.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Song Liu <songliubraving@fb.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/442b69a34ced32ca346a0d9a855f3f6cfdbbbd41.1633464148.git.naveen.n.rao@linux.vnet.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/code-patching.h | 1 +
 arch/powerpc/lib/code-patching.c         | 7 ++++++-
 arch/powerpc/net/bpf_jit.h               | 7 +------
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index a95f63788c6b..4ba834599c4d 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -23,6 +23,7 @@
 #define BRANCH_ABSOLUTE	0x2
 
 bool is_offset_in_branch_range(long offset);
+bool is_offset_in_cond_branch_range(long offset);
 int create_branch(struct ppc_inst *instr, const u32 *addr,
 		  unsigned long target, int flags);
 int create_cond_branch(struct ppc_inst *instr, const u32 *addr,
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index f9a3019e37b4..c5ed98823835 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -228,6 +228,11 @@ bool is_offset_in_branch_range(long offset)
 	return (offset >= -0x2000000 && offset <= 0x1fffffc && !(offset & 0x3));
 }
 
+bool is_offset_in_cond_branch_range(long offset)
+{
+	return offset >= -0x8000 && offset <= 0x7fff && !(offset & 0x3);
+}
+
 /*
  * Helper to check if a given instruction is a conditional branch
  * Derived from the conditional checks in analyse_instr()
@@ -280,7 +285,7 @@ int create_cond_branch(struct ppc_inst *instr, const u32 *addr,
 		offset = offset - (unsigned long)addr;
 
 	/* Check we can represent the target in the instruction format */
-	if (offset < -0x8000 || offset > 0x7FFF || offset & 0x3)
+	if (!is_offset_in_cond_branch_range(offset))
 		return 1;
 
 	/* Mask out the flags and target, so they don't step on each other. */
diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 99fad093f43e..935ea95b6635 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -78,11 +78,6 @@
 #define PPC_FUNC_ADDR(d,i) do { PPC_LI32(d, i); } while(0)
 #endif
 
-static inline bool is_nearbranch(int offset)
-{
-	return (offset < 32768) && (offset >= -32768);
-}
-
 /*
  * The fly in the ointment of code size changing from pass to pass is
  * avoided by padding the short branch case with a NOP.	 If code size differs
@@ -91,7 +86,7 @@ static inline bool is_nearbranch(int offset)
  * state.
  */
 #define PPC_BCC(cond, dest)	do {					      \
-		if (is_nearbranch((dest) - (ctx->idx * 4))) {		      \
+		if (is_offset_in_cond_branch_range((long)(dest) - (ctx->idx * 4))) {	\
 			PPC_BCC_SHORT(cond, dest);			      \
 			EMIT(PPC_RAW_NOP());				      \
 		} else {						      \
-- 
2.33.0

