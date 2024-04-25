Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C37DB8B1987
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 05:28:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EY6NioR3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQ1Y43KM6z3vYH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 13:28:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EY6NioR3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQ1XL5JYZz3dCm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 13:28:16 +1000 (AEST)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7dbc33bdf08so25166039f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Apr 2024 20:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714015694; x=1714620494; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpkcl7FDpB9iuJiZqGM4IkCYObnHqgbxV1tkOCE2UEE=;
        b=EY6NioR3igTEnCdjJYROt1HoUOuYrx4NhZY9R0nVvbZtTanYPIC7eBbYkbkXt5LouX
         fdMiMkxhG0cKOZv3v/HoNOyZZaJ6CRR3bEedrjPhokJcbrOa5cD/z6sr+VD2C/MgWfth
         14FrNImnErPlRrFty0aLkfK37eMBngIvVpb2FBJ1/n3yacls/XptuajS1K7xUYGOcX5q
         qHbQg0hqNbTqcB4I71KZ2yOCbseoG3YlLhPZyyEm3iqQDaSW5mRUbXNxwZxZnO8JxLdO
         hGMQ/mE1aeRByJ9ZOWbkY2MBztCbszcNFgPnu9y9EDX5IdHWsP2ju2RE0v5W0CmHHExP
         i2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714015694; x=1714620494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpkcl7FDpB9iuJiZqGM4IkCYObnHqgbxV1tkOCE2UEE=;
        b=iMFTTcHLYu54yY8O7lzhZzlIbQXCchyYciQ3EiFe5xyC69pCx2cURqEs93op8j6JeN
         Sby6DZU7Ue4dZ2t2hjWp9VOjfuIakyBehhj58Ea9wyeZVNMcFXGAEteHTab+Vawbldsv
         gF9pERl8zVYdGy4N/Iu/dkE9yWkzOssMo/cugJ0MPojJk//xRU/056Nyp9Z/BhJj5nvV
         2Ec/Umaa1eQ72akvmNDIotvM9jfbbvE27qrWPUOq6uNFh5OEWBhTz+38Ar3IYEHaxNL3
         mYuhgMUenzqK9a/3nou+X2MekLv/9EqCXSbHAV6+GBZFKvSW69CPQdp2ZicF/u7xX5VT
         32xw==
X-Forwarded-Encrypted: i=1; AJvYcCU8rm3ahdyvHNTUzuPCD1J1QAyYfT+xs8gyFCcMDkGO9ovrudPPfxydj14daggBIwjSGJhYOlI50khC2bid2aAFOKpdo9iSGP+XCW+G9Q==
X-Gm-Message-State: AOJu0YydsA3cJuDEFUdcOdA4ZvSqZAn6wTtM2+LLtIpo+gQMm4Xc5Oqx
	8UiwoRI6m7nt66UEm6womwMA6FlIxZiNJeWArkviMRuxzyLGo02zFklv/qzqPGNjykwo0gKz3id
	QLl676Y+gDodsO1S0D9G3UW/wLNBdAnDa
X-Google-Smtp-Source: AGHT+IGlXygE9UzrbNpMVVKGHhw27MOQN3YoueGJc1JA+8GN311b98f3Wj0i7+UWE5MFVAOe75CZFHF44dqLB+eqPjs=
X-Received: by 2002:a05:6e02:160e:b0:36a:36ee:339f with SMTP id
 t14-20020a056e02160e00b0036a36ee339fmr5856729ilu.23.1714015693867; Wed, 24
 Apr 2024 20:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <1713764894-11870-1-git-send-email-shengjiu.wang@nxp.com> <20240423142412.GA138232-robh@kernel.org>
