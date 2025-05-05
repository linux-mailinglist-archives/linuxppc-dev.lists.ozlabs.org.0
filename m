Return-Path: <linuxppc-dev+bounces-8325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 366A8AAA3FA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 01:22:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZryHQ59dNz2yrp;
	Tue,  6 May 2025 09:22:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746487362;
	cv=none; b=MGJ4tSUew7XK7KWO6F3RMCzbECjNVqQKhEMXdqGXfnrbcfjh3PYiNj5RFFKSN3yL5SZ2X9MqCcDPSyLxxieSKVZXdC7L6Bjy2H7+UkZocrW3RriiORKZVz2vacwtBtL56NIT3vvW4rt2zpGjSxLnOfUEPOI14oiAzh2Z8rrm2uvZO1zRtfcqIgYA8CreHO5omiofBVZIDAeYzogL8r6vCOCFB/2MW3CzkoDilRTUnn4OMH3a6+wqadbxqrRWVGwnvau461saWmYRT5JuSgRcg135RGWEmFn7+q6bUZq3fTK1IQvgxksyqmAcAf12CZHAg3qBHik7MLkxgTLXuCQY+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746487362; c=relaxed/relaxed;
	bh=0zJB1xulHlM1faME87HlcvavAFxrp4uB1gWdhUcOjuk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k5Nve/1rEBb0pR3AzPTHoMZOnAzvacSifJnRbL8OJZjymeo21+nNAH994B3uzsOtHAwjvVDVTwhLp9y6BIwcbSJd3QQwccCaiaBV4pwa+FuXkz1lZ8uFXR8WRvybwDeO5pdOIeJDICmsXTh8RXvhyoZNnhvxoA7PjpNmfr1vzouj+nnOyepiTFyO2N3aYNqORu7EG+SjOXKDhVdj7enpg3+luhslPgsbGIn/bVct7kCDJA0/jlYdGpjgGbbqhvdt+l0d3Z/ZEkaQGQK99TuQKTiUsHyJU1+ztPxFkBz44XgiX/Whj0//cEp+I2cN0VNGBTDpCcRV2Jtgahz+oO0t5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WPyjhz5L; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WPyjhz5L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZryHM6Rvgz2yrf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 09:22:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10991629CB;
	Mon,  5 May 2025 23:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB43C4CEE4;
	Mon,  5 May 2025 23:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487357;
	bh=AaBh9Dd/5cYObI/jzmDqfnzOcjCINMIsA+x8OSBG37I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WPyjhz5LdJb2rL7dgo1xxd37bUb3ZBvVd7nR4KWUhZeai4OQ+W/Z/T/+KCZG5KqsS
	 25gV6GKDmC3j1VmH/ufL3Zo6A6+sQS9oyXiNq0z4bPNc7PKB8Wfu88W/lb+9vhodnx
	 hSW2HawfbwMPiMDtI122fWUlH67ODSly2BtUdwQoy8Hy4gLLVjXNCh3dHpLW+RLL6P
	 HlpJOyFw5EVRZgYaXob4TI8BFg1xjduDQFZBuTEfMJLxU+57Fl10NjzFWBlVX7asEQ
	 9pUe9b+rZuFsGV/JuQRfD66a3PXRDWE7w6x9Nm0V8oBOeDwWnTTBCt6a4L8XDSncy2
	 hTlmPCJ2qNPFg==
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
Subject: [PATCH AUTOSEL 5.4 27/79] powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7
Date: Mon,  5 May 2025 19:20:59 -0400
Message-Id: <20250505232151.2698893-27-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505232151.2698893-1-sashal@kernel.org>
References: <20250505232151.2698893-1-sashal@kernel.org>
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
X-stable-base: Linux 5.4.293
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
index b7ef63614417d..e0abb13b5806a 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2906,11 +2906,11 @@ static void __init fixup_device_tree_pmac(void)
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


