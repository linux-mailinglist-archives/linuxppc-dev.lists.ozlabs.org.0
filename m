Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AFA10617E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 06:57:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47K5LY4TyTzDr1g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 16:57:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="aIw6FRMD"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47K5C4673tzDqw6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 16:51:12 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 043EA2068F;
 Fri, 22 Nov 2019 05:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574401870;
 bh=QFLf3HJ6du181U9CDpuGFKVocaY+72lw3PwSNKydJss=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aIw6FRMDGRXtkvBAlYz3cSEHM5r45Ph00IKgZHt6/MqSCF1GLkX/p/EUYCymaQIRS
 tG8FzIuvof3WD0q4Up7yYih7WtGR9a8XDaB3g6yHQi8yCqb/pX3TEIWwgov34daXIg
 j3wNo2L0XpQJZovI8G5Z5R/LbjV716KOqTRaY6/A=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 106/219] powerpc/book3s/32: fix number of bats in
 p/v_block_mapped()
Date: Fri, 22 Nov 2019 00:47:18 -0500
Message-Id: <20191122054911.1750-99-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122054911.1750-1-sashal@kernel.org>
References: <20191122054911.1750-1-sashal@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@c-s.fr>

[ Upstream commit e93ba1b7eb5b188c749052df7af1c90821c5f320 ]

This patch fixes the loop in p_block_mapped() and v_block_mapped()
to scan the entire bat_addrs[] array.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/mm/ppc_mmu_32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/ppc_mmu_32.c b/arch/powerpc/mm/ppc_mmu_32.c
index bea6c544e38f9..06783270a1242 100644
--- a/arch/powerpc/mm/ppc_mmu_32.c
+++ b/arch/powerpc/mm/ppc_mmu_32.c
@@ -52,7 +52,7 @@ struct batrange {		/* stores address ranges mapped by BATs */
 phys_addr_t v_block_mapped(unsigned long va)
 {
 	int b;
-	for (b = 0; b < 4; ++b)
+	for (b = 0; b < ARRAY_SIZE(bat_addrs); ++b)
 		if (va >= bat_addrs[b].start && va < bat_addrs[b].limit)
 			return bat_addrs[b].phys + (va - bat_addrs[b].start);
 	return 0;
@@ -64,7 +64,7 @@ phys_addr_t v_block_mapped(unsigned long va)
 unsigned long p_block_mapped(phys_addr_t pa)
 {
 	int b;
-	for (b = 0; b < 4; ++b)
+	for (b = 0; b < ARRAY_SIZE(bat_addrs); ++b)
 		if (pa >= bat_addrs[b].phys
 	    	    && pa < (bat_addrs[b].limit-bat_addrs[b].start)
 		              +bat_addrs[b].phys)
-- 
2.20.1

