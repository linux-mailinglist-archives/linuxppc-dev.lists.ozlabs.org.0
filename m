Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6F837715F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 13:15:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fcl915FmZz3074
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 21:15:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MEaQk6XP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MEaQk6XP; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fcl8S405vz2yXN
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 21:14:48 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id t20so4250379qtx.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 May 2021 04:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pXbSQAyhG6W2ZQ5ums5vjGpNRe3vyzAhG3D2OB6FJtA=;
 b=MEaQk6XPhXourlRG1ktFxx9flPigPi5AhTwrHElyyTSb6GnddHT2NBqQzAk7pfHBGh
 bxeC3+pH57tIvA67Zb42zGAcZKXFca8aAOfP6/GgJwC3zsVMuMFVYGKdHUVUh9x9fxRz
 AuqV344d7kd4prNGA6D5wBzbTIUZfWhDs1A7RiMm+8zxj1b5bv6/VA94Lmp2cEaF8qvP
 brtOwOdEzI1+3uPAV2G4hmFqWHImm3SpA7dyouODAAP8Mjio6LclJl4ZGBtVrPq4Fi8p
 0+/pQsi16Tp9y3Q1qRTOfWp4qnx2ADsyVbfSyZmqK613n4bOlpNGMAeYOsMaUVGML0CG
 kQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pXbSQAyhG6W2ZQ5ums5vjGpNRe3vyzAhG3D2OB6FJtA=;
 b=FcoQ4ybW2rA0g3tiFOntC8KlYZ0fkB1E54k0dLFrxUGuGGAvW3H/J8w8psR1kn3IMM
 X777TGjq7SlExifbxlI6p6lSiRDMOFqSW9v/YyjgrKmQxVkzxF+41PB9d+DW9brxf/U9
 QNYUcedtztdg7kv/Xy4sE+LNagub4TtvocaQ44GLYdPPt3RY34dgPXp3Y0EZ9IMWcqfm
 9Smsh7hAYHrNJiSwQdwW1tdNZdi+TVOV3YwKfBZS9acMouoTXCCT8atQuP9V35dM9NiP
 6HupSsruKtKYG/VN3zqkwNxPAzOqGHz9kIkVvjgdqMO1seLFlA6SdrdNojYi/vriAt+v
 edGg==
X-Gm-Message-State: AOAM531/CuZsBin7bav9BmJtjxjk+7IN3yEpWEJ5dilmfSrjv8v2pgGq
 FuETYdPyTPOAIbLc9Tf8IR6IgUnpqfEalRp6Z6Q=
X-Google-Smtp-Source: ABdhPJyRCbYhCpRfDI8+hasLkF4yP7yMUxLuTdvAzoQoMJyQJahYYgoI6qqRk4w4Lw9Mgcet1WmcDyaHhNNKa/rS4Jc=
X-Received: by 2002:ac8:47da:: with SMTP id d26mr13187735qtr.292.1620472484696; 
 Sat, 08 May 2021 04:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <1619157107-3734-1-git-send-email-shengjiu.wang@nxp.com>
 <1619157107-3734-2-git-send-email-shengjiu.wang@nxp.com>
 <20210503170030.GA1987906@robh.at.kernel.org>
In-Reply-To: <20210503170030.GA1987906@robh.at.kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sat, 8 May 2021 19:14:33 +0800
Message-ID: <CAA+D8ANFmegm2CgOs8u5+FCrR0gGyA_tQHcPCrh3Sikcm_g47Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: imx-akcodec: Add binding doc for
 akcodec machine driver
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
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On Tue, May 4, 2021 at 1:01 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Apr 23, 2021 at 01:51:47PM +0800, Shengjiu Wang wrote:
> > Imx-akcodec is a new added machine driver for supporting
> > ak4458/ak5558/ak5552/ak4497 codec on i.MX platforms.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../bindings/sound/imx-audio-akcodec.yaml     | 60 +++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> > new file mode 100644
> > index 000000000000..7419bf7224e9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> > @@ -0,0 +1,60 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/imx-audio-akcodec.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP i.MX audio complex with AK4458/AK5558/AK5552/AK4497 codec
>
> Looks like the existing fsl-asoc-card.txt? You should convert to schema
> and use that. Otherwise, my comments are based on this all being 'new'.

Ok, let's treat it as 'new'

>
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8mq-audio-ak4458
> > +      - fsl,imx8mq-audio-ak4497
> > +      - fsl,imx8mq-audio-ak5558
> > +      - fsl,imx-audio-ak4497
> > +      - fsl,imx-audio-ak4458
> > +      - fsl,imx-audio-ak5558
> > +      - fsl,imx-audio-ak5552
>
> I continue to not understand why audio bindings need the codec(s) in the
> compatible strings. Can't you look up the codec thru the audio-codec
> property?

I will try to remove the codecs type from the compatible string and check
the codec type in driver.

>
> > +
> > +  model:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: User specified audio sound card name
> > +
> > +  audio-cpu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of a CPU DAI controller
> > +
> > +  audio-codec:
> > +    description: The phandle of Codec DAI controllers, there are two
> > +                 controllers maximum.
>
> We have the common 'sound-dai' property. See the simple-card.yaml
> binding.

ok, will use sound-dai.

>
> > +
> > +  audio-asrc:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of ASRC. It can be absent if there's no
> > +                 need to add ASRC support via DPCM.
>
> Needs a vendor prefix.

ok,  can be removed in the next version.

>
> > +
> > +  fsl,tdm:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      This is a boolean property. If present, the TDM mode is enabled.
>
> But this one seems like something that could or should be common.

Ok, I will use the common one in the next version.

>
> > +
> > +required:
> > +  - compatible
> > +  - model
> > +  - audio-cpu
> > +  - audio-codec
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    sound-ak4458 {
> > +        compatible = "fsl,imx-audio-ak4458";
> > +        model = "ak4458-audio";
> > +        audio-cpu = <&sai1>;
> > +        audio-codec = <&ak4458_1>, <&ak4458_2>;
> > +    };
> > --
> > 2.17.1
> >
