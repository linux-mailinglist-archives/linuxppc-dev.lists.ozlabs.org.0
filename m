Return-Path: <linuxppc-dev+bounces-15952-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DA5D39E76
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 07:27:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvgVh4hKKz2yDk;
	Mon, 19 Jan 2026 17:27:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1034" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768804060;
	cv=pass; b=VOuz7YAjvxVrRC6OEiImHp4dcToE+EF0xA9MDn89WhXB8xjI6WZjl7poD+dMtN/uNXO98bKM7hshEwKD5wwSOXs0Ph6Nc7PckFIpud65KGIFv70OXhA2nN3i46ealbh0hh/EdVEJLdwXBF/EQHuVq8etpwmlhPodYi7hzxrrZV6zcMvX/Wb4msWZ3iTHg9EEHVl1ETXVF6fODr2T/pqkQH56MEj+LV3vfLUGpF10bsiwXGy9bj6YOsPzRpgWDpLKKnGqSmWMowJMxx9FQaHtZDUR2FlZicRA/SdxHUjYbVMtPyG+hsogFIGiXmcwyg0+lBkJRKcNAUJn73W781ZrpA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768804060; c=relaxed/relaxed;
	bh=kcxGM/H9ZkFQ5SWC+rNZTfsrD0aCTEHeA1hsk+XXsT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aEVrfVj7MKn3ACZnnqgGGSPJgy87IjihTHxuk6PFCGAO75qAkYsWEE/v6W+3jZhxOX1BCRiv455DfxvmaHzZWbzPl6ENKYywUOgbIjMy7pwOhq0aFw0HUlmqwG+dgvrOlCtAAZ85ED10yXX9Ro7brH2oSE5YwihwdKVlBO49745yRfD4ryGlQC0Xp6zW0b1lb2Ywgv5G465uDaWU6y6Z1iCtwzyjicGX7/WLjzL0CRzgbXabkyrU3/RWIxdB2/IyPXTCmX1hBhzVNw5aeFNYbBTFn5vaOYH2JK6hT0XMmAVp0l7fd5ja0oJYMqzPiU7bF8IC6OrKiagJK9yv4v31HA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ltVhbEZy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ltVhbEZy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvgVg1cR7z2xSZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 17:27:38 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-34c9edf63a7so3194584a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jan 2026 22:27:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768804056; cv=none;
        d=google.com; s=arc-20240605;
        b=IN/bEto8Q25+S8sKHw4kRTTHEWkYaHF4jhFTh0KYQKjE+MBg5Ikx+LMnrKlaBsnYof
         RUv+HIP7Q9johrqoomi02J+z3Vy5UX6nXd3myP5yAaa5Ozs6IDmWe/1VsZTdiKQlZqqh
         PNVvT6hGk4GNuTIwuZqiZlJ4sGwcdfuYH7Fm3qENqk338m4L60jhW4dK7kRDhpPuOO4C
         n46/mkY81pwzSgVzK+6TKieQ2bs3ZviNEpgrom6TnUzHBBsLumvw0vML2+c5IhFX/OQk
         56qWoR46dig9lJmnM0cPaTfBTXUj0xAMztJNELp9HjzGAv2yFZeIdCvCzjlx0qb1Nu/G
         3VAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kcxGM/H9ZkFQ5SWC+rNZTfsrD0aCTEHeA1hsk+XXsT8=;
        fh=YB4AGSY9NWsyIqsIzJw3v/LbTW4iPLq5eqA9Q4yaxuM=;
        b=KbebF/BDWyzNM5V9tPx5JhJ5/RkKEHXDXpGjCkduFeAM5tkKkazGBDXYHnpE/Mne3o
         wfAA/vQrOrFlFo4ChTX9WqunRwnuBYhsp96drG93PPInacltYz1T9uGyLdqp60QOOO13
         pppPToP0uBraPnBosrFcKXLCb0nfCIrzST+53umG73R7AMeMNzRAK1QFyvHsjeZGz5w1
         CE8DsAl5Ps5GOpQL/OCjqj/Kjd7/Sd1P0/191t6SYdIpy+w/cSgVSb0ON6aIfnIJ6ErI
         2WTHVaSCI9aFEgug3G20i5c8LntVojghVb3AvuHPqYsWstMIb78+aHl1EfspmMk0r8y/
         H2Jw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768804056; x=1769408856; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcxGM/H9ZkFQ5SWC+rNZTfsrD0aCTEHeA1hsk+XXsT8=;
        b=ltVhbEZyHF3ZeHNG4KNENS5iKYiPU6etY5a+lmiJF0XYSM1+jBLiQiFed3Km9v2K/A
         MKyL9893SPWW32ppMdv3WgeUFk30z2ekyBmeU02luhQ2qKLIq1mKafj5TYEmkb1lFYg1
         cNx/Isp8ZdOk2+saKX0JbJCL99PjtBK38YL/9X1/aJygFYlSuCjP6X03hk34Dq0X8EpR
         PMYyUwnpVMiqnLeOg9KzKyhDspX8yqJ37SJA0+JtQMAsp54g0GeohxKajpMA0SdHTHrx
         U4KXUQJgrCkAY2YQ6/TxX8TDcRuKpauBSR5eiImCjhDnhmwQSsJdA45uLkirLgr4jG5b
         RdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804056; x=1769408856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kcxGM/H9ZkFQ5SWC+rNZTfsrD0aCTEHeA1hsk+XXsT8=;
        b=uLZIQAzF/qygoI/E9kjSN9G7ufSY7EhBb4ywO2P1qnIpbek3OEEDj3wqPGjZ9JdnaH
         gG589hP5ATMoTu22AZYqwBOtqjEtqi1tHp94XUDnDu3HefZV/CCIdA3rYAnqQ4Fl3ERA
         ajJ6jOh++qvfWvxlOLl1WR4T6e8+UVAkTs2MNegIdt5/JEzDrjTa/lgeuebfjIZe83in
         /47HSx9ZTyNK39KcFPf7KPXJWj7NoBaYgToBximejh1PPs/Mv02VFaGbThiUOENa2g4B
         wDIoopHNex6+P+WdixrYQ+2oFGf3pqZG7Q8KrCC/Dt6ewpVc0eFpkoznMsSrSp2th3C3
         NQVA==
