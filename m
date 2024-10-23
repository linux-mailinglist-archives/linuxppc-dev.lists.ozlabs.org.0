Return-Path: <linuxppc-dev+bounces-2506-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D00F59ACC5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 16:31:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYWgc3dQhz2yhZ;
	Thu, 24 Oct 2024 01:31:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729693868;
	cv=none; b=BaTLwfD3L1TbyoGro+tTVAI3dUMCFRP69va2J4wjfP9f712LOJetp3j2+scSTDRURmd01cX10RttBvqFMfVCdG9aWsBlaY9eAswNTcXZDO0NkTqk4PYLq/XeDhiJDM3aF4NMWk2YsHmEczQKUdyxWgOzeB9mTzvlJk6w8jgbzy5Xlf+Mdq9MZyqWUHmLOIVkt9kKOmYDILZY5Y5tQaq7V6sa/usFtP11s/V2aruSa9jFuL5apdbdqDT3pnHhdP1YmtIS4jFKv4Bi9+cVIjj/BKnRIh3gTHY8uJFV33eKcXqXn9A43gem5recgrkE2C+KsCj0HXZv62ijr1fTOjQODg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729693868; c=relaxed/relaxed;
	bh=Dwm0fvl3hbOXd579c9fYAqv42AXIBE6o/wB+VrfHBSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJGraLp3xtIlQm/RnsxkDa2uw/kUBQ7gzbmRszd9MkvXVxA8sQyE71N4L83AbMsGSaOAQ8TlX3t5YmqA7jx9RlQ5PjqJ3TU74huCgy9+YKqb5RpyHZ4nUTDzoAOBehqkXg9KsCAmbi1FLQmFoof+UdrgypwxpGFrf1Jxh1bCIwUIL/mZ8f8E9C18e7iD9GgicGDgC3f+KsfqzDq4nf8+IdPyo3575U1Fuzk78ia2GQjTVKcA1QzeJFuyYqRFLvveScOfdmF5hi948vd5CpX6kHLo3CLLaIlokAksSPquYQMmsYBYei5ir1iwzac+PTyjUPeEYbNXN2aF/DuTIkHQ+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DP2cTU/m; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DP2cTU/m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYWgW4Tvcz2yRd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 01:31:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BD788A44F33;
	Wed, 23 Oct 2024 14:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA8BC4CEC6;
	Wed, 23 Oct 2024 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693859;
	bh=ZDtV8Qyy4tkPd4t6rHAqBBHuwolPefaey8Kua1fEOgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DP2cTU/mwWt7Qaf09GrjR8ellg3ueTDXs1bfJxHaskrbLGz1SEMYJ5PF/fnYTrX25
	 64f234Q/JU99gh6ajczoKspY2cyCA1FLjssyc8En7AkleEN7kU5xzqwBp7FJULc3gU
	 od5FziRxz/J0EeQbf2xbVcBsUYXPoi5YgkcQ7hMM+G0ZlYtAtSvlnPial1ucr9n2UL
	 Se2+NfAL4hMhIESuuXybRBTBsEGlzUWwM/dSoWD33/ZEh5vFGXdr1pbMT93LfLCsaC
	 BJCy8Mf/3LBcF3k+Q4fO6kjluR1kSDVqcjVrPadImvN7qy5uITVxMB6+lEj2GCYX6t
	 fiRv3z1+gESeQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	2639161967 <2639161967@qq.com>,
	Sasha Levin <sashal@kernel.org>,
	chentao@kylinos.cn,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.11 26/30] powerpc/powernv: Free name on error in opal_event_init()
Date: Wed, 23 Oct 2024 10:29:51 -0400
Message-ID: <20241023143012.2980728-26-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143012.2980728-1-sashal@kernel.org>
References: <20241023143012.2980728-1-sashal@kernel.org>
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
X-stable-base: Linux 6.11.5
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
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
index 56a1f7ce78d2c..d92759c21fae9 100644
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
2.43.0


