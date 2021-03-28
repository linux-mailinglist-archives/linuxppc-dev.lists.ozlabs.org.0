Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F061134BB6C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Mar 2021 08:34:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7Qsz6nLLz3c1T
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Mar 2021 17:34:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K1i+Vgp+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K1i+Vgp+; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7Qpl5D5zz30HX
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 17:31:43 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4715619A0;
 Sun, 28 Mar 2021 06:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616913102;
 bh=sUpQ42V7/BeYJXo8xKilrJhdJzUrsLncMVt8E/NbmTI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K1i+Vgp+d0Nt/rDzju12lI4q66EYLkSy5JZ076QiXlZZAxL4Zz1kplBNEVKnDnzeL
 XUtkjJuzzqCLW32Oy7ysq/RMmkHMZuPYez5Wyxk2SMMxQoDGAf6hQweBSn8yFBqUCW
 ilcp7x5OfSZ83pAAh9tjiC72g4z2cXm2BDzOz97kdkTOZQbGOFPWZ2VNnDrQitQwTS
 PSxomOd2/RHIlHwBLl4fVNVs7Ua1PUFN+gK1ipO1IHCQiFh6FVawbp4ISyuFZ29+sQ
 ZJw6ShzgANhvydDXfVdd/XWVF3Es2P54W9xEgMHObmbb/odl0xgFm9ORAQlNoAWC4v
 O2brtoUrLFkBQ==
From: guoren@kernel.org
To: guoren@kernel.org
Subject: [PATCH v5 7/7] xtensa: qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Date: Sun, 28 Mar 2021 06:30:28 +0000
Message-Id: <1616913028-83376-8-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616913028-83376-1-git-send-email-guoren@kernel.org>
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

We don't have native hw xchg16 instruction, so let qspinlock
generic code to deal with it.

Using the full-word atomic xchg instructions implement xchg16 has
the semantic risk for atomic operations.

This patch cancels the dependency of on qspinlock generic code on
architecture's xchg16.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 9ad6b7b82707..f19d780638f7 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -9,6 +9,7 @@ config XTENSA
 	select ARCH_HAS_DMA_SET_UNCACHED if MMU
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BUILDTIME_TABLE_SORT
-- 
2.17.1

