Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B05333DE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 14:33:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwY270mWwz3d3r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 00:33:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bl9foFVu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bl9foFVu; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwY1h3pXxz30LN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 00:33:26 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id t4so16784718qkp.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 05:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xATgDCcvjbRfKhf77xL4HQKVKsZXwxoQX6S2FdKT3Oo=;
 b=bl9foFVuWm1U0ekqf1RlZ6JOgyHSxk20HsshPAc/WzmNMQkpqow9aJHwikbBuhzGt5
 jT1S7UCkiQhavHDTqfeS/7Pfr5/IePsLcFDW+xtC3oZT8urNRddeoTEDdbA1IepPMPk+
 opy2by+nNj9L9mcjh3ek7aNkXjf9fKBBKm2Jqgd5tMFigjlDZjBf2JhaP0RIxWNQxb2T
 /+3P/012KMPMRD/pd+hAGnOJoVnTUWu55a3JQpQ9tb6n/wtLR9H0ZJW4J2/1/FeMOnPA
 ckGsAVCt8a/1taU7nsP+U4gCNpvnevNcHi/hhmmnz1IViwSN4ngtMzFuAOU/mXVgcYBY
 nErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xATgDCcvjbRfKhf77xL4HQKVKsZXwxoQX6S2FdKT3Oo=;
 b=bZodciW7b5cYjx97zAWzsuo1d8KHB/+IlNY/0hh3iqdJofJj0SzZwRcMSlkftIYa+T
 UXrHDMn89JZCuDGIgU23+nRZtZYyroytiqD1Zq9ZyYH/WuLckj2jChbPMRLJRlvZ0bYh
 DRr5Zp2QvN7yZqtj0Lnq8ASN8ovLBSgwWzKiYDXIlNvfMrF/tk7m+xJpR+bc2oo6y/lO
 eZ8ALnt2HvrhqP+5Vj7JsdEHuZYGCa3BGtrX2WtopODQppiahOyzEiq0tZgZxNISl9Sc
 WWlsskZC1TZuC9Ms3Zuj2Il2IDjHDsgl9/KHrOtOhgyCVlVJcud0bAfaQgDxuBEOWFOG
 Q2GA==
X-Gm-Message-State: AOAM532breCVutilmHcZTzm8XE58VNZGj5eGo1ezCT9c3pcIiDZqQAB+
 RhQYLzFBfA+AaUagen1xHakaB5x2gz+SdLI2ZT4=
X-Google-Smtp-Source: ABdhPJwsnjO9VMCLT+e6qoznWlE6iGQjtNS8w36gj0aKWvcdVWBIbKTu/A3JNEQWuep1O/iNA0xg755nBa0vz1K9AyA=
X-Received: by 2002:a05:620a:89d:: with SMTP id
 b29mr2468495qka.103.1615383202487; 
 Wed, 10 Mar 2021 05:33:22 -0800 (PST)
MIME-Version: 1.0
References: <1615209750-2357-1-git-send-email-shengjiu.wang@nxp.com>
 <1615209750-2357-4-git-send-email-shengjiu.wang@nxp.com>
 <20210310024834.GA1623179@robh.at.kernel.org>
In-Reply-To: <20210310024834.GA1623179@robh.at.kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 10 Mar 2021 21:33:11 +0800
Message-ID: <CAA+D8AM5nH+gwfas_=9gkzaegq4=4q2AfVybBnxM4xU3gOiF4w@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] ASoC: dt-bindings: fsl_rpmsg: Add binding doc for
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob

On Wed, Mar 10, 2021 at 10:49 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Mar 08, 2021 at 09:22:27PM +0800, Shengjiu Wang wrote:
> > fsl_rpmsg cpu dai driver is driver for rpmsg audio, which is mainly used
>
> Bindings describe h/w blocks, not drivers.

I will modify the descriptions. but here it is a virtual device.  the
mapping in real h/w is cortex M core, Cortex M core controls the SAI,
DMA interface. What we see from Linux side is a audio service
through rpmsg channel.

>
> > for getting the user's configuration from device tree and configure the
> > clocks which is used by Cortex-M core. So in this document define the
> > needed property.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 118 ++++++++++++++++++
> >  1 file changed, 118 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > new file mode 100644
> > index 000000000000..5731c1fbc0a6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > @@ -0,0 +1,118 @@
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
> > +description: |
> > +  fsl_rpmsg cpu dai driver is virtual driver for rpmsg audio, which doesn't
> > +  touch hardware. It is mainly used for getting the user's configuration
> > +  from device tree and configure the clocks which is used by Cortex-M core.
> > +  So in this document define the needed property.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx7ulp-rpmsg
> > +      - fsl,imx8mn-rpmsg
> > +      - fsl,imx8mm-rpmsg
> > +      - fsl,imx8mp-rpmsg
> > +
> > +  model:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: User specified audio sound card name
> > +
> > +  clocks:
> > +    items:
> > +      - description: Peripheral clock for register access
> > +      - description: Master clock
> > +      - description: DMA clock for DMA register access
> > +      - description: Parent clock for multiple of 8kHz sample rates
> > +      - description: Parent clock for multiple of 11kHz sample rates
> > +    minItems: 5
>
> If this doesn't touch hardware, what are these clocks for?

When the cortex-M core support audio service, these clock
needed prepared & enabled by ALSA driver.

>
> You don't need 'minItems' unless it's less than the number of 'items'.

Ok, I will remove this minItems.

>
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
> > +    enum: [0, 1]
> > +    default: 0
> > +    description: Instance index for sound card in
> > +                 M core side, which share one rpmsg
> > +                 channel.
>
> We don't do indexes in DT. What's this numbering tied to?

I will remove it. it is not necessary

>
> > +
> > +  fsl,version:
>
> version of what?
>
> This seems odd at best.
>

I will remove it.  it is not necessary

> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 2]
>
> You're going to update this with every new firmware version?
>
> > +    default: 2
> > +    description: The version of M core image, which is
> > +                 to make driver compatible with different image.
> > +
> > +  fsl,buffer-size:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: pre allocate dma buffer size
>
> How can you have DMA, this doesn't touch h/w?

The DMA is handled by M core image for sound playback
and capture. we need to allocated buffer in Linux side.
here just make the buffer size to be configurable.
>
> > +
> > +  fsl,enable-lpa:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: enable low power audio path.
> > +
> > +  fsl,rpmsg-out:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      This is a boolean property. If present, the transmitting function
> > +      will be enabled.
> > +
> > +  fsl,rpmsg-in:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      This is a boolean property. If present, the receiving function
> > +      will be enabled.
> > +
> > +  fsl,codec-type:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1, 2]
> > +    default: 0
> > +    description: Sometimes the codec is registered by
> > +                 driver not by the device tree, this items
> > +                 can be used to distinguish codecs.
>
> How does one decide what value to use?

I will add more description:
0: dummy codec
1: WM8960 codec
2: AK4497 codec

>
> > +
> > +  audio-codec:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of the audio codec
>
> The codec is controlled from the Linux side?

yes.

>
> > +
> > +  memory-region:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the reserved memory nodes
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
>
> How does this work? Don't you need somewhere to put the 'rpmsg' data?

The rpmsg data is not handled in this "rpmsg_audio" device, it is just to
prepare the resource for rpmsg audio function, the clock, the memory
the power...

The rpmsg data is handled in imx-pcm-rpmsg.c and imx-audio-rpmsg.c
These devices is registered by imx remoteproc driver.


I will update this document in v5

Best regards
Wang Shengjiu
