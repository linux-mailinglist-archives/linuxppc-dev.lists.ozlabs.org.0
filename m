Return-Path: <linuxppc-dev+bounces-6643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52034A4C129
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 14:03:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5zWn75pbz30W5;
	Tue,  4 Mar 2025 00:03:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741006997;
	cv=none; b=Lkvx8VopsyzEuQUgFNU5ztlLa4s6x1+geOFD7Ai3yS8yWgRyZUjfbuJPumsPwutXOS9n3B5AKpA4hDXZ9EZczpGsi4Gx7+L7Q9V4xZWv+esyf29wlCYtxQK7sxC35nDwW03C46UpntL4CjeUNwhBwy542K1S8PJKZ49yoNggJe8It9cuUjyb4++DzUSzR2sYs3IeXOzCQkbEJui0RTUmfJoK/zqO9WAntNbRmYBRDsfwptYNQ+Ea7sI6xaUgWXcTTce7iPbkw3rbCWaXF4fV7uyIRGw7WoaS3U/RZks0G61aIYXrJK8NtLFn2UkUTEquWvtfGSqZVBfzj9ILUlVTaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741006997; c=relaxed/relaxed;
	bh=vjU04JpOMtdNBA9/4I1BdSaS2kqSMDI0ttOV/OE/J70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbFeRyWuvImG9hGIIFr6W/is0F/IBDHG1SZI2nQm/IfH2z3MAW75iEZaoS3LVlawCLS4JgLPkoJpV9gCl7ZmG43E1GQWkXQCFyQj4SDiB+mh0TS/sBILH7TUav88XrAmLmlpZ0SYTezZ0dVfog9XQVnrcopBBQnm6B/JxlmCQ6U3ZGtjng6V3Wv+kSfA+RBvE/gvfqcDk2pTvA1I2F4Qp6P7pkRaKvJCWvLZSb6Jki2CFH6tol/+9nAjjpRc7PGPkT+/zl8meeu1l4S/ySeW8k8tx7IDxshH+3hLWFOD6nyfdG/ycr1Y06gnE2jJ+vMB3vMCCDrxr52D4nf2rsGbDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z/sEm5fC; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z/sEm5fC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5zWn2jZzz30VZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 00:03:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63E465C5886;
	Mon,  3 Mar 2025 13:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B335BC4CED6;
	Mon,  3 Mar 2025 13:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741006994;
	bh=oSR/KHjI9MSt0N2w8+L2Fx68vorquw7bUIpd7Zjxu6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/sEm5fCwsRHugQtLNJsfW5yPPUlDiCwJa4NkvnByLNoMfQhw0BvsRfgKtIHNQGHc
	 tSMD0zD8Tdo3b5qweXFYRAXreJXTW9+Bb1QDiAyJCI+MpFf5cJohYXBIG+SWY3GXTd
	 ENnE8u+b9iRvuUHp0A9+nivyYUvvsLZq5MEpfDBWPxJtn/UnUSW5ZPv/LLJ/Q/4L2f
	 QoTG+DCpcqSm1R4BGUCN+8sYyqIu/xTZPM5oMZrT63m1DylnVlsjxoPDDwVscE3Sff
	 q7Ouknnsio+E4OUH092C60Zd8t8cUPssNpCMvX3ZHMsEMj1ZBvQTgdd63IHRXM7e64
	 sLBUOcBgvb3iw==
Date: Mon, 3 Mar 2025 07:03:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, broonie@kernel.org,
	nicoleotsuka@gmail.com, krzk+dt@kernel.org, festevam@gmail.com,
	linux-sound@vger.kernel.org, lgirdwood@gmail.com,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, perex@perex.cz, conor+dt@kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: fsl,sai: Document audio graph port
Message-ID: <174100699235.1416596.7740734064527505113.robh@kernel.org>
References: <20250226100508.2352568-1-shengjiu.wang@nxp.com>
 <20250226100508.2352568-2-shengjiu.wang@nxp.com>
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
In-Reply-To: <20250226100508.2352568-2-shengjiu.wang@nxp.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Wed, 26 Feb 2025 18:05:05 +0800, Shengjiu Wang wrote:
> This device can be used in conjunction with audio-graph-card to provide
> an endpoint for binding with the other side of the audio link.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,sai.yaml    | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


