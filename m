Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 995EF6AD0AC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 22:37:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVsNn3ZqCz3fR2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 08:37:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uZL0vL1i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uZL0vL1i;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVsKn2yJzz3bjb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 08:34:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6CA4360A10;
	Mon,  6 Mar 2023 21:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2B76C433D2;
	Mon,  6 Mar 2023 21:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678138472;
	bh=c3tV59eVvTL3GB2JpBKYEG3EnJNKFS4sB1Y/mOXXFxo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uZL0vL1izz0igtaI0+hy4MCC9TZlft3a7oEYO58fv0t967Y1dioY8oQDlHuEoE0kZ
	 7miikejHiDZgL0HLBpU3vsckF7U+sxjZlwSujdebPeYqU8lFkqYq7lPpy09lzUIpBp
	 g7b6D1pTOcKNc+Fzqc9JU++r7Mnd4gq8OSKE0NOoOgJTR3TQju+jy3zGV7Ovl5wFQ+
	 g7mP2GUIrKewbdWlHOBjKwP+r/9t0RlcFtXARvimFO54lMNRH6Fw+6qCojLkXL+IQv
	 FG3o9CpX8l3tQdgUiVtS2H2BXYU63oKizmSCwKXv/FK75S/UkGoJ0uLFRuRhDSBH0u
	 Bi/nqDJFg/bzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0197C6FD1C;
	Mon,  6 Mar 2023 21:34:32 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Mar 2023 15:33:42 -0600
Subject: [PATCH 3/8] powerpc/rtas: rtas_call_unlocked() kerneldoc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230220-rtas-queue-for-6-4-v1-3-010e4416f13f@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
In-Reply-To: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678138471; l=1514;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=aNVQYLIYeghDvruaF+K17N+vFRgqaX8hcKm6FIHWhcU=;
 b=LntxrFKMlrhF9aFjjxyXXyYyP1Piy6ap2oSPQLn+38HuUrpD1XXw4JjbJ2YiakTWd7YRMT4mu
 nwSeXE6mlLYAJIJ5ZjcFF/zs4sbogpjGPyNRFH9VDSYqi8rEuEP8rHl
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

Add documentation for rtas_call_unlocked(), including details on how
it differs from rtas_call().

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 9256cfaa8b6f..c73b01d722f6 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1016,6 +1016,23 @@ va_rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
 	do_enter_rtas(args);
 }
 
+/**
+ * rtas_call_unlocked() - Invoke an RTAS firmware function without synchronization.
+ * @args: RTAS parameter block to be used for the call, must obey RTAS addressing
+ *        constraints.
+ * @token: Identifies the function being invoked.
+ * @nargs: Number of input parameters. Does not include token.
+ * @nret: Number of output parameters, including the call status.
+ * @....: List of @nargs input parameters.
+ *
+ * Invokes the RTAS function indicated by @token, which the caller
+ * should obtain via rtas_function_token().
+ *
+ * This function is similar to rtas_call(), but must be used with a
+ * limited set of RTAS calls specifically exempted from the general
+ * requirement that only one RTAS call may be in progress at any
+ * time. Examples include stop-self and ibm,nmi-interlock.
+ */
 void rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret, ...)
 {
 	va_list list;

-- 
2.39.1

