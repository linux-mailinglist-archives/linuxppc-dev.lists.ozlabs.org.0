Return-Path: <linuxppc-dev+bounces-8313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2131EAAA145
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 00:45:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrxSg0pTBz2xqJ;
	Tue,  6 May 2025 08:45:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746485139;
	cv=none; b=FTeslU5RsMomu8C9Sqh2HjlqOnequXWZq1JQdEhQL3RKitG8eWwFXClUuIWpZFsvDovfzepR79Uozvp5xV6XUueywkES6DLJE82LFctE5+4TTbEv73Kws+Uc9eFnXSn6sczUUdnrTVDkZmTmrypucwA0W4HsIL+WyvD9kpWyG9BwYaTv7FkALA8gAbTzLbTDmnlkEio0yj9kE1Q9VQj3qZZle/XIrObm7NOrTVFpZud5BaXZssiQ9IA94GFv/xrZ0itof8l99j8beNYpsN0xPUTUgWZq2FYCWWmOYZALnJn0JCwZq7JweGu/6xYgviCTOXQedmzNSARdYfx81DQviA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746485139; c=relaxed/relaxed;
	bh=1oeUksM+z+wfF6xvMX49CYNf2ZWIj+GimAZQwRt7iNA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g0GlvT/RGcyXs4ZllqxL31SDRZxMCrcoGlG7uIqKIHYNsBGbhAJxxm+Es5torypW3OMRc296eSaAG5yXPkERGlM7v0buxxDd93YFAxUgCIHWU3MsB0d0f/H/Aeja40Gc5/NfflR8EO8vq/vWWImhVN3WvGs2G0wgbT/qMFMi4xHqFMOHa4TKdzojkHDBY9ddNvSwBN4jYNdJrm0cZLiIy56+mYwrpbXTMzm7pf58fnyo3AuR2dsDlk4sm7oaQot8YRZfvYiORnbTcMmf3H7bNJsCtj7sQSIG3pkrgXANQIPXJNJx1r2+T1L9bYIpFkGrZ7odaa0qNxECVPqUf5tlbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a4PaeK/J; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a4PaeK/J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrxSf3Zvdz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 08:45:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F3FB5C5834;
	Mon,  5 May 2025 22:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650B1C4CEEE;
	Mon,  5 May 2025 22:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485136;
	bh=env492LK+vvyLJ2wPesu0+se6FFVuWBfgNvAhXjV/bs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a4PaeK/JbirVJaFcUsI3EfG5OogzoIz/fo5RbNHIm0ljtVeHexXYo3BaactODoaZB
	 0qcTTAXTZgk/bDRyaGnyspqqqLEqnbZ3CGjlOojNzv4252vlCc1lWm5p34VWuAsX/8
	 oK+Q7eYUsfyEWkVv4bfSSgzDughFdLeLwlv/I5HECzWjDV/kyIwP0QGCySnJD7biRr
	 rpn6pDPUfJYEmP9cIc5r93wiDCKT9CYWmbZB/BBJVFczV1KoJxSMhNjmnjiRiCRtW/
	 qMZTsD2DipiOPZm7zWYsj3MKn3Fd/rn9oFOMxK1PABdZGoPO1Gw/QXJaCjyJFcIxwt
	 DzP3kVN5U5Hnw==
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
Subject: [PATCH AUTOSEL 6.12 178/486] powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7
Date: Mon,  5 May 2025 18:34:14 -0400
Message-Id: <20250505223922.2682012-178-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
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
X-stable-base: Linux 6.12.26
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
index 935568d68196d..b1dc4cb9f78e6 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2982,11 +2982,11 @@ static void __init fixup_device_tree_pmac(void)
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


