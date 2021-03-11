Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E91C3370AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 11:59:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dx5YQ2cjnz3cTJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 21:59:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CNiSwaWS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CNiSwaWS; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dx5Xz3cntz3cMY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 21:58:58 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id t4so20151631qkp.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 02:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3UiH+kUE+AB5h+QM3HtJZhWpgi2YQCcTnzrYrkv0thQ=;
 b=CNiSwaWS5Le1oZOW3/IlTMc86hDM8oGd/z9Mu8/Y7NzcHshvFyki/EPYDtukE9mMwk
 2nJP4YLekvXzZOyjYiiwD7sRtWIoWiUQqJo9Ma5/6uLftQXQzn25Tv8DsR+7siFdjozF
 44D84jlB0d9hF9F53+DHHOsVqBJskxr6ZGXCZqmCWHPbjPd876ymHd8CcjX3kldN3LAK
 d6bP5fvaHztHMR37LDG5MAZ/At4tz+QFJNOCWRR8oHlJ0pe3XlZE5wE5PjeZuFVAMA8S
 MoU1XZcAMi8YUKX5zMgkzsIGq5vmS3A/paXvynY0mobidIf+axslWfRimcaA/eQelLGy
 um7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3UiH+kUE+AB5h+QM3HtJZhWpgi2YQCcTnzrYrkv0thQ=;
 b=qhcgzcBPG4QtuxkLp6zLHJPWT/fvUCyntzH7WP1z60+qa0pUwJrB2UIuAI5xa4HcuN
 r5Bh5YkmkixskEvfkRG0v4URtl4x9Zi9MikTnYK0EzJxik0GXFG5ZZylZqOdqkqAUyVr
 R1RHCbUm8Hw8DcTYY6B2IM2dm5xzSR4Igmh7mOg+0RHnD0gUO27kY4S1rqgC1kiz76nZ
 9gG/2YJPPGC7zezm7d9Qp7OV25Q51n1G10mNU0eYfDIpcb/XlBzVykuxdnmMym/x7obz
 noxnTGff0UDP0YbXC8xZi9m4O15nRFFiqp2WA6H7SFGcFssXNRGC3cLYbqRRPKacbIUH
 8iKA==
X-Gm-Message-State: AOAM530BAf0o6XtWyDBp/YUNxMD83YHmoxFVObImRRlydPh+AYeTm/uC
 Iw4QwH4Dya9C5xqiMLV0NpG6EPn8UBlz5/Hm3mc=
X-Google-Smtp-Source: ABdhPJyZ4u6nofR+JIYN9svyff7NaaVy50y13tHZKajwjGXKpJ+Yq1BGxZ4ry9Z5DaYVyjV58HY7A1+TajTQE80FhTM=
X-Received: by 2002:a05:620a:718:: with SMTP id
 24mr6897580qkc.121.1615460333507; 
 Thu, 11 Mar 2021 02:58:53 -0800 (PST)
MIME-Version: 1.0
References: <1615209750-2357-1-git-send-email-shengjiu.wang@nxp.com>
 <1615209750-2357-4-git-send-email-shengjiu.wang@nxp.com>
 <20210310024834.GA1623179@robh.at.kernel.org>
 <CAA+D8AM5nH+gwfas_=9gkzaegq4=4q2AfVybBnxM4xU3gOiF4w@mail.gmail.com>
 <CAL_Jsq+NcXHtDo+HEFVOEcGqYTx9Heo8dc_R5Nfz1Rr-sAu6YA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+NcXHtDo+HEFVOEcGqYTx9Heo8dc_R5Nfz1Rr-sAu6YA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 11 Mar 2021 18:58:42 +0800
Message-ID: <CAA+D8APXS=oCxFaNzaqhC=UFe6c92h-d4rom7p-WCrwWJFSK-g@mail.gmail.com>
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
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
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

On Thu, Mar 11, 2021 at 5:12 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Mar 10, 2021 at 6:33 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> >
> > Hi Rob
> >
> > On Wed, Mar 10, 2021 at 10:49 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Mon, Mar 08, 2021 at 09:22:27PM +0800, Shengjiu Wang wrote:
> > > > fsl_rpmsg cpu dai driver is driver for rpmsg audio, which is mainly used
> > >
> > > Bindings describe h/w blocks, not drivers.
> >
> > I will modify the descriptions. but here it is a virtual device.  the
> > mapping in real h/w is cortex M core, Cortex M core controls the SAI,
> > DMA interface. What we see from Linux side is a audio service
> > through rpmsg channel.
>
> It's describing the h/w from the view of the OS. It's not important
> that it's a Cortex-M, but how you interface to it whether that's
> shared registers, mailbox, etc. And it's what resources the block uses
> that the OS controls.

ok.