In-Reply-To: <20240423142412.GA138232-robh@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 25 Apr 2024 11:28:02 +0800
Message-ID: <CAA+D8ANnBwL+gp5n=a+oZjqS0tvTwsFtWY8zREGkzE-E9-ndSA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: fsl,ssi: Convert to YAML
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 23, 2024 at 10:24=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Mon, Apr 22, 2024 at 01:48:14PM +0800, Shengjiu Wang wrote:
> > Convert the fsl,ssi binding to YAML.
> >
> > Add below compatible strings which were not listed
> > in document:
> >
> > fsl,imx50-ssi
> > fsl,imx53-ssi
> > fsl,imx25-ssi
> > fsl,imx27-ssi
> > fsl,imx6q-ssi
> > fsl,imx6sl-ssi
> > fsl,imx6sx-ssi
> >
> > Add below fsl,mode strings which were not listed.
> >
> > i2s-slave
> > i2s-master
> > lj-slave
> > lj-master
> > rj-slave
> > rj-master
> >
> > Add 'ac97-gpios' property which were not listed.
> > Then dtbs_check can pass.
> >
> > And remove the 'codec' description which should be
> > in the 'codec' binding doc.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2:
> > - change fallback string to const.
> > - add dai-common.yaml
> > - add ac97-gpios property
> >
> >  .../devicetree/bindings/sound/fsl,ssi.txt     |  87 --------
> >  .../devicetree/bindings/sound/fsl,ssi.yaml    | 192 ++++++++++++++++++
> >  2 files changed, 192 insertions(+), 87 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/sound/fsl,ssi.txt
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,ssi.yam=
l
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,ssi.txt b/Docu=
mentation/devicetree/bindings/sound/fsl,ssi.txt
> > deleted file mode 100644
> > index 7e15a85cecd2..000000000000
> > --- a/Documentation/devicetree/bindings/sound/fsl,ssi.txt
> > +++ /dev/null
> > @@ -1,87 +0,0 @@
> > -Freescale Synchronous Serial Interface
> > -
> > -The SSI is a serial device that communicates with audio codecs.  It ca=
n
> > -be programmed in AC97, I2S, left-justified, or right-justified modes.
> > -
> > -Required properties:
> > -- compatible:       Compatible list, should contain one of the followi=
ng
> > -                    compatibles:
> > -                      fsl,mpc8610-ssi
> > -                      fsl,imx51-ssi
> > -                      fsl,imx35-ssi
> > -                      fsl,imx21-ssi
> > -- cell-index:       The SSI, <0> =3D SSI1, <1> =3D SSI2, and so on.
> > -- reg:              Offset and length of the register set for the devi=
ce.
> > -- interrupts:       <a b> where a is the interrupt number and b is a
> > -                    field that represents an encoding of the sense and
> > -                    level information for the interrupt.  This should =
be
> > -                    encoded based on the information in section 2)
> > -                    depending on the type of interrupt controller you
> > -                    have.
> > -- fsl,fifo-depth:   The number of elements in the transmit and receive=
 FIFOs.
> > -                    This number is the maximum allowed value for SFCSR=
[TFWM0].
> > - - clocks:          "ipg" - Required clock for the SSI unit
> > -                    "baud" - Required clock for SSI master mode. Other=
wise this
> > -                   clock is not used
> > -
> > -Required are also ac97 link bindings if ac97 is used. See
> > -Documentation/devicetree/bindings/sound/soc-ac97link.txt for the neces=
sary
> > -bindings.
> > -
> > -Optional properties:
> > -- codec-handle:     Phandle to a 'codec' node that defines an audio
> > -                    codec connected to this SSI.  This node is typical=
ly
> > -                    a child of an I2C or other control node.
> > -- fsl,fiq-stream-filter: Bool property. Disabled DMA and use FIQ inste=
ad to
> > -                 filter the codec stream. This is necessary for some b=
oards
> > -                 where an incompatible codec is connected to this SSI,=
 e.g.
> > -                 on pca100 and pcm043.
> > -- dmas:                  Generic dma devicetree binding as described i=
n
> > -                 Documentation/devicetree/bindings/dma/dma.txt.
> > -- dma-names:     Two dmas have to be defined, "tx" and "rx", if fsl,im=
x-fiq
> > -                 is not defined.
> > -- fsl,mode:         The operating mode for the AC97 interface only.
> > -                    "ac97-slave" - AC97 mode, SSI is clock slave
> > -                    "ac97-master" - AC97 mode, SSI is clock master
> > -- fsl,ssi-asynchronous:
> > -                    If specified, the SSI is to be programmed in async=
hronous
> > -                    mode.  In this mode, pins SRCK, STCK, SRFS, and ST=
FS must
> > -                    all be connected to valid signals.  In synchronous=
 mode,
> > -                    SRCK and SRFS are ignored.  Asynchronous mode allo=
ws
> > -                    playback and capture to use different sample sizes=
 and
> > -                    sample rates.  Some drivers may require that SRCK =
and STCK
> > -                    be connected together, and SRFS and STFS be connec=
ted
> > -                    together.  This would still allow different sample=
 sizes,
