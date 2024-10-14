Return-Path: <linuxppc-dev+bounces-2208-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E6899C7AD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 12:55:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRvJh29G7z3bjk;
	Mon, 14 Oct 2024 21:55:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728903316;
	cv=none; b=kOrf5JcVXnnyELlSvG9agTZaW8KZbtrIPIyr5QqJ6bpcVWslDQVX5XCz6Bioowq5xci/9hV5OwCRMJCz74S6jvIFBKqzpo15d5F7rRPqraVD1SU43aWquKAuXhjeW6p/a8tKjAngp1rfqLPe7zbz7wqJvxSf+EReXE8d+HX3E+5o4FU8IfryafCKmJTsGGq81DU4EU4RC7Hod6lJ8/vX88d24f6RL3NrCCN20X3g7K/vwbS1/D15uHoaVijFSvL2lJTHjRKBO2n1aeOJVCmZxvbP7kcRj7UH2aMgtudCLi0tUBAU28ki5grG9hhEFHrO9rAq3zxTOy6S5x7FvFfzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728903316; c=relaxed/relaxed;
	bh=CIu0JxHhUec4RbFeJMvbhmilsnzMc5OeXCLuzPxXGKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FkQyeM3nczqBcR1sFvvm0Z2lV7lYzXNgl1EjJwUBsMgFodXOuKuswzo+HTlTXJLkbt1aQA8qwuQB2vN/g24GhWOlXHQkEexJM8S/uKl3ktjwBCk3rDIWazH53dSw8a65F9/iXQFmYPfOjP8rwCc0C4x1SZXtfFG9oDgr6pgmbvB6P8hQ512Zw6N/PMDQIluGLla72MemBq3PONukUwAEpTnDziITMo9SbQ0Hv4HvXVlKpzw+HuwAMRKPxkt52/lebhufw/kETa5nXid9AY76Z9jAyh+fJsFsSqqQmLid0uSIB4SZCe4mnY4npUHEf33Lk6CLKbpfTuAkvbFGKcNPUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aFXY5Gvt; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aFXY5Gvt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRvJg2Z9Dz2xwc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 21:55:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B2D8F5C51B4;
	Mon, 14 Oct 2024 10:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BB3C4CEC3;
	Mon, 14 Oct 2024 10:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728903312;
	bh=JZRu3YtZSgX6GgIUaKBeJSPONrhupGTupYRFhNECIfc=;
	h=From:Date:Subject:To:Cc:From;
	b=aFXY5Gvt/KKjz3WCSRzB+z/ukikO7VrXzszKlgqzHxOT1l0LWTUw32WaIpuLbk65k
	 Gqmgp4weSDgyalECvAeEFEPmq2tw6M1FaKdXJUi6+NttPkbWmlkPPN1cGOJsr1unD4
	 7xmYUd0USAHQquuxT0P0s/JJ+Yl/d05lCwWVfbDRkd7DGm6u/4c+pB9OfGL0lvbmt+
	 xjkKZnDgmG5sjMd03G4tlHEmiKEiC9GN3+Wytk/Pvb/3xunWYt0GoTALEohpUodlPl
	 bzImFMzr3P4CrylRh4anhIZEkWcUagawwrNvx3o9gmu9NtcpAUpubbsjPE4JScQupy
	 g+HcfdsFc3Saw==
From: Simon Horman <horms@kernel.org>
Date: Mon, 14 Oct 2024 11:55:03 +0100
Subject: [PATCH] powerpc/ep8248e: Use %pa to format resource_size_t
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-ep8248e-pa-fmt-v1-1-009ea0dcc18f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIb4DGcC/x3MQQ5AMBBA0avIrE3SVsVwFbEopswCTSsiEXfXW
 L7F/w8kjsIJuuKByJckOfYMXRYwrW5fGGXOBqOM1Upb5EDGEmNw6LcTq5bGph5JteQhRyGyl/s
 f9sP7fvDVtr1gAAAA
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
 linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.14.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The correct format string for resource_size_t is %pa which
acts on the address of the variable to be formatted [1].

[1] https://elixir.bootlin.com/linux/v6.11.3/source/Documentation/core-api/printk-formats.rst#L229

Introduced by commit 9d9326d3bc0e ("phy: Change mii_bus id field to a string")

Flagged by gcc-14 as:
arch/powerpc/platforms/82xx/ep8248e.c: In function 'ep8248e_mdio_probe':
arch/powerpc/platforms/82xx/ep8248e.c:131:46: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
  131 |         snprintf(bus->id, MII_BUS_ID_SIZE, "%x", res.start);
      |                                             ~^   ~~~~~~~~~
      |                                              |      |
      |                                              |      resource_size_t {aka long long unsigned int}
      |                                              unsigned int
      |                                             %llx

No functional change intended.
Compile tested only.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/netdev/711d7f6d-b785-7560-f4dc-c6aad2cce99@linux-m68k.org/
Signed-off-by: Simon Horman <horms@kernel.org>
---
 arch/powerpc/platforms/82xx/ep8248e.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/82xx/ep8248e.c b/arch/powerpc/platforms/82xx/ep8248e.c
index 3dc65ce1f175..8f918916e631 100644
--- a/arch/powerpc/platforms/82xx/ep8248e.c
+++ b/arch/powerpc/platforms/82xx/ep8248e.c
@@ -128,7 +128,7 @@ static int ep8248e_mdio_probe(struct platform_device *ofdev)
 
 	bus->name = "ep8248e-mdio-bitbang";
 	bus->parent = &ofdev->dev;
-	snprintf(bus->id, MII_BUS_ID_SIZE, "%x", res.start);
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%pa", &res.start);
 
 	ret = of_mdiobus_register(bus, ofdev->dev.of_node);
 	if (ret)


