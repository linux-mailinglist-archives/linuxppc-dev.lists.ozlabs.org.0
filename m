Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id B92A98CA728
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 05:51:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Aj12vpLM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vk0hb0jSLz3g8G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 13:45:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Aj12vpLM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vk0gp5tMlz3dX3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 13:45:08 +1000 (AEST)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-36cc8dbe09aso17445275ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2024 20:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716263104; x=1716867904; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92eG1R1+dxxcxoqnquEsD3l0yRmXMuTseq3SVxvuVCU=;
        b=Aj12vpLMfRK5DKatcHSoQKO8ngvI7c/tsXn68sFEXFyZ6V/aU2TQ6He2Z0ZWGnS2bv
         Qu7/kYX75OcevIX7R9qwYBJbUX38dZ//azswOeU0YgJeGTADhVNoSNH0luCHiGnY20Ua
         bqFC+L77xXLjoWyJ2gtx7BL8FM0U2ZHLSgmVyyOyBrOVaSh97/ntMM8v32EhfB+9ccGO
         KmRb4IR7wJGHOqXVYh7Lh0tbvb98+RSns0VTZxv0K9mY2W7QdWo+SdkcfSDK0BnXXjgr
         vu72dMSgNIyvMUqh3Hq3G7AKZfCS2tC2RWGYU+MxSZG5JXYOCIqthotdyb6O+BS0ZJrC
         BQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716263104; x=1716867904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92eG1R1+dxxcxoqnquEsD3l0yRmXMuTseq3SVxvuVCU=;
        b=EbrvhkySYfD8GgvdT3a4cKjSbftvNM9WLuM4LzPgYFtkIVfB3zVpfdqPdbmU2avcqH
         TgFc+jkD59H6AHL3rHO1ieZsJhy0CCUIIbr0k6J6DoxyHXKsJYEY3qiAuRjJ0L+YAKtI
         RnT8bPE2SSGWD3akdnoS1bp6lgRIZVCsQO7eUy4Yzyfd/X36s5stU+u3qLrhPCu+UtCj
         yC0abB3CyGDtFM6qsEvikC9k6pw2lugTZG1ysAEPiGSS5TWnkiBt3o6d+QRVxIpge+HM
         p0NMDs3Dr+oliqbqbdZ+i5TO5gTlF/iz7AeoJ8TaOX5bcAZfkHxe+1z+ooqdjqgzuYoS
         vVcA==
X-Forwarded-Encrypted: i=1; AJvYcCWH0SgH8pK4qq14yqMarNugQRstx0YnGcRg1j0q80XEb2Sr0MjiiKIF2Edvy5V1E+LGHYEEwT6Y6khU4RJqTK2tVa5m6rGGUEXCBvhWAw==
X-Gm-Message-State: AOJu0YxhfC+LFj7pC3ixJVXEd6FtcMDH47NWAliOQyhcsSL7HOhlUKur
	tH2CJVzc8gisLEJfYK1vHvBy95ABs6HxgGKXVlXQzo/9iPVF6YBZW5aI4hgAjK2bj3Wq8RhRA5j
	40WgdMdTZVoQimsYfYczR58BwmbI=
X-Google-Smtp-Source: AGHT+IGUqihHFeb7eWpabPg1q5Sh/AS8XKoMLly/pnZf7TI+p69vXi5+CsRbyhaNcvW9G0mXy1rLErzVIJjrmezSMvA=
X-Received: by 2002:a05:6e02:1caf:b0:36a:1f1a:f797 with SMTP id
 e9e14a558f8ab-36cc1501d23mr336656205ab.32.1716263103909; Mon, 20 May 2024
 20:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <1715656329-8061-1-git-send-email-shengjiu.wang@nxp.com>
 <1715656329-8061-2-git-send-email-shengjiu.wang@nxp.com> <20240520161602.GA733483-robh@kernel.org>
In-Reply-To: <20240520161602.GA733483-robh@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 May 2024 11:44:53 +0800
Message-ID: <CAA+D8AOvuCKN0cU_TAHsz6h41qVXHbV0LfkFq9dSRujt2Lc2bw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl,xcvr: Add compatible string
 for i.MX95
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

On Tue, May 21, 2024 at 12:16=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, May 14, 2024 at 11:12:08AM +0800, Shengjiu Wang wrote:
> > Add compatible string "fsl,imx95-xcvr" for i.MX95 platform.
> >
> > The difference between each platform is in below table.
> >
> > +---------+--------+----------+--------+
> > |  SOC          |  PHY   | eARC/ARC | SPDIF  |
> > +---------+--------+----------+--------+
> > | i.MX8MP |  V1    |  Yes     |  Yes   |
> > +---------+--------+----------+--------+
> > | i.MX93  |  N/A   |  N/A     |  Yes   |
> > +---------+--------+----------+--------+
> > | i.MX95  |  V2    |  N/A     |  Yes   |
> > +---------+--------+----------+--------+
> >
> > On i.MX95, there are two PLL clock sources, they are the parent
> > clocks of the XCVR root clock. one is for 8kHz series rates, named
> > as 'pll8k', another one is for 11kHz series rates, named as 'pll11k'.
> > They are optional clocks, if there are such clocks, then the driver
> > can switch between them to support more accurate sample rates.
> >
> > As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4'
> > for clocks and clock-names properties.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,xcvr.yaml   | 55 +++++++++++++++----
> >  1 file changed, 45 insertions(+), 10 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Do=
cumentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > index 0eb0c1ba8710..70bcde33e986 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > @@ -22,6 +22,7 @@ properties:
> >      enum:
> >        - fsl,imx8mp-xcvr
> >        - fsl,imx93-xcvr
> > +      - fsl,imx95-xcvr
> >
> >    reg:
> >      items:
> > @@ -44,18 +45,12 @@ properties:
> >      minItems: 1
> >
> >    clocks:
> > -    items:
> > -      - description: Peripheral clock
> > -      - description: PHY clock
> > -      - description: SPBA clock
> > -      - description: PLL clock
>
> Leave these here and add pll8k and pll11k.
>
> > +    minItems: 4
>
> Keep this.
>
> > +    maxItems: 6
> >
> >    clock-names:
> > -    items:
> > -      - const: ipg
> > -      - const: phy
> > -      - const: spba
> > -      - const: pll_ipg
> > +    minItems: 4
> > +    maxItems: 6
>
> Same here.
>
> >
> >    dmas:
> >      items:
> > @@ -97,6 +92,46 @@ allOf:
> >        properties:
> >          interrupts:
> >            maxItems: 1
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx95-xcvr
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Peripheral clock
> > +            - description: PHY clock
> > +            - description: SPBA clock
> > +            - description: PLL clock
> > +            - description: PLL clock source for 8kHz series
> > +            - description: PLL clock source for 11kHz series
> > +          minItems: 4
> > +        clock-names:
> > +          items:
> > +            - const: ipg
> > +            - const: phy
> > +            - const: spba
> > +            - const: pll_ipg
> > +            - const: pll8k
> > +            - const: pll11k
> > +          minItems: 4
>
> Drop all this.
>
> > +    else:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Peripheral clock
> > +            - description: PHY clock
> > +            - description: SPBA clock
> > +            - description: PLL clock
> > +        clock-names:
> > +          items:
> > +            - const: ipg
> > +            - const: phy
> > +            - const: spba
> > +            - const: pll_ipg
>
> And for this case, you just need 'maxItems: 4'.
>

Thanks for the comments.

I will address them in the next version.

Best regards
Shengjiu Wang
