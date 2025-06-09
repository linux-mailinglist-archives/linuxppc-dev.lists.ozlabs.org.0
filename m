Return-Path: <linuxppc-dev+bounces-9228-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EDFAD2847
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 23:00:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGPTY1ygsz2xHv;
	Tue, 10 Jun 2025 07:00:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749502849;
	cv=none; b=I4oBQ+Cpkxrdenrk3Rs4UpHSFvWeMVUdBB0GK55VubepRWvYZZ9w1f2gadnP67dv+yjxFPZUMuftlF5jiDUUVyMwZMOvGfCSnd24ZIcK0rlBrblSjrg6ZtDAcmZ13hh4DLWH6w40n/47GNF9SXz+TqmcwStvBSecvQN5W978jD+IJhIoApR3halm19WF5YSoqMVm4gRXzJJIPP2VbVQnbl8mMX0QlLq/pAP4XhUsWlsLa5aJ3O60Ox9oCpoNrdnMoO06sCZAn6HN5H9iKG9NxGPVF/fe/fRDiplLuNveW4tmWS9dY1iUGz4LriVdC8ViLXthpShS/wOdcIq8vlU6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749502849; c=relaxed/relaxed;
	bh=6qVy4O4vfAMfKpuB2sK6w05+V5SjzncJ1VrfL2mxyo8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J+UHgRIqsl7rLOwSpaewmUf8uTOIcFXYj/k7mVfi9GFLQxhJ27dpAfbC/Fz42XfMfkBUYT3Gh15bgmxewNmwWmme2f71rUjj8cdafKi0+sP8vdq8iXM+4TDnlJbNU/vWehfSKeapDjPGG3saLlP4lFQ1TYLmuLVUkLkVn5irjzjfQOxsoWpsDhtEumrhIundJf/PA0ROrbMOzmyZ2P1thxn9HK/UtvbsuzPNhs0xRm5QmLCCIIA7m/9y+Y0ydEFsmSwZqPsT94MT3xboO8vmch+qo5h7c31T32eRNUenpe7gFS/vBbLN2aDHQSMWC+RLBHw6OMrL9N8Rfx/i+HXFVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NMgkE+8M; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NMgkE+8M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGPTX1sz7z2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 07:00:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3967A50BFB;
	Mon,  9 Jun 2025 21:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41145C4CEF5;
	Mon,  9 Jun 2025 21:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502844;
	bh=nKBc69Ss4RL/f6HqDzYsfnuaSZqHYo5VaYM8rb8GeWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NMgkE+8M/Uu+YDD9TzoQBBqlIrvaR+kKWwQBRPp00blQwh1Uq4usimq55b2ClnPlS
	 E2KwChecqZFjgJFgx2DmbY2y4mDavg2RSIES0qu2gMpBQOomYNvpWsE/jtHJaQlu9y
	 irGMEVo6adaaDja2ADlhrl8j9TZ8vwdd3/xO2ILpLqvX+eSDk3mF/oYYhhilo2rPFI
	 60I544mJeqwf3/D/5brHAGtVhsYL6XbfCY6JUOR++fJpn+o87OIuIwZMAsmvZCcmsx
	 ZjYgasdchQrSORNYDnBeu6HpDtbPAir56TQOhzcPkEB3GF4y3q5xh/q1zPmOs04ibx
	 md1dqE7NLY0Tw==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
Subject: Re: [PATCH 0/8] ASoC: codecs: More const and unused member
 cleanups
Message-Id: <174950284100.277844.5516021122199665205.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 22:00:41 +0100
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 28 May 2025 21:59:54 +0200, Krzysztof Kozlowski wrote:
> Make static data const for code safety and drop some unused fields in
> structs.
> 
> This is based on for-v6.16 branch in ASoC tree for context in wcd938x
> driver.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: codecs: Constify regmap configuration static variables
      commit: 0045b902ad27f2676c2a5b6444494a8287b80072
[2/8] ASoC: fsl: Constify reg_default array
      commit: 239dab898b739f49b1bda8d65163fe4f5c773468
[3/8] ASoC: codecs: wcd9335: Drop unused sido_input_src field
      commit: 620d9687004ce877b340041b8213da166f329367
[4/8] ASoC: codecs: wcd934x: Drop unused num_rx_port/num_tx_port fields
      commit: 9afc53569d800f5e3caf9401d49ad2d89f340a54
[5/8] ASoC: codecs: wcd937x: Drop unused 'struct wcd937x_priv' fields
      commit: 87a2270fd1f560dbfc1b26391ff3b37f56d2a1a3
[6/8] ASoC: codecs: wcd938x: Drop unused 'struct wcd938x_priv' fields
      commit: fd32bd4467c13254cb52188034fce242f0f6340d
[7/8] ASoC: codecs: wcd938x: Drop unused variant field
      commit: ff228b6b9ed8f5d7ef418b6cbece772c6617d789
[8/8] ASoC: codecs: wcd939x: Drop unused 'struct wcd939x_priv' fields
      commit: ece5d881004f041c2e1493436409dbcbea3ad5f8

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


