Return-Path: <linuxppc-dev+bounces-3053-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ADF9C1FD1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 15:58:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlMX36k0Sz3bwf;
	Sat,  9 Nov 2024 01:58:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731077923;
	cv=none; b=mjGaxgp3lqDUXR1PzriciAV2i2zTlPrueLmUsegxqpJy0yW2S8OnBAkIFN0UpZQlrerH0726vlyGY/S7S8xRths5TxSnFU4/rKU4DqEGbClnC2u8qxEJYSfxh7kpg4y5LDXebDON9EszpS0D1XnT7DuILFSUbX8pVdNtEbqC2r1QTn1eJi/m9dR8rYz8pSLQ6QhQe//KIASRDvhumyb0ikhtjtM6+MgARwHZgcAvMXBcbeKNKynUHocwQUJwr8rdvjjDJ8bHXpHjhMko58Nx7c+XTl4meoN7GI7sHlbUezwjjJ0pS6RppSlWX96f3s1aNHj2zG+1OncCmhrQzjB/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731077923; c=relaxed/relaxed;
	bh=BVT4ZW9F9R/cRGdCAhjKLHGWaDgnQ/9HgsenPvSXtoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2D8AHGvq/yLQ9tgEkJZo2C0xopuM4KgDZL7N/HlbZJYwATKH3bIS4shIkYAomYzDdZRVOti0i4xtmE8X8fRxt3RPWZFQqJJ5fxzVe8s5vNkaFwmM2pPY1lM3VRTVDw2ZRtwQmC5WWcMJCuRs+LX+2HEnwkB/iwCEpqN6h1n8ue+Q3PSPeuWD9fL16p4rhtKEeN25eUE08VIk5jQvXVLWT7wnNIDol+Vdi2ZKYlbVNxCk5GsLaoCrmK1BYvVFs0Dl65ZgVWYDe13MZw9V5UXhYUiR4jWNNE43Hb6KHf9zr+/adFK/jQ3CLbvcJmmnas4yBIla2JonFJXaT8vCXfJsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WK+BhFva; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WK+BhFva;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlMX24sLfz3bwd
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 01:58:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4EC235C5C3E
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 14:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9975AC4AF09
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 14:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731077919;
	bh=LpG39qqU1URrHICuGs7ygOJgOeEZduFX4Mef0Sou4KU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WK+BhFvasjIaKvlDTSittKA3PF+kBXMecJ6pH/MtfGiQPZnZzAoVqnBYRS4GRXZRl
	 WVNoqt8GnDV0x2+mmZrxxptn6WKtZPTs36jQguBLaQjOnWQPJ4zFUkzAGDjZuAubGX
	 TddvV1DpwPRBC4rcNmAkHYAcaTKp27UdjAPW1HcoQNwaM0rGAYJg0LLphBHPEBt5rw
	 B+bx4sqqYBftInWDe0w1UQNp5TRt45ElNm5NG3Qntu/NqNdMlLJHgvoBen6eiZCyEi
	 glA2IYD7aaHLo6XW4ZUxgRmu2Yul8XnRLPMYt8WaV/ut+FRpLgwK2y5uUCILpDNyv0
	 L4DoEKO8VpgEA==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e28fea0f5b8so2167380276.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2024 06:58:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVSV9RA6BMudtsliTnFMYaA6kfZUtWST3t7jAF6/wZ40Z/bcSYIQhrms5u94mgqN3kZXsJy/hlaxBHnUc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxtE7HypIGR/K/dWM3x0EY1cC+7nxXG7140XsZVEr+Awt+qZJzL
	vEaHX2HOPUNTznMm9OoKZq5VnR6jlozLm1VcJKRJbG036wybXIi6yKiKsVxKjcolJsO+lYuY+Ky
	cxS6HH022kPXhqgTdtB4LYYT9wg==
X-Google-Smtp-Source: AGHT+IFTijkWBoFuDrAuQlURtR/GqlKnV1aE+tc3/ggelsz1fdahHEgBLcMYQ94HPKN48fC3aaYfm0kx1I18FcNf4Xs=
X-Received: by 2002:a05:6902:68b:b0:e29:566d:c30 with SMTP id
 3f1490d57ef6-e337f860db3mr2498969276.16.1731077918830; Fri, 08 Nov 2024
 06:58:38 -0800 (PST)
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
References: <20241106171028.3830266-1-robh@kernel.org> <CGME20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d@eucas1p2.samsung.com>
 <3706d174-fadd-485f-be7b-f7ef4b11cf84@samsung.com> <73eacca6-b6cd-4689-8ccd-f7e2e8b716f3@arm.com>
 <CAL_JsqLyFV85w1kf397AcvZ7+Oewpe3vYeZdz_uvQrYwb1B8ag@mail.gmail.com> <e23ecbab-66ba-478c-b720-fb045a08bc9c@arm.com>
