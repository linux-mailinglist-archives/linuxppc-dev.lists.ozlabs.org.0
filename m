Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB1E490FB0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 18:35:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JczZ419H7z3f0D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 04:35:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o62rGmFN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=o62rGmFN; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcywh69qGz3f3Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 04:06:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3654261241;
 Mon, 17 Jan 2022 17:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69805C36AE7;
 Mon, 17 Jan 2022 17:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642439170;
 bh=cfgNBCaLfspusGGx3TWNkR2/M1NK5ZI0i2GmyN/yYHA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o62rGmFN3AAhbFB2TO1vGUs753h6uIV5HZA4oROL4ihehfH2/BcFMN/7sl1YOhbz/
 KdL07LbWQ0hJqnFT5pnDzIX+S2iM6nADQJN2q+3BUWDm5mQ4qWBG2sYcE0PxxRyjnx
 c8BahYzSqHJMDcdAPURYPWiIh59+OAmV8ma944jDkquk06sedJlMSNlo2XinW/rmmg
 E6/PNqsSQ9APkt48/FBtcA/6O8la+bATmE+KR2hdNim4TAjRGM2bq2BAKYs63wrrjb
 Dmv0uXVLsFP9AogTdtO/H4Dd9/kH/nPTMi+kBW08GfVx+cfklQTHFzfQXgUINDYiQH
 Vs60btbFshEPA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 08/17] powerpc/smp: Move setup_profiling_timer()
 under CONFIG_PROFILING
Date: Mon, 17 Jan 2022 12:05:42 -0500
Message-Id: <20220117170551.1472640-8-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170551.1472640-1-sashal@kernel.org>
References: <20220117170551.1472640-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, ego@linux.vnet.ibm.com,
 srikar@linux.vnet.ibm.com, parth@linux.ibm.com, npiggin@gmail.com,
 clg@kaod.org, yukuai3@huawei.com, linuxppc-dev@lists.ozlabs.org,
 robh@kernel.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit a4ac0d249a5db80e79d573db9e4ad29354b643a8 ]

setup_profiling_timer() is only needed when CONFIG_PROFILING is enabled.

Fixes the following W=1 warning when CONFIG_PROFILING=n:
  linux/arch/powerpc/kernel/smp.c:1638:5: error: no previous prototype for ‘setup_profiling_timer’

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20211124093254.1054750-5-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 14adfeacfa46e..4853ac67cf21f 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1070,10 +1070,12 @@ void start_secondary(void *unused)
 	BUG();
 }
 
+#ifdef CONFIG_PROFILING
 int setup_profiling_timer(unsigned int multiplier)
 {
 	return 0;
 }
+#endif
 
 #ifdef CONFIG_SCHED_SMT
 /* cpumask of CPUs with asymetric SMT dependancy */
-- 
2.34.1

