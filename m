Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A75487372D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 14:00:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Goic8X+M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqXbK74SYz3vl3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 00:00:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Goic8X+M;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqXYr3W5yz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 23:58:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709729936;
	bh=zTySiwWXK6HYutd6d53ZP8cANhuP0Xo5dmyGVJTtMb4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Goic8X+MMMmNleQRAeqitZIukY6/C0NG2deTW0ITTXDfU46DVgJdRb0/4Vgue7u1K
	 dvU2R9C8bQMuchKs5kdCHuks5JsY5RalNYUmGl9eAqrr+D5YZD5MbVrGxjMO5atIMK
	 m2Ynv5Y2DXDQ6U9/J06hMP0xlI3083nEhr6/ZKQ5Rq6AEvpKkxeMt60FgatwVlGYBV
	 FpGv5mKfL8W6AbFONtAuyqSFs7zVnLLs0cjys5l7eK0l+j/rL/epzXgLtUogioisW6
	 /jyXvzA0N+g+5rMx5D3U6H3BMURJ8+m16w4BnQtXOSvp/DKf3xRXlKeB9U2DhSQLPK
	 iBeTWRYcJeJ4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TqXYr2Jpmz4wcN;
	Wed,  6 Mar 2024 23:58:56 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/3] powerpc/83xx: Fix build failure with FPU=n
Date: Wed,  6 Mar 2024 23:58:52 +1100
Message-ID: <20240306125853.3714578-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240306125853.3714578-1-mpe@ellerman.id.au>
References: <20240306125853.3714578-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building eg. 83xx/mpc832x_rdb_defconfig with FPU=n, fails with:

  arch/powerpc/platforms/83xx/suspend.c: In function 'mpc83xx_suspend_enter':
  arch/powerpc/platforms/83xx/suspend.c:209:17: error: implicit declaration of function 'enable_kernel_fp'
    209 |                 enable_kernel_fp();

Fix it by providing an enable_kernel_fp() stub for FPU=n builds,
which allows using IS_ENABLED(CONFIG_PPC_FPU) around the call to
enable_kernel_fp().

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/switch_to.h  | 4 ++++
 arch/powerpc/platforms/83xx/suspend.c | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
index aee25e3ebf96..fc933807ddc8 100644
--- a/arch/powerpc/include/asm/switch_to.h
+++ b/arch/powerpc/include/asm/switch_to.h
@@ -48,6 +48,10 @@ static inline void disable_kernel_fp(void)
 #else
 static inline void save_fpu(struct task_struct *t) { }
 static inline void flush_fp_to_thread(struct task_struct *t) { }
+static inline void enable_kernel_fp(void)
+{
+	BUILD_BUG();
+}
 #endif
 
 #ifdef CONFIG_ALTIVEC
diff --git a/arch/powerpc/platforms/83xx/suspend.c b/arch/powerpc/platforms/83xx/suspend.c
index c9664e46b03d..99bd4355f28e 100644
--- a/arch/powerpc/platforms/83xx/suspend.c
+++ b/arch/powerpc/platforms/83xx/suspend.c
@@ -206,7 +206,8 @@ static int mpc83xx_suspend_enter(suspend_state_t state)
 		out_be32(&pmc_regs->config1,
 		         in_be32(&pmc_regs->config1) | PMCCR1_POWER_OFF);
 
-		enable_kernel_fp();
+		if (IS_ENABLED(CONFIG_PPC_FPU))
+			enable_kernel_fp();
 
 		mpc83xx_enter_deep_sleep(immrbase);
 
-- 
2.43.2

