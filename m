Return-Path: <linuxppc-dev+bounces-10398-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B59F6B11460
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jul 2025 01:11:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bp6G21xjzz30RJ;
	Fri, 25 Jul 2025 09:11:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753398714;
	cv=none; b=R4tit7kYzlrH7JaAVFIovW/FBe1N9ifgCNptgIzCEKaT75l4ltXqVJm3eZPS9Itu8pj+DuNvLPOwdk+4qv09QWJcij+f2P6RuOOwx8KBAUc92cwUKA9NBu0QG6sszklqTkfAnFb8yvKiUNEOUUuARAlUfeEC0C/f0u/uYprEo8embYhxvNOTe/xKl+lz3/mZ0lV0VXmtcYajT5tLjWCF/PDpll4s7bFeYDeufeojYeiPHJ1RiFqDCeIeVLpsUkI73luTBUzOa5ye2WXf54J/OP7RaYEOUqSexV2D8GtYoSVWxQBUu6mKeAx3RtW6l0gf6eBvwVdGilqEYLBh0XA/dA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753398714; c=relaxed/relaxed;
	bh=QK/cBdpkEJAzCU3ITBUkw+4UC9ZCuwT8G8DkmTea9MQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UerOT9l8pzpebdVBaQMftYyQyramOCsjZ83gGp8K3uQb6NjlpOn4NonjsmPWgws7yUAH+uRoGh51Lp1j2Fxtm8h+eYYHuDfzGO1vov63KzX5JwcrNe/Xx9453jHcwy+SJby56L54qpLZen0wFc0ryQOOBYlQgV4iVWCMAgVapNUeJg5c1kFkTAyDe6p0o9pY6UWjgbQ0cs9C2wqYWC71ojV+PqFKQSSS1ucRmKO1sDCCdUWmmXCZckgVs98qgFT2OJe40OhaDh7qvaEfUIqFAVBZv5m6rWOUTup2d7jQms5B3EGOtRNkPbZygvAWrf4xxHwvBgUSEzlVLfmKbyyFFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=do038/Df; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=do038/Df;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bp6Fz3Crsz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jul 2025 09:11:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9AC0C5C1024;
	Thu, 24 Jul 2025 23:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E9EC4CEED;
	Thu, 24 Jul 2025 23:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753398708;
	bh=7tkf0TMKod37/Ao3M7A/563iobABQPRZOnAq5q4tK3s=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=do038/DfNRBwtN0IXDUQ/i/erDExb/ANvB1yCiFIkbweK92H4aTLOMo3yedw4sfeH
	 GrICsdqT30zAVDHXdq3MuglWL67w3mmNng9Tj5rnroZKR+zPrgqVH0RknrlaV/7QIp
	 j4YNKA599+jbdNColj4BJveRXv+7yIkm0mrsbo66dYgxzLgdJQI1/ExQTFQ45bv1v/
	 u/hOfH6QnnPqGCggj1tfnk2vsWeW3WYH8d2EkaC4Eg5NSSsWDDXy6xBvQ6io1kqJgA
	 kVUcWsUsiOSmWqCyGfhhpt8EO8Qiu4GqbN81+9spppQKZJbjPOAu0iziaN+XKq9qG4
	 9xX2pde8tI+oQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250710030405.3370671-1-shengjiu.wang@nxp.com>
References: <20250710030405.3370671-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl_xcvr: get channel status data in two
 cases
Message-Id: <175339870611.186504.5168876077229345217.b4-ty@kernel.org>
Date: Fri, 25 Jul 2025 00:11:46 +0100
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
X-Mailer: b4 0.15-dev-cff91
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 10 Jul 2025 11:04:03 +0800, Shengjiu Wang wrote:
> There is two different cases for getting channel status data:
> 1. With PHY exists, there is firmware running on M core, the firmware
> should fill the channel status to RAM space, driver need to read them
> from RAM.
> 2. Without PHY, the channel status need to be obtained from registers.
> 
> Shengjiu Wang (2):
>   ASoC: fsl_xcvr: get channel status data when PHY is not exists
>   ASoC: fsl_xcvr: get channel status data with firmware exists
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_xcvr: get channel status data when PHY is not exists
      commit: ca592e20659e0304ebd8f4dabb273da4f9385848
[2/2] ASoC: fsl_xcvr: get channel status data with firmware exists
      commit: 6776ecc9dd587c08a6bb334542f9f8821a091013

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


