Return-Path: <linuxppc-dev+bounces-4929-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36734A08242
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 22:36:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTdQB6rMtz2yyT;
	Fri, 10 Jan 2025 08:36:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736458578;
	cv=none; b=fameKsNlwK1dVmwrVy8zFeDf4w7VLG1H1MzosAu4E8jAwSPnfniQkHyFnzfwbclJwS/OaCOVhy4Z4EVojg1hJYUdx/oI7clWiWqqqyVrDPMYr7VSgF0+Bja2GHcoZcLzcU16vuRM90vQZ8mZsI7E5a9UZF/EYKzrWlMLS49A4pqgpm/5Lz113jJ1UaFPUfnduNwR1/UeKTUq43DqZbm4BofxlRU2XT3CJwrgAurrpPncsRLJ3xbFJ06p1gL44b5Bmy/ImORf+VyUvnabH40sCTtoFa6rILmnxvLnHwOBOVojKFPZBB/Rmn6HBVKzWsp6u65gVYKqFBomy8RXGNRnZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736458578; c=relaxed/relaxed;
	bh=xKhgvYd/B30XQnOdEhkri59rzk2MdTRvmoML3PKvj0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h6T8ZMqT+lLW3jL9PNuK/I/MVKew3w3ryAY+dwzKPgWsa6evclqLtxoJ4NGhR0UW0Y9SxuX7NQvkiILBccq5xwxh/9Qi4SaXepBTlkpHdUtV63qmABIWMGQ78VqQUavGIF71st4eoQur3KzGonwZOyAc/EhREPzdlHrvTFSEj/sVN+fsHxAGO0xukRtD/0kdwig9Pa3lfe/c7oVDGAm/z8HnFp6YPWeKe8jqI1wKN27M4fQZSYjXovi7DETFsNswjGfwsWPZaO8tySiy5Yr8L3ZMuHyIrLyUehp30EUllLNnlYgKWdxJpNm5w4KG7aS3x/dKjJciF5CTzZnAtbdKbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oVbQgnr2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oVbQgnr2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTdQ94pw8z2ywC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 08:36:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C9B65C5C25;
	Thu,  9 Jan 2025 21:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BE2C4CED2;
	Thu,  9 Jan 2025 21:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736458572;
	bh=oWeTJvSV3nU7lPJyh9EggaBihBXttmXhilPkA3sJrXc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oVbQgnr2o9IBzXfuPGiy6YIzq0h+rk9umsnGXfNRsbuH10pOIdeP0lI6GCklflxI3
	 /ZbXvbCbz201neyTUEVSVQ0jMXTgBMNG/3qF+isFJBhISHbtdanNLA86+vvZY3PLf/
	 02mS34PvKCf3VL8shO43TxPmfAbn7qL+L9NFHnV6N62/p/BL2CHPHRuiBNxP2ouUTw
	 +VrJDJYWPkkE9OfQWwqvPT54ONYeV2uhlGiOapND+gZBv2o8Z37lQ/4BXFwP77aYIC
	 ba76SHPNNvpi5rlKVwsfXpoApETbhi6wPHfimN1q3B7KsQX64Or6l4YBvnm3cLH+0T
	 72c+zuf/Uu9+w==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20250109182303.3973082-1-robh@kernel.org>
References: <20250109182303.3973082-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: Use of_property_present() for non-boolean
 properties
Message-Id: <173645856449.810998.11706229796048790590.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 21:36:04 +0000
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

On Thu, 09 Jan 2025 12:23:00 -0600, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Use of_property_present() for non-boolean properties
      commit: 84eac6d478c00f8f9101f91716ea3866d2fc1e54

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


