Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1092D31732B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 23:18:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbZ0v6vbmzDwkT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 09:18:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.177;
 helo=mail-oi1-f177.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbYys3nnXzDvbt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 09:17:09 +1100 (AEDT)
Received: by mail-oi1-f177.google.com with SMTP id l19so3886679oih.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 14:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X/+AS1PnO/pIi25zgPnySrTJigYkK7rUzHnIa2wA10c=;
 b=hwos2Egri+l30jp9qCvLdipdGGt1wVd/x8f+9aAMoPYr2WyDLWcboQ7IS3fKlDf6Dj
 HDofCxazpnypKWXrdkmG/2wnLNfPQShItYMMBYzPklF7+2i5VeK5Pm/EeAbvA+BH4YcZ
 kyENPAWFhLgx3DWQbSCu3m7ma2qB2BzWZXNVB1NbbViJSAnLsJl7fwVDTTxcCpZk1VW1
 kYJuFJJ4x9UqmfD3+RNFntEUfJVyEKrkhl6gPmP8Og7AVe32wHTmPShHRqARzdDvbVLA
 We2QnIetqu9y0A84IVYl1Dy7H8eZGyRtBOZgN7wEXhj19tNUbVQ4Tztd827zbhEt4E/Z
 UZxQ==
X-Gm-Message-State: AOAM533GIrjk50xNMmIUG4Mc6W12CjX8LmeJhNItmo1cExHKHZAj36f7
 8qaUO2sklqrfA/l44U7iBQ==
X-Google-Smtp-Source: ABdhPJwBaK5/uRRp67UJ2r6hTbPKpERNoPUPShLujM3MmLo48Htw1DUx13FzI0PYRRUmqbkp9mKjSg==
X-Received: by 2002:aca:ab89:: with SMTP id u131mr818003oie.170.1612995426687; 
 Wed, 10 Feb 2021 14:17:06 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a20sm155592oid.47.2021.02.10.14.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:17:05 -0800 (PST)
Received: (nullmailer pid 2901206 invoked by uid 1000);
 Wed, 10 Feb 2021 22:17:04 -0000
Date: Wed, 10 Feb 2021 16:17:04 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: imx-rpmsg: Add binding doc for
 rpmsg machine driver
Message-ID: <20210210221704.GA2894134@robh.at.kernel.org>
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-8-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612693435-31418-8-git-send-email-shengjiu.wang@nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 broonie@kernel.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 07, 2021 at 06:23:55PM +0800, Shengjiu Wang wrote:
> Imx-rpmsg is a new added machine driver for supporting audio on Cortex-M
> core. The Cortex-M core will control the audio interface, DMA and audio
> codec, setup the pipeline, the audio driver on Cortex-A core side is just
> to communitcate with M core, it is a virtual sound card and don't touch
> the hardware.

I don't understand why there are 2 nodes for this other than you happen 
to want to split this into 2 Linux drivers. It's 1 h/w thing. 

> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../bindings/sound/imx-audio-rpmsg.yaml       | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml b/Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml
> new file mode 100644
> index 000000000000..b941aeb80678
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/imx-audio-rpmsg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX audio complex with rpmsg
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx-audio-rpmsg
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  audio-cpu:
> +    description: The phandle of an CPU DAI controller
> +
> +  rpmsg-out:
> +    description: |
> +      This is a boolean property. If present, the transmitting function
> +      will be enabled,
> +
> +  rpmsg-in:
> +    description: |
> +      This is a boolean property. If present, the receiving function
> +      will be enabled.
> +
> +required:
> +  - compatible
> +  - model
> +  - audio-cpu
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound-rpmsg {
> +        compatible = "fsl,imx-audio-rpmsg";
> +        model = "ak4497-audio";
> +        audio-cpu = <&rpmsg_audio>;
> +        rpmsg-out;
> +    };
> -- 
> 2.27.0
> 
