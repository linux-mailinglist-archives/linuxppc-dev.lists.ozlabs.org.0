Return-Path: <linuxppc-dev+bounces-8317-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 837DEAAA275
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 01:00:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrxnP2MHkz2yf5;
	Tue,  6 May 2025 09:00:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746486009;
	cv=none; b=IN5e/yoX4THrxlvU4CkQwTenE5PrVF/F8qepMpV4yJbXzA2OQeAmfRxxKR3pTMxMwy8bTChlAQ7uNFnm0cQAA3ykmcbWJP4waPpv41WPwpztgMdtV+NyUsaQ7Cz21dPC1juRf69pptEB5DLs+HRbJlfPwA/1I3P0ULhy39WZLNHEh6S9QKDMWJZ6BP8Gyt6iiY8KqcOxmxVrVYMKRLQ72ZGF9Qhio09RRx+JZEBN7bdFEnpkdDbuWXmFP4wPgb9lDDBNtbOr/FdcMx83dSOVOs9TZKjFcPmwz36JuAzOekMWK7GC8CBFKJ1HYT0b+wWXQ5hlWybd4i5F+INXQNHq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746486009; c=relaxed/relaxed;
	bh=jv6pwSr9nYlebyV67uSmUgd7OULwzm7mgw+/K8cyKjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SKNaTOLwG2pFOgsI57Y62ORIGfs2SD9NrSCGnSpwmoCaVZ0MM7LSy1RN8PWnkPli230LfeLhDRLoy6FSffUrL50FeTkVX+9RMgQv1EJ3h0gR78EsO7HLnxmPsrntMiC5HnsogO3D/aLlGJRnICPdDqkfd1oyX0dJARKSLbU8iae0wl3dG/2uRLBUAZS/o3k+4CV/qMBWhle7w6aBVZDzFRMakt6xklqq3TaKua+mvbwbskF+0u1DbZ7aKpcKmZMK7pxDAlaHAV+o6LGQmDP+3MAiIonHYKG+PB4clYlaMysX0oQvzXAzxM1kJIjOPWZkdDIrhJkDijtBpGvwyN4ivQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VJh8rE+k; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VJh8rE+k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrxnN4gHGz2yQJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 09:00:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7B805C5B55;
	Mon,  5 May 2025 22:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72458C4CEE4;
	Mon,  5 May 2025 23:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486006;
	bh=ZwZ3YGeWzp0VrR/6gg4OpFWFODZyzKKrozm/7+HYum8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VJh8rE+k0zo4MMu0KnlOmaA/Ix/zrL+vVcAAp6wSWoHckp0EwqiYY7YedGMNCYVpc
	 gHuSIX9o2sP8YKuJyLLHxEWdwtS5EldZsNCDMlCgTaGuZVtWtwDOqBHJT3QjOPTdyD
	 W12oSgT/ugyzIl8eZ7oWB0vOpDp8/SLbQz/yWZ/zhy1pUgiZx0E8EnTT1+GIRbsUFu
	 E5gZ//cYpNflsPMZwjLi8Z+8/aM81OXVeZqeKYWWAKmNyOZMcUbZ2UdsiPwWOeTT1e
	 QBDLsGnzs3ch+R162tQaFmt5icM87Gal7xpPykc3VfaRBZjG3kRufkjhjBbAMd23QO
	 hpMwsf/hV595g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andreas Schwab <schwab@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Sasha Levin <sashal@kernel.org>,
	mpe@ellerman.id.au,
	mahesh@linux.ibm.com,
	sourabhjain@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.6 106/294] powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7
Date: Mon,  5 May 2025 18:53:26 -0400
Message-Id: <20250505225634.2688578-106-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Andreas Schwab <schwab@linux-m68k.org>

[ Upstream commit 7e67ef889c9ab7246547db73d524459f47403a77 ]

Similar to the PowerMac3,1, the PowerBook6,7 is missing the #size-cells
property on the i2s node.

Depends-on: commit 045b14ca5c36 ("of: WARN on deprecated #address-cells/#size-cells handling")
Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
[maddy: added "commit" work in depends-on to avoid checkpatch error]
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Link: https://patch.msgid.link/875xmizl6a.fsf@igel.home
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/prom_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index a6090896f7497..ac669e58e2023 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2974,11 +2974,11 @@ static void __init fixup_device_tree_pmac(void)
 	char type[8];
 	phandle node;
 
-	// Some pmacs are missing #size-cells on escc nodes
+	// Some pmacs are missing #size-cells on escc or i2s nodes
 	for (node = 0; prom_next_node(&node); ) {
 		type[0] = '\0';
 		prom_getprop(node, "device_type", type, sizeof(type));
-		if (prom_strcmp(type, "escc"))
+		if (prom_strcmp(type, "escc") && prom_strcmp(type, "i2s"))
 			continue;
 
 		if (prom_getproplen(node, "#size-cells") != PROM_ERROR)
-- 
2.39.5


