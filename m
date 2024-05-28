Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 1513E8D20B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 17:46:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mQ7ugF7o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpcDr43xhz79sx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 01:41:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mQ7ugF7o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpcD54yq5z79Rr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 01:40:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3775CCE1140;
	Tue, 28 May 2024 15:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4197BC3277B;
	Tue, 28 May 2024 15:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716910835;
	bh=+ka7lAt0AaEKQOhVhdJkYL8d3RJmgi15bjbIH1lkuVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mQ7ugF7oci9zQMotueSFnxOlJdgSRiTo1pl+/I7Io2p/oLGt1ADaaVRU77uZxsPuH
	 rtTv+4iuxxOMr2QFWMz+5rPxQein+0RRcvFeJ6GQHxOdY8q69i0M51lcTVSE4BLsCQ
	 pXnxFVWjEU25VKXaxQSE4toPW/4jrKA/047xXTq9WfVvCi/aey5IGZiQCss5yDqNBt
	 jFH0Tt5U6Vmv/8bVtmcnFHzJApiGDaxCtxLX69rkaD775rLU458uIMahHRCr4meZ9S
	 zgLhUSYIy19b6eoSnA2k82xb2gcQd6LfbrY8S9iyDkpeIFSKLGvw+KRr1QSkTpUu5U
	 P7TIJXaOYZuBw==
Date: Tue, 28 May 2024 10:40:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl,mqs: Add i.MX95 platform
 support
Message-ID: <171691083154.676898.17539558632778396948.robh@kernel.org>
References: <1716347305-18457-1-git-send-email-shengjiu.wang@nxp.com>
 <1716347305-18457-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1716347305-18457-2-git-send-email-shengjiu.wang@nxp.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, nicoleotsuka@gmail.com, robh+dt@kernel.org, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Wed, 22 May 2024 11:08:24 +0800, Shengjiu Wang wrote:
> There are two MQS instances on the i.MX95 platform.
> The definition of bit positions in the control register are
> different. In order to support these MQS modules, define
> two compatible strings to distinguish them.
> 
> As one instance is in the always-on domain, another is in the
> net controller domain, so the compatible strings are
> "fsl,imx95-aonmix-mqs", "fsl,imx95-netcmix-mqs".
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,mqs.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

