Return-Path: <linuxppc-dev+bounces-8263-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCA9AA7C1A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 May 2025 00:21:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zq54P4H85z2yMh;
	Sat,  3 May 2025 08:21:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746224501;
	cv=none; b=AHtRADxW4XPen0ypwhv7242F+E1FoCOOfBEgBoHGwEZ1nJ95BalErS6f5DaeXXeMMjlf5nAP/MQ4rV02ybMmVbOP5wv7uKmvUKijcLeSP7s5LEzZn54AWF7/kvetIcfZaIumHT2/tMcpK0ElpP7NESxSrpyt10Z5vS9vDH5Xv+jIDVEofeCqBlaqYW8JEH5zdNt+Lgv5Q/c7+H2SDfHMdEuwqglFRdyPdvZEGyFRbEwQFRKyVbqL/gG6o8RCO1m3vPSSbV+hUN3WhifK7jugcfAUWTC7iea+DdyiIxECRrVOmkuvdnxnIXLItvNh7F1ije4U6Bum6TXQGAnKxevP1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746224501; c=relaxed/relaxed;
	bh=B2tx2IQgvWh1TIXdh1vMR8Nn5FUkPRu5erhCKyVXc5g=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f9vYGvtI3zrwVf4dKC0YRZIZTJbcqhTMXZLYzjCBBGmDvtStdRXWKjVsgjbwoVlXAGKUX53iFsuzHq0QC73QlZ/n74FW6LZldTH7c3ThxIqnlj1dZU6ZvjZcSNeig+iVEXuTaFW1x88tblt8nZoywmqBVvBMdFNP8fHtk9Zh8I/6CJGSGSB4+mhxC8N+CEHNIGXHqQzqZSoHhdnjPlV6GdI4peyDYEgLDz3F4bAB696St21pNxaj2lTegpQlS1DiAFaI/7GtgnLyn24znNQAV9rNX0Q2BoRa31L9qTwWc0Qrsnx1UqMBd+oBuk+Bmmo6O5kn8s3Wi1UYuriwLgWIPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uePdJnZq; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uePdJnZq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zq54N3W3Lz2yGx
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 May 2025 08:21:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D17496844F;
	Fri,  2 May 2025 22:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341B1C4CEE4;
	Fri,  2 May 2025 22:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746224497;
	bh=Wkl/xCbUI7do4AVTMYybZh5OgAcqp0zypayddyCDUA8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=uePdJnZqFALHxuAlpLfwRmV4/KsfUtSVZ0inrPLOQKQfWgkhvLnfGXF520tJGwvk+
	 o3RefBoOsJv8okJCeGSONP5zPaGRkN+FbwsmxQPjBw59eBUxDjIjVcUG3rg4Jd8uQ+
	 TtuSLZ6RSLTPWyYMuvrnR8rWxFPwe0jXFf18RNhqkwnuaRtfdDhY4lebjCYBDQm6BX
	 rvdamVo4MqvfWtWHTHvLelMLxu3rv+YgFTt1Yw4ZkrKLTpW535gxZ7tDOR+jr5uSTi
	 OLLGc/dNzjaqQdVLmu6i3I4zUVL5FhUcJRrGl3aOwPaAuL8QNTKZYZ0+Yk22x3Wk49
	 PfGPoqKUD8JtA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20250421105701.2273588-1-chancel.liu@nxp.com>
References: <20250421105701.2273588-1-chancel.liu@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_rpmsg: Configure CPU DAI for card that
 sits on rpmsg-micfil-channel
Message-Id: <174622449321.4079618.327380910498912102.b4-ty@kernel.org>
Date: Sat, 03 May 2025 07:21:33 +0900
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
X-Mailer: b4 0.15-dev-c25d1
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 21 Apr 2025 19:57:00 +0900, Chancel Liu wrote:
> Sound card that sits on rpmsg-micfil-channel has different settings on
> CPU DAI.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_rpmsg: Configure CPU DAI for card that sits on rpmsg-micfil-channel
      commit: 17fa55fe77d8234131ce0728a735da6dea19acd5
[2/2] ASoC: fsl_rpmsg: Allocate a smaller buffer size for capture stream
      commit: 2056d7a7df5d9a08144671afccb6970ccd595b89

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


