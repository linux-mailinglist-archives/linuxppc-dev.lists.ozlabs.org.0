Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D078A37D415
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 22:07:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgQmj3klPz3bnS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 06:07:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.180;
 helo=mail-oi1-f180.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgQmJ2zcBz2yRW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 06:06:38 +1000 (AEST)
Received: by mail-oi1-f180.google.com with SMTP id c3so23334313oic.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 13:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QZOu937T06FGYysrX40DfRIEifPnkgP2wpT5ChbrOLM=;
 b=D8RbgZIjk5k9OkQs+dXbjwsxmQq8E3wnmZFL0+XNtsYPx7zLDJhUhhC6dIXW9a8sQF
 YBTvhVLDlkdDcg7I4IO9k1r4Pfz9he08ZqAN5M9MeLk0R1fCOKyDcQnThQwrQPolNzQC
 DE/K/6LgelohPXxR0XlDMvbQ/LHF/0ofBWCueDzX+viMrkMLKiN1tmTHy1au3lRZY6Cb
 i8ha/gJwYRhTj/Zh8AT9YuFJkZa3lMolf58K0pRWuBXdajd061dzziurQibL/nGdDuJz
 0o+bxfwkknDKC5QDwIPKQG+aFnM6Z6XNkji+qpPt1B0WdcCFfk+hF6Sp5Ia9jg/wvpAP
 /FIQ==
X-Gm-Message-State: AOAM531JntVP5DMaecjNF0w/opNPbZBIuXSALvLswkiCGf7SKOU4/dto
 M3cW0DKt2DUhVONmEUFaMQ==
X-Google-Smtp-Source: ABdhPJyFestwfEyHgdtvQESLKDKYdJEwVqw5rAmNlfsvq9xl609Ay/5t03I4TO2cGO9CWGnLqGNXZg==
X-Received: by 2002:a05:6808:561:: with SMTP id j1mr189039oig.24.1620849994987; 
 Wed, 12 May 2021 13:06:34 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d19sm172127oti.57.2021.05.12.13.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 13:06:34 -0700 (PDT)
Received: (nullmailer pid 2429755 invoked by uid 1000);
 Tue, 11 May 2021 19:00:57 -0000
Date: Tue, 11 May 2021 14:00:57 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: imx-akcodec: Add binding doc
 for akcodec machine driver
Message-ID: <20210511190057.GA2416585@robh.at.kernel.org>
References: <1620630441-14358-1-git-send-email-shengjiu.wang@nxp.com>
 <1620630441-14358-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620630441-14358-2-git-send-email-shengjiu.wang@nxp.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com,
 broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, perex@perex.cz,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 10, 2021 at 03:07:21PM +0800, Shengjiu Wang wrote:
> Imx-akcodec is a new added machine driver for supporting
> ak4458/ak5558/ak5552/ak4497 codec on i.MX platforms.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2:
> - update doc accoring to Rob's comment, use the common porperties.
> 
>  .../bindings/sound/imx-audio-akcodec.yaml     | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> new file mode 100644
> index 000000000000..0812c4779b59
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/imx-audio-akcodec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX audio complex with AK4458/AK5558/AK5552/AK4497 codec
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mq-audio-akcodec
> +      - fsl,imx-audio-akcodec

We gone from individual codecs to a family of codecs. Is there something 
specific for the machine driver about this set of codecs? Why can't it 
be *any* codec?

> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source. Valid names could be power supplies,
> +      MicBias of codec and the jacks on the board.
> +
> +patternProperties:
> +  ".*-dai-link$":
> +    description:
> +      Each subnode represents a dai link. Subnodes of each dai links would be
> +      cpu/codec dais.
> +
> +    type: object
> +
> +    properties:
> +      link-name:
> +        description: Indicates dai-link name and PCM stream name.
> +        $ref: /schemas/types.yaml#/definitions/string
> +        maxItems: 1
> +
> +      format:
> +        description: audio format.
> +        items:
> +          enum:
> +            - i2s
> +            - dsp_b
> +
> +      cpu:
> +        description: Holds subnode which indicates cpu dai.
> +        type: object
> +        properties:
> +          sound-dai: true
> +
> +      codec:
> +        description: Holds subnode which indicates codec dai.
> +        type: object
> +        properties:
> +          sound-dai: true
> +
> +    required:
> +      - link-name
> +      - cpu
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - model
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound-ak4458 {
> +        compatible = "fsl,imx-audio-akcodec";
> +        model = "ak4458-audio";
> +        pri-dai-link {
> +            link-name = "akcodec";
> +            format = "i2s";
> +            cpu {
> +                 sound-dai = <&sai1>;
> +            };
> +            codec {
> +                 sound-dai = <&ak4458_1>, <&ak4458_2>;
> +            };
> +        };
> +        fe-dai-link {
> +            link-name = "HiFi-ASRC-FE";
> +            format = "i2s";
> +            cpu {
> +                sound-dai = <&easrc>;
> +            };
> +        };
> +        be-dai-link {
> +            link-name = "HiFi-ASRC-BE";
> +            format = "dsp_b";
> +            cpu {
> +                sound-dai = <&sai1>;
> +            };
> +            codec {
> +                sound-dai = <&ak4458_1>, <&ak4458_2>;
> +            };
> +        };
> +    };
> -- 
> 2.27.0
> 
