Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C2A31E6DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 08:24:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh5mm0VSBz3cHZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 18:24:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Qr+3L4Ej;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Qr+3L4Ej; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh5mK3mRMz30Ky
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 18:23:43 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id t63so1278196qkc.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 23:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DMQ5f7QLDVBk/p2SiqG1fJ9qgjmg4Wvt4LKaLla7OLk=;
 b=Qr+3L4Ej72qJJCUzgwXnoe8zPmqTe6qAIrA9wxq09tbDV+0BJsv0uj1Xmt4kN0GWfp
 UI8iKGh6hST1VZsf2N+jbD5SGBeUIHhc5BCxqighrUK/Ih+wVBhuVZaOd5INd2oqfGL4
 jJbY8ItUecjLQSUNyn748dNMO4OftT3Uekj7jsQbJ3uvYZmRYdFN+C3dDPjotfTimi3u
 dYMJgv2G51C8ObnUsBMT550ob0cAYwzlY5ll659v03CFgjroC3k6iIZ0agwfo2X8htYB
 u4NzgebNkTccMwmDz1tswEL93PqROQQpFRn+XtDWpo+2LWJCwUSnHG7T5rd89nL5ST3h
 W3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DMQ5f7QLDVBk/p2SiqG1fJ9qgjmg4Wvt4LKaLla7OLk=;
 b=tdDPUhqRjCqZ1VnV4hgPo2v1KhVuDgX27IJRHYo6HlOSC7HojCXis+/5tgM1Ukj2Wf
 hDoxPcC+8qWinPX9f+v+OvQxpXaDw/a9l74/6tf59Ki/L8aCwixKGaLGGJI8ygzxqe7d
 AQn0vzNn6rqzuUh3teMaFKtc3mnmxxcAD4eqbUHT4uVV1GHhuGiBwrGlgZD+bWDNEN8u
 sN/w8KMQaWiHI/Ts9hH2lu5KjsChaGhy9iswPkDxwi8PcNMkdp0zbYhSVAthXQ6xCK0E
 xoCf46BG3tVtOOFT6nCklPB56iZPPQyRTVAICQnpReRjlBV/XJaSdZeZTQxdYLNCF1pq
 QDbw==
X-Gm-Message-State: AOAM532gBVX7T2uPSyoGTVX9lKyccsRg3tGQ14qvNdIQL1PUR38W+zKG
 TAI2KN6HWMnBpzlRTMTblSvmLlNjUmiB5ZVL6l0=
X-Google-Smtp-Source: ABdhPJylVF96WbxLINqVRFOjTFAGRMnVEk2QlGKbvhtHZHX/gaUOI3ZLpVhymTMSwzoULhFZK6nK3ZSKpvRjTLfioMc=
X-Received: by 2002:a37:a896:: with SMTP id r144mr3006847qke.121.1613633020261; 
 Wed, 17 Feb 2021 23:23:40 -0800 (PST)
MIME-Version: 1.0
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-8-git-send-email-shengjiu.wang@nxp.com>
 <20210210221704.GA2894134@robh.at.kernel.org>
In-Reply-To: <20210210221704.GA2894134@robh.at.kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 18 Feb 2021 15:23:29 +0800
Message-ID: <CAA+D8ANOv91jr4381Acz1B2mZ6=Mx2J_2CMTGXmPKztv7bMjPA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: imx-rpmsg: Add binding doc for
 rpmsg machine driver
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

On Thu, Feb 11, 2021 at 6:18 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Feb 07, 2021 at 06:23:55PM +0800, Shengjiu Wang wrote:
> > Imx-rpmsg is a new added machine driver for supporting audio on Cortex-M
> > core. The Cortex-M core will control the audio interface, DMA and audio
> > codec, setup the pipeline, the audio driver on Cortex-A core side is just
> > to communitcate with M core, it is a virtual sound card and don't touch
> > the hardware.
>
> I don't understand why there are 2 nodes for this other than you happen
> to want to split this into 2 Linux drivers. It's 1 h/w thing.

This one is for the sound card machine driver.  Another one is
for the sound card cpu dai driver. so there are 2 nodes.

>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../bindings/sound/imx-audio-rpmsg.yaml       | 48 +++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml b/Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml
> > new file mode 100644
> > index 000000000000..b941aeb80678
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/imx-audio-rpmsg.yaml
> > @@ -0,0 +1,48 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/imx-audio-rpmsg.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP i.MX audio complex with rpmsg
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx-audio-rpmsg
> > +
> > +  model:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: User specified audio sound card name
> > +
> > +  audio-cpu:
> > +    description: The phandle of an CPU DAI controller
> > +
> > +  rpmsg-out:
> > +    description: |
> > +      This is a boolean property. If present, the transmitting function
> > +      will be enabled,
> > +
> > +  rpmsg-in:
> > +    description: |
> > +      This is a boolean property. If present, the receiving function
> > +      will be enabled.
> > +
> > +required:
> > +  - compatible
> > +  - model
> > +  - audio-cpu
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    sound-rpmsg {
> > +        compatible = "fsl,imx-audio-rpmsg";
> > +        model = "ak4497-audio";
> > +        audio-cpu = <&rpmsg_audio>;
> > +        rpmsg-out;
> > +    };
> > --
> > 2.27.0
> >
