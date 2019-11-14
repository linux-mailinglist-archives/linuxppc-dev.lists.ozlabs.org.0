Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CAEFD02B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 22:14:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DZ474TNgzF7rf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 08:14:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DZ241KVrzF5QQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 08:12:41 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id b16so6144565otk.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 13:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zvJ3vYdB8JByuq1iptWHcxe6mCz9VbGiKAhz94z7Jjs=;
 b=bM2jwTnEW0uwM9J1werBMJdR/wDzIs2fy7PODFz2Y751ymJDpKNlH+eqHNxNhYWalL
 4gHXfNIGFkAVMrdgWGKELt9Y7J7MfT1T/j5oNvyUfnTou0gx7wu9CksbYDHqjMfbzKeB
 FCa4f8vf8wy1ziavMDOJ0rV8de5rleV86i4X8I3OsbWyu3NWwy5ZgEcR+unlAuKS35p7
 YOhbRvs3kXcWaN5xBfMCkQtv/7hg0t2X90fxh/T2GFOxVplODDKRs1nvdJgsPGyvG7DC
 J+0wIN7rjfaZfG0zBxX2lmDZgUOXCIQmdn4xDIb3bBumCy0ugwO2NdL+cuw9ReCzvnea
 /fGg==
X-Gm-Message-State: APjAAAX60bMQKSSRkJnLWAd5kUY+rhxROQC0b7CzhnPAjBCSJXqHLxrk
 FNZn9O9Ay/fgKFiaB1gXtg==
X-Google-Smtp-Source: APXvYqz8E8q2ODWg7w9RAtKtDXpxQsWSKNIjjna819fVptPrU8ODwyU1Lli9pn6nDszkJRnxfqhL5A==
X-Received: by 2002:a9d:7e8a:: with SMTP id m10mr9243800otp.180.1573765959077; 
 Thu, 14 Nov 2019 13:12:39 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q3sm2171825oti.49.2019.11.14.13.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 13:12:38 -0800 (PST)
Date: Thu, 14 Nov 2019 15:12:37 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V3 1/2] ASoC: dt-bindings: fsl_asrc: add compatible
 string for imx8qm
Message-ID: <20191114211237.GA25375@bogus>
References: <b1c922b3496020f611ecd6ea27d262369646d830.1573462647.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1c922b3496020f611ecd6ea27d262369646d830.1573462647.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 11, 2019 at 05:18:22PM +0800, Shengjiu Wang wrote:
> Add compatible string "fsl,imx8qm-asrc" for imx8qm platform.
> 
> There are two asrc modules in imx8qm, the clock mapping is
> different for each other, so add new property "fsl,asrc-clk-map"
> to distinguish them.

What's the clock mapping?


> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2
> -none
> 
> changes in v3
> -use only one compatible string "fsl,imx8qm-asrc",
> -add new property "fsl,asrc-clk-map".
> 
>  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> index 1d4d9f938689..02edab7cf3e0 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> @@ -8,7 +8,8 @@ three substreams within totally 10 channels.
>  
>  Required properties:
>  
> -  - compatible		: Contains "fsl,imx35-asrc" or "fsl,imx53-asrc".
> +  - compatible		: Contains "fsl,imx35-asrc", "fsl,imx53-asrc",
> +			  "fsl,imx8qm-asrc".
>  
>    - reg			: Offset and length of the register set for the device.
>  
> @@ -35,6 +36,13 @@ Required properties:
>  
>     - fsl,asrc-width	: Defines a mutual sample width used by DPCM Back Ends.
>  
> +   - fsl,asrc-clk-map   : Defines clock map used in driver. which is required
> +			  by imx8qm/imx8qxp platform
> +			  <0> - select the map for asrc0 in imx8qm
> +			  <1> - select the map for asrc1 in imx8qm
> +			  <2> - select the map for asrc0 in imx8qxp
> +			  <3> - select the map for asrc1 in imx8qxp

Is this 4 modes of the h/w or just selecting 1 of 4 settings defined in 
the driver? How does one decide? This seems strange.

imx8qxp should perhaps be a separate compatible. Then you only need 1 of 
2 modes...

Rob
