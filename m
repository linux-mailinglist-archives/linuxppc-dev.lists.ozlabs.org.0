Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9117B1AA988
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 16:14:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492PW95fz0zDr4r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 00:14:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ZdESDpha; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492PSH2f43zDqC7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 00:12:14 +1000 (AEST)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8430520936
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 14:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586959932;
 bh=g9zc9gWFrZts6nCro79E4zNLwGrqjr25+7GmsmkzvQs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZdESDpha5XBMMH2NumasO7B5X8dXw9HFSztHTSiLifxEnAtw7voFnYGdpI6EuoHdU
 /ExqpEmsqp0/LnjQX+zOXaD6GTUv5AQ5l84baZvQtB4517udMY6ZG9NdsAZfO/Opr3
 DN9/nwsr2l7i0O6illGKVq5zZAke9OzzviJ626A8=
Received: by mail-qt1-f176.google.com with SMTP id l60so4852419qtd.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 07:12:12 -0700 (PDT)
X-Gm-Message-State: AGi0Pubbnglfrg7NnrauSsamfvkvDwn6BOBt59p/2Dw92V2wMFV4/7/9
 GuHforrAf8zaJaETTFTeg8a3QR9unccMJ22NZQ==
X-Google-Smtp-Source: APiQypKpcfRLgsq5L44xqX/Nd5yT1RL98k+9haGwOML5QU4TMV8UysP823kpICcUXqUoiZVvAG/C9S9NizqCtatbW/E=
X-Received: by 2002:ac8:6695:: with SMTP id d21mr21432863qtp.110.1586959931603; 
 Wed, 15 Apr 2020 07:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <68208297b49e85adfddf843bc205d154790a49de.1585726761.git.shengjiu.wang@nxp.com>
 <20200414154643.GA29098@bogus>
 <CAA+D8AP2CiRT7qkNa7yBDH0Dbd=i1eyqL4g4zobRmR-vEx4VBQ@mail.gmail.com>
In-Reply-To: <CAA+D8AP2CiRT7qkNa7yBDH0Dbd=i1eyqL4g4zobRmR-vEx4VBQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 15 Apr 2020 09:11:58 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Uk1zPT=JyZczH5WRWP617Mqhaur+LwbKKYDBGBhd-cQ@mail.gmail.com>
Message-ID: <CAL_Jsq+Uk1zPT=JyZczH5WRWP617Mqhaur+LwbKKYDBGBhd-cQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] ASoC: dt-bindings: fsl_easrc: Add document for
 EASRC
To: Shengjiu Wang <shengjiu.wang@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 9:56 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>
> Hi Rob
>
> On Tue, Apr 14, 2020 at 11:49 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Apr 01, 2020 at 04:45:39PM +0800, Shengjiu Wang wrote:
> > > EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
> > > IP module found on i.MX8MN.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  .../devicetree/bindings/sound/fsl,easrc.yaml  | 101 ++++++++++++++++++
> > >  1 file changed, 101 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > > new file mode 100644
> > > index 000000000000..14ea60084420
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > > @@ -0,0 +1,101 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NXP Asynchronous Sample Rate Converter (ASRC) Controller
> > > +
> > > +maintainers:
> > > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > > +
> > > +properties:
> > > +  $nodename:
> > > +    pattern: "^easrc@.*"
> > > +
> > > +  compatible:
> > > +    const: fsl,imx8mn-easrc
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Peripheral clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: mem
> > > +
> > > +  dmas:
> > > +    maxItems: 8
> > > +
> > > +  dma-names:
> > > +    items:
> > > +      - const: ctx0_rx
> > > +      - const: ctx0_tx
> > > +      - const: ctx1_rx
> > > +      - const: ctx1_tx
> > > +      - const: ctx2_rx
> > > +      - const: ctx2_tx
> > > +      - const: ctx3_rx
> > > +      - const: ctx3_tx
> > > +
> > > +  firmware-name:
> > > +    allOf:
> > > +      - $ref: /schemas/types.yaml#/definitions/string
> > > +      - const: imx/easrc/easrc-imx8mn.bin
> > > +    description: The coefficient table for the filters
> > > +
> > > +  fsl,asrc-rate:
> >
> > fsl,asrc-rate-hz
>
> Can we keep "fsl,asrc-rate", because I want this property
> align with the one in fsl,asrc.txt.  These two asrc modules
> can share same property name.

Oh, yes.

So with the example fixed:

Reviewed-by: Rob Herring <robh@kernel.org>
