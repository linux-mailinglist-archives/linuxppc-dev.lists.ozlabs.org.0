Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4561F601E86
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 02:11:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrvR81BV7z3dxw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 11:11:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MU6wkLIw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MU6wkLIw;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrvNg1tVhz3drQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Oct 2022 11:09:07 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EA9FEB81BF5;
	Tue, 18 Oct 2022 00:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C865C433C1;
	Tue, 18 Oct 2022 00:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666051744;
	bh=o4EPuk4B9Shg79X/Vlpo7frNkPaOH8zHto7ZIXtowqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MU6wkLIwh24XWm36eM2JvU4gYx/IYfRutfHY8O4OZZEFzPxMlHRvT/4sEUTcG+l4X
	 MfhmoO63hIY6Q9MNfY0nHNir5bq+zWGwvFI8GvHeV62UZaRIlRfTGrhHZC3K3gk/Zw
	 2sVPaxKXJ40E9UYR+hBpG+TQCbjQf2K1yYFNxN/EmRwm7KwaWsbdIZb6f+S9w17zgU
	 egvQFA5KpFwzb6jqoxxE06hFb/6MzAqukBWwEFRfQIHrW8WydjMDMvoITFkSCuic9Z
	 aEZvcFl+QR15greWcbNKHhNHdL4gMBEE1LjA6IaWH6LWFvWF2/Sd+O/S29zcoApz7p
	 QqiE1ge/iQQrQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 12/29] powerpc/64: don't refer nr_cpu_ids in asm code when it's undefined
Date: Mon, 17 Oct 2022 20:08:21 -0400
Message-Id: <20221018000839.2730954-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018000839.2730954-1-sashal@kernel.org>
References: <20221018000839.2730954-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Yury Norov <yury.norov@gmail.com>, aik@ozlabs.ru, amodra@au1.ibm.com, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Yury Norov <yury.norov@gmail.com>

[ Upstream commit 546a073d628111e3338af689938407e77d5dc38f ]

generic_secondary_common_init() calls LOAD_REG_ADDR(r7, nr_cpu_ids)
conditionally on CONFIG_SMP. However, if 'NR_CPUS == 1', kernel doesn't
use the nr_cpu_ids, and in C code, it's just:
  #if NR_CPUS == 1
  #define nr_cpu_ids
  ...

This series makes declaration of nr_cpu_ids conditional on NR_CPUS == 1,
and that reveals the issue, because compiler can't link the
LOAD_REG_ADDR(r7, nr_cpu_ids) against nonexisting symbol.

Current code looks unsafe for those who build kernel with CONFIG_SMP=y and
NR_CPUS == 1. This is weird configuration, but not disallowed.

Fix the linker error by replacing LOAD_REG_ADDR() with LOAD_REG_IMMEDIATE()
conditionally on NR_CPUS == 1.

As the following patch adds CONFIG_FORCE_NR_CPUS option that has the
similar effect on nr_cpu_ids, make the generic_secondary_common_init()
conditional on it too.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/head_64.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index d3eea633d11a..8408d3f7f61f 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -400,8 +400,12 @@ generic_secondary_common_init:
 #else
 	LOAD_REG_ADDR(r8, paca_ptrs)	/* Load paca_ptrs pointe	 */
 	ld	r8,0(r8)		/* Get base vaddr of array	 */
+#if (NR_CPUS == 1) || defined(CONFIG_FORCE_NR_CPUS)
+	LOAD_REG_IMMEDIATE(r7, NR_CPUS)
+#else
 	LOAD_REG_ADDR(r7, nr_cpu_ids)	/* Load nr_cpu_ids address       */
 	lwz	r7,0(r7)		/* also the max paca allocated 	 */
+#endif
 	li	r5,0			/* logical cpu id                */
 1:
 	sldi	r9,r5,3			/* get paca_ptrs[] index from cpu id */
-- 
2.35.1