> > -                    but not different sample rates.
> > -- fsl,playback-dma: Phandle to a node for the DMA channel to use for
> > -                    playback of audio.  This is typically dictated by =
SOC
> > -                    design.  See the notes below.
> > -                    Only used on Power Architecture.
> > -- fsl,capture-dma:  Phandle to a node for the DMA channel to use for
> > -                    capture (recording) of audio.  This is typically d=
ictated
> > -                    by SOC design.  See the notes below.
> > -                    Only used on Power Architecture.
> > -
> > -Child 'codec' node required properties:
> > -- compatible:       Compatible list, contains the name of the codec
> > -
> > -Child 'codec' node optional properties:
> > -- clock-frequency:  The frequency of the input clock, which typically =
comes
> > -                    from an on-board dedicated oscillator.
> > -
> > -Notes on fsl,playback-dma and fsl,capture-dma:
> > -
> > -On SOCs that have an SSI, specific DMA channels are hard-wired for pla=
yback
> > -and capture.  On the MPC8610, for example, SSI1 must use DMA channel 0=
 for
> > -playback and DMA channel 1 for capture.  SSI2 must use DMA channel 2 f=
or
> > -playback and DMA channel 3 for capture.  The developer can choose whic=
h
> > -DMA controller to use, but the channels themselves are hard-wired.  Th=
e
> > -purpose of these two properties is to represent this hardware design.
> > -
> > -The device tree nodes for the DMA channels that are referenced by
> > -"fsl,playback-dma" and "fsl,capture-dma" must be marked as compatible =
with
> > -"fsl,ssi-dma-channel".  The SOC-specific compatible string (e.g.
> > -"fsl,mpc8610-dma-channel") can remain.  If these nodes are left as
> > -"fsl,elo-dma-channel" or "fsl,eloplus-dma-channel", then the generic E=
lo DMA
> > -drivers (fsldma) will attempt to use them, and it will conflict with t=
he
> > -sound drivers.
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,ssi.yaml b/Doc=
umentation/devicetree/bindings/sound/fsl,ssi.yaml
> > new file mode 100644
> > index 000000000000..d22911b0e9ef
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,ssi.yaml
> > @@ -0,0 +1,192 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,ssi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale Synchronous Serial Interface
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +description:
> > +  Notes on fsl,playback-dma and fsl,capture-dma
> > +  On SOCs that have an SSI, specific DMA channels are hard-wired for p=
layback
> > +  and capture.  On the MPC8610, for example, SSI1 must use DMA channel=
 0 for
> > +  playback and DMA channel 1 for capture.  SSI2 must use DMA channel 2=
 for
> > +  playback and DMA channel 3 for capture.  The developer can choose wh=
ich
> > +  DMA controller to use, but the channels themselves are hard-wired.  =
The
> > +  purpose of these two properties is to represent this hardware design=
.
> > +
> > +  The device tree nodes for the DMA channels that are referenced by
> > +  "fsl,playback-dma" and "fsl,capture-dma" must be marked as compatibl=
e with
> > +  "fsl,ssi-dma-channel".  The SOC-specific compatible string (e.g.
> > +  "fsl,mpc8610-dma-channel") can remain.  If these nodes are left as
> > +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel", then the generic=
 Elo DMA
> > +  drivers (fsldma) will attempt to use them, and it will conflict with=
 the
