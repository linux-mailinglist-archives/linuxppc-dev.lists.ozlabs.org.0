Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3615653A8C6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 16:12:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCrgj0c0xz3gVC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 00:12:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Iua1UMlr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Iua1UMlr;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCrP723hzz3dsl
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 23:59:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DD97615AA;
	Wed,  1 Jun 2022 13:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CD0C36AE2;
	Wed,  1 Jun 2022 13:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654091976;
	bh=y5FpsC0QGeen2RQowSl2Y0D8H3xk4G0Akqg3acr5AMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Iua1UMlrkqHxMA2KrxxmTLwQanlIenlMP5U5fddVc4ZKxQ0MuXhKlHw1e+yjVpebw
	 6bWhoquhNoG9nX1w0m/8BpSfwXdBdGjxB3oj3s5C4LKRuQDXl/Cq5f0MErT5sY60PY
	 Vj854Sigb8iHOhars2C4lqo36ngDtuHWuuWUvH3seXGtSk2c7oUOvoD2JZGwgU1fCb
	 QvDMKn4eebuh6jUfBw8fuOgF5T8dDEnt7zxrgG5vOSajh9Op2GLVT+HCosa0fC0ID7
	 huEGxH+VrhIbeDL0fjX3iytb6gHs1qw77xqbE4Cu/cI2ywALC14xpJ2OpDD5E1OmPZ
	 WBwCJaapLUDTg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 16/20] powerpc/powernv: fix missing of_node_put in uv_init()
Date: Wed,  1 Jun 2022 09:58:58 -0400
Message-Id: <20220601135902.2004823-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601135902.2004823-1-sashal@kernel.org>
References: <20220601135902.2004823-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Lv Ruyi <lv.ruyi@zte.com.cn>, linuxppc-dev@lists.ozlabs.org, Zeal Robot <zealci@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

[ Upstream commit 3ffa9fd471f57f365bc54fc87824c530422f64a5 ]

of_find_compatible_node() returns node pointer with refcount incremented,
use of_node_put() on it when done.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220407090043.2491854-1-lv.ruyi@zte.com.cn
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/powernv/ultravisor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powernv/ultravisor.c b/arch/powerpc/platforms/powernv/ultravisor.c
index e4a00ad06f9d..67c8c4b2d8b1 100644
--- a/arch/powerpc/platforms/powernv/ultravisor.c
+++ b/arch/powerpc/platforms/powernv/ultravisor.c
@@ -55,6 +55,7 @@ static int __init uv_init(void)
 		return -ENODEV;
 
 	uv_memcons = memcons_init(node, "memcons");
+	of_node_put(node);
 	if (!uv_memcons)
 		return -ENOENT;
 
-- 
2.35.1

