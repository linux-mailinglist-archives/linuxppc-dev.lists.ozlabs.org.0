Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAA331E6DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 08:21:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh5k54rRfz3cHs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 18:21:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mdpH+6Fo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mdpH+6Fo; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh5jf4gB6z30Kx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 18:21:25 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id c1so769080qtc.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 23:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W4CuVJp6htN2y1/Vp8LtCaaMfaPH0Jo1ezQEtxgh7bk=;
 b=mdpH+6FobMXsdaZB85IHeW3r64Vs5Sg4rYLQ5bmOIOqagsYGgBIxrwD41jtF37xVZF
 BtJs+dLUNcu6JAbX1j9/qbszuIFb+yz8ZASbPKX3n89Fxf/rGShVkZWuBJBoV1a/qRKZ
 7N4Xfd/uaDo/51xC71PTE3rkOhCDmEcPCr+f5zHLqrMgICVf1fRFTzEY8XYaIJDNx6NL
 myjNbOtCm0jUeSJAyy4Uh47OoUEYGT/gUVX+24Iir1s6t1nRjUD2OLQGNHhqvzVxMrlh
 E3kqYoqHSH3tjsuk480W9oiBvOxuQ2wPk8Eil28J4j32OUTZSmZVQDhU7M5GAU9KJ2LP
 IG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W4CuVJp6htN2y1/Vp8LtCaaMfaPH0Jo1ezQEtxgh7bk=;
 b=MibzcS+Frz8dbkhKTWfiuVzAgt4/zORlYPhM9Z+o2i0SLj4b2S3/KpHerrbNKG6+Wo
 yR0HFOZI/M91v+vp/C0gt1vKp1m/p6qj/f1azMqKdwA/ORafugc2ODKBWGyFpWeT2lEZ
 ZiQ2rtt1nyo7PUuSIHtUz7ADIylKmOvZVG/RpY8SpWhDdGSQkhTeGCoi6PD+8bfI/aJ7
 /ZT+T2oPfAwLkevMIDD3VrKQOrxKjweOwisybtyISHKqsjY3VqDc6jlXJretdopqyAnf
 MkhxKx8AfYHXvxjhswy/mC7yHFdGCjiwspvY1p78HurFbGe+KcowLI+i0vr5Vyybzr8B
 VcnQ==
X-Gm-Message-State: AOAM530cTw+SGPHDs6nZS4zAU0dLxnY3LDHXrjCq71PnkCOOjOmi/FzJ
 5UZXOtD21ijecY6KstCpX5zkWj9wbWk9Kw8ga4k=
X-Google-Smtp-Source: ABdhPJxYDxHIpH8R50b3lmetoPOD5LNUh7FIOIlLGHYseOIxe+kTql8AAKWjI5pZkC7bn2hCVj6VeG0ssJUHibmXYYY=
X-Received: by 2002:ac8:7b43:: with SMTP id m3mr2919646qtu.121.1613632881637; 
 Wed, 17 Feb 2021 23:21:21 -0800 (PST)
MIME-Version: 1.0
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-4-git-send-email-shengjiu.wang@nxp.com>
 <20210210221252.GA2885308@robh.at.kernel.org>
In-Reply-To: <20210210221252.GA2885308@robh.at.kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 18 Feb 2021 15:21:10 +0800
Message-ID: <CAA+D8APfd8trC8cFsT8k8G54nhrYDrwXxECx9RpDAgw3rco9DQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] ASoC: dt-bindings: fsl_rpmsg: Add binding doc for
 rpmsg cpu dai driver
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 11, 2021 at 6:13 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Feb 07, 2021 at 06:23:51PM +0800, Shengjiu Wang wrote:
> > fsl_rpmsg cpu dai driver is driver for rpmsg audio, which is mainly used
> > for getting the user's configuration from device tree and configure the
> > clocks which is used by Cortex-M core. So in this document define the
> > needed property.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 80 +++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > new file mode 100644
> > index 000000000000..2d3ce10d42fc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > @@ -0,0 +1,80 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,rpmsg.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP Audio RPMSG CPU DAI Controller
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx7ulp-rpmsg
> > +      - fsl,imx8mn-rpmsg
> > +      - fsl,imx8mm-rpmsg
> > +      - fsl,imx8mp-rpmsg
>
> rpmsg is a protocol. What's the h/w block?

On Linux side this driver is a virtual driver, it is running
on Arm Cortex-A core. The h/w block is controlled by
another core (cortex-M core). so this driver actually
doesn't touch any hardware, it just does configuration
for rpmsg channel.

>
> > +
> > +  clocks:
> > +    items:
> > +      - description: Peripheral clock for register access
> > +      - description: Master clock
> > +      - description: DMA clock for DMA register access
> > +      - description: Parent clock for multiple of 8kHz sample rates
> > +      - description: Parent clock for multiple of 11kHz sample rates
> > +    minItems: 5
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ipg
> > +      - const: mclk
> > +      - const: dma
> > +      - const: pll8k
> > +      - const: pll11k
> > +    minItems: 5
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  fsl,audioindex:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: instance index for rpmsg image
> > +
> > +  fsl,version:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: rpmsg image version index
>
> What are these 2 used for?

fsl,audioindex: As we may support multiple instance, for example
two sound card with one rpmsg channel, this is the instance index.

fsl,version: There are maybe different image running on M core, this
is the image version, different image has different function.


>
> > +
> > +  fsl,buffer-size:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: pre allocate dma buffer size
> > +
> > +  fsl,enable-lpa:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: enable low power audio path.
> > +
> > +  fsl,codec-type:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Sometimes the codec is registered by
> > +                 driver not the device tree, this items
> > +                 can be used to distinguish codecs
>
> 0-2^32 are valid values?

I should add range for it.

>
> > +
> > +required:
> > +  - compatible
> > +  - fsl,audioindex
> > +  - fsl,version
> > +  - fsl,buffer-size
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    rpmsg_audio: rpmsg_audio {
> > +        compatible = "fsl,imx8mn-rpmsg";
> > +        fsl,audioindex = <0> ;
> > +        fsl,version = <2>;
> > +        fsl,buffer-size = <0x6000000>;
> > +        fsl,enable-lpa;
> > +        status = "okay";
>
> Don't show status in examples.

ok, will remove it.

>
> > +    };
> > --
> > 2.27.0
> >
