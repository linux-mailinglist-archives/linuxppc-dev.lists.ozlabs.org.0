Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E2B7FD7DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 14:22:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YwVmDb41;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgKjt2rKrz3dXX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 00:22:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YwVmDb41;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgKg95Sgyz3cNQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 00:19:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701263989;
	bh=O32VkuHjt4DuzYdJX1SALpHOhISz7/u3FTY4a3WnHZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YwVmDb41T+AqALPg3qvJdArJzZ38OkXcKfikHN0JN3kQhuT+JFTJ0C/hMMo7Aj3qN
	 q2Z09KPwWXm7Hc78NRIKMrrKhsZzq3sONwWQpUkldrgwciL4CKdpFuwtlEnCjsza7C
	 6mWaPZDZ0DKP6pO1nSPai7+Xu8STDhqk9PCxSoji4UQmEnl3mrYM58z3n+tMSKN0Zv
	 pxtj4e3SU+8utsOQGjfXo8mm9S5vIszXiHcWXTphj7pZXFLy4PRegqenin6w0PyuPy
	 W8WrSQMUgxTPG96OUQKrVT0Ug7zjYYXkZRwNqhJgpevFKFfMMWhKXlF+nBSRyRievK
	 eO8vw05b/7bfA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SgKg945dPz4xVK;
	Thu, 30 Nov 2023 00:19:49 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 4/5] powerpc/44x: Make ppc44x_idle_init() static
Date: Thu, 30 Nov 2023 00:19:18 +1100
Message-ID: <20231129131919.2528517-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231129131919.2528517-1-mpe@ellerman.id.au>
References: <20231129131919.2528517-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The 44x/fsp2_defconfig build fails with:

  arch/powerpc/platforms/44x/idle.c:30:12: error: no previous prototype for ‘ppc44x_idle_init’ [-Werror=missing-prototypes]
  30 | int __init ppc44x_idle_init(void)
     |            ^~~~~~~~~~~~~~~~

Fix it by making ppc44x_idle_init() static.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/44x/idle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/44x/idle.c b/arch/powerpc/platforms/44x/idle.c
index f533b495e7db..e2eeef8dff78 100644
--- a/arch/powerpc/platforms/44x/idle.c
+++ b/arch/powerpc/platforms/44x/idle.c
@@ -27,7 +27,7 @@ static void ppc44x_idle(void)
 	isync();
 }
 
-int __init ppc44x_idle_init(void)
+static int __init ppc44x_idle_init(void)
 {
 	if (!mode_spin) {
 		/* If we are not setting spin mode 
-- 
2.41.0

