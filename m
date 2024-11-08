Return-Path: <linuxppc-dev+bounces-3050-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3F89C1EC9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 15:05:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlLL7054Sz3bqC;
	Sat,  9 Nov 2024 01:05:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731074702;
	cv=none; b=dcGESOrcmoAQKB2nHQ1ifuZCzha9/q6dUbxpdDUyjGP4JNwU1tTpESX2ShoNJs8jBF7V5LSeRzDH8ITl1pFSdJ1sNRsu+sP/gIx2NGbVIZiY5vL4CfydR1FjS9EAHV2hpphjlrnYBEw7uhD98m5ga2NbRgcE+WTnzNTl4xMuPEVUfzpX4p9sY7OXpQDbd59A8xxJyhRJM98h6CPEPIN68N6P0lFt0HMhXLNbh0ZIQ7aCB56IixngWT+HrmeBSSYN4osY2/AVMf7+4sEPvV4Ec7osbFuspNd/kWc02SqZkT+3C+Wsint63/Tp/w1z3npJpXXxhkuwbjmmmXMn+bSfkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731074702; c=relaxed/relaxed;
	bh=Qo4B9mAKyaBB/+k8ZpaoiKg9q/ap0D3z1W5EIfCFiSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4gaCnncLdZiCCdw2sJAZYbcu2slZVzlMz0M686gazPZauj6JxoPMLrpGtOeZSafu/XGAj2qnU4Muah1ePeB9sc51MezqnHH7kARRH6OiBFlFVSzMyrhzt5KoFLNh4ky4wNy1EhUO510JzLUVzgEhyMJhFws3v0FdMwRJZR4bGcQ4fT1vTCZKQtDWwW07UKgB5zXqcyd4ghrT4xorfdHfAf6OTrwrp7GgKOf7OvF6Sts/In1YFYl6h+WLT1PH4OrDl4DBGtdWUwyNejtKw5TR2rVm+YnifNgs0dUXf4NBFyhVZM/mjD3ZELFsEPs/slAO8pFKMcts/ioS7ZNkKWWkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dimzUVuG; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dimzUVuG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlLL560CYz3bn9
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 01:05:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C724E5C5B97
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 14:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345B7C4CECE
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 14:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731074694;
	bh=6ZnSU+m0Cd0UtNFM0il2aDZjDK4c/onwYc77e0mh9xw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dimzUVuG1q9swhaHEIi5yxspVRGJwMt/wUtahvSop3+a8cN4xZnuGbeot+ndbZeQ4
	 +pi/ulZXE1JIEq/7r6cLNtfhr91Nm8gW/L5jtl3jx083D1HkxsDmYi+CNHHjrNEmBZ
	 9J4DqRCaMOlvlM8vT2YsSesqUy9UjcS9UW0NDMHy1D2kzX+DCc17JRzWWEo/9BXnQJ
	 fYBB+MRdFnhiiW8iAwc1iW1aygW/GkBxxn1SX508Z9JgO8F0wJVEJaKBcwyfSk2LDo
	 hSorHxprR3AW3GBStISOJQ4D8bmVmuxf9ZxByaAGANnynRkveH5sr4cfiGhNy7ww28
	 P6Btq15GovTZw==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ea5003deccso24409237b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2024 06:04:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXjyYMspHf8wa91sgnxcNo40Hy+vfm4bZk7Hfxhlo1434An4Oqf3iBtK1Mg0b3Qdn0fU2hqjH6MynGZkyA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzchM99lk5hPvTddko24uvvZajbstMw9fLqBN2CxRu+sLmahxO2
	RF32CoDTqnCZxp54Wjk6fOx6+2AUxZFUVYr0ro35+Z5aatlwYFBmC65Z8RcznQ5t5rX1ARUHqdT
	U+JHf3PhoO9ZpxZxJiSHf9LBuHg==
X-Google-Smtp-Source: AGHT+IGSkDHv6GeugPAoixz1l5GZ3GqOy9QxCCNnwGqAo4ktmPEwMouS80JH5JREEEPqz8kcp8lVTmeuRcZuTcd/9IU=
X-Received: by 2002:a05:690c:fd4:b0:6e5:e6e8:d6b7 with SMTP id
 00721157ae682-6eaddd7958cmr35629217b3.1.1731074693415; Fri, 08 Nov 2024
 06:04:53 -0800 (PST)
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
In-Reply-To: <73eacca6-b6cd-4689-8ccd-f7e2e8b716f3@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 8 Nov 2024 08:04:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLyFV85w1kf397AcvZ7+Oewpe3vYeZdz_uvQrYwb1B8ag@mail.gmail.com>
Message-ID: <CAL_JsqLyFV85w1kf397AcvZ7+Oewpe3vYeZdz_uvQrYwb1B8ag@mail.gmail.com>
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells handling
To: Steven Price <steven.price@arm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Nov 8, 2024 at 7:26=E2=80=AFAM Steven Price <steven.price@arm.com> =
wrote:
>
> On 08/11/2024 11:04, Marek Szyprowski wrote:
> > Hi Rob,
> >
> > On 06.11.2024 18:10, Rob Herring (Arm) wrote:
> >> While OpenFirmware originally allowed walking parent nodes and default
> >> root values for #address-cells and #size-cells, FDT has long required
> >> explicit values. It's been a warning in dtc for the root node since th=
e
> >> beginning (2005) and for any parent node since 2007. Of course, not al=
l
> >> FDT uses dtc, but that should be the majority by far. The various
> >> extracted OF devicetrees I have dating back to the 1990s (various
> >> PowerMac, OLPC, PASemi Nemo) all have explicit root node properties. T=
he
> >> warning is disabled for Sparc as there are known systems relying on
> >> default root node values.
> >>
> >> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >> ---
> >> v2:
> >>   - Add a define for excluded platforms to help clarify the intent
> >>     is to have an exclude list and make adding platforms easier.
> >>   - Also warn when walking parent nodes.
> >> ---
> >>   drivers/of/base.c | 28 ++++++++++++++++++++++------
> >>   drivers/of/fdt.c  |  4 ++--
> >>   2 files changed, 24 insertions(+), 8 deletions(-)
> >
> > This patch landed in today's linux-next as commit 4b28a0dec185 ("of:
> > WARN on deprecated #address-cells/#size-cells handling"). In my tests I
> > found that it introduces warnings on almost all of my test systems. I
> > took a look at the first one I got in my logs (Samsung Exynos Rinato
> > board: arch/arm/boot/dts/samsung/exynos3250-rinato.dts):
>
> Just a "me too" for rk3288-firefly.dtb:
>
> [    0.138735] WARNING: CPU: 0 PID: 1 at drivers/of/base.c:106 of_bus_n_a=
ddr_cells+0x9c/0xd8
> [    0.138776] Missing '#address-cells' in /power-management@ff730000
>
> I'm sure it's easy to fix up the DTB, but we shouldn't be breaking long e=
xisting DTBs.

What broke?

The intent here is to exclude any platforms/arch which actually need
the deprecated behavior, not change DTBs. That's spelled out at the
WARN which I assume people would read before fixing "Missing
'#address-cells' in /power-management@ff730000". I tried to make the
warn message indicate that on v1 with:

WARN_ONCE(!IS_ENABLED(CONFIG_SPARC), "Only listed platforms should
rely on default '#address-cells'\n");

But Conor thought that wasn't clear. So I'm open to suggestions...

Rob

