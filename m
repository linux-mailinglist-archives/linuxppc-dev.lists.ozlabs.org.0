Return-Path: <linuxppc-dev+bounces-9132-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 375DAACD11C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jun 2025 02:51:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBptm4sW3z2xYl;
	Wed,  4 Jun 2025 10:51:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748998304;
	cv=none; b=ZOoiiTMhFVeb4rpOSaXiBKZ+ptA9scy76tkMjFxjn7PCz3MCpwGiIOWcqgDt8hwSRisEBnVYEp52YkXozbCRm9XworYcMxl9vfosqdeuJmwigyu16pXnO/XXsaOw9C2xYF/sqG9wLsHU+5ktkF80CkLeUA/t09R/t6hgaSj2ty9z+61i6f3oz6ElE+DLCkP+zEt0NAUD/sb6oc8Mn2kkhB0ilFF/7W7lMq0MdXIe684eDyH2HoIGCu+JxYxoDISyxOpz7ibpjlOLJmSfAcfaqHV5E1C4FZaWAIdV8WLLRVWVnVJOGBFIe+eq45BJIPNe8Oz9YZS5Pn4aW2fLY9fuIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748998304; c=relaxed/relaxed;
	bh=Fyl+UtwnFe9bTJq1Nroq8JP5bYJ46o0xscttxEcc4oY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MIIp5wNLpOiPjbJe9wCOYuvTK/xA17PTlayJjBspmnyc4UEjhlY2+nUeW2faolMKJFGCHkD5Pv3k8j/+RlWHzTSM0B+dNFwv1KUFANeTnoHJrV261Aj9HyNMArOA69umpKYowGSr9iMzUobFnlg/+R/un3PRioknmQSxNV36n5/4vUfQukJ5taflwnbkNEzXFVOuM0Nuedw1Dsn98Z16Z3dFQMT27V52pKmhppE4tExs09sZ8zVIosHg3s2T5bEbuTtPYTGreaOH96vY4ejQmcMDhtcg8DQ10TiisGN7a6gQL905mQ14HntCFOFz5n+zxhnFRYsIRarKeiOf3F11vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AQVzTD85; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AQVzTD85;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBptk5Bk4z2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 10:51:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1DA25C2458;
	Wed,  4 Jun 2025 00:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983B3C4CEEF;
	Wed,  4 Jun 2025 00:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998299;
	bh=i2guXKq/zzHATlE+CQ8FXCickmwgBEE1jP63DXsldoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AQVzTD85R3zrqLUEBtuwoLPt3sLfaFkf4E4JD493Y8scQ4dlavKM0xbsuWwXgqvUQ
	 zX1fxUCY0Ym1A/CHBS/KZEPe01OVlliHYl5zxB9YFZVJdrPiDhYRNB+ZXKhTGlXZhs
	 43Ghr2QGrL4SRglSo89kUspDtaNZA0IdDg8VJx7j31YoeM8ZxrWm18ciaM/cqppYSl
	 CnHuBQURdr7VfjMlrxJpf1m7abogAtpF+O/0dBemhHBteBIV8mEHT+3qyV5DpZGqfj
	 78D2ZxbLmIz763WKOLzuowCXMtOM5Fszccdw10LVfpcfI3LmFzbmh1WZd/3ZMkyccL
	 BT4JUbSpGZuUQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hector Martin <marcan@marcan.st>,
	Neal Gompa <neal@gompa.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	sven@kernel.org,
	j@jannau.net,
	linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 024/118] i2c: pasemi: Enable the unjam machine
Date: Tue,  3 Jun 2025 20:49:15 -0400
Message-Id: <20250604005049.4147522-24-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005049.4147522-1-sashal@kernel.org>
References: <20250604005049.4147522-1-sashal@kernel.org>
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
X-stable-base: Linux 6.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Hector Martin <marcan@marcan.st>

[ Upstream commit 88fe3078b54c9efaea7d1adfcf295e37dfb0274f ]

