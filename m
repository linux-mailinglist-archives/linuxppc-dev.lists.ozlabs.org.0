Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FE84EF017
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 16:33:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVN1m0jNZz3c2h
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 01:33:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aw2L5bwv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aw2L5bwv; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVN0X0T9Rz3c44
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 01:31:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BB442B824D5;
 Fri,  1 Apr 2022 14:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9E6C340F2;
 Fri,  1 Apr 2022 14:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823512;
 bh=779IwsmopQVzwMT4JAhiVrfy59820UbMAuQJyjmPsyc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aw2L5bwvrQpVeZa0+CLGgxdImC5HLV2ppl1CLnfAYHuAUiHdlay/uY/109sCGmsiF
 krSIniGRAdk190hdDqvgClhVHbhAxv91B9R1Ge7zsfyXhcz0eN6HvT1S8gH+8sFWsh
 j+VrDVjUiYe1cVMWy7F2JXxTFu/JK6dskfFxMquVhSNhdV2B70jEYZv195g9ckxJnF
 xAHywSmfu+FNQAtmSTqJZ3fSjyyyAm1DrHLnESg/BHZj4vLO0yJyX/qWdxFjoAuvJI
 FhgICMl/09H+23SVGbo5CxlRu6VrrPemKjupNRLxDtNXI/PcBEm3gZd/z4Qs8AZPRj
 +sqfmv8424y2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 123/149] powerpc/64e: Tie PPC_BOOK3E_64 to
 PPC_FSL_BOOK3E
Date: Fri,  1 Apr 2022 10:25:10 -0400
Message-Id: <20220401142536.1948161-123-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
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
index 87bc1929ee5a..e2e1fec91c6e 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -107,6 +107,7 @@ config PPC_BOOK3S_64
 
 config PPC_BOOK3E_64
 	bool "Embedded processors"
+	select PPC_FSL_BOOK3E
 	select PPC_FPU # Make it a choice ?
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
@@ -295,7 +296,7 @@ config FSL_BOOKE
 config PPC_FSL_BOOK3E
 	bool
 	select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
-	select FSL_EMB_PERFMON
+	imply FSL_EMB_PERFMON
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
 	select PPC_KUEP
-- 
2.34.1

