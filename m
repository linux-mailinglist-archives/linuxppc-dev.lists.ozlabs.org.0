Return-Path: <linuxppc-dev+bounces-15096-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF18CE9C6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Dec 2025 14:23:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dgYh0336Pz2yF1;
	Wed, 31 Dec 2025 00:23:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767101024;
	cv=none; b=ApGySQrV6a8Q7kSIEKukryaqXJ6XTSm398DXWDoR3rTti30cfw6t4pfLjzOsxTTE7HiC+ZWjwji+3CFyis0jFZkdQmyptYXx67J0CrFdcX4jZiDFztxhwE4EATxFrekGfQJlfUqQdLJ/yP/1egETXd0UFRTTp6An2iYjSW5DHRt42kaUUuRuCIZFADPqZPGbaSTuqwB/hfMNhJtsBUwxcKci9Nqkus2SWquIzH91jYQvqIgbRnRR7BFlW4AF4pXZNOsIp1PMr0Tp7HaMXuzZguAm+7R5Bae8C+NoIdMsuOX67Gae7/VFIS6nHoxm9bUNFw+33yy28adZ82l7qGQ+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767101024; c=relaxed/relaxed;
	bh=Pc0ox4ESGIq30I6mjo++iRGPDZAx38k/CT3rd9q3OyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZOa0WwZz5IbfkP0c2Bd8fjr0HOmNwuKDqP4Dd4nALgdqFyLfdq5R6CmquG39+18Y92oaOfqdC3PEjrvbQdyIdN7dGaN8yCf8WhJ55LssPR2/NJHqRvWVMyqTHfdVjkTG0WT3hhG22swKI1Ht2ccu0i/RnAJKczlmdnlN/+teZDEeV/nMhrj4cMwzdO5ZGQS+HwEjotzVIuW0W/Yc93jxmK6nVRtutVcRtbDlWsAycOvOnZxloHoBTFONe+DUz3mtzUdcJnW/ds7eppDcxDsbMZLFN7ixPUggfVz8p+OFTVgLIVtA8zkEu+m1KVAjj3VyGsHckaYJBVjcisIeMBNUwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hw9up642; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hw9up642;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dgYgz1LV7z2xdV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Dec 2025 00:23:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3ED0442A0;
	Tue, 30 Dec 2025 13:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B33C116C6;
	Tue, 30 Dec 2025 13:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767100990;
	bh=ZLaVsim+IvTm4fJtQ1k/xMj2D9RQt+TcGP+c5MdnmPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hw9up6427EaSETsqoDKvjLxZzQGGgVXBkCJDNu6ckhInp+TeUlV6DPJXJwjTAgjIU
	 omdTO5snToqah7QR8gd2wFaMyrX3ybb5wrc9CrgCjLwDw9PdVEq3WECTg7KhHPaSDG
	 p11WvJxbeJycqVrUAV/2S6vZsECvosf9Pw4nc13N+ZDuytSaR2sSV9poVJsnqdjYLM
	 KUdMIcFmAt6Bb4BfQgOXpztbo03V62e3031GqmAOLp75zXkBqFRlTmyo09jAl3A+N0
	 qraKm4Ui5Phh7rpn2maGgWsIhKZ/EwTBZ+39VWKDJ9zzJ/Xa6sGhJbBQvZRt3ZyC4O
	 Lz6/yCXxCwnCg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.18-5.10] ASoC: fsl_sai: Add missing registers to cache default
Date: Tue, 30 Dec 2025 08:22:57 -0500
Message-ID: <20251230132303.2194838-4-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251230132303.2194838-1-sashal@kernel.org>
References: <20251230132303.2194838-1-sashal@kernel.org>
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
X-stable-base: Linux 6.18.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Alexander Stein <alexander.stein@ew.tq-group.com>

[ Upstream commit 90ed688792a6b7012b3e8a2f858bc3fe7454d0eb ]

Drivers does cache sync during runtime resume, setting all writable
registers. Not all writable registers are set in cache default, resulting
in the erorr message:
  fsl-sai 30c30000.sai: using zero-initialized flat cache, this may cause
  unexpected behavior

Fix this by adding missing writable register defaults.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Link: https://patch.msgid.link/20251216102246.676181-1-alexander.stein@ew.tq-group.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis Summary

### 1. What Problem Does This Commit Solve?

