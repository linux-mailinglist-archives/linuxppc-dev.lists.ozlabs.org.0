Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C838A382A07
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 12:40:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkFyf5ssGz30C6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 20:40:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lJIewHJ5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lJIewHJ5; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkFy63wvHz2yWJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 20:39:57 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id 1so4503724qtb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K9t98eUjKj6gDcKcxxVBCrgjV/xSgE7bQnCfYmjhVhU=;
 b=lJIewHJ5kTyrY82X8MK8oal0zVdmDeiJCgaEtxhPmMYOhq7KtcgyCz4etI5570uBmn
 y44cJr/tus37yOQpjgmi3O/XyNHHsWlA6JcQqZAC4oFATVuPrfTIp4NR6sqwImtLxpmD
 aD8JLo7IEjsNxQ1e6gDJA5uTeb6U8nDB1nEv21anaoh4vEMT2QVjmuCNVooxFsqhbpkh
 XXkL9Y5c4Nzc0i9F4mfXfQHtYmi6IxbV+9hKTFDEd7pgFAqGjoOW/5VluHEneOeIN3Fz
 /1daKx1wOzHg2rdXO682JxGj/vREANmVqxEYQqUuX2j3i/pnCVxKwif/gHNszzh9P6Jx
 py7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K9t98eUjKj6gDcKcxxVBCrgjV/xSgE7bQnCfYmjhVhU=;
 b=AnJqc/YTnYdtXept6nVlK1WlKuerTS8+GMHH8yGrh1D7wH/DrokRvdtmSz2wbsEtwx
 ehGHXb9y1oWiAn3GucYXH3TeOh3rmJczS0yL60ALYu/RFc7QbKUYPeV14hVWDoAbw4up
 9FZYtqFyFZXDGzWToz6pQqxJR87Cvx7Z4OjmNA8Em60o2/G1rsZQjA5uoJuXfmeYw0d8
 L+a0yIaeLXOtstrlpEjPOUXk8VLNk1olU7ivxrKdl9ZjWNWnDNDTabIcznZi+lPVWcEj
 6IFp4FWFUCoE+uTB1Y0+MLSMlNL8YioqwzyppCwpmvO1xGe305Koe1S7S7N5omdkpdbb
 DEkA==
X-Gm-Message-State: AOAM531dP6vn3xXmcNFsDnAOE6w7jUTdPuYs1ACThQJqTjH6BwstUvg3
 wii2gehSsOylcVd+7VvKSeYrHn1L+UB9OzxDCRs=
X-Google-Smtp-Source: ABdhPJxP2yInzaLOWHJ5yaYXJgH9PtDXyh5iBmZ7BS7Et2hKC0KXRWFB5kV1XtbtFyN7JRNeEd4rI0s5qieH76fQIF4=
X-Received: by 2002:ac8:4cda:: with SMTP id l26mr50675557qtv.54.1621247992548; 
 Mon, 17 May 2021 03:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <1620630441-14358-1-git-send-email-shengjiu.wang@nxp.com>
 <1620630441-14358-2-git-send-email-shengjiu.wang@nxp.com>
 <20210511190057.GA2416585@robh.at.kernel.org>
In-Reply-To: <20210511190057.GA2416585@robh.at.kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 17 May 2021 18:39:41 +0800
Message-ID: <CAA+D8APEdrK0rVz_Mcad6k0ZGS2k9wkXJ6-NOykQ-NdDzFXhrg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: imx-akcodec: Add binding doc
 for akcodec machine driver
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

On Thu, May 13, 2021 at 4:07 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, May 10, 2021 at 03:07:21PM +0800, Shengjiu Wang wrote:
> > Imx-akcodec is a new added machine driver for supporting
> > ak4458/ak5558/ak5552/ak4497 codec on i.MX platforms.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2:
> > - update doc accoring to Rob's comment, use the common porperties.
> >
> >  .../bindings/sound/imx-audio-akcodec.yaml     | 107 ++++++++++++++++++
> >  1 file changed, 107 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> > new file mode 100644
> > index 000000000000..0812c4779b59
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/imx-audio-akcodec.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP i.MX audio complex with AK4458/AK5558/AK5552/AK4497 codec
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8mq-audio-akcodec
> > +      - fsl,imx-audio-akcodec
>
> We gone from individual codecs to a family of codecs. Is there something
> specific for the machine driver about this set of codecs? Why can't it
> be *any* codec?

Yes, there is something specific. but let me do further updates for this in the
next version, then the document name needs to be changed to
"imx-audio-card".

best regards
wang shengjiu