X-Forwarded-Encrypted: i=1; AJvYcCVokCWa6JwFFU7Yx3t7tD5l1duwXZvpAZi+IBXT2cj40S1m+4orDrkQ/82/DWPvozteGoK9o3ejMIYxA2I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwdU/B9nTraDU2dokE3LFNjW1kgHLcksQbLZnzQ5SQWyhK04UHR
	IgYfwFvsJg+lbmr7wJXK9FxdJhlBRNYfcq/cFiSx5t6OO8TbtJz/SAvxb/ojUFCkpGHOya/OGaP
	ALBAyq8sM2XSidu4AzDX0qRtJFIqeO4k=
X-Gm-Gg: AZuq6aKaRQg/1b0bb3pQx0q+oXvjcNwbjHdNnWQF3pXelzDdrfUzr3Q9H6UVM3zr4cc
	byeCbN+IWE20q8ZMzwxtU27r8fonpCmWCoQfkV4txsr0GZVfb3IuK9lW8Ma30ceMqNFX2S81RtZ
	xxqm8BBhaMj9Y1a9mtaOQduV2BpxL4X1r+5qia/ubQBwMtm1F/lPHwoOYhhpoL4kW89mTR+dLbO
	+25LZq0Cz5RVHMQ9qTmBwLRYvo2C8MLPAckv7PTa9s5a7v3K8oKYfDq0F6BTW/Gm96clPKgCOff
	tbzMjQ==
X-Received: by 2002:a17:90b:3b8d:b0:340:b908:9665 with SMTP id
 98e67ed59e1d1-3527329ea06mr8752017a91.37.1768804055769; Sun, 18 Jan 2026
 22:27:35 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260116101648.377952-1-shengjiu.wang@nxp.com>
 <20260116101648.377952-2-shengjiu.wang@nxp.com> <20260117-versed-proficient-pigeon-bd0b2a@quoll>
In-Reply-To: <20260117-versed-proficient-pigeon-bd0b2a@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 19 Jan 2026 14:27:24 +0800
X-Gm-Features: AZwV_Qh2xtpI3oElyCcH4AM0eV_DbnEZq9du-jVlcZi7tddPI18dsGW5cus42Lw
Message-ID: <CAA+D8ANrcjvOCfRN7gGGW+7YzvVieU7P2uexUpVYTw6MEHAKYQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Jan 17, 2026 at 7:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Jan 16, 2026 at 06:16:47PM +0800, Shengjiu Wang wrote:
> > The specific feature for AUDMIX on i.MX952 is that it can be bypassed,
> > so add fsl,amix-bypass property for this feature, besides this there is
> > no power domain defined on i.MX952, so make power-domains to be
> > dedicated to i.MX8QM.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,audmix.yaml | 35 +++++++++++++++++--
> >  1 file changed, 33 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml b/=
Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> > index 3ad197b3c82c..50fb08460b4f 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> > @@ -34,7 +34,9 @@ description: |
> >
> >  properties:
> >    compatible:
> > -    const: fsl,imx8qm-audmix
> > +    enum:
> > +      - fsl,imx8qm-audmix
> > +      - fsl,imx952-audmix
> >
> >    reg:
> >      maxItems: 1
> > @@ -75,12 +77,41 @@ properties:
> >          unevaluatedProperties: false
> >          description: Output port to SAI RX
> >
> > +  fsl,amix-bypass:
> > +    type: boolean
> > +    description:
> > +      The audmix module is bypassed from hardware.
>
> I don't understand why device AUDMIX would have property saying AUDMIX
> (so itself) can by bypassed. If you bypass the device itself, what do
> you configure here?

The case is that the SAI interface is connected to AUDMIX,  but AUDMIX can =
also
be bypassed by hardware configuration.

Yes, adding this property in the AUDMIX module looks strange.  Another
choice is to
add this property in the SAI binding document.  Is this better?

Best regards
Shengjiu Wang
>
>
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - clocks
> >    - clock-names
> > -  - power-domains
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx8qm-audmix
> > +    then:
> > +      required:
> > +        - power-domains
> > +      not:
> > +        required:
> > +          - fsl,amix-bypass
>
> fsl,amix-bypass: false
>
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx952-audmix
> > +    then:
> > +      not:
> > +        required:
> > +          - power-domains
>
> Not sure what you want to say here, but disallowing properties is shown
> in example-schema (:false).
>
> Best regards,
> Krzysztof
>

