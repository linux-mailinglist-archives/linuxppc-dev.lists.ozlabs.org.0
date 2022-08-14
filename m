Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E166F5924F4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 18:37:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5NNX59tKz3gR2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 02:37:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iLzDeV/B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iLzDeV/B;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5NCf6r0hz3dsn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 02:29:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F401EB80B7F;
	Sun, 14 Aug 2022 16:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DF5C433C1;
	Sun, 14 Aug 2022 16:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494553;
	bh=xlbA8C8EV0hQrb0lukzff7ULNfkooqbvc/Mflof/Ul4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iLzDeV/BAUAMUrKYN6cyKb3hHR/1/hqoYA37c4c0Yz6pLobRnM+juEB3A/new6uSB
	 RW5oBTc7n3QVgBovMFRAbixMt0mOgwc6ZVB/EVkgFcgo+ZkMM54kUWTIW7CJWGZ2YO
	 HMgtP2Cx82dHWCiDujAADXaNrOUduAGbTG/SfYqxyxzC/nEppbxoZLmT/DpmhHLedw
	 Y5jnacrR2Q4Mf+y33oPzWq5MOPS59Yk+sc3oQeYtOGJA6mDMpbYiqJFHeeVL9ue1cV
	 6pTmcax3jKOdhZsONcvw/9JZVm2ZKM6tsIhVHAuG2Zv/QfsrG/DG1p3WO0t4D76ExX
	 BZlZ3OLy1k8mA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 14/16] powerpc/64: Init jump labels before parse_early_param()
Date: Sun, 14 Aug 2022 12:28:29 -0400
Message-Id: <20220814162833.2398478-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162833.2398478-1-sashal@kernel.org>
References: <20220814162833.2398478-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, robh@kernel.org, nick.child@ibm.com, Zhouyi Zhou <zhouzhouyi@gmail.com>, masahiroy@kernel.org, clg@kaod.org, linuxppc-dev@lists.ozlabs.org, frank.rowand@sony.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zhouyi Zhou <zhouzhouyi@gmail.com>

[ Upstream commit ca829e05d3d4f728810cc5e4b468d9ebc7745eb3 ]

On 64-bit, calling jump_label_init() in setup_feature_keys() is too
late because static keys may be used in subroutines of
parse_early_param() which is again subroutine of early_init_devtree().

For example booting with "threadirqs":

  static_key_enable_cpuslocked(): static key '0xc000000002953260' used before call to jump_label_init()
  WARNING: CPU: 0 PID: 0 at kernel/jump_label.c:166 static_key_enable_cpuslocked+0xfc/0x120
  ...
  NIP static_key_enable_cpuslocked+0xfc/0x120
  LR  static_key_enable_cpuslocked+0xf8/0x120
  Call Trace:
    static_key_enable_cpuslocked+0xf8/0x120 (unreliable)
    static_key_enable+0x30/0x50
    setup_forced_irqthreads+0x28/0x40
    do_early_param+0xa0/0x108
    parse_args+0x290/0x4e0
    parse_early_options+0x48/0x5c
    parse_early_param+0x58/0x84
    early_init_devtree+0xd4/0x518
    early_setup+0xb4/0x214

So call jump_label_init() just before parse_early_param() in
early_init_devtree().

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
[mpe: Add call trace to change log and minor wording edits.]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220726015747.11754-1-zhouzhouyi@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/prom.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 537142b877b8..d1ba17501343 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -740,6 +740,13 @@ void __init early_init_devtree(void *params)
 	of_scan_flat_dt(early_init_dt_scan_root, NULL);
 	of_scan_flat_dt(early_init_dt_scan_memory_ppc, NULL);
 
+	/*
+	 * As generic code authors expect to be able to use static keys
+	 * in early_param() handlers, we initialize the static keys just
+	 * before parsing early params (it's fine to call jump_label_init()
+	 * more than once).
+	 */
+	jump_label_init();
 	parse_early_param();
 
 	/* make sure we've parsed cmdline for mem= before this */
-- 
2.35.1

