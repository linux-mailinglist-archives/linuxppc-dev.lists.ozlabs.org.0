Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAAF8AADFA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 14:00:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y19W1+WP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLY9Y1nc9z3dJX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 22:00:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y19W1+WP;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLY8q4B1rz3c4P
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 21:59:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713527959;
	bh=BoY0lO41RRRZeRUKw5KWNN7L/7Qgc6CXwAv1/WuXzks=;
	h=From:To:Cc:Subject:Date:From;
	b=Y19W1+WPR8Av3PbDyV33Ic35NjDDiCL9mLgTKYUHVOdqJO3jLIiu/f3bB6c65DXrV
	 IoteiMi/10qVTHjmuGDlSgScc+LFy8TMhgQN0J98B0kpn+jrsYXQbkkSzBcE9oggvW
	 ZM4bAnhpDsR+UxL6RtzUtH5V7NxCsdvBovYTNwsdZ9nmkdSdBA8cF5E5eIN8ic/H0T
	 0u4U84PCV7OAj6sKOboqBG9I8O/VlgLh35vrr9+KS6PoBwmHtE0KB1j0znO0E3bbUt
	 AlL1rrKkesxGWyf3ott/nWjDNpv+KF5N/Mav5124GkMVHenkj0TYjFr2iR5h9F/pG8
	 GtpQpCyJzPkUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VLY8l5RMxz4wxf;
	Fri, 19 Apr 2024 21:59:19 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/dart: Drop unnecessary call to kmemleak_no_scan()
Date: Fri, 19 Apr 2024 21:59:13 +1000
Message-ID: <20240419115913.3317575-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.44.0
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
Cc: erhard_f@mailbox.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Erhard reported that kmemleak was showing a warning at boot:

  kmemleak: Not scanning unknown object at 0xc00000007f000000
  CPU: 0 PID: 0 Comm: swapper Not tainted 5.19.0-rc3-PMacG5+ #2
  Call Trace:
   .dump_stack_lvl+0x7c/0xc4 (unreliable)
   .kmemleak_no_scan+0xe0/0x100
   .iommu_init_early_dart+0x2f0/0x924
   .pmac_probe+0x1b0/0x20c
   .setup_arch+0x1b8/0x674
   .start_kernel+0xdc/0xb74
   start_here_common+0x1c/0x44
  DART table allocated at: (____ptrval____)

Which he bisected to a change in kmemleak, commit
23c2d497de21 ("mm: kmemleak: take a full lowmem check in kmemleak_*_phys()").

Because pmac_probe() is called before mem_topology_setup(), the min/
max PFN variables are still zero. That causes kmemleak_alloc_phys() to
ignore the allocation, because the checks against the PFN fail. Then
kmemleak_no_scan() can't find the allocation and prints warning.

Given that kmemleak_alloc_phys() is ignoring the allocation to begin
with, there's no need to call kmemleak_no_scan() at all, which avoids
the warning.

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Closes: https://lore.kernel.org/all/bug-216156-206035@https.bugzilla.kernel.org%2F/
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/sysdev/dart_iommu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/sysdev/dart_iommu.c b/arch/powerpc/sysdev/dart_iommu.c
index 98096bbfd62e..c0d10c149661 100644
--- a/arch/powerpc/sysdev/dart_iommu.c
+++ b/arch/powerpc/sysdev/dart_iommu.c
@@ -24,7 +24,6 @@
 #include <linux/suspend.h>
 #include <linux/memblock.h>
 #include <linux/gfp.h>
-#include <linux/kmemleak.h>
 #include <linux/of_address.h>
 #include <asm/io.h>
 #include <asm/iommu.h>
@@ -243,9 +242,6 @@ static void __init allocate_dart(void)
 	if (!dart_tablebase)
 		panic("Failed to allocate 16MB below 2GB for DART table\n");
 
-	/* There is no point scanning the DART space for leaks*/
-	kmemleak_no_scan((void *)dart_tablebase);
-
 	/* Allocate a spare page to map all invalid DART pages. We need to do
 	 * that to work around what looks like a problem with the HT bridge
 	 * prefetching into invalid pages and corrupting data
-- 
2.44.0

