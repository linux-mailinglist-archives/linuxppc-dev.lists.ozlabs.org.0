Return-Path: <linuxppc-dev+bounces-14547-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37874C93648
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Nov 2025 02:41:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dJCZH02MLz2yvR;
	Sat, 29 Nov 2025 12:41:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764380502;
	cv=none; b=Y/h66oCfnyCoxsZQHbKrUCccvgFYMT+pTuLMUMRY8H8gPpUe98ehLBjUHGPme85xEiV0OoxsM0yqb1RuJiGedi2X0YNZ1Pc6xwbP6sU494fzA3otmKfjhKw6GBRwkwwlxOcjV3HhMfH+HE1zn1ENXurRyiOrEy84RETGErdFowA7S1Lv1tbw3Sjbp1lVa2YQQDqNpDPk3uSyFSE/oElaLBtlVhha7ZVq1sbpZVkR2MzAVspTavtXrI2c1+hJ8Gayz/Tb2EbLp11/V2hqc+O1g93ylJXUx2Ae7nKXfoWnBbybhcG7tp/mW9JIXtySeV7KtmIo60t00vibRYRJV9HDBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764380502; c=relaxed/relaxed;
	bh=lLzb8hLhiPzi0SkodaBTAfV7TqKbCW73lgYmFSnCa1U=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nOFqz3ZT00aGy+navfvIu07PnPXA25Gz/572q1moA0XsCAc1Jg0PURoAQmHRzBe3krBos+sRSltMVGA7772oJqXmq8IzgtcYGJGe3ibn19Tcye+Q5AHQKGIJ8bi8vhO+nvV4I/cy5QzrgxywPcdA/IjkyaLakDY16UvWs11JtGtCy5C29G/peG4IK2U9KDB7KEWGbkxbrAOaxbUG3EsHtgZzytf0L2aYGQCq1WPxOwkO2L5ucRk4Nutnj7U7/sXM3OO89YK2ETUgmPzrh7yKw6vdrO9TlRWwY8PiaRtNKdUcDICptTIxLzmMbX0N+s+UaWYWMm03D/B8IZM/7T02XA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X2yZyvLU; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X2yZyvLU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dJCZG0yZ0z2yql
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Nov 2025 12:41:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42222601A3;
	Sat, 29 Nov 2025 01:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE115C4CEF1;
	Sat, 29 Nov 2025 01:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764380498;
	bh=F6ydmhHRnS3CBFKpni1UffTbIjbx91Myrpg0VTYpT2w=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=X2yZyvLUofmXzWgkfBYUqrVF95bWbOJi1wLbfL/YJcmme5SjHZxECR6jqViyUFwvn
	 09DL3FvUMN7TLOxu5WKtp7cd5fKYIGdmVwDhgZKRL6EuLwc50vEHkYtStl1dA4JA7b
	 Y/2uKEQO5fiR6eW/fqD8ozjBRnIVkdlR62TWAL+fzBIu7WlY/Lwqsvf5I2laDpGy/6
	 lCQOmjsbVa2rORs6Aba27e/od9u1/rMD6uYJY75l0pV5yhKm+Qykpobe+cm8Px0yLm
	 miyzlavkeIRg/PywLakr0adoOlerkiEnjDXSaKODel/ihHJ1kfvpugoMwZ9EYv/gGv
	 iB91/xAO54qag==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20251127022652.674574-1-chancel.liu@nxp.com>
References: <20251127022652.674574-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v2 0/2] ASoC: fsl_micfil: Set default quality and
 channel range control
Message-Id: <176438049657.294473.18267302643868268995.b4-ty@kernel.org>
Date: Sat, 29 Nov 2025 01:41:36 +0000
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

On Thu, 27 Nov 2025 11:26:50 +0900, Chancel Liu wrote:
> Add default quality for different platforms.
> Set channel range control.
> 
> changes in v2
> - use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
> 
> Chancel Liu (2):
>   ASoC: fsl_micfil: Add default quality for different platforms
>   ASoC: fsl_micfil: Set channel range control
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_micfil: Add default quality for different platforms
      commit: e04aab96b3776634ab37ddce6d50a431126edec3
[2/2] ASoC: fsl_micfil: Set channel range control
      commit: ef1a7e02fdb7526e8d7c75e744f1f5b2acd7100b

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


