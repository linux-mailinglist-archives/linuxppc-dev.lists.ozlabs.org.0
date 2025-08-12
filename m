Return-Path: <linuxppc-dev+bounces-10857-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AABFFB22538
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 13:05:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1TDm3PWrz3dLK;
	Tue, 12 Aug 2025 21:05:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754996712;
	cv=none; b=JOlnujP0ygec8gpUd4sHcdNYDXduuCRtETOXZxaU4hhlSJEOiw+dRP19AR/ULzLxfZX4/WPSK/dPckL/0x+haWq20Oyd2Qxwf+KMY4MPtFPcC2vQAwtqWkETzZtXfLmCyWaqP9AgDshNrVb+QGkkLpIYV75mV2IIBvUM+SVEd1H1O4iqpA+sLO8WQtsOmNpPoKH4MRRkFspuy/u2gJHoJnlYz7w4VNlNAfuyU9duSFuN1+3+nn/KLb6ySy7uaGX40la3LjcpdwJivCBKZ6DN7ZylKbOZUpRYY+uSZ55YjzmbMEssA1ydu9xGufu98UIEPOPJvklxXAgn+I5/gw06Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754996712; c=relaxed/relaxed;
	bh=lzKFJlwNzuFMRefG2bOpKE4MVRWe82EUALvdbEqnbsE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Oj6gZzQNJtxyt1GHt3saPh52ZSJ66Cr8ytZ8FDP8nsuTFS00AkLl46T6W6/SkIb73ZLmmkrjqxaYuoyWIfuEWDMhOzcWh7VsjGW1q8qBvzlPzHV+RjLg166N8suFrhaiTh8jUAhksOriwKkpVqkdgWTaPuVvZDZCbOnvVNcvjof+77ojZWZRMic0fjpgb2GJLX74CnzDJLjIz8Owx8AHlmp24kbrAjabV1vm472rFmzNvqkGJuhD/lGeBKdr87Syg0QJaElIcAfyyn+0amqN/4JzSV6NuUSaQAK+kTVSv67xWym5//RbZHt5Kxb4OwrIh7IguZIwQk1wlCYOfWAwyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ksO+RRwk; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ksO+RRwk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1TDl0Tmyz3dLB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 21:05:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 470F5A56A9C;
	Tue, 12 Aug 2025 11:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B503C4CEF7;
	Tue, 12 Aug 2025 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754996708;
	bh=i83FLRORzAWaY4/0VoGrVVs4sujsdhDnKVLh/tbKi9w=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ksO+RRwkquDBtc2qSEkIsY/W/9oVsvewgkKCETs1psFyO9oYhSWYxdccqvf6GA6in
	 HRkUSrLa5aLliSCE+jS4ZD+DF2Ch3QEcYdz9L6Z2lPAYVDTX2g9vEWRV+c7u/7XMlW
	 yt4zdzN/jPn8++9RuiOKa8bKh96MRVDp+JA17/WN6ITyEKRR3fG2+46XUl1MWjmLNZ
	 o3rh4TASDUNFSuORrZa/O2jGsnedZafT5ftzABpJlPWkTGzJtfwZ2A5JKLihQj6r5K
	 puX+wAbXHxgfPaWqy1H9ZOuucI/LyDeRKV7hIfmBzbkkWj0OVN9qAxnRfl36G0rqsP
	 pqf8DydXndMRg==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250807020318.2143219-1-shengjiu.wang@nxp.com>
References: <20250807020318.2143219-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: replace regmap_write with
 regmap_update_bits
Message-Id: <175499670591.16031.7607194509968600371.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 12:05:05 +0100
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 07 Aug 2025 10:03:18 +0800, Shengjiu Wang wrote:
> Use the regmap_write() for software reset in fsl_sai_config_disable would
> cause the FSL_SAI_CSR_BCE bit to be cleared. Refer to
> commit 197c53c8ecb34 ("ASoC: fsl_sai: Don't disable bitclock for i.MX8MP")
> FSL_SAI_CSR_BCE should not be cleared. So need to use regmap_update_bits()
> instead of regmap_write() for these bit operations.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: replace regmap_write with regmap_update_bits
      commit: 0e270f32975fd21874185ba53653630dd40bf560

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


