Return-Path: <linuxppc-dev+bounces-2508-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E84719ACC77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 16:32:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYWjD5wCSz2xCW;
	Thu, 24 Oct 2024 01:32:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729693952;
	cv=none; b=N6TVLbFG4kpMuFZvO4/hhVETYZ3xAfRqNzMO9jtOSSqPma02uAE2yAbrrxf7nDEibGpnkPKspZThmK9dzjQPRN8eW+G7shNNZ00MH5pPpgcmv3qHEkVLnkptD7VUBq8N+BCP0NotxYmYZuFYGbEPTZCMJGJBja7rWXiOxD8VnNcupxGw34e9tCx95xw+0QZlHdsaqac0KQs1voIDmb6INzxOTV0+40n34Ws0rbpGOkVqqlwnnLg+trx848Yv56n5yEWsRMVQMgEpMVcxaYbE2iQL2SKAy/Raz0E2CwgQIYMxbDHvAB7ZQMQEoxDtW2UE66t/FJT68+MMqvHYntgjgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729693952; c=relaxed/relaxed;
	bh=/vNDGmVSykuoXpKdU5vptxDPeVgLBU6nXN581vIfIUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfDAdOndpWo9bVBIJ/ZNfJG5GqttxHGbqe4SKbzdAIuroPf22Xha2JcsCcdbr4TBXHdhJlwiL/DvNuXussMV+AwLBLFEgzzMACbrAdigMWUp8oE2KLlfarG4If7EDf27pQ3NOTRRYpQnEYl0d/LOsZgjnzQaM5h25P+WeCotOrr/zzG5zQvvKH2pRWIH5O/8H7+oGXAcX3gjY6gPlH0hMl6TofY/bDjwuzUEfAisszbO+FrhnMnUT7j8QDEjGijJyKzQrQ53Ntbmu0S1o1yQ/UP0VAwZ0wmp0dc9j0miogXuxwX7C8xNNrKzQgLGEzYKGxmdGOoX74pWKLBVNHuniw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lVLTI632; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lVLTI632;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYWjC6mqJz2xBm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 01:32:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 737FEA44F64;
	Wed, 23 Oct 2024 14:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A77BC4CEE6;
	Wed, 23 Oct 2024 14:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693949;
	bh=01iJzfdSH5shmcZHj4nicWztDj8kW1x4F7WtvsSjWJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lVLTI632if/8DIQ11g3T60tmQwhJuFLgXi+39uT4ZDLdTMV2lHx1p84xPd996Bv+F
	 nMRLgUA0co5IPsEHagv2OU+CadSGJ9cAFFnmPuyAg4sA78ER6EOxeT7r4yrwFzq6E/
	 ZsiWEMRhpGOsDwzAQ6Eu3InO8VPTqocnTukUc4PvVGq9WFe4F9voTs+Bzre/kPtYEq
	 HslqSVxHQtyTwPsDv8j8eUaP2TQ1zZDaxdCuR2eyHNSueHP5A3TzPFg2InnbS10ymd
	 vhl+ER+z5uSLSRXbCoBZdD3IQRyc6Y/kgHipT38Ze4wGys3YaiBoPH6l4C4ZDLTksU
	 0g1kQkt42FS5w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	2639161967 <2639161967@qq.com>,
	Sasha Levin <sashal@kernel.org>,
	chentao@kylinos.cn,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.1 16/17] powerpc/powernv: Free name on error in opal_event_init()
Date: Wed, 23 Oct 2024 10:31:55 -0400
Message-ID: <20241023143202.2981992-16-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143202.2981992-1-sashal@kernel.org>
References: <20241023143202.2981992-1-sashal@kernel.org>
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
X-stable-base: Linux 6.1.114
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
index 391f505352007..e9849d70aee4a 100644
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


