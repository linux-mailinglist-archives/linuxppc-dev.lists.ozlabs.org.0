Return-Path: <linuxppc-dev+bounces-16739-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6C95N8XUiWmFCAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16739-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 13:36:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E3F10EB65
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 13:36:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8kVG6Lb0z2yql;
	Mon, 09 Feb 2026 23:27:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770640054;
	cv=none; b=NFqkV8O2Zb7R8fGgeP62D2HgHbRjmcjs7C+HsX10S4LXPttl/BcrYTUKtHGEgxwTQktzvGBjlY8NQBt5YVWHyqj8KfWTdIuJk4A9dP/sxtt0FmrtbiCxKTcW4fkYqZwSfg0jbxDSAg6EgIbGQnOPXdGWKwOEu4v8vevEPtbb2ZENbQiWNcSJMkjIH7EyCKRrF4SLzptGOkDDqGtQZA5WtU7xsXHKMZstJo4UPiAqBpQJ+IpzbFK/LlJHYnDMnSiKU/j3aFZkA5n/4IHd4/JhxU35uRAUKvAUkTwBIa5ruHXvKeTWYMVwb1zQWYlU8HZSUvdFY79+7pwyp0Ct2+N+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770640054; c=relaxed/relaxed;
	bh=pdi5eT3XO4l5htPcOyoFHz+3MzzGuQbBv7n+cjVYtc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B7mvhVT1CWCoeO10+Z+Ugdu5ZSCyW+4cjTuxgknIMSmp2oGMKRvX3NmUxXG+ZGHDGX0sI0o4oRd6xMNcJgKq9jhfgEExgc3odBIZ19oItTbBhU+U/0UgCi9B//6O9ZagB0HlZdqUl+GGL+gwcnWC6anmNi64vt1yi2Zekz9+i7VLG9bRWsZvdUwLvNm1lTCdXXSL/MfFrrgGZxr8XXU/HEHH4LgNqimmVwBVuknh0AUCgd/LPiS/vmwHV/T1COowFYVrsuCAtqQLC8fBGPG+2aAFugIZchQRqb+5q+rH5LH2uV+ZC/7SbUOVMJSvb0PaVT574OOxDOQZapmDX4HdLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nTX/cfCS; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nTX/cfCS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8kVF222hz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 23:27:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47CBA600B0;
	Mon,  9 Feb 2026 12:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1673AC19423;
	Mon,  9 Feb 2026 12:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770640050;
	bh=slYrVE2AFlmO1JfMmCJ5t+dzh+XdJL5sjVfhclgpwC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nTX/cfCS1H5oAFr2okwWRULI2GNPEEOspASIsnKzIljl9VfVOZohlYnIkFu7J7jRg
	 4zN2VSMCvZZ0FXjicUcTnyx391eeuEQPDnVBIrUbAxrXq3VGmYNV5dM7Ra6LD2AJ1h
	 Pt3BARCyLeJrKTOfvH9RD6s0iKYnVKzox3wYRgcMbeSGpdBezCYngr/sCA3fnay9qa
	 tmJRJww9395cT2W6oRSxMaS691LeSi8kPLMltVgsM4vb3/FyEqph8AsVdlqCvlMLQ6
	 xBf56+PIoEt6Se/USy/iGZ7WiRBjemvSMKdFmegH+c1ad7Boiv5PPWzX9KenoSy1oA
	 mOwepUldBGHjw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ziyi Guo <n7l8m4@u.northwestern.edu>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.18-5.15] ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
Date: Mon,  9 Feb 2026 07:26:47 -0500
Message-ID: <20260209122714.1037915-8-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260209122714.1037915-1-sashal@kernel.org>
References: <20260209122714.1037915-1-sashal@kernel.org>
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
X-stable-base: Linux 6.18.9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16739-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sashal@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:stable@vger.kernel.org,m:n7l8m4@u.northwestern.edu,m:broonie@kernel.org,m:sashal@kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[u.northwestern.edu,kernel.org,gmail.com,vger.kernel.org,lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,i.mx:url]
X-Rspamd-Queue-Id: D7E3F10EB65
X-Rspamd-Action: no action