In-Reply-To: <e23ecbab-66ba-478c-b720-fb045a08bc9c@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 8 Nov 2024 08:58:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLyuQaKpoq7wQeQs38HBu+_=SfgbMOGyGYtns6Dm-Y2Vw@mail.gmail.com>
Message-ID: <CAL_JsqLyuQaKpoq7wQeQs38HBu+_=SfgbMOGyGYtns6Dm-Y2Vw@mail.gmail.com>
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells handling
To: Steven Price <steven.price@arm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Nov 8, 2024 at 8:33=E2=80=AFAM Steven Price <steven.price@arm.com> =
wrote:
>
> On 08/11/2024 14:04, Rob Herring wrote:
> > On Fri, Nov 8, 2024 at 7:26=E2=80=AFAM Steven Price <steven.price@arm.c=
om> wrote:
> >>
> >> On 08/11/2024 11:04, Marek Szyprowski wrote:
> >>> Hi Rob,
> >>>
> >>> On 06.11.2024 18:10, Rob Herring (Arm) wrote:
> >>>> While OpenFirmware originally allowed walking parent nodes and defau=
lt
> >>>> root values for #address-cells and #size-cells, FDT has long require=
d
> >>>> explicit values. It's been a warning in dtc for the root node since =
the
> >>>> beginning (2005) and for any parent node since 2007. Of course, not =
all
> >>>> FDT uses dtc, but that should be the majority by far. The various
> >>>> extracted OF devicetrees I have dating back to the 1990s (various
> >>>> PowerMac, OLPC, PASemi Nemo) all have explicit root node properties.=
 The
> >>>> warning is disabled for Sparc as there are known systems relying on
> >>>> default root node values.
> >>>>
> >>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >>>> ---
> >>>> v2:
> >>>>   - Add a define for excluded platforms to help clarify the intent
> >>>>     is to have an exclude list and make adding platforms easier.
> >>>>   - Also warn when walking parent nodes.
> >>>> ---
> >>>>   drivers/of/base.c | 28 ++++++++++++++++++++++------
> >>>>   drivers/of/fdt.c  |  4 ++--
> >>>>   2 files changed, 24 insertions(+), 8 deletions(-)
> >>>
> >>> This patch landed in today's linux-next as commit 4b28a0dec185 ("of:
> >>> WARN on deprecated #address-cells/#size-cells handling"). In my tests=
 I
> >>> found that it introduces warnings on almost all of my test systems. I
> >>> took a look at the first one I got in my logs (Samsung Exynos Rinato
> >>> board: arch/arm/boot/dts/samsung/exynos3250-rinato.dts):
> >>
> >> Just a "me too" for rk3288-firefly.dtb:
> >>
> >> [    0.138735] WARNING: CPU: 0 PID: 1 at drivers/of/base.c:106 of_bus_=
n_addr_cells+0x9c/0xd8
> >> [    0.138776] Missing '#address-cells' in /power-management@ff730000
> >>
> >> I'm sure it's easy to fix up the DTB, but we shouldn't be breaking lon=
g existing DTBs.
> >
> > What broke?
>
> Nothing 'broke' as such (the board continued booting) but the WARN
> shouldn't be happening. My CI treats the WARN as a failure as these
> shouldn't occur unless there's a programming error.
>
> > The intent here is to exclude any platforms/arch which actually need
> > the deprecated behavior, not change DTBs. That's spelled out at the
> > WARN which I assume people would read before fixing "Missing
> > '#address-cells' in /power-management@ff730000". I tried to make the
> > warn message indicate that on v1 with:
> >
> > WARN_ONCE(!IS_ENABLED(CONFIG_SPARC), "Only listed platforms should
> > rely on default '#address-cells'\n");
>
> So one possibility is to include this platform in the exclusion list -
> but I'm not sure how to do that, I assume including CONFIG_ARM in the
> list would rather defeat the point of the patch. But my feeling is that
> it would involve a lot of playing whack-a-mole to identify individual
> platforms.

Please see my posted fix in this thread. Things "broke" quite a bit
more widely than anticipated.

> One obvious idea would be to look at the DTBs in the kernel tree and see
> which are affected by this currently, that might be a good place to
> start with an exclusion list.

It's been a dtc warning since 2007, so I can say all of the in tree
dts's are fine. The problem for these reported platforms is the
kernel, not the DT.

> You could also downgrade the warning to a pr_warn() or similar.

I find that pr_warn() may or may not get noticed, but WARN for sure
will which is what I want here.

Rob