This commit fixes a bug where the FSL SAI driver's regmap cache was
incomplete. During runtime resume, the driver performs a cache sync that
writes all writable registers. Two writable registers (`FSL_SAI_TTCTL`
and `FSL_SAI_RTCTL`) were missing from the cache defaults array,
causing:

1. A warning message: `fsl-sai 30c30000.sai: using zero-initialized flat
   cache, this may cause unexpected behavior`
2. Potentially incorrect behavior during suspend/resume cycles

### 2. Root Cause Analysis

The bug was introduced in commit `0b2cbce68986` ("ASoC: fsl_sai: Add new
added registers and new bit definition") from September 2020, which:
- Added `FSL_SAI_TTCTL` and `FSL_SAI_RTCTL` to `fsl_sai_writeable_reg()`
  (lines 1234-1235)
- But **failed** to add them to `fsl_sai_reg_defaults_ofs0[]` and
  `fsl_sai_reg_defaults_ofs8[]`

The current commit completes what should have been done in the original
commit.

### 3. Code Change Assessment

The fix is minimal and surgical:
- Adds `{FSL_SAI_TTCTL, 0}` to `fsl_sai_reg_defaults_ofs0[]` (+1 line)
- Adds `{FSL_SAI_TTCTL, 0}` to `fsl_sai_reg_defaults_ofs8[]` (+1 line)
- Adds `{FSL_SAI_RTCTL, 0}` to `fsl_sai_reg_defaults_ofs8[]` (+1 line)

Total: 3 lines added, all initializing registers to default value 0.

### 4. Stable Criteria Check

| Criteria | Assessment |
|----------|------------|
| Obviously correct | ✅ Yes - completing missing register defaults |
| Fixes real bug | ✅ Yes - fixes warning and potential misbehavior |
| Small scope | ✅ Yes - only 3 lines added to static arrays |
| No new features | ✅ Yes - purely fixes incomplete initialization |
| Tested | ✅ Accepted by subsystem maintainer (Mark Brown) |

### 5. Risk Assessment

**Risk: Very Low**
- No logic changes, only adds entries to static const arrays
- Default values are 0 (standard hardware reset value)
- The registers already existed and were marked writable
- Change is purely additive to existing data structures

### 6. Affected Stable Trees

The bug exists in kernels v5.10+ (when commit 0b2cbce68986 was merged).
Relevant stable trees:
- 5.10.y (LTS)
- 5.15.y (LTS)
- 6.1.y (LTS)
- 6.6.y (LTS)
- 6.11.y and newer

### 7. User Impact

Affects users of NXP/Freescale i.MX processors using SAI audio
interfaces, particularly those using suspend/resume (common on embedded
systems, tablets, etc.).

### Conclusion

This is an excellent stable backport candidate. It's a minimal, low-risk
fix that corrects a longstanding bug in driver initialization. The fix
simply completes the register cache defaults that should have been
included when the registers were made writable in 2020. The warning
message indicates potential undefined behavior, and the fix is as simple
and safe as adding entries to a static array.

**YES**

 sound/soc/fsl/fsl_sai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 72bfc91e21b9..090354a0f711 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1075,6 +1075,7 @@ static const struct reg_default fsl_sai_reg_defaults_ofs0[] = {
 	{FSL_SAI_TDR6, 0},
 	{FSL_SAI_TDR7, 0},
 	{FSL_SAI_TMR, 0},
+	{FSL_SAI_TTCTL, 0},
 	{FSL_SAI_RCR1(0), 0},
 	{FSL_SAI_RCR2(0), 0},
 	{FSL_SAI_RCR3(0), 0},
@@ -1098,12 +1099,14 @@ static const struct reg_default fsl_sai_reg_defaults_ofs8[] = {
 	{FSL_SAI_TDR6, 0},
 	{FSL_SAI_TDR7, 0},
 	{FSL_SAI_TMR, 0},
+	{FSL_SAI_TTCTL, 0},
 	{FSL_SAI_RCR1(8), 0},
 	{FSL_SAI_RCR2(8), 0},
 	{FSL_SAI_RCR3(8), 0},
 	{FSL_SAI_RCR4(8), 0},
 	{FSL_SAI_RCR5(8), 0},
 	{FSL_SAI_RMR, 0},
+	{FSL_SAI_RTCTL, 0},
 	{FSL_SAI_MCTL, 0},
 	{FSL_SAI_MDIV, 0},
 };
-- 
2.51.0


