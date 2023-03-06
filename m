Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D816AD0B0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 22:39:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVsRn30Yyz3fCk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 08:39:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GPjImbaT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GPjImbaT;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVsKp1jr2z3c1K
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 08:34:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0317BB81135;
	Mon,  6 Mar 2023 21:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9734C4339B;
	Mon,  6 Mar 2023 21:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678138472;
	bh=SKARpZaPWMeMkRaK0GQ8aW0KrcIsPOLhz7ZL9TMTJNE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GPjImbaTExCz3yC4flP/59ez6PXbmVhIGKYZfwu+vYOJ8dqsLggOCfalqEZ0ZQUO7
	 ygbyN9bt0j+2lkKhQeTHBjfAmj/5oaQXr+cVCpmYC7o4oD1jffAqOPStiLO9uLDrpQ
	 5UYecqqtsuq8rze5oalWWjJMTfLBQ2GKOomA5sQGFJa65H5EllRgoySbObnlTUw8mS
	 KI2xjHQ6D4Oz/hofTHyjbtMKUxvBo5lCFcSgeO4ZDyI3dYdfZVScLjxNxuaecI6Ox+
	 prKVaikZ8hDbCy4UClasZuolhaFRdEY+NZY4csK/ijRT40//pJg4Beqih4ER8GSv3K
	 YGbT7pf7VE17w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DDBC6FD1A;
	Mon,  6 Mar 2023 21:34:32 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Mar 2023 15:33:40 -0600
Subject: [PATCH 1/8] powerpc/rtas: ensure 8-byte alignment for struct
 rtas_args
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230220-rtas-queue-for-6-4-v1-1-010e4416f13f@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
In-Reply-To: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678138471; l=1749;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=zKZp717erQqHtOsvnKGf8gvxVdLkX7Wsrykg3a+ZIso=;
 b=8LQBmszSbhhO1K662MFxCVWJBULbaSR1bc6FAbL87L53kqm9VMT24SZFjff7JqszJMrzUUwOL
 lkKnhMWsQHuC5JdsUAT0Z7Sf/mQQ/bPP0enmq/PvhgtELu8RcIa/9EI
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=6daubz/ymoaMF+8voz7UHwnhluEsmDZuqygIIMWpQQY=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230206 with auth_id=27
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

CHRP and PAPR agree: "In order to make an RTAS call, the operating
system must construct an argument call buffer aligned on an eight byte
boundary in physically contiguous real memory [...]." (7.2.7 Calling
Mechanism and Conventions).

struct rtas_args is the type used for this argument call buffer. The
unarchitected 'rets' member happens to produce 8-byte alignment for
the struct on 64-bit targets in practice. But without an alignment
directive the structure will have only 4-byte alignment on 32-bit
targets:

  $ nm b/{before,after}/chrp32/vmlinux | grep rtas_args
  c096881c b rtas_args
  c0968820 b rtas_args

Add an alignment directive to the struct rtas_args declaration so all
instances have the alignment required by the specs. rtas-types.h no
longer refers to any spinlock types, so drop the spinlock_types.h
inclusion while we're here.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas-types.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas-types.h b/arch/powerpc/include/asm/rtas-types.h
index f2ad4a96cbc5..861145c8a021 100644
--- a/arch/powerpc/include/asm/rtas-types.h
+++ b/arch/powerpc/include/asm/rtas-types.h
@@ -2,7 +2,8 @@
 #ifndef _ASM_POWERPC_RTAS_TYPES_H
 #define _ASM_POWERPC_RTAS_TYPES_H
 
-#include <linux/spinlock_types.h>
+#include <linux/compiler_attributes.h>
+#include <linux/sizes.h>
 
 typedef __be32 rtas_arg_t;
 
@@ -12,7 +13,7 @@ struct rtas_args {
 	__be32 nret;
 	rtas_arg_t args[16];
 	rtas_arg_t *rets;     /* Pointer to return values in args[]. */
-};
+} __aligned(SZ_8);
 
 struct rtas_t {
 	unsigned long entry;		/* physical address pointer */

-- 
2.39.1

