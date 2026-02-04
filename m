Return-Path: <linuxppc-dev+bounces-16583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEh6HJhDg2nqkgMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 14:03:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 536DAE6238
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 14:03:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5gWm3bMrz2xpk;
	Thu, 05 Feb 2026 00:03:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770210196;
	cv=none; b=BTFgsZGXVVHglImeju97kn4KQ0nX+35m+xKCTuFHN3jVfI+r8Zex0UqI6xfMLXd1e14RJeZDsAFPC3aF4RKhFHNGEH78j6c3IgGgqba7Rn4VWfo2mpmJyO7o2mQ3p45IYqQJlp3cxQ0CW3l32TBn1HlqtJSz/8wku55AQmlptSgjjlkHljvOCr/RLFBxLzhMpyFXrcllLXoIE/n0tETEE5fRyCPYvR0hz8eqgOtW6COpW6CYcMKjsBAS/5EQARVbKfJezaFZQ+Smw/Bp3nEKYTUCt4/Bb2QuWi2Ejw6/++QdAjJ3m7LeFtYviCOaKhNgkBnW++T5BnDE6Zz/PAWD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770210196; c=relaxed/relaxed;
	bh=kkQ9WSOJMPpWw+ZJkdpoFoBelTlijNy7vQcOjcZyFKI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aHA9YrfY9SsS6NLacbOrZNZUgIz+KWt3u56nC3vpmoHANEd03Slc++60t0DEx2nHiI1alDyX5cpi6mWQEIdQ6cbVQ1b/lBwRIMoBayW0Kd9s8M359l53ssmwF6kxXPjhpGUjs3h2s/8fxCPw4RfEEeAOgIyg3rq8Bnyqdf1ISA5/zZkzWi/fY0iMX//WRq3d/ZIAu/RbvvSfqcNThKQxXIxTDQ0OUE6ll2OS4+0qN6YGh4iJEixaj+9RayscvqaU9iLZZVAX3AZVJ6ANLavLAWy+gDekMsDaqGSrZkv0SqTTDZrbjLkCtYrfnNnWH2l9Ngnkr6OTYHqerXYVrECfIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u+44IJQC; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u+44IJQC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5gWk5sZQz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 00:03:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CEDF60142;
	Wed,  4 Feb 2026 13:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8BBC2BC86;
	Wed,  4 Feb 2026 13:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770210190;
	bh=n8rNqrB2sTthf6NVyEee9YXiwP/2LrMsSu6Zji+6OWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=u+44IJQCVUd53BQZpm9rvKrf6WvgQCBPh9cfEzBOAPp8ACrJy3cEdIRr3BwCjVAJt
	 rdEUf15WCtE8HsRIkni7PTcivOIgvJEYTwQ5eW7buvnwgeqM/MY8WpwsPOmbAoYIiR
	 rwWNJH19hWzGBMb+Z4SqqyyDZdbu5BUS6pfVM+ppbqWV/RBWqsInZLC9b/Gje6tt61
	 fEUZMCn7ZKEQIexUsRFfsA0PFkZ+IwKUISbvLVLE2Is5Xh/nz+o7Fsan0pJeJrCHp/
	 19jMFAwn+f3sdb4CI3yq8WZGeD1N/Oc2Y/cXWAuELynYC/XJfKcmoQeHFZ7ZnOWKka
	 kTV8WlZ2jxtRQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260202174112.2018402-1-n7l8m4@u.northwestern.edu>
References: <20260202174112.2018402-1-n7l8m4@u.northwestern.edu>
Subject: Re: [PATCH] ASoC: fsl_xcvr: fix missing lock in
 fsl_xcvr_mode_put()
Message-Id: <177021018786.97050.3676101017242233000.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 13:03:07 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16583-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:n7l8m4@u.northwestern.edu,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,u.northwestern.edu];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 536DAE6238
X-Rspamd-Action: no action

On Mon, 02 Feb 2026 17:41:12 +0000, Ziyi Guo wrote:
> fsl_xcvr_activate_ctl() has
> lockdep_assert_held(&card->snd_card->controls_rwsem),
> but fsl_xcvr_mode_put() calls it without acquiring this lock.
> 
> Other callers of fsl_xcvr_activate_ctl() in fsl_xcvr_startup() and
> fsl_xcvr_shutdown() properly acquire the lock with down_read()/up_read().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
      commit: f514248727606b9087bc38a284ff686e0093abf1

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


