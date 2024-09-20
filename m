Return-Path: <linuxppc-dev+bounces-1489-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB25397D3B2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 11:35:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X96gf71tvz2yNR;
	Fri, 20 Sep 2024 19:35:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726824926;
	cv=none; b=YlQzlm2PIh0LUEmd4PQaOFOjhvRbAMpou/9UpeMPqfR2K1c/SuRw18wRcQDTXVIPHKSuxdcmyRZ4bYbGtZ65JGZunLED+WFZscVmulPza7u9D0Lhbik1Xs6WsHqKY5G2TUM0328DEnE5jsts1PUw8+nco866Qa/bdenYSke1Wb8DV/QZzpRrKJ/Gwp1gK/ELRaGKN/pmcaMN7Raxp+fzbizLttaNsDXjvdaxlva7CMr5asCHfpO3tj4zHDHWVk8Yqt3V4nR+keBdrvdPIVistOwk5+31N21VD72xl3OYDsXQ3w1VQaBsUsuxxeL94NpSyAXIOgXkRLmaV8LXZZqLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726824926; c=relaxed/relaxed;
	bh=MjaLr9GNYLQxOxvv+bAJ2U9YC4JPXOEHGJODm7PBqHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/uI78gztX3QUL4X4W3P35FrTWkc0Mq/jLdQteuWAt9K4Sq4AG8aOAKRplpMstlHMMbLBeqnStDdQPUVWszBW3oy7jFUS3QusLe2Wr4glw1Yu7yIqGV77H6+kDYJ/SZeV36dbF77HdsSzBaM1polLhQKPkOkSIqdZJWF5QVRbPyBlGNIZbnYXcShWK1d62aNI7sgm0vnpIITH9uRbQeJIrEirp58ngDEUNnhmNrCbd5Bq4zCodbp8aK7sgGUF2XUpUv7Zc2CuBH/Jy1Rx/bUW4aOV0qYbbgYjgBnLYp2jwhsv9Hq+od13SVg48iDe2kUNMdxQXo1mK85YKJz9lH8AA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LaIJthlI; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LaIJthlI;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X96gf3byLz2yNB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 19:35:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726824926;
	bh=MjaLr9GNYLQxOxvv+bAJ2U9YC4JPXOEHGJODm7PBqHo=;
	h=From:To:Cc:Subject:Date:From;
	b=LaIJthlIzX4NaRCPc0RvYQZ9YbAVIoikR2nWWwfoIGToOvxO9ZJtNs4a70RRVNS8T
	 Bma+dudJJNKo1FEIrqQ3+dC4cEsZWWvkcuuOlEVCmBEnyIisYXX+T2E1zCKyfr17xS
	 TkNPmX+QzltheewaisK5cuI47Rs1id7PsiYnGjS5dFdM2d3FRwpy1dNGD5S4JkzUBq
	 oqrW9bz7c9M64pm1ZRHoY4cCgrkC6cLZoS4n+osrkWkA/uprMzw+ffHfdooj13sjUf
	 yMAti+FDTtUTw4M1GUNZCzN3XTEcE7sdNrze/HC2lFZwtkFIpkZpuoTpB4SALORKd/
	 UJ0zVojivUnLg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X96gd60mCz4xDF;
	Fri, 20 Sep 2024 19:35:25 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: 2639161967@qq.com
Subject: [PATCH] powerpc/powernv: Free name on error in opal_event_init()
Date: Fri, 20 Sep 2024 19:35:20 +1000
Message-ID: <20240920093520.67997-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In opal_event_init() if request_irq() fails name is not freed, leading
to a memory leak. The code only runs at boot time, there's no way for a
user to trigger it, so there's no security impact.

Fix the leak by freeing name in the error path.

Reported-by: 2639161967 <2639161967@qq.com>
Closes: https://lore.kernel.org/linuxppc-dev/87wmjp3wig.fsf@mail.lhotse
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/powernv/opal-irqchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powernv/opal-irqchip.c b/arch/powerpc/platforms/powernv/opal-irqchip.c
index 56a1f7ce78d2..d92759c21fae 100644
--- a/arch/powerpc/platforms/powernv/opal-irqchip.c
+++ b/arch/powerpc/platforms/powernv/opal-irqchip.c
@@ -282,6 +282,7 @@ int __init opal_event_init(void)
 				 name, NULL);
 		if (rc) {
 			pr_warn("Error %d requesting OPAL irq %d\n", rc, (int)r->start);
+			kfree(name);
 			continue;
 		}
 	}
-- 
2.46.1


