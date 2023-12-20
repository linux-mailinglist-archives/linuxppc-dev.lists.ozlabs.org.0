Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F2381A91B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Dec 2023 23:26:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ix6Sr9v7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwSpZ0l6Yz3cX3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 09:26:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ix6Sr9v7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwSnd4qJ0z2xcp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 09:25:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BD2CACE1819;
	Wed, 20 Dec 2023 22:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F192C433C8;
	Wed, 20 Dec 2023 22:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703111153;
	bh=1W+/BlCYRBWNRRrkM97ARP2nwR2lz+YRFgCUZtpqkN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ix6Sr9v7aw0PTbt2XOtlQZh/iXeGLJYw1/NpnOXYP78dPf5N30NFmShIzimCfTOei
	 +4Gl7fC7H5o6pjGsQzBNxS7rto/V4+rmBHZUFeoUcaCFyXSPdBEaIT/kJdh7BlcpxU
	 xLyYUwauttasDqPy9pz4cj52MVaA8NZqwtG4/DrTEzswiCp5qxF8VLBspJwdhvj1JJ
	 omAOry4wDGpkQc3VIgkMBUr+XZ2uUuZhkFm/Kp4NitzqwiU0pwyphpbMyaSzEGqvxB
	 DI2urkt2cLKypkUwnDmxiwXbUoqxoujasKuOONvCn1vkFFBuTn5fv2tmjTUApwniVq
	 6gPf/UbsMRO0Q==
Received: (nullmailer pid 1236168 invoked by uid 1000);
	Wed, 20 Dec 2023 22:25:50 -0000
Date: Wed, 20 Dec 2023 16:25:50 -0600
From: Rob Herring <robh@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: Re: [PATCHv3 RESEND 10/10] ASoC: dt-bindings: fsl-asoc-card: add
 compatible for generic codec
Message-ID: <20231220222550.GA1232936-robh@kernel.org>
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
 <20231218124058.2047167-11-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218124058.2047167-11-elinor.montmasson@savoirfairelinux.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 18, 2023 at 01:40:58PM +0100, Elinor Montmasson wrote:
> Add documentation about new dts bindings following new support
> for compatible "fsl,imx-audio-generic".
> 
> Some CPU DAI don't require a real audio codec. The new compatible
> "fsl,imx-audio-generic" allows using the driver with codec drivers
> SPDIF DIT and SPDIF DIR as dummy codecs.
> It also allows using not pre-configured audio codecs which
> don't require specific control through a codec driver.
> 
> The new dts properties give the possibility to set some parameters
> about the CPU DAI usually set through the codec configuration.
> 
> Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
> Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
> ---
>  .../bindings/sound/fsl-asoc-card.txt          | 28 ++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
> index 4e8dbc5abfd1..f137ef2154e3 100644
> --- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
> @@ -17,6 +17,9 @@ Note: The card is initially designed for those sound cards who use AC'97, I2S
>        and PCM DAI formats. However, it'll be also possible to support those non
>        AC'97/I2S/PCM type sound cards, such as S/PDIF audio and HDMI audio, as
>        long as the driver has been properly upgraded.
> +      To use CPU DAIs that do not require a codec such as an S/PDIF controller,
> +      or to use a DAI to output or capture raw I2S/TDM data, you can
> +      use the compatible "fsl,imx-audio-generic".
>  
>  
>  The compatible list for this generic sound card currently:
> @@ -48,6 +51,8 @@ The compatible list for this generic sound card currently:
>  
>   "fsl,imx-audio-nau8822"
>  
> + "fsl,imx-audio-generic"
> +
>  Required properties:
>  
>    - compatible		: Contains one of entries in the compatible list.
> @@ -56,7 +61,11 @@ Required properties:
>  
>    - audio-cpu		: The phandle of an CPU DAI controller
>  
> -  - audio-codec		: The phandle of an audio codec
> +  - audio-codec		: The phandle of an audio codec.
> +			  If using the "fsl,imx-audio-generic" compatible,
> +			  give instead a pair of phandles with the
> +			  spdif_transmitter first (driver SPDIF DIT) and the
> +			  spdif_receiver second (driver SPDIF DIR).
>  
>  Optional properties:
>  
> @@ -87,6 +96,23 @@ Optional properties:
>    - frame-inversion	: dai-link uses frame clock inversion, for details see simple-card.yaml.
>    - bitclock-inversion	: dai-link uses bit clock inversion, for details see simple-card.yaml.
>    - mclk-id		: main clock id, specific for each card configuration.
> +			  For multi-codec configurations, an array of ids can be
> +			  given, one for each codec.
> +
> +Optional, relevant only with the "fsl,imx-audio-generic" compatible:
> +
> +  - cpu-slot-width	: Indicates a specific TDM slot width in bits.
> +  - cpu-slot-num	: Indicates a specific number of TDM slots per frame.

Pretty sure I've seen other bindings with TDM slot properties. A sign we 
need something common if we don't already have something.

> +
> +  - cpu-sysclk-freq-rx	: Frequency of the CPU DAI sys clock for Rx.
> +  - cpu-sysclk-freq-tx	: Frequency of the CPU DAI sys clock for Tx.
> +
> +  - cpu-sysclk-dir-rx-out	: Boolean property. Specifies sys clock direction
> +				  as 'out' on initialization for Rx.
> +				  If not set, default direction is 'in'.
> +  - cpu-sysclk-dir-tx-out	: Boolean property. Specifies sys clock direction
> +				  as 'out' on initialization for Tx.
> +				  If not set, default direction is 'in'.

Looks like clock stuff. Use the clock binding.

Rob
