Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AE04EF1E0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 16:42:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVNDn0ywFz3c5k
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 01:42:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=txTMUW/9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=txTMUW/9; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVNCM6ZVQz3f2c
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 01:41:19 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26EBA60C8B;
 Fri,  1 Apr 2022 14:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55D9C2BBE4;
 Fri,  1 Apr 2022 14:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648824077;
 bh=36BEvjQhgTtwogplVLYvptZj3ZgbM6dbvLzk2LibxkE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=txTMUW/9U7r6EPVV7AAeRyo8dVdTJA/1gWiP003jvsRXQsIkIUboIyd7s7mxp9Wr8
 B9bLRa7rSK+3XcDc35jgWYLj3x2D8ypaZpQ9BGU00JixJs6E1VuKuNcXYIFnJ26nUU
 ibnymzDHKZTT4hG38c4xCHHcToRwt99RaLsMlJU+Nxu7uE9tU0MYjKFqQboK0SJfRW
 G4EnjF2fzqUvQmqTAqB9O2+H215W/tBcJQ8rA9EHqHoMRNeK/ecs4dd6z3XLokk+RJ
 UoQOQk3SpRnp8Qb+Os7Wm21t9pI5VnF8RGSr4QVlXm7Mpa/RQpvKlOMoGInxqrbvnP
 IHsdF8Bao7tqA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 76/98] powerpc/64e: Tie PPC_BOOK3E_64 to
 PPC_FSL_BOOK3E
Date: Fri,  1 Apr 2022 10:37:20 -0400
Message-Id: <20220401143742.1952163-76-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143742.1952163-1-sashal@kernel.org>
References: <20220401143742.1952163-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, kernel test robot <lkp@intel.com>,
 daniel@iogearbox.net, anshuman.khandual@arm.com, bpf@vger.kernel.org,
 ast@kernel.org, andrii@kernel.org, netdev@vger.kernel.org, npiggin@gmail.com,
 catalin.marinas@arm.com, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit 1a76e520ee1831a81dabf8a9a58c6453f700026e ]

Since the IBM A2 CPU support was removed, see commit
fb5a515704d7 ("powerpc: Remove platforms/wsp and associated pieces"),
the only 64-bit Book3E CPUs we support are Freescale (NXP) ones.

However our Kconfig still allows configurating a kernel that has 64-bit
Book3E support, but no Freescale CPU support enabled. Such a kernel
would never boot, it doesn't know about any CPUs.

It also causes build errors, as reported by lkp, because
PPC_BARRIER_NOSPEC is not enabled in such a configuration:

  powerpc64-linux-ld: arch/powerpc/net/bpf_jit_comp64.o:(.toc+0x0):
  undefined reference to `powerpc_security_features'

To fix this, force PPC_FSL_BOOK3E to be selected whenever we are
building a 64-bit Book3E kernel.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220304061222.2478720-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/Kconfig.cputype | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index a208997ade88..87a95cbff2f3 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -111,6 +111,7 @@ config PPC_BOOK3S_64
 
 config PPC_BOOK3E_64
 	bool "Embedded processors"
+	select PPC_FSL_BOOK3E
 	select PPC_FPU # Make it a choice ?
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
@@ -287,7 +288,7 @@ config FSL_BOOKE
 config PPC_FSL_BOOK3E
 	bool
 	select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
-	select FSL_EMB_PERFMON
+	imply FSL_EMB_PERFMON
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
 	default y if FSL_BOOKE
-- 
2.34.1

