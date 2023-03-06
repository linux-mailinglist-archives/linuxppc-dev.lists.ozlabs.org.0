Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 470996AD0A5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 22:36:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVsMn1C78z3fLT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 08:36:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pbEQbhjU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pbEQbhjU;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVsKn2nnJz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 08:34:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 166C460C95;
	Mon,  6 Mar 2023 21:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20344C433A0;
	Mon,  6 Mar 2023 21:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678138473;
	bh=LDdXDgoactf7W8hxaHxrd0axH/SHQ0LmO4BLXhADMfA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pbEQbhjUunEzhWOTaV+kO12idOijfFDAiJDoqc6O9sbX0Jm2CxcP2VGDJrQ+Luqg2
	 yxxWMMgRsPO4bYQAP+Hr1Yj9Xq7GjC62tGPgfpjIxZJysbp6wSvRrF5gt1TXr7dnk7
	 Vzg6nP6xekDhtm3DqcvvD7B4hFvWTV9ie0rwMLRxZdPPO36hDrIDRmgOyLSVq8kIqa
	 ECiSjPooUdcyW21pBZEhcx+80OlJe28wOowhPHyAisy20pUCA8aLdzwfChs/ooMTV/
	 bdPpK2yTc0QaTYPX2ZBQrRweCY3NJRoOhby4KCKFCKrPzrxUseUcBuFgVjCL6IxaKg
	 imC6UUwL5lqDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC3EC64EC4;
	Mon,  6 Mar 2023 21:34:33 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Mar 2023 15:33:46 -0600
Subject: [PATCH 7/8] powerpc/rtas: warn on unsafe argument to
 rtas_call_unlocked()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230220-rtas-queue-for-6-4-v1-7-010e4416f13f@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
In-Reply-To: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678138471; l=999;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=pRZxRj5QyWZZ4hjbHO7mJTWLLN6i/dgDWwjlJ8ybXFE=;
 b=Rkqr5NU/NmQkjMAiyWXvNzoRrabkCKdVa2SubSeba/PWegiwywXG43gH5h/cni5BSahtv5QWC
 aHznaQvex61BBHtWlutyjRX5cjjKBrQY6+07y21mTmGWUFfWVljZ46l
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

Any caller of rtas_call_unlocked() must provide an rtas_args parameter
block distinct from the core rtas_args buffer used by the rtas_call()
path. It's an unlikely error to make, but the potential consequences
are grim, and it's trivial to check.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 633c925164e7..47a2aa43d7d4 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1042,6 +1042,13 @@ void rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
 {
 	va_list list;
 
+	/*
+	 * Callers must not use rtas_args; otherwise they risk
+	 * corrupting the state of the rtas_call() path, which is
+	 * serialized by rtas_lock.
+	 */
+	WARN_ON(args == &rtas_args);
+
 	va_start(list, nret);
 	va_rtas_call(args, token, nargs, nret, list);
 	va_end(list);

-- 
2.39.1

