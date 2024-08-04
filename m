Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C0946F7B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Aug 2024 17:07:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b=R4AuMlJc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WcNGt2zFGz3c3l
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 01:07:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b=R4AuMlJc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yeah.net (client-ip=220.197.32.18; helo=mail-m16.yeah.net; envelope-from=shawnguo2@yeah.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 1254 seconds by postgrey-1.37 at boromir; Mon, 05 Aug 2024 01:07:10 AEST
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WcNG65KXvz30TF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2024 01:07:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=2Q94fzLl3lSmFdIfJpIE1h4MlKx0ywkHDPte+ksg2FI=;
	b=R4AuMlJcBZ8UfBtIXyM2Bw2P0p6SKG9SiSYXTbCUoAx4Uznm/YB7hXx/T54ncj
	kPeOmH53nbbkTVc2XStCCqnT40Ba0qEr0p8NOeTIhknnLGj4w6n08yXI/DULNBgy
	PEiVC+3Izg70MuT4/Raqr6jpQHlb0UiBjyv5uUvjfdW1k=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXnyCvkK9mrxa9AQ--.57464S3;
	Sun, 04 Aug 2024 22:31:13 +0800 (CST)
Date: Sun, 4 Aug 2024 22:31:11 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: Re: [PATCH v6 6/7] arm64: dts: imx8m: update spdif sound card node
 properties
Message-ID: <Zq+QrxKFb3U1IEv/@dragon>
References: <20240627083104.123357-1-elinor.montmasson@savoirfairelinux.com>
 <20240627083104.123357-7-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627083104.123357-7-elinor.montmasson@savoirfairelinux.com>
X-CM-TRANSID: Mc8vCgCXnyCvkK9mrxa9AQ--.57464S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxuryfAryfAFW7Wr45XFW8WFg_yoW7JF47pa
	1vkFZ7Zr1xG3WIy345XF40v3s3Aa4rGFs09r17try8trs8Zry8twn7Krn5ur4UZr1Sqw4S
	gF1DZFy8Wrn0qaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbrcfUUUUU=
X-Originating-IP: [117.62.10.86]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQoxZWavY9tYNAAAsS
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
Cc: imx@lists.linux.dev, alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 27, 2024 at 10:31:03AM +0200, Elinor Montmasson wrote:
> The merge of imx-spdif driver into fsl-asoc-card brought
> new DT properties that can be used with the "fsl,imx-audio-spdif"
> compatible:
> * The "spdif-controller" property from imx-spdif is named "audio-cpu"
>   in fsl-asoc-card.
> * fsl-asoc-card uses codecs explicitly declared in DT
>   with "audio-codec".
>   With an S/PDIF, codec drivers spdif_transmitter and
>   spdif_receiver should be used.
>   Driver imx-spdif used instead the dummy codec and a pair of
>   boolean properties, "spdif-in" and "spdif-out".
> 
> While backward compatibility is kept to support properties
> "spdif-controller", "spdif-in" and "spdif-out", using new properties has
> several benefits:
> * "audio-cpu" and "audio-codec" are more generic names reflecting
>   that the fsl-asoc-card driver supports multiple hardware.
>   They are properties already used by devices using the
>   fsl-asoc-card driver.
>   They are also similar to properties of simple-card: "cpu" and "codec".
> * "spdif-in" and "spdif-out" imply the use of the dummy codec in the
>   driver. However, there are already two codec drivers for the S/PDIF,
>   spdif_transmitter and spdif_receiver.
>   It is better to declare S/PDIF Tx and Rx devices in a DT, and then
>   reference them with "audio-codec" than using the dummy codec.
> 
> For those reasons, this commit updates in-tree DTs to use the new
> properties:
> * Rename "spdif-controller" property to "audio-cpu".
> * Declare S/PDIF transmitter and/or receiver devices, and use them with
>   the "audio-codec" property instead of "spdif-out" and/or "spdif-in".
> 
> These modifications were tested only on an imx8mn-evk board.
> 
> Note that out-of-tree and old DTs are still supported.
> 
> Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 15 +++++++++---
>  arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 15 +++++++++---
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts  | 24 +++++++++++++++----
>  3 files changed, 43 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> index 90d1901df2b1..348855a41852 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> @@ -180,12 +180,21 @@ cpu {
>  		};
>  	};
>  
> +	spdif_out: spdif-out {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";

It's recommended that the property list begins with 'compatible'.  Could
you flip them?

Shawn

> +	};
> +
> +	spdif_in: spdif-in {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dir";
> +	};
> +
>  	sound-spdif {
>  		compatible = "fsl,imx-audio-spdif";
>  		model = "imx-spdif";
> -		spdif-controller = <&spdif1>;
> -		spdif-out;
> -		spdif-in;
> +		audio-cpu = <&spdif1>;
> +		audio-codec = <&spdif_out>, <&spdif_in>;
>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> index 9e0259ddf4bc..6a47e09703a7 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> @@ -124,12 +124,21 @@ sound-wm8524 {
>  			"Line Out Jack", "LINEVOUTR";
>  	};
>  
> +	spdif_out: spdif-out {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +	};
> +
> +	spdif_in: spdif-in {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dir";
> +	};
> +
>  	sound-spdif {
>  		compatible = "fsl,imx-audio-spdif";
>  		model = "imx-spdif";
> -		spdif-controller = <&spdif1>;
> -		spdif-out;
> -		spdif-in;
> +		audio-cpu = <&spdif1>;
> +		audio-codec = <&spdif_out>, <&spdif_in>;
>  	};
>  
>  	sound-micfil {
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> index 7507548cdb16..b953865f0b46 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> @@ -125,19 +125,33 @@ link_codec: simple-audio-card,codec {
>  		};
>  	};
>  
> +	spdif_out: spdif-out {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +	};
> +
> +	spdif_in: spdif-in {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dir";
> +	};
> +
>  	sound-spdif {
>  		compatible = "fsl,imx-audio-spdif";
>  		model = "imx-spdif";
> -		spdif-controller = <&spdif1>;
> -		spdif-out;
> -		spdif-in;
> +		audio-cpu = <&spdif1>;
> +		audio-codec = <&spdif_out>, <&spdif_in>;
> +	};
> +
> +	hdmi_arc_in: hdmi-arc-in {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dir";
>  	};
>  
>  	sound-hdmi-arc {
>  		compatible = "fsl,imx-audio-spdif";
>  		model = "imx-hdmi-arc";
> -		spdif-controller = <&spdif2>;
> -		spdif-in;
> +		audio-cpu = <&spdif2>;
> +		audio-codec = <&hdmi_arc_in>;
>  	};
>  };
>  
> -- 
> 2.34.1
> 

