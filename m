Return-Path: <linuxppc-dev+bounces-13460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4212BC15E2F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 17:42:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwx4h4557z3chK;
	Wed, 29 Oct 2025 03:42:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761669764;
	cv=none; b=Aa7CzjEkVwzMYykuSBA+edY9AgOWlqqIKnLQ6XDUNSQd8DE3WAspfNwJzCVpztuONpHF2xmwzPAJGHxFp3oVE++IC3Yvd5zcqNFFuC+NJt7qxddsPiNQPOmfol7qbvsTjOR7izS0tcE3ugJxBjgnW2rdGLNh4ZqusQ37EEgtjFQuK+yMXfPncv0VOxAGo46u6JmJFMvsRXiQVsf8PQAwLZGnlrsHtjnB/VxF/8Kj6m7FK5NyR5pjB6aY9FSXAyMdmAbryCSv+DBiea6eF8sFQmbdhcDDAhuukMdoQ86E/oz164Sqmwr+/4HOJ1PaEEbKnGoWbpBbv6XeGitxJwwHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761669764; c=relaxed/relaxed;
	bh=da58TgkrFthT2To/Mr6Ijj8YmLgd4XwzQN88NX052ec=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CPg4t803NtdUf1Hn2U5KR8oWwUOH8pLJux/0GZcJoi18Vb2pOyAsEBTdeyskVpn2vCSJo5Gg5cVV6Z+s9Etf3+SpibOQml62DV2XdeW4je1mbyEKtsfyXjq2MWOnmDLBcakrL+d9DBR7cdab0vkhzbXbqVjg2j09iANbJEvSAmq4XprBR9KsGJ/YFetitmQAHyIOWExidzry0Y44l1n7YZOiUu+jyJoQDw+xJ18gOP11h3s6Dgq96ivza1IzKGE0AdRZHsVMNS8xbK1hLqT/CqmM67o3cmDhOpZUbWX7FgtkkDz+QNf8CLc0OLTjE7+RZp1Bi7rYEHrXZlF2Ba7G4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KGz1sjsP; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KGz1sjsP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwx4g5JZNz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 03:42:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D1774189A;
	Tue, 28 Oct 2025 16:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E651AC4CEE7;
	Tue, 28 Oct 2025 16:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761669760;
	bh=hZ3gnF5i4eT8ptp4+qQqGEWxVx7X7XqSJUbf0+1+MjQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KGz1sjsPJdGZeaXD2tDxhhqsJW194IcRDCErKAPdaYC2a+LgWeruZPsql3j/Qey/r
	 GY71GEOdnxbWDZdKvMhlrvaVbfBAMObvtg+7bffBGLxfQ4cJOE4YP9Tg0SHRqUE/gB
	 67FEP/nUSS7WAIHSTPSrj4Y4qLu6SPkcKV8JY2I+vWxfvoDdDxOM0X4MfKnhHJnLGe
	 oY1FPp4J2ExmluTsIq/46gNwboL+JWt0SAtMmwpYk6SrGAxvbSOL40P8rAnjOAILWM
	 xcGpRmcacGRls66gLE3tzIJtEijttMME/SL5Fo6ukxzuvxYEk0yJK2khM2IkTH32Am
	 JEM7Vg9Biq6lQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Zidan Wang <zidan.wang@freescale.com>, 
 Maarten Zanders <maarten@zanders.be>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251024135716.584265-1-maarten@zanders.be>
References: <20251024135716.584265-1-maarten@zanders.be>
Subject: Re: [PATCH] ASoC: fsl_sai: Fix sync error in consumer mode
Message-Id: <176166975766.152863.14270477182475254035.b4-ty@kernel.org>
Date: Tue, 28 Oct 2025 16:42:37 +0000
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
X-Mailer: b4 0.15-dev-88d78
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 24 Oct 2025 15:57:15 +0200, Maarten Zanders wrote:
> When configured for default synchronisation (Rx syncs to Tx) and the
> SAI operates in consumer mode (clocks provided externally to Tx), a
> synchronisation error occurs on Tx on the first attempt after device
> initialisation when the playback stream is started while a capture
> stream is already active. This results in channel shift/swap on the
> playback stream.
> Subsequent streams (ie after that first failing one) always work
> correctly, no matter the order, with or without the other stream active.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Fix sync error in consumer mode
      commit: b2dd1d0d322dce5f331961c927e775b84014d5ab

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


