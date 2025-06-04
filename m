Return-Path: <linuxppc-dev+bounces-9144-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 405D2ACDD03
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jun 2025 13:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bC5W36tR2z307V;
	Wed,  4 Jun 2025 21:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749037839;
	cv=none; b=l1n2R7GDXVERlHDxiEYBULVGBRt22zEvyjB1MIoUP6aoK4OkWcsT4aLvrkDZDGHU6oWMfGSbVMcxherG5VFhCojEFAFbxKHrIePyAsyvWi5W47YlWLCS62p9kUz8iBFbdMYolD9DF22bD3L901o7KZp2VB0kNeGx3AhIb3t8KZRPTGKDiR9z68b3IDsMfzgJKfUi2MqVG25Z8IA80iiFTugKLtJ4A1oJ8TrNkcPSh3Mp5L2uV1fPnKaBnRIg3yj2v7YHa3CNDABBTsni0hFrvI8UY79iClGrbYv9BgsS0smyMje8k63blJNoizwLmWiT+ThZI/b1Gms38nr7jYsjcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749037839; c=relaxed/relaxed;
	bh=gCzYBoisR3S/hp7hTIpx7NpB5NU+BRTjp3Q8qF2r0mM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fOj0VSYEL/EriTTjs+73HwT6r1Xf5p3IEW1z/fRbWzWqp+UwqH5JJ3dZTjOn+n/ogDcvEHqG9rfXJuBkchR+tKCrshq8Ok0jjGnctjEYNWzB78oeKdJpACVOwYPpVCmnHYW44WdU7vEIISttJEfVc3j7o01WG8KColU0PGGbvWcXK5xc8OuwfEr8C8m6BOTIJFUK57sAM+VDrlqx/aDm6mLS3ERdlHW3cF35iFoFEH3pj/FOKwTmkD7A7M2e1jErXcqYjceC5WrMhckcpl/xZ0ziCZYDxeqHa0ZTPokJz607/rzIEVkb5pcicBfvDSSxkUq+S+2Q/3ffoMEZ1g0ihg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MXPg5C1F; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MXPg5C1F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bC5W31VfVz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 21:50:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 552785C5421;
	Wed,  4 Jun 2025 11:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B5FC4CEEF;
	Wed,  4 Jun 2025 11:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749037836;
	bh=LWoCnVWu9kyApgL0kLFdiS1HexGeNKcPhWj+9WD/Kfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MXPg5C1FfD5CFrcwX/YJxb1s0QvtnT7YAeJu+tKjUg6pdyQjVeTOJr6Nt5pRuJBbc
	 HKEs2b8/yYTpKvAOLEy+nShdmpyioifn0NraI8aAtdwlQNmue00rEKahligmL/WeRx
	 XWXiwQAGgh/5GzVW/WycsstiC2/GcM5ztWt07a5EzroJJJUlJFndvFYTnSRXoPTVPO
	 Ssiv6PpM38LpKKoQo8hlYiDUA1z6r5IvQf48UVKlTiHNgI3fPSHeJvhFomiuhiL6DN
	 c8sZmB3r0XoB7ndSX1vzgd9B4c6OlaVD15TFeEKbW1pdRQurwJDPMfydBIewIh4/+h
	 2XNdtxjrA3xfA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sasha Levin <sashal@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 2/5] bus: fsl-mc: increase MC_CMD_COMPLETION_TIMEOUT_MS value
Date: Wed,  4 Jun 2025 07:50:30 -0400
Message-Id: <20250604115033.209492-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604115033.209492-1-sashal@kernel.org>
References: <20250604115033.209492-1-sashal@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.184
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

[ Upstream commit 23d060136841c58c2f9ee8c08ad945d1879ead4b ]

In case the MC firmware runs in debug mode with extensive prints pushed
to the console, the current timeout of 500ms is not enough.
Increase the timeout value so that we don't have any chance of wrongly
assuming that the firmware is not responding when it's just taking more
time.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Link: https://lore.kernel.org/r/20250408105814.2837951-7-ioana.ciornei@nxp.com
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis of the commit and the surrounding code context,
here is my assessment: **YES** This commit should be backported to
stable kernel trees. **Detailed Analysis:** **1. Bug Fix Nature:** This
commit addresses a real timeout issue where legitimate MC firmware
operations can fail due to an inadequate timeout value. The commit
message explicitly states that "In case the MC firmware runs in debug
mode with extensive prints pushed to the console, the current timeout of
500ms is not enough." **2. Code Change Analysis:** The change is minimal
and surgical: - Changes a single timeout constant from 500ms to 15000ms
(15 seconds) - Only affects `drivers/bus/fsl-mc/mc-sys.c:22` - No
architectural changes or new functionality added - The timeout is used
in both `mc_polling_wait_preemptible()` and `mc_polling_wait_atomic()`
functions that handle MC command completion **3. Risk Assessment:** The
change has minimal risk: - Increasing a timeout value is generally safe
and doesn't change behavior for successful operations - Only affects
systems with Freescale/NXP DPAA2 Management Complex hardware - The
original 500ms timeout was clearly insufficient for legitimate use cases
- Similar to successful backports in the reference commits (e.g.,
Similar Commit #1 and #3 which both increased timeouts) **4. Impact and
Importance:** - Fixes a real user-facing issue where MC commands fail
with timeouts during firmware debug scenarios - The FSL-MC bus is
critical infrastructure for DPAA2 networking architecture on NXP ARM
SoCs - Timeout failures can cause device initialization problems and
system instability - The `mc_send_command()` function is used
extensively throughout the FSL-MC subsystem for all hardware
communication **5. Comparison with Similar Commits:** - Very similar to
Similar Commit #1 (UCSI timeout increase from 1s to 5s) - **Status:
YES** - Very similar to Similar Commit #3 (MLX5 timeout decrease from 2
hours to 60s) - **Status: YES** - Both of these were timeout adjustments
that got backported successfully **6. Subsystem Scope:** The change is
contained within the FSL-MC bus driver subsystem and only affects NXP
DPAA2 hardware platforms, making it a safe candidate for stable trees.
**7. Explicit Stable Tree Criteria:** This meets the stable tree
criteria: - Fixes an important bug affecting real users - Small and
contained change with minimal regression risk - No new features or
architectural changes - Addresses a timeout issue that can cause system
functionality problems The commit represents a classic example of a
safe, important bug fix that should be backported to help users
experiencing MC command timeouts in production environments, especially
during firmware debugging scenarios.

 drivers/bus/fsl-mc/mc-sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/fsl-mc/mc-sys.c b/drivers/bus/fsl-mc/mc-sys.c
index f2052cd0a0517..b22c59d57c8f0 100644
--- a/drivers/bus/fsl-mc/mc-sys.c
+++ b/drivers/bus/fsl-mc/mc-sys.c
@@ -19,7 +19,7 @@
 /*
  * Timeout in milliseconds to wait for the completion of an MC command
  */
-#define MC_CMD_COMPLETION_TIMEOUT_MS	500
+#define MC_CMD_COMPLETION_TIMEOUT_MS	15000
 
 /*
  * usleep_range() min and max values used to throttle down polling
-- 
2.39.5


