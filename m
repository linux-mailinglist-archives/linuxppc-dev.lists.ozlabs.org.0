Return-Path: <linuxppc-dev+bounces-6465-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC81A440FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 14:38:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2Jbg1Rdpz30VS;
	Wed, 26 Feb 2025 00:38:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740490735;
	cv=none; b=FFrLnSo939atsZxP20Xt9UAXdy4TbkQd/9MVlQfO15L0da9wcXUkS03p+xdBIAjiHpbqMrhjctz9lOdCFyXy8PYykZruvs33MrGDVC9gcxuOM7nfBw/YNpYuoaKUu4BMdyH1aNZ1BPfTLtJaKN4h8ohMsAKwP9Eo3AVeRH1dP3SV8fgsIGwDj5JgwbrFpBx/uMcc42WoNnmwdHLsdiOWMqqjmhBLT/2iJlFqsnMpdeiXOlvwJ27LvCmPthPF/Qo6l12guCIIgTOGWsMlc3mJVuuXSxKNHwjhaL9o5i8JnVlNPiZ8Ly6zsmNv+uhtlAz9OAhS6W/nQyvd49oHAVkNqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740490735; c=relaxed/relaxed;
	bh=kCA8USw8qRn3nwPJtq7Y0sScs9iOadascBTD8NphgoM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W/EbkmCJiZiFC8yur+YXftjqNWwYPH6uHsdACdbX7zPWWIGnMppGVXcOJhK3iLrFGq1bxUWe+ZtXNSG6gw/HGwqShkTOqeWTTBV2oaQNeABNp5vo4suHHdGehAycOeajwLqzrzUdgCVHwL3sh2upcthllZtp4k3Oy/NtV7i+FADg8bScNJOnSWzxhXiv2L3Tvn2+VPy03FJN16oQGTI4mgfKkpYB/5JkcswOnS2c9fHv5AQYruPZzlVN31qQlmvfkjn1qiLL0RHsvy1QTfkofjZM544moAvIKp1h1Xs/YWfwbmwFkbQQkfmsnKd2D0ks02ehfB5UUYTn1exKdGODDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mVVTD0sE; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mVVTD0sE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2Jbf3R53z2y8W
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 00:38:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14FD36125E;
	Tue, 25 Feb 2025 13:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4599AC4CEE6;
	Tue, 25 Feb 2025 13:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740490731;
	bh=mfVp+xpIE916X50N12X6HEihv4Q4eW4IWjDJk6jczfA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mVVTD0sEO3foXWmxsKZAaxFGUTg+07z2MzGr0hqQAxA6JJixLIqhIl7rxRiVc9fLG
	 tiN0WTKqDlYHRX32aoFZ5sVgcIEIZrsdUIi/tqjnwB/P0G+gIzc73pwNQCuLuReJkm
	 XhiO9Gus4YebtVc3SdnCrZzruyPTDiZh4EHqhQL3tCBWVRuZJt+mzhQXgaHCcn3eUQ
	 CroigkwVQckxxPLE6TYUfOXeg24oU4etyICKPwlwh2g5CEJkvca9zPVv6iS3apS1gY
	 AQBelJekY5NDpJoK0XmidIp3T7H1WPxRntS93P7DkfwCkqLZmzKYQt7Bjs8JOwvoJb
	 ejgj7kUucAiOQ==
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250223202741.1916-2-thorsten.blum@linux.dev>
References: <20250223202741.1916-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] ASoC: fsl: fsl_qmc_audio: Remove unnecessary bool
 conversions
Message-Id: <174049072899.42497.14898738709764389886.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 13:38:48 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 23 Feb 2025 21:27:41 +0100, Thorsten Blum wrote:
> Remove unnecessary bool conversions and simplify the code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: fsl_qmc_audio: Remove unnecessary bool conversions
      commit: 2fa56dae1a65e8124d417a31d7b02c37df013817

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


