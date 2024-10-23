Return-Path: <linuxppc-dev+bounces-2507-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 094139ACC6D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 16:31:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYWhW1cTrz2yl1;
	Thu, 24 Oct 2024 01:31:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729693915;
	cv=none; b=fkmg0cWX4MX2Ua7zuDNaZpeTlXW6AvS4D98WQlntpWUz9K8ZoKJPjGP6XOHQgVOkd1zRM7KOAL9T5E15r73KWX7he/ONZL7N5KEXzH1DQpD0oaGjEw2QCeY+YssyKFCXKmkAhdBtpSUooGl0X10IPij9aEvsDkVCSbAntTcjhO7U6AVHVqq5OwDlHaZ6wlPTXWAu+HlOpjCQ0O+podOsztqE/QosCUAwZtyTJcYv8PLdgcuCp1TGLAEHUoks7kYMj6vd+2RQxSNq7FtijXZJvogJWc/B/1wAgOiEnTi09UjcIbMowb0HAcQNKNLVuL5lUMKeUd/dr0kIBv09kxYQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729693915; c=relaxed/relaxed;
	bh=Dwm0fvl3hbOXd579c9fYAqv42AXIBE6o/wB+VrfHBSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L6gzRYkoYtYOP3riEiLeWSNSLOeTCW872BTzvb8ZE1JtUPAG8G1Dd64I87SVYo5HfnjZr5f+KLaekXpeIv2aUnFdLE3r5/TWTl7VV5NhTxFzjC3XcyAwXSasX3Hu17c6rn8vVZ+w7RVBBMUWTAFzL3v6L+gmc+ChLdzxoLRj1vSRANpOtARaW0YuoON7RAEsLXnnI8cFcOi2RSxHZHr03GtU9BPNOHR3TZa3nI87gYxFw2l3Q6On49CuuGn2rqUNxR3wpk0rLr1pG/5secuW3LrEZo9hD0z3s3cxlhx+taeQdTAuq7CrCN/A+8H0b1ITcMAG0gfdqC+DEbauv1IGvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i+xX+4jn; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i+xX+4jn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYWhV2GVYz2yj3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 01:31:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CACF5C5F47;
	Wed, 23 Oct 2024 14:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1E0C4CECD;
	Wed, 23 Oct 2024 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693910;
	bh=ZDtV8Qyy4tkPd4t6rHAqBBHuwolPefaey8Kua1fEOgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i+xX+4jnRTZRlxSwBDM9Kl+yO35uknbGEiWDAvYfUSGr2AUTlD1HhEkEbYkHLevw8
	 LtLueEznPkiZBwpiLGzi9t+DBzldnobP6ZuUy9TLJR65eMiOhd5gMKN0BWyy0pVDuc
	 tacX05HZMjgciNklFYw1YlMfIB31157bg+BIdT7GfYVcWT/SCteGBjK7dIMlONmTz8
	 CnA4AXXPlcigMURZBx/4edUAgLroYjTNLHdawZ874/pEg+G/83wqd1TIpouOY+9xPw
	 TmaaALeX6evZyRInQ/sB3ctwf+3skBIkRP/bDhlDC0UHAp5QpkfxbYQ5uKUY/Mb48l
	 yuKvPjoF1FERA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	2639161967 <2639161967@qq.com>,
	Sasha Levin <sashal@kernel.org>,
	chentao@kylinos.cn,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.6 20/23] powerpc/powernv: Free name on error in opal_event_init()
Date: Wed, 23 Oct 2024 10:31:04 -0400
Message-ID: <20241023143116.2981369-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143116.2981369-1-sashal@kernel.org>
References: <20241023143116.2981369-1-sashal@kernel.org>
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
X-stable-base: Linux 6.6.58
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
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


