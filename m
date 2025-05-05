Return-Path: <linuxppc-dev+bounces-8322-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 746CAAAA378
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 01:15:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zry6w6Lvpz2yrX;
	Tue,  6 May 2025 09:15:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746486920;
	cv=none; b=X9ZEoAtyBpRvooUKriTzjqvWPzbJ9nbhxkecni8U1InEKZFpR3Sw/j9XRno4i5ejwniZnkVCv27HTHZKTa2FWGix1533usol80sjO3WSq5cwy/t67oz5bkgcsQRM2XnGT2CaR7M3eaYbzNi72rQWZ+MCCG0PrMpoBu/2eFKgtEpCz9Aw2X6mkNDoaU3AgaTVyaul/iu2HzZBrXsErBNFJ4sF8B8+NWFzawgMiTHDQCAoJndqaI5QYDPE5MhSh36UKV7tzV8oe7dc1ngdOgt4x//qH0Rl7FOpH3j1hcDlSKbU9RJvD49v4XoWok/R3PSmxWrz1sMqYWfYikx7zR1Y7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746486920; c=relaxed/relaxed;
	bh=Lfcair5GSZh1DQlXDFks5fr5yfFCRoubI8GW/mEt/7M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NWHocA+9XiyTi0aconoSDPkNlMu7UagjyBsKSQnq0gaabEIlDaxGcBzu9AmiD2Qsw+lw8T0k8baG+nWaVEsW+xLKRsACX1GJviE0cUviKZtvKOUUWmSY6cEdtYtYpzzrQk0bis34afUVVlmvMmSkOGFRlMpb7lEFu9O+SToucdyAK4+uaVBARgi2AnOILGGCrtVNtxldGJh9JEtKALJZeWgXdi21Xa7+ViZjZnz0cclUQehJtdDABg2wR+z++VrrNoHKUqFc9ztsM8tRaJoPLfoWAqAhxbMlNYqOM+U+FPONjiivX0f+5iETGUxh5/1adn8q1cP4Uf8tI9NcjbmRpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hxoa+szh; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hxoa+szh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zry6v1s02z2yQJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 09:15:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DAA074A1FA;
	Mon,  5 May 2025 23:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62187C4CEE4;
	Mon,  5 May 2025 23:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486917;
	bh=XLMmjYNZfvEVGWVc35sSzaNlQVzUVSow72mCRxS8E7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hxoa+szhKo3UlHNecGTIVTUAfh6DQJ3BgDpvBDISTSefNLdu2uifqloLxXvPRqUii
	 aHGBFYAU/4VXrOYw6r9m+M2tKJOfmOISmQmVOTg0XpGHn6t4wsHV7l6SeG1vr1ubU2
	 hkB8beuaG3lI+TRoGKHa1dl+mUqfTmUYNozSeZBE3rHYcPAG0LeH+OIarySYsPm0/I
	 Y6vJNq7B5dQf012vOF5qzdY525S+qqQR938AzSgzIPHTcCVlcyC7Cr/ugTZgIsgr6h
	 B5Xx7EW/9edNQ0eVIl2iRfav4SPOl/NSpdWr15L193zrRpD7r8eJ+scRdQxdJVrZRg
	 aQdxo1Do8BPFw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andreas Schwab <schwab@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Sasha Levin <sashal@kernel.org>,
	mpe@ellerman.id.au,
	sourabhjain@linux.ibm.com,
	mahesh@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 5.15 057/153] powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7
Date: Mon,  5 May 2025 19:11:44 -0400
Message-Id: <20250505231320.2695319-57-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
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
X-stable-base: Linux 5.15.181
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
index 302c2acc8dcbf..491de25e38a86 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2978,11 +2978,11 @@ static void __init fixup_device_tree_pmac(void)
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


