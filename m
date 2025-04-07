Return-Path: <linuxppc-dev+bounces-7506-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE653A7F168
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 01:48:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWmBd2n3Wz2yqy;
	Tue,  8 Apr 2025 09:48:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744069737;
	cv=none; b=RH279n38wo2dbrQnRNbJRxxvYQIzfF2KzCRbwheTJn1vKHDJ5QFS5JZXS6ixxot1vqXoGMCX1zgUmvvQX/mOUItPHI8gayDJ48l3QRimaZB62jNSmYAqmL7D9bWaD5ZpOLmFAHdoo4v4p+3azYphKvZjGTMDNUqL5OglakHds6dcbAo878v/bHUvRbem8bj0iT8bBXbX7nlub2w++xnjOlFjLs2zEOlDDTvmCqFPDpw1p6Nfs1vo4fbReOIq+fEagVMk75wH58eIVQ3lDppPqdtf0xVS5N4xKkZuESsbabVPE3uR75JrwUHSMvJEAabMpsR21/nIDbZznLwZq2QqiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744069737; c=relaxed/relaxed;
	bh=GWeaeQStxrYRprmz8g7xCRUbqTX5zImlCTkE+R4Z52c=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eO4+toe8C0vl03eiDhj78CLMPi429d1wkb5rLuqtTxSr5jBc4CV5MoG3pYzbTVz0GdtgcA4IxVJNVujdAM2xNbVvVWH9tgSORwlSQL6oxpvqWzXfEhVfgNCpEWbQpL0tv05IuGHNnqyAerH88/KDcF4colEtGboBfRCLrXUMYXkko9ImMoZieGKG/4BzXauZR9fyS1xdudWymjDpnawysbADBWSMcDUlTi+PsjvrJb/JLXWX46d/dRAXvVcEQ64yvjmN/eixgVAXxZmoBmigxUa//HH6Osz6E9LMGFm1zZdVyfL8OCfhcEWLYOQIcTSTYE0ow4+469X5au+J/vW4Fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KE5oLfVu; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KE5oLfVu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWmBc4rXKz2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 09:48:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5EFDDA4308D;
	Mon,  7 Apr 2025 23:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA287C4CEDD;
	Mon,  7 Apr 2025 23:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744069733;
	bh=jMMELnblMemF3AYQvGgHeCfvJKpdkDZIw7VpKQqJUUo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=KE5oLfVuQ6RdNYzVpQHcwdXdgM4r69W2Wm4Vt9oxwQAevIHsvxLmhJrlV+DcgmSdn
	 ofUuZJtfxVK3Jjr2zTyoat2roKHA0s/oTdkXUcbwhVOb4QrDv49ZVCFiPQGmrVxfEJ
	 PNC3VNAjIFSIbYTZFLEJm3tlZZl0FpyX31IVvgnO4lEUFktNQotsUt6ANEEC39gO/D
	 9S4KdGPdH3MwWRSmX4O/+QvHmyVRLpRniJYdmnaw6jut0MDulwwniwzN+Dl7dWuaa7
	 hzq/IJv6yY3MslMrNzcFFRwd4M/RMN2gnI6nFfXdXZsVv274VJYxL3rxtFPtXSGtUS
	 5Ag1uLZmkNvGg==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250319033504.2898605-1-shengjiu.wang@nxp.com>
References: <20250319033504.2898605-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: get codec or cpu dai from backend
Message-Id: <174406973149.1344763.148124979192544931.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:48:51 +0100
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
X-Mailer: b4 0.15-dev-c25d1
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 19 Mar 2025 11:35:04 +0800, Shengjiu Wang wrote:
> With audio graph card, original cpu dai is changed to codec device in
> backend, so if cpu dai is dummy device in backend, get the codec dai
> device, which is the real hardware device connected.
> 
> The specific case is ASRC->SAI->AMIX->CODEC.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc_dma: get codec or cpu dai from backend
      commit: ef5c23ae9ab380fa756f257411024a9b4518d1b9

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


