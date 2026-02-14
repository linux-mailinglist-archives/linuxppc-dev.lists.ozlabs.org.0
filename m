Return-Path: <linuxppc-dev+bounces-16864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DYHOMOXJj2ndTgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Feb 2026 02:03:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B39513A461
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Feb 2026 02:03:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fCW4b5m1Fz2yFk;
	Sat, 14 Feb 2026 12:03:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771031007;
	cv=none; b=eZQ5xsQjiAyWUlskAL5QkL5RdH10PYYTYvkKt3q9GJ3TDqmFtplhdhwCCfFaYgZw0bYK9FxOffllNVypyKCd7/sBwpsj3+elObj63VF5b7HHlmQ2+7IxxrWFvfoAWqUnI+9AUx2Da0bZIE8Y+ms4YUbXcndkA/DT1SjgO0j/Sj1aCfRJl/HsUg0AgEv9dKn20XkwKRv+pW10uMGZIyn61EbBq6btBWlS4YNcVKbeEmQWTlKIvYZqgttDhBwMYAr3KHdWEg+BmnxishFu1e7ukXOZXpLsv78FrZKb3dxNpyi5hq2b+V5aEZXQcnGX15vO6BSET61Q5yyHr8Fswgz3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771031007; c=relaxed/relaxed;
	bh=bHKgEj1YO685ABoxn09XgLWVXkNh27wly27rECy0EgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exY+T5a1ywgRScLiQJvVoXdgJ6pifQ6nGgeP0mMZGjK45x6CxEuOX//GdO/DKGfqOoWc1VKBXcre+5GilpkYmTlnbR8rwHIv9eY1a6G6zuOZWEsVNW3aTy5kVC4dqH7DaUn+03OzRAiKEx+Ey1c9+2gIFXstbN3hPQyNvaSVFePJ2DkDBhVivFS5QJYLdw3PO0Z7hbx1mNA5Lim2Ul+jSTZgIWg7jQiuTaEW8/ckfx+HWxqjb3iwThAR8s0ZafsfjzwUUpnEBZEyL6ghWgL0nK3KG7QMmM5dUcKBt/1HjkPXXHoYgTfgsbDPHdnwW2T8AWMIO8h31xpbkHTs2Rua8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D8JsEno8; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D8JsEno8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fCW4W3kkDz2xSF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Feb 2026 12:03:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF9D060054;
	Sat, 14 Feb 2026 01:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C904C16AAE;
	Sat, 14 Feb 2026 01:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031000;
	bh=Sj1dl4mJHIY1lAiXUEN7nZi6A3IVTki3mOPvGibGbMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D8JsEno8tXYXRV1R4vIR1bqBfusPsDSVOBGfZ7tVDMPJ/lvvNoHoBdvB2fjtbPfG8
	 eRGQ6VGiZaI3bLGvqgaa8ZBfj+vKPBhKDuYe6fn+97RMHjA3xPGQJNy34aYXORZ9aE
	 o0MxicSZxlDN0CFuLJV/To018jOY6zFmRu4hXTQ4kiYswRQs5KGl7l4IECeIyOTOhp
	 5ySleQmO0RygRK+CwOoeMllK1vjOhqwdml8YPH94y+cVWyb8IgUg2f4idOEIH5J8B0
	 ipEO/YPRPjkS3SppX+Zv58sQ74aCmlYj2tHCxYIhOXW4JeOTDfVSAdCw+M0PLuuglN
	 A/+vl0UhZ2M4Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ziyi Guo <n7l8m4@u.northwestern.edu>,
	Frank Li <Frank.Li@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-6.12] ASoC: fsl: imx-rpmsg: use snd_soc_find_dai_with_mutex() in probe
Date: Fri, 13 Feb 2026 19:58:19 -0500
Message-ID: <20260214010245.3671907-19-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
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
X-stable-base: Linux 6.19
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16864-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sashal@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:stable@vger.kernel.org,m:n7l8m4@u.northwestern.edu,m:Frank.Li@nxp.com,m:broonie@kernel.org,m:sashal@kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[u.northwestern.edu,nxp.com,kernel.org,gmail.com,vger.kernel.org,lists.ozlabs.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,nxp.com:email,i.mx:url,northwestern.edu:email]
X-Rspamd-Queue-Id: 8B39513A461
X-Rspamd-Action: no action

From: Ziyi Guo <n7l8m4@u.northwestern.edu>

[ Upstream commit 84faa91585fa22a161763f2fe8f84a602a196c87 ]

imx_rpmsg_probe() calls snd_soc_find_dai() without holding client_mutex.
However, snd_soc_find_dai() has lockdep_assert_held(&client_mutex)
indicating callers must hold this lock, as the function iterates over the
global component list.

All other callers of snd_soc_find_dai() either hold client_mutex via the
snd_soc_bind_card() path or use the snd_soc_find_dai_with_mutex() wrapper.

Use snd_soc_find_dai_with_mutex() instead to fix the missing lock
protection.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://patch.msgid.link/20260205052429.4046903-1-n7l8m4@u.northwestern.edu
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The wrapper was added in 2020, so it exists in all currently maintained
stable trees (5.10+, 5.15+, 6.1+, 6.6+, 6.12+). This confirms the fix
will apply cleanly to all relevant stable branches.

### User Impact

- Without this fix, users with i.MX RPMSG sound cards will hit **lockdep
  warnings** during probe when `CONFIG_PROVE_LOCKING` is enabled
- More seriously, without the lock, there is a real (though perhaps
  rare) **race condition** where concurrent component
  registration/deregistration during probe could corrupt the component
  list, leading to crashes or undefined behavior
- The i.MX RPMSG audio is used on NXP i.MX SoC platforms, which are
  widely deployed in embedded systems

### Stability Indicators

- **Reviewed-by: Frank Li** (NXP maintainer) - indicates domain
  expertise review
- **Applied by Mark Brown** (ASoC subsystem maintainer) - indicates
  acceptance by the subsystem maintainer
- Single-line change with zero risk of regression

### Summary

This is a textbook stable backport candidate:
1. **Fixes a real bug**: Missing lock protection for a global list
   traversal (race condition + lockdep warning)
2. **Obviously correct**: Uses the existing mutex wrapper that all other
   callers use
3. **Small and surgical**: Single line change
4. **No new features**: Just corrects locking
5. **Low risk**: The wrapper function has existed since 2020 and is
   well-tested
6. **No dependencies**: Self-contained fix

**YES**

 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 53f04d1f32806..76a8e68c1b620 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -145,7 +145,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	data->dai.ignore_pmdown_time = 1;
 
 	data->dai.cpus->dai_name = pdev->dev.platform_data;
-	cpu_dai = snd_soc_find_dai(data->dai.cpus);
+	cpu_dai = snd_soc_find_dai_with_mutex(data->dai.cpus);
 	if (!cpu_dai) {
 		ret = -EPROBE_DEFER;
 		goto fail;
-- 
2.51.0


