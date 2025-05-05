Return-Path: <linuxppc-dev+bounces-8324-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C498AAA3BE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 01:19:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZryCm0cYgz2yrn;
	Tue,  6 May 2025 09:19:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746487172;
	cv=none; b=BA+5FnjMii0JfLYBf+atoMXEgdE/ycmje/oOshq+O9WLcjF7ReeiUEi1q/6ZfF6cB8rmQyjyr2yGm3/5qo/njdwSORaj/gtxGt13euV/08NtTuC2FjMbW4TwjhoRDQp4P4UolXdL0JC07/NVtrtK/BACK3+ubGQITRiL73t+PQjlf00QhXiSpRtZgv5Caxdy1cxUakUs2iV3xO5HeHcQKaYGSMEUeynXBU6q6YPQHzP51lS97UUFFsTwr/E8yh0B+OozcfcZOMlXekp9Y2it/ERBfi8zgsLye74W7EA4CMWKsWl7/L7uguZzmr0UByz7YuS1x+Im4cOD1PoOfNA3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746487172; c=relaxed/relaxed;
	bh=rkUdDi6zMc5lBV9d4Gd6GUjvmCkWMuDCoOiJIxPUEuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VprHFs7bJrVJYa3O4VYq8bsS6sRxQxyvPW3ka/+fdoh5RxVycBG32QLrXsqIXZG76jksczzURaqbHcJxzH+ifh0vJnxIcGp+uSw7S/BNi5fHiW6yPgZrpytH1G1IL2b/mslyJgvufDTegl8j5VzgrJ6nQ0uEfr1RgXttkrYmtiaHAoCHuxLteqzAMCCPndLHdo2UXjrYJcD95Kv4rDQptFECr+A6pKw8bIceuL+vYPuMiHAP3Mnt75Ht82TcsUGBinw7mjUdMp9DOHiY4AJoj/5r6+GcaO08ALX2vtrdYeMUJ+AJtUfz0Jo/HdZDL6LMGaIa344Ym8LNpP6HDPw0lA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RvB8I8OH; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RvB8I8OH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZryCl3R7cz2yQJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 09:19:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB9B343B3D;
	Mon,  5 May 2025 23:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59BD2C4CEE4;
	Mon,  5 May 2025 23:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487169;
	bh=7GP6ZKiKPbgAQFMXfpN5Irld7+9/L3EwltMzGZmJATs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RvB8I8OHPzavoq+ckuO06bMqKNBOQjBccDhBnJslMZe/moapYV8k0HY5cHhdCV5Ot
	 sIn6TD1rdzvZOWje8hwu1RKwZ0ARB3Uojh7Xm2Ld3Of4cc15mFlvLTY5h75au5zYo+
	 Tf1s+K8l2lohiKre6xKlvKUI6r0rHtItheNz2MJNs+NTln3lnOMq+9KR0HYMikiRke
	 Wqzy15BLKsQzhqCu0J7oOfKN9lJQgWdggysrefhH97jt/dOPAECNNlFFdWngJCgE00
	 1GgzOhwJlFq2t3zFpaO903eSCOfzikCcxsGclmb7atgR1WUs4WgVsHXD/J/BrP50MM
	 b8t1hDs1eKcfQ==
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
Subject: [PATCH AUTOSEL 5.10 038/114] powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7
Date: Mon,  5 May 2025 19:17:01 -0400
Message-Id: <20250505231817.2697367-38-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231817.2697367-1-sashal@kernel.org>
References: <20250505231817.2697367-1-sashal@kernel.org>
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
X-stable-base: Linux 5.10.237
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
index 9a753c4dafab6..b29135dd73342 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2944,11 +2944,11 @@ static void __init fixup_device_tree_pmac(void)
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


