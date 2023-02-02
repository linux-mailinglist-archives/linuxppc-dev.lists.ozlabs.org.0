Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F63687D11
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 13:19:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6yWr18fzz3f64
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 23:19:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YvY10bBY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6yVs491Qz3cCP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 23:18:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YvY10bBY;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P6yVq6tXjz4x1h;
	Thu,  2 Feb 2023 23:18:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675340308;
	bh=EYC/9439mSfnQMQey+GUzzlI2rkvaq20NXIkn1OcU5Y=;
	h=From:To:Cc:Subject:Date:From;
	b=YvY10bBYuwNc2kHPERMPZQ4XpKxP9uyBxEN5Zqu1JZAq8khvM2ABhiHv5KtkUCCzp
	 gsJ06BhF2jWoosB4Ywn0hnpoX8m6uMicv81/kLJWRoe67N23rRRjY1BlGL32gmAsK5
	 CgmanQfrcklWcxKSxqu91Fv/Duf4XlaX47dUEe33IiUrdJwy4aJQzu5aK1StbExX7b
	 e8nom1IX3ICDrgYxEkM1I/cGTyjS8zHhtZeM3t0QGD2PzMy1d3brhxqr9h1/O9mgVR
	 4asQ0PvaZrUM5rRE/SvgMerMe9wmc+3zLPk34UL9NaYNj37PGswHuU1rko3kStjVdx
	 09QyKF7BerlVw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Don't select ARCH_WANTS_NO_INSTR
Date: Thu,  2 Feb 2023 23:18:05 +1100
Message-Id: <20230202121805.1176492-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
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
Cc: peterz@infradead.org, sachinp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 41b7a347bf14 ("powerpc: Book3S 64-bit outline-only KASAN
support") added a select of ARCH_WANTS_NO_INSTR, because it also added
some uses of noinstr. However noinstr is always defined, regardless of
ARCH_WANTS_NO_INSTR, so there's no need to select it just for that.

As PeterZ says [1]:
  Note that by selecting ARCH_WANTS_NO_INSTR you effectively state to
  abide by its rules.

As of now the powerpc code does not abide by those rules, and trips some
new warnings added by Peter in linux-next.

So until the code can be fixed to avoid those warnings, disable
ARCH_WANTS_NO_INSTR.

Note that ARCH_WANTS_NO_INSTR is also used to gate building KCOV and
parts of KCSAN. However none of the noinstr annotations in powerpc were
added for KCOV or KCSAN, instead instrumentation is blocked at the file
level using KCOV_INSTRUMENT_foo.o := n.

[1]: https://lore.kernel.org/linuxppc-dev/Y9t6yoafrO5YqVgM@hirez.programming.kicks-ass.net

Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b8c4ac56bddc..7a5f8dbfbdd0 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -163,7 +163,6 @@ config PPC
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANTS_MODULES_DATA_IN_VMALLOC	if PPC_BOOK3S_32 || PPC_8xx
-	select ARCH_WANTS_NO_INSTR
 	select ARCH_WEAK_RELEASE_ACQUIRE
 	select BINFMT_ELF
 	select BUILDTIME_TABLE_SORT
-- 
2.39.1