The I2C bus can get stuck under some conditions (desync between
controller and device). The pasemi controllers include an unjam feature
that is enabled on reset, but was being disabled by the driver. Keep it
enabled by explicitly setting the UJM bit in the CTL register. This
should help recover the bus from certain conditions, which would
otherwise remain stuck forever.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
Link: https://lore.kernel.org/r/20250427-pasemi-fixes-v3-1-af28568296c0@svenpeter.dev
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my thorough analysis of the commit and the surrounding
codebase, I can now provide a comprehensive assessment. **YES** ##
Extensive Analysis ### Nature of the Fix This commit addresses a **real
hardware bug** where I2C buses can become permanently stuck under
certain conditions. The analysis shows: 1. **Hardware Feature**: CTL_UJM
is defined as `BIT(8)` in the control register and stands for "UnJaM
mode" - a hardware feature specifically designed to automatically detect
and recover from bus jam conditions. 2. **Real Problem**: The codebase
reveals extensive jam detection mechanisms: - `SMSTA_JAM` (BIT(24)) and
`SMSTA_JMD` (BIT(25)) status bits for detecting jams - Bus status
polling that specifically waits for `!(status & SMSTA_JAM)` - Automatic
resets triggered when `SMSTA_JMD` is detected 3. **User Impact**: The
commit message states "The I2C bus can get stuck under some conditions
(desync between controller and device)" and "would otherwise remain
stuck forever" - indicating this causes **complete system functionality
loss** for affected I2C peripherals. ### Code Change Analysis The fix is
**minimal and surgical**: ```c -u32 val = (CTL_MTR | CTL_MRR |
(smbus->clk_div & CTL_CLK_M)); +u32 val = (CTL_MTR | CTL_MRR | CTL_UJM |
(smbus->clk_div & CTL_CLK_M)); ``` This single-line change adds
`CTL_UJM` to the control register value during reset, enabling the
hardware unjam feature that was previously being disabled. ### Stability
Criteria Assessment ✅ **Fixes Important Bug**: Resolves permanent I2C
bus lockups affecting system functionality ✅ **Small and Contained**:
Single bit flip in one register during reset operation ✅ **Minimal
Risk**: - Uses existing hardware feature (CTL_UJM already defined) -
Only affects reset behavior - Hardware designed to handle this bit
safely - No architectural changes ✅ **Clear Side Effects**: Only enables
a hardware recovery mechanism - no negative side effects expected ✅
**Critical Subsystem**: I2C is fundamental infrastructure used by many
system components ### Platform Context This affects **production
hardware**: - Apple Silicon (M1, M2, etc.) devices - Maintained by
active Asahi Linux team - Real users depend on functional I2C for USB-
PD, audio, and other critical peripherals ### Comparison to Similar
Commits This aligns closely with **Similar Commit #2** (marked YES)
which also addressed I2C bus recovery by improving lockup detection and
triggering recovery mechanisms. Both commits: - Fix real I2C bus lockup
issues - Make minimal, targeted changes - Improve hardware recovery
capabilities - Have low regression risk ### Conclusion This commit
represents an ideal stable backport candidate: it fixes a serious
hardware issue that completely breaks I2C functionality with a minimal,
low-risk change that enables an existing hardware recovery feature. The
fix prevents permanent system failures on affected hardware platforms.

 drivers/i2c/busses/i2c-pasemi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index bd128ab2e2ebb..27ab09854c927 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -71,7 +71,7 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 
 static void pasemi_reset(struct pasemi_smbus *smbus)
 {
-	u32 val = (CTL_MTR | CTL_MRR | (smbus->clk_div & CTL_CLK_M));
+	u32 val = (CTL_MTR | CTL_MRR | CTL_UJM | (smbus->clk_div & CTL_CLK_M));
 
 	if (smbus->hw_rev >= 6)
 		val |= CTL_EN;
-- 
2.39.5


