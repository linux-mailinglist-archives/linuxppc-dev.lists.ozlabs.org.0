Return-Path: <linuxppc-dev+bounces-2510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8749ACC84
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 16:33:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYWk20MmSz2yxN;
	Thu, 24 Oct 2024 01:33:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729693994;
	cv=none; b=AC2TFGprEJ+T8RKmcYFXJX/VlsgbrG6UoF/xyE6nWQjDR9y+MGKW+frgDbts0Jb5acQD7bhpHFAD3qd8lSxUL4J0O7oVWEFobMUY/YalzRXfLQjVltM7cxZa1cRwXJ84UhHMWGuGgMSO4nWvXCRS/yQJBwQeF855C/2WiZXC/78R9DRsnog6PJ4pvv0JLgPBkBq82jRqKssVojqPW7Gztf/ZNLPQ8uYyXJ2bhOoRiBBj2gGOwU9o8W6ND85C9AEd9MIJS1CjYZ8CDrn6lQMqH3jmY4AN2t8IOW6/TRgSqIBeQtv7cCAu2sobVFf3JFQqTCTV6s1davFDDE5ZG9OBvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729693994; c=relaxed/relaxed;
	bh=pDjxwmtId5D1yv+V8nUC2Ce5B1WYIN8wzIVmwfC0KzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NsSAirpO9nzULhFVLqYBXhTb+HLhDwVlCWpfKeA5KGiNz8tZQhLlProvkw4nD0nUqOiOzPCqo4OzUJv6RV5cnRJTpGIUd/AQpaY/1w/3Bh0O4QoSQ3aYnXVIpi1cnwPnebcpPYCV7mtQ7q9mh/6utW+S5F3uLc6kqJqUGQ8pwFDumcPVlIa0EpSaFN+HHvEn8Y/I8zvYoeNvPbaU9A4IZb7svTam09zed+nx+LT/uScguXybRz2sFcOGVKyFa66Muz9/yACwZ3E35Lz1h0X3DJAPLhACpqTdudcebCFdHlSG1TZWye7TfZWe6N93SuF4DrPzlxtp6QEHmBR7Wx0S8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IEMIYVea; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IEMIYVea;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYWk05x2pz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 01:33:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E3F2A44F68;
	Wed, 23 Oct 2024 14:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AB3C4CEC6;
	Wed, 23 Oct 2024 14:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693988;
	bh=8x4gbOVWk2fS1hTMUlUz7MC4z/meP6ZjHOlPHNJjRgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IEMIYVeaQw3EjpZ85UREWfx6eDDnU4FPQFe5w/H9bipbuhtiIzsSrikKVH6QVRzbn
	 BaudYdH4AndjpO/2NhxcWrW8xjuWp8X1fzztyXhDbcpWv/gppzgisIG6T9mKNOR/mp
	 f8St9VnDWBXtkDtXecMUjRUeSOcYN9DtvbSe4lik91sOQPtofvsnxMLSLFh5gaq+jP
	 wTzqa/lP22E1S0WlG4MmBfrMm6FFxRQUC6xx9H5/6LRXpbiEHGWzGcMx0Np3od5efn
	 uSRz44VgG17JJwjnLcsIMQ4apUP9ismGliV1iO7kbBf6pYyme0ndW0DyuztN5NjpNb
	 nkh9df/OaSfjQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	2639161967 <2639161967@qq.com>,
	Sasha Levin <sashal@kernel.org>,
	chentao@kylinos.cn,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 5.10 6/6] powerpc/powernv: Free name on error in opal_event_init()
Date: Wed, 23 Oct 2024 10:32:53 -0400
Message-ID: <20241023143257.2982585-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143257.2982585-1-sashal@kernel.org>
References: <20241023143257.2982585-1-sashal@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.228
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit cf8989d20d64ad702a6210c11a0347ebf3852aa7 ]

In opal_event_init() if request_irq() fails name is not freed, leading
to a memory leak. The code only runs at boot time, there's no way for a
user to trigger it, so there's no security impact.

Fix the leak by freeing name in the error path.

Reported-by: 2639161967 <2639161967@qq.com>
Closes: https://lore.kernel.org/linuxppc-dev/87wmjp3wig.fsf@mail.lhotse
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://patch.msgid.link/20240920093520.67997-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/powernv/opal-irqchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powernv/opal-irqchip.c b/arch/powerpc/platforms/powernv/opal-irqchip.c
index dcec0f760c8f8..522bda391179a 100644
--- a/arch/powerpc/platforms/powernv/opal-irqchip.c
+++ b/arch/powerpc/platforms/powernv/opal-irqchip.c
@@ -285,6 +285,7 @@ int __init opal_event_init(void)
 				 name, NULL);
 		if (rc) {
 			pr_warn("Error %d requesting OPAL irq %d\n", rc, (int)r->start);
+			kfree(name);
 			continue;
 		}
 	}
-- 
2.43.0


