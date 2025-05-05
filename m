Return-Path: <linuxppc-dev+bounces-8320-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6405AAA313
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 01:09:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zrxzk2bnSz2yrV;
	Tue,  6 May 2025 09:09:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746486546;
	cv=none; b=XBzDVZNl0JWyj6u6X2Qrc7seybLisjoKHJpBvcPXZHkqImJ0TGc9Zbu53KDM+gk52ipeeqVQyPc/o78PxaQsSSa2NBW+vi11r1R0ok9wfJq9ZiBO5uxj/Iv4daGMfS10Bccw53DkGlK2u+K0swamiOmuTr/eEUdgNwqWk/Yc3n0UaG35dNzCkmO6lFrRsCGwzGYAUppbyIznP61WnMbLUYHJic+80ouY5eDIolzqcdQgFEZOdZDeGJbM2tOG+ecpajllvxFqY5ziJvFtA1TGhbSe+GumihI+qhHXGrm7DWet6yNVCgR6QwR4KWYKRfy6ycySrSrTXmpxstOA37JCrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746486546; c=relaxed/relaxed;
	bh=jv6pwSr9nYlebyV67uSmUgd7OULwzm7mgw+/K8cyKjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R25bj9smdLVWSWylBk0lmm/gd5ua9N/DkoF0dqJ/czNA46iUMJorYo0cVeeyHtoeYA3GYGlXAM0PgYZzoiLmvn9XLw0bPCRr9H1XOeT6o0P6C+DFsgmpFz5gHI28b5yGPMvM8zxwAfDBenZsr7VUvInPthst2YveDJbfiEem+H1SSNIVGS4vGA6myIDugjN6uYDRfEJmCrRsXDDHCVCWvfTKUt1lFsRtaSrKIcB8BBcsh4or+scI3rZ7A8SEkMlI1Alnwmbqai1Iyu5tgbwIfKSaQL3Pa3JDn+jIU/1Bf8hnOZrmwSn8SjA4Jo4OgpMsdKlTuqoYPBl4zMnI23d0eA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E2fDnh7I; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E2fDnh7I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zrxzj4HHBz2yQJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 09:09:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E9204A896;
	Mon,  5 May 2025 23:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CA7C4CEE4;
	Mon,  5 May 2025 23:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486542;
	bh=ZwZ3YGeWzp0VrR/6gg4OpFWFODZyzKKrozm/7+HYum8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E2fDnh7IrhDIWi+Q0HN3iRp2K5WGoqsrZdZk4Hvas5qUFHs2ALAOoXFI4hofrV+ea
	 TXvhgTMB+27zLiM+bSe6vktQiAC9PUDCaSyrTbiHwSZ6jRpJX6UNzCeTBrdQdCJVlo
	 Xs2bn7w4rHVI477FQg4/rpUb4muK3QzEValD6qhZOnK/GyJFii2vl3OS4eUtmCmsyc
	 paZyMGVp87VEZzZK9uWZxGKOVnt40s73vNUPVv6cuD5K6YbWwMeCfFdU07qnc/5vrO
	 cXE+ZLW7I2bfW3Y/NxTynx9ZHMEExG4qrvS93WRyLxc7KJ9kqbgoT98Zvet/J4PNuh
	 WRTODpv4MYlZg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andreas Schwab <schwab@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Sasha Levin <sashal@kernel.org>,
	mpe@ellerman.id.au,
	sourabhjain@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.1 081/212] powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7
Date: Mon,  5 May 2025 19:04:13 -0400
Message-Id: <20250505230624.2692522-81-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
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
X-stable-base: Linux 6.1.136
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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


