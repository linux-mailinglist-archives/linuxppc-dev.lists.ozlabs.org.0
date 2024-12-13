Return-Path: <linuxppc-dev+bounces-4120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C2E9F14E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 19:27:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8yVH26grz3bWy;
	Sat, 14 Dec 2024 05:27:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734114423;
	cv=none; b=PBeJCLIHop31I4dP3rQfqtp4J1jcnX8dcfiOrMnzPlWehrFKsLDUqiflHdx+0S2LTGuhtryf3zSMpazd9QuO5virzsc2TRXmWEhVKvVYLMfFk3rYba638IH6hKGxOHU7QM9+HQOvZz+1J/Vg321BcfMm2uFrsuQ6mkSfe+DVD0cZshT23e8rCy4ySOF3cUciW5zMRQIVamBkCeK9XtjIEsl88I/7wbQFA9ctMAFksk/Th2NG576AIB/GkrxQREf8P8N9r+tivNgldjafLZpi8V/u+Dz8ECqCdSn7iw+wdgRMKiOlJrKyH5XD7YR4i0BRX474+fx/X6576gfE36qt5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734114423; c=relaxed/relaxed;
	bh=3zN2N9t2rlqWsptKNzw0kqtwbvf3H0+PutpxMOuS5G8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O4I9n/fayWuSu+AAI4+AYfze3gd8irbat0PDEt+h3GouC0SY8zuEdEuDvUYhmVB9rTqvINcKJfssSj09TXAX87XtvcxqUhC3Vv+YClIo1PNe8LaR8yvTkwPoXCwEeUnAbUujDM6FwZ0NtvL/eTXxc6o1kpxNGnaeOT8pG24rBaVJKdiYXjpcPhGI7/Ny/N5xj6ISxaFtFWyWKo9YY0k8nZ/rhIsj2xnCIsoEJ1t2GDFeP1InVR5qsrA9EbNxU0h8LeIp8+2nEZO+pmOP5SQhCv/t6AaUvp9jdTO9cQb8YfFVhTOtQUXmayxX+P4WTAeRJW5vVbTQ/N713HaZTjV0zA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tVclJOVO; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tVclJOVO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8yVG2xlwz3bV2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2024 05:27:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37424A42DA0;
	Fri, 13 Dec 2024 18:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A467AC4CED6;
	Fri, 13 Dec 2024 18:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734114419;
	bh=IgsRLbyjKbDnKZEGJ3MxQziXE1RmxfMqUEJ4Xfp0AXw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=tVclJOVOf2RkdXGpgF+xzGmOWG3D4dwbR02GAwQcZ/q1ERmrWY9QQJyCXlLkfGgYy
	 lP2TMn0VqqiW/lzwrzJgJdgiBywyqJMRgEGM8iJVyiQ/TSfxxjpx2jXcZGiUhiVGdA
	 4T0ynGJk2xDc6xXQGo7jbq1yehcx/oxnnDjbZZLuh/wZ1J/G6D53jdeMpe5ytrzSVk
	 WOWrmSIXWACfDurEwngeQ6fL/dlU/lPQt+nQSqQoDj2PAVenLVcsuyQ2Skn7XUhhSG
	 Q+XW4vkSLM968vts7NDMOpAcBWyAfrfAP1Afw34HRwJqpOT9O3kOwMTgyxaLgi3Ptc
	 6w7X4Mbx2SfwA==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com, 
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
References: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v7 0/6] ASoC: fsl: add memory to memory function for
 ASRC
Message-Id: <173411441641.280424.4148595189607458156.b4-ty@kernel.org>
Date: Fri, 13 Dec 2024 18:26:56 +0000
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
X-Mailer: b4 0.15-dev-9b746
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 12 Dec 2024 15:45:03 +0800, Shengjiu Wang wrote:
> This function is base on the accelerator implementation
> for compress API:
> 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
> 
> Audio signal processing also has the requirement for memory to
> memory similar as Video.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ALSA: compress: Add output rate and output format support
      commit: f4425e3ab2f796d442a44f31262eade9b6427ff7
[2/6] ASoC: fsl_asrc: define functions for memory to memory usage
      commit: 8ea7d04a4e9e30876c9d8184b4b8e4cab33e0372
[3/6] ASoC: fsl_easrc: define functions for memory to memory usage
      commit: 27147695aaf7ccb0edc3f21454b5405c9037b4ba
[4/6] ASoC: fsl_asrc_m2m: Add memory to memory function
      commit: 24a01710f6271ec32b629d714e6a64a69665128b
[5/6] ASoC: fsl_asrc: register m2m platform device
      commit: 286d658477a43284f7be2539b059ecc90ba109c2
[6/6] ASoC: fsl_easrc: register m2m platform device
      commit: b62eaff0650dc6dc2a4bf0f50714f2357a23fc71

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


