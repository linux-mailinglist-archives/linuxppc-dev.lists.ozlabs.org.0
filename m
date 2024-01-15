Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7597B82E3E2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 00:41:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KqjQL52E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDTFC2j6xz3vvr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 10:41:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KqjQL52E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDSwm0jRsz3cX9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 10:27:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DCE4BCE18C1;
	Mon, 15 Jan 2024 23:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83494C433F1;
	Mon, 15 Jan 2024 23:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705361254;
	bh=/lviASqqMim5xhxDrlr1Lj+rF9K61xxo1mrAkLb/16M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KqjQL52EAyTb80PMDDh0/heSVSp5BSI0KZ3/qqsuQV//L83DNVCbDjSMkkcnaooL9
	 AgOnwrytNE9jiQlbOm+DEDX2M7/+z3oaeFd68Q3sPmqxaZUrnj8jjecI1MJeEzS17P
	 v4HFYYIvuGZqGitcMKtegUS0WFqg7Vl8FjZRYrr17wtxo4WVBtWtZIVyj1mQGmPdka
	 CL1e8x+qz/h1aeFgMWcoFAEIoK4o+XJ8G1plEeSDg+kzh03Wlql/q7BCQNMssMb+c+
	 V5A8gIvG8NPz7HOqtlMqj60wO08sFfb+xVPE2ci0YqHzZZOTHZJKdsSpUfCl2dbC8G
	 YHYtct1g+r38w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 06/12] powerpc/mm: Fix build failures due to arch_reserved_kernel_pages()
Date: Mon, 15 Jan 2024 18:26:51 -0500
Message-ID: <20240115232718.209642-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115232718.209642-1-sashal@kernel.org>
References: <20240115232718.209642-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.147
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit d8c3f243d4db24675b653f0568bb65dae34e6455 ]

With NUMA=n and FA_DUMP=y or PRESERVE_FA_DUMP=y the build fails with:

  arch/powerpc/kernel/fadump.c:1739:22: error: no previous prototype for ‘arch_reserved_kernel_pages’ [-Werror=missing-prototypes]
  1739 | unsigned long __init arch_reserved_kernel_pages(void)
       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~

The prototype for arch_reserved_kernel_pages() is in include/linux/mm.h,
but it's guarded by __HAVE_ARCH_RESERVED_KERNEL_PAGES. The powerpc
headers define __HAVE_ARCH_RESERVED_KERNEL_PAGES in asm/mmzone.h, which
is not included into the generic headers when NUMA=n.

Move the definition of __HAVE_ARCH_RESERVED_KERNEL_PAGES into asm/mmu.h
which is included regardless of NUMA=n.

Additionally the ifdef around __HAVE_ARCH_RESERVED_KERNEL_PAGES needs to
also check for CONFIG_PRESERVE_FA_DUMP.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20231130114433.3053544-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/mmu.h    | 4 ++++
 arch/powerpc/include/asm/mmzone.h | 3 ---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 8abe8e42e045..de0bb77f54e0 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -416,5 +416,9 @@ extern void *abatron_pteptrs[2];
 #include <asm/nohash/mmu.h>
 #endif
 
+#if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
+#define __HAVE_ARCH_RESERVED_KERNEL_PAGES
+#endif
+
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_MMU_H_ */
diff --git a/arch/powerpc/include/asm/mmzone.h b/arch/powerpc/include/asm/mmzone.h
index 4c6c6dbd182f..3764d3585d30 100644
--- a/arch/powerpc/include/asm/mmzone.h
+++ b/arch/powerpc/include/asm/mmzone.h
@@ -42,9 +42,6 @@ u64 memory_hotplug_max(void);
 #else
 #define memory_hotplug_max() memblock_end_of_DRAM()
 #endif /* CONFIG_NUMA */
-#ifdef CONFIG_FA_DUMP
-#define __HAVE_ARCH_RESERVED_KERNEL_PAGES
-#endif
 
 #ifdef CONFIG_MEMORY_HOTPLUG
 extern int create_section_mapping(unsigned long start, unsigned long end,
-- 
2.43.0