>
> > > > for getting the user's configuration from device tree and configure the
> > > > clocks which is used by Cortex-M core. So in this document define the
> > > > needed property.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 118 ++++++++++++++++++
> > > >  1 file changed, 118 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > > > new file mode 100644
> > > > index 000000000000..5731c1fbc0a6
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> > > > @@ -0,0 +1,118 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/sound/fsl,rpmsg.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: NXP Audio RPMSG CPU DAI Controller
> > > > +
> > > > +maintainers:
> > > > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > +
> > > > +description: |
> > > > +  fsl_rpmsg cpu dai driver is virtual driver for rpmsg audio, which doesn't
> > > > +  touch hardware. It is mainly used for getting the user's configuration
> > > > +  from device tree and configure the clocks which is used by Cortex-M core.
> > > > +  So in this document define the needed property.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - fsl,imx7ulp-rpmsg
> > > > +      - fsl,imx8mn-rpmsg
> > > > +      - fsl,imx8mm-rpmsg
> > > > +      - fsl,imx8mp-rpmsg
> > > > +
> > > > +  model:
> > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > +    description: User specified audio sound card name
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: Peripheral clock for register access
> > > > +      - description: Master clock
> > > > +      - description: DMA clock for DMA register access
> > > > +      - description: Parent clock for multiple of 8kHz sample rates
> > > > +      - description: Parent clock for multiple of 11kHz sample rates
> > > > +    minItems: 5
> > >
> > > If this doesn't touch hardware, what are these clocks for?
> >
> > When the cortex-M core support audio service, these clock
> > needed prepared & enabled by ALSA driver.
> >
> > >
> > > You don't need 'minItems' unless it's less than the number of 'items'.
> >
> > Ok, I will remove this minItems.
> >
> > >
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: ipg
> > > > +      - const: mclk
> > > > +      - const: dma
> > > > +      - const: pll8k
> > > > +      - const: pll11k
> > > > +    minItems: 5
> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +  fsl,audioindex:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    enum: [0, 1]
> > > > +    default: 0
> > > > +    description: Instance index for sound card in
> > > > +                 M core side, which share one rpmsg
> > > > +                 channel.
> > >
> > > We don't do indexes in DT. What's this numbering tied to?
> >
> > I will remove it. it is not necessary
> >
> > >
> > > > +
> > > > +  fsl,version:
> > >
> > > version of what?
> > >
> > > This seems odd at best.
> > >
> >
> > I will remove it.  it is not necessary
> >
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    enum: [1, 2]
> > >
> > > You're going to update this with every new firmware version?
> > >
> > > > +    default: 2
> > > > +    description: The version of M core image, which is
> > > > +                 to make driver compatible with different image.
> > > > +
> > > > +  fsl,buffer-size:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description: pre allocate dma buffer size
> > >
> > > How can you have DMA, this doesn't touch h/w?
> >
> > The DMA is handled by M core image for sound playback
> > and capture. we need to allocated buffer in Linux side.
> > here just make the buffer size to be configurable.
>
> Do we set audio buffer sizes for other audio devices in DT? If not,
> why is this special? If so, why is it not common.

No. I will move it to driver.

>
> > > > +  fsl,enable-lpa:
> > > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > > +    description: enable low power audio path.
> > > > +
> > > > +  fsl,rpmsg-out:
> > > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > > +    description: |
> > > > +      This is a boolean property. If present, the transmitting function
> > > > +      will be enabled.
> > > > +
> > > > +  fsl,rpmsg-in:
> > > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > > +    description: |
> > > > +      This is a boolean property. If present, the receiving function
> > > > +      will be enabled.
> > > > +
> > > > +  fsl,codec-type:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    enum: [0, 1, 2]
> > > > +    default: 0
> > > > +    description: Sometimes the codec is registered by
> > > > +                 driver not by the device tree, this items
> > > > +                 can be used to distinguish codecs.
> > >
> > > How does one decide what value to use?
> >
> > I will add more description:
> > 0: dummy codec
> > 1: WM8960 codec
> > 2: AK4497 codec
>
> I assume the last 2 cases have nodes in DT (pointed to by
> 'audio-codec'), so this is redundant.

Ok, will remove it.

>
> > > > +
> > > > +  audio-codec:
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +    description: The phandle of the audio codec
> > >
> > > The codec is controlled from the Linux side?
> >
> > yes.
> >
> > >
> > > > +
> > > > +  memory-region:
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +    description: phandle to the reserved memory nodes
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - fsl,audioindex
> > > > +  - fsl,version
> > > > +  - fsl,buffer-size
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    rpmsg_audio: rpmsg_audio {
> > > > +        compatible = "fsl,imx8mn-rpmsg";
> > > > +        fsl,audioindex = <0> ;
> > > > +        fsl,version = <2>;
> > > > +        fsl,buffer-size = <0x6000000>;
> > > > +        fsl,enable-lpa;
> > >
> > > How does this work? Don't you need somewhere to put the 'rpmsg' data?
> >
> > The rpmsg data is not handled in this "rpmsg_audio" device, it is just to
> > prepare the resource for rpmsg audio function, the clock, the memory
> > the power...
> >
> > The rpmsg data is handled in imx-pcm-rpmsg.c and imx-audio-rpmsg.c
> > These devices is registered by imx remoteproc driver.
>
> Then what is 'memory-region' for? You need that, a mailbox, or ???
> somewhere in DT.
>
The M core can't access all the DDR memory space on some platform,
so use 'memory-region' reserve a specific memory for dma buffer
which M core can access.

best regards
wang shengjiu