> > +  sound drivers.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - fsl,imx50-ssi
> > +              - fsl,imx53-ssi
> > +          - enum:
> > +              - fsl,imx51-ssi
>
> const
>
> > +          - const: fsl,imx21-ssi
> > +      - items:
> > +          - enum:
> > +              - fsl,imx25-ssi
> > +              - fsl,imx27-ssi
> > +              - fsl,imx35-ssi
> > +              - fsl,imx51-ssi
> > +              - fsl,imx6q-ssi
> > +              - fsl,imx6sl-ssi
> > +              - fsl,imx6sx-ssi
> > +          - enum:
> > +              - fsl,imx21-ssi
> > +              - fsl,imx51-ssi
>
> Fallbacks cannot be enum's. You need to split this into 2. Also, there's
> no valid entry for "fsl,imx21-ssi".
>
> It also doesn't make sense that sometimes mx21 is a fallback of mx51,
> but then sometimes the last fallback is mx51.
>
> > +      - items:
> > +          - const: fsl,mpc8610-ssi
> > +
> > +  cell-index:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1, 2]
> > +    description: The SSI index
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  fsl,fifo-depth:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The number of elements in the transmit and receive FIFOs.
> > +      This number is the maximum allowed value for SFCSR[TFWM0].
>
> Ordering is standard properties first (like 'clocks') and then vendor
> specific properties last.
>
> You need some constraints on the fsl,fifo-depth values.
>
> > +
> > +  clocks:
> > +    items:
> > +      - description: The ipg clock for register access
> > +      - description: clock for SSI master mode
> > +    minItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ipg
> > +      - const: baud
> > +    minItems: 1
> > +
> > +  dmas:
> > +    oneOf:
> > +      - items:
> > +          - description: DMA controller phandle and request line for R=
X
> > +          - description: DMA controller phandle and request line for T=
X
> > +      - items:
> > +          - description: DMA controller phandle and request line for R=
X0
> > +          - description: DMA controller phandle and request line for T=
X0
> > +          - description: DMA controller phandle and request line for R=
X1
> > +          - description: DMA controller phandle and request line for T=
X1
> > +
> > +  dma-names:
> > +    oneOf:
> > +      - items:
> > +          - const: rx
> > +          - const: tx
> > +      - items:
> > +          - const: rx0
> > +          - const: tx0
> > +          - const: rx1
> > +          - const: tx1
> > +
> > +  codec-handle:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to a 'codec' node that defines an audio
> > +      codec connected to this SSI.  This node is typically
> > +      a child of an I2C or other control node.
> > +
> > +  fsl,fiq-stream-filter:
> > +    type: boolean
> > +    description:
> > +      Disabled DMA and use FIQ instead to filter the codec stream.
> > +      This is necessary for some boards where an incompatible codec
> > +      is connected to this SSI, e.g. on pca100 and pcm043.
> > +
> > +  fsl,mode:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    enum: [ ac97-slave, ac97-master, i2s-slave, i2s-master,
> > +            lj-slave, lj-master, rj-slave, rj-master ]
> > +    description: |
> > +      "ac97-slave" - AC97 mode, SSI is clock slave
> > +      "ac97-master" - AC97 mode, SSI is clock master
> > +      "i2s-slave" - I2S mode, SSI is clock slave
> > +      "i2s-master" - I2S mode, SSI is clock master
> > +      "lj-slave" - Left justified mode, SSI is clock slave
> > +      "lj-master" - Left justified mode, SSI is clock master
> > +      "rj-slave" - Right justified mode, SSI is clock slave
> > +      "rj-master" - Right justified mode, SSI is clock master
> > +
> > +  fsl,ssi-asynchronous:
> > +    type: boolean
> > +    description: If specified, the SSI is to be programmed in asynchro=
nous
> > +      mode.  In this mode, pins SRCK, STCK, SRFS, and STFS must
> > +      all be connected to valid signals.  In synchronous mode,
> > +      SRCK and SRFS are ignored.  Asynchronous mode allows
> > +      playback and capture to use different sample sizes and
> > +      sample rates.  Some drivers may require that SRCK and STCK
> > +      be connected together, and SRFS and STFS be connected
> > +      together.  This would still allow different sample sizes,
> > +      but not different sample rates.
> > +
> > +  fsl,playback-dma:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: Phandle to a node for the DMA channel to use for
> > +      playback of audio.  This is typically dictated by SOC
> > +      design. Only used on Power Architecture.
> > +
> > +  fsl,capture-dma:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: Phandle to a node for the DMA channel to use for
> > +      capture (recording) of audio.  This is typically dictated
> > +      by SOC design. Only used on Power Architecture.
> > +
> > +  ac97-gpios:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: Please refer to soc-ac97link.txt
> > +
> > +  "#sound-dai-cells":
> > +    const: 0
> > +    description: optional, some dts node didn't add it.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - fsl,fifo-depth
> > +
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/imx6qdl-clock.h>
> > +    ssi1: ssi@2028000 {
>
> Drop unused labels.
> > +        compatible =3D "fsl,imx6q-ssi",
> > +                     "fsl,imx51-ssi";
>
> This fits on 1 line.

Thanks for the comments,  I will update them accordingly.

Best regards
Shengjiu Wang

>
> > +        reg =3D <0x02028000 0x4000>;
> > +        interrupts =3D <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks =3D <&clks IMX6QDL_CLK_SSI1_IPG>,
> > +                 <&clks IMX6QDL_CLK_SSI1>;
> > +        clock-names =3D "ipg", "baud";
> > +        dmas =3D <&sdma 37 1 0>, <&sdma 38 1 0>;
> > +        dma-names =3D "rx", "tx";
> > +        #sound-dai-cells =3D <0>;
> > +        fsl,fifo-depth =3D <15>;
> > +    };
> > --
> > 2.34.1
> >
