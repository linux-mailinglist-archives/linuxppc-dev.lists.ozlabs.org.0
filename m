Return-Path: <linuxppc-dev+bounces-6644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 182E9A4C12D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 14:04:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5zXn5Sthz30W7;
	Tue,  4 Mar 2025 00:04:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741007049;
	cv=none; b=LA8oD+Z79tO6mCNIlKDLJ4SSYyJSiFSXoiLqa5082qJZMtKIE40hIxVaJdedmAjB+jLODC+6/xvQslLhnLzOaT9hVzDqizHrUSjauNW0XYBGKBQz4CO/FU1fEvDtbq90Y0VIkrHQoUD1otDu7Erw5C6PYuFgvfdNuKWIEp1jYat8rTsDEq66Y6WR3nnj0h/XoJZQMQ1BjNYTj8Ot6ayWgRYCxqlaLhpo2DYG/1Y4indCAoZPhw/4eZSeoG5RP06/CsZO9igGCIKSg2YQyAYGHHwLt7jXy04uy1jXzltfu8Cpwg4shwlcqLTxjdfY1YF/X9eaMoH9zraPEyM5DUoYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741007049; c=relaxed/relaxed;
	bh=IMaOPh6vyf9pjRTlxSpAkNUTmyTxFaj/wWEqA4QJp8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXuh+4D6mcNwN0BiPb4b8wFxiuZ9ABltEhZ6cv03JoCLGXtKb3tacdIu2AmfNwcB2A98UsimdckgJ+5wfgVKGmKtMzoCQn1axa1ZVWS2GaUfb4iQZ4lyd4hQQa4NeJfrVCnwUi9LFKakmjTcyWNEdjx08PY0Tfi6Mf9hbo1IjKM7LXgd0GLZpxneKrDsM+5cisYhwN3Qn7+NxzaMn4VSfz0XdxFnJE7/TbJDF7WqAdKMssjsbupbW9n0pN4yrO/noxmlq84vPKP7TzqmKHd/gFfsuOinqC/tk+wBDav18DUJZtAq887sgUWhT+mhs0a3yR6cKPoQ3oSukjtQDcKV9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z12p8awD; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z12p8awD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5zXn161Gz30VZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 00:04:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 783695C572E;
	Mon,  3 Mar 2025 13:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C800CC4CED6;
	Mon,  3 Mar 2025 13:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741007047;
	bh=iyUoLSPXMiRrDuj1QjSG3Se/xMam/JZHpS5wjuiJGpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z12p8awDHjQe/xOPfCA3gI1tAXP8mLksekgMbbmPdzcdtitUwiV7Yyq2jcz4gS2V+
	 4BvijIr4YBpjkW6eWZIkZDi/d3r2DGNMfKyB953LdUDfV9qnjhoOeNMsTiEpIv83rX
	 XPeVzEL+WOCUtd1k6U4+U7Gm3bBr4KeEEcm90UZHK+WaKtxI7rG99ASlrWEUkI9gmE
	 CLEC/Jl8RBr6uMIwCmYGPk/MGoUcHP3Sh21gIlMXISziRl1H3xZtxvRmZokhKJwaqv
	 nZeGLy69SDMhNPdTjws2M6WROHYK4VCLfaEMmlw86KA7AJ7nR2/CSMOQLWIzSP0WkF
	 1a+l8nvRzV+Qg==
Date: Mon, 3 Mar 2025 07:04:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-kernel@vger.kernel.org, conor+dt@kernel.org, broonie@kernel.org,
	nicoleotsuka@gmail.com, tiwai@suse.com, linux-sound@vger.kernel.org,
	krzk+dt@kernel.org, linuxppc-dev@lists.ozlabs.org,
	shengjiu.wang@gmail.com, festevam@gmail.com, perex@perex.cz,
	devicetree@vger.kernel.org, Xiubo.Lee@gmail.com,
	lgirdwood@gmail.com
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: fsl,audmix: Document audio graph
 port
Message-ID: <174100704415.1424041.5644377914048631835.robh@kernel.org>
References: <20250226100508.2352568-1-shengjiu.wang@nxp.com>
 <20250226100508.2352568-3-shengjiu.wang@nxp.com>
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
In-Reply-To: <20250226100508.2352568-3-shengjiu.wang@nxp.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Wed, 26 Feb 2025 18:05:06 +0800, Shengjiu Wang wrote:
> This device can be used in conjunction with audio-graph-card to provide
> an endpoint for binding with the other side of the audio link.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,audmix.yaml | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


