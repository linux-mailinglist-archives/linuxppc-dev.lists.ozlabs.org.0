Return-Path: <linuxppc-dev+bounces-8309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D33AA9F6C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 00:23:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zrwz33pFqz2xnM;
	Tue,  6 May 2025 08:23:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746483807;
	cv=none; b=WKtIW3eCfNfxt6TdwWnefmuuZTkyN/vgdwM2S9poet9av6h0qewMdOlxYBR1p3BEbZRFajz9Bt96QS/fftm3u2U2Bopo0vvyvrnuiwI39J/MahF2LjG89YLd4gQMZc5RJ3oqIHNnn2Yco9dEVrdeX3q17sZEA3Q18+cquxTSUn9XCFyA4sedpspErJSlzKpFKU69yumKveGc4048eV8C9qLqW8K0WD/+79X2fdBoFqmqx2j0Iv4bwVYDvzcYS1uuSmUYp16AHXu1WJEKvXQ4VlQrt88417zvL8rzSGqyiixTl+qa6XJCgQXZ8wJtM+W/jSUTafRF9Seq/GR3gxCqSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746483807; c=relaxed/relaxed;
	bh=yeihD91mpY+9pLdeV+rqm9cV0cbg+618q1vVc2lfTjs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U9PViPB0jO325lXyBL3E7hrQ8ugqesCplVUpDbTbK9v3xhUabmd+LmV0OqvOkfc+orVLYxYb94lvL3bcdlxSWdkuw7kXvoWHnbS3+SQk6c2ZeftGV1Y+RU9uw2nY/SGQwcChRb8R9YZ+RqoBCOxRqL/KYt+ZDWLCIB3hJ/UaFEAP646dcpRo75gHoXmEUWIKdKvlCDHGXggLXnRTce07r0KF/ueKiRGlxE3YlGU+G1+u+1XbTCYFMbCFOQtKip0HH1uAdrLusZpzsarb7fKS6jb4e5+4xIq5JgsmWNLt2wNddI2sniTaqGJGR27Ie3NNOqj/dZHRjiVq/Eg8Y3WJ8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JwrSxt84; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JwrSxt84;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zrwz26GYjz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 08:23:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90578446C3;
	Mon,  5 May 2025 22:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4D6C4CEE4;
	Mon,  5 May 2025 22:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483805;
	bh=bogz9Du2XlSVscSMUP8bER1aXgn506UsMYXn8KFqCwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JwrSxt84e/oJudpVKBQcnytYdmYPVMS8qEieu6rx8F3lENMWK3Qbe4Rrne0D85DAs
	 aRlqVEm1cblHIIb3SE4+xOrQADrTEQK/t+vbb/zD2eb/QvngH7fOAeheVtv3h84FI0
	 1o2k/YQB4yt8u8GiNaFqAnHAaDZHo5roefUnIRU7A4ZMwXeWSh1XNdVoE4ubn6pQMO
	 yZ9UYlAmHZh7+IjUk7bq04rp9ApkKP36XIg1NpkTszonztB3/ng/dC2pyLP3RRajDx
	 Yhd1/FLLvIm68WhlQfqBCOpr0oQ92v07Vojnu3OydgEHUAPN04u6T+xtEeZyxqRXjn
	 eYSALhrnyOs2Q==
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
Subject: [PATCH AUTOSEL 6.14 225/642] powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7
Date: Mon,  5 May 2025 18:07:21 -0400
Message-Id: <20250505221419.2672473-225-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
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
X-stable-base: Linux 6.14.5
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
index 57082fac46687..fe4659ba8c22a 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2889,11 +2889,11 @@ static void __init fixup_device_tree_pmac(void)
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


