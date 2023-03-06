Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866B16AD0A2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 22:35:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVsLd2SNYz2ypJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 08:35:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=js8BOxqr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=js8BOxqr;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVsKl2pmpz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 08:34:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7F8F860B09;
	Mon,  6 Mar 2023 21:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E56D9C4339E;
	Mon,  6 Mar 2023 21:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678138472;
	bh=LeyaRAgJjntowrJQ7Y/gAx3/U2BZLGKj5tcngN7gBgM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=js8BOxqr41y7XFsoxs1F718VUycZaYy49WIGDpZpny2J+HUyuQdu8LCKmQsuY5oPq
	 oGdm2+coF4nSVsBpv4t/vHc8XmXYJgPlxGWpJ3vIyl88gDMFEvBuKDKLKuxG69TfXg
	 7QV8hXg8Ro4YS/e5VIfTlDBUQjVwKYPuI0+iS08oypRc5J01qNIaEVnI/LLvEnFvCf
	 vZA0PjWMx9ZlkisjgHHxkXDMZcEYr89o/xpxEt2Z/L2skG7dD6dBqNyZKuIp9z0L+f
	 CpGpGfLggZMW/PFSU3Tr3jdhYF01dtH803jhVycSOFWv+9h4y/F6+M2jUQJih+9HoQ
	 ey+0gNiPluT4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31B1C64EC4;
	Mon,  6 Mar 2023 21:34:32 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Mar 2023 15:33:43 -0600
Subject: [PATCH 4/8] powerpc/rtas: fix miswording in rtas_function
 kerneldoc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230220-rtas-queue-for-6-4-v1-4-010e4416f13f@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
In-Reply-To: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678138471; l=821;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=KDcIY5p36gGZFwMr2XpuMaaBgQzZ4G0iZKmqta+ah0E=;
 b=5snt22o7WgRBLK+n582FSb9KLCYKnW8sx10uIsfjoCWRb3TScmAKu/gG4OWITLRLpNwmUmgTO
 4Yw+8aQBObXAJp0oilRHxS8fJC5aYqVdVLXEkWGjP9rOjGxScG/cw/k
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

The 'filter' member is a pointer, not a bool; fix the wording
accordingly.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index c73b01d722f6..c29c38b1a55a 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -68,7 +68,7 @@ struct rtas_filter {
  *                            functions are believed to have no users on
  *                            ppc64le, and we want to keep it that way. It does
  *                            not make sense for this to be set when @filter
- *                            is false.
+ *                            is NULL.
  */
 struct rtas_function {
 	s32 token;

-- 
2.39.1

