Return-Path: <linuxppc-dev+bounces-5253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67190A10D61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 18:18:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXbS813t6z3bY4;
	Wed, 15 Jan 2025 04:18:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736875096;
	cv=none; b=JGH4E/IP4UTL5gCS3LXuHNliXXDD2DUML69MPEu/bvizJoS+lAxB6TytrlVsUZcM+Mic0IoMlPOLCbksUfpdUbNFvmP7oPwQUuP0M7d+JCLuJ1IbXlgD6dhgjjcWovv/LambXcaGjVTx8lNRatJFaOgTVVzDj0JmJzRL9d0DF85WSMjZ5Hi9QjyGsz4RLNFiG8wORzMGYxEmNwaEm+MuXNs2FQSzBg2mJTS04bOWZ48Z59H3pwhkPdIK3TONPPMplGmR7/ROSpm5zHycgV8ZMpGXLUlHO1z879NTMNpfJZhkM6EJ1eXyFAcZK2anRdsP16gN35gaK38Yna/+7D+gCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736875096; c=relaxed/relaxed;
	bh=nPHTaqnYbJSXfhbodandFyRu/InoCJ2vFF9vbIGZN5M=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OtFXtnOOs3YIzDyy01MwMtyyP3IlnYYTA4ioa6IkknQCXRVYVYZh7FBg0lCBeq+O7YAqTO3T/1Z7i0foWNojF9JjfJIxMUuXq45+Jn3NbbRAgigcI+hofdZ9bvZJpWsDMG23mvqM0+kUfZKylHOZ70WUE3yaoSaKX2Lm5YFF85CZLpk/UUfz1DDeLjvyGKkk18YCB1lL4Mk2GQp1Eh8FSKl0+l6vyRCKd1UYg7mxIgAqOf9obQdKD7DNgEyVSqDYpuMq5mMltRNzQ1AwcHWbMsSiCrYkmlJPIhldy5SIj8Wvblg/QjDlgyooFUxpOQc7O5mnNRF4c9ZfIxBOeEw5kA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p/0xJnkK; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p/0xJnkK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXbS66pwtz3bWr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 04:18:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4220AA41974;
	Tue, 14 Jan 2025 17:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E103C4CEDD;
	Tue, 14 Jan 2025 17:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736875091;
	bh=/5Iyd6ukvw+wlfQuDAyxHew2KnpdZoyclKKn5oIODnc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=p/0xJnkKcMlzgcYf+caIAsKLu41HOHiDmbDt7TflB3ciDUvNV0mapiUS4aZ2sl8bM
	 71BZlEr1vxuE8K3p0XpbdGKjlF6vqqSduHIRtX7WVMQ33NP1aT3GB0h7FCl72XhYtU
	 hIwy0e6+K71x9qrGKINpjjN4dBZQhfpnX86/Qb9AQSuGYc3YjNMnLZvcnP5fSFY8fo
	 PnMigJHQe+Az0t5Xdw5B4HZ4zZndZ5lL/gCZb603LvkFNE9u0opnxUTLSaubJ8/HqM
	 2VlFEX8r+qF36MobSHXgHk5yDP37XCMr/U9kKMyqn+FBtlg/zdBeHnWcW00jW9H568
	 NrC5sgbnSG9JQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250114102720.3664667-1-shengjiu.wang@nxp.com>
References: <20250114102720.3664667-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl: Support micfil on i.MX943
Message-Id: <173687508729.71321.6375235704794853519.b4-ty@kernel.org>
Date: Tue, 14 Jan 2025 17:18:07 +0000
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

On Tue, 14 Jan 2025 18:27:18 +0800, Shengjiu Wang wrote:
> On i.MX943, the FIFO data address is changed and the bit width
> of CICOSR is changed.
> Add a new compatible string and update driver for these changes.
> 
> Shengjiu Wang (2):
>   ASoC: fsl_micfil: Add i.MX943 platform support
>   ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX943
>     platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_micfil: Add i.MX943 platform support
      commit: eab69050450ba63a4edb17d3d1a8654d2a130786
[2/2] ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX943 platform
      commit: 3927c51e49c1a45785334dc578f0b29c685619ec

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


