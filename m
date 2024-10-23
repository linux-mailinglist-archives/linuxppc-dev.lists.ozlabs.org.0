Return-Path: <linuxppc-dev+bounces-2511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9379ACC85
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 16:33:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYWkC0QMHz3013;
	Thu, 24 Oct 2024 01:33:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729694003;
	cv=none; b=kq5+cfp3fURaTaQtcF590tZxyDaxwin9sldhcrIT882Wpb7xEH1QE2wgXjaLdgxOR93fzCq+i8zyUHv3zrhHHlx9mH5nteTShhf27qlc2nKziJGfn+kCUQN55/hkvqGGtOgUx0VxL5ARK0BlsdQWk9t6ixEVaKX3ri5s9NYI20sby143YKRr61EaQBaA6L4RfUiea4KTrOl0zmguE43KERGdbRoa6zdENjyKM2FNtWi0vTCz7gI1hzj2xbF/s1Xq7XEhIzmYi9qrgCGqUj1dUS/4zzPL4ECatiRDRwxQRApOEzQaULe/6ZxDr4X34jjrZXEtw35bA+21AMhtOWGLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729694003; c=relaxed/relaxed;
	bh=pDjxwmtId5D1yv+V8nUC2Ce5B1WYIN8wzIVmwfC0KzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3dCsJrlRndFQAK2mZchsrQBnw2mOQA7z2rukaTTwm55Fecr/1q7GqFalCakHajen4RD0SgGfoQV+L33H7fV0MqdHk/mWih39sGqAQ+N5Ra+IyVdfR5MJTGTwUMPRg2ZaaXy3YYXCU9Wm9unCHVrH8gSpJACyyLphsxROnzEArQOEu4c/+0VOrFMa/ehCV+jMeebnbBBIcjYyib5qzieDYPJrVfK+ShWrBqa420IB49e5jozG2JCkrUKQU1ukASGHvAScItAslqDRBwqcjeTAgUxrf7pKJjkjRByo3HUI9s8vKVs2hylDzPmxDLwc+0DSJzFdZvbFvqKcqrMMKPH1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jiyc8PLU; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jiyc8PLU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYWkB1mzsz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 01:33:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B07CEA44F67;
	Wed, 23 Oct 2024 14:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC531C4CEC6;
	Wed, 23 Oct 2024 14:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693999;
	bh=8x4gbOVWk2fS1hTMUlUz7MC4z/meP6ZjHOlPHNJjRgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jiyc8PLUbGjx57lukD/YERhjbg1R6SiTOdR/9O3pI4EF8OsF2fYwi2CiODSxdnDxH
	 QJ7in2WJQ+kQIrotpRj6eBV0Zudinx2EsoeEtDADqPJ2J6a2LJiplmDpubhpeyt65t
	 e5tTsiVMTxeIBsd2nsSqa05+/lsYSnwEXM3VWIO5qwBQ5cCmnPgyow5DFwOAfYyXAg
	 tDEHwIhzuNw7TRi/hdRGX2/gLY7NggpttLaRW80k6PjhHvxUYVBszVWM/a5Rkz6tWt
	 jW9u9fzlCU8K/J9Ozk7bweklQlvIkeKStjmwZk/i25za0jPY0AgRwmkOSm37mFwku4
	 nKOZRQny0MEoA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	2639161967 <2639161967@qq.com>,
	Sasha Levin <sashal@kernel.org>,
	chentao@kylinos.cn,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 5.4 5/5] powerpc/powernv: Free name on error in opal_event_init()
Date: Wed, 23 Oct 2024 10:33:08 -0400
Message-ID: <20241023143310.2982725-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143310.2982725-1-sashal@kernel.org>
References: <20241023143310.2982725-1-sashal@kernel.org>
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
X-stable-base: Linux 5.4.284
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


