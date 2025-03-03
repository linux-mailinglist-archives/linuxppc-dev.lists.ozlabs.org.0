Return-Path: <linuxppc-dev+bounces-6645-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF17A4C131
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 14:04:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5zYG5Z8Gz30WB;
	Tue,  4 Mar 2025 00:04:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741007074;
	cv=none; b=DZitCCn4mTvvaI3wXBC3xoFAAeIDpe/kqzo8BuHo6kcmBonhAhkziCuyjKKP++X+PrNnifNudmaMw2hDA90VsHI+wBuKtSbMgIUa8UP5ztEm9rPMxB7y5pkH/WvWGgcbKVQKiY7AwYU/Zr4SGIbrwVaM2xXMmNTCJf1aSBqT8/y6XndSzHeLI+wRFqbCR+jZMH/xyY49kA5i06yD2Ep9kzQ2GbWAOFxlLO9SyDLybZpv/SCQzKc+RzfDwOV2cf/v3CyldRO6It+BUxs4ryuHUYU3R/Z4N00EzoGrQ2qhDabfsGAJAsUryxYTvVr518ezqyolqzXdABid+dHo1ttnJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741007074; c=relaxed/relaxed;
	bh=ytQRahAGQVSCO159XmRgKkX3+/eMGItsL9NJsSQf7Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZD50eri+CedQt8rb8I17qmejMEJTIHDi83nSZyebwad70hiFn1b0g8ryCDIz4UaUNJtP3oi5EYkzz4hW4hdWTpqdgV8SQX5G/qapD/fAOD6Bck3G2q+PR9C3m1/3SEegSHTXd48R2j8GDhFSbem8xomFaexuDS9OVYtuGnSQ+TLmsktD7gwuzFrgGnc4VR5tDy62h84dSpP20Qda4S7Oz2PrYKjdY5gDDVgUaNaXpuRZjUbcYm7Owfu/zkhjnDYCvWdYdUwf6topcjeAcTlbPnOGO+63sm3b1W73E5aC/seUPT/ji45S8rQshP4fYFK+AXxRJiRekiTvVQjZPts9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GgPH6cRE; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GgPH6cRE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5zYG1CBVz30VZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 00:04:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8B5E5C5876;
	Mon,  3 Mar 2025 13:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FA3C4CEE6;
	Mon,  3 Mar 2025 13:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741007072;
	bh=MJ1eWiZF1zNkmxOw5SUe/EJwnqJlYPHJ1CHEJLkZExk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgPH6cRERh1HMBBuEM2ytiHoxcEIyQ8WHaLHvhXD58EXv078Ru8hCw/x65dwmTBP4
	 FnFXmWLTsOU2oI4ghoXEh/wKW6v0/L48r4z67qBYN6A3oQgbrEwpSlrM8fUdueHRWm
	 7i6xuao04uAPUVg51r9+Da3fmNWu0+Ba3hDEJWB9NoTvSSbXmsmKSHfXjPJwj5sCQS
	 ZVwRqbXN2/6xym99sAr/ifjoVnDgXVFKOvgx2jKJ/+wu1R4g/glb6BqWV38wtbCTVR
	 d+vB32cooXYt02OsyvInT9tfzxmHwfMrTt3bBR5MRTAwQuAO9dD2pTBBP6zar3cWI4
	 yIDrZdw9lr/ow==
Date: Mon, 3 Mar 2025 07:04:30 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: tiwai@suse.com, Xiubo.Lee@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
	krzk+dt@kernel.org, broonie@kernel.org, perex@perex.cz,
	shengjiu.wang@gmail.com, linuxppc-dev@lists.ozlabs.org,
	conor+dt@kernel.org, nicoleotsuka@gmail.com, festevam@gmail.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: dt-bindings: fsl,audmix: make 'dais' property
 to be optional
Message-ID: <174100706937.1425909.3592597206519179445.robh@kernel.org>
References: <20250226100508.2352568-1-shengjiu.wang@nxp.com>
 <20250226100508.2352568-4-shengjiu.wang@nxp.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226100508.2352568-4-shengjiu.wang@nxp.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Wed, 26 Feb 2025 18:05:07 +0800, Shengjiu Wang wrote:
> Make 'dais' property to be optional. When there is no 'dais' property,
> driver won't register the card, dts should have audio graph card node
> for linking this device.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,audmix.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


