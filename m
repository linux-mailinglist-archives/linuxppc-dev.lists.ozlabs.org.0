Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6446729CDF3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 06:22:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLcQt1h6lzDqTs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 16:22:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h+5kSOxB; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLcNJ1xFRzDqSZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 16:20:30 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id r7so3552381qkf.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 22:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JSBDVbjHhG9zeA/DTxswLuBUaX5GcRcOqrQA1xpDRcw=;
 b=h+5kSOxB4GU1lVQmKzLTMGS3FgSifN/Mfq/0gj+H7igLwNR2BWGbiOu6RuWpSpISiF
 wNS7JvCbzMi/MNMyND3Vkxv70NZ5+Q/+niWJ336qL6gskOKDde7y4plolWM68vlIQEJV
 NaQFkVgokW7Zmkz06EqnKwFGWBxo5286pYvcXV8dJfFWlGUP8O9ve+3Gq/T5UiyawvJy
 9I62Pfmsi6d4QVEMOhwtoC0vcAfLa9BohovkPY0FsvOI4gxe75tPG1rjqL1c+VhqdFyG
 UIcIz/48UkcifbD2ePb2dOcDxzWQaw44JU3KYDaGX2prOubHEKBQU5n5RB+WHuaAVVUE
 5Qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JSBDVbjHhG9zeA/DTxswLuBUaX5GcRcOqrQA1xpDRcw=;
 b=kHOpAd4hTDyVPT4PHiQiToqwoQupbIX8dMx9D9xzv5cez+ZrhQHb6E8sEGx0kcmuz6
 Qbpz9Eit39nJjnXuRzV6ggGNn7szWYAeIyjVkMr08Pu0IzEkbjarPT2kcEkgfeYev4EF
 gnlkEDw56Umkoq1youPF8SWkK1eciwEdW+Dix+TO+FmtmscsCX3cdXK5P3PJhjNCXKPR
 fbdS+TmWZWFIOwe9Y51/t+C7yeA0vwHxloOCfK1Y3fjlb1fRX8HvRroy73WfrvnUpRii
 mhqwpFiLaCGcLjytcw2NY6/POnW4zwiXYYDsy8xFk5R96LozRiedCIluc+6j2ThFOi0K
 8uAQ==
X-Gm-Message-State: AOAM532EiiA3Cd7JbysMSuafaXqt2AFT83P2mOyo/XkT3i/EdcLUz4LG
 DvWRdWWyLDRLGnleu+WgavHb5unsFErczguSdXoEvXlIB3g=
X-Google-Smtp-Source: ABdhPJzO2p30F4Yjj/o8ZcbkZ7ROKT5TBXHUaz1VkKheGp0FBnljBOOn55tfm5sGYlheoJilNa86PQue9aYJYtAfjGo=
X-Received: by 2002:a05:620a:657:: with SMTP id
 a23mr5712705qka.121.1603862425444; 
 Tue, 27 Oct 2020 22:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <1603708855-2663-1-git-send-email-shengjiu.wang@nxp.com>
 <20201027110840.GA23076@kozik-lap>
In-Reply-To: <20201027110840.GA23076@kozik-lap>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 28 Oct 2020 13:20:14 +0800
Message-ID: <CAA+D8AOvhYDK=NHxQGxb-GLPaRsPn0uZsBZqswxACfMz+eQQHg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl_aud2htx: Add binding doc for
 aud2htx module
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 27, 2020 at 7:09 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Oct 26, 2020 at 06:40:54PM +0800, Shengjiu Wang wrote:
> > AUD2HTX (Audio Subsystem TO HDMI TX Subsystem) is a new
> > IP module found on i.MX8MP.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../bindings/sound/fsl,aud2htx.yaml           | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml b/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml
> > new file mode 100644
> > index 000000000000..18548d0889a8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,aud2htx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP Audio Subsystem to HDMI RTX Subsystem Controller
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^aud2htx@.*"
>
> aud2htx is not a generic class of a device so it should not be enforced.
>
> > +
> > +  compatible:
> > +    const: fsl,imx8mp-aud2htx
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Peripheral clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +
> > +  dmas:
> > +    items:
> > +      - description: DMA controller phandle and request line for TX
> > +
> > +  dma-names:
> > +    items:
> > +      - const: tx
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - dmas
> > +  - dma-names
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/imx8mp-clock.h>
> > +
> > +    aud2htx: aud2htx@30cb0000 {
> > +             compatible = "fsl,imx8mp-aud2htx";
>
> Wrong indentation. Most of examples are indented with 4 spaces.
>
ok, I will update it.

best regards
wang shengjiu
