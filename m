Return-Path: <linuxppc-dev+bounces-5787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69E5A25BF2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2025 15:12:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmpN531P6z2xKh;
	Tue,  4 Feb 2025 01:12:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738591925;
	cv=none; b=a1WwxE0JayojmmMeYTwvU8+v0r2pFDxh85iMjOVa8qwhCrHCTBZ9pli+LFMqN86iW+GH1BRq8I+GV0VIILinhu+5CmwAp+SJT4ZyFKfXd9igg5K2xOMzjqInKbwpRqP+BOawFJBz+Sf35ofx+5abFUOuaFUpPlIJXs6/YaU3ZDzVKZ3j0QiJZdoVuLKYxXujM0yeCP1oMdR55+Cy0dGUHJnuuZTTsh0a4jszd14Rj5dIELe3ro0+/UdanNKxhBYNOtoeivQtCt7o6SsFlyVbhU/6zqm5iBlds7jvfVIX96yXrAuCUWR//Wfhty//JGFLcCVgWhbdY1NHjjZN0CUPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738591925; c=relaxed/relaxed;
	bh=6jAfUzXUZ8OuLvdCkELLy5t8u2fwWeQAe/4jtgpJXpE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jpFmN2njaIf3GJXAD0XTMyh56ezcqGIs/6xCSP3BYsDWR+jbBM3YARPhRT2w0x19MqPVRlajHhHiXSqRX2J6mFtgyzWPN0PojsArKLK3A68PEBHmlnB6GjT+hOLzrrD11cFbAGIhQ4xxa1aSfUWwHvlWGrULNV5WOFNCdMdeULw1oMqeJMiY81Lrb0kB3iimpeEXOBBbUGr7ug+rHUbF6/Yd8CGmQOv8xBb1BNYFvmvuzewfGYpse1s90QdOq8/ruoJel9rDnd/Bp1Y7cMgnpbqKE/WKnLKaEdgnmc0rvtlDF6X9W1poDqZ8dEbi5HgQG2aU0tZs9qyJfFVzqaVyJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P5VgupnK; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P5VgupnK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YmpN41S5dz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 01:12:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BACD1A41938;
	Mon,  3 Feb 2025 14:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B19BC4CED2;
	Mon,  3 Feb 2025 14:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738591920;
	bh=RuhoI0q9VIHDH8RloW1zzkTYapkneNVbj2oLHxYolm8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=P5VgupnKomeI8wq7jc1nNcqPIyHRVFQQO1qQlsYYtZTCMFEtC/aOjIzmDDEGkVT+f
	 AAqGxd05COq6pMU6RtVbK/S+WV3J1a1caOpfERTd9y2HCjHDtjGeYzeLz7qbW0r+MV
	 7SbeWnVElJBxhLfAkhNJ1pJzeGj1HlvDJWmLSlo1VhHz/0ao9KJiXSCWujebELNlrz
	 7oIPh2lz0584visv0CkX01028WMTr36HXudMC/XRlik3iqVtKrBH2t9DibYS3SCnB6
	 Pz8hwNlwUN4PRWo4yZAxkzQk3qLeuoQOUd3v+RN6eK7UM/Dgo5Ncnqe4e7O8Z37+5q
	 l5ru33oX7p5xg==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
In-Reply-To: <20250116142436.22389-1-n.zhandarovich@fintech.ru>
References: <20250116142436.22389-1-n.zhandarovich@fintech.ru>
Subject: Re: [PATCH] ASoC: fsl_micfil: Enable default case in
 micfil_set_quality()
Message-Id: <173859191820.164425.17327834062368689870.b4-ty@kernel.org>
Date: Mon, 03 Feb 2025 14:11:58 +0000
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
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 16 Jan 2025 06:24:36 -0800, Nikita Zhandarovich wrote:
> If 'micfil->quality' received from micfil_quality_set() somehow ends
> up with an unpredictable value, switch() operator will fail to
> initialize local variable qsel before regmap_update_bits() tries
> to utilize it.
> 
> While it is unlikely, play it safe and enable a default case that
> returns -EINVAL error.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_micfil: Enable default case in micfil_set_quality()
      commit: a8c9a453387640dbe45761970f41301a6985e7fa

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


