Return-Path: <linuxppc-dev+bounces-5759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03613A24527
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 23:16:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yl9GL0qSJz30B8;
	Sat,  1 Feb 2025 09:16:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738361786;
	cv=none; b=SAf22hu9MZhhH8UBqZx34HAXoQFX44ciiftHdQOvmR5g729umt0F0wjiyGycOPuknmgFdmrrhJ0jkXuETdLumPf/tOty7otljYqOoTi42Yhwms42xOuLZULnh50PTG4OZttrQNHl8l/nJjF604BTLcTM0l6F/WAz22Gi9RJXQq/CzRwnJxZyVMQ0BK+3cARXOqSjev6ZV3/SBI0L4uCQI3jK/qHCMEcayTKpnKvX8IS2hzfnWADRMVidKijXi0l+VKb2TpMxO8nNhH0rN46qrll3JYpGUbEY8Iu/q2VXwr9pia8YzaXSQHkz07U9Vj97ZH3uUW4858CCM0zLCD+SRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738361786; c=relaxed/relaxed;
	bh=FUqAimDhXKLQKXHEvNe8kEGFl5H1tY9vRFmN0faC4gk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TyeE+i5Kd3KvAGEUumtJLILn240FyxWJ3ZqRnX89Wxqazj7TjUd9QvzqGXkJAysKTRP43M8OrmSOD8hBbPmR2UQKdq4SregeCoC/XObI4W7adMapCjkNkISoT2q/tOJPydA6C6ro7Xyr1HnJwtSb9ZXnbZfy0dya3cMpLp/3R0uTwHR61TM6hWDpMXvIed3/sNfLF3eQeZ3ihur1Nb1nmJGTWniEgK8M/eB+ZvhlcNpcXE0N5OYX5vwn0eQmeW/jGp8Z6HJrKqfHj9CHdoox/kN2W/IGqV57wmeuW8LougmV6AFTjW5YUfFa9VLSVWPR1Ct5SNT9bsvHM+y7Tymzqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AtfqOBV+; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AtfqOBV+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yl9GJ6qXGz2yyJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Feb 2025 09:16:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 27C2AA41F05
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 22:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B107C4CED1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 22:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738361780;
	bh=24W6Dps3y7DxZ6YhfkzynKPlf3swLWZxkwFai0Y3sBI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AtfqOBV+hgn5E2OvcJZHV5aNQwRoYZB/CgESGBejHG/zkhQV1sAuR0NIwBLg9xAnH
	 NMF7ihG8arT55ilvdLTKTWJmugXTWXqCJSDlTZeS2zxMmwQFLqm8D5VukL5YR/EcBJ
	 mghfb/3SO3dWStF5RQqNApP46SZDdaOsLZ08uuh/lqxQcZeBdoAPNo9gglpGJJlJBa
	 6d8A+j+Z5Ei31O2xP6t7GYTdzHI8rFqRWRC6V6NAruBJpu/X9qlSJBZZtbTiSe2K0U
	 95VqbK3A1v+Ko/GNl3nXSzntI4YcNvUJuqPzC39Twtw/FyZPNjLEwB4c+7+1U/hjuu
	 +Zc2srHyIOMnQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so3767280a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 14:16:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNklAk6YRHGdLE+wphV2zhPNJ6ADAID81sHly287b3qa9DGdwb0EKJnMkTmW0M2v2kxtjrs0BBwxlF900=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzxoNzckNOTlEoYnySfZ2N/MKZ1kMBUcOgx9HRlNCiLA3KwD5Gz
	LtbauSv2ib2lRmlXU9M5jbCLYK2wIBGT+RrWqJaIBWidSvcGHextMKY5ohy8D7TiTSWBPodtlAe
	Z4Cc4HzDqN/ayxusJW9ZMKpl3VA==
X-Google-Smtp-Source: AGHT+IG+40Vie6I5qh4Xa+hjwERq+fPWo6Sglqt6y5ghUP/X8RySc2w5nt0i3mGF0G2DQOmC/TQjR33KPq7ga7buNyY=
X-Received: by 2002:a05:6402:2390:b0:5dc:72e1:63ee with SMTP id
 4fb4d7f45d1cf-5dc72e1647cmr7162768a12.6.1738361778979; Fri, 31 Jan 2025
 14:16:18 -0800 (PST)
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
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-5-50649f51c3dd@posteo.net> <20250127044735.GD3106458-robh@kernel.org>
 <Z5zYGdZU-IXwIuR6@probook>
In-Reply-To: <Z5zYGdZU-IXwIuR6@probook>
From: Rob Herring <robh@kernel.org>
Date: Fri, 31 Jan 2025 16:16:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJAX1QbXvG16NV2g6DGece6KiG_V-uyKQQLA618Oq9miw@mail.gmail.com>
X-Gm-Features: AWEUYZlhW5XoGn0HVU0ENeDHSySI0kteJDy_cGfJFvW15zruGH8F_vZTC5Jh93M
Message-ID: <CAL_JsqJAX1QbXvG16NV2g6DGece6KiG_V-uyKQQLA618Oq9miw@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: dma: Convert fsl,elo*-dma bindings to YAML
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Scott Wood <oss@buserror.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 31, 2025 at 8:03=E2=80=AFAM J. Neusch=C3=A4fer <j.ne@posteo.net=
> wrote:
>
> On Sun, Jan 26, 2025 at 10:47:35PM -0600, Rob Herring wrote:
> > On Sun, Jan 26, 2025 at 07:59:00PM +0100, J. Neusch=C3=A4fer wrote:
> > > The devicetree bindings for Freescale DMA engines have so far existed=
 as
> > > a text file. This patch converts them to YAML, and specifies all the
> > > compatible strings currently in use in arch/powerpc/boot/dts.
> > >
> > > Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> > > ---
> > >  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 129 +++++++++++=
++
> > >  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 105 +++++++++++
> > >  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 120 +++++++++++=
+
> > >  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 -----------=
----------
> > >  4 files changed, 354 insertions(+), 204 deletions(-)
> [...]
> > > +patternProperties:
> > > +  "^dma-channel@.*$":
> > > +    type: object
> >
> >        additionalProperties: false
>
> I'll add it.
>
> > (The tools should have highlighted this)
>
> With dtschema 2024.11 installed, "make dt_binding_check
> DT_SCHEMA_FILES=3Dfsl,elo-dma.yaml" does not highlight this.

Actually, it's the top-level 'addtionalProperties: true' that disables
the check here. That should be false as well.

Rob

