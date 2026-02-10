Return-Path: <linuxppc-dev+bounces-16790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHEmHzmki2ktXgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 22:33:45 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8864A11F6E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 22:33:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9ZYx5WN5z2xJF;
	Wed, 11 Feb 2026 08:33:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770759221;
	cv=none; b=KzTzygSGZOozwVrNRWw8YlCYc7AELxm0io8ppIrW67ZrmGZl2YE0z97wujinpcIWoIBfT7Z7tyNZjl+JUhTKTXUF9TvnC/fH2w9i/UVCKblBiNsQYmwE1Lw+FrBYQGfmcDZOwzXGGKBUJmrV2Jr5Vj/LnoOF3Y1mj+nUa4maoP+PJYDY5FnCTe1YgNaiMDhr9pH2OCapdLkanJeiHu6t4HqNyJqDDz9OI2kOLOb2+2s/gSpl503JUHHNLsZDwPIrKYOFdldOydghXtreBwqPTMOPBzmLlybCN7/VXygC+Ft0LNCTpYQYkCo3VIxvnzsGNaOhBCtBOY+iCSI1pjp1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770759221; c=relaxed/relaxed;
	bh=gOjzdhNqDCzlqL6IKdDVn8zD1GsK68U6ZlRyi3k1UHA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SDdJSXj4NJXZwO2PF57ZhbCyP5gObyCnRP0V7ut3LWpzFS5XfQkhzns5Ppu+pZnuhq6sDq6ET/fkrvw3YYOpw3vY/P2m9eTLBE3Uiz45XmXUGCmUsHx1OJn6iofvwJiveZcgGJLfnECvSiXLHVjiP+p3EKt1+3CT//A9NG5O8XyQl0qpJa8usWF/Cz71vEb0CD0HvlaZTKxu7RlCCcxZPbvaPPkDEOlHSn5wBeXEOFpS6U8cgGiW6Mwz7vXlYPBGdiAJO1KRZSfjRo8S6Z3tpi6lJo7RdJWWMTHfclzP3nqFned8gIDK80SiCo6lYIt9VujkCHOiq0UUiHkJIxR/tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CXlV7bKy; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CXlV7bKy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9ZYx0bWJz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 08:33:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57C5443D64;
	Tue, 10 Feb 2026 21:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C47DC116C6;
	Tue, 10 Feb 2026 21:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770759219;
	bh=R6LL7radRbHZVM7ek9wngXsonsoiKaEW/OY9SShZ5eg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CXlV7bKyxc8bB30zTAlF1dBIM5dbPgFmainXv5At1nT0HKVNiFSAR6674wSDvMHgh
	 fQUbkny4TFSF/qByH8agsuZBnwEU2UkNi4KbC4HN5XLaxBl1lOiMLUgX4Z5vAmyPwW
	 Ds3Q1pbEHZ3ftKP9i2Fq6LU60h0S2a6jMHDyG4lCDAiV45vamLnxM5vMMzJjR5iVPK
	 izaGOVo7e3M8nbYRh/0l1gI0CJ7cHIMLo9cCIBEBKv+8TsArLhRLPCMVGHRR4Uf0EM
	 lJTtl5OG7yzq5iSURDFVykBnzox2Il+bz0u+jF9U3VkQfN11VFXL1ayLf4h5xo70LY
	 e7HY0XPCLTQ4Q==
From: Mark Brown <broonie@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260210185714.556385-1-n7l8m4@u.northwestern.edu>
References: <20260210185714.556385-1-n7l8m4@u.northwestern.edu>
Subject: Re: [PATCH v2] ASoC: fsl_xcvr: Revert fix missing lock in
 fsl_xcvr_mode_put()
Message-Id: <177075921678.419952.11304606547745968754.b4-ty@kernel.org>
Date: Tue, 10 Feb 2026 21:33:36 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16790-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:alexander.stein@ew.tq-group.com,m:n7l8m4@u.northwestern.edu,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 8864A11F6E4
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 18:57:14 +0000, Ziyi Guo wrote:
> This reverts commit f51424872760 ("ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()").
> 
> The original patch attempted to acquire the card->controls_rwsem lock in
> fsl_xcvr_mode_put(). However, this function is called from the upper ALSA
> core function snd_ctl_elem_write(), which already holds the write lock on
> controls_rwsem for the whole put operation. So there is no need to simply
> hold the lock for fsl_xcvr_activate_ctl() again.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: Revert fix missing lock in fsl_xcvr_mode_put()
      commit: 9f16d96e1222391a6b996a1b676bec14fb91e3b2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


