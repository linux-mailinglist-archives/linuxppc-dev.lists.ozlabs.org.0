Return-Path: <linuxppc-dev+bounces-2512-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C44FB9ACC89
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 16:33:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYWkP5TLnz306d;
	Thu, 24 Oct 2024 01:33:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729694013;
	cv=none; b=H/Bl/RrTfcogf4Pnsgn1bXy6IEP1o7Wj4rmRHyF/mWaF+uoq9LO0b5ZFz+axrAdCgMj5alASFU811EEQZpRypk4EcYPy5IwEOQS+aLF6vDD1LQpQ1w5AGEuZj/Ib4o1JfMtwGP7+j3HT5LDiKV2fcRNETEXjkp6flek3fnZ9tMlquazHe8nQTXNdCbqNtC4MTJwtjr5z09tA1ISj179pnx94QQiloutbXvIsun/B1xR9v5dXqUvZq4ZLgCXSVyyvBmH2GxPCn526EXyh7SPe7Y+jZje6vRsOH84H6xpjCAa52pP0muVDAUabFxLyQAOKt74gIztHVjHcmNN4wZymfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729694013; c=relaxed/relaxed;
	bh=ZJazpajfo6/P2JP9rkYWyI6DWMU8UF5e97dSH6jFvHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrgivILpgCVLJ8AsJpqtoe9Q7+NhlMvjoN1jLWPRrZj9rppnRK51FDkirq18pvKQhoTP0hBgepdCFObRPTLQzyd99oBRv+z9h6BWOjiTLhgqfxd0lVNvOAdkx0R9BNWN7/8ChAihxoiKUpzZuc+uoQZh+wc/eT7/wbX0DG9wfuRKv6VTAvZ1fIw6JdGUMc+EaWQZmKIjOtrZKGT8VYEpQYwTVkyUeQMlKYtchMOzM/YtYK0TYCqLXPHrg62A5omxOWAB5sXFvcQzGXzLb9bEUt2sGzStrqOG1kfVMfDe6Xjt+UXTwJJ2+1KWVuM/cBAH+fnUx5uL5u2I8ocyaNvsOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LRlle1mV; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LRlle1mV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYWkN6gDVz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 01:33:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A400BA44F7B;
	Wed, 23 Oct 2024 14:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0559C4CEC6;
	Wed, 23 Oct 2024 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729694010;
	bh=7g3Y5eVvBZRCGFtMoOhwes8/UM/FRtXZAYY+ax+pSHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LRlle1mVUBB2eVlk+IR8QQMG2ng0sfg9g0mYVe8KXcMREVrzuhqDBK16OLJQobwOG
	 Ix6bBbVy3IykboEJDscoHUAQhmpgZI/mP+/ooluqRRReWZh11KerGnfFv0A/uEYZgg
	 2pTcEAFSD/L+IzFvWJTNo/OfLszDYXtvdQMgZnuaZk6DizSDpQ+oyLSNlcYNCA9Axm
	 h0noORHHG8eqlLVLAYCP/jmCvUATv4nEdZJDPUtNaPKfOIS0FltkjPkamW8RMT5FRi
	 sZYUbuXTjfpwPJDMjHAyxJa04KtZ6ypuXjqAX/UCGlxju64IZISNIEpS9mAt9Z/7B6
	 uYo5MQ3boqK/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	2639161967 <2639161967@qq.com>,
	Sasha Levin <sashal@kernel.org>,
	chentao@kylinos.cn,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 4.19 5/5] powerpc/powernv: Free name on error in opal_event_init()
Date: Wed, 23 Oct 2024 10:33:20 -0400
Message-ID: <20241023143321.2982841-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143321.2982841-1-sashal@kernel.org>
References: <20241023143321.2982841-1-sashal@kernel.org>
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
X-stable-base: Linux 4.19.322
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
index e71f2111c8c0b..676ec9fdd115d 100644
--- a/arch/powerpc/platforms/powernv/opal-irqchip.c
+++ b/arch/powerpc/platforms/powernv/opal-irqchip.c
@@ -289,6 +289,7 @@ int __init opal_event_init(void)
 				 name, NULL);
 		if (rc) {
 			pr_warn("Error %d requesting OPAL irq %d\n", rc, (int)r->start);
+			kfree(name);
 			continue;
 		}
 	}
-- 
2.43.0


