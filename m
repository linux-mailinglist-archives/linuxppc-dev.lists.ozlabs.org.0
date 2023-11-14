Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CC37EB555
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 18:05:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VsRQhL1g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVCN131Blz3dSR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 04:05:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VsRQhL1g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVCKB5Qqbz3cRs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 04:02:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62E666132A;
	Tue, 14 Nov 2023 17:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 128F2C433CB;
	Tue, 14 Nov 2023 17:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699981354;
	bh=L9u1YAZnjCmI5frQZUszBrcjXGLM1MUKxS5O1XTqjO8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VsRQhL1g7sPW7JjhGGgfEDhh9v8tsUmVhmpFQg9gP9wkAPLuYCdGdfy/Cc8abPm9D
	 +qxJlVpPBjH9756zbBdATSiYpYoj/2sCbpq4ecrIo80ojoopXYiLo4Xs9Tw845xzsF
	 voyd/7bSwLz3m6TZS2SzuId7xTL5VthhgNp7qtjY34xcgheNeR7r9clnHzjLOhcXih
	 O013Oz/wHEkDrtuI1yl0vAfcNS1lv+7n4dqQROsV20wcLTW5mO1OHlSiSlaykivwwh
	 1dKS9U7LX9rT8HpRPrUHp43r/41FfA2/rMxxB8gGbbkdJ0ULGIPx9x716Ey2BLzLR8
	 hJxpSNP8Fwnig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00838C41535;
	Tue, 14 Nov 2023 17:02:34 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Tue, 14 Nov 2023 11:01:55 -0600
Subject: [PATCH 3/3] powerpc/pseries/memhp: Log more error conditions in
 add path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231114-pseries-memhp-fixes-v1-3-fb8f2bb7c557@linux.ibm.com>
References: <20231114-pseries-memhp-fixes-v1-0-fb8f2bb7c557@linux.ibm.com>
In-Reply-To: <20231114-pseries-memhp-fixes-v1-0-fb8f2bb7c557@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699981353; l=1765;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=OECSKa6t5Y+xw/dFXWQT+ZAW2UYSta5I9dOlL6VIXK0=;
 b=dpLpHPs0Ley06//CDlZvN2nxA6S6q9hWibBMvLImKezkUooMo/To8Nz4w7f9NF1NDFO4tSZQJ
 lHvRUjelc0uC0qO9H7SwQ0dRFb9b/CXrmYMyKBpqf+7OEIbQO8M83zw
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Scott Cheloha <cheloha@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

When an add operation for multiple LMBs fails, there is currently
little indication from the kernel of what went wrong. Be a little more
verbose about error conditions in the add paths.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index ba883c1b9f6d..4896920514f3 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -208,8 +208,10 @@ static int dlpar_change_lmb_state(struct drmem_lmb *lmb, bool online)
 	int rc;
 
 	mem_block = lmb_to_memblock(lmb);
-	if (!mem_block)
+	if (!mem_block) {
+		pr_err("Failed memory block lookup for LMB 0x%x\n", lmb->drc_index);
 		return -EINVAL;
+	}
 
 	if (online && mem_block->dev.offline)
 		rc = device_online(&mem_block->dev);
@@ -575,6 +577,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 
 	rc = update_lmb_associativity_index(lmb);
 	if (rc) {
+		pr_err("Failed to configure LMB 0x%x\n", lmb->drc_index);
 		return rc;
 	}
 
@@ -588,12 +591,14 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 	/* Add the memory */
 	rc = __add_memory(nid, lmb->base_addr, block_sz, MHP_MEMMAP_ON_MEMORY);
 	if (rc) {
+		pr_err("Failed to add LMB 0x%x to node %u", lmb->drc_index, nid);
 		invalidate_lmb_associativity_index(lmb);
 		return rc;
 	}
 
 	rc = dlpar_online_lmb(lmb);
 	if (rc) {
+		pr_err("Failed to online LMB 0x%x on node %u\n", lmb->drc_index, nid);
 		__remove_memory(lmb->base_addr, block_sz);
 		invalidate_lmb_associativity_index(lmb);
 	} else {

-- 
2.41.0

