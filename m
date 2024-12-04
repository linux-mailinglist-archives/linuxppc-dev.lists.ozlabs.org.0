Return-Path: <linuxppc-dev+bounces-3766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1989E317D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 03:39:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y31tX38R1z30V2;
	Wed,  4 Dec 2024 13:39:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733279940;
	cv=none; b=XTeww/ZmIwGcnOY/V9AWwRDhBzRfAOHk88Fardq4j9nHexhFxQbqa8O/u9K0mza4rwSQDw5GSkz943E/RVINt+yO8B02OJRPe9rtejn/visz05XCca/FW9IkaqbLV4/ApNJEcjUtxSnhA6yY1To2f16mZOf8Amf/dows3uCnwWZXVmPbKjyuydGd9IMuwLyVqknXCGDyPHIeMBh4mjj37/wllZzSa+9V6RYymrxeR3VxN1/dyO9zXO0lh+t7vPUtvedwjNxlRyaRtWRwhgMbQxqF8d7Rl6K3tqYUntc0vTA/1foMjhaeBmgfDKODYJ29O42Q5JAdXr9NOulSQWyUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733279940; c=relaxed/relaxed;
	bh=78THJIZs/MA15yj+ru7yg//2Ko53Pnaq+srDYQqZaEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ek5HcJerIyU1zNQqk3ouhGa4V0o/eW3D2Ec8vEkFghOv3i4+1QKlmhF0XAvO9h2nN9NC0P7MbxbLjhLRoqY0OdeWVJd776wvQWiHN0u1h2XKn6sakOu4wFG6oEAAMiyzkWpJ/I285IXJ2qDpGxzyFb07p4ZJ3GKfqbJ206UxAiJJqibupdYAAjm4dECd8r2u2nG4P74XnNet+hD76sGu9qtxqZUgVO4gaT6gRscdyy0+BbHtdsiq2YO896/PGxbwG710y06CsYmnCIMH9zgeRCjOWwbQUCg85wXbQzgGP6S2s3/ex6bXnbSe2fI6pWsOGuP8hdJePT3xtR0HKf3QaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=N2yGfQnT; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=wenst@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=N2yGfQnT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=wenst@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y31tV0cZ2z30V1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 13:38:56 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53df1e0641fso6988954e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 18:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733279932; x=1733884732; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78THJIZs/MA15yj+ru7yg//2Ko53Pnaq+srDYQqZaEg=;
        b=N2yGfQnTn45OBOvNBmsfyG0o02MmK5/VaMmGwbhn7sETrxu31xAyirLYeNPP/rxSXV
         tSOF/1YxEyG80xi3u4aGeVtIz6VXPTLPvaPEcq0CxBPuFvsG5PEFMJwu/GoUOfSGFAtK
         ToUwb9I+r7jieVowvtoJrG3muPBFkxiqCz2tE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733279932; x=1733884732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78THJIZs/MA15yj+ru7yg//2Ko53Pnaq+srDYQqZaEg=;
        b=g6fb07SONtUmdDCl6HM4rT/7qpSrP2qEscF3JSw+pL9N7kJ0aXWiSVR2EBwQnj3HOX
         rW9Anx6FevEo7uMe2WCo01xdaTjK8tn5fQTN//TQ5KBoK5LurRCsUdeoS0UF9m6njeqD
         FMKe6QgJHR7PgmRoAegjCN0hgNqVknbkinb1XUUnrcau2t1K5pfkaS75ObvOutVoSsQm
         V9fVoDcIRioF0yThvcg3pbHAUg0XIgZd8UElfyAbAEjB9ExGwhjppoNYD7eYoFMH4jwe
         KNFOnJ2uVegb2kY258mfLubyYNX5pCwsGHj/KU2EkXg31aKw3bgBMHgWthA/Jc9P5tCO
         W5HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHKnDr55WNstBmkQuEN6kpAirmgTCvvBFwLTELWoL6FMPniZwMa4z0PpzLOHgIvHVY3JiV+W9+dypE5aw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxCSJPAmJOXxxQM5b01a7RlBALFZvOykV3CTKg0jFJgAkJag+Jo
	3MlATajOVPMjG9w5MX7QaUWmixsH4bhwfYNB7tuHrEt/U5Z5a3E7say4uOHHaK9f5OhxSzTTiPn
	CY6GYrMpIu4IKDKbS7a7u3UPebVYuJUxpJSGI
