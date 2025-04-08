Return-Path: <linuxppc-dev+bounces-7544-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EDDA808E3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 14:49:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX5Vt0nY4z306l;
	Tue,  8 Apr 2025 22:49:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744116547;
	cv=none; b=WZ41y1YJZThtzzy5dk9Y6YYphX7LypQTA3rt3AeNn7opL9e4nJK7MHhJbSErzia5hZ32T/AAoxLQw1A34X2cmSo/+pDGQM6FrNdIJYAfOqPTLUd4x7sRp482FcynCtNBhn06wlWtnIhZiSmUqlj7MhKuBeLk/IMT0XDzqaYN5ORdf0FhOxjEeiqOlgjc9lP1x1SR3Npx0gUl8YEs6gfwgOcfgtmF/QW++yeI6NkkHzTX/+J0Lxkh8W3DxjRqUZ8cbp4t33x1zFa4/ai0DllTLqwl2JmgNXV0Bowr08f/ymvhQ8trL6gzsnSytdM243T7qz3TeLH/eS9lvEFNWJpiOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744116547; c=relaxed/relaxed;
	bh=uzkKVrj+5dFnvwoImxw4NafvguS+2siU6X7FcCZOKEs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QEii+zjhlj4VJbV6F605rU6mcDIuAt/zVnWqUVOthbfbcr8mLqh28LMlATFR14Zwlq/9grwJxF5IYwYWl+5chCD5vBTZnGWZxrgFtvBCJlCfo9kV1S0CTsZbKEMW354Yt0XzwBM77KTa0yXJGUZ5997k6je3cZSeGHqPP87XodRrkBZnoog/AqV6/Qt8e5A8Hn52ESwrcGiAY1afHm7Llq9tGDRiIeqBTpyRvSMYhnE4WlZg9iKyJmx3/zoxPv2LiEKrBygXownrmbI6r8rwszdcja9ustWwE+mn2X6WsIMPiwtSIgf5Y0xFs9lBDoYeqlMllVD8ThPqkuFd99WNnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TjT6ldQd; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TjT6ldQd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZX5Vp1yrhz300V
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 22:49:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5BFDCA426CF;
	Tue,  8 Apr 2025 12:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE103C4CEEB;
	Tue,  8 Apr 2025 12:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744116542;
	bh=LqMi7yTcpzHfovVjCbZnS6Eo20XGaYhxccE3dOrGFm8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=TjT6ldQd3B223SWb0Uev7oL+NZ1tTFWhF42OuGLtRqK8URO72kdIJWHys0DHQsMvr
	 ZyekufT0bV90o56LXzOytcrAA00uwP3AbFJO816JZm1HqnbbtQK1k3wYRDnniBRd3v
	 Qr5ggqQIajSvMnTHOGBpOK96RLLRon2DhhB+pJXMG6hX7r+ftIRuaEeQT3ZqGLcMpb
	 739kTSC5JpaZOAhP0vgad4dKoaafpy6IWNfkyIDhnMK29mfTtMAuR3oUj3MxB3sBBO
	 vT4WHpRTnALmNYL5dcgeZUOtGpZ5d6GtADjLfl7JmVSUHPQp7O4oX4dBOOoo9xJmlp
	 7CiauRaT6nULQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250328085744.1893434-1-shengjiu.wang@nxp.com>
References: <20250328085744.1893434-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/4] ASoC: fsl_sai: add several improvements
Message-Id: <174411654045.2091760.1822661747375320582.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 13:49:00 +0100
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

On Fri, 28 Mar 2025 16:57:40 +0800, Shengjiu Wang wrote:
> Add several improvements for the sai interface.
> 1.allow to set mclk rate with zero clk_id for master mode
> 2.add xlate_tdm_slot_mask() callback to avoid channel constrain
> 3.separate 'is_dsp_mode' for tx and rx
> 4.separate set_tdm_slot() for tx and rx
> 
> Shengjiu Wang (4):
>   ASoC: fsl_sai: allow to set mclk rate with zero clk_id
>   ASoC: fsl_sai: add xlate_tdm_slot_mask() callback
>   ASoC: fsl_sai: separate 'is_dsp_mode' for tx and rx
>   ASoC: fsl_sai: separate set_tdm_slot() for tx and rx
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: fsl_sai: allow to set mclk rate with zero clk_id
      commit: 78b3bcfd5697f486946f559f56dbf78c30e22f27
[2/4] ASoC: fsl_sai: add xlate_tdm_slot_mask() callback
      commit: 4fe9d03b48cce3edb679ce1f404f19d242537a66
[3/4] ASoC: fsl_sai: separate 'is_dsp_mode' for tx and rx
      commit: e4b543d51ef1e723bde12d160121b7358a005b4f
[4/4] ASoC: fsl_sai: separate set_tdm_slot() for tx and rx
      commit: 1d9119794c10023ebd7c901aa9aa2c74eb833177

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


