Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE1A6AD0B6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 22:40:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVsSn1kb8z2yJQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 08:40:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aZce+h+N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aZce+h+N;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVsKp2767z3c9H
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 08:34:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C2466B80FE3;
	Mon,  6 Mar 2023 21:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05381C433A1;
	Mon,  6 Mar 2023 21:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678138473;
	bh=lQNGdTblBvled8YnNr01N/d2ekXWREjHE/KOYzxz2a4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aZce+h+Nq6Ab1cp1RVSZZgpUt5hy2jOlmN4WN6kBQzfz7u1koMvSSe3DguE/VMFpL
	 tiCtDu4s7ds+c59p1TZUfLV75Q4OZiGWgwxGoM9QwA8w2W5H5tUI7IMgR1pmP3JuVQ
	 uTilZXh4hRd4ijueXOei/N2+p4izmK7/QNjk1gUCw1CMQ8/3ePKxCUTnqqmEQ7jYe0
	 +5lXG4lbmjt+qGcIYZUYcJyufotP9GYQvT1HqcXDESLLM6s/S/fK6IbnMU8nb6gK9C
	 o70F09oc3282OkF4E6h40i6UBlq4lypuQOA4jXlkJh9OR0JFzd0e7wl4Aa63lwkEeN
	 mFvh4013WOzzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20B2C6FD1B;
	Mon,  6 Mar 2023 21:34:32 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Mar 2023 15:33:44 -0600
Subject: [PATCH 5/8] powerpc/rtas: rename va_rtas_call_unlocked() to
 va_rtas_call()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230220-rtas-queue-for-6-4-v1-5-010e4416f13f@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
In-Reply-To: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678138471; l=1417;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=zmpUoFBlYm32z8pVAFlRUtoMohEKmXli9AeFhKjMQFg=;
 b=VGctELNY89LqxoRzb4VrgmHdLwMUcWBqKyta27DSpPKXM1UtERnFPbWJQIZhuaUny4HzEJxrS
 E50XCOo/kufC0X9abjpsWnuTo12q8ffkCOWJGT6mdo4/7vOSr+C2vC6
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

The function name va_rtas_call_unlocked() is confusing: it may be
called with or without rtas_lock held. Rename it to va_rtas_call().

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index c29c38b1a55a..96a10a0abe3a 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -996,9 +996,8 @@ static void __init init_error_log_max(void) {}
 #endif
 
 
-static void
-va_rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
-		      va_list list)
+static void va_rtas_call(struct rtas_args *args, int token, int nargs, int nret,
+			 va_list list)
 {
 	int i;
 
@@ -1038,7 +1037,7 @@ void rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
 	va_list list;
 
 	va_start(list, nret);
-	va_rtas_call_unlocked(args, token, nargs, nret, list);
+	va_rtas_call(args, token, nargs, nret, list);
 	va_end(list);
 }
 
@@ -1138,7 +1137,7 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	args = &rtas_args;
 
 	va_start(list, outputs);
-	va_rtas_call_unlocked(args, token, nargs, nret, list);
+	va_rtas_call(args, token, nargs, nret, list);
 	va_end(list);
 
 	/* A -1 return code indicates that the last command couldn't

-- 
2.39.1

