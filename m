Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5856A4E6566
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 15:37:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPSVT1QqPz3dtr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 01:37:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPSNq138Nz3c2J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 01:32:26 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KPSMF1CF9z9sTw;
 Thu, 24 Mar 2022 15:31:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qK301kmQHGwi; Thu, 24 Mar 2022 15:31:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KPSLz007qz9sTv;
 Thu, 24 Mar 2022 15:30:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D71E88B787;
 Thu, 24 Mar 2022 15:30:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id E0ElFNK7xCR3; Thu, 24 Mar 2022 15:30:50 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.77])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D371E8B798;
 Thu, 24 Mar 2022 15:30:49 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22OEUfjb1811698
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 15:30:41 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22OEUf5a1811697;
 Thu, 24 Mar 2022 15:30:41 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 05/22] powerpc/code-patching: Inline create_branch()
Date: Thu, 24 Mar 2022 15:29:55 +0100
Message-Id: <2b0c4291fbf2e467fbae9c504bf671bfc29df70a.1648131740.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648131740.git.christophe.leroy@csgroup.eu>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648132151; l=2728; s=20211009;
 h=from:subject:message-id; bh=d2swIJrMmUDKV+uH13vJ0j/DNa2ajgVmApWQwP8siB0=;
 b=9oT4lBmjHqdBffgfNdni0A6cjFBJAmWNr4erXH3Omj1NVKy0IFtDpVriLqKgkCdzUXn0cxgyMiqq
 0D8opGd1AEylddQg+yiIEDFKgigtk+fBbnW+MTCly8Y2pA32UZQ1
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

create_branch() is a good candidate for inlining because:
- Flags can be folded in.
- Range tests are likely to be already done.

Hence reducing the create_branch() to only a set of instructions.

So inline it.

It improves ftrace activation by 10%.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/code-patching.h | 22 ++++++++++++++++++++--
 arch/powerpc/lib/code-patching.c         | 20 --------------------
 2 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index e7c5df50cb4e..4260e89f62b1 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -49,8 +49,26 @@ static inline bool is_offset_in_cond_branch_range(long offset)
 	return offset >= -0x8000 && offset <= 0x7fff && !(offset & 0x3);
 }
 
-int create_branch(ppc_inst_t *instr, const u32 *addr,
-		  unsigned long target, int flags);
+static inline int create_branch(ppc_inst_t *instr, const u32 *addr,
+				unsigned long target, int flags)
+{
+	long offset;
+
+	*instr = ppc_inst(0);
+	offset = target;
+	if (! (flags & BRANCH_ABSOLUTE))
+		offset = offset - (unsigned long)addr;
+
+	/* Check we can represent the target in the instruction format */
+	if (!is_offset_in_branch_range(offset))
+		return 1;
+
+	/* Mask out the flags and target, so they don't step on each other. */
+	*instr = ppc_inst(0x48000000 | (flags & 0x3) | (offset & 0x03FFFFFC));
+
+	return 0;
+}
+
 int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
 		       unsigned long target, int flags);
 int patch_branch(u32 *addr, unsigned long target, int flags);
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 58262c7e447c..7adbdb05fee7 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -230,26 +230,6 @@ bool is_conditional_branch(ppc_inst_t instr)
 }
 NOKPROBE_SYMBOL(is_conditional_branch);
 
-int create_branch(ppc_inst_t *instr, const u32 *addr,
-		  unsigned long target, int flags)
-{
-	long offset;
-
-	*instr = ppc_inst(0);
-	offset = target;
-	if (! (flags & BRANCH_ABSOLUTE))
-		offset = offset - (unsigned long)addr;
-
-	/* Check we can represent the target in the instruction format */
-	if (!is_offset_in_branch_range(offset))
-		return 1;
-
-	/* Mask out the flags and target, so they don't step on each other. */
-	*instr = ppc_inst(0x48000000 | (flags & 0x3) | (offset & 0x03FFFFFC));
-
-	return 0;
-}
-
 int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
 		       unsigned long target, int flags)
 {
-- 
2.35.1

