Return-Path: <linuxppc-dev+bounces-5430-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FB8A17482
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 23:14:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcPlR4Tq8z30Pl;
	Tue, 21 Jan 2025 09:14:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737411283;
	cv=none; b=dt5zBvXrkM9zfThkVNBCSav7lssTC1fvcS5/olVyqHof3Oks/3STSvRzB1ph1zgT3GUa10gMjWJp/aJMFIvgEEHk4srdPbp9FXbbNquARQQ0upwd2lmFMhWRfsdRIgFcUwQDicLS5k8WIa+yDRSNhOkIP1T57Mp8B1IOb68lWjWYDTBLoITGfLdh6tjV/zOGmebdUVKAx+2Xx2XrXurvtVjoKRRxDqeM6XjbJMfNKNKnF9V3hBUIou0jFZ8OJag0ZOZpFsRnKGrRlqNiFhJLN7e9/cU4LjZvo0P51q7dsUlIuq7o7F/5JpvI5cY6rqb7b7j8fOawo3KM32C5LfXrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737411283; c=relaxed/relaxed;
	bh=W1GBoGr0cNxmP2khnvKu/LnLTvDZ+w3kLFhBvCAGapk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fnr0Z2WxyitDOL028hOiMz11lCMU5AqnpahATLag7MSWlk/yzCWlRtrS3TSUg2msgJHiOwrFqSfm5nSdby+FiBNVdjHA/vRHEyQQNdyurrrGWbw9nQSAunkqZLu8TyFgVD5TfPoZm3KGb/pOld4+hFYtGStgdthlInZUvGA5RQaq8x5l4+TygQDeH0jsfMZS5MSuCV6TbQ8ekdO4Rwv4WcqtO8DoGA0aY+eKSH/FokFbd2heRmQrQNFwuOHlUB5ZOWpRcqipgSp2szSoRG1pvxYk/2tdICZDxtd6Mg35nTZkjhydu+VUSZw1iSfqWZDwyjCJ7YUBJw5q6kL2K6t4iA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J23hoFOp; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J23hoFOp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcPlR0NDqz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 09:14:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 955FD5C5D33;
	Mon, 20 Jan 2025 22:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6028C4CEDD;
	Mon, 20 Jan 2025 22:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737411280;
	bh=FPNR7tBW/dPlzjn1OZcp8VhyZfjwqjwr5bADwiGv0vM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=J23hoFOpXnJW3Ax/iwnUpZkyP6q6VTHnrgJJCu324qbNYib3JnCs0IqP/qrRCoNtc
	 wn5vel0GGLtCx1PJJ5RLJ4JZoou+/lOjKa2oUo4JTcQ1aCTyvXebQa7IXPiOYH8t4x
	 YIt7slaS/k15AiEd947QUDEWoyV5y/TTMIJxuSazcbYIz4n/S4sGtlRTGdakYum7IH
	 SpoVRr2vuQPPNPDbpz0z4SZ6DAxvMmN8u//TpeYRpzz56yMk1h95txFlfigbQ9pnh+
	 zMlF9DcGAe6xZFu6XRoIE3l9cmuRAagUc/C2TsuJeBb3QuTKVZfNiRaq4xa3fVvjJp
	 J9bBnYZ4kTFzA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250120081938.2501554-1-shengjiu.wang@nxp.com>
References: <20250120081938.2501554-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl: two fixes for asrc memory to memory
Message-Id: <173741127845.104623.1779188125305683967.b4-ty@kernel.org>
Date: Mon, 20 Jan 2025 22:14:38 +0000
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

On Mon, 20 Jan 2025 16:19:36 +0800, Shengjiu Wang wrote:
> 1. Fix the suspend failure for memory to peripheral function.
> 2. Return error value for processing function.
> 
> Shengjiu Wang (2):
>   ASoC: fsl_asrc_m2m: only handle pairs for m2m in the suspend
>   ASoC: fsl_asrc_m2m: return error value in asrc_m2m_device_run()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_asrc_m2m: only handle pairs for m2m in the suspend
      commit: d12ca6d4c31bf974ecc80e36761488f41d05d18b
[2/2] ASoC: fsl_asrc_m2m: return error value in asrc_m2m_device_run()
      commit: abe01a78bfc8be9cc025a73b991c4e77431de9de

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


