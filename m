Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 865788D2AC5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 04:26:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ONidCQSX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VptNy2DW2z79Cd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 12:19:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ONidCQSX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VptND3mcyz3vXd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 12:18:35 +1000 (AEST)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-373e9b33986so6283495ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 19:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716949110; x=1717553910; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1zuMc6QVmp7ZjCjJt78h2VKZOxHAgfCEmVnh0EIazE=;
        b=ONidCQSX30ZEjo/oX6S+2C+5ZPQ/v+Xt3B/TJExwBxlQgO9MFdTMCSyPxrfgnPa3uZ
         1TBeKigRBDG7hoor2TT1HTJb0CPyq+srTjLeDy9d4yD+f/5/0xEt66QrvtNJVZTWtSJU
         jvFtihf9BI07kVnVtTKoiALIIYwKYlFjSlATaM2IHKlpJOsIzU6UXH7fpMCiTznO1pFd
         acoB/40DpWLVeUcg3tm4lyFQDIfCbT4P3HRymWU8MIzJz+Cp9dmEubTsRRcJfgy+xt9X
         UFPchCphlmoRDid2dmeLHQLn5Ep3Cb4D1u67pbaCQaH/KNH44UODdRmodJmHZEyXHdvA
         T+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716949110; x=1717553910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1zuMc6QVmp7ZjCjJt78h2VKZOxHAgfCEmVnh0EIazE=;
        b=mQR6huzvLNrkP1EeByPpMdpno5Ee5RWx//6nwx+MEWLT1/ISlJGzos8CegwZ0PCuL9
         uNXe/p9FW3o2dUyEvvjbZnyJrDdTHKND0WFmbPa/q8kcxa5FVfXkGdCPE0ABfNe+99Eo
         E5ODx/RkcC3EEr3M/tbuvLUt2yYQplGpHagFIcXo2m8IsHGH/h+7IhONVa9yQwKVAVvJ
         +yTejxDwT0rHo5cJX0UnSPXWxEhKhaclgADxKEfNbLrwNHGCvXuxDx1Zq22Ij68KG2j+
         2HtkB1QodkIQuQFXvLiRw8LiArtB95QIpjokX2dflXQRLzlm8wPkA2gaD69bBNddQLPm
         jJUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/QkD7RjRBi6Pr1fRYK1FYvepfeZt0X3IdMe2s8O9lncwywRqxVlLcFlNJOerpjFgJA0jDNbVxZ7qArIdumB9wD/2IhBzPvXYhLcXXgQ==
X-Gm-Message-State: AOJu0YzUKX9RjHVkJUSom4eih4YmfPM14n0UI/WxyUrLd28o7Bqgjwqc
	+1gTqQNe22I8bk5/zvZ66uN5XFf7dqa8GNka7zBUoIQyLdbVXvTUHOTUzTZLxUSVFc3FBR5ejAy
	oaQhA9j2Yd7gmwlKEuGVa7+Uwc9w=
X-Google-Smtp-Source: AGHT+IFcF3TNc9ogUWcYtJiiuSJm+fWo3KnUCeZ2Iq6PTOrYl3WLncVJ7quYftqH5wIdf7b86ARTJGK34c1ksQ3R+ik=
X-Received: by 2002:a92:ca0e:0:b0:374:593f:914a with SMTP id
 e9e14a558f8ab-374593f9523mr79683085ab.4.1716949110033; Tue, 28 May 2024
 19:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <1716286416-17621-1-git-send-email-shengjiu.wang@nxp.com>
 <1716286416-17621-2-git-send-email-shengjiu.wang@nxp.com> <20240528151536.GA275498-robh@kernel.org>
In-Reply-To: <20240528151536.GA275498-robh@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 29 May 2024 10:18:18 +0800
Message-ID: <CAA+D8AMyf9jEHapNkRdEguhi8T+WVQXhxcF_tESmgbrffvdTxg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: fsl,xcvr: Add compatible string
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

On Tue, May 28, 2024 at 11:15=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, May 21, 2024 at 06:13:35PM +0800, Shengjiu Wang wrote:
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
> > As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
> > clocks and clock-names properties.
> >
> > On i.MX95, the 'interrupts' configuration has the same constraint
> > as i.MX93.
> >
> > Only on i.MX8MP, the 'resets' is required, but for i.MX95 and i.MX93
> > there is no such hardware setting.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,xcvr.yaml   | 37 ++++++++++++++++++-
> >  1 file changed, 36 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Do=
cumentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > index 0eb0c1ba8710..d1dcc27655eb 100644
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
> > @@ -49,6 +50,9 @@ properties:
> >        - description: PHY clock
> >        - description: SPBA clock
> >        - description: PLL clock
> > +      - description: PLL clock source for 8kHz series
> > +      - description: PLL clock source for 11kHz series
> > +    minItems: 4
> >
> >    clock-names:
> >      items:
> > @@ -56,6 +60,9 @@ properties:
> >        - const: phy
> >        - const: spba
> >        - const: pll_ipg
> > +      - const: pll8k
> > +      - const: pll11k
> > +    minItems: 4
> >
> >    dmas:
> >      items:
> > @@ -79,15 +86,24 @@ required:
> >    - clock-names
> >    - dmas
> >    - dma-names
> > -  - resets
> >
> >  allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx8mp-xcvr
> > +    then:
> > +      required:
> > +        - resets
> > +
> >    - if:
> >        properties:
> >          compatible:
> >            contains:
> >              enum:
> >                - fsl,imx93-xcvr
> > +              - fsl,imx95-xcvr
> >      then:
> >        properties:
> >          interrupts:
> > @@ -98,6 +114,25 @@ allOf:
> >          interrupts:
> >            maxItems: 1
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx95-xcvr
> > +    then:
> > +      properties:
> > +        clocks:
> > +          maxItems: 6
> > +        clock-names:
> > +          maxItems: 6
>
> 6 is already the max. Drop these and add a 'not' into the if schema (or
> list out the other compatibles).

Ok, will update it.

best regards
Shengjiu Wang
>
> > +    else:
> > +      properties:
> > +        clocks:
> > +          maxItems: 4
> > +        clock-names:
> > +          maxItems: 4
> > +
> >  additionalProperties: false
> >
> >  examples:
> > --
> > 2.34.1
> >
