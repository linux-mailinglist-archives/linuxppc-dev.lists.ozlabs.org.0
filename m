Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2C853A8E2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 16:15:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCrl271wGz3f39
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 00:15:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fsj70/SK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fsj70/SK;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCrQW3WhHz3dwy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 00:00:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CAC876149F;
	Wed,  1 Jun 2022 14:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA7AC385A5;
	Wed,  1 Jun 2022 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654092049;
	bh=lmlUxpqSq8SeGyucPtyJ86223H3HnhRr2pO7KXDiykQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fsj70/SKLoqcTm5YazNnMjomI1Dor7QIe1fsA6yFTryp/6I3z76Xwtj8vrmo3Wch+
	 wmTZlrGQu0FkXFfdxlRnIsEg6gA+kfKk6trm/foJB6gs9xJDzUyuRSvnkuK4cJSKFK
	 qpTTaj2ia3qBYA0vtY2ka3O4L6WF7WKAnb5weh4T74MEQ2XaNDx3WQmMQw9EKbdgwD
	 YBrY6Wib7QKS4TUZm7KvE8rXyGD5FLTs2KD1xuwM9W/UKF7mo23PpDWpQxaQWPodAe
	 VaHiqmC9M0dldgnhu6T8nFiSXrnwEgj5tg3q9q6c1dKg6tKU5X+qwJwqDjuJSWEd/Y
	 oQyWUpUJk8c1Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 11/14] powerpc/xics: fix refcount leak in icp_opal_init()
Date: Wed,  1 Jun 2022 10:00:24 -0400
Message-Id: <20220601140027.2005280-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601140027.2005280-1-sashal@kernel.org>
References: <20220601140027.2005280-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, nick.child@ibm.com, Lv Ruyi <lv.ruyi@zte.com.cn>, maz@kernel.org, linuxppc-dev@lists.ozlabs.org, Zeal Robot <zealci@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

[ Upstream commit 5dd9e27ea4a39f7edd4bf81e9e70208e7ac0b7c9 ]

The of_find_compatible_node() function returns a node pointer with
refcount incremented, use of_node_put() on it when done.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220402013419.2410298-1-lv.ruyi@zte.com.cn
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/sysdev/xics/icp-opal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/sysdev/xics/icp-opal.c b/arch/powerpc/sysdev/xics/icp-opal.c
index c71d2ea42627..3c9dd871491e 100644
--- a/arch/powerpc/sysdev/xics/icp-opal.c
+++ b/arch/powerpc/sysdev/xics/icp-opal.c
@@ -199,6 +199,7 @@ int icp_opal_init(void)
 
 	printk("XICS: Using OPAL ICP fallbacks\n");
 
+	of_node_put(np);
 	return 0;
 }
 
-- 
2.35.1

