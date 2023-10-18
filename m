Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9544E7CDEDD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 16:14:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AXmhYsR9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9Xt13XcLz3vd2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 01:14:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AXmhYsR9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9Xs86PF1z3dgN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 01:14:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 545F8B82339;
	Wed, 18 Oct 2023 14:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11D2C433B7;
	Wed, 18 Oct 2023 14:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697638441;
	bh=TCNbTE+6TJoRfpfvUgsHM09kzW+uwZaM2+Gsnc4hXaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AXmhYsR9kHpJ3f/nVvbuQ9pWe5bsboFSBf3GKjjwQyfQga+r8zMPOy/hfjDKZext3
	 C98rvV4JFHgDNxK/j2pLQT/gLIlOtHrSLNIacUTFsbbJIsaY2m6vzYyAvLB7YbwK2S
	 SADaoK09FUBk7BFGIvOh090I4aib3aypXkKCaSne824e7Mixn8x5pw/+19pvv82vp4
	 ZxHKjOk9JUziiP2OjxYqkpqxHkgCg/b/7BhBRTG3w1gw94XMQaaWLeYveNNCqAjub1
	 lRvbB+8F9hhMq2NdyCxSStAM7LBaYTwkuzf4+MSRzBKu312hHI/PjTYKh4q2pwxeVZ
	 kno1cpqIYCurA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 16/19] powerpc/85xx: Fix math emulation exception
Date: Wed, 18 Oct 2023 10:13:18 -0400
Message-Id: <20231018141323.1334898-16-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018141323.1334898-1-sashal@kernel.org>
References: <20231018141323.1334898-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.58
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
Cc: Sasha Levin <sashal@kernel.org>, masahiroy@kernel.org, npiggin@gmail.com, sv@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit 8e8a12ecbc86700b5e1a3596ce2b3c43dafad336 ]

Booting mpc85xx_defconfig kernel on QEMU leads to:

Bad trap at PC: fe9bab0, SR: 2d000, vector=800
awk[82]: unhandled trap (5) at 0 nip fe9bab0 lr fe9e01c code 5 in libc-2.27.so[fe5a000+17a000]
awk[82]: code: 3aa00000 3a800010 4bffe03c 9421fff0 7ca62b78 38a00000 93c10008 83c10008
awk[82]: code: 38210010 4bffdec8 9421ffc0 7c0802a6 <fc00048e> d8010008 4815190d 93810030
Trace/breakpoint trap
WARNING: no useful console

This is because allthough CONFIG_MATH_EMULATION is selected,
Exception 800 calls unknown_exception().

Call emulation_assist_interrupt() instead.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/066caa6d9480365da9b8ed83692d7101e10ac5f8.1695657339.git.christophe.leroy@csgroup.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/head_85xx.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_85xx.S b/arch/powerpc/kernel/head_85xx.S
index 52c0ab416326a..0e16aea7853b8 100644
--- a/arch/powerpc/kernel/head_85xx.S
+++ b/arch/powerpc/kernel/head_85xx.S
@@ -394,7 +394,7 @@ interrupt_base:
 #ifdef CONFIG_PPC_FPU
 	FP_UNAVAILABLE_EXCEPTION
 #else
-	EXCEPTION(0x0800, FP_UNAVAIL, FloatingPointUnavailable, unknown_exception)
+	EXCEPTION(0x0800, FP_UNAVAIL, FloatingPointUnavailable, emulation_assist_interrupt)
 #endif
 
 	/* System Call Interrupt */
-- 
2.40.1

