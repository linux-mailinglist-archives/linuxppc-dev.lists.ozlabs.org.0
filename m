Return-Path: <linuxppc-dev+bounces-2988-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA38F9C0AC2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 17:05:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkn2y34bdz3bn4;
	Fri,  8 Nov 2024 03:04:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730995498;
	cv=none; b=WNCDDLVEOa4lZYlCbBD9kKL0EFKY4n7s341BLhsOaFr/M4n7Xz/rCg++3KldTWv3QP3rg91ns/e/h4ITl/iwBppYAiVHb/Cwxj/WdAYRdRiwX7R3J/edTUnl9cAw+6FZsZX93gSxBjPsE2aHzv9XqvwgYGxaM/5wx+QmM+oyeJL2XWi6Y98Xsw3sA4yWnMTGA5UkK1hWNaVEnPOSpeyhOEBBvMwo57fEd+232nef8fQmK/ywvoovYJKk+Exgq5doUMNPX/3KQw9W1VYBRCmSn5E9QeAUxmFQBldJ3LCuOJlDSVpRzvf08MYbwwICnTNLHJetKcswVC3ytMEgxf0UVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730995498; c=relaxed/relaxed;
	bh=bIHIHPfH6OgeKiARQYIOZs8H5AMrRFipvkUG3E4Iwp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktuZ+4MfwSR09Bh1xJ7sUo9az/f8kF0CESSKXQICLfN/7MYUoUJXd2FwrhQAyNvJLkt2cA5dQPdM3r6T1vXy9lSlkUDul0F/nns1AdU31PvLNlszd3vJxpTRdcbC11F5jpttANHJUs2VSik554yRpYwyeBQ5mhWMBHYPsl40ml40w5P8dkFPIRJeKm4JDhrZzr6SRk6U4RL41rEYC+8pYM3zSIBgcNxkY0Md+vuJ43YEvYwpjYygBIB4GIOF3H7msKbhErxn7ofaTfmcGuoHnptX1aeXze09raEX8V9vE55SjFHBc2JrIDi87E5fiL6hDacQTQAcIOzFghlntqqxdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RHHwuF4f; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RHHwuF4f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xkn2x0sK9z3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 03:04:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A9B0BA4481F;
	Thu,  7 Nov 2024 16:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C94C4CECD;
	Thu,  7 Nov 2024 16:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730995493;
	bh=++Ve2R0sTl3/Af3ywbFC4oo8hw4a8zRpz8+lgtmrgu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RHHwuF4fxfRW3tQjxVEZ4VJfnCvaN1TO837iTx6nKNtwcVYVhMgPP2hylh24GcwL4
	 a6i0fd0+GhfSvKYhOIdoltsV0KhycO6jLLedxhAPHSjvC95vZQL++eY42jjVwrgiGt
	 YCAkX6I5DoUZUY5usnPt8tbbPqCfjJP4iJXf+rN6lvA4qnu75YO9vh5Jd+u4lcICag
	 xT0CrlMrtiGM7uU7lnm1/HhWRrgdZ5YPDcwmpBpJZRZhY1Nv0EB/g8r3KKlOOl/C+i
	 qYSWy9OEcAV0RTMlHQglL1+PAzLO1mOGd+4WDzY//q4094mwQ9R+RvEw9L7kCCsK5r
	 dsPqx893IaLPQ==
Date: Thu, 7 Nov 2024 10:04:51 -0600
From: Rob Herring <robh@kernel.org>
To: Abhinav Saxena <xandfury@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: Fix repeated words
Message-ID: <20241107160451.GB2770783-robh@kernel.org>
References: <20241107061124.105930-1-xandfury@gmail.com>
 <20241107061124.105930-2-xandfury@gmail.com>
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
In-Reply-To: <20241107061124.105930-2-xandfury@gmail.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 06, 2024 at 11:11:23PM -0700, Abhinav Saxena wrote:
> Fix unintentional word repetitions in devicetree binding documentation:
> - usb.txt: Fix repeated "two"
> - mvebu-devbus.txt: Fix repeated "from"
> - gpio.txt: Fix repeated "Both"
> - pinctrl-bindings.txt: Fix repeated "device"
> - cavium/bootbus.txt: Fix repeated "one"
> 
> These issues were identified using the checkpatch.pl script.
> 
> Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt                 | 2 +-

This and...

>  .../devicetree/bindings/memory-controllers/mvebu-devbus.txt     | 2 +-
>  Documentation/devicetree/bindings/mips/cavium/bootbus.txt       | 2 +-
>  Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt  | 2 +-

...this I'll take. The others need to be converted to schema.

>  Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt     | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index d82c32217fff..530420475a4f 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -304,7 +304,7 @@ pins 50..69.
>  It is also possible to use pin groups for gpio ranges when pin groups are the
>  easiest and most convenient mapping.
>  
> -Both both <pinctrl-base> and <count> must set to 0 when using named pin groups
> +Both <pinctrl-base> and <count> must set to 0 when using named pin groups
>  names.
>  
>  The property gpio-ranges-group-names must contain exactly one string for each
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
> index 8b9388cc1ccc..1983d7eabd2b 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
> @@ -43,7 +43,7 @@ Read parameters:
>   - devbus,bus-width:    Defines the bus width, in bits (e.g. <16>).
>                          Mandatory, except if devbus,keep-config is used.
>  
> - - devbus,badr-skew-ps: Defines the time delay from from A[2:0] toggle,
> + - devbus,badr-skew-ps: Defines the time delay from A[2:0] toggle,
>                          to read data sample. This parameter is useful for
>                          synchronous pipelined devices, where the address
>                          precedes the read data by one or two cycles.
> diff --git a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
> index 6581478225a2..1bc655d285ce 100644
> --- a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
> +++ b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
> @@ -15,7 +15,7 @@ Properties:
>  
>  - #size-cells: Must be <1>.
>  
> -- ranges: There must be one one triplet of (child-bus-address,
> +- ranges: There must be one triplet of (child-bus-address,
>    parent-bus-address, length) for each active chip select.  If the
>    length element for any triplet is zero, the chip select is disabled,
>    making it inactive.
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> index 6904072d3944..500b76ba2ab3 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> @@ -18,7 +18,7 @@ states. The number and names of those states is defined by the client device's
>  own binding.
>  
>  The common pinctrl bindings defined in this file provide an infrastructure
> -for client device device tree nodes to map those state names to the pin
> +for client device tree nodes to map those state names to the pin

Actually I think this was correct. See "client device" used above. 
Maybe "client device Devicetree nodes" would be a bit clearer and use 
the right form of Devicetree.

Rob

