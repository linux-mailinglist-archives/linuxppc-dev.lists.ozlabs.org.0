Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 625FB350272
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 16:35:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9TPp3CpGz3dY3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 01:35:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K4mj3Ucq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K4mj3Ucq; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9TLf45Ppz3c9K
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 01:32:58 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 012EC60FF1;
 Wed, 31 Mar 2021 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617201176;
 bh=Ot/5PmXwS11uulWq3qWA2topEHV4IQyVTJcB7EIJEto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K4mj3Ucq0o81O2XyVG3hmXxx3WMjl1D+IiWQy6y3glymXCyXz7HvUH0Y/fnYr9f1h
 1wUUw0fx8O0SKe53NjW/bj/Ou5QXwaPc1g1UvmKUHfz4nwx525LvJmbfcYf5RgZhWk
 XZR9y8fM+4DYoaAJXNL2jgLdlXBwoOnIc/jSJ3r/9sKttJ2VVol/puJBKAjtvOtqgj
 YTwPsq2+RWCppmBEqhKeWazUtN2PGYkR30QcO8bTOPCiOzxjHuAOCNJtEBr/pnFukQ
 2743V9mO+HynrrCRbhsuAOsY5f1+RMF3zawK3FR7K+l/QgZF57ChVKoxlykrytyZNk
 r7q5BWtdFi1iw==
From: guoren@kernel.org
To: guoren@kernel.org
Subject: [PATCH v6 9/9] powerpc/qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Date: Wed, 31 Mar 2021 14:30:40 +0000
Message-Id: <1617201040-83905-10-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617201040-83905-1-git-send-email-guoren@kernel.org>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
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
 Guo Ren <guoren@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
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

Also no need when PPC_LBARX_LWARX is enabled, see the link below.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Link: https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20201107032328.2454582-1-npiggin@gmail.com/
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 386ae12d8523..6133ad51690e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -151,6 +151,7 @@ config PPC
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_QUEUED_RWLOCKS		if PPC_QUEUED_SPINLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS	if PPC_QUEUED_SPINLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32	if PPC_QUEUED_SPINLOCKS && !PPC_LBARX_LWARX
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_LD_ORPHAN_WARN
-- 
2.17.1