From: Ziyi Guo <n7l8m4@u.northwestern.edu>

[ Upstream commit f514248727606b9087bc38a284ff686e0093abf1 ]

fsl_xcvr_activate_ctl() has
lockdep_assert_held(&card->snd_card->controls_rwsem),
but fsl_xcvr_mode_put() calls it without acquiring this lock.

Other callers of fsl_xcvr_activate_ctl() in fsl_xcvr_startup() and
fsl_xcvr_shutdown() properly acquire the lock with down_read()/up_read().

Add the missing down_read()/up_read() calls around fsl_xcvr_activate_ctl()
in fsl_xcvr_mode_put() to fix the lockdep assertion and prevent potential
race conditions when multiple userspace threads access the control.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
Link: https://patch.msgid.link/20260202174112.2018402-1-n7l8m4@u.northwestern.edu
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Line 194 confirms the `lockdep_assert_held` — this will trigger a
lockdep warning when `fsl_xcvr_mode_put()` is called without the lock
held.

The function modifies `kctl->vd[0].access` (lines 205-207) and calls
`snd_ctl_notify` — without the lock, concurrent access could corrupt the
control's access flags, leading to undefined behavior.

### 3. Classification

- **Bug type**: Missing locking — race condition and lockdep assertion
  violation
- **Category**: Synchronization fix
- **This is NOT**: A feature, refactoring, or cleanup — it's purely
  adding missing synchronization

### 4. Scope and Risk Assessment

- **Lines changed**: +3 (down_read, up_read, blank line)
- **Files changed**: 1 (sound/soc/fsl/fsl_xcvr.c)
- **Risk**: Extremely low — the fix follows the exact same pattern as
  all other callers of the same function
- **Could it break anything?**: The lock is a read-lock (`down_read`),
  and `fsl_xcvr_mode_put()` is called from the ALSA control put path
  which should not hold this lock already (no deadlock risk). The other
  callers also use `down_read`, so there's no write-lock contention
  introduced.

### 5. User Impact

- **Who is affected**: Users of NXP i.MX SoCs with XCVR (audio
  transceiver) — this is used on i.MX 8MP and similar
- **Trigger**: Changing the audio mode via ALSA controls (e.g.,
  switching between SPDIF/ARC/eARC modes)
- **Symptom**: lockdep WARNING at minimum; potential data race on
  control access flags that could cause inconsistent state
- **Severity**: Medium — lockdep warnings are real bugs that indicate
  potential for corruption

### 6. Stability and Dependencies

- **Reviewed-by**: Accepted by Mark Brown (ASoC maintainer) — strong
  confidence signal
- **Dependencies**: None — this is a standalone fix. The
  `controls_rwsem` and `fsl_xcvr_activate_ctl()` function have been
  present for a long time
- **Backport difficulty**: Trivial — the patch is small and the
  surrounding code is stable

### 7. Summary

This is a textbook stable backport candidate:
- **Obviously correct**: Follows the exact same locking pattern as the 2
  other callers of the same function
- **Fixes a real bug**: Missing lock causes lockdep assertion and
  potential race condition
- **Small and contained**: 3 lines added in 1 file
- **No new features**: Pure bug fix
- **Low risk**: Read-lock addition following established pattern,
  accepted by subsystem maintainer

**YES**

 sound/soc/fsl/fsl_xcvr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 58db4906a01d5..51669e5fe8888 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -223,10 +223,13 @@ static int fsl_xcvr_mode_put(struct snd_kcontrol *kcontrol,
 
 	xcvr->mode = snd_soc_enum_item_to_val(e, item[0]);
 
+	down_read(&card->snd_card->controls_rwsem);
 	fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
 			      (xcvr->mode == FSL_XCVR_MODE_ARC));
 	fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
 			      (xcvr->mode == FSL_XCVR_MODE_EARC));
+	up_read(&card->snd_card->controls_rwsem);
+
 	/* Allow playback for SPDIF only */
 	rtd = snd_soc_get_pcm_runtime(card, card->dai_link);
 	rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream_count =
-- 
2.51.0


