Return-Path: <linuxppc-dev+bounces-10877-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C76B22EC5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 19:16:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1dT525B9z2xHY;
	Wed, 13 Aug 2025 03:16:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755018985;
	cv=none; b=o3EZj3McJoj/Z5RO/2BhqCGBfqhmDP9AD1pJ1QJeoO/R0V9OCQsCWm0B+/rldqeD9L0GiSfPvKV5LKtms6wTZc/lDhkSXHz6F4ZchViHkoy8+cL68lHYPquWD+sD9n1MntDrgMd9GUuDT2PDtrTHCdk7A6sK1w3RXdZOGDEBcYvf9ZqPwcwyJpt8PGPVh4qVQlnB0kVEe/Fs0bCTV7cM6JowUrrP7bHCZPH3QqYm4JMUFshl6XXtsgZFx3/8Mkva4Qe+LO+r7Z1fvCKyRyzHThYQtR8qktPMse5njrt5HWVKdppcbKd//7p8EQoUXG7CUoazuVn4aHKUjhl3eJd75A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755018985; c=relaxed/relaxed;
	bh=RR6Li5YSVDXFaaB/n5eOMtqh4EBeFoCLf7S8pn0aiho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hedQ6xh+7NK962iH6WEkqvftwiSplfsMip7hnfQ8mYnGaAT3q95Hbc39DlNCV83sHazGU74WwoDaPGsN+ceLNiAmWgKZ5Gt3MXdQZychxGTzH6xEon/LZn3zir9OSCiEZJ368kO7zBT3d9yk1Z8EmFwNlNc5gTcXVm0/4zgt6oM7jlx3e++7gNBq28BRFWqrKrYEziyXxrN2/pP2exHQ+QeEsKyH+GyFpOjBdqH5IhD4zuGQXY+PS1Uu0fe96bKX2OC2jyXndNAKUoRvigBXfcMSi6wGrYw49ee4IaVc/F7cOx2KkpCTQ8Nhr1rr8ChnbpgFimKX+a9kncLoz74H9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rrx7ONev; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rrx7ONev;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1dT40nH5z2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 03:16:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3188B5C6AAA
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 17:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B01C4CEF6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 17:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755018981;
	bh=hiKx5h6WgJ1kRSlNqANQXTbZ/qufuAsjkmYJWLdzY/A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rrx7ONevt651nfLg0mqbamZT+I9vsT7FOdqYPWXahJLbdCSR9mxCrDH69WVkjOJFJ
	 sQrSPjjyETzpVgPm/FHFSlCO56TxP9G1ojEVjiQONhbWjmHp/jN3AGYxeDXB4e9tl1
	 glmCD6QGhW2LROTweKFIBVLIf3b2wlfF0JZzidE0Sv/duoSwFiK67XXeW0tyfVD0p1
	 qFw12ZcpeprdH93mFyOicmwAeeVdeemJK2Apu8OvKbP5yYC2TKznK1bubWNGb9egnq
	 3Gt1V6Wv6p+XqgkHEaM4Xh6Q+NAEFXFo+NMzcls9CuGdnwu7g9utWKlCFpqWlmxiMv
	 j2QJ2LTmx0ywA==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-af95ecfbd5bso950480566b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 10:16:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWP6ID+9+639K1Bx7dREvZzDte4rZUEgLoRT1O0/VceUN+h+5fqPnG4n8ufVVC4+vzQLrEOCteIdeftkIM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy2tS0OBr2yRdShXicYsrGKo9Swwzzv6YPe25xIMJSOVbsPz5d3
	1cAzDgjBm54ObvoJY/GpkJF/AQCwjhW5VDg+fPgg3jdn1rk2kt+ln07x94YkMSIuxvo2WIK+Bn4
	s6PLykm8ilWjF9s3LjQjtIvjjJ1TRfw==
X-Google-Smtp-Source: AGHT+IEBE2ikhAU2DNl85LpL+NhY5CizUSURSGTC9MFOW45Us0P1xe9kfUVQc4IbWaS2z6b1ZX94B9hdIEwvFsOIwvk=
X-Received: by 2002:a17:906:c145:b0:ae3:4f80:ac4c with SMTP id
 a640c23a62f3a-afca4cca31fmr10795866b.12.1755018979494; Tue, 12 Aug 2025
 10:16:19 -0700 (PDT)
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
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
 <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
 <0fd6fefc-9fad-4ea6-a619-e9f480747ac0@kernel.org>
In-Reply-To: <0fd6fefc-9fad-4ea6-a619-e9f480747ac0@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 Aug 2025 12:16:08 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+1Aw5AyBeW+BhTuyWZ8BN8BJUq047oJCDKVQPZWxWYCA@mail.gmail.com>
X-Gm-Features: Ac12FXw2MCpi_Gef6Ss--eZgTnXi88_EsAQqYxE-YlC_gadE4Co6lYS79wZ_vkE
Message-ID: <CAL_Jsq+1Aw5AyBeW+BhTuyWZ8BN8BJUq047oJCDKVQPZWxWYCA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
To: Krzysztof Kozlowski <krzk@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 12, 2025 at 10:23=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 12/08/2025 13:02, Christophe Leroy wrote:
> > The QUICC Engine provides interrupts for a few I/O ports. This is
> > handled via a separate interrupt ID and managed via a triplet of
> > dedicated registers hosted by the SoC.
> >
> > Implement an interrupt driver for it for that those IRQs can then
> > be linked to the related GPIOs.
> >
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---
> >  .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 63 +++++++++++++++++++
> >  1 file changed, 63 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fs=
l,qe-ports-ic.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-po=
rts-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports=
-ic.yaml
> > new file mode 100644
> > index 0000000000000..7c98706d03dd1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.=
yaml
> > @@ -0,0 +1,63 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +
> > +title: Freescale QUICC Engine I/O Ports Interrupt Controller
> > +
> > +maintainers:
> > +  - name: Christophe Leroy
> > +    email: christophe.leroy@csgroup.eu
>
> Oh no...
>
> > +
> > +description: |
> > +  Interrupt controller for the QUICC Engine I/O ports found on some
> > +  Freescale/NXP PowerQUICC and QorIQ SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,mpc8323-qe-ports-ic
> > +      - fsl,mpc8360-qe-ports-ic
> > +      - fsl,mpc8568-qe-ports-ic
> > +
> > +  reg:
> > +    description: Base address and size of the QE I/O Ports Interrupt C=
ontroller registers.
> > +    minItems: 1
> > +    maxItems: 1
>
> This was never tested but more important this and everything further
> looks like generated by AI. Please don't do that or at least mark it
> clearly, so I will prioritize accordingly (hint: AI generates poor code
> and burden to decipher AI slop should not be on open source reviewers
> but on users of AI, but as one of maintainers probably you already know
> that, so sorry for lecturing).

If anyone needs some AI (chatgpt) converted bindings, my "dt-convert"
branch has ~800 of them. Feeding the warnings back to AI to fix was
somewhat effective. The result is not the worst I've seen submitted.
It saves some of the boilerplate, but can't fix things that are just
wrong or unclear in .txt bindings. Despite my 'prompt engineering'
attempts, it still tends to get the same things wrong over and over.

Rob

