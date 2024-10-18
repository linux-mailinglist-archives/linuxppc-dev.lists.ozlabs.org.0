Return-Path: <linuxppc-dev+bounces-2415-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A73029A48E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 23:30:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVdD704qWz3bgl;
	Sat, 19 Oct 2024 08:30:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729287046;
	cv=none; b=XhHAq2uHdr9mcCHJBwaquVsP+QzVDFfLTuf3JQIOGZMs9rwOcOz3rwsYyhCMF+e1ljqfJZ8FY5Tr6y61CJNBgJ6NGEuRknuf8AAJeDn6F7kOm7h1yfBYT+562+0ecx3bPuitFb99PQOw5dBzmADEQG8Au0YjlkIqpjTgweMKvIRf6E3Xwfo3PRwKYI6jgkcDjosd+Xozlzh/kZv73mEf69Tqb02683QXU3LuO43x1TUKoWOjdyd3s9zvwiveDLjjGSloGfZsGZwj9N05OtbXqdFJp+6/iB6aMrEdj1D+7zzzTbGwxCOoE4Uto2OrXP10mO41Hb8pgz1xSvwx6cokTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729287046; c=relaxed/relaxed;
	bh=+x40G/RVScqU5RU45r/OHIPWIhZjxuddm6QYzW8olIw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AgGe3jlfMertaY7Q8Q8z7rl5Xp4sJXIOcliDkwvZSaVKwYq7oICME5zjoL/Wk8xEajG1RGC7MIyY0hDhJeKxm2mmG76/U5zfUy3jL8wb+Qn6RUUdcGabDnmdhQYX3VCymN2N8siC2KnXWjneS754bp+/Zvw9xVxsWDNtA2g07RQkAF5RO/X+LyN6OHbwSjvJHJIeJXbsugVv5zD+iNWm4OZxCzveFPlYYEuU4bK+mmdY7hAc7XPvKwdyiVL88SCuY5vWjuodWLGI4pygruAUoSgxmID43Ct2x0W4+4mLK3cUAYDEtaa0jy6nFU4omY2vUXdQ+wwBAFowXuNejoGy4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VbJ9I6Pe; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VbJ9I6Pe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVdD61DWkz3bdD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 08:30:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 626605C59A9;
	Fri, 18 Oct 2024 21:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AD2C4CED1;
	Fri, 18 Oct 2024 21:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729287043;
	bh=bd7zqGrKt29zOyO1cGYsr3FOMFt4VVqROBGt8oxJNRs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=VbJ9I6PeF8RQAviyGZQl6FnjRoFk86rwPMF7ceG5X5rap30uDjPmHrctjo8dQOs9A
	 ytr3HBuo833OgANJwKVsrSxsuWZzPnRY4Rzmm+2Eq43RkNDXHSonfrhWSIZj5XG8y/
	 9Rs/rktl6k24rnPSuXlQQAngwThTgqb7d8m1b+FZxACTOFk5noyIJFX/v4NauQkUNN
	 /UA4meQSQZ6j+Sesj5Q6UsywMOFwiDKtvzeSFBU0bqsi6zPP3XWQoFcJE2f0vSbtKD
	 jD/V+S45WTHPpJN6U4jNGl38Ap1B3xp3IIaDwav0eNf3OPyZx5NraptjV0qy+aAtQG
	 xxQk1RhLc+yiA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20241017071507.2577786-1-chancel.liu@nxp.com>
References: <20241017071507.2577786-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Add a flag to distinguish with
 different volume control types
Message-Id: <172928704112.212383.3559380039082750889.b4-ty@kernel.org>
Date: Fri, 18 Oct 2024 22:30:41 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 17 Oct 2024 16:15:07 +0900, Chancel Liu wrote:
> On i.MX8MM the register of volume control has positive and negative
> values. It is different from other platforms like i.MX8MP and i.MX93
> which only have positive values. Add a volume_sx flag to use SX_TLV
> volume control for this kind of platform. Use common TLV volume control
> for other platforms.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_micfil: Add a flag to distinguish with different volume control types
      commit: da95e891dd5d5de6c5ebc010bd028a2e028de093

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


