Return-Path: <linuxppc-dev+bounces-13126-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BE6BF825B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 20:52:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crhHb4jswz30V7;
	Wed, 22 Oct 2025 05:52:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761072747;
	cv=none; b=UqwMlzaknlQT7iHcpuSdCj1qwjAo3asd9sxKhz1o5jmO+N36bLQxVjkXDzVG4dwvdrD/gplsvDp9gx7Bc7CTUvSDy0teTrcOpJSahmIwNiqggn1Y8hJmjePqyAHJcFFqENfyM/vhDlxrxe7VjXkud4/2dxflKfs36T1pyaCrhrjkgHMVqV/iSzC06EwxGt3UinfWUY+if+Tgby0f7XiZsNyKT00XuogC4ICDldaZSYOxc2tgOnsm9uliZmCuGka39BNIrOTmDdEI2iMDlsmFX5UV7jGHfvD3qvv70WoM/MQ+PT+xS6YvZaceCRd3QZDwdPJAaZeCi7v+STEDatiYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761072747; c=relaxed/relaxed;
	bh=R2asyJ/cLaWuSNW9+tzWUJ5uSC2MGcmo2Wj6QQW1kpA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Da3O2DThgpSKT2loQtSNWfIq7NuQ/OQnoLeB00WoMaf/SAvafnkWElVBNwyZfwf3O0aoTen94B9aoUuQstf+O97J40IRWjpRc+XQUekX05/5OEDG7P+ylu8ShhSk1YC+c/wxRbPCSaKackOj4xdJ29CDVcDk5sISkFgmXqWAH1MGbIlsPmWI3sMWCFSfpcE75uoQpAmXhPr9JbSkrmH6lZD+O3tNFV7JlK88cwF9TA/do1iaiZZLJb6Ndp+p8UwFn9c/Krm/l+wJbVVE8cMvw7JIwDeUTAQu9roFKzCx6N+VGxbGgbsauFr9I3xW5Gs1TaUd4Kwp+iloSolhND51hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LXSxSRno; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LXSxSRno;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crhHZ6f3Vz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 05:52:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4057D451B1;
	Tue, 21 Oct 2025 18:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD29C4CEF1;
	Tue, 21 Oct 2025 18:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761072744;
	bh=eqMg6jFMwqPdM5lNUE1xHVGWVzzrn6YTlyIqQLKmAQ8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=LXSxSRno4MvhDebRqnJuAX/apEAeV7rtpL4n4H6eOn9okI4zQpHymxXmEH37+RkFO
	 nNLV1Fd963qbVFT5vbRn4M2SQfu1zJQlItyPluGA9ht11WTC/kMd63q3ETd3eGyepD
	 L1mzUh17DTBvBVcgNCTVW2fPtcDyUPCG8/UUvKIro2E2UFMkF+92WKCiqQ44D3cOBv
	 AATuKvNSDRwHoflh8PDAvkrOOH9j9ODn7H4+rc/+dSGa62ewOUwDIT+gqgCU3J/au5
	 e1mmfV3mVGBwL/BbkkYXNirIkEb1IG2CxINRPxWS0wl2pn03shA4wh7741f+VDaDte
	 quHK597YDX13A==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20251021090933.3470495-1-shengjiu.wang@nxp.com>
References: <20251021090933.3470495-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_aud2htx: add IEC958_SUBFRAME_LE format in
 supported list
Message-Id: <176107274177.196841.9804075994703178765.b4-ty@kernel.org>
Date: Tue, 21 Oct 2025 19:52:21 +0100
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
X-Mailer: b4 0.15-dev-2a268
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 21 Oct 2025 17:09:33 +0800, Shengjiu Wang wrote:
> Besides S24_LE and S32_LE, the IEC958_SUBFRAME_LE format is also
> supported by this HDMI audio interface.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_aud2htx: add IEC958_SUBFRAME_LE format in supported list
      commit: ecba655bf54a661ffe078856cd8dbc898270e4b5

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