X-Gm-Gg: ASbGncvmj+yN/zNfICxu6dp3G26yXPZ1gJQw1H1gy7iho4LKHxAg2cctW63sfGHesn/
	LZR63EaqrpnSIezpUcjeCZFYoFXnweBtAlgis2P0Ln7YAL8LRSOLH2CEEdR0=
X-Google-Smtp-Source: AGHT+IHuw72icjrfxzdu36itc3o804934USQfay4OuNOvOLlQt8ZUuZrboi9UituymewJ75cgmh/8dMhPio3+m/+Hac=
X-Received: by 2002:a05:6512:b19:b0:53d:eec6:4622 with SMTP id
 2adb3069b0e04-53e12a3523fmr2296114e87.48.1733279931341; Tue, 03 Dec 2024
 18:38:51 -0800 (PST)
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
MIME-Version: 1.0
References: <20241202045757.39244-1-wenst@chromium.org> <20241203172026.GA1988559-robh@kernel.org>
In-Reply-To: <20241203172026.GA1988559-robh@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 4 Dec 2024 10:38:40 +0800
Message-ID: <CAGXv+5GPacXtcrxJVHUGuRWOSY+k5tn4kvwgu_nkjdQ6=srayQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: soc: fsl: cpm_qe: Limit matching to nodes
 with "fsl,qe"
To: Rob Herring <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 4, 2024 at 1:20=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Dec 02, 2024 at 12:57:55PM +0800, Chen-Yu Tsai wrote:
> > Otherwise the binding matches against random nodes with "simple-bus"
> > giving out all kinds of invalid warnings:
> >
> >     $ make CHECK_DTBS=3Dy mediatek/mt8188-evb.dtb
> >       SYNC    include/config/auto.conf.cmd
> >       UPD     include/config/kernel.release
> >       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> >       DTC [C] arch/arm64/boot/dts/mediatek/mt8188-evb.dtb
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: compatible:0: 'fs=
l,qe' was expected
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: compatible: ['sim=
ple-bus'] is too short
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-control=
ler@c000000:compatible:0: 'fsl,qe-ic' was expected
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-control=
ler@c000000:reg: [[0, 201326592, 0, 262144], [0, 201588736, 0, 2097152]] is=
 too long
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-control=
ler@c000000:#interrupt-cells:0:0: 1 was expected
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-control=
ler@c000000: '#redistributor-regions', 'ppi-partitions' do not match any of=
 the regexes: 'pinctrl-[0-9]+'
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: 'reg' is a requir=
ed property
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: 'bus-frequency' i=
s a required property
> >           from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe=
/fsl,qe.yaml#
> >
> > Fixes: ecbfc6ff94a2 ("dt-bindings: soc: fsl: cpm_qe: convert to yaml fo=
rmat")
> > Cc: Frank Li <Frank.Li@nxp.com>
> > Cc: <stable@vger.kernel.org> # v6.11+
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  .../devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml        | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.ya=
ml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
> > index 89cdf5e1d0a8..9e07a2c4d05b 100644
> > --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
> > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
> > @@ -21,6 +21,14 @@ description: |
> >    The description below applies to the qe of MPC8360 and
> >    more nodes and properties would be extended in the future.
> >
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: fsl,qe
> > +  required:
> > +    - compatible
>
> Update your dtschema. The select is no longer necessary. dtbs_check will
> also run 5x faster.

That did the trick. Thanks Rob!

And sorry for the noise.


ChenYu

